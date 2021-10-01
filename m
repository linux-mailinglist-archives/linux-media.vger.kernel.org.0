Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23EF41EA74
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353485AbhJAKI0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353477AbhJAKIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:23 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DE6C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:39 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so10788628wmq.1
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=PXH8tk9DNBtLaZwDDHnKup32VEbpBQdrjnSXIPz0PW/dyKbkTSjIKHVTAC+gmlyDuj
         wOAsN80WpUYrWHZo1ChOZ5tQC/9V7NFyqsQvdfIhpUyYSYzeOGDWq2Ab9U2HzyPAQOmb
         lT2BL5MBr+q3BTqhoCKyW1GTdauzxNRnK9dr3J8fFlHFxp1kh1vJLBaeaB6cc2ba1Et9
         32HQ5EfNMdB/gf9+hKRYIQxYReupUwsW70EDr32L6Np0ef8uBgpmnH18fmZva2PhJ9f5
         1iddLO3Wz1BxBZ+fc9dpTP2RwYIcZb2YV9BnvM8ASO30hzVRAqXskgB6BkfF7bx/+XHt
         v7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=2Vj+flUcXPxuLc79wcwov0q4pQ60QEmi2LU6cMRipQI7A8ZnsfaRgzasPrk5dVNxZq
         4G4hDAR3yY4r/09/tC5E2djDM2kG1OLndg+pHefhwqmqE9DyDv93pXkB4CruBEzQlrjm
         Mgfx56qX/q+BW/X0/R7GaiMx7QBKBZK9iNXaXzMJ5sTBoKE6+66iyd779yJu1l8rcIbW
         /ezjl49jNAav3a3wZpwkWRFfc3bmTDNq8EgVgRfWsR/EczVfuBmCS6JDylPB2jRr4yy2
         oCNMoyiIndSvbuWLgAYhavqOPn3FaUyZcarTHUTf7dZbWEMxWSggnqe/CXhegIOBVHpp
         gdaQ==
X-Gm-Message-State: AOAM530e4m0TtsaZ4EBbRyhCKfIA1T9qlBT51pooAJ5wYNqzTDSW7AEV
        /Oj3Bv5UXUVcHvQJiyMOaJw=
X-Google-Smtp-Source: ABdhPJx7qiKtQqciPHO0by0iLKqUhwG5jjzzHPN8NAGU+x7I7V5LqtDnXG25PcpZlk3SIHVxGLVmAQ==
X-Received: by 2002:a05:600c:35c6:: with SMTP id r6mr3635692wmq.24.1633082797663;
        Fri, 01 Oct 2021 03:06:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:37 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 28/28] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date:   Fri,  1 Oct 2021 12:06:10 +0200
Message-Id: <20211001100610.2899-29-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

