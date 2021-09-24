Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDA74177B5
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347214AbhIXPdT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347209AbhIXPdS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:18 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE7AC06173F
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:44 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id g16so28700828wrb.3
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=qcTCwplmusmyAvJ40fwoarKDm4FklaUId8KuFdmldXBzzf7vYkFVTyGyrhxR1exe+a
         Ti7FFhKsfqQldIbzHeSQHl/TSs9QBtevczGTSyno+qKVRsDPyPX660zU8DjZofoZojaW
         FNBfpXcAWhbxnD1RL0eiFC5NIsuYG9iBDJwWGfziefGeY7RRSGCSKm29W/jS4EI+WeOC
         x2TjnDEX7xTqdcQVq/6V1GNr8UvayIb2+zzF730lCN0tXYiLqK7eUMVsXcW0Dw6sWMCg
         O6fFa1PsdYFIB+Ok6yr8Da4ddQbOIw3OET21Mtlp0kAmgPA7Jzw4pdmsBA8BV/ZPCGtt
         Cf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
        b=F/SnUQPdtNF/+UWviCo3N710N2i+A05Xrc+eAdoZ8oWxUCM6LLE3IuWcFr1juo5hTf
         /PpsHeQMQTAG75JMZzrk646BdA06+M7uRzAafYdzUR6kSiDwuVi6z+UMNFsLGU9AW+5P
         iDGpfqvmkzkMYwvXQulooYwQKolRpokSAHw5x1h3MiFO1nMyd8cUFXWbhgM5VEnMoT7u
         BwCbwggluMw2MDKc6X20oWPG7uf0zDuDOnPKtj84OkuguSEhoZ6LbC/o+ER4mEs/6Vai
         SLour+c0D+h0NtIj9CbZQ7s+y3SGW3tjWS1L1XLOYZ0dFxWBYeePzpZ+3zRIrPo35F2Q
         wY2w==
X-Gm-Message-State: AOAM531UsHSAaViKA1KyYhHPEqCMOhaieJ2fa6J+uJERuxKift+a1++e
        L4I61FprJRTLmHujQK/Jn8Q=
X-Google-Smtp-Source: ABdhPJxH7t42u6+VO/+NY11r/YcaQHT6Oijj6TbR+5kXQxpt0qv0iqBvhkcje1t5rM51uMyYkthXsg==
X-Received: by 2002:a5d:618c:: with SMTP id j12mr11983777wru.189.1632497503516;
        Fri, 24 Sep 2021 08:31:43 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:43 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 27/27] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date:   Fri, 24 Sep 2021 17:31:13 +0200
Message-Id: <20210924153113.2159-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

