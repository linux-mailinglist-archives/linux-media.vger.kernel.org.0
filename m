Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5141443E216
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 15:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhJ1N3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 09:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbhJ1N3G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 09:29:06 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B168C061570
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:26:39 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id j35-20020a05600c1c2300b0032caeca81b7so4700802wms.0
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=egdx3Ywv2yu3nUP1jLQlD5jYdd3fqDZiwOa9q8R+o2s=;
        b=aBAcGSAr9R1pFZVRu12YsAne8HtbedhP5B06ewdompnZQhByafZ2d1TS2FhMhrLDcI
         Xzix+FUdCnaZHli5XiOxJNDB1GHEysLC1/7tPKk40hEVCL+B50nu0M5j00AjRUAOeeWJ
         x4AQyn/SYuxks0V+yxbjkmtAoJI3zeF80qprDcTdLjOWJ0hGy1qKl6cHfR6D8HeZxWV0
         h1L0UpqPWY3u9ZeMuwFZDmG+cjlnWJXfIibGH/i8YARbC9Sv40BgtNzN2BVrNRVi3eDJ
         8cpXNMG64KJ9qr5wcIzC+Nwdy3mgBchGONRgZfs9rYZ1j2GuPX7TAz+X6G1jmj6DDOrh
         ktTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=egdx3Ywv2yu3nUP1jLQlD5jYdd3fqDZiwOa9q8R+o2s=;
        b=vegGtU8V9k3VtBC3jckk9ilrUUql6MWjboKiCH9Do2YfLVdLRXCWQ/VeXP77deigAq
         XYrOKOHIOuflNzC8OrSLjzJB7k88YpKnG23RuqBw4MDDrOjQzXjboCqC6tShAn0BxFJG
         yo3azp46aKU//Cwpj1hHM6uD1Z+gN1RX0v978fkBlPF5Btq+QpyCRN2fZjpKD+5TG7HK
         XIDxdqGFit+QjpQvgnIh3CGG6KmMN4uMcpOEQfoFIfrhB1OsgVqjA/g99hDV7+kMiBq7
         2MGc+Q2Q4CQnHwr/oL8qLMPdrHwfzdjd06lM3VU6TeUjrDulbVPY6PfFCPsgn/tOFXsI
         H5Rg==
X-Gm-Message-State: AOAM531YPxrF3llN6aCih6CNjgJ6KIt5jcxKC8m3VHwaVMqy7L0tz6Je
        /v55KdB4NYFzbPOOxbhPCEi4GMsvks0=
X-Google-Smtp-Source: ABdhPJzSb2AGqZ2hHQoqdIbV2oph49YUFYUmPMj8+frHGtYAnsyRaMDsJ0wp80qNzpOY2XZ0GZcqXw==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr4649970wmj.120.1635427597621;
        Thu, 28 Oct 2021 06:26:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l11sm2935695wrt.49.2021.10.28.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 06:26:37 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/radeon: use dma_resv_wait_timeout() instead of manually waiting
Date:   Thu, 28 Oct 2021 15:26:30 +0200
Message-Id: <20211028132630.2330-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028132630.2330-1-christian.koenig@amd.com>
References: <20211028132630.2330-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't touch the exclusive fence manually here, but rather use the
general dma_resv function. We did that for better hw reset handling but
this doesn't necessary work correctly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_uvd.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 2ea86919d953..377f9cdb5b53 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -469,7 +469,6 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 {
 	int32_t *msg, msg_type, handle;
 	unsigned img_size = 0;
-	struct dma_fence *f;
 	void *ptr;
 
 	int i, r;
@@ -479,13 +478,11 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 		return -EINVAL;
 	}
 
-	f = dma_resv_excl_fence(bo->tbo.base.resv);
-	if (f) {
-		r = radeon_fence_wait((struct radeon_fence *)f, false);
-		if (r) {
-			DRM_ERROR("Failed waiting for UVD message (%d)!\n", r);
-			return r;
-		}
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, false, false,
+				  MAX_SCHEDULE_TIMEOUT);
+	if (r <= 0) {
+		DRM_ERROR("Failed waiting for UVD message (%d)!\n", r);
+		return r ? r : -ETIME;
 	}
 
 	r = radeon_bo_kmap(bo, &ptr);
-- 
2.25.1

