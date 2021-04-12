Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF2635C205
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241294AbhDLJho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:37:44 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:41995 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240665AbhDLJez (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:34:55 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9701B200006;
        Mon, 12 Apr 2021 09:34:30 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 06/17] media: i2c: max9271: Check max9271_write() return
Date:   Mon, 12 Apr 2021 11:34:40 +0200
Message-Id: <20210412093451.14198-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check the return value of the max9271_write() function in the
max9271 library driver.

While at it, modify an existing condition to be made identical
to other checks.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9271.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
index c495582dcff6..2c7dc7fb9846 100644
--- a/drivers/media/i2c/max9271.c
+++ b/drivers/media/i2c/max9271.c
@@ -106,7 +106,10 @@ int max9271_set_serial_link(struct max9271_device *dev, bool enable)
 	 * Short delays here appear to show bit-errors in the writes following.
 	 * Therefore a conservative delay seems best here.
 	 */
-	max9271_write(dev, 0x04, val);
+	ret = max9271_write(dev, 0x04, val);
+	if (ret < 0)
+		return ret;
+
 	usleep_range(5000, 8000);
 
 	return 0;
@@ -118,7 +121,7 @@ int max9271_configure_i2c(struct max9271_device *dev, u8 i2c_config)
 	int ret;
 
 	ret = max9271_write(dev, 0x0d, i2c_config);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	/* The delay required after an I2C bus configuration change is not
@@ -143,7 +146,10 @@ int max9271_set_high_threshold(struct max9271_device *dev, bool enable)
 	 * Enable or disable reverse channel high threshold to increase
 	 * immunity to power supply noise.
 	 */
-	max9271_write(dev, 0x08, enable ? ret | BIT(0) : ret & ~BIT(0));
+	ret = max9271_write(dev, 0x08, enable ? ret | BIT(0) : ret & ~BIT(0));
+	if (ret < 0)
+		return ret;
+
 	usleep_range(2000, 2500);
 
 	return 0;
@@ -152,6 +158,8 @@ EXPORT_SYMBOL_GPL(max9271_set_high_threshold);
 
 int max9271_configure_gmsl_link(struct max9271_device *dev)
 {
+	int ret;
+
 	/*
 	 * Configure the GMSL link:
 	 *
@@ -162,16 +170,24 @@ int max9271_configure_gmsl_link(struct max9271_device *dev)
 	 *
 	 * TODO: Make the GMSL link configuration parametric.
 	 */
-	max9271_write(dev, 0x07, MAX9271_DBL | MAX9271_HVEN |
-		      MAX9271_EDC_1BIT_PARITY);
+	ret = max9271_write(dev, 0x07, MAX9271_DBL | MAX9271_HVEN |
+			    MAX9271_EDC_1BIT_PARITY);
+	if (ret < 0)
+		return ret;
+
 	usleep_range(5000, 8000);
 
 	/*
 	 * Adjust spread spectrum to +4% and auto-detect pixel clock
 	 * and serial link rate.
 	 */
-	max9271_write(dev, 0x02, MAX9271_SPREAD_SPECT_4 | MAX9271_R02_RES |
-		      MAX9271_PCLK_AUTODETECT | MAX9271_SERIAL_AUTODETECT);
+	ret = max9271_write(dev, 0x02,
+			    MAX9271_SPREAD_SPECT_4 | MAX9271_R02_RES |
+			    MAX9271_PCLK_AUTODETECT |
+			    MAX9271_SERIAL_AUTODETECT);
+	if (ret < 0)
+		return ret;
+
 	usleep_range(5000, 8000);
 
 	return 0;
-- 
2.31.1

