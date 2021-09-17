Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC9140F7C5
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244297AbhIQMhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244286AbhIQMhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:37:01 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F0DC061766
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:38 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id t18so15001853wrb.0
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=ClzefoT8ZJqdUhLiTrPyn/tYDsZAUMp22rU6KvROHSGBst/72K19MsNlgZgPwNO7TW
         AzzYRDpFMvki1AWIpcB3SZIsVtHNlefi2C0rzgvLNY2ea7LGm7pyCHeorIzpd6z/PhVs
         Yg3bacdCLixtAitXPrJanpP7YNVwgDDRW+BjgRpPr2dluoppn1Anx7C2CpiYPQdRWBOx
         YhpsSFuvu0fHEtr9Io9x3aaRelwNL0ds1HpVg6Jwo/i2bglZSrqyknWPgpVo+NJ8siwr
         IheZXKe8bubdnLwaZiIbyC9G055EWnN2K3oamY6NP8jStkHOeNyf+cBn8KYiJgOBvGV6
         OAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=ELKPq85USVs2Nvk5YqeV7yMhZ9qK6um2Gk5bndDmiy5ahrtl/ghT6Lxl9EsFS6AaB2
         FuF4cy7xQfU1SFEe3uIoJFbRBfUQ88A0g3iDyP5HbXb5kCgY5vNzpYBGr0z9Lk6SH2c6
         Ka21ebbeuiagaIiZSX4ui66au7G/miwUrviyXtnazzWnpVu/H+UNGGrIQxRYMfpZF1ux
         pnsw6xTwsnGot0o0mSa6D3Qiq/er9Mr6CLlDwpfVGmQneOII7nEo8rueWxlK2yGk1rQP
         qfwN3c8gepba4iN1waygsN7n9effP8XjABOGgxHGHiv/K4Xc5ndQ3WyzSs7eFvRKdwt1
         qKUA==
X-Gm-Message-State: AOAM531fb98Ex3Jb0PCnu3Xh7suomFnajkffwm9uV02/4IHl5ldZXzQe
        6lUYLKGzPTFHZEb8fcKEj1I=
X-Google-Smtp-Source: ABdhPJzNtLWcjUTMHGl/9GN0PRbPfq18kIpBmMBWkzWXF+U+Lc7iVK6lvLbnj7xd/dMsUoLsX6t9Qg==
X-Received: by 2002:a5d:5981:: with SMTP id n1mr11976979wri.82.1631882137364;
        Fri, 17 Sep 2021 05:35:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:37 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 25/26] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date:   Fri, 17 Sep 2021 14:35:12 +0200
Message-Id: <20210917123513.1106-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

