Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F701FCCBC
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 13:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgFQLp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 07:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgFQLp5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 07:45:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004B0C061797
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 04:45:55 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVt-0002Wb-89; Wed, 17 Jun 2020 13:45:53 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVs-0000ra-HK; Wed, 17 Jun 2020 13:45:52 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 10/12] media: allegro: drop length field from message header
Date:   Wed, 17 Jun 2020 13:45:48 +0200
Message-Id: <20200617114550.3235-11-m.tretter@pengutronix.de>
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

The length of the message will be determined when the message is
encoded.  Writing the size of the struct into the message in the driver
won't be the actual length of the message that is send to the firmware.
Therefore, drop the length field from the message.

Since the header is the same for all response messages, it does not make
sense to read the header in each decoding function, but we can simply
decode it once before dispatching to the respective functions.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/allegro-dvt/allegro-core.c |  6 ------
 drivers/staging/media/allegro-dvt/allegro-mail.c | 13 ++++---------
 drivers/staging/media/allegro-dvt/allegro-mail.h |  3 +--
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 16e5453829e7..98df10b39a0c 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -780,7 +780,6 @@ static void allegro_mcu_send_init(struct allegro_dev *dev,
 	memset(&msg, 0, sizeof(msg));
 
 	msg.header.type = MCU_MSG_TYPE_INIT;
-	msg.header.length = sizeof(msg) - sizeof(msg.header);
 
 	msg.suballoc_dma = to_mcu_addr(dev, suballoc_dma);
 	msg.suballoc_size = to_mcu_size(dev, suballoc_size);
@@ -999,7 +998,6 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 	memset(&msg, 0, sizeof(msg));
 
 	msg.header.type = MCU_MSG_TYPE_CREATE_CHANNEL;
-	msg.header.length = sizeof(msg) - sizeof(msg.header);
 
 	msg.user_id = channel->user_id;
 
@@ -1020,7 +1018,6 @@ static int allegro_mcu_send_destroy_channel(struct allegro_dev *dev,
 	memset(&msg, 0, sizeof(msg));
 
 	msg.header.type = MCU_MSG_TYPE_DESTROY_CHANNEL;
-	msg.header.length = sizeof(msg) - sizeof(msg.header);
 
 	msg.channel_id = channel->mcu_channel_id;
 
@@ -1040,7 +1037,6 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
 	memset(&msg, 0, sizeof(msg));
 
 	msg.header.type = MCU_MSG_TYPE_PUT_STREAM_BUFFER;
-	msg.header.length = sizeof(msg) - sizeof(msg.header);
 
 	msg.channel_id = channel->mcu_channel_id;
 	msg.dma_addr = to_codec_addr(dev, paddr);
@@ -1065,7 +1061,6 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 	memset(&msg, 0, sizeof(msg));
 
 	msg.header.type = MCU_MSG_TYPE_ENCODE_FRAME;
-	msg.header.length = sizeof(msg) - sizeof(msg.header);
 
 	msg.channel_id = channel->mcu_channel_id;
 	msg.encoding_options = AL_OPT_FORCE_LOAD;
@@ -1129,7 +1124,6 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 	if (!msg)
 		return -ENOMEM;
 
-	msg->header.length = size - sizeof(msg->header);
 	msg->header.type = type;
 	msg->channel_id = channel->mcu_channel_id;
 	msg->num_buffers = num_buffers;
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index a687d533e061..e324a9ae5fff 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -256,8 +256,6 @@ allegro_dec_init(struct mcu_msg_init_response *msg, u32 *src)
 {
 	unsigned int i = 0;
 
-	msg->header.type = FIELD_GET(GENMASK(31, 16), src[i]);
-	msg->header.length = FIELD_GET(GENMASK(15, 0), src[i++]);
 	msg->reserved0 = src[i++];
 
 	return i * sizeof(*src);
@@ -269,8 +267,6 @@ allegro_dec_create_channel(struct mcu_msg_create_channel_response *msg,
 {
 	unsigned int i = 0;
 
-	msg->header.type = FIELD_GET(GENMASK(31, 16), src[i]);
-	msg->header.length = FIELD_GET(GENMASK(15, 0), src[i++]);
 	msg->channel_id = src[i++];
 	msg->user_id = src[i++];
 	msg->options = src[i++];
@@ -293,8 +289,6 @@ allegro_dec_destroy_channel(struct mcu_msg_destroy_channel_response *msg,
 {
 	unsigned int i = 0;
 
-	msg->header.type = FIELD_GET(GENMASK(31, 16), src[i]);
-	msg->header.length = FIELD_GET(GENMASK(15, 0), src[i++]);
 	msg->channel_id = src[i++];
 
 	return i * sizeof(*src);
@@ -306,8 +300,6 @@ allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
 	unsigned int i = 0;
 	unsigned int j;
 
-	msg->header.type = FIELD_GET(GENMASK(31, 16), src[i]);
-	msg->header.length = FIELD_GET(GENMASK(15, 0), src[i++]);
 	msg->channel_id = src[i++];
 
 	msg->stream_id = src[i++];
@@ -417,7 +409,10 @@ int allegro_decode_mail(void *msg, u32 *src)
 	if (!src || !msg)
 		return -EINVAL;
 
-	header = (struct mcu_msg_header *)src;
+	header = msg;
+	header->type = FIELD_GET(GENMASK(31, 16), src[0]);
+
+	src++;
 	switch (header->type) {
 	case MCU_MSG_TYPE_INIT:
 		allegro_dec_init(msg, src);
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index a4d829f6f99d..397622973c19 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -23,8 +23,7 @@ enum mcu_msg_type {
 const char *msg_type_name(enum mcu_msg_type type);
 
 struct mcu_msg_header {
-	u16 length;		/* length of the body in bytes */
-	u16 type;
+	enum mcu_msg_type type;
 };
 
 struct mcu_msg_init_request {
-- 
2.20.1

