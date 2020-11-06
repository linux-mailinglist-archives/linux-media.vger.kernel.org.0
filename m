Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787512A9F6C
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 22:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgKFVuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 16:50:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728789AbgKFVuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 16:50:15 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1CCC0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 13:50:13 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id g12so2772472wrp.10
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 13:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XN+cgxXjY3IWekASuJPYqV0dOA81c47vUDG0BBQb6c0=;
        b=HCGvUbcx5ZEN2tfKGwHJicVvv+pm5x43BHYd0mWRsxxz1IOqVirgnGczw7oawgtQXB
         7UygpB7ndYtvwbAuuhuaC6Qb2sfQK60p1OUOxbmCjKhcxzjmmm4TTDd1LFZtaWUZIudH
         GCsTzPE/zuBUGTLoiaFz52M0clHGNBXnsdLFW2mOxaO0RaV/pUYsX07zEX7Z0XNI/n1q
         AgU2ChqZX7giA7oo56qtWu8HkTrMDdt2oxJk+AYpkaHiYP0Ns4cEFV9WglGGP6sGMmVL
         FmVkjlPKqeawp62wfvotAn2I65hfXYwautS3PIWf0NqQV4Ei7ry86OU7eRNamQLgA1q1
         3crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XN+cgxXjY3IWekASuJPYqV0dOA81c47vUDG0BBQb6c0=;
        b=M1W3FcTQRb4qBgJoYLV8jBcywpXghPXiAMmDm9B0iVkqbkEm9gRKtwXJL9dpNZiOTd
         Hh+Z9sSurenu/YiQw3dAl3Tsh9RTj04USNPQo2E32zkuFTibkGKQesx3XQWlQAddp2Ip
         IuA3C9m6TIHbvf4GaQ7wG+qqvpzLJwoltZO4rJEVOgfyX4O+NiuyF1COe//qZDb+C+Aa
         p50riLz2ufJi3A87VdNwPj1fwXKUYcI54+6Kb+OQruHrIm+sYgkpIo4/5ZyHfNMg73dw
         i7DrQKY7ujmAtLr0uVBWS45pNkYFkBFUXr4cfvM1MOt8DMLmYNLdc9FgR31NN3r0XvRN
         Tx9Q==
X-Gm-Message-State: AOAM533zpi9L/d4Iz3Yguv3imTednksD+VAcCL+ym0qDP+gCfKsiqzo8
        88LmmVsqlhFPVlTFek8SiS2M3Q==
X-Google-Smtp-Source: ABdhPJz9VXDl2U52UY4eXa5169UHGNjCTgPviCAyaRgtL3TzMxHGPQw76W+ApIl3BeVptCZSq2myUQ==
X-Received: by 2002:a5d:4001:: with SMTP id n1mr4927117wrp.426.1604699412401;
        Fri, 06 Nov 2020 13:50:12 -0800 (PST)
Received: from dell.default ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 13:50:11 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 15/19] drm/radeon: Move prototypes to shared header
Date:   Fri,  6 Nov 2020 21:49:45 +0000
Message-Id: <20201106214949.2042120-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/radeon_kms.c:756:5: warning: no previous prototype for ‘radeon_get_vblank_counter_kms’ [-Wmissing-prototypes]
 756 | u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc)
 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 drivers/gpu/drm/radeon/radeon_kms.c:826:5: warning: no previous prototype for ‘radeon_enable_vblank_kms’ [-Wmissing-prototypes]
 826 | int radeon_enable_vblank_kms(struct drm_crtc *crtc)
 | ^~~~~~~~~~~~~~~~~~~~~~~~
 drivers/gpu/drm/radeon/radeon_kms.c:853:6: warning: no previous prototype for ‘radeon_disable_vblank_kms’ [-Wmissing-prototypes]
 853 | void radeon_disable_vblank_kms(struct drm_crtc *crtc)
 | ^~~~~~~~~~~~~~~~~~~~~~~~~

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/radeon/radeon.h         | 6 ++++++
 drivers/gpu/drm/radeon/radeon_display.c | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index e1132d86d2507..961a31b8805c2 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2832,6 +2832,12 @@ extern void radeon_program_register_sequence(struct radeon_device *rdev,
 					     const u32 array_size);
 struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev);
 
+/* KMS */
+
+u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
+int radeon_enable_vblank_kms(struct drm_crtc *crtc);
+void radeon_disable_vblank_kms(struct drm_crtc *crtc);
+
 /*
  * vm
  */
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index b79686cf8bdbd..bd60f16fd0d78 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -45,10 +45,6 @@
 #include "atom.h"
 #include "radeon.h"
 
-u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
-int radeon_enable_vblank_kms(struct drm_crtc *crtc);
-void radeon_disable_vblank_kms(struct drm_crtc *crtc);
-
 static void avivo_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-- 
2.25.1

