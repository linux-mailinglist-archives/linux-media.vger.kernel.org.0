Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3006C58301
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 14:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbfF0M53 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 08:57:29 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:4158 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726059AbfF0M53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 08:57:29 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5RCshKq021292;
        Thu, 27 Jun 2019 14:57:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=arNT3kHueZtPkqh5DU3MVQwqA8rvFeVHl3XFKrjrxPE=;
 b=NSM31XfOHAbntPM73K8RWoG08h0DnAngtWGI2TfaqucnfLb5bubUPGBIxccw9PDVgFfG
 qPhjNJmuF5RyoAUxv1dFuvmXZABOgiyLqZoszw3Pw9CMNJoiDDM/co0bWf1XhOnSsAQ8
 7hpUzVubDY+9rX8xKC8TSXFihIA10e8elBtwBvQnotTXp8+Ggw8UwnOsAeuBwcxqJFBm
 PFPTpoiS6dpnrnVMGNCNu9imjIUea9DRW/ySh7c5PfdGjrMBfd3NM+f0n9JpkkDIHhUu
 PUncJdg85ineWyA7rFc6sinx6iz/GS9qlzD+erWjzDoayzRpQD/C3xJlOvOFyUmJvaSQ mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2t9d2wxw70-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 27 Jun 2019 14:57:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 480D434;
        Thu, 27 Jun 2019 12:57:17 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F244127E0;
        Thu, 27 Jun 2019 12:57:16 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 27 Jun
 2019 14:57:16 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 27 Jun 2019 14:57:16
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2] media: ov5640: add support of V4L2_CID_LINK_FREQ
Date:   Thu, 27 Jun 2019 14:57:04 +0200
Message-ID: <1561640224-24062-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-27_07:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of V4L2_CID_LINK_FREQ, this is needed
by some CSI-2 receivers.

384MHz is exposed for the time being, corresponding
to 96MHz pixel clock with 2 bytes per pixel on 2 data lanes.

This setup has been tested successfully with ST MIPID02
CSI-2 to parallel bridge.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
version 2:
  - do not set control read only as per Hans' comment:
    See https://www.mail-archive.com/linux-media@vger.kernel.org/msg147910.html

 drivers/media/i2c/ov5640.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 82d4ce9..e6307f3 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -218,6 +218,7 @@ struct ov5640_ctrls {
 	struct v4l2_ctrl *test_pattern;
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *link_freq;
 };
 
 struct ov5640_dev {
@@ -2198,6 +2199,10 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static const s64 link_freq_menu_items[] = {
+	384000000,
+};
+
 static int ov5640_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_pad_config *cfg,
 			  struct v4l2_subdev_format *format)
@@ -2636,6 +2641,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VFLIP:
 		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
 		break;
+	case V4L2_CID_LINK_FREQ:
+		return 0;
 	default:
 		ret = -EINVAL;
 		break;
@@ -2703,6 +2710,9 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 				       V4L2_CID_POWER_LINE_FREQUENCY_AUTO, 0,
 				       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
 
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
+						  0, 0, link_freq_menu_items);
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto free_ctrls;
-- 
2.7.4

