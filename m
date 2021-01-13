Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25FA2F52CC
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 19:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbhAMSzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 13:55:48 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:44949 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728335AbhAMSzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 13:55:47 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4CBCB1C000B;
        Wed, 13 Jan 2021 18:55:03 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: [PATCH v7 3/7] fixup! media: i2c: rdacm21: Break-out ov10640 initialization
Date:   Wed, 13 Jan 2021 19:55:01 +0100
Message-Id: <20210113185506.119808-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113185506.119808-1-jacopo+renesas@jmondi.org>
References: <20210113185506.119808-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The embedded OV490 ISP chip provides a secondary SCCB interface and
two GPIO lines to control the connected OV10640 image sensor.

Break out the OV10640 initialization from the OV490 initialization and
explicitely control the powerdown and reset GPIOs. After the image
sensor has been hard reset, implement a more clear handling of the
secondary SCCB interface to read the image sensor chip ID.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm21.c | 75 ++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 0428e3209463..944009687de5 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -30,11 +30,24 @@
 #define OV490_PAGE_HIGH_REG		0xfffd
 #define OV490_PAGE_LOW_REG		0xfffe
 
+/*
+ * The SCCB slave handling is undocumented; the registers naming scheme is
+ * totally arbitrary.
+ */
+#define OV490_SCCB_SLAVE_WRITE		0x00
+#define OV490_SCCB_SLAVE_READ		0x01
+#define OV490_SCCB_SLAVE0_DIR		0x80195000
+#define OV490_SCCB_SLAVE0_ADDR_HIGH	0x80195001
+#define OV490_SCCB_SLAVE0_ADDR_LOW	0x80195002
+
 #define OV490_DVP_CTRL3			0x80286009
 
 #define OV490_ODS_CTRL_FRAME_OUTPUT_EN	0x0c
 #define OV490_ODS_CTRL			0x8029d000
 
+#define OV490_HOST_CMD			0x808000c0
+#define OV490_HOST_CMD_TRIGGER		0xc1
+
 #define OV490_ID_VAL			0x0490
 #define OV490_ID(_p, _v)		((((_p) & 0xff) << 8) | ((_v) & 0xff))
 #define OV490_PID			0x8080300a
@@ -42,12 +55,22 @@
 #define OV490_PID_TIMEOUT		20
 #define OV490_OUTPUT_EN_TIMEOUT		300
 
+#define OV490_GPIO0_RESETB		0x01
+#define OV490_SPWDN0			0x01
+#define OV490_GPIO_SEL0			0x80800050
+#define OV490_GPIO_SEL1			0x80800051
+#define OV490_GPIO_DIRECTION0		0x80800054
+#define OV490_GPIO_DIRECTION1		0x80800055
+#define OV490_GPIO_OUTPUT_VALUE0	0x80800058
+#define OV490_GPIO_OUTPUT_VALUE1	0x80800059
+
 #define OV490_ISP_HSIZE_LOW		0x80820060
 #define OV490_ISP_HSIZE_HIGH		0x80820061
 #define OV490_ISP_VSIZE_LOW		0x80820062
 #define OV490_ISP_VSIZE_HIGH		0x80820063
 
-#define OV10640_ID_LOW			0xa6
+#define OV10640_ID_HIGH			0xa6
+#define OV10640_CHIP_ID			0x300a
 #define OV10640_PIXEL_RATE		55000000
 
 struct rdacm21_device {
@@ -306,6 +329,39 @@ static const struct v4l2_subdev_ops rdacm21_subdev_ops = {
 	.pad		= &rdacm21_subdev_pad_ops,
 };
 
+static int ov10640_initialize(struct rdacm21_device *dev)
+{
+	u8 val;
+
+	/* Power-up OV10640 by setting RESETB and PWDNB pins high. */
+	ov490_write_reg(dev, OV490_GPIO_SEL0, OV490_GPIO0_RESETB);
+	ov490_write_reg(dev, OV490_GPIO_SEL1, OV490_SPWDN0);
+	ov490_write_reg(dev, OV490_GPIO_DIRECTION0, OV490_GPIO0_RESETB);
+	ov490_write_reg(dev, OV490_GPIO_DIRECTION1, OV490_SPWDN0);
+	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0_RESETB);
+	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_SPWDN0);
+	usleep_range(3000, 5000);
+
+	/* Read OV10640 ID to test communications. */
+	ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR, OV490_SCCB_SLAVE_READ);
+	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH, OV10640_CHIP_ID >> 8);
+	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, (u8)OV10640_CHIP_ID);
+
+	/* Trigger SCCB slave transaction and give it some time to complete. */
+	ov490_write_reg(dev, OV490_HOST_CMD, OV490_HOST_CMD_TRIGGER);
+	usleep_range(1000, 1500);
+
+	ov490_read_reg(dev, OV490_SCCB_SLAVE0_DIR, &val);
+	if (val != OV10640_ID_HIGH) {
+		dev_err(dev->dev, "OV10640 ID mismatch: (0x%02x)\n", val);
+		return -ENODEV;
+	}
+
+	dev_dbg(dev->dev, "OV10640 ID = 0x%2x\n", val);
+
+	return 0;
+}
+
 static int ov490_initialize(struct rdacm21_device *dev)
 {
 	u8 pid, ver, val;
@@ -349,20 +405,11 @@ static int ov490_initialize(struct rdacm21_device *dev)
 		return -ENODEV;
 	}
 
-	/* Read OV10640 Id to test communications. */
-	ov490_write_reg(dev, 0x80195000, 0x01);
-	ov490_write_reg(dev, 0x80195001, 0x30);
-	ov490_write_reg(dev, 0x80195002, 0x0a);
-	ov490_write_reg(dev, 0x808000c0, 0xc1);
-
-	ov490_read_reg(dev, 0x80195000, &val);
-	if (val != OV10640_ID_LOW) {
-		dev_err(dev->dev, "OV10640 ID mismatch: (0x%02x)\n", val);
-		return -ENODEV;
-	}
-
-	dev_dbg(dev->dev, "OV10640 ID = 0x%2x\n", val);
+	ret = ov10640_initialize(dev);
+	if (ret)
+		return ret;
 
+	/* Program OV490 with register-value table. */
 	for (i = 0; i < ARRAY_SIZE(ov490_regs_wizard); ++i) {
 		ret = ov490_write(dev, ov490_regs_wizard[i].reg,
 				  ov490_regs_wizard[i].val);
-- 
2.29.2

