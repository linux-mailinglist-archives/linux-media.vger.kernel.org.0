Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C0F38AEBF
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242371AbhETMot (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242751AbhETMoQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:44:16 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5C1C0564A4
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:19 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id p7so13653848wru.10
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Az4ajU1UenYP4llap6LwYGAmlVb81FxvttX6ntbrKHw=;
        b=V0/Xcd4FORtoMvNKBEs95Uqtk9Dfnrrj1mowrOIgtUtj97/HkDTL7uz6D69vwAGAS3
         Tdl2wWWjwYVP6GP3fWhFHoNUw4SNR/zAKwaRH3y17fCdc3FVVXkmWPvH5s1HKhZo8AYz
         4Mk9Qc9YtTJ7V88BeOccyuqk2Y4USOt8e2/PyXVwFgBMsb8T0qZ+naXe5Nd7NLVINWsw
         /kmNqlR7g9ceexOxZxdMuoQ5CnkImv246XNufxmMTy+8b/4YhcUSXFy2+gAAuFtRSykz
         YYCfLFqI/SeFI26zM5Nz8d+d1R3bfy0llGMVZDcrq4MOJfmZXYJAQ6qcf/aTPzYBpVMh
         jeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Az4ajU1UenYP4llap6LwYGAmlVb81FxvttX6ntbrKHw=;
        b=VZ5ltGStVkMNPjxkuADALgTfHkHAti8qnzpGO/7ppYcz4DJ/MBthbRW1h1L0xL4MfW
         nqECjAbAlyiihnvLW/mheHifl8xiT6E01qqulH2nDtLqo5b+u/Si+uezBe9xCJE6iy4H
         Fpy5gPV5PWEavepOM/DZmyQ3FwSG7dZAhs4Ynj0ECl3h+l8nfRM4GxoMKZyCdJd+HGYh
         2TIOVb3Kkn/zdfzIfKXcTrBtvsSf+GB2YN5v6DMvpgVXRd0NvtRUdZtBChewfos9GyMt
         YCZPsMSSJ3/Ug8rkZDbdDgWdCvCAdRYdH629s5JK9gbvFPI436npYKn55wXaLo/lHDm0
         Kg1w==
X-Gm-Message-State: AOAM531dX2QK9gwmzgi37XP7UiXWIHfoYt9Od6pdfcBXbn9uwl4jpzrQ
        Vnq/V1Lr/2DoLYWPqt3rCTJY7Q==
X-Google-Smtp-Source: ABdhPJzvSnQab2ZlmzV8rwXYlbo6fahXqWIXfZ2GJOFB82qmSumOr0nFpfJ+gyT9ugbfaWxmxPTiug==
X-Received: by 2002:adf:fa52:: with SMTP id y18mr3880003wrr.355.1621512198612;
        Thu, 20 May 2021 05:03:18 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:18 -0700 (PDT)
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
Subject: [PATCH 26/38] drm/amd/amdgpu/gmc_v10_0: Fix potential copy/paste issue
Date:   Thu, 20 May 2021 13:02:36 +0100
Message-Id: <20210520120248.3464013-27-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:955: warning: expecting prototype for gmc_v8_0_gart_fini(). Prototype was for gmc_v10_0_gart_fini() instead

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
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index f02dc904e4cfe..105ed1bf4a88c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -947,7 +947,7 @@ static int gmc_v10_0_sw_init(void *handle)
 }
 
 /**
- * gmc_v8_0_gart_fini - vm fini callback
+ * gmc_v10_0_gart_fini - vm fini callback
  *
  * @adev: amdgpu_device pointer
  *
-- 
2.31.1

