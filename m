Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCFA33B37F
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 14:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbhCONPe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 09:15:34 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:42843 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbhCONPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 09:15:16 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5AFB7FF812;
        Mon, 15 Mar 2021 13:15:12 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 08/18] media: i2c: rdacm20: Re-work ov10635 reset
Date:   Mon, 15 Mar 2021 14:15:02 +0100
Message-Id: <20210315131512.133720-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
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

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 312450db958d..b9aaa0f7db42 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -477,6 +477,19 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	if (ret)
 		return ret;
 
+	/*
+	 * Hold OV10635 in reset during max9271 configuration. The reset signal
+	 * has to be asserted for at least 200 microseconds.
+	 */
+	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
+	if (ret)
+		return ret;
+
+	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
+	if (ret)
+		return ret;
+	usleep_range(200, 500);
+
 	ret = max9271_configure_gmsl_link(&dev->serializer);
 	if (ret)
 		return ret;
@@ -491,22 +504,14 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	dev->serializer.client->addr = dev->addrs[0];
 
 	/*
-	 * Reset the sensor by cycling the OV10635 reset signal connected to the
-	 * MAX9271 GPIO1 and verify communication with the OV10635.
+	 * Release ov10635 from reset and initialize it. The image sensor
+	 * requires at least 2048 XVCLK cycles (85 micro-seconds at 24MHz)
+	 * before being available. Stay safe and wait up to 500 micro-seconds.
 	 */
-	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
-	if (ret)
-		return ret;
-
-	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
-	if (ret)
-		return ret;
-	usleep_range(10000, 15000);
-
 	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
 	if (ret)
 		return ret;
-	usleep_range(10000, 15000);
+	usleep_range(100, 500);
 
 	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
 		ret = ov10635_read16(dev, OV10635_PID);
-- 
2.30.0

