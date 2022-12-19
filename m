Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04BA4650D4E
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 15:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbiLSOco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 09:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbiLSOcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 09:32:01 -0500
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4ED9FD2
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 06:31:13 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BJEV5ht123106;
        Mon, 19 Dec 2022 08:31:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671460265;
        bh=P9YT+tRzUc51qhxEx0xey1IYRo7nlSo1p9v+jHHl1OE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LY4vwqsZfFSO1in+QKVtGx0i59Vg2SFJRNStCooMBfjowVCFfSp6PEahV3snWFbNt
         93jK1ffOZQBCaNCkrFc/XWZau+7Yh2Ep1k8hE4M/NJda1yITIht6QN5Wvbe8opD3f4
         dYZYKjbRT7sRk+QRn3VAL7e5jlwwW0CiHJhbeJsE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BJEV5IK090028
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Dec 2022 08:31:05 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 19
 Dec 2022 08:31:05 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 19 Dec 2022 08:31:05 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BJEV4Sc118614;
        Mon, 19 Dec 2022 08:31:04 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
Subject: [PATCH v2 1/3] media: ov5640: Handle delays when no reset_gpio set
Date:   Mon, 19 Dec 2022 20:00:54 +0530
Message-ID: <20221219143056.4070-2-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221219143056.4070-1-j-luthra@ti.com>
References: <20221219143056.4070-1-j-luthra@ti.com>
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

Some module manufacturers [1][2] don't expose the RESETB and PWDN pins
of the sensor directly through the 15-pin FFC connector. Instead wiring
~PWDN gpio to the sensor pins with appropriate delays.

In such cases, reset_gpio will not be available to the driver, but it
will still be toggled when the sensor is powered on, and thus we should
still honor the wait time of >= 5ms + 1ms + 20ms (see figure 2-3 in [3])
before attempting any i/o operations over SCCB.

Also, rename the function to ov5640_powerup_sequence to better match the
datasheet (section 2.7).

[1] https://digilent.com/reference/_media/reference/add-ons/pcam-5c/pcam_5c_sch.pdf
[2] https://www.alinx.com/public/upload/file/AN5641_User_Manual.pdf
[3] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf

Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/i2c/ov5640.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index a9cd21c49147..41e4a4f1b99d 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2372,11 +2372,22 @@ static void ov5640_power(struct ov5640_dev *sensor, bool enable)
 	gpiod_set_value_cansleep(sensor->pwdn_gpio, enable ? 0 : 1);
 }
 
-static void ov5640_reset(struct ov5640_dev *sensor)
+/*
+ * From section 2.7 power up sequence:
+ * t0 + t1 + t2 >= 5ms	Delay from DOVDD stable to PWDN pull down
+ * t3 >= 1ms		Delay from PWDN pull down to RESETB pull up
+ * t4 >= 20ms		Delay from RESETB pull up to SCCB (i2c) stable
+ *
+ * Some modules don't expose RESETB/PWDN pins directly, instead providing a
+ * "PWUP" GPIO which is wired through appropriate delays and inverters to the
+ * pins.
+ *
+ * In such cases, this gpio should be mapped to pwdn_gpio in the driver, and we
+ * should still toggle the pwdn_gpio below with the appropriate delays, while
+ * the calls to reset_gpio will be ignored.
+ */
+static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
 {
-	if (!sensor->reset_gpio)
-		return;
-
 	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
 
 	/* camera power cycle */
@@ -2412,8 +2423,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
 		goto xclk_off;
 	}
 
-	ov5640_reset(sensor);
-	ov5640_power(sensor, true);
+	ov5640_powerup_sequence(sensor);
 
 	ret = ov5640_init_slave_id(sensor);
 	if (ret)
-- 
2.17.1

