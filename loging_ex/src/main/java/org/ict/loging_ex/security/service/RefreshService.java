package org.ict.loging_ex.security.service;


import jakarta.transaction.Transactional;
import org.ict.loging_ex.security.model.entity.RefreshToken;
import org.ict.loging_ex.security.repository.RefreshRepository;
import org.springframework.stereotype.Service;


import java.util.Optional;
import java.util.UUID;

@Service
@Transactional
public class RefreshService {
    private final RefreshRepository refreshRepository;

    public RefreshService(RefreshRepository refreshRepository) {
        this.refreshRepository = refreshRepository;
    }

    public void save(RefreshToken refreshToken) {
        refreshRepository.save(refreshToken);
    }

    public Optional<RefreshToken> findByTokenValue(String token) {
        return refreshRepository.findByTokenValue(token);
    }

    public Boolean existsByRefresh(String tokenValue) {
        return refreshRepository.existsByTokenValue(tokenValue);
    }

    public void deleteByRefresh(String tokenValue) {
        refreshRepository.deleteByTokenValue(tokenValue);
    }

    public Optional<RefreshToken> findByUserId(UUID id) {
        return refreshRepository.findByUserId(id);
    }
}
