Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D21C21D8BF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 16:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbgGMOme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 10:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729659AbgGMOmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 10:42:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37660C061794
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 07:42:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf5-0001mO-CO; Mon, 13 Jul 2020 16:42:31 +0200
Received: from mtr by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf4-0007rL-JC; Mon, 13 Jul 2020 16:42:30 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 01/12] media: allegro: rework mbox handling
Date:   Mon, 13 Jul 2020 16:42:18 +0200
Message-Id: <20200713144229.30057-2-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713144229.30057-1-m.tretter@pengutronix.de>
References: <20200713144229.30057-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a send/notify abstraction for the mailbox and separate the message
handling in the driver from the code to read and write message to the
mailbox.

This untangles how mails are written into the MCU's SRAM and signaled to
the MCU from the protocol between the driver and the firmware.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

---
Changelog:

v1 -> v2:
- change allegro_mbox_notify() to void
---
 .../staging/media/allegro-dvt/allegro-core.c  | 145 +++++++++++-------
 1 file changed, 87 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 3ed66aae741d..11333f900302 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -105,9 +105,11 @@ struct allegro_buffer {
 	struct list_head head;
 };
 
+struct allegro_dev;
 struct allegro_channel;
 
 struct allegro_mbox {
+	struct allegro_dev *dev;
 	unsigned int head;
 	unsigned int tail;
 	unsigned int data;
@@ -134,8 +136,8 @@ struct allegro_dev {
 	struct completion init_complete;
 
 	/* The mailbox interface */
-	struct allegro_mbox mbox_command;
-	struct allegro_mbox mbox_status;
+	struct allegro_mbox *mbox_command;
+	struct allegro_mbox *mbox_status;
 
 	/*
 	 * The downstream driver limits the users to 64 users, thus I can use
@@ -583,12 +585,20 @@ static void allegro_free_buffer(struct allegro_dev *dev,
  * Mailbox interface to send messages to the MCU.
  */
 
-static int allegro_mbox_init(struct allegro_dev *dev,
-			     struct allegro_mbox *mbox,
-			     unsigned int base, size_t size)
+static void allegro_mcu_interrupt(struct allegro_dev *dev);
+static void allegro_handle_message(struct allegro_dev *dev,
+				   union mcu_msg_response *msg);
+
+static struct allegro_mbox *allegro_mbox_init(struct allegro_dev *dev,
+					      unsigned int base, size_t size)
 {
+	struct allegro_mbox *mbox;
+
+	mbox = devm_kmalloc(&dev->plat_dev->dev, sizeof(*mbox), GFP_KERNEL);
 	if (!mbox)
-		return -EINVAL;
+		return ERR_PTR(-ENOMEM);
+
+	mbox->dev = dev;
 
 	mbox->head = base;
 	mbox->tail = base + 0x4;
@@ -599,7 +609,7 @@ static int allegro_mbox_init(struct allegro_dev *dev,
 	regmap_write(dev->sram, mbox->head, 0);
 	regmap_write(dev->sram, mbox->tail, 0);
 
-	return 0;
+	return mbox;
 }
 
 static int allegro_mbox_write(struct allegro_dev *dev,
@@ -713,9 +723,50 @@ static ssize_t allegro_mbox_read(struct allegro_dev *dev,
 	return size;
 }
 
-static void allegro_mcu_interrupt(struct allegro_dev *dev)
+/**
+ * allegro_mbox_send() - Send a message via the mailbox
+ * @mbox: the mailbox which is used to send the message
+ * @msg: the message to send
+ */
+static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
 {
-	regmap_write(dev->regmap, AL5_MCU_INTERRUPT, BIT(0));
+	struct allegro_dev *dev = mbox->dev;
+	struct mcu_msg_header *header = msg;
+	ssize_t size = sizeof(*header) + header->length;
+	int err;
+
+	err = allegro_mbox_write(dev, mbox, msg, size);
+	if (err)
+		goto out;
+
+	allegro_mcu_interrupt(dev);
+
+out:
+	return err;
+}
+
+/**
+ * allegro_mbox_notify() - Notify the mailbox about a new message
+ * @mbox: The allegro_mbox to notify
+ */
+static void allegro_mbox_notify(struct allegro_mbox *mbox)
+{
+	struct allegro_dev *dev = mbox->dev;
+	union mcu_msg_response *msg;
+	ssize_t size;
+
+	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		return;
+
+	size = allegro_mbox_read(dev, mbox, msg, sizeof(*msg));
+	if (size < 0)
+		goto out;
+
+	allegro_handle_message(dev, msg);
+
+out:
+	kfree(msg);
 }
 
 static void allegro_mcu_send_init(struct allegro_dev *dev,
@@ -736,8 +787,7 @@ static void allegro_mcu_send_init(struct allegro_dev *dev,
 	msg.l2_cache[1] = -1;
 	msg.l2_cache[2] = -1;
 
-	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
-	allegro_mcu_interrupt(dev);
+	allegro_mbox_send(dev->mbox_command, &msg);
 }
 
 static u32 v4l2_pixelformat_to_mcu_format(u32 pixelformat)
@@ -946,8 +996,7 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 
 	fill_create_channel_param(channel, &msg.param);
 
-	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
-	allegro_mcu_interrupt(dev);
+	allegro_mbox_send(dev->mbox_command, &msg);
 
 	return 0;
 }
@@ -964,8 +1013,7 @@ static int allegro_mcu_send_destroy_channel(struct allegro_dev *dev,
 
 	msg.channel_id = channel->mcu_channel_id;
 
-	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
-	allegro_mcu_interrupt(dev);
+	allegro_mbox_send(dev->mbox_command, &msg);
 
 	return 0;
 }
@@ -991,8 +1039,7 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
 	/* copied to mcu_msg_encode_frame_response */
 	msg.stream_id = stream_id;
 
-	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
-	allegro_mcu_interrupt(dev);
+	allegro_mbox_send(dev->mbox_command, &msg);
 
 	return 0;
 }
@@ -1021,8 +1068,7 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 	msg.ep2 = 0x0;
 	msg.ep2_v = to_mcu_addr(dev, msg.ep2);
 
-	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
-	allegro_mcu_interrupt(dev);
+	allegro_mbox_send(dev->mbox_command, &msg);
 
 	return 0;
 }
@@ -1084,12 +1130,8 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 		buffer++;
 	}
 
-	err = allegro_mbox_write(dev, &dev->mbox_command, msg, size);
-	if (err)
-		goto out;
-	allegro_mcu_interrupt(dev);
+	err = allegro_mbox_send(dev->mbox_command, msg);
 
-out:
 	kfree(msg);
 	return err;
 }
