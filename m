Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A576517488
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346065AbiEBQlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386352AbiEBQlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:15 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400A8BF74
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:34 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id j15so20283686wrb.2
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BrOnJQ5GVd5xSufoaIbn+bREEyd4T5ZXHXrgSKz+378=;
        b=okpkvKiRl915tZRV+tKO2JUIHBSt+lEHdvyw8bY6TfdI5VooUsa0uko0GD2XuRtY6D
         ib2FOcZyu81uirrOQztEbyC13epUQrx7siG4pmRnHYF/yHr+iQUxw2oWRk7l7JpZPy2q
         EuePeHUY3wNFGxhM6ImJ5oulTkzYDCRCHjor0Ey1yXxucVzqfL9H9R7q2oT6ACV7MMeZ
         QUArRl0gIsFxN1ixLavUYobBb6oLoqTou2giIWUCQjleu4SgzBSL/dH8TdU1uwbG34lt
         0iroKwnZw4OoPgDqonqH6AQZ/Oy+sNlN2fP9I7HfH4hZi4oxsJXFtU4sJvElHNoANYcc
         fnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BrOnJQ5GVd5xSufoaIbn+bREEyd4T5ZXHXrgSKz+378=;
        b=T/GuhJWAYMckhDjshKgrqKIURyxfn72qX9EqEQya/HT+HFaFRIP5aE20VbQ5j/JOb3
         GB//ghu8NHV2SvHUjvUGJ4qG4pk9ZDSDl8YY7zcbozhTec28jrAgaZeWwE8Yp7r4Xzg3
         TQQd05FbNAx86lY22XbdNwgdDRaxOopt0upCyqQVSmogPnl2JFL+xthtiGybjTtg4PGN
         r1VjFzlAwZMqfCnOsXk4JIFOfXQSvNr8cfBxmzTmSwALObTweWAKMCjviYCAmjHiIt0B
         QdvQ9R9hpPKJuxx1stwkHw6sA+RhtJ+TFOB7EpVQOWocrYinJ4xNOLtqUjecx57Ry42A
         B92A==
X-Gm-Message-State: AOAM532f2qBu1pfK9swFegTQ6/O39g3GVRax8H55DCkylsUrkulp4h+Q
        xelEJLD328j4qdcECcqknoE=
X-Google-Smtp-Source: ABdhPJwsgT2uBu8jt40/OL4SbaktGz3QRHu++Q4skOI7kiUNv4O32wAoOAtOasCXMjvp7kYjRaqe4g==
X-Received: by 2002:a05:6000:1ac8:b0:20c:6ed8:403 with SMTP id i8-20020a0560001ac800b0020c6ed80403mr1907892wry.247.1651509453268;
        Mon, 02 May 2022 09:37:33 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:32 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 04/15] dma-buf: add user fence support to dma_fence_chain
Date:   Mon,  2 May 2022 18:37:11 +0200
Message-Id: <20220502163722.3957-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If either the previous fence or the newly chained on is an user fence the
dma_fence chain node is considered an user fence as well.

This way the user fence status propagates through the chain.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 06f8ef97c6e8..421241607ac2 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -253,6 +253,10 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	dma_fence_init(&chain->base, &dma_fence_chain_ops,
 		       &chain->lock, context, seqno);
 
+	if ((prev && test_bit(DMA_FENCE_FLAG_USER, &prev->flags)) ||
+	    test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
+		set_bit(DMA_FENCE_FLAG_USER, &chain->base.flags);
+
 	/*
 	 * Chaining dma_fence_chain container together is only allowed through
 	 * the prev fence and not through the contained fence.
-- 
2.25.1

