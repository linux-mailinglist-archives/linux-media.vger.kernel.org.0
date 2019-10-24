Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54919E2F21
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 12:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438842AbfJXKc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 06:32:56 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34935 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438840AbfJXKc4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 06:32:56 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iNaQJ-0008S6-2l; Thu, 24 Oct 2019 12:32:55 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Subject: [PATCH] media: coda: request to skip kernel mapping for decoded buffers
Date:   Thu, 24 Oct 2019 12:32:49 +0200
Message-Id: <20191024103249.680-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Lucas Stach <l.stach@pengutronix.de>

The kernel driver never touches the decoded buffers with the CPU.
All accesses are either done by hardware DMA masters or userspace
mapping the buffers. This means we don't need a kernel virtual
address mapping for those buffers at all. As those buffers are
usually quite large, we can save a good deal of kernel vmalloc
space by requesting to not have a kernel mapping set up for them.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 834f11fe9dc2..287dc1692286 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2387,6 +2387,7 @@ int coda_decoder_queue_init(void *priv, struct vb2_queue *src_vq,
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
+	dst_vq->dma_attrs = DMA_ATTR_NO_KERNEL_MAPPING;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 
 	return coda_queue_init(priv, dst_vq);
-- 
2.20.1

