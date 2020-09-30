Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA8727ECE5
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731164AbgI3PaO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:14 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44656 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730915AbgI3P3G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:06 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id ACE35634C89
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:48 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 027/100] ccs: Request for "reset" GPIO
Date:   Wed, 30 Sep 2020 18:27:45 +0300
Message-Id: <20200930152858.8471-28-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DT bindings documented "reset-gpios" property but the driver never
made use of it. Instead it used a GPIO called "xshutdown", with apprently
wrong polarity.

Fix this by requesting "reset" GPIO with the right polarity first, and if
that fails, then request "xshutdown" GPIO with the old polarity. This way
it works for new users as expected while if someone, somewhere, depended
on "xshutdown" GPIO, that continues to work as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 14 ++++++++++++--
 drivers/media/i2c/ccs/ccs.h      |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1880ed31845e..775037ce361f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1295,6 +1295,7 @@ static int ccs_power_on(struct device *dev)
 	}
 	usleep_range(1000, 1000);
 
+	gpiod_set_value(sensor->reset, 0);
 	gpiod_set_value(sensor->xshutdown, 1);
 
 	sleep = SMIAPP_RESET_DELAY(sensor->hwcfg->ext_clk);
@@ -1381,6 +1382,7 @@ static int ccs_power_on(struct device *dev)
 	return 0;
 
 out_cci_addr_fail:
+	gpiod_set_value(sensor->reset, 1);
 	gpiod_set_value(sensor->xshutdown, 0);
 	clk_disable_unprepare(sensor->ext_clk);
 
@@ -1407,6 +1409,7 @@ static int ccs_power_off(struct device *dev)
 	if (sensor->hwcfg->i2c_addr_alt)
 		ccs_write(sensor, SOFTWARE_RESET, CCS_SOFTWARE_RESET_ON);
 
+	gpiod_set_value(sensor->reset, 1);
 	gpiod_set_value(sensor->xshutdown, 0);
 	clk_disable_unprepare(sensor->ext_clk);
 	usleep_range(5000, 5000);
@@ -3008,8 +3011,15 @@ static int ccs_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	sensor->xshutdown = devm_gpiod_get_optional(&client->dev, "xshutdown",
-						    GPIOD_OUT_LOW);
+	sensor->reset = devm_gpiod_get_optional(&client->dev, "reset",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->reset))
+		return PTR_ERR(sensor->reset);
+	/* Support old users that may have used "xshutdown" property. */
+	if (!sensor->reset)
+		sensor->xshutdown = devm_gpiod_get_optional(&client->dev,
+							    "xshutdown",
+							    GPIOD_OUT_LOW);
 	if (IS_ERR(sensor->xshutdown))
 		return PTR_ERR(sensor->xshutdown);
 
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 8933f3d40fa5..bfe39e02f5e9 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -219,6 +219,7 @@ struct ccs_sensor {
 	struct regulator *vana;
 	struct clk *ext_clk;
 	struct gpio_desc *xshutdown;
+	struct gpio_desc *reset;
 	void *ccs_limits;
 	u8 nbinning_subtypes;
 	struct ccs_binning_subtype binning_subtypes[CCS_LIM_BINNING_SUB_TYPE_MAX_N + 1];
-- 
2.27.0

