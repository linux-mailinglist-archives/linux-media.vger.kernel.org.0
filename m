Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224332EBE6A
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 14:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbhAFNRS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 08:17:18 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10396 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbhAFNRS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 08:17:18 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D9qc55Rr9z7R0j;
        Wed,  6 Jan 2021 21:15:33 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 21:16:19 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <clabbe@baylibre.com>, <mchehab@kernel.org>,
        <mjpeg-users@lists.sourceforge.net>, <linux-media@vger.kernel.org>,
        <devel@driverdev.osuosl.org>, <linux-kernel@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] media: zoran: use resource_size
Date:   Wed, 6 Jan 2021 21:17:02 +0800
Message-ID: <20210106131702.32507-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 808196ea5b81..d60b4c73ea80 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1020,7 +1020,7 @@ int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq)
 	vq->buf_struct_size = sizeof(struct zr_buffer);
 	vq->ops = &zr_video_qops;
 	vq->mem_ops = &vb2_dma_contig_memops;
-	vq->gfp_flags = GFP_DMA32,
+	vq->gfp_flags = GFP_DMA32;
 	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	vq->min_buffers_needed = 9;
 	vq->lock = &zr->lock;
-- 
2.22.0

