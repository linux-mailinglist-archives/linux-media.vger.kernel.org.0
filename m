Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00EC317DD32
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgCIKPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:15:05 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46559 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgCIKOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:46 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003mY-Ds; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001lw-PH; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org,
        Javier Martinez Canillas <javierm@redhat.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v12 07/19] partial revert of "[media] tvp5150: add HW input connectors support"
Date:   Mon,  9 Mar 2020 11:14:16 +0100
Message-Id: <20200309101428.15267-8-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Javier Martinez Canillas <javierm@redhat.com>

Commit f7b4b54e6364 ("[media] tvp5150: add HW input connectors support")
added input signals support for the tvp5150, but the approach was found
to be incorrect so the corresponding DT binding commit 82c2ffeb217a
("[media] tvp5150: document input connectors DT bindings") was reverted.

This left the driver with an undocumented (and wrong) DT parsing logic,
so lets get rid of this code as well until the input connectors support
is implemented properly.

It's a partial revert due other patches added on top of mentioned commit
not allowing the commit to be reverted cleanly anymore. But all the code
related to the DT parsing logic and input entities creation are removed.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[m.felsch@pengutronix.de: rm TVP5150_INPUT_NUM define]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 drivers/media/i2c/tvp5150.c         | 145 ----------------------------
 include/dt-bindings/media/tvp5150.h |   2 -
 2 files changed, 147 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index edad49cebcdf..11a5fd7e2f58 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -53,8 +53,6 @@ struct tvp5150 {
 	struct v4l2_subdev sd;
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_pad pads[TVP5150_NUM_PADS];
-	struct media_entity input_ent[TVP5150_INPUT_NUM];
-	struct media_pad input_pad[TVP5150_INPUT_NUM];
 #endif
 	struct v4l2_ctrl_handler hdl;
 	struct v4l2_rect rect;
@@ -1169,40 +1167,6 @@ static int tvp5150_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/****************************************************************************
-			Media entity ops
- ****************************************************************************/
-
-#ifdef CONFIG_MEDIA_CONTROLLER
-static int tvp5150_link_setup(struct media_entity *entity,
-			      const struct media_pad *local,
-			      const struct media_pad *remote, u32 flags)
-{
-	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
-	struct tvp5150 *decoder = to_tvp5150(sd);
-	int i;
-
-	for (i = 0; i < TVP5150_INPUT_NUM; i++) {
-		if (remote->entity == &decoder->input_ent[i])
-			break;
-	}
-
-	/* Do nothing for entities that are not input connectors */
-	if (i == TVP5150_INPUT_NUM)
-		return 0;
-
-	decoder->input = i;
-
-	tvp5150_selmux(sd);
-
-	return 0;
-}
-
-static const struct media_entity_operations tvp5150_sd_media_ops = {
-	.link_setup = tvp5150_link_setup,
-};
-#endif
-
 /****************************************************************************
 			I2C Command
  ****************************************************************************/
@@ -1350,42 +1314,6 @@ static int tvp5150_g_tuner(struct v4l2_subdev *sd, struct v4l2_tuner *vt)
 	return 0;
 }
 
