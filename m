Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8877C2B1C7D
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 14:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgKMNvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 08:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbgKMNuk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 08:50:40 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64BBC061A51
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:50:32 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r17so10021330wrw.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AFNrPQ81hqHHaageZvOMHIm1NdSavC7vYP+Jm2PmTBQ=;
        b=RQ4JxYXE11d9TyWCp2SMLBbDOIjUVovjqhMATP9WC+h2x9s9FvDe9rasQ6PW2pS+CX
         zLsjz9l2Cba9QeatwTFalD928dJP6Kqptw2OGDt9+JbpXHCWZQgfkxrsphmt2oxLRbX8
         Gc4C1tB5v7bFClbC4XagOq7bfZ4JFAXXcZ+mWVEvPoNpb9RJp/asE2wa5QaNl/J2fLjf
         7zCUcMOpcwVkbWLXCviGXnneB5qiP96b3LkmJsFK2KMk+tF/MLBp7LMdRqWoV1oCqpKs
         iZcvU793B2TQQsEww4DI7BRtU2uPq5G6mm9B8nsdJsy1tbB491pGDnUQCxwWVlxzUaYD
         ZHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AFNrPQ81hqHHaageZvOMHIm1NdSavC7vYP+Jm2PmTBQ=;
        b=dW7V0cYe+eC2fBpJFoFPPBlYLqUH2oClernWorWZg83wLdghD7Dk563ip2V2fClurP
         sxAms7JP/f8P5hno6kjRodF9zW4c730P+OgeTRvkYAbxQs0coep0wk+JXTr7sdbN65ph
         hPVYeF8IpoBHhZ8J5Sz9ZV3LzDgXr1FoveVBcmTDh5xqldEZ/wSYpFG03p2UdA1swKCx
         7JYih7QbiZ8zKzKi8Wnw+kg2fx5TdqH1rc1oqDVEQ4LdAL9HaT+0D1XYjt/q56asYtIb
         QG7cmgQtUfwUsID2diPIHfNr+vKtrn85KIqaZuukSes+ZmoQ2Y5rjYabOVk3iAEsJRKY
         noew==
X-Gm-Message-State: AOAM532sh6W0jZFrgT3ens0gWkJyvgvAQjI/39OI0Xv8xz7XY0pCh87Z
        EpjNI7vGVs2OwhtAh0x74oytwA==
X-Google-Smtp-Source: ABdhPJwmo0JOiYrV8oNZNta8viNMWx0NeoRzpJgQvzNkVIsfwOreueO0+qXeFjEfEcn4AjOf2VW3VA==
X-Received: by 2002:adf:df88:: with SMTP id z8mr3609403wrl.113.1605275431632;
        Fri, 13 Nov 2020 05:50:31 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:50:30 -0800 (PST)
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
Subject: [PATCH 40/40] drm/amd/amdgpu/gfx_v7_0: Remove unused struct definition
Date:   Fri, 13 Nov 2020 13:49:38 +0000
Message-Id: <20201113134938.4004947-41-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:5211:45: warning: ‘gfx_v7_0_ip_block’ defined but not used [-Wunused-const-variable=]

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
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 9 ---------
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index cb07bc21dcbe5..04e1e92f5f3cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -5208,15 +5208,6 @@ static void gfx_v7_0_get_cu_info(struct amdgpu_device *adev)
 	cu_info->lds_size = 64;
 }
 
-static const struct amdgpu_ip_block_version gfx_v7_0_ip_block =
-{
-	.type = AMD_IP_BLOCK_TYPE_GFX,
-	.major = 7,
-	.minor = 0,
-	.rev = 0,
-	.funcs = &gfx_v7_0_ip_funcs,
-};
-
 const struct amdgpu_ip_block_version gfx_v7_1_ip_block =
 {
 	.type = AMD_IP_BLOCK_TYPE_GFX,
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h
index 6fb9c1524691f..eedce7d007f1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h
@@ -24,7 +24,6 @@
 #ifndef __GFX_V7_0_H__
 #define __GFX_V7_0_H__
 
-extern const struct amdgpu_ip_block_version gfx_v7_0_ip_block;
 extern const struct amdgpu_ip_block_version gfx_v7_1_ip_block;
 extern const struct amdgpu_ip_block_version gfx_v7_2_ip_block;
 extern const struct amdgpu_ip_block_version gfx_v7_3_ip_block;
-- 
2.25.1

