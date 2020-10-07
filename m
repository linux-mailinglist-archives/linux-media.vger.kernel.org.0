Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7141228617D
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 16:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgJGOqd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 10:46:33 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:21262 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728535AbgJGOqc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 10:46:32 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097EcLIO014811;
        Wed, 7 Oct 2020 16:46:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0ww46gAvj+EiZ/AlkZkeMPgpi28kal1j8TD/B+QpY1A=;
 b=ObW0blPyRYfZnm68cGkLQUU1eDndidNt6mLxMp3ysFbIDNx5PbLiGatti1xmqA3DNnG9
 eQrEf5ONGVzlXUJGbjI8K8FmK3vGrkYjlf8bTijrBrcBMPUGIWQUqItu3vdYiztauDFn
 Q1B0dR17rOZqfBtJOcwRb3cLEkOLnku8/aeg+q85ibK9WMTM+fLpLqnyyyQNe+/yPDUJ
 aPAe+Rm4COq/vmMl5Wfpcw67TIZtdL7xufsKU0oHcDeE3FPv59VGVyBbtZFg0CxBowzN
 nEDr3Jd0Z0iBjsU4L4wAv5cYXXX82ATA5sZ4NytAnVe8H/PFe08ahA7+QJdmvN11pGf5 Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3402tjw7pb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Oct 2020 16:46:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A1CF6100034;
        Wed,  7 Oct 2020 16:46:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9070F2B4D24;
        Wed,  7 Oct 2020 16:46:17 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 16:46:17
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Alain Volmat <alain.volmat@st.com>
Subject: [PATCH] media: ov5640: fix MIPI power sequence
Date:   Wed, 7 Oct 2020 16:43:18 +0200
Message-ID: <1602081798-17548-2-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602081798-17548-1-git-send-email-hugues.fruchet@st.com>
References: <1602081798-17548-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-07_09:2020-10-06,2020-10-07 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fixes: b1751ae652fb ("media: i2c: ov5640: Separate out mipi configuration from s_power")

Fix ov5640_write_reg()return value unchecked at power off.
Reformat code to keep register access below the register description.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
Change-Id: I12db67c416c3d63eadee400a3c89aaf48c5b1469
---
 drivers/media/i2c/ov5640.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8d0254d..f34e62e 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1940,14 +1940,6 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 {
 	int ret;
 
-	if (!on) {
-		/* Reset MIPI bus settings to their default values. */
-		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
-		ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x04);
-		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x00);
-		return 0;
-	}
-
 	/*
 	 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
 	 *
@@ -1958,7 +1950,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 	 * [3] = 0	: Power up MIPI LS Rx
 	 * [2] = 0	: MIPI interface disabled
 	 */
-	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
+	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
+			       on ? 0x40 : 0x58);
 	if (ret)
 		return ret;
 
@@ -1969,7 +1962,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 	 * [5] = 1	: Gate clock when 'no packets'
 	 * [2] = 1	: MIPI bus in LP11 when 'no packets'
 	 */
-	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x24);
+	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00,
+			       on ? 0x24 : 0x04);
 	if (ret)
 		return ret;
 
@@ -1981,7 +1975,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 	 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
 	 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
 	 */
-	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x70);
+	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00,
+			       on ? 0x70 : 0x00);
 	if (ret)
 		return ret;
 
-- 
2.7.4

