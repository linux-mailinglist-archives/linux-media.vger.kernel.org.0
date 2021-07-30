Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E173DB037
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 02:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235443AbhG3AT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 20:19:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:32914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235353AbhG3AT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 20:19:59 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBA279FB;
        Fri, 30 Jul 2021 02:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627604394;
        bh=M6VkwQ5tp0kMMMx4XpysckIGfVjp5AH77xGymq984bQ=;
        h=From:To:Cc:Subject:Date:From;
        b=gaOTtYx5LAO4gmIIbK3KR0R6IhES3zxcqA5155sv4PxM4oFSHviGr4TNsMKbfXxES
         tomEVza7UyXawX2npvofM/NjNVmAaE7O+/f3sqHtnTk8RZspzx9IE1ejscXimt4Lmz
         kUkTHJjqBC/vHBkGwsQQwTdERvta7pAmUNIVhDgM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] media: vimc: Add support for contiguous DMA buffers
Date:   Fri, 30 Jul 2021 03:19:39 +0300
Message-Id: <20210730001939.30769-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vimc driver is used for testing purpose, and some test use cases
involve sharing buffers with a consumer device. Consumers often require
DMA contiguous memory, which vimc doesn't currently support. This leads
in the best case to usage of bounce buffers, which is very slow, and in
the worst case in a complete failure.

Add support for the dma-contig allocator in vimc to support those use
cases properly. The allocator is selected through a new "allocator"
module parameter, which defaults to vmalloc.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-capture.c |  9 +++++++--
 drivers/media/test-drivers/vimc/vimc-common.h  |  2 ++
 drivers/media/test-drivers/vimc/vimc-core.c    | 10 ++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 5e9fd902cd37..92b69a6529fb 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -7,6 +7,7 @@
 
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-vmalloc.h>
 
 #include "vimc-common.h"
@@ -423,14 +424,18 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	/* Initialize the vb2 queue */
 	q = &vcap->queue;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	if (vimc_allocator != 1)
+		q->io_modes |= VB2_USERPTR;
 	q->drv_priv = vcap;
 	q->buf_struct_size = sizeof(struct vimc_cap_buffer);
 	q->ops = &vimc_cap_qops;
-	q->mem_ops = &vb2_vmalloc_memops;
+	q->mem_ops = vimc_allocator == 1
+		   ? &vb2_dma_contig_memops : &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->min_buffers_needed = 2;
 	q->lock = &vcap->lock;
+	q->dev = v4l2_dev->dev;
 
 	ret = vb2_queue_init(q);
 	if (ret) {
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index a289434e75ba..b77939123501 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -35,6 +35,8 @@
 
 #define VIMC_PIX_FMT_MAX_CODES 8
 
+extern unsigned int vimc_allocator;
+
 /**
  * vimc_colorimetry_clamp - Adjust colorimetry parameters
  *
diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index 4b0ae6f51d76..7badcecb7aed 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
  */
 
+#include <linux/dma-mapping.h>
 #include <linux/font.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -15,6 +16,12 @@
 
 #include "vimc-common.h"
 
+unsigned int vimc_allocator;
+module_param_named(allocator, vimc_allocator, uint, 0444);
+MODULE_PARM_DESC(allocator, " memory allocator selection, default is 0.\n"
+			     "\t\t    0 == vmalloc\n"
+			     "\t\t    1 == dma-contig");
+
 #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
 
 #define VIMC_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
@@ -278,6 +285,9 @@ static int vimc_probe(struct platform_device *pdev)
 
 	tpg_set_font(font->data);
 
+	if (vimc_allocator == 1)
+		dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+
 	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
 	if (!vimc)
 		return -ENOMEM;
-- 
Regards,

Laurent Pinchart

