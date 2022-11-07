Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C3361F6FE
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 16:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbiKGPCV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 10:02:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiKGPCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 10:02:06 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89FA1E721
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 07:00:32 -0800 (PST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A7AeptX006416;
        Mon, 7 Nov 2022 16:00:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=V9fZSD4X0zLdgygmQr2CeqVs1XfyDOEg6zsaz2iti5o=;
 b=n/5XgC25tnwaf0JLrZwi10M+WBlD1/M65xkV4brqQNR80lh55mzF+HFB+GIevB6C0Dcy
 dtuChF0aQAGFpEL4ruhcllmDpSv0fZpsy9ER/Q87EWmwxLZk3CNdzLd3PZWnP6SAMXSX
 LPMp8fSVzVUkdjpiv/cPn0jVjiiMlQgE50Hc0igQ5VlG6IXGXlWCIdkTj+9kU85p6Yj6
 kU+nGBFRq4adCBo8JBsocJep80jqeA4pnz84uhOsaApEicdczdyu+ERKiUxP1LUGVuap
 2ixDwABNMzvQ6s3EPPkUhgj9zZwNSnOOQvqenEdeuQouF3x3Z397o3jiea0tzwyzk3b7 cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kq0ftsh1y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Nov 2022 16:00:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BF2710003A;
        Mon,  7 Nov 2022 16:00:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F6AE228A42;
        Mon,  7 Nov 2022 16:00:13 +0100 (CET)
Received: from localhost (10.129.167.233) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 7 Nov
 2022 16:00:13 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH] media: i2c: st-vgxy61: Fix regulator counter underflow
Date:   Mon, 7 Nov 2022 16:00:00 +0100
Message-ID: <20221107150000.49058-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.167.233]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Previously regulators were enabled on probe and never again.
However, as regulators are disabled on power off. After a second power off
the regulator counter will underflow. Plus regulators are not required
for probing the sensor, but for streaming.
Fix this by enabling regulators on power on to balance regulator counter
properly.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/st-vgxy61.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index 7ff18d670813..b0f4eeadeac6 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -1711,6 +1711,13 @@ static int vgxy61_power_on(struct device *dev)
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
 	int ret;
 
+	ret = regulator_bulk_enable(ARRAY_SIZE(vgxy61_supply_name),
+				    sensor->supplies);
+	if (ret) {
+		dev_err(&client->dev, "failed to enable regulators %d\n", ret);
+		return ret;
+	}
+
 	ret = clk_prepare_enable(sensor->xclk);
 	if (ret) {
 		dev_err(&client->dev, "failed to enable clock %d\n", ret);
@@ -1847,13 +1854,6 @@ static int vgxy61_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(vgxy61_supply_name),
-				    sensor->supplies);
-	if (ret) {
-		dev_err(&client->dev, "failed to enable regulators %d\n", ret);
-		return ret;
-	}
-
 	ret = vgxy61_power_on(dev);
 	if (ret)
 		return ret;
-- 
2.25.1

