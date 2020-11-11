Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6584A2AF835
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 19:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgKKSgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 13:36:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbgKKSgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 13:36:13 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18FEC061A04
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 10:36:12 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id c9so3149405wml.5
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 10:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=spCm618rU4+U7z1bfdflo8X7NldT43iivpTuZ8WssFA=;
        b=w++rpOszkxweKlNZMXoxmKyy4U42RAzQDXbaasLv0JL6Mz+/P2AanrfR3DqMvCG6c1
         6NYHQlNcK1yEneyt/TJesz+g5TEv6/JyNC/pI3IvwLglHc9XS5o1OSu4jFsJARQenUoq
         hlVMNdPMbEo/yCbB22dgrmPaYhbTe2sXVLiN4WH6c5/eTSKDSUwbrSpxpm/b/wxKo2l2
         t6DEf/qObRqR0J5jb0GnJuV/3qiaKr3eUdjqwz8Y+DVyVz74dyN7lvLkK94HeFmurkGG
         X2mFN8tNmqv4Ps0arCz3R/jDCYaUObb4KFZDRR/s3vPci46Mdn1FuljOWkDgCvy892l5
         Hg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=spCm618rU4+U7z1bfdflo8X7NldT43iivpTuZ8WssFA=;
        b=UpAmUJfmnWlhnmDcjIY1Jp3KlSgeBP4xGDa02i0wFwXb5xhSa3t3Htfh3ETJ4ncIpl
         GWo4DLTs7NDrBKMchZKiHhDjQZ7TM+jHy3PiJY1hkR34socc0XmDju1BODFto7tPJ5mE
         A9XQV9tOpHlIp3QZcFGVN6KdUww6BtmzO/vshQC6wLuS0sLZ01tPKYx2QsSzjqsBJLve
         2upMmcotknfre4R8MazjVruat5F90jtm2+ot6Or6l1nefs5OoD2w7g/OnLCzfMFC2cgg
         qvm6eMD6H6/2hURlIhnAlCdmUwDDxvj1w7QeEsazx1GtYf0vWmGUOU0jce85Eu3gBshW
         cagQ==
X-Gm-Message-State: AOAM5317q7vblR/cGFLfeYTDuYJkqWg2VgIvfWMFItxXgWqKTKiW4BBl
        HMZ8aQKEaNAxeRS+cqK0Ojxa8w==
X-Google-Smtp-Source: ABdhPJwiXiLRxkllwzQfnctFOzMf0dtjCV4IwfvBUqJ+unZBgE6lrxNBj3LWkUavdfnVECn/mYqEvg==
X-Received: by 2002:a1c:4808:: with SMTP id v8mr5734129wma.110.1605119771722;
        Wed, 11 Nov 2020 10:36:11 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 10:36:11 -0800 (PST)
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
Subject: [PATCH 16/19] drm/radeon/cik: Move 'Move 'cik_sdma_*()'s prototypes to shared header
Date:   Wed, 11 Nov 2020 18:35:42 +0000
Message-Id: <20201111183545.1756994-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/cik_sdma.c:331:6: warning: no previous prototype for ‘cik_sdma_enable’ [-Wmissing-prototypes]
 331 | void cik_sdma_enable(struct radeon_device *rdev, bool enable)
 | ^~~~~~~~~~~~~~~
 drivers/gpu/drm/radeon/cik_sdma.c:528:5: warning: no previous prototype for ‘cik_sdma_resume’ [-Wmissing-prototypes]
 528 | int cik_sdma_resume(struct radeon_device *rdev)
 | ^~~~~~~~~~~~~~~
 drivers/gpu/drm/radeon/cik_sdma.c:557:6: warning: no previous prototype for ‘cik_sdma_fini’ [-Wmissing-prototypes]
 557 | void cik_sdma_fini(struct radeon_device *rdev)
 | ^~~~~~~~~~~~~

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
 drivers/gpu/drm/radeon/cik.c | 3 ---
 drivers/gpu/drm/radeon/cik.h | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 0330ee86a372b..4520ec4c7b2e2 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -129,9 +129,6 @@ MODULE_FIRMWARE("radeon/mullins_rlc.bin");
 MODULE_FIRMWARE("radeon/mullins_sdma.bin");
 
 static u32 cik_get_cu_active_bitmap(struct radeon_device *rdev, u32 se, u32 sh);
-extern int cik_sdma_resume(struct radeon_device *rdev);
-extern void cik_sdma_enable(struct radeon_device *rdev, bool enable);
-extern void cik_sdma_fini(struct radeon_device *rdev);
 extern void vce_v2_0_enable_mgcg(struct radeon_device *rdev, bool enable);
 static void cik_rlc_stop(struct radeon_device *rdev);
 static void cik_pcie_gen3_enable(struct radeon_device *rdev);
diff --git a/drivers/gpu/drm/radeon/cik.h b/drivers/gpu/drm/radeon/cik.h
index 420207d19de52..d1bf541da5923 100644
--- a/drivers/gpu/drm/radeon/cik.h
+++ b/drivers/gpu/drm/radeon/cik.h
@@ -34,4 +34,7 @@ void cik_init_cp_pg_table(struct radeon_device *rdev);
 u32 cik_get_csb_size(struct radeon_device *rdev);
 void cik_get_csb_buffer(struct radeon_device *rdev, volatile u32 *buffer);
 
+int cik_sdma_resume(struct radeon_device *rdev);
+void cik_sdma_enable(struct radeon_device *rdev, bool enable);
+void cik_sdma_fini(struct radeon_device *rdev);
 #endif                         /* __CIK_H__ */
-- 
2.25.1

