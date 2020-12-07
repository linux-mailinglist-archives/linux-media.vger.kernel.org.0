Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE072D1C00
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgLGVZK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:10 -0500
Received: from retiisi.eu ([95.216.213.190]:34636 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgLGVZK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 16:25:10 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 912CD634CA4;
        Mon,  7 Dec 2020 23:23:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 18/24] ccs: Hardware requires a delay after starting the clock of lifting reset
Date:   Mon,  7 Dec 2020 23:15:24 +0200
Message-Id: <20201207211530.21180-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A CCS compliant device requires a delay before the first I²C transaction
after pulling xshutdown up or starting the external clock. This is what
the driver does. However, if neither is actually there, there's no need
for the delay.

This also has the effect of removing an unnecessary delay on ACPI systems
where ACPI is responsible for the power-up sequence.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e1b3c5693e01..fae8ceded861 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1515,7 +1515,6 @@ static int ccs_power_on(struct device *dev)
 	struct ccs_sensor *sensor =
 		container_of(ssd, struct ccs_sensor, ssds[0]);
 	const struct ccs_device *ccsdev = device_get_match_data(dev);
-	unsigned int sleep;
 	int rval;
 
 	rval = regulator_bulk_enable(ARRAY_SIZE(ccs_regulators),
@@ -1525,21 +1524,25 @@ static int ccs_power_on(struct device *dev)
 		return rval;
 	}
 
-	rval = clk_prepare_enable(sensor->ext_clk);
-	if (rval < 0) {
-		dev_dbg(dev, "failed to enable xclk\n");
-		goto out_xclk_fail;
-	}
+	if (sensor->reset || sensor->xshutdown || sensor->ext_clk) {
+		unsigned int sleep;
+
+		rval = clk_prepare_enable(sensor->ext_clk);
+		if (rval < 0) {
+			dev_dbg(dev, "failed to enable xclk\n");
+			goto out_xclk_fail;
+		}
 
-	gpiod_set_value(sensor->reset, 0);
-	gpiod_set_value(sensor->xshutdown, 1);
+		gpiod_set_value(sensor->reset, 0);
+		gpiod_set_value(sensor->xshutdown, 1);
 
-	if (ccsdev->flags & CCS_DEVICE_FLAG_IS_SMIA)
-		sleep = SMIAPP_RESET_DELAY(sensor->hwcfg.ext_clk);
-	else
-		sleep = 5000;
+		if (ccsdev->flags & CCS_DEVICE_FLAG_IS_SMIA)
+			sleep = SMIAPP_RESET_DELAY(sensor->hwcfg.ext_clk);
+		else
+			sleep = 5000;
 
-	usleep_range(sleep, sleep);
+		usleep_range(sleep, sleep);
+	}
 
 	/*
 	 * Failures to respond to the address change command have been noticed.
-- 
2.29.2

