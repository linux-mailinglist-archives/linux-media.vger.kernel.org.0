Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613FF43E213
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 15:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhJ1N3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 09:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbhJ1N3D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 09:29:03 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3908C061570
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:26:35 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id z11-20020a1c7e0b000000b0030db7b70b6bso9399833wmc.1
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+ZOGlam3ZY615eG+CpWfufQSgg3eEwqr3uZmKnHNPog=;
        b=kL4LO01axEADDFgKoypKI5W3+0I51DQJlfaqAybcnrgDt7QcmKegUIZCTfzOrrgOnd
         WCLywig0D6KfHtiKzJBpknJctlOCbyW35Nrm3Csy5y9v0efZYhAPPc06nWaZyMMhxfWL
         B7xBEvGtltHfS947NahYNpNJoe1tu/bheIOzESB9djQht1XOYwb+IiEiFpIm7GhDKPwH
         hn5sMtvQjIUChX3cT6Fb1Uoe1G3KtDnrt0/tIKsZkpgfllbKQa28pZB6o5kXUh2FU84n
         3R8xdd4aRZE57lgKL8wkgKDmJPz3eDGi0NUhJq94Po1F3tURR3HXfzWuCx4p/vTlJZpn
         bgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ZOGlam3ZY615eG+CpWfufQSgg3eEwqr3uZmKnHNPog=;
        b=tasF2tKnxeW4J7p/lAji7G099/50RQy5T0qncQiKrzVYSrup4qwjT8bSo9n17lD9Tr
         G3HA3PogH4p7oHb6s9e14eXMxJE29SvRxOcbdIpKERge6tPrf2sdBPrE8TFXoUxnLGYQ
         LKPMPqtjp8HZ1wJmwm8l+XVMwOsSk+sFpt+2CN+Vexp8e2OkqezLaoK1d7xH35b1KoYS
         ehwsVKQ9DXX+qlv1AUWteTCx5CwG6ph8EsOQq3SOVmQlFRdsS5TXh5Q8ztK01Y6fxc8h
         fqxyYJZntw3khukbz97FwoHCq1m7rt+ntR9vQin5lRlIiBKWddQQllZQDkQmMgGSuTbB
         jQoQ==
X-Gm-Message-State: AOAM532NjCG/1MValWH6lGCvGwzG4F2SfyrpLrb8DJEoZETjCxqU52cH
        MObscGcQ7pJmDwa9afj3yg7FiNxJxKE=
X-Google-Smtp-Source: ABdhPJwhMpsL5tAuu5HCCIQ8uQ0zuJwI57WPFv2ZZVxa4Y++aF7AwdEm+jlfxuSci85VLFZEpY5Inw==
X-Received: by 2002:a05:600c:4293:: with SMTP id v19mr4468381wmc.187.1635427594441;
        Thu, 28 Oct 2021 06:26:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l11sm2935695wrt.49.2021.10.28.06.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 06:26:34 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/etnaviv: stop getting the excl fence separately here
Date:   Thu, 28 Oct 2021 15:26:27 +0200
Message-Id: <20211028132630.2330-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028132630.2330-1-christian.koenig@amd.com>
References: <20211028132630.2330-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just grab all fences in one go.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 8dc93863bf96..b5e8ce86dbe7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -189,7 +189,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			continue;
 
 		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
-			ret = dma_resv_get_fences(robj, &bo->excl,
+			ret = dma_resv_get_fences(robj, NULL,
 						  &bo->nr_shared,
 						  &bo->shared);
 			if (ret)
-- 
2.25.1

