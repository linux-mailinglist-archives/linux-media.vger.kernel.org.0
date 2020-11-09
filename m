Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED2E2AC707
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731059AbgKIVUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731002AbgKIVTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 16:19:17 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2A7C0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 13:19:16 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h62so911156wme.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 13:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RmvaQQVqTzYJ/ca4PPIPDIzgTk17HpnAY5XhUH8w95U=;
        b=yRHbohXsw2QICXZKtP8ovBwjdAKlIxFQQZ0rhdvBYM4oJ5nxL/ORcz5DZJWVVZZIzN
         2/DChFnHuAKzp22e7kROw5JKDyNwVhDN23V5qieSGG16WDx6KvMRGkdsZEMniuIP7nk+
         Sb5HW0mH6htetyMcaUGgJnVqniObdZbyJiW3Ik/WG7Q/LVqaY071vIQevKfeYPRrQda/
         h/2lcchdzqK1tzNe6NjIVVe1ICyMPAqusXyXJ/4pAYjNaiAky3LshKFGFmX1HHh2LkZ2
         PSdzhquhWWOMtxj8kR90KE+YOqjwEr684dSRLXPld+Zdv6uH1lJGbb/qRzXwlwPBMggC
         ylAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RmvaQQVqTzYJ/ca4PPIPDIzgTk17HpnAY5XhUH8w95U=;
        b=J3ewJA3SoYacr3KLFv0DLSAYVK3gK05UL5LKQyxV9U3z6d6uLu3ZSTxgoBaeVQualU
         t2E0Gr5YjxAO/2VRSMSe8DlUk+cPcWi9/qDxhSz3uBgXCEWKkzlSyv4nEMYidkFLaFKS
         TOVVKqNAET1MLuZ7ePs4ZsfCgG4G3nfNXg6W62MRb/ITYjEFbyFg6fI8beHE9c/DpSUN
         hhuQvSv2H+0PMx2gh2EGtBvASByGFAWsLzkiuaDhZOnDEkeTTOW9fcq/cOrRUdOB9XkG
         VnHF2MBgBwP6+556IJ6y/2pdfDlPWbE0xJulqpvN3CIQx9oGhStwfAoDMu3q4xGrelum
         jkFg==
X-Gm-Message-State: AOAM531zgIuVhYddzaDwCH8C/uJCoXsDAI67mQ3pVJDbUvY0Lx3EYcQu
        4Rk2LI24rkkvB3cg5e6uk73y+w==
X-Google-Smtp-Source: ABdhPJzpfrNh8azt6gGZ2jBaYLTeFKuZIomUyo4hzEGhYn1lqz7J9cTLXl66eW+SQsjVcl1+o9I3Jw==
X-Received: by 2002:a1c:9e12:: with SMTP id h18mr1132707wme.11.1604956755622;
        Mon, 09 Nov 2020 13:19:15 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:19:14 -0800 (PST)
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
Subject: [PATCH 05/20] drm/radeon: Move 'radeon_add_legacy_encoder's prototype to shared location
Date:   Mon,  9 Nov 2020 21:18:40 +0000
Message-Id: <20201109211855.3340030-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

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
 drivers/gpu/drm/radeon/radeon.h          | 2 ++
 drivers/gpu/drm/radeon/radeon_atombios.c | 5 -----
 drivers/gpu/drm/radeon/radeon_combios.c  | 5 -----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 0cc8f081e113a..421f6b26512ed 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2819,6 +2819,8 @@ extern int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data);
 extern void radeon_legacy_set_clock_gating(struct radeon_device *rdev, int enable);
 extern void radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
 					 struct drm_connector *drm_connector);
+extern void radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum,
+				      uint32_t supported_device);
 extern void radeon_atom_set_clock_gating(struct radeon_device *rdev, int enable);
 extern void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain);
 extern bool radeon_ttm_bo_is_radeon_bo(struct ttm_buffer_object *bo);
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 5d25917251892..557960e3b204f 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -39,11 +39,6 @@ extern void
 radeon_add_atom_encoder(struct drm_device *dev, uint32_t encoder_enum,
 			uint32_t supported_device, u16 caps);
 
-/* from radeon_legacy_encoder.c */
-extern void
-radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum,
-			  uint32_t supported_device);
-
 union atom_supported_devices {
 	struct _ATOM_SUPPORTED_DEVICES_INFO info;
 	struct _ATOM_SUPPORTED_DEVICES_INFO_2 info_2;
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index d3c04df7e75d7..b8cd37d76d8bf 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -40,11 +40,6 @@
 #include <asm/prom.h>
 #endif /* CONFIG_PPC_PMAC */
 
-/* from radeon_legacy_encoder.c */
-extern void
-radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum,
-			  uint32_t supported_device);
-
 /* old legacy ATI BIOS routines */
 
 /* COMBIOS table offsets */
-- 
2.25.1

