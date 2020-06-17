Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7026D1FCCC1
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 13:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgFQLqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 07:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgFQLp4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 07:45:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5B2C0613ED
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 04:45:55 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVt-0002WS-7L; Wed, 17 Jun 2020 13:45:53 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVs-0000rC-BO; Wed, 17 Jun 2020 13:45:52 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 02/12] media: allegro: rework read/write to mailbox
Date:   Wed, 17 Jun 2020 13:45:40 +0200
Message-Id: <20200617114550.3235-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200617114550.3235-1-m.tretter@pengutronix.de>
References: <20200617114550.3235-1-m.tretter@pengutronix.de>
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

Rework the functions that read and write the SRAM that is used to
communicate with the MCU.

As the functions will not operate on structs but on prepared binary
buffers, make the buffer stride more explicit. Also, avoid any uses of
struct mcu_msg_header to analyze messages in memory, because the header
will be made independent of the binary representation in the mailbox.
Instead explicitly access the mail size field in the mailbox.

As at it, further reduce the dependency between the mailboxes and struct
allegro_dev.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  | 110 ++++++------------
 1 file changed, 36 insertions(+), 74 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 447b15cc235c..217b43e6fcbe 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -612,49 +612,34 @@ static struct allegro_mbox *allegro_mbox_init(struct allegro_dev *dev,
 	return mbox;
 }
 
