Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6D9650D4F
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 15:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbiLSOcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 09:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232621AbiLSOcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 09:32:01 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F4DEE1C
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 06:31:16 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BJEVAoT075644;
        Mon, 19 Dec 2022 08:31:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671460270;
        bh=cE3e4y+zfExapu+Oa8Mwmc4By02u9btTrk/vNts2r1g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=j4nnpLnt1sOKKDeDJdNkJ5aAL4XvHNluxotVpgceW3q95cX+adsmsywbvuY+qGRO+
         VwDp3xNgeil7FFsI8oVKW20RG3w/GBLR5uaw1/JurfSLRFlbsmZor+06Gfzvpo4Qte
         A2aDUPkvOFsFHlCnJVJBU4erTcRko+dTV/eszDaM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BJEVAot062060
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Dec 2022 08:31:10 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 19
 Dec 2022 08:31:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 19 Dec 2022 08:31:10 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BJEV9m5000618;
        Mon, 19 Dec 2022 08:31:09 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Nishanth Menon <nm@ti.com>
Subject: [PATCH v2 3/3] media: ov5640: Honor power on time in init_setting
Date:   Mon, 19 Dec 2022 20:00:56 +0530
Message-ID: <20221219143056.4070-4-j-luthra@ti.com>
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

From: Nishanth Menon <nm@ti.com>

OV5640 Datasheet[1] Figures 2-3 and 2-4 indicate the timing sequences
that is expected during various initialization steps. Note the power
on time includes t0 + t1 + t2 >= 5ms, delay for poweron.

As indicated in section 2.8, the PWDN assertion can either be via
external pin control OR via the register 0x3008 bit 6 (see table 7-1 in
[1])

[1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf

Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/media/i2c/ov5640.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 7b0ff04a2c93..0ea8691ecded 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -551,7 +551,7 @@ static const struct reg_value ov5640_init_setting[] = {
 	{0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
 	{0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
 	{0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
-	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
+	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 5}, {0x3c00, 0x04, 0, 300},
 };
 
 static const struct reg_value ov5640_setting_low_res[] = {
@@ -1735,9 +1735,12 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
 
 static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 {
-	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
-				OV5640_REG_SYS_CTRL0_SW_PWUP :
-				OV5640_REG_SYS_CTRL0_SW_PWDN);
+	int ret;
+	ret = ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
+			       OV5640_REG_SYS_CTRL0_SW_PWUP :
+			       OV5640_REG_SYS_CTRL0_SW_PWDN);
+	usleep_range(5000, 6000);
+	return ret;
 }
 
 static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
-- 
2.17.1

