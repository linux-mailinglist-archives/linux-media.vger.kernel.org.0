Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBC02B4D81
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387571AbgKPRiW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387509AbgKPRh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:37:57 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AAAC0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:57 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id j7so19635006wrp.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z5yx6D1LL1mWDIdbOcLaEDy3+e3cP8sILj2hqS9Zmtc=;
        b=L+oMJVXx9EMl4mh+bUkSyWc6ZsznYzTN9o/3eRri4X0NRlvMNWNqnxBqBkwgRByrAo
         S0YBk/0ZbUbEgQC33LIHX6VsvjaegjdE31kUMTrHVZbJAGoKJeY31+/chdLLZkmZhXyh
         IKrFDhsb/E3Mo7AcvEE05zKwMPDR2yHeiAFTAQmWXdEa7mlcKJ7fWIzJdrg/NHw4uCTR
         UirIeKolIisdhu4AO1Vgop6f8jxP5LHeQu6Wq57KGlZ9Ghl9UY6EIeeLQpRKhaoHdgZE
         7solyMQ6JcSANJehQQrpPE9xiw2u/hn5rmtbWnd02b0KPSibjLJQDvttOjd9bFF11BcI
         m8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z5yx6D1LL1mWDIdbOcLaEDy3+e3cP8sILj2hqS9Zmtc=;
        b=BIMkYEeuAYB0vDuPbALH5MyoAE977tIpCELAQOVvPmmFRJtoCOEua704BPc6CUcYmM
         RJheA3ZBERL9mJLR4dhzlcD+bY0FNZ2n+JD/phgZUx0eodl4DUbOMkV5Rgyv86wdeJqd
         aQrEFsCYyTmNA9OO+ue2dyYu+2t/2t8Cu6TXGsmO4Sxuoz59njYDiwIDoPrfjUR8ti3v
         frfKyc/CNYvKy8r74Q0NA4QKoebUFTA1fgbgNGxs89p9OjVfaacNT3tyW3W+pWiA7zjE
         fVohO1eH/pvjec+D74vTGDyVK6uANz7ilDlJAWIg03VgJcREQE0nvNSEhlthfqfauILy
         CxkA==
X-Gm-Message-State: AOAM531yuxMrwzretvnm/pNHfGl0anN6241SlfkiNLJhkJChCtUL8gtx
        Dlstzh/6VQqmWyWeN8upLHLbcw==
X-Google-Smtp-Source: ABdhPJyi2ReCriIud7MCXtXYkZHOGLof/ScXRjgAQdEXSy8wOpvAJaJLGydwXG32pJHwmlLOSJsjpA==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr20002425wrw.43.1605548275782;
        Mon, 16 Nov 2020 09:37:55 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:55 -0800 (PST)
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
Subject: [PATCH 38/43] drm/radeon/cik: Move 'Move 'cik_sdma_*()'s prototypes to shared header
Date:   Mon, 16 Nov 2020 17:36:55 +0000
Message-Id: <20201116173700.1830487-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
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
index cef0f3111cd3a..2af76463906ad 100644
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

