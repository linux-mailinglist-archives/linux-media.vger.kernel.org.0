Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963A42AC6E9
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730976AbgKIVTQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730887AbgKIVTM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 16:19:12 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919C8C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 13:19:12 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id c17so10371495wrc.11
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 13:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A+pA8ZHZ/BWRZ/+5idjB7jAn1iVLFLVHhzg6ecfAKK0=;
        b=rnIwaAtcMH8I2ZxIUoGWsSl6kKjHPDJJrShyAVuGGXNBBDSIsump85D8GU4POVebMN
         E1L8xTS69PO2A8bD7eNCLX1g2XSl+7BuiBQOD/qhy+xQod6/Q8/Ef7akcS/Jtzzrm61R
         9c2sGZxrqEZ1+XxS7jIAj6abpTvKU9oCNdXo4u6GnbxzmQkOQFukaOTpLHoBacS7XwuP
         GQvsqcIDdgOqdqoj4ibSXlHmHb3CgUGENsNWH845TfYVrbh1zjrnx39FoMVR7dC0FQS+
         L3SNZRoVvGLdM5finrmbU6TJiCv4M9wW5PsZ2yDhmovVUU9POtXHWjZWnrXwCkw+MhSp
         16Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A+pA8ZHZ/BWRZ/+5idjB7jAn1iVLFLVHhzg6ecfAKK0=;
        b=joJUmO6XbzIFO8k/Wc0XDjZGhsv8rzgwMRrOq//q0fX7IIqmuaMEQzG0VPeVbEpRJC
         G4nzYo3+w0NqoWv+CNtgUn0LukgN63DwANrsCZDbkoM+KeQuX+to+1GDNdXiDKZQde/O
         ZE8KBtgYLg6IgdxAlGfzYdyn+o64QKbRiwvDsOpcpEszAUKZZnbjlP0i+yDCb9mxQ4xo
         XD4vUpRc6d8dIX5tqPfX11NR7ChOw6LXN6wG7TLcdHQ5EnifCwwxcAn3ePi9w9XaheKo
         wqNqRNuQAGGnMS6wBClhef4L9UtBwsooEi7fadKizEOTWhx3tGaMtjK8iBoo5X4h+MwE
         si/g==
X-Gm-Message-State: AOAM530qW4KjYoeUTQPlaQ7U8INuVe2yX/Q75mrYCBdOQtXB4wYad1zy
        7wMlN6LDFCchFbO2nqNPfXxtWg==
X-Google-Smtp-Source: ABdhPJyVLaYOP1nCrPZ+uOSyurYo3tOkqxKMbnUwj1C/Ynr5/ZZEq6yFW8JJHxW2WWj6RHgTRiD5Cg==
X-Received: by 2002:adf:93e5:: with SMTP id 92mr20405072wrp.421.1604956751344;
        Mon, 09 Nov 2020 13:19:11 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:19:10 -0800 (PST)
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
Subject: [PATCH 04/20] drm/radeon: Move 'radeon_add_legacy_encoder' prototype to shared header
Date:   Mon,  9 Nov 2020 21:18:39 +0000
Message-Id: <20201109211855.3340030-5-lee.jones@linaro.org>
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

  drivers/gpu/drm/radeon/radeon_legacy_encoders.c:1745:1: warning: no previous prototype for ‘radeon_add_legacy_encoder’ [-Wmissing-prototypes]
 1745 | radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum, uint32_t supported_device)
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
 drivers/gpu/drm/radeon/radeon.h          | 2 ++
 drivers/gpu/drm/radeon/radeon_encoders.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index a0c2497cd4cf4..0cc8f081e113a 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2817,6 +2817,8 @@ extern void radeon_wb_disable(struct radeon_device *rdev);
 extern void radeon_surface_init(struct radeon_device *rdev);
 extern int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data);
 extern void radeon_legacy_set_clock_gating(struct radeon_device *rdev, int enable);
+extern void radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
+					 struct drm_connector *drm_connector);
 extern void radeon_atom_set_clock_gating(struct radeon_device *rdev, int enable);
 extern void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain);
 extern bool radeon_ttm_bo_is_radeon_bo(struct ttm_buffer_object *bo);
diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index ced022fae19d7..3e342fd812ff4 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -33,9 +33,6 @@
 #include "radeon.h"
 #include "atom.h"
 
-extern void
-radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
-			     struct drm_connector *drm_connector);
 extern void
 radeon_atom_backlight_init(struct radeon_encoder *radeon_encoder,
 			   struct drm_connector *drm_connector);
-- 
2.25.1

