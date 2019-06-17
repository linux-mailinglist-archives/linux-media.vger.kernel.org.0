Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A154844B
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbfFQNny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:43:54 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:38603 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726215AbfFQNny (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:43:54 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5HDfQkK016948;
        Mon, 17 Jun 2019 15:43:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=1+JyzX+uWB/UX95RSBssQXnJnryA4Vg5SMyvldwuDK0=;
 b=WzVW3F3qe7YtxY8sEdU2/COdGfr1utmuM7zMtpAbi9aMsnYPg8tCLQAnbYOiQZ4C5h6P
 3+1hfyevH+4B9bninF3E2yIKv5qSTXD8qbTOEwpaldZB/93owFUiqR1OTMKdSFW/MYqg
 RljPQmvhmRxWIzPsem8C32PqTt9rMjGVuExZx8k+eHIcwCqp0Gl0gMhcHCm3pNU4ji1H
 EUxyorZ6a2oiLuvWsFBSDL1RC14SSgjV6CDNbwAT9umiUFlwbzjNRarPwKNiDUOEBZpH
 C27lTgTL8zvmM4UJCV9LPg4FsQC386/xMZEqVll7AzI0E5QWH+fcOL5cLDHPy3uowG+s Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2t4peu2rjd-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 17 Jun 2019 15:43:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C23A738;
        Mon, 17 Jun 2019 13:43:44 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A370525DF;
        Mon, 17 Jun 2019 13:43:44 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun
 2019 15:43:44 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun 2019 15:43:42
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mickael Guene <mickael.guene@st.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH] media: st-mipid02: add support of V4L2_CID_LINK_FREQ
Date:   Mon, 17 Jun 2019 15:43:31 +0200
Message-ID: <1560779011-25960-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-17_06:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ask device connected on sink pad for link frequency
in order to configure CLK_LANE_REG1 (ui_x4).
If not available, ask for pixel rate information to compute it.

This is needed to deal with compressed format such as JPEG
where number of bits per pixel is unknown: computation of
link frequency from pixel rate is not possible.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/i2c/st-mipid02.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 9369f38..8623f30 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -331,6 +331,25 @@ static int mipid02_detect(struct mipid02_dev *bridge)
 	return mipid02_read_reg(bridge, MIPID02_CLK_LANE_WR_REG1, &reg);
 }
 
+static u32 mipid02_get_link_freq_from_cid_link_freq(struct mipid02_dev *bridge,
+						    struct v4l2_subdev *subdev)
+{
+	struct v4l2_querymenu qm = {.id = V4L2_CID_LINK_FREQ, };
+	struct v4l2_ctrl *ctrl;
+	int ret;
+
+	ctrl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_LINK_FREQ);
+	if (!ctrl)
+		return 0;
+	qm.index = v4l2_ctrl_g_ctrl(ctrl);
+
+	ret = v4l2_querymenu(subdev->ctrl_handler, &qm);
+	if (ret)
+		return 0;
+
+	return qm.value;
+}
+
 static u32 mipid02_get_link_freq_from_cid_pixel_rate(struct mipid02_dev *bridge,
 						     struct v4l2_subdev *subdev)
 {
@@ -358,10 +377,14 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge)
 	struct v4l2_subdev *subdev = bridge->s_subdev;
 	u32 link_freq;
 
-	link_freq = mipid02_get_link_freq_from_cid_pixel_rate(bridge, subdev);
+	link_freq = mipid02_get_link_freq_from_cid_link_freq(bridge, subdev);
 	if (!link_freq) {
-		dev_err(&client->dev, "Failed to detect link frequency");
-		return -EINVAL;
+		link_freq = mipid02_get_link_freq_from_cid_pixel_rate(bridge,
+								      subdev);
+		if (!link_freq) {
+			dev_err(&client->dev, "Failed to get link frequency");
+			return -EINVAL;
+		}
 	}
 
 	dev_dbg(&client->dev, "detect link_freq = %d Hz", link_freq);
-- 
2.7.4

