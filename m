Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58CC2019BA
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 19:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403995AbgFSRrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 13:47:24 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:44825 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403903AbgFSRrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 13:47:23 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id B88DA3C057C;
        Fri, 19 Jun 2020 19:47:20 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PJi1VxIm3hlR; Fri, 19 Jun 2020 19:47:15 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id AF3FF3C00BA;
        Fri, 19 Jun 2020 19:47:15 +0200 (CEST)
Received: from vmlxhi-121.localdomain (10.72.92.132) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 19 Jun
 2020 19:47:15 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <michael@rodin.online>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>
Subject: [PATCH 2/2] [RFC] media: rcar-vin: make timeout of the irq timer configurable via v4l2 control
Date:   Fri, 19 Jun 2020 19:46:11 +0200
Message-ID: <1592588777-100596-2-git-send-email-mrodin@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592588777-100596-1-git-send-email-mrodin@de.adit-jv.com>
References: <1592588777-100596-1-git-send-email-mrodin@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.92.132]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Different framerates imply different periods between successive frames.
Therefore it is reasonable to make the timeout of the irq_timer
configurable at the run time so userspace can avoid unnecessary long
waiting times. Therefore this commit adds a new custom control to rcar-vin.
This allows to change the timeout before the start of streaming.

Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 17 ++++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-dma.c  | 14 +++++++++-----
 drivers/media/platform/rcar-vin/rcar-vin.h  |  5 +++++
 include/uapi/linux/rcar-vin.h               |  7 +++++++
 include/uapi/linux/v4l2-controls.h          |  6 ++++++
 5 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c89..81faa87 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -884,6 +884,17 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
 	return 0;
 }
 
+static const struct v4l2_ctrl_config rvin_ctrl_irq_timeout = {
+	.ops = &rvin_ctrl_ops,
+	.id = V4L2_CID_RCAR_VIN_IRQ_TIMEOUT,
+	.name = "frame completion timeout",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = 0,
+	.max = S32_MAX,
+	.step = 1,
+	.def = IRQ_TIMEOUT_MS,
+};
+
 static int rvin_mc_init(struct rvin_dev *vin)
 {
 	int ret;
@@ -901,13 +912,17 @@ static int rvin_mc_init(struct rvin_dev *vin)
 	if (ret)
 		rvin_group_put(vin);
 
-	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);
+	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 2);
 	if (ret < 0)
 		return ret;
 
 	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
 			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
 
+	vin->ctrl_irq_timeout = v4l2_ctrl_new_custom(&vin->ctrl_handler,
+						     &rvin_ctrl_irq_timeout,
+						     NULL);
+
 	if (vin->ctrl_handler.error) {
 		ret = vin->ctrl_handler.error;
 		v4l2_ctrl_handler_free(&vin->ctrl_handler);
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index bf8d733..062f338 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -947,7 +947,7 @@ static void rvin_irq_timer_function(struct timer_list *timer)
 					    irq_timer);
 
 	vin_err(vin, "%s: frame completion timeout after %i ms!\n",
-		__func__, IRQ_TIMEOUT_MS);
+		__func__, jiffies_to_msecs(vin->irq_timeout));
 	v4l2_event_queue(&vin->vdev, &rvin_irq_timeout);
 }
 
@@ -1022,7 +1022,7 @@ static irqreturn_t rvin_irq(int irq, void *data)
 		vin_dbg(vin, "Dropping frame %u\n", vin->sequence);
 	}
 
-	mod_timer(&vin->irq_timer, jiffies + msecs_to_jiffies(IRQ_TIMEOUT_MS));
+	mod_timer(&vin->irq_timer, jiffies + vin->irq_timeout);
 
 	vin->sequence++;
 
@@ -1233,6 +1233,7 @@ static int rvin_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct rvin_dev *vin = vb2_get_drv_priv(vq);
 	unsigned long flags;
 	int ret;
+	s32 irq_timeout = v4l2_ctrl_g_ctrl(vin->ctrl_irq_timeout);
 
 	/* Allocate scratch buffer. */
 	vin->scratch = dma_alloc_coherent(vin->dev, vin->format.sizeimage,
@@ -1265,11 +1266,14 @@ static int rvin_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	spin_unlock_irqrestore(&vin->qlock, flags);
 out:
-	if (ret)
+	if (ret) {
 		dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
 				  vin->scratch_phys);
-	else
-		mod_timer(&vin->irq_timer, jiffies + msecs_to_jiffies(IRQ_TIMEOUT_MS));
+	} else {
+		vin->irq_timeout = msecs_to_jiffies(irq_timeout);
+		mod_timer(&vin->irq_timer, jiffies + vin->irq_timeout);
+		vin_dbg(vin, "%s: set irq timer to %i ms\n", __func__, irq_timeout);
+	}
 
 	return ret;
 }
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 7408f67..4e514e7 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -201,6 +201,9 @@ struct rvin_info {
  * @src_rect:		active size of the video source
  * @std:		active video standard of the video source
  * @irq_timer:		monitors regular capturing of frames in rvin_irq()
+ * @irq_timeout:	timeout value in jiffies, which is currently used by
+ *			@irq_timer and can be changed via @ctrl_irq_timeout
+ * @ctrl_irq_timeout:	controls value of @irq_timeout
  *
  * @alpha:		Alpha component to fill in for supported pixel formats
  */
@@ -246,6 +249,8 @@ struct rvin_dev {
 	v4l2_std_id std;
 
 	struct timer_list irq_timer;
+	unsigned long irq_timeout;
+	struct v4l2_ctrl *ctrl_irq_timeout;
 	unsigned int alpha;
 };
 
diff --git a/include/uapi/linux/rcar-vin.h b/include/uapi/linux/rcar-vin.h
index 4eb7f5e..6c72584 100644
--- a/include/uapi/linux/rcar-vin.h
+++ b/include/uapi/linux/rcar-vin.h
@@ -3,8 +3,15 @@
 #ifndef RCAR_VIN_USER_H
 #define RCAR_VIN_USER_H
 
+#include <linux/v4l2-controls.h>
+
 /* class for events sent by the rcar-vin driver */
 #define V4L2_EVENT_RCAR_VIN_CLASS	V4L2_EVENT_PRIVATE_START
 #define V4L2_EVENT_RCAR_VIN_IRQ_TIMEOUT	(V4L2_EVENT_RCAR_VIN_CLASS | 0x1)
 
+/* private controls for rcar-vin */
+enum rcar_vin_ctrl_id {
+	V4L2_CID_RCAR_VIN_IRQ_TIMEOUT = V4L2_CID_USER_RCAR_VIN_BASE
+};
+
 #endif /* RCAR_VIN_USER_H */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 6227141..cf4f085 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -198,6 +198,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_ATMEL_ISC_BASE		(V4L2_CID_USER_BASE + 0x10c0)
 
+/*
+ * The base for the rcar-vin driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_RCAR_VIN_BASE		(V4L2_CID_USER_BASE + 0x10d0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.7.4

