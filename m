Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE0A9186E7B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 16:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731800AbgCPP0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 11:26:44 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56901 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731762AbgCPP0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 11:26:43 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdZ-0000lI-Nk; Mon, 16 Mar 2020 16:26:41 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdY-00055D-La; Mon, 16 Mar 2020 16:26:40 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 08/18] media: allegro: extract mcu and codec address calculation
Date:   Mon, 16 Mar 2020 16:26:28 +0100
Message-Id: <20200316152638.19457-9-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316152638.19457-1-m.tretter@pengutronix.de>
References: <20200316152638.19457-1-m.tretter@pengutronix.de>
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
Changelog:

v1 -> v2: None
---
 .../staging/media/allegro-dvt/allegro-core.c  | 44 ++++++++++++++-----
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index de50405ba907..6c2237d4a674 100644
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
@@ -1173,8 +1196,8 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
 	msg.header.length = sizeof(msg) - sizeof(msg.header);
 
 	msg.channel_id = channel->mcu_channel_id;
-	msg.dma_addr = paddr;
-	msg.mcu_addr = paddr | MCU_CACHE_OFFSET;
+	msg.dma_addr = to_codec_addr(dev, paddr);
+	msg.mcu_addr = to_mcu_addr(dev, paddr);
 	msg.size = size;
 	msg.offset = ENCODER_STREAM_OFFSET;
 	msg.stream_id = 0; /* copied to mcu_msg_encode_frame_response */
@@ -1201,11 +1224,11 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
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
@@ -1264,10 +1287,9 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 
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

