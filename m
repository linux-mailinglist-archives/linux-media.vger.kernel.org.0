Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E91785153
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 09:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbjHWHRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 03:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbjHWHRR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 03:17:17 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85B0D1
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 00:17:14 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RVy9h1Dr8ztRwJ;
        Wed, 23 Aug 2023 15:13:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 15:17:11 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] media: cobalt: Use list_for_each_entry() helper
Date:   Wed, 23 Aug 2023 15:16:52 +0800
Message-ID: <20230823071652.450764-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert list_for_each() to list_for_each_entry() so that the p
list_head pointer and list_entry() call are no longer needed, which
can reduce a few lines of code. No functional changed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/media/pci/cobalt/cobalt-v4l2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index 4bfbcca14f60..26bf58d17a3d 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -107,11 +107,9 @@ static void chain_all_buffers(struct cobalt_stream *s)
 {
 	struct sg_dma_desc_info *desc[NR_BUFS];
 	struct cobalt_buffer *cb;
-	struct list_head *p;
 	int i = 0;
 
-	list_for_each(p, &s->bufs) {
-		cb = list_entry(p, struct cobalt_buffer, list);
+	list_for_each_entry(cb, &s->bufs, list) {
 		desc[i] = &s->dma_desc_info[cb->vb.vb2_buf.index];
 		if (i > 0)
 			descriptor_list_chain(desc[i-1], desc[i]);
@@ -348,7 +346,6 @@ static void cobalt_dma_stop_streaming(struct cobalt_stream *s)
 	struct cobalt *cobalt = s->cobalt;
 	struct sg_dma_desc_info *desc;
 	struct cobalt_buffer *cb;
-	struct list_head *p;
 	unsigned long flags;
 	int timeout_msec = 100;
 	int rx = s->video_channel;
@@ -367,8 +364,7 @@ static void cobalt_dma_stop_streaming(struct cobalt_stream *s)
 
 	/* Try to stop the DMA engine gracefully */
 	spin_lock_irqsave(&s->irqlock, flags);
-	list_for_each(p, &s->bufs) {
-		cb = list_entry(p, struct cobalt_buffer, list);
+	list_for_each_entry(cb, &s->bufs, list) {
 		desc = &s->dma_desc_info[cb->vb.vb2_buf.index];
 		/* Stop DMA after this descriptor chain */
 		descriptor_list_end_of_chain(desc);
-- 
2.34.1

