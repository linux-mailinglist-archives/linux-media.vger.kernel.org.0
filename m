Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7B9286117
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 16:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgJGOUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 10:20:18 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:30920 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728554AbgJGOUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 10:20:18 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097ECDTs028431;
        Wed, 7 Oct 2020 16:20:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=UfZM1yzIWjbDkh7oLHPFz0jGjKr/ssYOZR148hLjnK0=;
 b=vPe5EE1l/J+rEyVb/qUTyTrBstiYb0XXULV8f2WYrGlSbXU4PZQwywoG8nFmBoNCn6uQ
 WDpVQLiQQTbkv9GKf9Mvd+u/DvlRzj1wfKeluxPsZSbYN+vvmIuMPUeVNXaz8TKf87Ut
 KOaf1SvMZgKnDuB1AASWlTItgSZ30fbSo8cY/o4fxAcqgVumWkKD3n80mAD5M0onqU+C
 0I+DsOXg9rLD0JmZMRr3CM8Ev5oZEXOT/7LTGwCJRVZ0RAp2YNiv4vHoEYPzlPuctZmw
 wL+AznL9fQ6UTmNnkzOcOJAx1+KNLLDBKkhS+8UMHq9hmQsCMlVvu3FmzahdcDl/W0Ff sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3402tjw3a1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Oct 2020 16:20:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 660B410002A;
        Wed,  7 Oct 2020 16:20:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52EE42B1523;
        Wed,  7 Oct 2020 16:20:04 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 16:20:03
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Alain Volmat <alain.volmat@st.com>
Subject: [PATCH v2] media: ov5640: add support of 160x120 resolution
Date:   Wed, 7 Oct 2020 16:19:43 +0200
Message-ID: <1602080383-29934-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-07_09:2020-10-06,2020-10-07 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of 160x120 resolution.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
version 2:
  - fix missing max framerate

 drivers/media/i2c/ov5640.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8d0254d..1bb89f0 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -98,7 +98,8 @@
 #define OV5640_REG_AVG_READOUT		0x56a1
 
 enum ov5640_mode_id {
-	OV5640_MODE_QCIF_176_144 = 0,
+	OV5640_MODE_QQVGA_160_120 = 0,
+	OV5640_MODE_QCIF_176_144,
 	OV5640_MODE_QVGA_320_240,
 	OV5640_MODE_VGA_640_480,
 	OV5640_MODE_NTSC_720_480,
@@ -416,6 +417,24 @@ static const struct reg_value ov5640_setting_QVGA_320_240[] = {
 	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
 };
 
+static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
+	{0x3c07, 0x08, 0, 0},
+	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
+	{0x3814, 0x31, 0, 0},
+	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
+	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
+	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
+	{0x3810, 0x00, 0, 0},
+	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
+	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
+	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
+	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
+	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
+	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
+	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
+	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
+};
+
 static const struct reg_value ov5640_setting_QCIF_176_144[] = {
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
@@ -552,6 +571,11 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
 
 static const struct ov5640_mode_info
 ov5640_mode_data[OV5640_NUM_MODES] = {
+	{OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
+	 160, 1896, 120, 984,
+	 ov5640_setting_QCIF_176_144,
+	 ARRAY_SIZE(ov5640_setting_QCIF_176_144),
+	 OV5640_30_FPS},
 	{OV5640_MODE_QCIF_176_144, SUBSAMPLING,
 	 176, 1896, 144, 984,
 	 ov5640_setting_QCIF_176_144,
-- 
2.7.4

