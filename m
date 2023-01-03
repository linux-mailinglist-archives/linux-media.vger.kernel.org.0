Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 525F065BFDB
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 13:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237470AbjACM2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 07:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237468AbjACM1w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 07:27:52 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12ADC29
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 04:27:50 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 303CRhXq089422;
        Tue, 3 Jan 2023 06:27:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1672748863;
        bh=8nzV68I9fpNjSA3LbuRKemksL4nN7yUw6c9KIVIdZQ8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JpVSD7u8d/C40iOxsu3i8R02hA4uBsazNPkBtAOyEUfSEPmb7KfeutcDcKnUIoO4w
         4Rtdx4bpqC+k53AkbPhR+g9s4rZPFwyXcQSEf5RMAAbHqMGUt3yk5XhpckZS/YYM9r
         mzA71/2byeQ39Hg7O0DoVDQ099LOc5XCJX/xNBZw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 303CRhTZ065716
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Jan 2023 06:27:43 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 06:27:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 06:27:43 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 303CRgXw102479;
        Tue, 3 Jan 2023 06:27:42 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
        Jai Luthra <j-luthra@ti.com>
Subject: [PATCH v4 2/2] media: ov5640: Handle delays when no reset_gpio set
Date:   Tue, 3 Jan 2023 17:57:36 +0530
Message-ID: <20230103122736.18479-3-j-luthra@ti.com>
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
Reported-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 9f3913aad93c..5fba473132e5 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2425,11 +2425,22 @@ static void ov5640_power(struct ov5640_dev *sensor, bool enable)
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
 	if (sensor->pwdn_gpio) {
 		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
 
@@ -2477,8 +2488,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
 		goto xclk_off;
 	}
 
-	ov5640_reset(sensor);
-	ov5640_power(sensor, true);
+	ov5640_powerup_sequence(sensor);
 
 	ret = ov5640_init_slave_id(sensor);
 	if (ret)
-- 
2.17.1

