Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87F121D8C6
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 16:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730032AbgGMOmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 10:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729878AbgGMOmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 10:42:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5351CC08C5DF
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 07:42:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf5-0001mT-Ep; Mon, 13 Jul 2020 16:42:31 +0200
Received: from mtr by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf4-0007rf-LS; Mon, 13 Jul 2020 16:42:30 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 06/12] media: allegro: support handling firmware dependent values
Date:   Mon, 13 Jul 2020 16:42:23 +0200
Message-Id: <20200713144229.30057-7-m.tretter@pengutronix.de>
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

Like the message format, also the identifiers in the messages differ
between firmware versions. This especially affects the identifier for
the codec that shall be used. As the messages used by the driver are now
independent from the firmware, we can use the values defined by V4L2 as
identifiers in the messages.

Convert the V4L2 codec format to the respective firmware value when
encoding the messages to binary format instead beforehand.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 11 +----------
 drivers/staging/media/allegro-dvt/allegro-mail.c | 15 ++++++++++++++-
 drivers/staging/media/allegro-dvt/allegro-mail.h |  2 +-
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 6745a5fa1167..1bbb44140a6c 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -812,15 +812,6 @@ static u32 v4l2_colorspace_to_mcu_colorspace(enum v4l2_colorspace colorspace)
 	}
 }
 
-static s8 v4l2_pixelformat_to_mcu_codec(u32 pixelformat)
-{
-	switch (pixelformat) {
-	case V4L2_PIX_FMT_H264:
-	default:
-		return 1;
-	}
-}
-
 static u8 v4l2_profile_to_mcu_profile(enum v4l2_mpeg_video_h264_profile profile)
 {
 	switch (profile) {
@@ -919,7 +910,7 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->src_mode = 0x0;
 	param->profile = v4l2_profile_to_mcu_profile(channel->profile);
 	param->constraint_set_flags = BIT(1);
-	param->codec = v4l2_pixelformat_to_mcu_codec(channel->codec);
+	param->codec = channel->codec;
 	param->level = v4l2_level_to_mcu_level(channel->level);
 	param->tier = 0;
 	param->sps_param = BIT(20) | 0x4a;
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index ba1c3bc587c6..ce183bd2495b 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -9,6 +9,7 @@
 #include <linux/bitfield.h>
 #include <linux/export.h>
 #include <linux/errno.h>
+#include <linux/videodev2.h>
 
 #include "allegro-mail.h"
 
@@ -53,17 +54,29 @@ allegro_enc_init(u32 *dst, struct mcu_msg_init_request *msg)
 	return i * sizeof(*dst);
 }
 
+static inline u32 settings_get_mcu_codec(struct create_channel_param *param)
+{
+	u32 pixelformat = param->codec;
+
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_H264:
+	default:
+		return 1;
+	}
+}
+
 static ssize_t
 allegro_encode_channel_config(u32 *dst, struct create_channel_param *param)
 {
 	unsigned int i = 0;
+	unsigned int codec = settings_get_mcu_codec(param);
 
 	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->height) |
 		   FIELD_PREP(GENMASK(15, 0), param->width);
 	dst[i++] = param->format;
 	dst[i++] = param->colorspace;
 	dst[i++] = param->src_mode;
-	dst[i++] = FIELD_PREP(GENMASK(31, 24), param->codec) |
+	dst[i++] = FIELD_PREP(GENMASK(31, 24), codec) |
 		   FIELD_PREP(GENMASK(23, 8), param->constraint_set_flags) |
 		   FIELD_PREP(GENMASK(7, 0), param->profile);
 	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->tier) |
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index ae81e94a2f2c..a92a27e270b5 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -48,7 +48,7 @@ struct create_channel_param {
 	u32 src_mode;
 	u8 profile;
 	u16 constraint_set_flags;
-	s8 codec;
+	u32 codec;
 	u16 level;
 	u16 tier;
 	u32 sps_param;
-- 
2.20.1

