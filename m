Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59FD1FCCB7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 13:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgFQLp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 07:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgFQLpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 07:45:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBACC06174E
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 04:45:55 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVt-0002WZ-7M; Wed, 17 Jun 2020 13:45:53 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVs-0000rU-F9; Wed, 17 Jun 2020 13:45:52 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 08/12] media: allegro: add config blob for channel
Date:   Wed, 17 Jun 2020 13:45:46 +0200
Message-Id: <20200617114550.3235-9-m.tretter@pengutronix.de>
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

Firmware versions >= 2019.2 do not configure the channel via the mailbox
interface anymore, but use a separate chunk of memory that is only
referenced by the message. As the configuration must be in a format that
is understood by the firmware and this format can change between
firmware versions, handle it similar to the message and treat is as a
blob.

In order to support both methods in the driver, always use a separate
blob for the channel configuration and copy that blob into the mailbox
if the firmware requires it and otherwise reference it.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  | 20 ++++++++++++++++++-
 .../staging/media/allegro-dvt/allegro-mail.c  | 17 ++++++++++------
 .../staging/media/allegro-dvt/allegro-mail.h  |  9 ++++++++-
 3 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 2ed541b0ed15..44086712e61d 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -206,6 +206,8 @@ struct allegro_channel {
 	unsigned int cpb_size;
 	unsigned int gop_size;
 
+	struct allegro_buffer config_blob;
+
 	struct v4l2_ctrl *mpeg_video_h264_profile;
 	struct v4l2_ctrl *mpeg_video_h264_level;
 	struct v4l2_ctrl *mpeg_video_h264_i_frame_qp;
@@ -982,6 +984,14 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 					   struct allegro_channel *channel)
 {
 	struct mcu_msg_create_channel msg;
+	struct allegro_buffer *blob = &channel->config_blob;
+	struct create_channel_param param;
+	size_t size;
+
+	memset(&param, 0, sizeof(param));
+	fill_create_channel_param(channel, &param);
+	allegro_alloc_buffer(dev, blob, sizeof(struct create_channel_param));
+	size = allegro_encode_config_blob(blob->vaddr, &param);
 
 	memset(&msg, 0, sizeof(msg));
 
@@ -990,7 +1000,9 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 
 	msg.user_id = channel->user_id;
 
-	fill_create_channel_param(channel, &msg.param);
+	msg.blob = blob->vaddr;
+	msg.blob_size = size;
+	msg.blob_mcu_addr = to_mcu_addr(dev, blob->paddr);
 
 	allegro_mbox_send(dev->mbox_command, &msg);
 
@@ -1600,6 +1612,7 @@ allegro_handle_create_channel(struct allegro_dev *dev,
 {
 	struct allegro_channel *channel;
 	int err = 0;
+	struct create_channel_param param;
 
 	channel = allegro_find_channel_by_user_id(dev, msg->user_id);
 	if (IS_ERR(channel)) {
@@ -1625,6 +1638,11 @@ allegro_handle_create_channel(struct allegro_dev *dev,
 		 "user %d: channel has channel id %d\n",
 		 channel->user_id, channel->mcu_channel_id);
 
+	err = allegro_decode_config_blob(&param, msg, channel->config_blob.vaddr);
+	allegro_free_buffer(channel->dev, &channel->config_blob);
+	if (err)
+		goto out;
+
 	v4l2_dbg(1, debug, &dev->v4l2_dev,
 		 "channel %d: intermediate buffers: %d x %d bytes\n",
 		 channel->mcu_channel_id,
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index 7121f128aff3..746e70d5ad66 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -65,8 +65,8 @@ static inline u32 settings_get_mcu_codec(struct create_channel_param *param)
 	}
 }
 
-static ssize_t
-allegro_encode_channel_config(u32 *dst, struct create_channel_param *param)
+ssize_t
+allegro_encode_config_blob(u32 *dst, struct create_channel_param *param)
 {
 	unsigned int i = 0;
 	u32 val;
@@ -158,18 +158,23 @@ allegro_encode_channel_config(u32 *dst, struct create_channel_param *param)
 static ssize_t
 allegro_enc_create_channel(u32 *dst, struct mcu_msg_create_channel *msg)
 {
-	struct create_channel_param *param = &msg->param;
-	ssize_t size = 0;
 	unsigned int i = 0;
 
 	dst[i++] = msg->user_id;
 
-	size = allegro_encode_channel_config(&dst[i], param);
-	i += size / sizeof(*dst);
+	memcpy(&dst[i], msg->blob, msg->blob_size);
+	i += msg->blob_size / sizeof(*dst);
 
 	return i * sizeof(*dst);
 }
 
+ssize_t allegro_decode_config_blob(struct create_channel_param *param,
+				   struct mcu_msg_create_channel_response *msg,
+				   u32 *src)
+{
+	return 0;
+}
+
 static ssize_t
 allegro_enc_destroy_channel(u32 *dst, struct mcu_msg_destroy_channel *msg)
 {
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index 239fd8a20a69..07ed0a8d3de3 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -116,7 +116,9 @@ struct create_channel_param {
 struct mcu_msg_create_channel {
 	struct mcu_msg_header header;
 	u32 user_id;
-	struct create_channel_param param;
+	u32 *blob;
+	size_t blob_size;
+	u32 blob_mcu_addr;
 };
 
 struct mcu_msg_create_channel_response {
@@ -249,6 +251,11 @@ union mcu_msg_response {
 	struct mcu_msg_encode_frame_response encode_frame;
 };
 
+ssize_t allegro_encode_config_blob(u32 *dst, struct create_channel_param *param);
+ssize_t allegro_decode_config_blob(struct create_channel_param *param,
+				   struct mcu_msg_create_channel_response *msg,
+				   u32 *src);
+
 int allegro_decode_mail(void *msg, u32 *src);
 ssize_t allegro_encode_mail(u32 *dst, void *msg);
 
-- 
2.20.1

