Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E734413898
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbhIURjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbhIURi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:56 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B86C061756
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:27 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id i23so41646079wrb.2
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=ZbGWfdMXL2oZ3jJfLUlEKjlo5sciwCxCL/Zz3DA2kRjAKpBRXeZFEAo/lnXVSt2FAP
         OnoiaNvIXwD7e7pHubQV3zrtjaTWlLwxLZp81p5ngZ0AMIVVwwTCyYc8GE8qjWfXwihC
         fr+cqGceSprO//VxFGPKwiUo4hDePgfQZpncMi4ev1Ex7IItQKhL0ni14i+xSz5DdJBL
         ha3DD3EFeXbEd8ZXDidrY0m1DmP4TwVkcEgSpSopE91BtAmOw9asi25rhmtl+XG2w/DL
         2PV7C0uXXTwLo9Y/ulHZYNFChEImVADkT4Y7WQHviWZEWlBTxyPxBECbfxyQup2lOt4+
         4J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=c/l3THLPdTjOlrhBY/VxhipoW5wuOIYliLsx7p8aPJTuAdidFUiyui1qitGjR5/Q6a
         O6QiEI+RctapRY0Nzpmfi0IgMGweSy6OaVSGA3UeP48YM9NtWcnYbZfcf29r0r/sSBGM
         qoXGykVBgDhrSIA373JU6f3PcM04o8GiTElwMFlIFQhpjRABnQMcPAyvlQ83tulI9XwA
         VpuoC8MHiW96fMMg6UACa+oDULKFfmWIow3lIXKNnQSVOwRERK1KJulAg70ukWySFoqN
         au+JfCPIVubGgGazo36+mG7JTe/Io5Bzdb5uM9cOlIWBe0zp/YoI+Qyp3cWXrWJDp+Ex
         /O8Q==
X-Gm-Message-State: AOAM530Vu/2Rm3JPBIDZdHY9xbnvYn0IPVeByTvCUZ+/FvqmKJipSiTV
        dw3luhh32n/bq5JNXn8YFVw=
X-Google-Smtp-Source: ABdhPJyWkM8K/gJ6bhFn7K8e+c1a6QlrTv1uAdG0zR3KN2txs1/j18y5D9GJnziqvsqC4k6zxzli8A==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr6028803wmb.125.1632245845783;
        Tue, 21 Sep 2021 10:37:25 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:25 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 25/26] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date:   Tue, 21 Sep 2021 19:36:58 +0200
Message-Id: <20210921173659.246165-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We certainly hold the reservation lock here, no need for the RCU dance.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 4dd7d9d541c0..7e17bc2b5df1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -195,7 +195,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			if (ret)
 				return ret;
 		} else {
-			bo->excl = dma_resv_get_excl_unlocked(robj);
+			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
 		}
 
 	}
-- 
2.25.1

