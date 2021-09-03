Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1D940052C
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 20:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350492AbhICSp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 14:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350355AbhICSpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 14:45:18 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72643C061760;
        Fri,  3 Sep 2021 11:44:18 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so161517pjw.2;
        Fri, 03 Sep 2021 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31jt7QK/9p5C4ADlv88LMXP5EVEdNDb9tmwFIJMLC4k=;
        b=qDJrFouyCfFeLGnUbBR95iExuYEIHyianFD6naRgO7dfxR2y9NADfeSqdQuNE+FJP9
         E0Sm4AaAcVXgb7ItBoEq1Iue3+aYiFwCDfaXrcFO+hJ+CTd1JP1+v4GAaP7dlMdtXzo6
         sCevxf1S8rW69vkzS4YlO32nzt2EwbQhNUeHTi6KmHcz6lpGQq9QYzEYx5ZwcsPS4eYn
         b5eZur8Smg2NtgeTQXEDS2Zq7A5VrbBKomXnqtw96gjnrH5SY/tJD6jSk6HnTtqOi3rX
         QJv3DWZde2p64pTjBa1sKF0dNN3uEeMz/nsLOotmS46dBO2qtWO6ZK+KgQiEMO0DKB/X
         D9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31jt7QK/9p5C4ADlv88LMXP5EVEdNDb9tmwFIJMLC4k=;
        b=gtxoF25cMO3iiMuNUfeV8KWz7TVkSscEvgH9OcBdTMCXhoQ9HR0MiXORpPfm79RQue
         OIkEj/+4g3xcBtI8l9lC6BXUGVQLArCvQXogwihhANbpq9MQsNruTs/Fl4yfPsiptbHS
         fY2pPFn/QH1Y+Y51ORf1/4SyZy/j8wyOGHsalSWFDQVVBtxkez9+OvB6EcWwWPNHnTk5
         C0e4D0GG4HCIV0maFHXkHGh6CwYD68aYtJpJD3Zekp8gfE9fkYOy6bDHTrVCpla/HZJU
         ljlC1RbyVkiZ42sOpbtdzQwS4QmrCgByLRLdluC4au+Ti4nfx8YSy0ifTU3LiZCrKWrP
         KCDw==
X-Gm-Message-State: AOAM533BeHcALfDik2QbHxnrIIb0tVG0N4EP3EO3BxRf4Keqfmy9VZEx
        fHoJAWoC28Br+uPu1BTizM8=
X-Google-Smtp-Source: ABdhPJz6kyvVGuIf5Nqgp1yrWhHs6MzCixB5+jjmT64dNTD7WkrgEvidF5J/wT0yLD8G5WTB+b3pag==
X-Received: by 2002:a17:90a:1904:: with SMTP id 4mr317144pjg.217.1630694657983;
        Fri, 03 Sep 2021 11:44:17 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id h24sm113360pfn.180.2021.09.03.11.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 11:44:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 7/9] dma-buf/fence-chain: Add fence deadline support
Date:   Fri,  3 Sep 2021 11:47:58 -0700
Message-Id: <20210903184806.1680887-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 1b4cb3e5cec9..736a9ad3ea6d 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -208,6 +208,18 @@ static void dma_fence_chain_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+
+static void dma_fence_chain_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	dma_fence_chain_for_each(fence, fence) {
+		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
+		struct dma_fence *f = chain ? chain->fence : fence;
+
+		dma_fence_set_deadline(f, deadline);
+	}
+}
+
 const struct dma_fence_ops dma_fence_chain_ops = {
 	.use_64bit_seqno = true,
 	.get_driver_name = dma_fence_chain_get_driver_name,
@@ -215,6 +227,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
 	.enable_signaling = dma_fence_chain_enable_signaling,
 	.signaled = dma_fence_chain_signaled,
 	.release = dma_fence_chain_release,
+	.set_deadline = dma_fence_chain_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_chain_ops);
 
-- 
2.31.1

