Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A50A660F11D
	for <lists+linux-media@lfdr.de>; Thu, 27 Oct 2022 09:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbiJ0H2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 03:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiJ0H2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 03:28:18 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB51153E16;
        Thu, 27 Oct 2022 00:28:14 -0700 (PDT)
X-UUID: c259a5c7d9254db3881abf04af8bfe9e-20221027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fit9DE1uftXws95JgYIXJNf7F1hkoUCp6yPmdEg2Etg=;
        b=NjBwhMzgIpV2QjhmFfavsFozFD0hzPU6FIfOm+3WV2QPRWAVHms6h8t1iCsJ1q87o2LKzgA9EHh1K1JmyAPMZptSv7z/fh0r8AmQOVgC9NfVE1YmoexPzaEWaDDekmYtm3n4CLS3vT+r62mh0I323doX0sHoaSZlET9qDjaYHJs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f43c6b74-3081-4e4a-97ba-9770d31875b6,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
        N:release,TS:100
X-CID-INFO: VERSION:1.1.12,REQID:f43c6b74-3081-4e4a-97ba-9770d31875b6,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
        N:quarantine,TS:100
X-CID-META: VersionHash:62cd327,CLOUDID:b75ed6e4-e572-4957-be22-d8f73f3158f9,B
        ulkID:221027152809CX8AZQO0,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
        il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c259a5c7d9254db3881abf04af8bfe9e-20221027
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2146327282; Thu, 27 Oct 2022 15:28:09 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 27 Oct 2022 15:28:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 27 Oct 2022 15:28:07 +0800
From:   Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>,
        "Laura Abbott" <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        "John Stultz" <jstultz@google.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <yj.chiang@mediatek.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH] dma-buf: cma_heap: Fix typo in comment
Date:   Thu, 27 Oct 2022 15:26:38 +0800
Message-ID: <20221027072642.23787-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo in comment.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 28fb04eccdd0..cd386ce639f3 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -316,7 +316,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 			kunmap_atomic(vaddr);
 			/*
 			 * Avoid wasting time zeroing memory if the process
-			 * has been killed by by SIGKILL
+			 * has been killed by SIGKILL
 			 */
 			if (fatal_signal_pending(current))
 				goto free_cma;
-- 
2.18.0

