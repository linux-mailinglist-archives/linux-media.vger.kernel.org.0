Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF7340D8C1
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238315AbhIPLcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238298AbhIPLc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:29 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F26C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:09 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so4232930wml.3
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=YGi6nayBrATbkCwhODb20MMXGtroMBuKFMKiHSpJJV84T7YPBMkg7CwT9yPOmEzaMY
         trLLjeu0tg/oH00K/7iQvk8em2sGrsXzPB4IBR3t8l+Dd69D8w21E33PhiV4gQhBmjzy
         Jph7qutv+y2T98vsrK7Uo7w/nfNrugX8T5RmkYuye9s8Ak6lH5VFKB6o8jqn8puOwlEz
         8Q15+fJQdkq6urpvV6xJJ9VeyzP3TnE50YOUCXdy9EHKIZp92aNx2WY5sNW6hK54QFC9
         DnTzwBkF1fSezE/3okJ1u8g/dwnIbJAWe/5l6yaoEEz+69FFK6GtWy5iAWe9USzWdV18
         mAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=adoYRaf2ifhYbIIDaGZAwDmxGljkyqKSXxevlrhGLh6rlQCKNVjOZtVbw3FO8Hv1DK
         mchY2quypZExkZ/iz7WhIx55qR2pi4svQ0mRX/ifqyspwHTD5LKOYmgNpfWoLBm6uxHo
         Pe/wgrp9FEG3Cxa+tQSd8aVzifg49DQxnwFPypQKs2ZAYg1GWRJEb1q4XKUsq0NuGfSP
         yeqtra2/1UnVFjZ8psVvO2s4rZwwGEJrRsIHefrRNneB1D061Aq23l4VezA7YS1Irco9
         2vJaG3UHskKUY5dhrhbClnjUjT+R2eMv+xM3sCoYeN858Dp6pOKFpitsK3jt9/L0X8Mm
         zh+w==
X-Gm-Message-State: AOAM530rT8a2vhrY29OcNI3+WKx2Ce31lBXM6rlFmTbMgC/rJ7+oGpWZ
        vectxXWO/6Jhi8g1DfnhqU8=
X-Google-Smtp-Source: ABdhPJwJty66BSyg38f1izgxVMtOw1rMBUp0M6VJ3qfJd8Pw1yVyfa9N0AZ9pcJVuwFRWddvkeyNxw==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id o19mr4499247wmq.131.1631791868032;
        Thu, 16 Sep 2021 04:31:08 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:31:07 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 25/26] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date:   Thu, 16 Sep 2021 13:30:41 +0200
Message-Id: <20210916113042.3631-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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