-static int allegro_mbox_write(struct allegro_dev *dev,
-			      struct allegro_mbox *mbox, void *src, size_t size)
+static int allegro_mbox_write(struct allegro_mbox *mbox,
+			      const u32 *src, size_t size)
 {
-	struct mcu_msg_header *header = src;
+	struct regmap *sram = mbox->dev->sram;
 	unsigned int tail;
 	size_t size_no_wrap;
 	int err = 0;
+	int stride = regmap_get_reg_stride(sram);
 
 	if (!src)
 		return -EINVAL;
 
-	if (size > mbox->size) {
-		v4l2_err(&dev->v4l2_dev,
-			 "message (%zu bytes) too large for mailbox (%zu bytes)\n",
-			 size, mbox->size);
-		return -EINVAL;
-	}
-
-	if (header->length != size - sizeof(*header)) {
-		v4l2_err(&dev->v4l2_dev,
-			 "invalid message length: %u bytes (expected %zu bytes)\n",
-			 header->length, size - sizeof(*header));
+	if (size > mbox->size)
 		return -EINVAL;
-	}
-
-	v4l2_dbg(2, debug, &dev->v4l2_dev,
-		 "write command message: type %s, body length %d\n",
-		 msg_type_name(header->type), header->length);
 
 	mutex_lock(&mbox->lock);
-	regmap_read(dev->sram, mbox->tail, &tail);
+	regmap_read(sram, mbox->tail, &tail);
 	if (tail > mbox->size) {
-		v4l2_err(&dev->v4l2_dev,
-			 "invalid tail (0x%x): must be smaller than mailbox size (0x%zx)\n",
-			 tail, mbox->size);
 		err = -EIO;
 		goto out;
 	}
 	size_no_wrap = min(size, mbox->size - (size_t)tail);
-	regmap_bulk_write(dev->sram, mbox->data + tail, src, size_no_wrap / 4);
-	regmap_bulk_write(dev->sram, mbox->data,
-			  src + size_no_wrap, (size - size_no_wrap) / 4);
-	regmap_write(dev->sram, mbox->tail, (tail + size) % mbox->size);
+	regmap_bulk_write(sram, mbox->data + tail,
+			  src, size_no_wrap / stride);
+	regmap_bulk_write(sram, mbox->data,
+			  src + (size_no_wrap / sizeof(*src)),
+			  (size - size_no_wrap) / stride);
+	regmap_write(sram, mbox->tail, (tail + size) % mbox->size);
 
 out:
 	mutex_unlock(&mbox->lock);
@@ -662,40 +647,32 @@ static int allegro_mbox_write(struct allegro_dev *dev,
 	return err;
 }
 
-static ssize_t allegro_mbox_read(struct allegro_dev *dev,
-				 struct allegro_mbox *mbox,
-				 void *dst, size_t nbyte)
+static ssize_t allegro_mbox_read(struct allegro_mbox *mbox,
+				 u32 *dst, size_t nbyte)
 {
-	struct mcu_msg_header *header;
+	struct {
+		u16 length;
+		u16 type;
+	} __attribute__ ((__packed__)) *header;
+	struct regmap *sram = mbox->dev->sram;
 	unsigned int head;
 	ssize_t size;
 	size_t body_no_wrap;
+	int stride = regmap_get_reg_stride(sram);
 
-	regmap_read(dev->sram, mbox->head, &head);
-	if (head > mbox->size) {
-		v4l2_err(&dev->v4l2_dev,
-			 "invalid head (0x%x): must be smaller than mailbox size (0x%zx)\n",
-			 head, mbox->size);
+	regmap_read(sram, mbox->head, &head);
+	if (head > mbox->size)
 		return -EIO;
-	}
 
 	/* Assume that the header does not wrap. */
-	regmap_bulk_read(dev->sram, mbox->data + head,
-			 dst, sizeof(*header) / 4);
-	header = dst;
+	regmap_bulk_read(sram, mbox->data + head,
+			 dst, sizeof(*header) / stride);
+	header = (void *)dst;
 	size = header->length + sizeof(*header);
-	if (size > mbox->size || size & 0x3) {
-		v4l2_err(&dev->v4l2_dev,
-			 "invalid message length: %zu bytes (maximum %zu bytes)\n",
-			 header->length + sizeof(*header), mbox->size);
+	if (size > mbox->size || size & 0x3)
 		return -EIO;
-	}
-	if (size > nbyte) {
-		v4l2_err(&dev->v4l2_dev,
-			 "destination buffer too small: %zu bytes (need %zu bytes)\n",
-			 nbyte, size);
+	if (size > nbyte)
 		return -EINVAL;
-	}
 
 	/*
 	 * The message might wrap within the mailbox. If the message does not
@@ -708,17 +685,14 @@ static ssize_t allegro_mbox_read(struct allegro_dev *dev,
 	 */
 	body_no_wrap = min((size_t)header->length,
 			   (size_t)(mbox->size - (head + sizeof(*header))));
-	regmap_bulk_read(dev->sram, mbox->data + head + sizeof(*header),
-			 dst + sizeof(*header), body_no_wrap / 4);
-	regmap_bulk_read(dev->sram, mbox->data,
-			 dst + sizeof(*header) + body_no_wrap,
-			 (header->length - body_no_wrap) / 4);
+	regmap_bulk_read(sram, mbox->data + head + sizeof(*header),
+			 dst + (sizeof(*header) / sizeof(*dst)),
+			 body_no_wrap / stride);
+	regmap_bulk_read(sram, mbox->data,
+			 dst + (sizeof(*header) + body_no_wrap) / sizeof(*dst),
+			 (header->length - body_no_wrap) / stride);
 
-	regmap_write(dev->sram, mbox->head, (head + size) % mbox->size);
-
-	v4l2_dbg(2, debug, &dev->v4l2_dev,
-		 "read status message: type %s, body length %d\n",
-		 msg_type_name(header->type), header->length);
+	regmap_write(sram, mbox->head, (head + size) % mbox->size);
 
 	return size;
 }
@@ -735,7 +709,7 @@ static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
 	ssize_t size = sizeof(*header) + header->length;
 	int err;
 
-	err = allegro_mbox_write(dev, mbox, msg, size);
+	err = allegro_mbox_write(mbox, msg, size);
 	if (err)
 		goto out;
 
@@ -760,7 +734,7 @@ static int allegro_mbox_notify(struct allegro_mbox *mbox)
 	if (!msg)
 		return -ENOMEM;
 
-	size = allegro_mbox_read(dev, mbox, msg, sizeof(*msg));
+	size = allegro_mbox_read(mbox, (u32 *)msg, sizeof(*msg));
 	if (size < 0) {
 		err = size;
 		goto out;
@@ -1609,12 +1583,6 @@ allegro_handle_create_channel(struct allegro_dev *dev,
 	struct allegro_channel *channel;
 	int err = 0;
 
-	if (msg->header.length != sizeof(*msg) - sizeof(msg->header))
-		v4l2_warn(&dev->v4l2_dev,
-			  "received message has %d bytes, but expected %zu\n",
-			  msg->header.length,
-			  sizeof(*msg) - sizeof(msg->header));
-
 	channel = allegro_find_channel_by_user_id(dev, msg->user_id);
 	if (IS_ERR(channel)) {
 		v4l2_warn(&dev->v4l2_dev,
@@ -1708,12 +1676,6 @@ allegro_handle_encode_frame(struct allegro_dev *dev,
 {
 	struct allegro_channel *channel;
 
-	if (msg->header.length != sizeof(*msg) - sizeof(msg->header))
-		v4l2_warn(&dev->v4l2_dev,
-			  "received message has %d bytes, but expected %zu\n",
-			  msg->header.length,
-			  sizeof(*msg) - sizeof(msg->header));
-
 	channel = allegro_find_channel_by_channel_id(dev, msg->channel_id);
 	if (IS_ERR(channel)) {
 		v4l2_err(&dev->v4l2_dev,
-- 
2.20.1

