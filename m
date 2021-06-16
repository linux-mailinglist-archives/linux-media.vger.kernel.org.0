Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7E23A9AC7
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbhFPMsC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:48:02 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:55241 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbhFPMr6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:47:58 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C78F81C0015;
        Wed, 16 Jun 2021 12:45:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 06/15] media: i2c: max9271: Check max9271_write() return
Date:   Wed, 16 Jun 2021 14:46:07 +0200
Message-Id: <20210616124616.49249-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616124616.49249-1-jacopo+renesas@jmondi.org>
References: <20210616124616.49249-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check the return value of the max9271_write() function in the
max9271 library driver.

While at it, modify an existing condition to be made identical
to other checks.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

