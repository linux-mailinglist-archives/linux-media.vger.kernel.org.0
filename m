Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2E74A9765
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 11:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358134AbiBDKEm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 05:04:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358099AbiBDKEl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 05:04:41 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9EAC061714
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 02:04:40 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id jx6so17983919ejb.0
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OIMpCxdpOEYcnoEMYTLid8nSDucpIJk7Qs0av1g9rGU=;
        b=kEdyeBND1+sjQQEgBxCKwTD2jfD5hj01xe2rH5ufH1ohwmTGz9JuokXVS2loUz67cR
         Sgt0CJ88ZsTTlD499CNTbHz7n2mfp45kjtGliVjkRHcf4JFIPh0flrY1XW+1hCSLTGyN
         a3gssbVWS6MDk7MCK8sC++Gx8N2juQJuJe+RGaYof7Viu0fN41zThohPFYML9aQhT86/
         i6BoDpIpea36irSI9yRq+kekYL+auv2MI+iBlqBxZM5KtTDZM+6y6UoNjvORoLTMuurL
         0McJxS0QOz8cB/lUJdxfkHcsSzp3z8l6D4iOQI8cJVoHqamzqszYvBCOu6CGzatfOQ4O
         uShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OIMpCxdpOEYcnoEMYTLid8nSDucpIJk7Qs0av1g9rGU=;
        b=tCb7K1zctqLcvatEzxJm3nSaq68kSc3YTtQuevLrJPM7EgYTalLSb++PrW6VDuHk1D
         4IZBHBNfa9xkHArZpot/VSx8laLDwZ/UAira3mm544y5jabEC1tyOyCkGALhDoV/j86w
         upyLQTpgTrYA1+CZP3Jw/YsHl16q9hGeY8mfOUbtmnH2ZpQl6p1T+57o/+ndkuwG+daZ
         80MWCRKADSSuqIk64TeITY6c5RVpeKLnjXAnIMpOkPgTVOfp3uXlbYO1rhnL4aQpmk3g
         bo/nbTGWeTAI/GDQCcbGsvtPhO7fsFxOJN6opKBO+j572hA6bEm/6cZU1wCElVCqmUWR
         Tr1Q==
X-Gm-Message-State: AOAM531to407D6R63Ooa1sIOGwEVtvwhPIk+lrj5XB/a8uYjg9g7+76S
        yu91YTLEqNfS+Sv3fpU5TdU=
X-Google-Smtp-Source: ABdhPJy/MXdEppNWsn3y2eTv52qm/Awi+bfFn7NIw30r0IajdZozc69ofz3XjihpMxxDUZtMTpsxLA==
X-Received: by 2002:a17:907:d20:: with SMTP id gn32mr1914593ejc.55.1643969079533;
        Fri, 04 Feb 2022 02:04:39 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 02:04:39 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] dma-buf: Warn about dma_fence_chain container rules v2
Date:   Fri,  4 Feb 2022 11:04:26 +0100
Message-Id: <20220204100429.2049-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Chaining of dma_fence_chain objects is only allowed through the prev
fence and not through the contained fence.

Warn about that when we create a dma_fence_chain.

v2: fix comment style

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-fence-chain.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 1b4cb3e5cec9..084c6927b735 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -254,5 +254,14 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 
 	dma_fence_init(&chain->base, &dma_fence_chain_ops,
 		       &chain->lock, context, seqno);
+
+	/*
+	 * Chaining dma_fence_chain container together is only allowed through
+	 * the prev fence and not through the contained fence.
+	 *
+	 * The correct way of handling this is to flatten out the fence
+	 * structure into a dma_fence_array by the caller instead.
+	 */
+	WARN_ON(dma_fence_is_chain(fence));
 }
 EXPORT_SYMBOL(dma_fence_chain_init);
-- 
2.25.1

