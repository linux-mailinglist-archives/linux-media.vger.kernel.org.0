Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5FF34223C
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhCSQmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:42:23 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41753 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbhCSQmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:42:14 -0400
X-Originating-IP: 5.92.35.220
Received: from uno.localdomain (mob-5-92-35-220.net.vodafone.it [5.92.35.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 78FE3C0011;
        Fri, 19 Mar 2021 16:42:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/19] media: i2c: rdacm21: Power up OV10640 before OV490
Date:   Fri, 19 Mar 2021 17:41:42 +0100
Message-Id: <20210319164148.199192-14-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current RDACM21 initialization routine powers up the
OV10640 image sensor after the OV490 ISP. The ISP is programmed with
a firmware loaded from an embedded EEPROM that (most probably) tries
to interact and program also the image sensor connected to the ISP.

As described in commit ccb26c5742f5 ("media: i2c: rdacm21: Fix OV10640
powerup") the image sensor powerdown signal is kept high by an internal
pull up resistor and occasionally fails to startup correctly if the
powerdown line is not asserted explicitly. Failures in the OV10640
startup causes the OV490 firmware to fail to boot correctly resulting in
the camera module initialization to fail consequentially.

Fix this by powering up the OV10640 image sensor before testing the
OV490 firmware boot completion, by splitting the ov10640_initialize()
function in an ov10640_power_up() one and an ov10640_check_id() one.

Also make sure the OV10640 identification procedure gives enough time to
the image sensor to resume after the programming phase performed by the
OV490 firmware by repeating the ID read procedure,

This commit fixes a sporadic start-up error triggered by a failure to
detect the OV490 firmware boot completion:
rdacm21 8-0054: Timeout waiting for firmware boot

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm21.c | 46 ++++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 3f38c465b348..3763eb690d74 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -69,6 +69,7 @@
 #define OV490_ISP_VSIZE_LOW		0x80820062
 #define OV490_ISP_VSIZE_HIGH		0x80820063

+#define OV10640_PID_TIMEOUT		20
 #define OV10640_ID_HIGH			0xa6
 #define OV10640_CHIP_ID			0x300a
 #define OV10640_PIXEL_RATE		55000000
@@ -314,10 +315,8 @@ static int rdacm21_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }

-static int ov10640_initialize(struct rdacm21_device *dev)
+static void ov10640_power_up(struct rdacm21_device *dev)
 {
-	u8 val;
-
 	/* Enable GPIO0#0 (reset) and GPIO1#0 (pwdn) as output lines. */
 	ov490_write_reg(dev, OV490_GPIO_SEL0, OV490_GPIO0);
 	ov490_write_reg(dev, OV490_GPIO_SEL1, OV490_SPWDN0);
@@ -332,18 +331,35 @@ static int ov10640_initialize(struct rdacm21_device *dev)
 	usleep_range(1500, 3000);
 	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
 	usleep_range(3000, 5000);
+}

-	/* Read OV10640 ID to test communications. */
-	ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR, OV490_SCCB_SLAVE_READ);
-	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH, OV10640_CHIP_ID >> 8);
-	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, OV10640_CHIP_ID & 0xff);
-
-	/* Trigger SCCB slave transaction and give it some time to complete. */
-	ov490_write_reg(dev, OV490_HOST_CMD, OV490_HOST_CMD_TRIGGER);
-	usleep_range(1000, 1500);
+static int ov10640_check_id(struct rdacm21_device *dev)
+{
+	unsigned int i;
+	u8 val;

-	ov490_read_reg(dev, OV490_SCCB_SLAVE0_DIR, &val);
-	if (val != OV10640_ID_HIGH) {
+	/* Read OV10640 ID to test communications. */
+	for (i = 0; i < OV10640_PID_TIMEOUT; ++i) {
+		ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR,
+				OV490_SCCB_SLAVE_READ);
+		ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH,
+				OV10640_CHIP_ID >> 8);
+		ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW,
+				OV10640_CHIP_ID & 0xff);
+
+		/*
+		 * Trigger SCCB slave transaction and give it some time
+		 * to complete.
+		 */
+		ov490_write_reg(dev, OV490_HOST_CMD, OV490_HOST_CMD_TRIGGER);
+		usleep_range(1000, 1500);
+
+		ov490_read_reg(dev, OV490_SCCB_SLAVE0_DIR, &val);
+		if (val == OV10640_ID_HIGH)
+			break;
+		usleep_range(1000, 1500);
+	}
+	if (i == OV10640_PID_TIMEOUT) {
 		dev_err(dev->dev, "OV10640 ID mismatch: (0x%02x)\n", val);
 		return -ENODEV;
 	}
@@ -359,6 +375,8 @@ static int ov490_initialize(struct rdacm21_device *dev)
 	unsigned int i;
 	int ret;

+	ov10640_power_up(dev);
+
 	/*
 	 * Read OV490 Id to test communications. Give it up to 40msec to
 	 * exit from reset.
@@ -396,7 +414,7 @@ static int ov490_initialize(struct rdacm21_device *dev)
 		return -ENODEV;
 	}

-	ret = ov10640_initialize(dev);
+	ret = ov10640_check_id(dev);
 	if (ret)
 		return ret;

--
2.30.0

