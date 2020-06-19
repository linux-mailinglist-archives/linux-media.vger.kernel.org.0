Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07542019B8
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 19:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731681AbgFSRrT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 13:47:19 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:44817 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391317AbgFSRrQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 13:47:16 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 4D5453C057C;
        Fri, 19 Jun 2020 19:47:13 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Vk8qxqVgzSCj; Fri, 19 Jun 2020 19:47:07 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 67C663C00BA;
        Fri, 19 Jun 2020 19:47:07 +0200 (CEST)
Received: from vmlxhi-121.localdomain (10.72.92.132) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 19 Jun
 2020 19:47:06 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <michael@rodin.online>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>
Subject: [PATCH 1/2] [RFC] media: rcar-vin: send a V4L2 event to vdev if no frame captured after a timeout
Date:   Fri, 19 Jun 2020 19:46:10 +0200
Message-ID: <1592588777-100596-1-git-send-email-mrodin@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.92.132]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Data flow from an upstream subdevice can stop permanently due to:
 - CSI2 transmission errors
 - silent failure of the source subdevice
 - disconnection of the source subdevice
In those cases userspace waits for new buffers for an infinitely long time.
In order to address this issue, use a timer to monitor, that rvin_irq() is
capturing at least one frame within a IRQ_TIMEOUT_MS period. Otherwise send
a new private v4l2 event to userspace. This event is exported to userspace
via a new uapi header.

Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 drivers/media/platform/rcar-vin/rcar-dma.c  | 21 +++++++++++++++++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  1 +
 drivers/media/platform/rcar-vin/rcar-vin.h  |  6 ++++++
 include/uapi/linux/rcar-vin.h               | 10 ++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 include/uapi/linux/rcar-vin.h

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 1a30cd0..bf8d733 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -937,6 +937,20 @@ static void rvin_capture_stop(struct rvin_dev *vin)
 #define RVIN_TIMEOUT_MS 100
 #define RVIN_RETRIES 10
 
+static const struct v4l2_event rvin_irq_timeout = {
+	.type = V4L2_EVENT_RCAR_VIN_IRQ_TIMEOUT,
+};
+
+static void rvin_irq_timer_function(struct timer_list *timer)
+{
+	struct rvin_dev *vin = container_of(timer, struct rvin_dev,
+					    irq_timer);
+
+	vin_err(vin, "%s: frame completion timeout after %i ms!\n",
+		__func__, IRQ_TIMEOUT_MS);
+	v4l2_event_queue(&vin->vdev, &rvin_irq_timeout);
+}
+
 static irqreturn_t rvin_irq(int irq, void *data)
 {
 	struct rvin_dev *vin = data;
@@ -1008,6 +1022,8 @@ static irqreturn_t rvin_irq(int irq, void *data)
 		vin_dbg(vin, "Dropping frame %u\n", vin->sequence);
 	}
 
+	mod_timer(&vin->irq_timer, jiffies + msecs_to_jiffies(IRQ_TIMEOUT_MS));
+
 	vin->sequence++;
 
 	/* Prepare for next frame */
@@ -1252,6 +1268,8 @@ static int rvin_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
 				  vin->scratch_phys);
+	else
+		mod_timer(&vin->irq_timer, jiffies + msecs_to_jiffies(IRQ_TIMEOUT_MS));
 
 	return ret;
 }
@@ -1305,6 +1323,8 @@ static void rvin_stop_streaming(struct vb2_queue *vq)
 	/* Free scratch buffer. */
 	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
 			  vin->scratch_phys);
+
+	del_timer_sync(&vin->irq_timer);
 }
 
 static const struct vb2_ops rvin_qops = {
@@ -1370,6 +1390,7 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
 		goto error;
 	}
 
+	timer_setup(&vin->irq_timer, rvin_irq_timer_function, 0);
 	return 0;
 error:
 	rvin_dma_unregister(vin);
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index f421e25..c644134 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -581,6 +581,7 @@ static int rvin_subscribe_event(struct v4l2_fh *fh,
 {
 	switch (sub->type) {
 	case V4L2_EVENT_SOURCE_CHANGE:
+	case V4L2_EVENT_RCAR_VIN_IRQ_TIMEOUT:
 		return v4l2_event_subscribe(fh, sub, 4, NULL);
 	}
 	return v4l2_ctrl_subscribe_event(fh, sub);
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index c19d077..7408f67 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -14,12 +14,14 @@
 #define __RCAR_VIN__
 
 #include <linux/kref.h>
+#include <linux/rcar-vin.h>
 
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/videobuf2-v4l2.h>
+#include <media/v4l2-event.h>
 
 /* Number of HW buffers */
 #define HW_BUFFER_NUM 3
@@ -30,6 +32,8 @@
 /* Max number on VIN instances that can be in a system */
 #define RCAR_VIN_NUM 8
 
+#define IRQ_TIMEOUT_MS 1000
+
 struct rvin_group;
 
 enum model_id {
@@ -196,6 +200,7 @@ struct rvin_info {
  * @compose:		active composing
  * @src_rect:		active size of the video source
  * @std:		active video standard of the video source
+ * @irq_timer:		monitors regular capturing of frames in rvin_irq()
  *
  * @alpha:		Alpha component to fill in for supported pixel formats
  */
@@ -240,6 +245,7 @@ struct rvin_dev {
 	struct v4l2_rect src_rect;
 	v4l2_std_id std;
 
+	struct timer_list irq_timer;
 	unsigned int alpha;
 };
 
diff --git a/include/uapi/linux/rcar-vin.h b/include/uapi/linux/rcar-vin.h
new file mode 100644
index 00000000..4eb7f5e
--- /dev/null
+++ b/include/uapi/linux/rcar-vin.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef RCAR_VIN_USER_H
+#define RCAR_VIN_USER_H
+
+/* class for events sent by the rcar-vin driver */
+#define V4L2_EVENT_RCAR_VIN_CLASS	V4L2_EVENT_PRIVATE_START
+#define V4L2_EVENT_RCAR_VIN_IRQ_TIMEOUT	(V4L2_EVENT_RCAR_VIN_CLASS | 0x1)
+
+#endif /* RCAR_VIN_USER_H */
-- 
2.7.4

