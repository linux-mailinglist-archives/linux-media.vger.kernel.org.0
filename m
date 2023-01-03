Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0151065BFDD
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 13:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237397AbjACM2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 07:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237436AbjACM1u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 07:27:50 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2CBB7C1
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 04:27:48 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 303CRf66089417;
        Tue, 3 Jan 2023 06:27:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1672748861;
        bh=ZnuLknF+P5BwBA0Cg970yGJ6nqrT2etI/9jb0fdSoU0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=WiAcF0uUbCnNGXO2vxXeCRaBtD14dm6FYV6mWAHOuJXov8BJ7yc86YDHCZkOVrr28
         LdnFHRaOLBp7KJjXecUdxOBpAk2tWGSPRahxPNgpe8y7CJ1ij+4VXSCcoxoPpm92co
         eaz+JEOYmueIdvdanyU8jGWYboCOjKuaajIA8OuI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 303CRfHM004511
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Jan 2023 06:27:41 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 06:27:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 06:27:41 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 303CReXR056528;
        Tue, 3 Jan 2023 06:27:41 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
        Jai Luthra <j-luthra@ti.com>
Subject: [PATCH v4 1/2] media: ov5640: Fix soft reset sequence and timings
Date:   Tue, 3 Jan 2023 17:57:35 +0530
Message-ID: <20230103122736.18479-2-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230103122736.18479-1-j-luthra@ti.com>
References: <20230103122736.18479-1-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the register-based reset out of the init_setting[] and into the
powerup_sequence function. The sensor is power cycled and reset using
the gpio pins so the soft reset is not always necessary.

This also ensures that soft reset honors the timing sequence
from the datasheet [1].

[1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf

Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
Reported-by: Nishanth Menon <nm@ti.com>
Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/i2c/ov5640.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index e0f908af581b..9f3913aad93c 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -50,6 +50,7 @@
 #define OV5640_REG_SYS_CTRL0		0x3008
 #define OV5640_REG_SYS_CTRL0_SW_PWDN	0x42
 #define OV5640_REG_SYS_CTRL0_SW_PWUP	0x02
+#define OV5640_REG_SYS_CTRL0_SW_RST	0x82
 #define OV5640_REG_CHIP_ID		0x300a
 #define OV5640_REG_IO_MIPI_CTRL00	0x300e
 #define OV5640_REG_PAD_OUTPUT_ENABLE01	0x3017
@@ -532,7 +533,7 @@ static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
 };
 
 static const struct reg_value ov5640_init_setting[] = {
-	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
+	{0x3103, 0x11, 0, 0},
 	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
 	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
 	{0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
@@ -2429,19 +2430,31 @@ static void ov5640_reset(struct ov5640_dev *sensor)
 	if (!sensor->reset_gpio)
 		return;
 
-	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
+	if (sensor->pwdn_gpio) {
+		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
 
-	/* camera power cycle */
-	ov5640_power(sensor, false);
-	usleep_range(5000, 10000);
-	ov5640_power(sensor, true);
-	usleep_range(5000, 10000);
+		/* camera power cycle */
+		ov5640_power(sensor, false);
+		usleep_range(5000, 10000);
+		ov5640_power(sensor, true);
+		usleep_range(5000, 10000);
 
-	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
-	usleep_range(1000, 2000);
+		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
+		usleep_range(1000, 2000);
 
-	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
+		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
+	} else {
+		/* software reset */
+		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
+				 OV5640_REG_SYS_CTRL0_SW_RST);
+	}
 	usleep_range(20000, 25000);
+
+	/* software standby: allows registers programming;
+	 * exit at restore_mode() for CSI, s_stream(1) for DVP
+	 */
+	ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
+			 OV5640_REG_SYS_CTRL0_SW_PWDN);
 }
 
 static int ov5640_set_power_on(struct ov5640_dev *sensor)
-- 
2.17.1

