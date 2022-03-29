Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A794EAA00
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 11:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbiC2JEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 05:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiC2JEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 05:04:40 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721731F0815
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 02:02:58 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 13D3C100019;
        Tue, 29 Mar 2022 09:02:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v3 4/8] media: i2c: ov5670: Probe regulators
Date:   Tue, 29 Mar 2022 11:01:29 +0200
Message-Id: <20220329090133.338073-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329090133.338073-1-jacopo@jmondi.org>
References: <20220329090133.338073-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
index 1cc312981c82..9ddd259a4015 100644
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
@@ -1831,6 +1840,9 @@ struct ov5670 {
 	/* Current mode */
 	const struct ov5670_mode *cur_mode;
 
+	/* Regulators */
+	struct regulator_bulk_data supplies[OV5670_NUM_SUPPLIES];
+
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
@@ -2471,6 +2483,18 @@ static const struct v4l2_subdev_internal_ops ov5670_internal_ops = {
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
@@ -2506,6 +2530,12 @@ static int ov5670_probe(struct i2c_client *client)
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

