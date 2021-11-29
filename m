Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1952546163E
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241265AbhK2N3E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:29:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbhK2N1D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:27:03 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCA9C09B056
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:06 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d9so15383253wrw.4
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qk7PwcqKvFwxCK8c/zm5biTBtYcJsU3HDhj1Rke+mig=;
        b=FUno/CVbKE7JV8YJFa0o4CtrijMPMX87xBQhWP+1YXYchLcq5zbHntBZNNdZBl+s8R
         vshKLxgazIvSz+SvzJMinSgOY+QHMkbgIdd93TsKzKJ1bbxUcNxCQC3Kl5m6InYvdE5f
         wtAY9LDNSYcGcOy8X8BkiAZe0AwNL7nhCdd2qfhkIOA18p96RFkoa3EcVdVOSO06ITtl
         OC5ny0EPuOUuEJNxh1bI3MPs9vmhw62O2uWfJzwZbZn+Gmp2BbHucnTnzYQ8v/cGzViN
         iiKMZWe+OCx6yrdvKI4Jf21Qd1XvjG6MMdAAonYkrjDrZTab+kup5OirXnL9as8fbKPf
         q7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qk7PwcqKvFwxCK8c/zm5biTBtYcJsU3HDhj1Rke+mig=;
        b=35h6U/70kSbVPsxAbKqKDMZem7q8L/t5v9LzrXSqEowjtZDtP22mtPEwDosB07WGEO
         KCLEp8hfySKuFfEuHDa5hONbTjA+lRWGHlTl/hdYziOFgepPVsyMb5cnLC45nGr7AlH6
         4llJ0jbMOZCHvqND3aRE2Fw+b9vzVAY+2I/NdNgGktBZoTBAJr1vs1ZAvEh7SIrG6bHg
         YO8A/GAE5sSh35ozMM1XCUq/9IdJFmK3DhUUo7b31kj6Gl2lYmk3aulFTHI05PEA4dFr
         rWy6GmXEVrng5ozZasljJLpEu6u+BfHcBiQtHjnVXRZL9Zn6DBDSgHXjO9GTfK5VhJQz
         PweA==
X-Gm-Message-State: AOAM531U/gIdUu2dCg/BYiKA+D3poCnoHR7ozVbF/4tT85VX/wyfGgi9
        CY6T24hs0KQfIyGUnl2QPps=
X-Google-Smtp-Source: ABdhPJzutv9dYwYC0rKE63+JgPY234G43ihXLtPrH/m+jsweVYi2o2XtcslEUwhpoQYexjXov2BVhg==
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr32860041wrw.591.1638187625591;
        Mon, 29 Nov 2021 04:07:05 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:05 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/28] dma-buf: make fence mandatory for dma_resv_add_excl_fence v2
Date:   Mon, 29 Nov 2021 13:06:34 +0100
Message-Id: <20211129120659.1815-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calling dma_resv_add_excl_fence() with the fence as NULL and expecting
that that this frees up the fences is simply abuse of the internals of
the dma_resv object.

v2: drop the fence pruning completely.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index ff3c0558b3b8..4deea75c0b9c 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -305,8 +305,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 	if (old)
 		i = old->shared_count;
 
-	if (fence)
-		dma_fence_get(fence);
+	dma_fence_get(fence);
 
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
-- 
2.25.1

