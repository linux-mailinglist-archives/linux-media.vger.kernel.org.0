Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A95494EEF
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 14:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbiATN1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 08:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235062AbiATN1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 08:27:53 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46751C061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:53 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id o1-20020a1c4d01000000b0034d95625e1fso7413334wmh.4
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iAcYclpd/6FIhZinrEfjwuNasmRfUX8EQW8kMKH7eHI=;
        b=JZCYu9MsvVyyMkLSyd+lJilG330m4+DBrbl/Un7UaoLCZybFsPg8RHuPti4apVUnwh
         /xyufUo1OjFZa9yPHIrIz/XFQuTW1MspVVqfpYeUdI1ueeRG/x3h1NIAb43KxsKTTSwi
         pNyNXbyLzQNeCtMLOcwJIUIp2QpATFlFyrCqh0sjt7NyGoeez0OiwhywbAdHr+TSWrFO
         Pt7pxxgr0DCwY/zHyTF+vKVuxhp/J0KWm3GYtqvelUW2FBxj4hPWck9WvbPooPjHzG8H
         e46Gzn7oFUoxokisfqGo0KtPkG6M1czzHmrtcCYZvQQ7FuCkjQDIq/7i0XYUlrb49VYS
         qu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iAcYclpd/6FIhZinrEfjwuNasmRfUX8EQW8kMKH7eHI=;
        b=G518MOgwVd/pPS58XddYzu5WJK55R/qXdBEWMFTXKRTN63geRwWTzNZ0TpgZQGojic
         gFBjtKB0Lsp3KlP6vuobF0EiHRV3eF/d6YB9dBC6txMCt56mhZS3ACR/bzruRSGWa963
         eVARldgJaw75xx8fw9j81wuFocxeAL77Fwj0VIId/CwmFylYVYtttcDqcPKg07VbHs+5
         nenKXcUo2PdH/OUbL1Nm9N8DgiPHV5FCnGBTPEni/yWFdYJQLcwugwM6M04BmiyCtbOb
         yOZwocXMv9Hb1J37O0ttagYYMt6EfXwT7Snr6zK/8SDgqsKcliz32N9mHODdS/Ct809T
         NGMQ==
X-Gm-Message-State: AOAM531i3M3yK3Mc1nrcQhoHQ4sJz3fQROZ7WytUeG/Itdb0iyXIVkXK
        V3LBZEu1hR4dkTQTDrbKam0=
X-Google-Smtp-Source: ABdhPJzNuFHgN0BH3Hh5XR2ychKDo4juRHkyCqcEGSf0zzAoftBbFsYbzE5wAQTbkiN7XxAuvJAGyA==
X-Received: by 2002:a5d:6042:: with SMTP id j2mr1881746wrt.105.1642685271909;
        Thu, 20 Jan 2022 05:27:51 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 05:27:51 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/9] dma-buf: Warn about dma_fence_chain container rules
Date:   Thu, 20 Jan 2022 14:27:41 +0100
Message-Id: <20220120132747.2348-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

