package org.ict.loging_ex.security.repository;


import org.ict.loging_ex.security.model.entity.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface RefreshRepository extends JpaRepository<RefreshToken, UUID> {
    Optional<RefreshToken> findByTokenValue(String tokenValue);

    Boolean existsByTokenValue(String refresh);

    void deleteByTokenValue(String refresh);

    Optional<RefreshToken> findByUserId(UUID id);

}
