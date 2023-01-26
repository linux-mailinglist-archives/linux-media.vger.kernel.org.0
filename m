Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B691767CB23
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 13:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236368AbjAZMrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 07:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbjAZMrE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 07:47:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15EB66F9A
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 04:47:02 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 698271254;
        Thu, 26 Jan 2023 13:46:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674737215;
        bh=7Ur6WazrHGmAkomdY6iX3LBpNO0v+G+W0eprodEVILQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KzxVwJXu21OItR+3BqTBT6ZwoBXXw0hLL+1VBTvFeK2VblW76gmeKEmvFSC6ImuV6
         NdFz6ZZtIV1QZJFFv5kDte5Ui2aEfiBuSow3XZR91YsYC/ofCfX8SMKwxQMLaVQ3Hg
         Zxub0t0y5DqV71XP80Wo6Vaxkt5ZS7RQIWNqy2wI=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 4/9] media: i2c: ov5670: Probe regulators
Date:   Thu, 26 Jan 2023 13:46:27 +0100
Message-Id: <20230126124632.45842-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
References: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
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

The OV5670 has three power supplies (AVDD, DOVDD and DVDD).

Probe them in the driver to prepare controlling with runtime_pm
operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index c8beb2bc3d0f..95bdbf628556 100644
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
@@ -2509,6 +2533,12 @@ static int ov5670_probe(struct i2c_client *client)
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
2.39.0

