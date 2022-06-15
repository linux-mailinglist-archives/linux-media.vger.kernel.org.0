Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 411AF54CC76
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346897AbiFOPPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbiFOPPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:15:30 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D182E6BC
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:15:28 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 51A0D240009;
        Wed, 15 Jun 2022 15:15:25 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     dave.stevenson@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, david.plowman@raspberrypi.com,
        laurent.pinchart@ideasonboard.com,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/5] media: ov5647: Parse and register properties
Date:   Wed, 15 Jun 2022 17:14:53 +0200
Message-Id: <20220615151457.415038-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615151457.415038-1-jacopo@jmondi.org>
References: <20220615151457.415038-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Parse device properties and register controls for them using the V4L2
fwnode properties helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[increase number of controls reserved in the handler]
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index d346d18ce629..98b72094ef68 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1265,12 +1265,13 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
 	.s_ctrl = ov5647_s_ctrl,
 };
 
-static int ov5647_init_controls(struct ov5647 *sensor)
+static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	int hblank, exposure_max, exposure_def;
+	struct v4l2_fwnode_device_properties props;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 8);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 10);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1314,6 +1315,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 					   sensor->mode->vts -
 					   sensor->mode->format.height);
 
+	v4l2_fwnode_device_parse(dev, &props);
+
+	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
+					&props);
+
 	if (sensor->ctrls.error)
 		goto handler_free;
 
@@ -1400,7 +1406,7 @@ static int ov5647_probe(struct i2c_client *client)
 
 	sensor->mode = OV5647_DEFAULT_MODE;
 
-	ret = ov5647_init_controls(sensor);
+	ret = ov5647_init_controls(sensor, dev);
 	if (ret)
 		goto mutex_destroy;
 
-- 
2.35.1

