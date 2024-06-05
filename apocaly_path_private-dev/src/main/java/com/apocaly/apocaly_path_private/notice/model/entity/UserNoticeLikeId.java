package com.apocaly.apocaly_path_private.notice.model.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.io.Serial;
import java.util.UUID;

@Getter
@Setter
@Embeddable
@AllArgsConstructor
@NoArgsConstructor
public class UserNoticeLikeId implements java.io.Serializable {
    @Serial
    private static final long serialVersionUID = 3591122493988909805L;
    @Size(max = 36)
    @Column(name = "user_id", length = 36,columnDefinition = "CHAR(36)")
    private UUID userId;

    @Size(max = 36)
    @Column(name = "notice_id", length = 36,columnDefinition = "CHAR(36)")
    private UUID noticeId;

    @Entity
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @Table(name = "notice_files")
    public static class NoticeFile {
        @Id
        @Column(columnDefinition = "CHAR(36)")
        private String id;

        @Column(name = "notice_id", columnDefinition = "CHAR(36)")
        private String noticeId;

        @Column(name = "file_id", columnDefinition = "CHAR(36)")
        private String fileId;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "notice_id", insertable = false, updatable = false)
        private NoticeBoard noticeBoard;
    }
}