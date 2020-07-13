Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B35421D8C5
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 16:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbgGMOmi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 10:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729982AbgGMOme (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 10:42:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717B9C061755
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 07:42:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf5-0001mU-IM; Mon, 13 Jul 2020 16:42:31 +0200
Received: from mtr by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf4-0007rk-Lu; Mon, 13 Jul 2020 16:42:30 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 07/12] media: allegro: encode bit fields separately
Date:   Mon, 13 Jul 2020 16:42:24 +0200
Message-Id: <20200713144229.30057-8-m.tretter@pengutronix.de>
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

Even bits in bitfields do not keep their position, but move around or
move to other bitfields. Therefore, the driver has to handle bitfields
differently depending on the firmware version.

Create separate fields for the options that have been in bitfields and
handle the bitfields when encoding the message.

As a side effect, this makes the messages a bit more readable.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  | 15 ++++++---
 .../staging/media/allegro-dvt/allegro-mail.c  | 22 +++++++++++--
 .../staging/media/allegro-dvt/allegro-mail.h  | 32 +++++--------------
 3 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 1bbb44140a6c..e6d64151e4fe 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -913,10 +913,17 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->codec = channel->codec;
 	param->level = v4l2_level_to_mcu_level(channel->level);
 	param->tier = 0;
-	param->sps_param = BIT(20) | 0x4a;
-	param->pps_param = BIT(2);
-	param->enc_option = AL_OPT_RDO_COST_MODE | AL_OPT_LF_X_TILE |
-			    AL_OPT_LF_X_SLICE | AL_OPT_LF;
+
+	param->log2_max_poc = 10;
+	param->log2_max_frame_num = 4;
+	param->temporal_mvp_enable = 1;
+
+	param->dbf_ovr_en = 1;
+	param->rdo_cost_mode = 1;
+	param->lf = 1;
+	param->lf_x_tile = 1;
+	param->lf_x_slice = 1;
+
 	param->beta_offset = -1;
 	param->tc_offset = -1;
 	param->num_slices = 1;
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index ce183bd2495b..7121f128aff3 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -69,6 +69,7 @@ static ssize_t
 allegro_encode_channel_config(u32 *dst, struct create_channel_param *param)
 {
 	unsigned int i = 0;
+	u32 val;
 	unsigned int codec = settings_get_mcu_codec(param);
 
 	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->height) |
@@ -81,9 +82,24 @@ allegro_encode_channel_config(u32 *dst, struct create_channel_param *param)
 		   FIELD_PREP(GENMASK(7, 0), param->profile);
 	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->tier) |
 		   FIELD_PREP(GENMASK(15, 0), param->level);
-	dst[i++] = param->sps_param;
-	dst[i++] = param->pps_param;
-	dst[i++] = param->enc_option;
+
+	val = 0;
+	val |= param->temporal_mvp_enable ? BIT(20) : 0;
+	val |= FIELD_PREP(GENMASK(7, 4), param->log2_max_frame_num) |
+	       FIELD_PREP(GENMASK(3, 0), param->log2_max_poc);
+	dst[i++] = val;
+
+	val = 0;
+	val |= param->dbf_ovr_en ? BIT(2) : 0;
+	dst[i++] = val;
+
+	val = 0;
+	val |= param->lf ? BIT(2) : 0;
+	val |= param->lf_x_tile ? BIT(3) : 0;
+	val |= param->lf_x_slice ? BIT(4) : 0;
+	val |= param->rdo_cost_mode ? BIT(20) : 0;
+	dst[i++] = val;
+
 	dst[i++] = FIELD_PREP(GENMASK(15, 8), param->beta_offset) |
 		   FIELD_PREP(GENMASK(7, 0), param->tc_offset);
 	dst[i++] = param->unknown11;
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index a92a27e270b5..239fd8a20a69 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -51,30 +51,14 @@ struct create_channel_param {
 	u32 codec;
 	u16 level;
 	u16 tier;
-	u32 sps_param;
-	u32 pps_param;
-
-	u32 enc_option;
-#define AL_OPT_WPP			BIT(0)
-#define AL_OPT_TILE			BIT(1)
-#define AL_OPT_LF			BIT(2)
-#define AL_OPT_LF_X_SLICE		BIT(3)
-#define AL_OPT_LF_X_TILE		BIT(4)
-#define AL_OPT_SCL_LST			BIT(5)
-#define AL_OPT_CONST_INTRA_PRED		BIT(6)
-#define AL_OPT_QP_TAB_RELATIVE		BIT(7)
-#define AL_OPT_FIX_PREDICTOR		BIT(8)
-#define AL_OPT_CUSTOM_LDA		BIT(9)
-#define AL_OPT_ENABLE_AUTO_QP		BIT(10)
-#define AL_OPT_ADAPT_AUTO_QP		BIT(11)
-#define AL_OPT_TRANSFO_SKIP		BIT(13)
-#define AL_OPT_FORCE_REC		BIT(15)
-#define AL_OPT_FORCE_MV_OUT		BIT(16)
-#define AL_OPT_FORCE_MV_CLIP		BIT(17)
-#define AL_OPT_LOWLAT_SYNC		BIT(18)
-#define AL_OPT_LOWLAT_INT		BIT(19)
-#define AL_OPT_RDO_COST_MODE		BIT(20)
-
+	u32 log2_max_poc;
+	u32 log2_max_frame_num;
+	u32 temporal_mvp_enable;
+	u32 dbf_ovr_en;
+	u32 rdo_cost_mode;
+	u32 lf;
+	u32 lf_x_tile;
+	u32 lf_x_slice;
 	s8 beta_offset;
 	s8 tc_offset;
 	u16 reserved10;
-- 
2.20.1

