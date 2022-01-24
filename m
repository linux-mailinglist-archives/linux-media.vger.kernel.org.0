Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F311D498050
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 14:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242868AbiAXNDg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 08:03:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242858AbiAXNDf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 08:03:35 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED97C06173D
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:34 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id s18so13466075wrv.7
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r0nXcZqVGQ6Ta4bR5kQnQWxyJcyVFZB12g3PuPb0C9w=;
        b=nftL/d7gjyMEVVqsmMsHQvvAHZjqRoZ87F4j8U53Z9SJqdadiTw6wNOpuacpXloMF7
         mM2hanVVVbDCcS/uSnaRZJC019c85wYViQ5ztmnWHsRnb2Lrm6MfWE3TyXhQJMrs9yQA
         ZKTahxOYqEsb0xrlWhkYMrAkBgsIxGXaoLjDjl799P/xlWA+ajY8cPeTdXXGEIOw5AaR
         X27W5xQhEWV9lGeJBNMQEcn8sa8MF/c5UhuSC1xUxvBHFj6loLfGu6TxVEM4M3NuhYHe
         0koUaI1OB+aYjgH0cNn12jKctMsw42vABGE9K+KKvQzXfVpNjzvQvt6tAkoiyc3IOkOV
         kRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r0nXcZqVGQ6Ta4bR5kQnQWxyJcyVFZB12g3PuPb0C9w=;
        b=wTYyFqNAB0mrRSZ5SylqIVKaY84z3bGFXNyIbEj1Athdz8urIo+B66Hlgu+mR20nz7
         O1u9wh9T2i3MAs/0XieS/eOTCA1knE39N1zOYyo4/EuTC+6qq75tL4rW7MaM0XHQg02d
         0xMJ2l5COS72vrGWcNc+i0zIcMR+2Zh/HEH70wY4AH9VSKaZ36MEm2nFaSCV42mS8N6+
         O+Ma/+ilgYKBdZsIG2m7zDPIU6I4qB07Hqst4xAyRLLi6UD7iiEuWt66HFpv6HY4G6CO
         zjSAUBWt6AyY1CMfu87K9PjaILeK5obtQnGjGfhAMn4HiHqLOcC9LzIwIQbEfj0SaB22
         A9yg==
X-Gm-Message-State: AOAM533dxyjmE4fBlUP0POci3jtiJrYt/T6iaR61mW5cbwRwb8bUlrmh
        r77ys1lpeds/hnFrPYC2uyg=
X-Google-Smtp-Source: ABdhPJz2zt//EU8ROABvVL+unJmuxPgWOCUhgF7nNeJ9i10SZvbdXAJUV6qDThFd6rwZC53Myvv24Q==
X-Received: by 2002:adf:e806:: with SMTP id o6mr14903326wrm.331.1643029413522;
        Mon, 24 Jan 2022 05:03:33 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 05:03:33 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/11] drm/amdgpu: use ttm_resource_manager_debug
Date:   Mon, 24 Jan 2022 14:03:19 +0100
Message-Id: <20220124130328.2376-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of calling the debug operation directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index fb0d8bffdce2..eac2ff4647e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2076,7 +2076,7 @@ static int amdgpu_mm_vram_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2094,7 +2094,7 @@ static int amdgpu_mm_tt_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_TT);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2105,7 +2105,7 @@ static int amdgpu_mm_gds_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_GDS);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2116,7 +2116,7 @@ static int amdgpu_mm_gws_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_GWS);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2127,7 +2127,7 @@ static int amdgpu_mm_oa_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_OA);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
-- 
2.25.1

