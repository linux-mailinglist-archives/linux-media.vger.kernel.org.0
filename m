Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485D638AEB0
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242653AbhETMoE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241962AbhETMnV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:43:21 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2BDC0611AC
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:07 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso4931113wmc.1
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OmMgm22TVdmn0YlU70PwNW8OaCfk/LhHrn8mYGM1ILk=;
        b=QD/KEVmze2nJBsl72X+9/4makCpNLgnhq9kHYQtB0j4vPW1YZXrU1khxF3fGuZU0h+
         ZPx91P2Ne+MJofYJYv5eKK7Yft2hMjg3D7P89z+qpLWEu9oeG6N31skJJsST4qDrmNuL
         ySurx8C8e78/4JZjFHBzSggFMTGDA1MPBXw05kOtgeBccYfmGiCg/i8VWeoCenhST8s3
         okGcBzBiUXfR8+BF1kkNK6mjF301dRzRn875g/Zz6dy9mlYT5wmxs++2gIlYPo+WBEGW
         VwU0WXfkvJCZBLqh2oTsGKIhfsdLjBIrutsQI0UPvKw8CSfIyIxy42lR1AHIt+/e9wWS
         nUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OmMgm22TVdmn0YlU70PwNW8OaCfk/LhHrn8mYGM1ILk=;
        b=DeFPLyaFwJ+pw4PnRSLQvCovgABuc56nUws85xf9in8ZB9hplvAhzQiX0J9/pFJSMn
         N+XCXr+oejdBTxmN5RgAwENtaDPsx3DqvuNzv5kWCmMUPB0BESiysRk3/TYp26a+epX3
         PLfU6z4Lync2stN85fFcADKmuaHWD9FP9BvrFlPQoGWM2J2ZYzmOqZuRhnoRNoMruyj2
         7hX1L8oS0hOalyaCEz1I+pWtz4/IJBCPkfUvJDIprIiijZbSHBFmR31gjdn+k0ym0ZY3
         qJurV41B4bypIuYz2r+iyayMliZEomChhEb29KTMGSUuZ3accWfjUynHCNDvY7wx90pz
         2mCg==
X-Gm-Message-State: AOAM533vKvm4Caq+//h/wTofCT/tfbY+/ha/d+82riODK4L4bS/TGsHq
        xaiX6bwkhtj4lq+PIkGtQrqy0g==
X-Google-Smtp-Source: ABdhPJxIRwowWq6Q6Jk0qbvu6pd7yWq+Mmva8O37/LRH9s85uRpcjtEb6krZZtsukcUmk7nXDt3tAw==
X-Received: by 2002:a1c:bbc3:: with SMTP id l186mr3700393wmf.38.1621512186295;
        Thu, 20 May 2021 05:03:06 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:05 -0700 (PDT)
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
Subject: [PATCH 14/38] drm/amd/amdgpu/gfx_v7_0: Repair function names in the documentation
Date:   Thu, 20 May 2021 13:02:24 +0100
Message-Id: <20210520120248.3464013-15-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2126: warning: expecting prototype for gfx_v7_0_ring_emit_hdp(). Prototype was for gfx_v7_0_ring_emit_hdp_flush() instead
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2262: warning: expecting prototype for gfx_v7_0_ring_emit_ib(). Prototype was for gfx_v7_0_ring_emit_ib_gfx() instead
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3207: warning: expecting prototype for gfx_v7_0_ring_emit_vm_flush(). Prototype was for gfx_v7_0_ring_emit_pipeline_sync() instead

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
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index c35fdd2ef2d4d..685212c3ddae5 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -2116,7 +2116,7 @@ static int gfx_v7_0_ring_test_ring(struct amdgpu_ring *ring)
 }
 
 /**
- * gfx_v7_0_ring_emit_hdp - emit an hdp flush on the cp
+ * gfx_v7_0_ring_emit_hdp_flush - emit an hdp flush on the cp
  *
  * @ring: amdgpu_ring structure holding ring information
  *
@@ -2242,7 +2242,7 @@ static void gfx_v7_0_ring_emit_fence_compute(struct amdgpu_ring *ring,
  * IB stuff
  */
 /**
- * gfx_v7_0_ring_emit_ib - emit an IB (Indirect Buffer) on the ring
+ * gfx_v7_0_ring_emit_ib_gfx - emit an IB (Indirect Buffer) on the ring
  *
  * @ring: amdgpu_ring structure holding ring information
  * @job: job to retrieve vmid from
@@ -3196,7 +3196,7 @@ static int gfx_v7_0_cp_resume(struct amdgpu_device *adev)
 }
 
 /**
- * gfx_v7_0_ring_emit_vm_flush - cik vm flush using the CP
+ * gfx_v7_0_ring_emit_pipeline_sync - cik vm flush using the CP
  *
  * @ring: the ring to emit the commands to
  *
-- 
2.31.1

