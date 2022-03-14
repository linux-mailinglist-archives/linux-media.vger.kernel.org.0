Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9E94D8912
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243000AbiCNQ2r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242996AbiCNQ2q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:28:46 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B649BC1A
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 09:27:36 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id B804A240006;
        Mon, 14 Mar 2022 16:27:32 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v2 4/8] media: i2c: ov5670: Probe regulators
Date:   Mon, 14 Mar 2022 17:27:10 +0100
Message-Id: <20220314162714.153970-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314162714.153970-1-jacopo@jmondi.org>
References: <20220314162714.153970-1-jacopo@jmondi.org>
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

The OV5670 has three power supplies (AVDD, DOVDD and DVDD).

Probe them in the driver to prepare controlling with runtime_pm
operations.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 25d792794fc7..832355f65e52 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -86,6 +87,14 @@ struct ov5670_link_freq_config {
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
@@ -1833,6 +1842,9 @@ struct ov5670 {
 	/* Current mode */
 	const struct ov5670_mode *cur_mode;
 
+	/* Regulators */
+	struct regulator_bulk_data supplies[OV5670_NUM_SUPPLIES];
+
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
@@ -2473,6 +2485,18 @@ static const struct v4l2_subdev_internal_ops ov5670_internal_ops = {
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
@@ -2505,6 +2529,12 @@ static int ov5670_probe(struct i2c_client *client)
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

