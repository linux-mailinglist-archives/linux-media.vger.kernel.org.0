Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0CA1FCCB6
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 13:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgFQLp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 07:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgFQLp4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 07:45:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A9DC061573
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 04:45:55 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVt-0002Wc-A6; Wed, 17 Jun 2020 13:45:53 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVs-0000re-J8; Wed, 17 Jun 2020 13:45:52 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 11/12] media: allegro: add a version field to mcu messages
Date:   Wed, 17 Jun 2020 13:45:49 +0200
Message-Id: <20200617114550.3235-12-m.tretter@pengutronix.de>
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

In order to distinguish the message format that is expected by the
firmware, add a version field to the message header. This allows to
encode and decode the messages for the version of the firmware that was
loaded by the driver.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  | 22 ++++++++++++++-----
 .../staging/media/allegro-dvt/allegro-mail.h  |  6 +++++
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 98df10b39a0c..36da55fc5792 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -130,6 +130,7 @@ struct allegro_dev {
 	struct regmap *regmap;
 	struct regmap *sram;
 
+	const struct fw_info *fw_info;
 	struct allegro_buffer firmware;
 	struct allegro_buffer suballocator;
 
@@ -277,6 +278,7 @@ struct fw_info {
 	unsigned int mailbox_cmd;
 	unsigned int mailbox_status;
 	size_t mailbox_size;
+	enum mcu_msg_version mailbox_version;
 	size_t suballocator_size;
 };
 
@@ -288,6 +290,7 @@ static const struct fw_info supported_firmware[] = {
 		.mailbox_cmd = 0x7800,
 		.mailbox_status = 0x7c00,
 		.mailbox_size = 0x400 - 0x8,
+		.mailbox_version = MCU_MSG_VERSION_2018_2,
 		.suballocator_size = SZ_16M,
 	},
 };
@@ -749,6 +752,8 @@ static int allegro_mbox_notify(struct allegro_mbox *mbox)
 	if (!msg)
 		return -ENOMEM;
 
+	msg->header.version = dev->fw_info->mailbox_version;
+
 	tmp = kmalloc(mbox->size, GFP_KERNEL);
 	if (!tmp) {
 		err = -ENOMEM;
@@ -780,6 +785,7 @@ static void allegro_mcu_send_init(struct allegro_dev *dev,
 	memset(&msg, 0, sizeof(msg));
 
 	msg.header.type = MCU_MSG_TYPE_INIT;
+	msg.header.version = dev->fw_info->mailbox_version;
 
 	msg.suballoc_dma = to_mcu_addr(dev, suballoc_dma);
 	msg.suballoc_size = to_mcu_size(dev, suballoc_size);
@@ -993,11 +999,13 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 	memset(&param, 0, sizeof(param));
 	fill_create_channel_param(channel, &param);
 	allegro_alloc_buffer(dev, blob, sizeof(struct create_channel_param));
+	param.version = dev->fw_info->mailbox_version;
 	size = allegro_encode_config_blob(blob->vaddr, &param);
 
 	memset(&msg, 0, sizeof(msg));
 
 	msg.header.type = MCU_MSG_TYPE_CREATE_CHANNEL;
+	msg.header.version = dev->fw_info->mailbox_version;
 
 	msg.user_id = channel->user_id;
 
@@ -1018,6 +1026,7 @@ static int allegro_mcu_send_destroy_channel(struct allegro_dev *dev,
 	memset(&msg, 0, sizeof(msg));
 
 	msg.header.type = MCU_MSG_TYPE_DESTROY_CHANNEL;
+	msg.header.version = dev->fw_info->mailbox_version;
 
 	msg.channel_id = channel->mcu_channel_id;
 
@@ -1037,6 +1046,7 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
 	memset(&msg, 0, sizeof(msg));
 
 	msg.header.type = MCU_MSG_TYPE_PUT_STREAM_BUFFER;
+	msg.header.version = dev->fw_info->mailbox_version;
 
 	msg.channel_id = channel->mcu_channel_id;
 	msg.dma_addr = to_codec_addr(dev, paddr);
@@ -1061,6 +1071,7 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 	memset(&msg, 0, sizeof(msg));
 
 	msg.header.type = MCU_MSG_TYPE_ENCODE_FRAME;
+	msg.header.version = dev->fw_info->mailbox_version;
 
 	msg.channel_id = channel->mcu_channel_id;
 	msg.encoding_options = AL_OPT_FORCE_LOAD;
@@ -1125,6 +1136,8 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 		return -ENOMEM;
 
 	msg->header.type = type;
+	msg->header.version = dev->fw_info->mailbox_version;
+
 	msg->channel_id = channel->mcu_channel_id;
 	msg->num_buffers = num_buffers;
 
@@ -2992,7 +3005,6 @@ static void allegro_fw_callback(const struct firmware *fw, void *context)
 	const char *fw_codec_name = "al5e.fw";
 	const struct firmware *fw_codec;
 	int err;
-	const struct fw_info *info;
 
 	if (!fw)
 		return;
@@ -3003,14 +3015,14 @@ static void allegro_fw_callback(const struct firmware *fw, void *context)
 	if (err)
 		goto err_release_firmware;
 
-	info = allegro_get_firmware_info(dev, fw, fw_codec);
-	if (!info) {
+	dev->fw_info = allegro_get_firmware_info(dev, fw, fw_codec);
+	if (!dev->fw_info) {
 		v4l2_err(&dev->v4l2_dev, "firmware is not supported\n");
 		goto err_release_firmware_codec;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
-		  "using mcu firmware version '%s'\n", info->version);
+		  "using mcu firmware version '%s'\n", dev->fw_info->version);
 
 	/* Ensure that the mcu is sleeping at the reset vector */
 	err = allegro_mcu_reset(dev);
@@ -3022,7 +3034,7 @@ static void allegro_fw_callback(const struct firmware *fw, void *context)
 	allegro_copy_firmware(dev, fw->data, fw->size);
 	allegro_copy_fw_codec(dev, fw_codec->data, fw_codec->size);
 
-	err = allegro_mcu_hw_init(dev, info);
+	err = allegro_mcu_hw_init(dev, dev->fw_info);
 	if (err) {
 		v4l2_err(&dev->v4l2_dev, "failed to initialize mcu\n");
 		goto err_free_fw_codec;
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index 397622973c19..c095dbfcf104 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -20,10 +20,15 @@ enum mcu_msg_type {
 	MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE = 0x000f,
 };
 
+enum mcu_msg_version {
+	MCU_MSG_VERSION_2018_2,
+};
+
 const char *msg_type_name(enum mcu_msg_type type);
 
 struct mcu_msg_header {
 	enum mcu_msg_type type;
+	enum mcu_msg_version version;
 };
 
 struct mcu_msg_init_request {
@@ -40,6 +45,7 @@ struct mcu_msg_init_response {
 };
 
 struct create_channel_param {
+	enum mcu_msg_version version;
 	u16 width;
 	u16 height;
 	u32 format;
-- 
2.20.1