-static int tvp5150_registered(struct v4l2_subdev *sd)
-{
-#ifdef CONFIG_MEDIA_CONTROLLER
-	struct tvp5150 *decoder = to_tvp5150(sd);
-	int ret = 0;
-	int i;
-
-	for (i = 0; i < TVP5150_INPUT_NUM; i++) {
-		struct media_entity *input = &decoder->input_ent[i];
-		struct media_pad *pad = &decoder->input_pad[i];
-
-		if (!input->name)
-			continue;
-
-		decoder->input_pad[i].flags = MEDIA_PAD_FL_SOURCE;
-
-		ret = media_entity_pads_init(input, 1, pad);
-		if (ret < 0)
-			return ret;
-
-		ret = media_device_register_entity(sd->v4l2_dev->mdev, input);
-		if (ret < 0)
-			return ret;
-
-		ret = media_create_pad_link(input, 0, &sd->entity,
-					    TVP5150_PAD_IF_INPUT, 0);
-		if (ret < 0) {
-			media_device_unregister_entity(input);
-			return ret;
-		}
-	}
-#endif
-
-	return 0;
-}
-
 /* ----------------------------------------------------------------------- */
 
 static const struct v4l2_ctrl_ops tvp5150_ctrl_ops = {
@@ -1439,10 +1367,6 @@ static const struct v4l2_subdev_ops tvp5150_ops = {
 	.pad = &tvp5150_pad_ops,
 };
 
-static const struct v4l2_subdev_internal_ops tvp5150_internal_ops = {
-	.registered = tvp5150_registered,
-};
-
 /****************************************************************************
 			I2C Client & Driver
  ****************************************************************************/
@@ -1595,12 +1519,6 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 	struct device_node *ep;
-#ifdef CONFIG_MEDIA_CONTROLLER
-	struct device_node *connectors, *child;
-	struct media_entity *input;
-	const char *name;
-	u32 input_type;
-#endif
 	unsigned int flags;
 	int ret = 0;
 
@@ -1624,67 +1542,6 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 
 	decoder->mbus_type = bus_cfg.bus_type;
 
-#ifdef CONFIG_MEDIA_CONTROLLER
-	connectors = of_get_child_by_name(np, "connectors");
-
-	if (!connectors)
-		goto err;
-
-	for_each_available_child_of_node(connectors, child) {
-		ret = of_property_read_u32(child, "input", &input_type);
-		if (ret) {
-			dev_err(decoder->sd.dev,
-				 "missing type property in node %pOFn\n",
-				 child);
-			of_node_put(child);
-			goto err_connector;
-		}
-
-		if (input_type >= TVP5150_INPUT_NUM) {
-			ret = -EINVAL;
-			of_node_put(child);
-			goto err_connector;
-		}
-
-		input = &decoder->input_ent[input_type];
-
-		/* Each input connector can only be defined once */
-		if (input->name) {
-			dev_err(decoder->sd.dev,
-				 "input %s with same type already exists\n",
-				 input->name);
-			of_node_put(child);
-			ret = -EINVAL;
-			goto err_connector;
-		}
-
-		switch (input_type) {
-		case TVP5150_COMPOSITE0:
-		case TVP5150_COMPOSITE1:
-			input->function = MEDIA_ENT_F_CONN_COMPOSITE;
-			break;
-		case TVP5150_SVIDEO:
-			input->function = MEDIA_ENT_F_CONN_SVIDEO;
-			break;
-		}
-
-		input->flags = MEDIA_ENT_FL_CONNECTOR;
-
-		ret = of_property_read_string(child, "label", &name);
-		if (ret < 0) {
-			dev_err(decoder->sd.dev,
-				 "missing label property in node %pOFn\n",
-				 child);
-			of_node_put(child);
-			goto err_connector;
-		}
-
-		input->name = name;
-	}
-
-err_connector:
-	of_node_put(connectors);
-#endif
 err:
 	of_node_put(ep);
 	return ret;
@@ -1735,7 +1592,6 @@ static int tvp5150_probe(struct i2c_client *c)
 	}
 
 	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
-	sd->internal_ops = &tvp5150_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 #if defined(CONFIG_MEDIA_CONTROLLER)
@@ -1750,7 +1606,6 @@ static int tvp5150_probe(struct i2c_client *c)
 	if (res < 0)
 		return res;
 
-	sd->entity.ops = &tvp5150_sd_media_ops;
 #endif
 
 	res = tvp5150_detect_version(core);
diff --git a/include/dt-bindings/media/tvp5150.h b/include/dt-bindings/media/tvp5150.h
index 01eedf4985b8..dda00c038530 100644
--- a/include/dt-bindings/media/tvp5150.h
+++ b/include/dt-bindings/media/tvp5150.h
@@ -14,8 +14,6 @@
 #define TVP5150_COMPOSITE1 1
 #define TVP5150_SVIDEO     2
 
-#define TVP5150_INPUT_NUM  3
-
 /* TVP5150 HW outputs */
 #define TVP5150_NORMAL       0
 #define TVP5150_BLACK_SCREEN 1
-- 
2.20.1

