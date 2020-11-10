Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCF82ADF7E
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 20:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732087AbgKJTcE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 14:32:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732061AbgKJTb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 14:31:56 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F6DC0613D4
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:55 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id p19so2661678wmg.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Me2C0KZPH8VVua1aycMKe0StyKdd9QKRuKEwSNFVjFo=;
        b=nTwoPrX6vuGNHl6Q2QFUtIJJUETL3YT/ibQEqi03DwoHI3Jb3qNL1+rC6N6F227qfA
         AAjLx6l1Unylhegw/zO6dKNCg0g0VQkyLmpzD2Drmbd+dduOPXgbpr4SsNuK1Dpymnf0
         6IXOaaFnLvzELYzrQbne5S8feaaezD9OPBaqp+zu8+sgm+4IukuAolD4bzogzTTLEoR1
         UIfUZz0B1u4LtaE1KJXWJI94I24wSVt+Q4R2+wR/UMFmogW99umXOz48/L4DNiZbCs3x
         BQl9hGwGCFY1JlJA4SqjSk3nvN16aKcNZfCNUd/bX1e/f2LnFDZPXKIGyDMJTv7oLT7H
         dM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Me2C0KZPH8VVua1aycMKe0StyKdd9QKRuKEwSNFVjFo=;
        b=B5exTlsh3X1miM4O3z1BYPjDIoMEf9DMg26AxJEnKhtJe1BzZnDEWXVj3riW8f6Dcs
         P5u7Wqa5Az/1YAClyqklOnw+TTM2fcuVISAmGuTs0+PQzFsgVNk7MhoBLFl84CLghhr5
         KdFs+HH2KDXyxYSYSz6jK1sn5nwwtmVvURdVzzWm8tuavw6DH3a02LfMtHkA+1QG2NHg
         9iubkNcuDGkA8Ppv20uRkxRlki1Y/URVzjOn+RNC5hI5u5vCxLRxhJcQ39e3pEos6xLq
         0+iaZ2qKto2jM+8RfrL9HDsAtgZ/wkqyrxdYwv23dZCp5VQIlCLjHJ+2nOeZgFU0QYdY
         EyDQ==
X-Gm-Message-State: AOAM532W7iMfGQ07FYmBDB7TDIWSYkprypnevJie6iwT9xOXWoYYM4oM
        KJ1+sEiJOeHOCSBSZlx8pSJQf7Z2h+HCpTGv
X-Google-Smtp-Source: ABdhPJyIhjhZHDx3yHDStyO+VZdQLdjivEtz8y/Yum+kIEQaSUJDwOe3Ez/SXV3itj6CcyX522etpg==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr752634wml.98.1605036713925;
        Tue, 10 Nov 2020 11:31:53 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:31:53 -0800 (PST)
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
Subject: [PATCH 30/30] drm/radeon/cik: Move 'r600_ih_ring_{alloc,fini}()'s prototypes to shared header
Date:   Tue, 10 Nov 2020 19:31:12 +0000
Message-Id: <20201110193112.988999-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/r600.c:3480:5: warning: no previous prototype for ‘r600_ih_ring_alloc’ [-Wmissing-prototypes]
 3480 | int r600_ih_ring_alloc(struct radeon_device *rdev)
 | ^~~~~~~~~~~~~~~~~~
 drivers/gpu/drm/radeon/r600.c:3516:6: warning: no previous prototype for ‘r600_ih_ring_fini’ [-Wmissing-prototypes]
 3516 | void r600_ih_ring_fini(struct radeon_device *rdev)
 | ^~~~~~~~~~~~~~~~~

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
 drivers/gpu/drm/radeon/cik.c  | 3 +--
 drivers/gpu/drm/radeon/r600.h | 2 ++
 drivers/gpu/drm/radeon/si.c   | 3 +--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index b94e2e678f255..a71645693cbdb 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -33,6 +33,7 @@
 #include "cik_blit_shaders.h"
 #include "cikd.h"
 #include "clearstate_ci.h"
+#include "r600.h"
 #include "radeon.h"
 #include "radeon_asic.h"
 #include "radeon_audio.h"
@@ -124,8 +125,6 @@ MODULE_FIRMWARE("radeon/mullins_mec.bin");
 MODULE_FIRMWARE("radeon/mullins_rlc.bin");
 MODULE_FIRMWARE("radeon/mullins_sdma.bin");
 
-extern int r600_ih_ring_alloc(struct radeon_device *rdev);
-extern void r600_ih_ring_fini(struct radeon_device *rdev);
 extern void evergreen_mc_stop(struct radeon_device *rdev, struct evergreen_mc_save *save);
 extern void evergreen_mc_resume(struct radeon_device *rdev, struct evergreen_mc_save *save);
 extern bool evergreen_is_display_hung(struct radeon_device *rdev);
diff --git a/drivers/gpu/drm/radeon/r600.h b/drivers/gpu/drm/radeon/r600.h
index 1bf2d0572f047..73004ffb98124 100644
--- a/drivers/gpu/drm/radeon/r600.h
+++ b/drivers/gpu/drm/radeon/r600.h
@@ -29,5 +29,7 @@
 #define __R600_H__
 
 u32 r600_gpu_check_soft_reset(struct radeon_device *rdev);
+int r600_ih_ring_alloc(struct radeon_device *rdev);
+void r600_ih_ring_fini(struct radeon_device *rdev);
 
 #endif				/* __R600_H__ */
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 45076c27d7ded..d0407145c07b5 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -33,6 +33,7 @@
 #include "atom.h"
 #include "clearstate_si.h"
 #include "evergreen.h"
+#include "r600.h"
 #include "radeon.h"
 #include "radeon_asic.h"
 #include "radeon_audio.h"
@@ -128,8 +129,6 @@ static void si_pcie_gen3_enable(struct radeon_device *rdev);
 static void si_program_aspm(struct radeon_device *rdev);
 extern void sumo_rlc_fini(struct radeon_device *rdev);
 extern int sumo_rlc_init(struct radeon_device *rdev);
-extern int r600_ih_ring_alloc(struct radeon_device *rdev);
-extern void r600_ih_ring_fini(struct radeon_device *rdev);
 static void si_enable_gui_idle_interrupt(struct radeon_device *rdev,
 					 bool enable);
 static void si_init_pg(struct radeon_device *rdev);
-- 
2.25.1

