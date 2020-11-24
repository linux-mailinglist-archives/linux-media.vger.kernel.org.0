Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679452C310A
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgKXTof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgKXToY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:24 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FADAC061A55
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:24 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id r17so23604198wrw.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mq7PbL6cgpxSOWqLpcSVIbGFAt/shGYJ2nDJJPb1ufM=;
        b=QAjDd7pmP9wSTKQGaUOswEXbxCamu68E+cgIDCWwIrdnY0TW1G88r+c9TTWlZxqPLu
         7zv57v0Szlbn1mpzLQt4tsC/2toJ6vwn/sSzjRXrD1qEbZT4/Wly/JbfeTn2S8Onw8mm
         wafWqtAt1WOMYWSwYeYnbnER09/6WLcU+HY/BruiZW5oXEq2u3SnvrTMAnvvloBCMAsO
         F1ZeEw24FGMFgL6LV8uNQyeg0Wj7lCIE9w3Il2U5NuAW84yje7bLFC8vlLIyg7NF63gh
         OnBw2tMVefWwP6rI4Cgnvl15GE79M3rLSQtm3G41mlKKofO+MUlFxyrET/gENNtjmohn
         7adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mq7PbL6cgpxSOWqLpcSVIbGFAt/shGYJ2nDJJPb1ufM=;
        b=O1nkCbdrfZ45JqLQdUAUddctCmCLpWfBTbJqqIxKAbmLLfCiag/nPKj9epVdFk1Wny
         nKa8LAx8wz0cYfjuMtKKWBC7wFlrA4FxTI9mMZL990T0zAcYhwDbsJ6SRqxcxI4PmYWH
         oTnTZOrOsQYtEyOeMllW1bzLKXyYnvC4JwwM/2QRwmsgk1LYph7yuxYldqRtYhbxwr2m
         4uUJXGXofTul85uKWHp4FQamwdKMw3YX2wZWT8iQIzT3m2+KlM4Uyuz+F1hk1lnW/44Z
         mnv9kpaY3eFOTKYLL7EpvQBXyiV2tcglFutzoJIU3UvrHo1M9NKw4ZJTRIEeYN9AlJTZ
         26Rg==
X-Gm-Message-State: AOAM530wVus9RC26oaz9dx8h89OJdqxsuntrOMjmbAWjEkg2PlynFQt+
        uO/y7Z7kd0Er5JLr/oO70eWvgw==
X-Google-Smtp-Source: ABdhPJw+kv1MDrGjFiOkLD0UZAOdz/00Mi3zE68PVR52zrFv9heQrl/sQOeaGCT/uADkZl+if9+Srw==
X-Received: by 2002:a5d:6783:: with SMTP id v3mr77440wru.45.1606247062896;
        Tue, 24 Nov 2020 11:44:22 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:22 -0800 (PST)
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
Subject: [PATCH 19/40] drm/amd/amdgpu/sdma_v3_0: Fix incorrect param doc-rot issue
Date:   Tue, 24 Nov 2020 19:38:03 +0000
Message-Id: <20201124193824.1118741-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1651: warning: Function parameter or member 'ib' not described in 'sdma_v3_0_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1651: warning: Excess function parameter 'ring' description in 'sdma_v3_0_emit_copy_buffer'

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
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 43410a7bccc25..8ca7fba9c035f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1633,7 +1633,7 @@ static void sdma_v3_0_set_irq_funcs(struct amdgpu_device *adev)
 /**
  * sdma_v3_0_emit_copy_buffer - copy buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to copy to
  * @src_offset: src GPU address
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
-- 
2.25.1

