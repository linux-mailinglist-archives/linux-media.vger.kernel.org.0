Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBC44C1612
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 16:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241880AbiBWPD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 10:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241878AbiBWPD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 10:03:56 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2816C90CC4
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 07:03:28 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 277C3E000D;
        Wed, 23 Feb 2022 15:03:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 21/27] media: ov5640: Register device properties
Date:   Wed, 23 Feb 2022 15:55:57 +0100
Message-Id: <20220223145603.121603-22-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220223145603.121603-1-jacopo@jmondi.org>
References: <20220223145603.121603-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parse the device properties and register the rotation and orientation
V4L2 controls using v4l2_ctrl_new_fwnode_properties().

Remove the open-coded parsing of the rotation property and assume the
DTS is correct is providing either <0> or <180> as possible rotations.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 178e203bfcca..3c1f45610e77 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3322,6 +3322,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
 	struct ov5640_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct v4l2_fwnode_device_properties props;
 	const struct ov5640_timings *timings;
 	unsigned int max_vblank;
 	unsigned int hblank;
@@ -3401,6 +3402,17 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 		goto free_ctrls;
 	}
 
+	ret = v4l2_fwnode_device_parse(&sensor->i2c_client->dev, &props);
+	if (ret)
+		goto free_ctrls;
+
+	if (props.rotation == 180)
+		sensor->upside_down = true;
+
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
+	if (ret)
+		goto free_ctrls;
+
 	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -3669,7 +3681,6 @@ static int ov5640_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct fwnode_handle *endpoint;
 	struct ov5640_dev *sensor;
-	u32 rotation;
 	int ret;
 
 	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
@@ -3692,22 +3703,6 @@ static int ov5640_probe(struct i2c_client *client)
 
 	sensor->ae_target = 52;
 
-	/* optional indication of physical rotation of sensor */
-	ret = fwnode_property_read_u32(dev_fwnode(&client->dev), "rotation",
-				       &rotation);
-	if (!ret) {
-		switch (rotation) {
-		case 180:
-			sensor->upside_down = true;
-			fallthrough;
-		case 0:
-			break;
-		default:
-			dev_warn(dev, "%u degrees rotation is not supported, ignoring...\n",
-				 rotation);
-		}
-	}
-
 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
 						  NULL);
 	if (!endpoint) {
-- 
2.35.0

