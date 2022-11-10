Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B45F62436A
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 14:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiKJNlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 08:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiKJNlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 08:41:49 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463832FFDD
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 05:41:48 -0800 (PST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AAAGGHi032119;
        Thu, 10 Nov 2022 14:41:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=njv+Z2dQm36/Rmb+9Mk+m+ML/AGM+fzJTh8EKP4UMhA=;
 b=fji4WtUPj7gPKYzYpqEh/3DRaNPMwKnZhXjmGyyJc5/UsTPPv6DOtCGn5KARFHlGMnJH
 sDIHnwXz9QdV3LcMAj/kTl8pEx0YTxkpPKs/RuMZKgrohO6ImaGYlzmmEM33uQKum+zR
 0KSDPe6IM6UmBD0qtMXAr3xaZBiznaFhLJUuw5fnLzqMGI8rJ2KzyXvy2bBfersO/CYo
 alo0Oga4ZqdqoQPtX5qLMDJm5Uh9SxsIl5ow5RbEEshJ0w0XHhJdCEuSaQw3E1D5HkkP
 1UQ9yiWpKs+2dTDHnE04mQ39R/TojuOX5d1N6S1DACl0UIiVrzLANiqCC66fHIQA3A2g Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3krvdbayp7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Nov 2022 14:41:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95C3C100038;
        Thu, 10 Nov 2022 14:41:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E7F8222CBA;
        Thu, 10 Nov 2022 14:41:15 +0100 (CET)
Received: from localhost (10.211.12.224) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 10 Nov
 2022 14:41:15 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: [PATCH] media: i2c: st-vgxy61: Fix smatch warnings
Date:   Thu, 10 Nov 2022 14:41:02 +0100
Message-ID: <20221110134102.64990-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.211.12.224]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_08,2022-11-09_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix some 'vgxy61_write_reg' return vars not being signed int.
Fix 'expo_long_max' not being initialized.
Handle 'pm_runtime_get_sync' call that can return 1.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/st-vgxy61.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index b0f4eeadeac6..32e686e21aaa 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -885,7 +885,7 @@ static int vgxy61_apply_gpiox_strobe_mode(struct vgxy61_dev *sensor,
 					  unsigned int idx)
 {
 	static const u8 index2val[] = {0x0, 0x1, 0x3};
-	u16 reg;
+	int reg;
 
 	reg = vgxy61_read_reg(sensor, VGXY61_REG_SIGNALS_CTRL);
 	if (reg < 0)
@@ -988,7 +988,7 @@ static int vgxy61_update_exposure(struct vgxy61_dev *sensor, u16 new_expo_long,
 	u16 new_expo_short = 0;
 	u16 expo_short_max = 0;
 	u16 expo_long_min = VGXY61_MIN_EXPOSURE;
-	u16 expo_long_max;
+	u16 expo_long_max = 0;
 
 	/* Compute short exposure according to hdr mode and long exposure */
 	switch (hdr) {
@@ -1174,6 +1174,9 @@ static int vgxy61_stream_enable(struct vgxy61_dev *sensor)
 		return ret;
 	}
 
+	/* pm_runtime_get_sync() can return 1 as a valid return code */
+	ret = 0;
+
 	vgxy61_write_reg(sensor, VGXY61_REG_FORMAT_CTRL,
 			 get_bpp_by_code(sensor->fmt.code), &ret);
 	vgxy61_write_reg(sensor, VGXY61_REG_OIF_ROI0_CTRL,
@@ -1565,7 +1568,7 @@ static int vgxy61_configure(struct vgxy61_dev *sensor)
 {
 	u32 sensor_freq;
 	u8 prediv, mult;
-	u16 line_length;
+	int line_length;
 	int ret = 0;
 
 	compute_pll_parameters_by_freq(sensor->clk_freq, &prediv, &mult);
@@ -1606,8 +1609,7 @@ static int vgxy61_configure(struct vgxy61_dev *sensor)
 static int vgxy61_patch(struct vgxy61_dev *sensor)
 {
 	struct i2c_client *client = sensor->i2c_client;
-	u16 patch;
-	int ret;
+	int patch, ret;
 
 	ret = vgxy61_write_array(sensor, VGXY61_REG_FWPATCH_START_ADDR,
 				 sizeof(patch_array), patch_array);
@@ -1645,7 +1647,7 @@ static int vgxy61_patch(struct vgxy61_dev *sensor)
 static int vgxy61_detect_cut_version(struct vgxy61_dev *sensor)
 {
 	struct i2c_client *client = sensor->i2c_client;
-	u16 device_rev;
+	int device_rev;
 
 	device_rev = vgxy61_read_reg(sensor, VGXY61_REG_REVISION);
 	if (device_rev < 0)
@@ -1671,9 +1673,8 @@ static int vgxy61_detect_cut_version(struct vgxy61_dev *sensor)
 static int vgxy61_detect(struct vgxy61_dev *sensor)
 {
 	struct i2c_client *client = sensor->i2c_client;
-	u16 id = 0;
-	int ret;
-	u8 st;
+	int id = 0;
+	int ret, st;
 
 	id = vgxy61_read_reg(sensor, VGXY61_REG_MODEL_ID);
 	if (id < 0)
-- 
2.25.1

