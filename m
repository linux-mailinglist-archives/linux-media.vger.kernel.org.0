Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1EE428CABC
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 11:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403901AbgJMJCo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 05:02:44 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:12934 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388779AbgJMJCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 05:02:44 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09D8v50Y003629;
        Tue, 13 Oct 2020 11:02:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=bRxXQAJcJvPYLqbLKVy4KoRoI8NgYjJq0APN1uuFVFs=;
 b=Pm+WlAX/e0XG0s/Wh96zmCgX1f3kRI7QbMD2AHUJex6LKRQt2r0xrH9a6FSh43Ba7Jqy
 Qsq8yYTVx+TD60WRf1Z3zq8cy6uF/H7d2zSC9ZGvWk5G2qznl9caUVgSR0g7hUq2kRnM
 3tETHo/J/vLalGrXs1W0d/gTVloTYaKWsIyKegZLy+bZEXDDGV1MKCljZ4By4gQInYb9
 RM4UnBiSxlqsf9Qxj+X6qj/DN+LtOvo7t0MRQ7xiEqNvQw034onC4fe+9OWJiLblPvJO
 59ATgYX0fv8pWikVT7FxPMD9QnRa4jS9lzGzrfEuH+hiv4avdyiA+LoksjunGT0lMxpR EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34356e5q86-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Oct 2020 11:02:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D43E710002A;
        Tue, 13 Oct 2020 11:02:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F648221F9B;
        Tue, 13 Oct 2020 11:02:26 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 13 Oct 2020 11:02:26
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
Subject: [PATCH v3] media: ov5640: fix support of BT656 bus mode
Date:   Tue, 13 Oct 2020 11:02:23 +0200
Message-ID: <1602579743-10286-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-13_02:2020-10-13,2020-10-13 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix PCLK polarity not being taken into account.
Add comments about BT656 register control.
Remove useless ov5640_set_stream_bt656() function.
Refine comments about MIPI IO register control.

Fixes: 4039b03720f7 ("media: i2c: ov5640: Add support for BT656 mode")
Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
version 3:
  - reformat code as per Jacopo's comments
version 2:
  - keep reset to default without error check at power off

 drivers/media/i2c/ov5640.c | 82 +++++++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8d0254d..8f0812e 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1216,20 +1216,6 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
 			      BIT(1), on ? 0 : BIT(1));
 }
 
-static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
-{
-	int ret;
-
-	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
-			       on ? 0x1 : 0x00);
-	if (ret)
-		return ret;
-
-	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
-				OV5640_REG_SYS_CTRL0_SW_PWUP :
-				OV5640_REG_SYS_CTRL0_SW_PWDN);
-}
-
 static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 {
 	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
@@ -1994,13 +1980,13 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
 {
 	unsigned int flags = sensor->ep.bus.parallel.flags;
-	u8 pclk_pol = 0;
-	u8 hsync_pol = 0;
-	u8 vsync_pol = 0;
+	bool bt656 = sensor->ep.bus_type == V4L2_MBUS_BT656;
+	u8 polarities = 0;
 	int ret;
 
 	if (!on) {
 		/* Reset settings to their default values. */
+		ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00, 0x00);
 		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
 		ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, 0x20);
 		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
@@ -2024,7 +2010,35 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
 	 * - VSYNC:	active high
 	 * - HREF:	active low
 	 * - PCLK:	active low
+	 *
+	 * VSYNC & HREF are not configured if BT656 bus mode is selected
 	 */
+
+	/*
+	 * BT656 embedded synchronization configuration
+	 *
+	 * CCIR656 CTRL00
+	 * - [7]:	SYNC code selection (0: auto generate sync code,
+	 *		1: sync code from regs 0x4732-0x4735)
+	 * - [6]:	f value in CCIR656 SYNC code when fixed f value
+	 * - [5]:	Fixed f value
+	 * - [4:3]:	Blank toggle data options (00: data=1'h040/1'h200,
+	 *		01: data from regs 0x4736-0x4738, 10: always keep 0)
+	 * - [1]:	Clip data disable
+	 * - [0]:	CCIR656 mode enable
+	 *
+	 * Default CCIR656 SAV/EAV mode with default codes
+	 * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
+	 * - CCIR656 mode enable
+	 * - auto generation of sync codes
+	 * - blank toggle data 1'h040/1'h200
+	 * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
+	 */
+	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
+			       bt656 ? 0x01 : 0x00);
+	if (ret)
+		return ret;
+
 	/*
 	 * configure parallel port control lines polarity
 	 *
@@ -2035,29 +2049,26 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
 	 *		datasheet and hardware, 0 is active high
 	 *		and 1 is active low...)
 	 */
-	if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
-		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
-			pclk_pol = 1;
+	if (!bt656) {
 		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
-			hsync_pol = 1;
+			polarities |= BIT(1);
 		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
-			vsync_pol = 1;
-
-		ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
-				       (pclk_pol << 5) | (hsync_pol << 1) |
-				       vsync_pol);
-
-		if (ret)
-			return ret;
+			polarities |= BIT(0);
 	}
+	if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+		polarities |= BIT(5);
+
+	ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, polarities);
+	if (ret)
+		return ret;
 
 	/*
-	 * powerdown MIPI TX/RX PHY & disable MIPI
+	 * powerdown MIPI TX/RX PHY & enable DVP
 	 *
 	 * MIPI CONTROL 00
-	 * 4:	 PWDN PHY TX
-	 * 3:	 PWDN PHY RX
-	 * 2:	 MIPI enable
+	 * [4] = 1	: Power down MIPI HS Tx
+	 * [3] = 1	: Power down MIPI LS Rx
+	 * [2] = 0	: DVP enable (MIPI disable)
 	 */
 	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
 	if (ret)
@@ -2074,8 +2085,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
 	 * - [3:0]:	D[9:6] output enable
 	 */
 	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
-			       sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
-			       0x7f : 0x1f);
+			       bt656 ? 0x1f : 0x7f);
 	if (ret)
 		return ret;
 
@@ -2925,8 +2935,6 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 
 		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
 			ret = ov5640_set_stream_mipi(sensor, enable);
-		else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
-			ret = ov5640_set_stream_bt656(sensor, enable);
 		else
 			ret = ov5640_set_stream_dvp(sensor, enable);
 
-- 
2.7.4