@@ -1681,51 +1723,28 @@ allegro_handle_encode_frame(struct allegro_dev *dev,
 	return 0;
 }
 
-static int allegro_receive_message(struct allegro_dev *dev)
+static void allegro_handle_message(struct allegro_dev *dev,
+				   union mcu_msg_response *msg)
 {
-	union mcu_msg_response *msg;
-	ssize_t size;
-	int err = 0;
-
-	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-
-	size = allegro_mbox_read(dev, &dev->mbox_status, msg, sizeof(*msg));
-	if (size < sizeof(msg->header)) {
-		v4l2_err(&dev->v4l2_dev,
-			 "invalid mbox message (%zd): must be at least %zu\n",
-			 size, sizeof(msg->header));
-		err = -EINVAL;
-		goto out;
-	}
-
 	switch (msg->header.type) {
 	case MCU_MSG_TYPE_INIT:
-		err = allegro_handle_init(dev, &msg->init);
+		allegro_handle_init(dev, &msg->init);
 		break;
 	case MCU_MSG_TYPE_CREATE_CHANNEL:
-		err = allegro_handle_create_channel(dev, &msg->create_channel);
+		allegro_handle_create_channel(dev, &msg->create_channel);
 		break;
 	case MCU_MSG_TYPE_DESTROY_CHANNEL:
-		err = allegro_handle_destroy_channel(dev,
-						     &msg->destroy_channel);
+		allegro_handle_destroy_channel(dev, &msg->destroy_channel);
 		break;
 	case MCU_MSG_TYPE_ENCODE_FRAME:
-		err = allegro_handle_encode_frame(dev, &msg->encode_frame);
+		allegro_handle_encode_frame(dev, &msg->encode_frame);
 		break;
 	default:
 		v4l2_warn(&dev->v4l2_dev,
 			  "%s: unknown message %s\n",
 			  __func__, msg_type_name(msg->header.type));
-		err = -EINVAL;
 		break;
 	}
-
-out:
-	kfree(msg);
-
-	return err;
 }
 
 static irqreturn_t allegro_hardirq(int irq, void *data)
@@ -1746,7 +1765,7 @@ static irqreturn_t allegro_irq_thread(int irq, void *data)
 {
 	struct allegro_dev *dev = data;
 
-	allegro_receive_message(dev);
+	allegro_mbox_notify(dev->mbox_status);
 
 	return IRQ_HANDLED;
 }
@@ -1895,6 +1914,11 @@ static int allegro_mcu_reset(struct allegro_dev *dev)
 	return allegro_mcu_wait_for_sleep(dev);
 }
 
+static void allegro_mcu_interrupt(struct allegro_dev *dev)
+{
+	regmap_write(dev->regmap, AL5_MCU_INTERRUPT, BIT(0));
+}
+
 static void allegro_destroy_channel(struct allegro_channel *channel)
 {
 	struct allegro_dev *dev = channel->dev;
@@ -2887,10 +2911,15 @@ static int allegro_mcu_hw_init(struct allegro_dev *dev,
 {
 	int err;
 
-	allegro_mbox_init(dev, &dev->mbox_command,
-			  info->mailbox_cmd, info->mailbox_size);
-	allegro_mbox_init(dev, &dev->mbox_status,
-			  info->mailbox_status, info->mailbox_size);
+	dev->mbox_command = allegro_mbox_init(dev, info->mailbox_cmd,
+					      info->mailbox_size);
+	dev->mbox_status = allegro_mbox_init(dev, info->mailbox_status,
+					     info->mailbox_size);
+	if (!dev->mbox_command || !dev->mbox_status) {
+		v4l2_err(&dev->v4l2_dev,
+			 "failed to initialize mailboxes\n");
+		return -EIO;
+	}
 
 	allegro_mcu_enable_interrupts(dev);
 
-- 
2.20.1

