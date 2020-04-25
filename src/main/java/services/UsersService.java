package services;

import core.AllureTypeFile;
import core.Spec;
import core.TestingType;
import response.pojo.users.Users;
import com.google.gson.Gson;
import io.qameta.allure.Allure;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

import java.util.Map;

import static io.restassured.RestAssured.given;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.MatcherAssert.assertThat;


public class UsersService implements TestingType{

    /**
     * Retorna lista de usuários
     *
     * @param data
     * @return
     */
    public Response getUsers(Map data){
        String URI = "/users/";
        RequestSpecification httpRequest = given().spec(Spec.spec);
        Response response = httpRequest.get(URI+data.get("usuario_id"));
        Allure.addAttachment(AllureTypeFile.REQUEST,URI);
        return response;
    }

    @Override
    public boolean healthCheck(Response response){
        Allure.addAttachment(AllureTypeFile.RESPONSE_HEADERS,response.getHeaders().toString());
        Allure.addAttachment(AllureTypeFile.RESPONSE_BODY,response.getBody().prettyPrint());
        return response.getStatusCode() == 200;
    }

    @Override
    public boolean verifyBody(Response response){
        Gson gson = new Gson();
        Users users = gson.fromJson(response.jsonPath().prettyPrint(), Users.class);
        assertThat(users.getEmail()).isNotNull().isNotEmpty();
        assertThat(users.getName()).isEqualTo("Leanne Graham");
        assertThat(users.getId()).isGreaterThanOrEqualTo(1);
        return true;
    }

    @Override
    public boolean verifySchema(Response response){
        assertThat(response.getBody().prettyPrint(),matchesJsonSchemaInClasspath("schemas/users/users-schema.json"));
        return true;
    }
}
