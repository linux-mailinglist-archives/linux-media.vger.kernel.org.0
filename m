Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0062C21BB
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731491AbgKXJil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:38:41 -0500
Received: from retiisi.eu ([95.216.213.190]:45026 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731513AbgKXJii (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:38:38 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 89049634CCF;
        Tue, 24 Nov 2020 11:37:53 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 30/30] ccs: Use all regulators
Date:   Tue, 24 Nov 2020 11:32:26 +0200
Message-Id: <20201124093226.23737-31-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
References: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use regulators vio and vcore besides vana. The regulators were always
there but on many boards they've been hard wired. Control them explicitly
now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 30 +++++++++++++++++++++++-------
 drivers/media/i2c/ccs/ccs.h      |  2 +-
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 89dc09587211..4447ca367a84 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -65,6 +65,8 @@ struct ccs_device {
 	unsigned char flags;
 };
 
+static const char * const ccs_regulators[] = { "vcore", "vio", "vana" };
+
 /*
  *
  * Dynamic Capability Identification
@@ -1304,7 +1306,8 @@ static int ccs_power_on(struct device *dev)
 	unsigned int sleep;
 	int rval;
 
-	rval = regulator_enable(sensor->vana);
+	rval = regulator_bulk_enable(ARRAY_SIZE(ccs_regulators),
+				     sensor->regulators);
 	if (rval) {
 		dev_err(dev, "failed to enable vana regulator\n");
 		return rval;
@@ -1416,7 +1419,8 @@ static int ccs_power_on(struct device *dev)
 	clk_disable_unprepare(sensor->ext_clk);
 
 out_xclk_fail:
-	regulator_disable(sensor->vana);
+	regulator_bulk_disable(ARRAY_SIZE(ccs_regulators),
+			       sensor->regulators);
 
 	return rval;
 }
@@ -1442,7 +1446,8 @@ static int ccs_power_off(struct device *dev)
 	gpiod_set_value(sensor->xshutdown, 0);
 	clk_disable_unprepare(sensor->ext_clk);
 	usleep_range(5000, 5000);
-	regulator_disable(sensor->vana);
+	regulator_bulk_disable(ARRAY_SIZE(ccs_regulators),
+			       sensor->regulators);
 	sensor->streaming = false;
 
 	return 0;
@@ -2981,10 +2986,21 @@ static int ccs_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_ops);
 	sensor->src->sd.internal_ops = &ccs_internal_src_ops;
 
-	sensor->vana = devm_regulator_get(&client->dev, "vana");
-	if (IS_ERR(sensor->vana)) {
-		dev_err(&client->dev, "could not get regulator for vana\n");
-		return PTR_ERR(sensor->vana);
+	sensor->regulators = devm_kcalloc(&client->dev,
+					  ARRAY_SIZE(ccs_regulators),
+					  sizeof(*sensor->regulators),
+					  GFP_KERNEL);
+	if (!sensor->regulators)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(ccs_regulators); i++)
+		sensor->regulators[i].supply = ccs_regulators[i];
+
+	rval = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(ccs_regulators),
+				       sensor->regulators);
+	if (rval) {
+		dev_err(&client->dev, "could not get regulators\n");
+		return rval;
 	}
 
 	sensor->ext_clk = devm_clk_get(&client->dev, NULL);
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 6b07e4143ff0..356b87c33405 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -223,7 +223,7 @@ struct ccs_sensor {
 	struct ccs_subdev *scaler;
 	struct ccs_subdev *pixel_array;
 	struct ccs_hwconfig hwcfg;
-	struct regulator *vana;
+	struct regulator_bulk_data *regulators;
 	struct clk *ext_clk;
 	struct gpio_desc *xshutdown;
 	struct gpio_desc *reset;
-- 
2.27.0

