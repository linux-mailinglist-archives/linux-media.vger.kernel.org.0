Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292FC49799F
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 08:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241893AbiAXHkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 02:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241886AbiAXHkv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 02:40:51 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBACFC06173D
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:50 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id i2so11829468wrb.12
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OIMpCxdpOEYcnoEMYTLid8nSDucpIJk7Qs0av1g9rGU=;
        b=Wv6vmwAFRm/BaVWQYECalHzGjxL6WBq8wgOBag2tP/iMbsAsL/4gZEIGOyVn1Rcjgr
         6x4TmZKGuDV0H8OvJ0fVM+Upr/0BEJyhwPtsbccFwHUGSF01C68xUOWB0Ghjfnms0sR7
         X4ubrYWqCJ0jbmuyo1UOrZVgkFqJYcWvo5BeFUuOn18kG8G6fxscUi9/bxgHz5+j/Uzl
         OHfeRSQXsIV+UyE1Y93OK6QqrqjhDlSgQ9oxap1nmW6kC6IVHu5K6uz7v5hytI6irg5c
         DJJeXty1NDcMubyBbcIjaoToervqB4E8hDqne+bJYNzatkMhaCowOCghSPkSQc9YTIlw
         mdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OIMpCxdpOEYcnoEMYTLid8nSDucpIJk7Qs0av1g9rGU=;
        b=kNQatw0d50BRUSQ/DdIzVW6RRqHk/gd1esp6fsqsqpgsm1HUYmoGd/R921zd4aTZoO
         j0zoXoxZ3fL3QO3UuuaFLqIdOe5Vtb8W6W9U736yOT2jZB0TMebmG2hf2zSUNXAIQTdb
         ymeLz6WrLO34U2DAP4XnCnvKxTO76h3R3PALvEb+p76GdINCG4ZUOsZ2frntCM5GkYIw
         9SQckfRxuwtYSsj0AJ2ugG4sbr2S3Q6uALu/a4KgyknRPBi2y5aUW4eRYbNmJ8HPc3xs
         p5RRN/9GSkKN1NF0oLCMf4mV7s8rxVwm5EE5CRsQvJMe3flda9UQmV5bNygGyChT1yWs
         gdJw==
X-Gm-Message-State: AOAM532B10wolXSrcf1KcJw6+5lW9LDMu9zXopelx6Ag9E2ZXLFywV06
        aKCzTXoxz1kPRFxNmtRShqU=
X-Google-Smtp-Source: ABdhPJwicjL4DAH0Upf8PByvfLmXIDl5/1wL7YjXzl4vvkruVIvcrPQL5OoBv3lIQqy8sAq6rRBHwg==
X-Received: by 2002:a5d:6e8b:: with SMTP id k11mr13035578wrz.102.1643010049568;
        Sun, 23 Jan 2022 23:40:49 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 23:40:49 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/9] dma-buf: Warn about dma_fence_chain container rules v2
Date:   Mon, 24 Jan 2022 08:40:40 +0100
Message-Id: <20220124074046.4865-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
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

