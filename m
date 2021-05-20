Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869E938AEC8
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242710AbhETMpE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242878AbhETMo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:44:27 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28190C0564B1
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:39 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id a4so17425369wrr.2
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tJTJtfpMV/J/H+YFu2v39vUwU64txzJ+siPwQcxgUUI=;
        b=mDFB9RE1bc0Vqz3kk4DPBdJ9UZ/aMsd+rUlwA7frOrSPKA4J5EOky+7+ysl+VIeslx
         VnuHUou9Hz0olWToCaUysglK/ryHBbFYTG1zdzpfEsRKX2oKSczKuKDc2NZI/0vROlwG
         nFEFSbfmg6XBybX7YhaVP+Tr/LE1gctAgIP1HLMc0JcMywAitb0spISUg8E4IOPhaaJJ
         Kqq4h1v8Gm03ZOYI1kvz7TzyM67/zNMNzWIRm1646/gx9rl1Tvfm9CQGE6wVv488bsYO
         r6S8oUrYDtO3fYI5BS7HPcNxS2VKfxQLPJABQ3qYCqjXM6uEPjbehPB4X9i5wQ+XUa3x
         o/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tJTJtfpMV/J/H+YFu2v39vUwU64txzJ+siPwQcxgUUI=;
        b=e8qhmCQk3rmIfB1fqYxWHq0dYM5eP1g6JpvrJYk7ALj+UIPuqb4FTAgLC4EXFL7WIN
         OYIpluduS3Z4Xr9WyI69o7vRuZ4DCXtdx9Sut9ENUDHz5AullR/0aFPd+lIIktAofFeW
         77cdXkAG1JdCBqU3CCCuZjbHNYiE4KXCHTZmZGD5qzovKWHhjaLZKurrOdjnkVVzAIZS
         eeU6YupxHLhD+So+HcBJqViiyiOm5rZXDROog1EMaAaB7gaGnG+B3jDaHRyEoak1BSBv
         Y5Htes1dcgUFI3OS1uVexGTs19lGC2vdDFYCw0LF4plYqHC3f3Q+MoSXwmQrhRUgSzJF
         SF1A==
X-Gm-Message-State: AOAM530O6+Vnlkfk5v7Uy2TrwxMgtduqti4ADMHY/9EVKpeKKRXAPWlw
        e8M1iOJ1pHGDGZT1nHXAHBJ/CQ==
X-Google-Smtp-Source: ABdhPJwhOZLLUHKejvhGLkMhKQ561C0i0iSobmuqHgR5qbq460hZZkBpBeFxX4iu+mRWKCqZF6aUVQ==
X-Received: by 2002:adf:e0c6:: with SMTP id m6mr4107882wri.66.1621512217735;
        Thu, 20 May 2021 05:03:37 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:37 -0700 (PDT)
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
Subject: [PATCH 35/38] drm/amd/amdgpu/sdma_v5_2: Repair typo in function name
Date:   Thu, 20 May 2021 13:02:45 +0100
Message-Id: <20210520120248.3464013-36-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:501: warning: expecting prototype for sdma_v_0_ctx_switch_enable(). Prototype was for sdma_v5_2_ctx_switch_enable() instead

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
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index ecb82c39b1062..deb907f960906 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -517,7 +517,7 @@ static void sdma_v5_2_rlc_stop(struct amdgpu_device *adev)
 }
 
 /**
- * sdma_v_0_ctx_switch_enable - stop the async dma engines context switch
+ * sdma_v5_2_ctx_switch_enable - stop the async dma engines context switch
  *
  * @adev: amdgpu_device pointer
  * @enable: enable/disable the DMA MEs context switch.
-- 
2.31.1

