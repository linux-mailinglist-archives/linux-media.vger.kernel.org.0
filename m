Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 418A265D93D
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 17:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239604AbjADQWu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 11:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239762AbjADQWX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 11:22:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939B942E25
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 08:22:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A6431267;
        Wed,  4 Jan 2023 17:22:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672849340;
        bh=KLRC4QYHx/r9pTSHoWepNKsOHI5RKeqI2tOOleyWLFU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nwxp1P+JtAxwIUfjwQar8rRymHo18GsqclY4qomRYhpl+iMRsMYMYFTQZ3ID0zaB0
         aDLDxM4c43T3k+gKmzg1xqSWHcJE/0zZ1cTwl2FWb3+P3URoXVdAVuquot+CDi3+DP
         qM36NDuneYb3a/an8ucglRM2PCCBexD7saV6Z4Us=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-sunxi@lists.linux.dev, Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH v1 1/2] media: sun6i-csi: capture: Use subdev operation to access bridge format
Date:   Wed,  4 Jan 2023 18:22:14 +0200
Message-Id: <20230104162215.31194-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
References: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
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

Replace the sun6i_csi_bridge helper functions sun6i_csi_bridge_format()
and sun6i_csi_bridge_dimensions() that access the bridge fields from the
capture side with usage of the subdev .get_fmt() operation. This
decouples the bridge and capture side better by using abstractions
provided by the V4L2 subdev API, and prepares for usage of the subdev
active state in the bridge.

The sun6i_csi_bridge_dimensions() helper is now unused and is removed.
The sun6i_csi_bridge_format() helper will be removed in a subsequent
change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 13 ++---------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |  7 ------
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 23 ++++++++++++-------
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index 4db950973ce2..a149a0d4e601 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -15,17 +15,8 @@
 
 /* Helpers */
 
-void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
-				 unsigned int *width, unsigned int *height)
-{
-	if (width)
-		*width = csi_dev->bridge.mbus_format.width;
-	if (height)
-		*height = csi_dev->bridge.mbus_format.height;
-}
-
-void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
-			     u32 *mbus_code, u32 *field)
+static void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
+				    u32 *mbus_code, u32 *field)
 {
 	if (mbus_code)
 		*mbus_code = csi_dev->bridge.mbus_format.code;
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
index ee592a14b9c5..b827ab1be011 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
@@ -49,13 +49,6 @@ struct sun6i_csi_bridge {
 	struct sun6i_csi_bridge_source	source_mipi_csi2;
 };
 
-/* Helpers */
-
-void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
-				 unsigned int *width, unsigned int *height);
-void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
-			     u32 *mbus_code, u32 *field);
-
 /* Format */
 
 const struct sun6i_csi_bridge_format *
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index cf6aadbc130b..03d4adec054c 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -893,11 +893,14 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	const struct sun6i_csi_capture_format *capture_format;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	unsigned int capture_width, capture_height;
-	unsigned int bridge_width, bridge_height;
 	const struct v4l2_format_info *format_info;
 	u32 pixelformat, capture_field;
-	u32 mbus_code, bridge_field;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = SUN6I_CSI_BRIDGE_PAD_SOURCE,
+	};
 	bool match;
+	int ret;
 
 	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
 
@@ -906,18 +909,21 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	if (WARN_ON(!capture_format))
 		return -EINVAL;
 
-	sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_height);
+	ret = v4l2_subdev_call_state_active(&csi_dev->bridge.subdev, pad,
+					    get_fmt, &fmt);
+	if (ret)
+		return ret;
 
-	sun6i_csi_bridge_format(csi_dev, &mbus_code, &bridge_field);
-	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	bridge_format = sun6i_csi_bridge_format_find(fmt.format.code);
 	if (WARN_ON(!bridge_format))
 		return -EINVAL;
 
 	/* No cropping/scaling is supported. */
-	if (capture_width != bridge_width || capture_height != bridge_height) {
+	if (capture_width != fmt.format.width ||
+	    capture_height != fmt.format.height) {
 		v4l2_err(v4l2_dev,
 			 "invalid input/output dimensions: %ux%u/%ux%u\n",
-			 bridge_width, bridge_height, capture_width,
+			 fmt.format.width, fmt.format.height, capture_width,
 			 capture_height);
 		return -EINVAL;
 	}
@@ -949,7 +955,8 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	/* With raw input mode, we need a 1:1 match between input and output. */
 	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
 	    capture_format->input_format_raw) {
-		match = sun6i_csi_capture_format_match(pixelformat, mbus_code);
+		match = sun6i_csi_capture_format_match(pixelformat,
+						       fmt.format.code);
 		if (!match)
 			goto invalid;
 	}
-- 
Regards,

Laurent Pinchart

