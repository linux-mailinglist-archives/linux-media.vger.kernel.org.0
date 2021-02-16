Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D550C31CF4C
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhBPRmh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:42:37 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:40901 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbhBPRmU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:42:20 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1F17220000D;
        Tue, 16 Feb 2021 17:41:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] media: i2c: rdacm20: Re-work ov10635 reset
Date:   Tue, 16 Feb 2021 18:41:36 +0100
Message-Id: <20210216174146.106639-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OV10635 image sensor embedded in the camera module is currently
reset after the MAX9271 initialization with two long delays that were
most probably not correctly characterized.

Re-work the image sensor reset procedure by holding the chip in reset
during the MAX9271 configuration, removing the long sleep delays and
only wait after the chip exits from reset for 350-500 microseconds
interval, which is larger than the minimum (2048 * (1 / XVCLK)) timeout
characterized in the chip manual.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index e982373908f2..ea30cc936531 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -477,6 +477,15 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	if (ret)
 		return ret;
 
+	/* Hold OV10635 in reset during max9271 configuration. */
+	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
+	if (ret)
+		return ret;
+
+	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
+	if (ret)
+		return ret;
+
 	ret = max9271_configure_gmsl_link(&dev->serializer);
 	if (ret)
 		return ret;
@@ -490,23 +499,11 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 		return ret;
 	dev->serializer.client->addr = dev->addrs[0];
 
-	/*
-	 * Reset the sensor by cycling the OV10635 reset signal connected to the
-	 * MAX9271 GPIO1 and verify communication with the OV10635.
-	 */
-	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
-	if (ret)
-		return ret;
-
-	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
-	if (ret)
-		return ret;
-	usleep_range(10000, 15000);
-
+	/* Release ov10635 from reset and initialize it. */
 	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
 	if (ret)
 		return ret;
-	usleep_range(10000, 15000);
+	usleep_range(350, 500);
 
 	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
 		ret = ov10635_read16(dev, OV10635_PID);
-- 
2.30.0

