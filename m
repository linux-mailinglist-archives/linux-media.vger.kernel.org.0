Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CB44144C5
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbhIVJNS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234144AbhIVJMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:42 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6449CC061756
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:12 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id w17so4592198wrv.10
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=Gmi552MnL/rW+Mx1kL2nA/z5dmqeHqcUeGLsCY1r9ovqo+Cj70S1bDU5jIaLP4Hi72
         2RWq9Ldpxz1PQ8QVk0yAxYT5pRSPx//c788ezkmYsT920N0eJBRkUAV4Pn6JNZso8tlS
         sC7jdUlPiZmxL6hEwRe59Hfq+WxGHtSqN/pYF1njdio2/Ce+WIqjFhEf3IenPu4J6dbu
         6y7/SNwvbwMYoofdfflA6up+1DlnLxAEyaV0XKc7GvWPRP9PVpMF+eZSwsGRHng9zqTe
         wVfXF+FWccEkG+BzBHRIzBjSLz8CsiUHVMP0U/BhC8Dl3WW+Q2aZRYESHUSUOF9TMqgO
         cd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=geXOCu1DXA3dWZSuGbNZPXuss0HPvHdMHiFGAUgDWurLZRK/YFW7Jz6pugrVdzwdyo
         Bom1S6k6hDxXZ3xYxhO7zFkSuP1GpZao8OFkWt3Xn1HyR67NegFIMMK3Sywt0LCzkRPA
         rRN4w/VHTBIvWr2+PeXRI+FkKwS75Pq3WaI6GPCwGIYcqIgeyRquzZW/toD+8M750Xyh
         5VomARUGH5CL7iqYwgjY+3WM6uOtKiTuGE3tCK3AyHqvWP12REcInbE9HXVkSkoWDfZA
         lorsCfiP87RsSM0T2ikpHUer+53cj7+zWqI09BwRd9U1AMOIMSPt8V9L/ivIMRsSDQzm
         yTgA==
X-Gm-Message-State: AOAM532wvyy0J6KwoZzUXUnDAo3nhNKrLfX+QMkDSie54RWEkvHdT6pM
        WqksyhxNSmtf33HCJDEKy0k=
X-Google-Smtp-Source: ABdhPJz2W3gVg8Vc8l1hiYyOeCkZWJPcDFjNex2fXTdD3lXlKStjs/7cgs4pYVTghyezxOJ4PIGTtw==
X-Received: by 2002:a05:6000:105:: with SMTP id o5mr40077220wrx.413.1632301871073;
        Wed, 22 Sep 2021 02:11:11 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:11:10 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 25/26] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date:   Wed, 22 Sep 2021 11:10:43 +0200
Message-Id: <20210922091044.2612-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

