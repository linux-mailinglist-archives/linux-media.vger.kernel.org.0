Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E753A9AE1
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhFPMsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:48:38 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:43029 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbhFPMsT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:48:19 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B98CB1C0017;
        Wed, 16 Jun 2021 12:46:10 +0000 (UTC)
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
Subject: [PATCH v5 15/15] media: i2c: rdacm20: Re-work ov10635 reset
Date:   Wed, 16 Jun 2021 14:46:16 +0200
Message-Id: <20210616124616.49249-16-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616124616.49249-1-jacopo+renesas@jmondi.org>
References: <20210616124616.49249-1-jacopo+renesas@jmondi.org>
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
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/rdacm20.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index e6fed86a3281..cb725c2778c0 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -473,6 +473,19 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
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
@@ -487,22 +500,14 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
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
 
 again:
 	ret = ov10635_read16(dev, OV10635_PID);
-- 
2.31.1

