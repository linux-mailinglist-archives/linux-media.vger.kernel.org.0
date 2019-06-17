Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20CD34845F
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfFQNpW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:45:22 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:13828 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725884AbfFQNpW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:45:22 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5HDfLpV026019;
        Mon, 17 Jun 2019 15:44:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TukET5a1B87T8jAy8Pcez1BbOi6ltkalZ8o/aJvv4Ow=;
 b=DfyeHbBodyNC7xlupkSuyuz6HEZY+FH5jtORUN+y9B1TKxuO2geqtoBs17rQpOTY6AGW
 6rXrn6AUZXu3Wmyybdol0t2C+TyZ/yf3IqE27CzZG4C4ngTjf/3ps7U2h/UDZGvGPhN7
 v0Iet8Gd643ilcQLocoYPG3MWyLKWismAQmejWLhNgLEmKu+zHKAMbmviCyriSRPtroZ
 LqspCfwS8YJx0V88PVDqCsQJ1dcvfM5/nbVA+tG3Xc9sp+F9GsGYbd90hXWdZeOF7ddo
 dAxbWXccgSywZ5RWkt+NKeOHj6PD4Fj0UJbBElvDiLLSGvf0OjzbH9D4ox57lOTz3drB KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2t4nt834nu-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 17 Jun 2019 15:44:15 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78C743A;
        Mon, 17 Jun 2019 13:44:14 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CCB12AFF;
        Mon, 17 Jun 2019 13:44:14 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun
 2019 15:44:14 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun 2019 15:44:13
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mickael Guene <mickael.guene@st.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v2 3/3] media: st-mipid02: add support of JPEG
Date:   Mon, 17 Jun 2019 15:43:58 +0200
Message-ID: <1560779038-26012-4-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560779038-26012-1-git-send-email-hugues.fruchet@st.com>
References: <1560779038-26012-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-17_06:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of JPEG pixel format.
This requires auto detection of data type from CSI-2 stream.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/i2c/st-mipid02.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 35946ad..ff8a4d8 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -64,6 +64,7 @@ static const u32 mipid02_supported_fmt_codes[] = {
 	MEDIA_BUS_FMT_UYVY8_1X16, MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_RGB565_2X8_LE, MEDIA_BUS_FMT_RGB565_2X8_BE,
 	MEDIA_BUS_FMT_YUYV8_2X8, MEDIA_BUS_FMT_UYVY8_2X8,
+	MEDIA_BUS_FMT_JPEG_1X8
 };
 
 /* regulator supplies */
@@ -101,6 +102,7 @@ struct mipid02_dev {
 		u8 data_lane1_reg1;
 		u8 mode_reg1;
 		u8 mode_reg2;
+		u8 data_selection_ctrl;
 		u8 data_id_rreg;
 		u8 pix_width_ctrl;
 		u8 pix_width_ctrl_emb;
@@ -463,6 +465,7 @@ static int mipid02_configure_from_tx(struct mipid02_dev *bridge)
 {
 	struct v4l2_fwnode_endpoint *ep = &bridge->tx;
 
+	bridge->r.data_selection_ctrl = SELECTION_MANUAL_WIDTH;
 	bridge->r.pix_width_ctrl = ep->bus.parallel.bus_width;
 	bridge->r.pix_width_ctrl_emb = ep->bus.parallel.bus_width;
 	if (ep->bus.parallel.flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
@@ -478,10 +481,15 @@ static int mipid02_configure_from_code(struct mipid02_dev *bridge)
 	u8 data_type;
 
 	bridge->r.data_id_rreg = 0;
-	data_type = data_type_from_code(bridge->fmt.code);
-	if (!data_type)
-		return -EINVAL;
-	bridge->r.data_id_rreg = data_type;
+
+	if (bridge->fmt.code != MEDIA_BUS_FMT_JPEG_1X8) {
+		bridge->r.data_selection_ctrl |= SELECTION_MANUAL_DATA;
+
+		data_type = data_type_from_code(bridge->fmt.code);
+		if (!data_type)
+			return -EINVAL;
+		bridge->r.data_id_rreg = data_type;
+	}
 
 	return 0;
 }
@@ -565,7 +573,7 @@ static int mipid02_stream_enable(struct mipid02_dev *bridge)
 	if (ret)
 		goto error;
 	ret = mipid02_write_reg(bridge, MIPID02_DATA_SELECTION_CTRL,
-		SELECTION_MANUAL_DATA | SELECTION_MANUAL_WIDTH);
+		bridge->r.data_selection_ctrl);
 	if (ret)
 		goto error;
 	ret = mipid02_write_reg(bridge, MIPID02_PIX_WIDTH_CTRL,
-- 
2.7.4

