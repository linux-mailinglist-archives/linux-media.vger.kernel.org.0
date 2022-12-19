Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6985C650D50
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 15:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbiLSOcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 09:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbiLSOcE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 09:32:04 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34231006A
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 06:31:21 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BJEV7lt053670;
        Mon, 19 Dec 2022 08:31:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671460267;
        bh=iCW5ftnT0N4S2mKzrD0EKAKDAJEZpOJ5wjHcDCZP/jE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FdEQKGe8zjgzd3K3WrmazHwcQXvBqi450BXcah2oFsSOexs9FU71Yoa3QUjQ8+zIx
         cI6q6uPEpdcRQIU6axaytW3cbDpnIGOD61gEZq2WId2cw9brCh7ukGwaf0tyt9vAHX
         CuqO/CTBvKCiPG/q/hGF4syk7iC4XEm05Cbmgw70=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BJEV7iS090043
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Dec 2022 08:31:07 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 19
 Dec 2022 08:31:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 19 Dec 2022 08:31:07 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BJEV6f5126566;
        Mon, 19 Dec 2022 08:31:07 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Nishanth Menon <nm@ti.com>
Subject: [PATCH v2 2/3] media: ov5640: Honor RESETB to SMBUS time t4 in init_setting
Date:   Mon, 19 Dec 2022 20:00:55 +0530
Message-ID: <20221219143056.4070-3-j-luthra@ti.com>
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
that is expected during various initialization steps. Note the t4 >=
20ms, delay from RESETB pull high to SCCB initialization

As indicated in section 2.8, the RESETB assertion can either be via
external pin control OR via the register 0x3008 bit 7. The
initialization sequence asserts bit7, but on deassert, we do not wait
for the reset delay.

[1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf

Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 41e4a4f1b99d..7b0ff04a2c93 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -475,7 +475,7 @@ static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
 };
 
 static const struct reg_value ov5640_init_setting[] = {
-	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
+	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 20},
 	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
 	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
 	{0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
-- 
2.17.1

