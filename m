Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6188942253C
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234504AbhJELkC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234502AbhJELkC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:40:02 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC12C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:11 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id r7so21266993wrc.10
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=L6QXQyheD0iBmll/6+c9+sMjS2UXeP6CZLR1N0Tr1p1DMvcTPcvrj/vKNkefQk6hSC
         XAX6j4T7WLIwelmGb3Vw7DLUWhezBvGs6oJ3tp31RGY4A+X0HaDNuHljSm35cqPZ0o7t
         QjEw8cbfgbfbfrG0xG80Z13SY25aLjgSqr4p04o5hntg/aaV0vvG/1PixW0ayo+SGnXJ
         bFD3lm4R1p4jMBoFZy9chDD/RdYUm8y5O3ncSTfdOnwBmi/Mxiqh1f9NXgEiYFTN6zb7
         0302neM0bN2wUiHC1/wncpvnSPz1YwKSZAGSg2az4zIvqkTWIv8EO2A860B80CR3DbjE
         l88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=wz97umo9JC3Wcmxs/OywJXSsrNK8D1NUzKziZWeWvBloSBrp5rf6XoFwSAHyphp8N1
         /4gz/vvsoqbOQgaOs2+sTrrksqlFXTB63d8SPd7galOBD/tmqQMpLzm4s1ndWzyJcRAf
         14vr3i15HtKdIJm/Nc019wFTXCUPv5jqI6Fyi/cTbpi0EEcXOMPok1rPeJL6J+1tat8K
         dFhsdBTBvmKJn+a+NJ2XjEyiuOUkEszGI41LBEbG0t3TXfkF/n3bMNvFLI3tsofA3oM4
         l2vombtElyaROWPDW2eSzxPggSrs7epXRioHIOaHZVvpaUfrqbpch14CYLW8Me8dkt46
         V8tw==
X-Gm-Message-State: AOAM532CUsRb8ODiNgcz7OtJyWcLqFOV25l70CPoPfETSo2niC7/Is8N
        aKmcgFY1dXxmxYvcc3MfaVI=
X-Google-Smtp-Source: ABdhPJxGZxWVpSVFBiaJumxIFqfRiFL+GVcyqCPa5EfSRy4T9vy6Ac7sHOtq3cmmvYrRJTQvJN0d4w==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr17829743wrt.188.1633433890218;
        Tue, 05 Oct 2021 04:38:10 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:09 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 28/28] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date:   Tue,  5 Oct 2021 13:37:42 +0200
Message-Id: <20211005113742.1101-29-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

