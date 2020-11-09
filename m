Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27AE2AC704
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731423AbgKIVUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731448AbgKIVTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 16:19:36 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE64C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 13:19:36 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 10so952123wml.2
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 13:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f19bG5OlKZrzXa9sIoz5zZmJ+HLtlGgA3VlLSxdphFA=;
        b=aCa++B8skb7N4286tYGRf0uVCE5RA7rp82ko+LOn4nj7tYdW1Try+em3OvGh7LqyHJ
         MRu9QWNM2UQmP4ba30mnVaQj4DEhUYiDtJAvbyg6Z4WqzCMSMMBCywL5BuHEKRLTQ3Nt
         2X145Ci6pyLdMT7zFdh2R7fTC99dcrsXD0EYw9LuP3OsGdalYW3SAGUiCeNOmz/E9yEK
         mchlHxBojyQih21VMFDS9OpCNNLApP66gmN4r2PoS0bM6GwOpg6mRa2jMWrpl7BtEGXH
         FFXqxiP6DlTTZZGtyKGVzWqpe9Tq3bxgTloLVFtq3gA13n/n1cc5NsUa3HUiCib0YktV
         cJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f19bG5OlKZrzXa9sIoz5zZmJ+HLtlGgA3VlLSxdphFA=;
        b=apx92Dkh5LmLptx1hd3LM778GY3vnhoRRYNl5vbGOQ1bjA48qdQQteRj8iXLu+kuHc
         a5/kyAscnmpYwxUvCM4mWzSBDmqDo+avn7HVbs8yCKF0G/mJONCNm0Wo1PG7KA6ONxGb
         PfhwFPikOXp9vTgDr5M7xlWTy7zalTf3aMgJhFp6HmYvcyynD97gp+B1vLtU2PELboyF
         qZFPT9buCWPuQO68IDwXErWu/hZwegZbHqNZE0qw3sdRtgBQ28RWmyC/IZapBmm25kk4
         y6zKZ5JqMqkNrjRLp4O2cskD0YTI0cTOI9Df9imRGuxrmwQCdK8jlYxRJlT1b5LOUgu8
         OVgA==
X-Gm-Message-State: AOAM533MyTQocVsFdLXMLglKuabgh1aWX2BHb2m3x4vJmgQp8OlZ1mHT
        OsONnIroUGeAcmuAqSeV81n3hQ==
X-Google-Smtp-Source: ABdhPJwQU+oNyhuK8854ZDn2P3n7yVLK4Po3zrKf1ArE64AewxBRgP1hJdqCM5548erM822qPbeZIw==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr1138832wmp.187.1604956775281;
        Mon, 09 Nov 2020 13:19:35 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:19:34 -0800 (PST)
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
Subject: [PATCH 14/20] drm/radeon: Move 'radeon_pm_acpi_event_handler' prototype into shared header
Date:   Mon,  9 Nov 2020 21:18:49 +0000
Message-Id: <20201109211855.3340030-15-lee.jones@linaro.org>
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

 drivers/gpu/drm/radeon/rv770.c:1138:6: warning: no previous prototype for ‘rv770_set_clk_bypass_mode’ [-Wmissing-prototypes]
 1138 | void rv770_set_clk_bypass_mode(struct radeon_device *rdev)
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
 drivers/gpu/drm/radeon/radeon.h      | 1 +
 drivers/gpu/drm/radeon/radeon_acpi.c | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 32a2c894ee3ff..1cbbaff7cede2 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -291,6 +291,7 @@ void radeon_pm_fini(struct radeon_device *rdev);
 void radeon_pm_compute_clocks(struct radeon_device *rdev);
 void radeon_pm_suspend(struct radeon_device *rdev);
 void radeon_pm_resume(struct radeon_device *rdev);
+void radeon_pm_acpi_event_handler(struct radeon_device *rdev);
 void radeon_combios_get_power_modes(struct radeon_device *rdev);
 void radeon_atombios_get_power_modes(struct radeon_device *rdev);
 int radeon_atom_get_clock_dividers(struct radeon_device *rdev,
diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index 6cf1645e7a1a8..0eb594b56af8c 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -45,8 +45,6 @@ static inline bool radeon_atpx_dgpu_req_power_for_displays(void) { return false;
 
 #define ACPI_AC_CLASS           "ac_adapter"
 
-extern void radeon_pm_acpi_event_handler(struct radeon_device *rdev);
-
 struct atif_verify_interface {
 	u16 size;		/* structure size in bytes (includes size field) */
 	u16 version;		/* version */
-- 
2.25.1

