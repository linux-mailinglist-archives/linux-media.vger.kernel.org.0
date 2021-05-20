Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0504538AECB
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242798AbhETMpS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242927AbhETMoc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:44:32 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E223C069146
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:41 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so5281565wmk.1
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jO7V0H98Qg2tMCIwDj4FeeKzGM5dSknTEV1LYii8u8w=;
        b=W4x0Pew/IdeVOzVWOMkZldd12omXYquCVkPlxohuHIUCvZ/BWTepLzjBlhhiblpmG0
         gUJwuwhnYvyv3Q3h88pNwzZmHXBXelFCn6KJjQLnX6ztOSiKbeLA8UQ59wDQB2zY9GaL
         QLs6gEfartIy6XZI2vtzV58nNt4DztnsXEvnC40J/30hlNC2OMHkkZA3dq9TFiT/N9Mf
         dd0Bp1pJrdlAv+FGpU8Ls1aO0UGpHh4ZR66obyMP/QvI82ONSDznjEddDWl0rdVuXqLV
         C58IkWCeCV0wiruzMSD8MyGAIL0W379+i/+Dm5F23398Yl+LZOo+S2CYDUorHkHYMCty
         sF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jO7V0H98Qg2tMCIwDj4FeeKzGM5dSknTEV1LYii8u8w=;
        b=B4X9m95Lekh4Hx2naNuPo2bLrerQWfJlVsWZYm2J+A+MBzVrpGOY9soiMa751lbIWn
         cAuL3GjHrywa4atSPJa8d2WGZdpZrj8151eyEgeJEPiXzb5eYpO26RaGUk7s/Z1+FBYM
         u6WzK9an3LnW8+bUIheB4juN6R8Uxjn36FdQm3Ss4tgbFrkVn9EI7123hFJChUaMm6WT
         ziML/rJpeYwzZwiqUIylDaI42kiDFxQOMNgcTwlyMc3i7N2mPPsPyfOt1uiGqCC+bxbM
         CQcj88avPLWB2UlUf1fW1mUoLzxzk9RTFbooP4MgdFr+pLb8eLIS+bd0JIPiyAnN6MRm
         5Zeg==
X-Gm-Message-State: AOAM530pGTC5UBq+e2aIvdKVkl2P9y3fet5q0axHvoaOxW2PxUJrghCL
        RsCKm9gvd8RjnHfhnXhP+HZe1g==
X-Google-Smtp-Source: ABdhPJyV3+TJPHVMnYSdJETlXphndM0hvCrXSlYbuhpUFkSBWFHcg1oC7Whm3urACs0DpxdCMukdUQ==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr3238405wmb.141.1621512220189;
        Thu, 20 May 2021 05:03:40 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:39 -0700 (PDT)
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
Subject: [PATCH 37/38] drm/amd/amdgpu/gfx_v10_0: Demote kernel-doc abuse
Date:   Thu, 20 May 2021 13:02:47 +0100
Message-Id: <20210520120248.3464013-38-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:51: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

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
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index fc12e3c3e9cae..c833be31e4ae6 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -47,7 +47,7 @@
 #include "gfx_v10_0.h"
 #include "nbio_v2_3.h"
 
-/**
+/*
  * Navi10 has two graphic rings to share each graphic pipe.
  * 1. Primary ring
  * 2. Async ring
-- 
2.31.1

