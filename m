Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857E564EC3B
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 14:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiLPNof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 08:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiLPNod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 08:44:33 -0500
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E0B15822
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 05:44:31 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BGDiPKD117784;
        Fri, 16 Dec 2022 07:44:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671198265;
        bh=Bj1fZQNN5IprYVjl0f6bzyscJXjpQtaZ88sTePrrqNI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=D1vutf/gJ+VHGIvSnWEH2Y2nZrSBgDOAMW/T4fohberV2edoZunlc+8vSliVpKJSY
         u1/dpASeSVd9CvARi18g09WLU2yVyYKDCh1Wz9mriPOL9XXPjk1r+4iRT+V2bXGdZ7
         tjm6Rc1TxSACN3jBisDv5cRT8e1MFLKkxK3dw9zM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BGDiPqZ131043
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 16 Dec 2022 07:44:25 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 16
 Dec 2022 07:44:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 16 Dec 2022 07:44:25 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BGDiOlC071235;
        Fri, 16 Dec 2022 07:44:24 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, Nishanth Menon <nm@ti.com>
Subject: [PATCH 3/3] media: ov5640: Honor power on time in init_setting
Date:   Fri, 16 Dec 2022 19:14:09 +0530
Message-ID: <20221216134409.6868-4-j-luthra@ti.com>
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
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index fa84e60de0db..ff2a2c9358e7 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -608,7 +608,7 @@ static const struct reg_value ov5640_init_setting[] = {
 	{0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
 	{0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
 	{0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
-	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
+	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 5}, {0x3c00, 0x04, 0, 300},
 };
 
 static const struct reg_value ov5640_setting_low_res[] = {
-- 
2.17.1

