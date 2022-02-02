Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955364A7742
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 18:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346439AbiBBR5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 12:57:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58274 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346465AbiBBR5W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 12:57:22 -0500
Received: from tatooine.ideasonboard.com (unknown [IPv6:2a01:e0a:169:7140:7139:eada:2ff6:73dd])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DA451516;
        Wed,  2 Feb 2022 18:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643824612;
        bh=xQPdfOYaPqm5LqRMzUqsI7qdKioFoUN0FG/TD8WEU2o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G5KX6yrXPzdAIFrb7CNQGEY8635x+qP6AmlCWP2x20Vok6TPq6ZekkWd0FBry+PGM
         EVtEu4YTftoy/ILQ5yQIdtWi+r7H5Qfjzm+nHM7KQgs92v7vok8ImgLapxPFH3qOcj
         952XaaNXzsWThRiXmbYpJRuVffoaIeg0DlNyndzw=
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
To:     jeanmichel.hautbois@ideasonboard.com
Cc:     dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org,
        kernel-list@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        lukasz@jany.st, mchehab@kernel.org, naush@raspberrypi.com,
        robh@kernel.org, tomi.valkeinen@ideasonboard.com
Subject: [RFC PATCH v3 08/11] media: imx219: Introduce the set_routing operation
Date:   Wed,  2 Feb 2022 18:56:36 +0100
Message-Id: <20220202175639.149681-9-jeanmichel.hautbois@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220202175639.149681-1-jeanmichel.hautbois@ideasonboard.com>
References: <20220202175639.149681-1-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we want to use multiplexed streams API, we need to be able to set the
pad routing. Introduce the set_routing operation.

As this operation is required for a multiplexed able sensor, add the
V4L2_SUBDEV_FL_MULTIPLEXED flag.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index b68d35046725..7d29cf2b06f8 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -817,6 +817,25 @@ static int _imx219_set_routing(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      enum v4l2_subdev_format_whence which,
+			      struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	if (routing->num_routes == 0 || routing->num_routes > 2)
+		return -EINVAL;
+
+	v4l2_subdev_lock_state(state);
+
+	ret = _imx219_set_routing(sd, state);
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
 static int imx219_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state)
 {
@@ -1289,6 +1308,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.get_fmt		= imx219_get_pad_format,
 	.set_fmt		= imx219_set_pad_format,
 	.get_selection		= imx219_get_selection,
+	.set_routing		= imx219_set_routing,
 	.enum_frame_size	= imx219_enum_frame_size,
 };
 
@@ -1547,7 +1567,8 @@ static int imx219_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			    V4L2_SUBDEV_FL_HAS_EVENTS;
+			    V4L2_SUBDEV_FL_HAS_EVENTS |
+			    V4L2_SUBDEV_FL_MULTIPLEXED;
 	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	/* Initialize source pad */
-- 
2.32.0

