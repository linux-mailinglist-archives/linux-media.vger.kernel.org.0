Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B2B3C6F2
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 11:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404839AbfFKJEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 05:04:38 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35788 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404619AbfFKJEh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 05:04:37 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5B8vAwF002977;
        Tue, 11 Jun 2019 11:03:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=6eMZguSYGIl1IRLc2AkseWpMUjpjvve1Wq0sb9wlb0g=;
 b=E2aNMVXSZm1ZntLe1lqTr9D0r93sdVXzsD37o10ZG0mvLeTB31r1eaIlbLii3e9opYWS
 ci3h3wyt+9s2IK1tEYLH1keuZv72kFHya8UdR/yDWahclY0hOmWFHupUmqBt254dWWmK
 Q8zpT+vgeJckVLhymgqUThmPlUm5cClj7yGf2/Nu81NwsJQpl2XY66zLlMkqxLYa5Dnq
 ujRnBIgjkAQBd4+RYqJR+f14R7jpgRRY3b4jhK8kqLFRfypekgrnfQz+t1pNLcda1Ibd
 95A9wnGFz60fY4Ph3EXIhaP684JpXtNnTfOXbhZaDYThUJs84VvS3JY2swsG25N0wFs4 dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2t26rkgvub-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 11 Jun 2019 11:03:29 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0A4C3F;
        Tue, 11 Jun 2019 09:03:22 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACEBB256F;
        Tue, 11 Jun 2019 09:03:22 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 11 Jun
 2019 11:03:22 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 11 Jun 2019 11:03:22
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mickael Guene <mickael.guene@st.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH 3/3] media: st-mipid02: add support of JPEG
Date:   Tue, 11 Jun 2019 11:02:49 +0200
Message-ID: <1560243769-17510-4-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560243769-17510-1-git-send-email-hugues.fruchet@st.com>
References: <1560243769-17510-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-11_04:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of JPEG pixel format.
This requires auto detection of data type from CSI-2 stream.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/i2c/st-mipid02.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 35946ad..cd275d7 100644
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
@@ -134,6 +136,7 @@ static int bpp_from_code(__u32 code)
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 	case MEDIA_BUS_FMT_RGB565_2X8_LE:
 	case MEDIA_BUS_FMT_RGB565_2X8_BE:
+	case MEDIA_BUS_FMT_JPEG_1X8:
 		return 16;
 	case MEDIA_BUS_FMT_BGR888_1X24:
 		return 24;
@@ -463,6 +466,7 @@ static int mipid02_configure_from_tx(struct mipid02_dev *bridge)
 {
 	struct v4l2_fwnode_endpoint *ep = &bridge->tx;
 
+	bridge->r.data_selection_ctrl = SELECTION_MANUAL_WIDTH;
 	bridge->r.pix_width_ctrl = ep->bus.parallel.bus_width;
 	bridge->r.pix_width_ctrl_emb = ep->bus.parallel.bus_width;
 	if (ep->bus.parallel.flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
@@ -478,10 +482,15 @@ static int mipid02_configure_from_code(struct mipid02_dev *bridge)
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
@@ -565,7 +574,7 @@ static int mipid02_stream_enable(struct mipid02_dev *bridge)
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

