Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACED3408CA6
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240556AbhIMNU7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240264AbhIMNUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:20:21 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4340BC0617AA
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:45 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id b21-20020a1c8015000000b003049690d882so4125512wmd.5
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=eHafF1f4FLFyeSseJox98EKzdW/NnA3X0UYxAFaxI+XPciSSmj6wQ09p6tfWaRe9BA
         5oHi4ptPueYeEreNPjT6ULrzsv9VlMM/dwlG85SexbAhpY5IUXDZEJgPHeCgHoDbjcmX
         KcWw61VD0RFMAyW05WFocLI4jQHuj7VDcoQlnn8fSmtuM734OCej2gphI3Ix/mEOYTi5
         zdHT9TDf1lOb7GPGgl3whmL3TxWiql8plQ4swPhNVg2Tk+V0+OBVVj4E7GzFgQm0QlMc
         091Suem5M/RFy5c9Q1Uqr+7DEXvRXHa1Us9FP9CHOc1mUPXDtJI5Auxg4tkyGwfMyJc8
         BBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=7Cnwq5K8wMytIdhnSxyJEUbZZ+RP7SLojYNJ8Z+Q77Zxlvp83M4Mee/1AQLO99AP63
         /YuOnzTG9BKtLWWmb21Evk9Q/0szHH8r77vGHfeBAdlE3/H1X197czGuNnouTLizYZ1R
         ka/ikjHb2+G0+JmvUd/WrZjn4nl0qqbyDmCWrAF4SV7Brnlk5L2SvoRr5LrTWBbbTjeb
         62T/zxepZwaAeqYortT7mIo6P5+iwosEq1zFXeDFRXQPVMbepci6ttiF0Jcp6ULh0cLe
         7fYJ1sxsWQlOwVjhZjY+QwGMo8zQTJjKMz/lMahIQdW7DpPDtu5iGvRGfDGOgZg1r+QF
         ab8A==
X-Gm-Message-State: AOAM532XOkv/Y9lUmO51smOYXiHgIel5OU4YM1yPy0QhjAC8V+y23iWR
        E49i/Q8BEBWOAJ5dep9oL0g=
X-Google-Smtp-Source: ABdhPJzzX3f036I5MetbYr7KHLTBrIz3UM2p+tS9h5Jr8u0cPVGaEVuQyigmNaQb4tUhcP23EwO2xA==
X-Received: by 2002:a05:600c:4f53:: with SMTP id m19mr11110088wmq.2.1631539063899;
        Mon, 13 Sep 2021 06:17:43 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:43 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 25/26] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date:   Mon, 13 Sep 2021 15:17:06 +0200
Message-Id: <20210913131707.45639-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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

