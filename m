Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD333DB938
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 15:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238961AbhG3NSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 09:18:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53684 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238972AbhG3NSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 09:18:49 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1876789B;
        Fri, 30 Jul 2021 15:18:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627651123;
        bh=0jU60euWgoiMCjLH3R24Pld5ZEYtj7wc324ldKuFC50=;
        h=From:To:Cc:Subject:Date:From;
        b=TsIsWs56dm42BxB/vk0TUR+4DC4HHx2J3BMorzqsA6F8tgsg9fYSYToLq6IHKuI82
         yUaqEbQ9uLyl6ZO8PPjp/TuhVIqOk4fYQWzNCcZ07e+QDhFCFWjJdSqPe+qS/Ek2TJ
         i0nOV/mYbVrvgOPeqJhNcaZzlMLtXCqTUDK+1rOc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [PATCH v2] media: vimc: Add support for contiguous DMA buffers
Date:   Fri, 30 Jul 2021 16:18:29 +0300
Message-Id: <20210730131829.17140-1-laurent.pinchart+renesas@ideasonboard.com>
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
Changes since v1:

- Add vimc_allocator_type enum
- Document the new parameter in vimc.rst
---
 Documentation/admin-guide/media/vimc.rst       | 10 +++++++++-
 drivers/media/test-drivers/vimc/vimc-capture.c |  9 +++++++--
 drivers/media/test-drivers/vimc/vimc-common.h  |  7 +++++++
 drivers/media/test-drivers/vimc/vimc-core.c    | 10 ++++++++++
 4 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/media/vimc.rst b/Documentation/admin-guide/media/vimc.rst
index 211cc8972410..df57f67fef5f 100644
--- a/Documentation/admin-guide/media/vimc.rst
+++ b/Documentation/admin-guide/media/vimc.rst
@@ -80,7 +80,15 @@ vimc-capture:
 Module options
 --------------
 
-Vimc has a module parameter to configure the driver.
+Vimc has module parameters to configure the driver.
+
+* ``allocator=<unsigned int>``
+
+	memory allocator selection, default is 0. It specifies the way buffers
+	will be allocated.
+
+		- 0: vmalloc
+		- 1: dma-contig
 
 * ``sca_mult=<unsigned int>``
 
diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 5e9fd902cd37..d1e2d0739c00 100644
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
+	if (vimc_allocator == VIMC_ALLOCATOR_VMALLOC)
+		q->io_modes |= VB2_USERPTR;
 	q->drv_priv = vcap;
 	q->buf_struct_size = sizeof(struct vimc_cap_buffer);
 	q->ops = &vimc_cap_qops;
-	q->mem_ops = &vb2_vmalloc_memops;
+	q->mem_ops = vimc_allocator == VIMC_ALLOCATOR_DMA_CONTIG
+		   ? &vb2_dma_contig_memops : &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->min_buffers_needed = 2;
 	q->lock = &vcap->lock;
+	q->dev = v4l2_dev->dev;
 
 	ret = vb2_queue_init(q);
 	if (ret) {
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index a289434e75ba..ba1930772589 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -35,6 +35,13 @@
 
 #define VIMC_PIX_FMT_MAX_CODES 8
 
+extern unsigned int vimc_allocator;
+
+enum vimc_allocator_type {
+	VIMC_ALLOCATOR_VMALLOC = 0,
+	VIMC_ALLOCATOR_DMA_CONTIG = 1,
+};
+
 /**
  * vimc_colorimetry_clamp - Adjust colorimetry parameters
  *
diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index 4b0ae6f51d76..06edf9d4d92c 100644
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
 
+	if (vimc_allocator == VIMC_ALLOCATOR_DMA_CONTIG)
+		dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+
 	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
 	if (!vimc)
 		return -ENOMEM;
-- 
Regards,

Laurent Pinchart

