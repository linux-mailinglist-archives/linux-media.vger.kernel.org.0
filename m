Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9C11615DB
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbgBQPOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:14:10 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54501 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbgBQPOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:14:03 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5x-0005WB-98; Mon, 17 Feb 2020 16:14:01 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5w-0001aD-AT; Mon, 17 Feb 2020 16:14:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 08/18] media: allegro: extract mcu and codec address calculation
Date:   Mon, 17 Feb 2020 16:13:48 +0100
Message-Id: <20200217151358.5695-9-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200217151358.5695-1-m.tretter@pengutronix.de>
References: <20200217151358.5695-1-m.tretter@pengutronix.de>
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

The mcu and the codec use 32 bit addresses which are sent via the
firmware messages. Add helper functions for this address calculation to
make it obvious which address is used in the message.

As the mcu and the codec have a limited address space, print warnings if
the addresses are outside the respective address space.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  | 44 ++++++++++++++-----
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 3366e3605cf5..c0b3a6858b27 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -532,6 +532,29 @@ union mcu_msg_response {
 	struct mcu_msg_encode_frame_response encode_frame;
 };
 
+static inline u32 to_mcu_addr(struct allegro_dev *dev, dma_addr_t phys)
+{
+	if (upper_32_bits(phys) || (lower_32_bits(phys) & MCU_CACHE_OFFSET))
+		v4l2_warn(&dev->v4l2_dev,
+			  "address %pad is outside mcu window\n", &phys);
+
+	return lower_32_bits(phys) | MCU_CACHE_OFFSET;
+}
+
+static inline u32 to_mcu_size(struct allegro_dev *dev, size_t size)
+{
+	return lower_32_bits(size);
+}
+
+static inline u32 to_codec_addr(struct allegro_dev *dev, dma_addr_t phys)
+{
+	if (upper_32_bits(phys))
+		v4l2_warn(&dev->v4l2_dev,
+			  "address %pad cannot be used by codec\n", &phys);
+
+	return lower_32_bits(phys);
+}
+
 /* Helper functions for channel and user operations */
 
 static unsigned long allegro_next_user_id(struct allegro_dev *dev)
@@ -947,8 +970,8 @@ static void allegro_mcu_send_init(struct allegro_dev *dev,
 	msg.header.type = MCU_MSG_TYPE_INIT;
 	msg.header.length = sizeof(msg) - sizeof(msg.header);
 
-	msg.suballoc_dma = lower_32_bits(suballoc_dma) | MCU_CACHE_OFFSET;
-	msg.suballoc_size = suballoc_size;
+	msg.suballoc_dma = to_mcu_addr(dev, suballoc_dma);
+	msg.suballoc_size = to_mcu_size(dev, suballoc_size);
 
 	/* disable L2 cache */
 	msg.l2_cache[0] = -1;
@@ -1158,8 +1181,8 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
 	msg.header.length = sizeof(msg) - sizeof(msg.header);
 
 	msg.channel_id = channel->mcu_channel_id;
-	msg.dma_addr = paddr;
-	msg.mcu_addr = paddr | MCU_CACHE_OFFSET;
+	msg.dma_addr = to_codec_addr(dev, paddr);
+	msg.mcu_addr = to_mcu_addr(dev, paddr);
 	msg.size = size;
 	msg.offset = ENCODER_STREAM_OFFSET;
 	msg.stream_id = 0; /* copied to mcu_msg_encode_frame_response */
@@ -1186,11 +1209,11 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 	msg.pps_qp = 26; /* qp are relative to 26 */
 	msg.user_param = 0; /* copied to mcu_msg_encode_frame_response */
 	msg.src_handle = 0; /* copied to mcu_msg_encode_frame_response */
-	msg.src_y = src_y;
-	msg.src_uv = src_uv;
+	msg.src_y = to_codec_addr(dev, src_y);
+	msg.src_uv = to_codec_addr(dev, src_uv);
 	msg.stride = channel->stride;
 	msg.ep2 = 0x0;
-	msg.ep2_v = msg.ep2 | MCU_CACHE_OFFSET;
+	msg.ep2_v = to_mcu_addr(dev, msg.ep2);
 
 	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
 	allegro_mcu_interrupt(dev);
@@ -1249,10 +1272,9 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 
 	buffer = msg->buffer;
 	list_for_each_entry(al_buffer, list, head) {
-		buffer->dma_addr = lower_32_bits(al_buffer->paddr);
-		buffer->mcu_addr =
-		    lower_32_bits(al_buffer->paddr) | MCU_CACHE_OFFSET;
-		buffer->size = al_buffer->size;
+		buffer->dma_addr = to_codec_addr(dev, al_buffer->paddr);
+		buffer->mcu_addr = to_mcu_addr(dev, al_buffer->paddr);
+		buffer->size = to_mcu_size(dev, al_buffer->size);
 		buffer++;
 	}
 
-- 
2.20.1

