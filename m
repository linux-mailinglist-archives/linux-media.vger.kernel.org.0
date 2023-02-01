Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37AC86867F5
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 15:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbjBAOGy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 09:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbjBAOGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 09:06:53 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BBE133
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 06:06:52 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311BG7X9014405;
        Wed, 1 Feb 2023 15:06:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=LUWhjaLT9gmGb12ddf0ys+vIyeyFvFSmFIflDj7NUuc=;
 b=C7hZXP3Ye7YFdSruZGTFf2HnvL81TEk/JkFT36ziqxDy7LTfde86T2TooFZjq20SK1vC
 m4UDgaQXDynjaNP40VFvG78kuF+58TQy225fDXBoIp2RXDcmgkb8QvDSzoYVHede1xQB
 zmxDN+vu5JxODzZmlw0HwPP0MTRrRwx9DksJyTFZ3Gx5zho7AqOd6mTbaU/d5mPas7fk
 Jjvh/7+1zXXbvxUgeNi8QeEuXVZbKGQ0Gg7L4xRS7QPifetLNc+OTOrF3KYErTLmY3KB
 wnKMg4s/KFlfkROhH8NIbyO4Eel8lSyZTcJwf5KkjWK36yhdm10r6lqJ4etPfTAV3MEc aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nfq2d0xq7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Feb 2023 15:06:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DDD9100038;
        Wed,  1 Feb 2023 15:06:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17B4D21ED5C;
        Wed,  1 Feb 2023 15:06:43 +0100 (CET)
Received: from localhost (10.252.0.107) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 1 Feb
 2023 15:06:42 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 2/4] media: i2c: st-vgxy61: Move 'detect' call to 'power_on'
Date:   Wed, 1 Feb 2023 15:04:15 +0100
Message-ID: <20230201140417.89195-3-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201140417.89195-1-benjamin.mugnier@foss.st.com>
References: <20230201140417.89195-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.0.107]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Previously the device detection was performed after patching.
Move it right after the reset to make sure we have the correct sensor
before trying to patch it.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/st-vgxy61.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index df5483f14560..e51234aebb16 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -1732,6 +1732,12 @@ static int vgxy61_power_on(struct device *dev)
 		}
 	}
 
+	ret = vgxy61_detect(sensor);
+	if (ret) {
+		dev_err(&client->dev, "sensor detect failed %d\n", ret);
+		goto disable_clock;
+	}
+
 	ret = vgxy61_patch(sensor);
 	if (ret) {
 		dev_err(&client->dev, "sensor patch failed %d\n", ret);
@@ -1858,12 +1864,6 @@ static int vgxy61_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = vgxy61_detect(sensor);
-	if (ret) {
-		dev_err(&client->dev, "sensor detect failed %d\n", ret);
-		return ret;
-	}
-
 	vgxy61_fill_sensor_param(sensor);
 	vgxy61_fill_framefmt(sensor, sensor->current_mode, &sensor->fmt,
 			     VGXY61_MEDIA_BUS_FMT_DEF);
-- 
2.25.1

