Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABA357DA58
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 08:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbiGVGez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 02:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbiGVGex (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 02:34:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFF067593
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 23:34:52 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA88E80A;
        Fri, 22 Jul 2022 08:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658471691;
        bh=dIc2wdnvt/KLtV1ttJfcPZh+XjQa655XRdnHvBLUfK0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GBe05GCluIxxAdb9ldw2+8cdHB/QVVWb8bqINs/GqIDZRQN5ViM1+UNNw0irx7M6V
         ULKO4TL7jP86kcaQ9SukyZ8LaRsDTY6GtjLuEXuPcH8LtZQ2FTJvdswvUtW9IuWTf0
         BbcT9O8GDl6pacYHHl+Qw+LYCH2LmbFE8fPPF49g=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 2/5] media: ti: cal: rename sd_state to state
Date:   Fri, 22 Jul 2022 09:34:21 +0300
Message-Id: <20220722063424.174288-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220722063424.174288-1-tomi.valkeinen@ideasonboard.com>
References: <20220722063424.174288-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename sd_state variable to state.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 30 ++++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index e69fed117fea..6faf716c7814 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -622,12 +622,12 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
 
 static struct v4l2_mbus_framefmt *
 cal_camerarx_get_pad_format(struct cal_camerarx *phy,
-			    struct v4l2_subdev_state *sd_state,
+			    struct v4l2_subdev_state *state,
 			    unsigned int pad, u32 which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&phy->subdev, sd_state, pad);
+		return v4l2_subdev_get_try_format(&phy->subdev, state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &phy->formats[pad];
 	default:
@@ -653,7 +653,7 @@ static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
-					  struct v4l2_subdev_state *sd_state,
+					  struct v4l2_subdev_state *state,
 					  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -670,7 +670,7 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 			goto out;
 		}
 
-		fmt = cal_camerarx_get_pad_format(phy, sd_state,
+		fmt = cal_camerarx_get_pad_format(phy, state,
 						  CAL_CAMERARX_PAD_SINK,
 						  code->which);
 		code->code = fmt->code;
@@ -690,7 +690,7 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
-					   struct v4l2_subdev_state *sd_state,
+					   struct v4l2_subdev_state *state,
 					   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -706,7 +706,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 	if (cal_rx_pad_is_source(fse->pad)) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = cal_camerarx_get_pad_format(phy, sd_state,
+		fmt = cal_camerarx_get_pad_format(phy, state,
 						  CAL_CAMERARX_PAD_SINK,
 						  fse->which);
 		if (fse->code != fmt->code) {
@@ -738,7 +738,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -746,7 +746,7 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&phy->mutex);
 
-	fmt = cal_camerarx_get_pad_format(phy, sd_state, format->pad,
+	fmt = cal_camerarx_get_pad_format(phy, state, format->pad,
 					  format->which);
 	format->format = *fmt;
 
@@ -756,7 +756,7 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -766,7 +766,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
 	/* No transcoding, source and sink formats must match. */
 	if (cal_rx_pad_is_source(format->pad))
-		return cal_camerarx_sd_get_fmt(sd, sd_state, format);
+		return cal_camerarx_sd_get_fmt(sd, state, format);
 
 	/*
 	 * Default to the first format if the requested media bus code isn't
@@ -792,12 +792,12 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&phy->mutex);
 
-	fmt = cal_camerarx_get_pad_format(phy, sd_state,
+	fmt = cal_camerarx_get_pad_format(phy, state,
 					  CAL_CAMERARX_PAD_SINK,
 					  format->which);
 	*fmt = format->format;
 
-	fmt = cal_camerarx_get_pad_format(phy, sd_state,
+	fmt = cal_camerarx_get_pad_format(phy, state,
 					  CAL_CAMERARX_PAD_FIRST_SOURCE,
 					  format->which);
 	*fmt = format->format;
@@ -808,10 +808,10 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *sd_state)
+				    struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_format format = {
-		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
+		.which = state ? V4L2_SUBDEV_FORMAT_TRY
 		: V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = CAL_CAMERARX_PAD_SINK,
 		.format = {
@@ -826,7 +826,7 @@ static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
 		},
 	};
 
-	return cal_camerarx_sd_set_fmt(sd, sd_state, &format);
+	return cal_camerarx_sd_set_fmt(sd, state, &format);
 }
 
 static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
-- 
2.34.1

