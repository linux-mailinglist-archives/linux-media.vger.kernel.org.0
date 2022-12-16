Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5256064EC3D
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 14:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiLPNoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 08:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiLPNoh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 08:44:37 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFCF4046A
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 05:44:35 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BGDiM6H053099;
        Fri, 16 Dec 2022 07:44:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671198262;
        bh=xvIM0w2QcDq82wj+MQN+K+DjsVqkThmfacmFrAONlHI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=PNtIO/dzGMS+koYsboZa157IP8eYvmj5hhle7S8dPNIk/Mwir3jz07L5k5jZ2FOVD
         JYX4I0BqM8rNDdWbkU4CTgnTpqMAd5ZfH9wmoysB0KPBvTTd6zvmgPkciXBAXQMYoz
         mELbu9DzMYYhKXzv8Dc6kUZLbqXL24I9TFvC1Hlw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BGDiMxC127839
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 16 Dec 2022 07:44:22 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 16
 Dec 2022 07:44:22 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 16 Dec 2022 07:44:22 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BGDiLsl045040;
        Fri, 16 Dec 2022 07:44:21 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, Jai Luthra <j-luthra@ti.com>
Subject: [PATCH 1/3] media: ov5640: Handle delays when no reset_gpio set
Date:   Fri, 16 Dec 2022 19:14:07 +0530
Message-ID: <20221216134409.6868-2-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221216134409.6868-1-j-luthra@ti.com>
References: <20221216134409.6868-1-j-luthra@ti.com>
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

Some module manufacturers [1][2] don't expose the RESETB gpio of the
sensor directly through the 15-pin FFC connector. Instead wiring ~PWDN
as a proxy reset with appropriate delays.

In such cases, reset_gpio will not be available to the driver, but it
will still be toggled when the sensor is powered on, and thus we should
still honor the wait time of >= 5ms + 1ms + 20ms (see figure 2-3 in [3])
before attempting any i/o operations over SCCB.

[1] https://digilent.com/reference/_media/reference/add-ons/pcam-5c/pcam_5c_sch.pdf
[2] https://www.alinx.com/public/upload/file/AN5641_User_Manual.pdf
[3] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf

Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/i2c/ov5640.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index e0f908af581b..4bb7bf557cfa 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2466,6 +2466,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
 
 	ov5640_reset(sensor);
 	ov5640_power(sensor, true);
+	usleep_range(26000, 30000);
 
 	ret = ov5640_init_slave_id(sensor);
 	if (ret)
-- 
2.17.1

