Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF280493B50
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 14:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245443AbiASNnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 08:43:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349764AbiASNnp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 08:43:45 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6243C06173E
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 05:43:44 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id m4so11703955edb.10
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 05:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/sKthdsDAA9J7PKlzAOm6qYQuF+X5868CR5aPtjU9kw=;
        b=XtIEVlQhs8lCmBJhE0TkSAEKWXXHiFKAemZcdZlrk99rAYDkimPaqJUEpH/2Bk9MXb
         oQEDnlNveR24SS7bogutR+ZOlMG+a0rg0FDPw1AcBPWDuBDsl5ssKfnPMlolawXpaoZW
         nhLUSPy1lFNN7XQjXGmbTBTiwm+qMvVP0k9QWXqNIMo567U6nlnmZCcuHgDHdLBfOxpA
         hud/t/u2syPq9nl00mw/J7+KBayrcL2WN2upWms1cdrnu2LJNofFPSec7mgVLhHConb/
         GKpTfXfKCWUQu4mQWrEsRvfd6cgEpPhHJ4IopWZP556QMVm/inGedLKBlFEWk2DNPtEg
         AGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/sKthdsDAA9J7PKlzAOm6qYQuF+X5868CR5aPtjU9kw=;
        b=ChjNpksmIzMhY7gIOT3FCc2THSDXe+gVVyXqgCcrd0tZ0Dt+qkQ469imuepsUW0/Tv
         X1Y6ZqJHWe//Id2787ZdxhkDXTdQznMQiAHeQp496k2lHo2J+UlmpZJiMqbO3Qh0GVUw
         JuXDDFR9r7ZUq5E36Ld4h8y4L8kigDNEA2z4XHIxDqxcKmIrUGcIybXMYhP0EdzfODdj
         bbgUuNz2qjchNo2fJm4RBM3JqN9wMXBrrbmj31SDuXDr0HpEUw8DxPauKVZEB91pfAbf
         cEGAW3G0tSNbb/35wUwrK8vhn585OBSkxmZvZGjhcbUjf6vIV6U2zK2FW/GTn4NzAI/j
         md1A==
X-Gm-Message-State: AOAM53038frsde4XjYA41PT8m9N2Aq+dXYZbe15PCyqylaOCWi3nQHKB
        8ladNBwSEnDmEmUOuynN/CqR/okvai8=
X-Google-Smtp-Source: ABdhPJxLWMBIZT9uDp2E3FK1c4oEa/VtCv9jlY4Il0pA960zoj9MMVqts0dH61KGyu5t40ib1yO/Ew==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr3040459wrm.417.1642599823344;
        Wed, 19 Jan 2022 05:43:43 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g15sm19733583wrm.2.2022.01.19.05.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 05:43:42 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/4] dma-buf: Warn about dma_fence_chain container rules
Date:   Wed, 19 Jan 2022 14:43:38 +0100
Message-Id: <20220119134339.3102-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119134339.3102-1-christian.koenig@amd.com>
References: <20220119134339.3102-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Chaining of dma_fence_chain objects is only allowed through the prev
fence and not through the contained fence.

Warn about that when we create a dma_fence_chain.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 1b4cb3e5cec9..fa33f6b7f77b 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -254,5 +254,13 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 
 	dma_fence_init(&chain->base, &dma_fence_chain_ops,
 		       &chain->lock, context, seqno);
+
+	/* Chaining dma_fence_chain container together is only allowed through
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

