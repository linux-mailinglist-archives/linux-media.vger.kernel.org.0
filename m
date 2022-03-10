Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4135E4D47BE
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242290AbiCJNJw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:09:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbiCJNJv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:09:51 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0F046642
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 05:08:50 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A079520012;
        Thu, 10 Mar 2022 13:08:47 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH 3/6] media: i2c: ov5670: Probe regulators
Date:   Thu, 10 Mar 2022 14:08:26 +0100
Message-Id: <20220310130829.96001-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310130829.96001-1-jacopo@jmondi.org>
References: <20220310130829.96001-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OV5670 has three power supplies (AVDD, DOVDD and DVDD).

Probe them in the driver to prepare controlling with runtime_pm
operations.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 39786f3c9489..cba310aec011 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -85,6 +86,14 @@ struct ov5670_link_freq_config {
 	const struct ov5670_reg_list reg_list;
 };
 
+static const char * const ov5670_supply_names[] = {
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital power */
+	"dovdd",	/* Digital output power */
+};
+
+#define OV5670_NUM_SUPPLIES ARRAY_SIZE(ov5670_supply_names)
+
 struct ov5670_mode {
 	/* Frame width in pixels */
 	u32 width;
@@ -1830,6 +1839,9 @@ struct ov5670 {
 	/* Current mode */
 	const struct ov5670_mode *cur_mode;
 
+	/* Regulators */
+	struct regulator_bulk_data supplies[OV5670_NUM_SUPPLIES];
+
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
@@ -2470,6 +2482,18 @@ static const struct v4l2_subdev_internal_ops ov5670_internal_ops = {
 	.open = ov5670_open,
 };
 
+static int ov5670_regulators_probe(struct ov5670 *ov5670)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
+	unsigned int i;
+
+	for (i = 0; i < OV5670_NUM_SUPPLIES; i++)
+		ov5670->supplies[i].supply = ov5670_supply_names[i];
+
+	return devm_regulator_bulk_get(&client->dev, OV5670_NUM_SUPPLIES,
+				       ov5670->supplies);
+}
+
 static int ov5670_probe(struct i2c_client *client)
 {
 	struct ov5670 *ov5670;
@@ -2492,6 +2516,12 @@ static int ov5670_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
 
+	ret = ov5670_regulators_probe(ov5670);
+	if (ret) {
+		err_msg = "Regulators probe failed";
+		goto error_print;
+	}
+
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		/* Check module identity */
-- 
2.35.1

