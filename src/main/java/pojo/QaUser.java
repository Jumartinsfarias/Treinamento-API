package pojo;
import lombok.*;

@Builder
@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class QaUser {

    private Integer id;
    private String login;
    private String full_name;
    private String email;
    private Integer age;
    private String created_at;
    private String updated_at;
}
