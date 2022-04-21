Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D06450A29D
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbiDUOiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 10:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389477AbiDUOhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 10:37:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E2021160
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:35:04 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB91D596;
        Thu, 21 Apr 2022 16:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650551701;
        bh=kjSvASw4zprC5DZZwbbShLq1bcs0Emx5QSilqnCXyeY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UETUyVsP3vNj9QknbuREqhJKzrSAYIxsiv5RSByXgWULlV+EaWUm3QYzfek8gKZIB
         vjaTJvYd1PeQd7ppXYHhzZGThGZ5TUZZHarzaM2S8zrq6TcqVkUTlc6OfYKV5/dxA8
         UacC3LFGx+TgE3MrwLNRA274pE7MthaonQFSWeTE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 3/6] media: ti: cal: rename sd_state to state
Date:   Thu, 21 Apr 2022 17:34:46 +0300
Message-Id: <20220421143449.552312-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
References: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 30 ++++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index a41941fa819a..34b8542133b6 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -595,12 +595,12 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
 
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
@@ -626,7 +626,7 @@ static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
-					  struct v4l2_subdev_state *sd_state,
+					  struct v4l2_subdev_state *state,
 					  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -643,7 +643,7 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 			goto out;
 		}
 
-		fmt = cal_camerarx_get_pad_format(phy, sd_state,
+		fmt = cal_camerarx_get_pad_format(phy, state,
 						  CAL_CAMERARX_PAD_SINK,
 						  code->which);
 		code->code = fmt->code;
@@ -663,7 +663,7 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
-					   struct v4l2_subdev_state *sd_state,
+					   struct v4l2_subdev_state *state,
 					   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -679,7 +679,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 	if (cal_rx_pad_is_source(fse->pad)) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = cal_camerarx_get_pad_format(phy, sd_state,
+		fmt = cal_camerarx_get_pad_format(phy, state,
 						  CAL_CAMERARX_PAD_SINK,
 						  fse->which);
 		if (fse->code != fmt->code) {
@@ -711,7 +711,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -719,7 +719,7 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&phy->mutex);
 
-	fmt = cal_camerarx_get_pad_format(phy, sd_state, format->pad,
+	fmt = cal_camerarx_get_pad_format(phy, state, format->pad,
 					  format->which);
 	format->format = *fmt;
 
@@ -729,7 +729,7 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -739,7 +739,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
 	/* No transcoding, source and sink formats must match. */
 	if (cal_rx_pad_is_source(format->pad))
-		return cal_camerarx_sd_get_fmt(sd, sd_state, format);
+		return cal_camerarx_sd_get_fmt(sd, state, format);
 
 	/*
 	 * Default to the first format if the requested media bus code isn't
@@ -765,12 +765,12 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
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
@@ -781,10 +781,10 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
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
@@ -799,7 +799,7 @@ static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
 		},
 	};
 
-	return cal_camerarx_sd_set_fmt(sd, sd_state, &format);
+	return cal_camerarx_sd_set_fmt(sd, state, &format);
 }
 
 static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
-- 
2.25.1

