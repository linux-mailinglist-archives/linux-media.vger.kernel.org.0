Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBF2648450
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfFQNoV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:44:21 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:49718 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726215AbfFQNoT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:44:19 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5HDeuob002079;
        Mon, 17 Jun 2019 15:44:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=6yBZz4ABYpxtClu7j1ho6thn8SuVUwy/sipntIef450=;
 b=fnwzH5rlPwBPBzB5hgQRo+7VRjIrqw4zRq8SdBgmWMd4Z293hmmV6LvpL5sDhQmVT2MY
 WBSp/O0aTNs2+cxFctPQx7x5dVutDl70MdH7K3LYUxl5hKxt1oDGk25HSpMUpPnnU2d9
 xXnqIcBWFBS+f/79X7X+6bDfOkHN2B26MsL2+aTh/7u0y3bSs+uzwA9CSFVD53/O8oDF
 PzWh6V44DwhZLmCVsOY4MV1le0F46UYa5EBRd/fsrPrCU3MRei/PhXG0SvNDw/x17rix
 UKUCLKAQUU/3iH+WoIjcfMqAutp63iiPcOC36exkpZovCOxR9H2Zrl/U0nGj+igHRawU WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2t4qjhtrvb-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 17 Jun 2019 15:44:13 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 236DC31;
        Mon, 17 Jun 2019 13:44:12 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 044F529C2;
        Mon, 17 Jun 2019 13:44:11 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun
 2019 15:44:11 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun 2019 15:44:11
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mickael Guene <mickael.guene@st.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v2 2/3] media: st-mipid02: add support of YUYV8 and UYVY8
Date:   Mon, 17 Jun 2019 15:43:57 +0200
Message-ID: <1560779038-26012-3-git-send-email-hugues.fruchet@st.com>
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

Add support of YUYV8 and UYVY8 pixel formats.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/i2c/st-mipid02.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 76a9f52..35946ad 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -63,6 +63,7 @@ static const u32 mipid02_supported_fmt_codes[] = {
 	MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12,
 	MEDIA_BUS_FMT_UYVY8_1X16, MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_RGB565_2X8_LE, MEDIA_BUS_FMT_RGB565_2X8_BE,
+	MEDIA_BUS_FMT_YUYV8_2X8, MEDIA_BUS_FMT_UYVY8_2X8,
 };
 
 /* regulator supplies */
@@ -129,6 +130,8 @@ static int bpp_from_code(__u32 code)
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
 		return 12;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_2X8:
 	case MEDIA_BUS_FMT_RGB565_2X8_LE:
 	case MEDIA_BUS_FMT_RGB565_2X8_BE:
 		return 16;
@@ -158,6 +161,8 @@ static u8 data_type_from_code(__u32 code)
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
 		return 0x2c;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_2X8:
 		return 0x1e;
 	case MEDIA_BUS_FMT_BGR888_1X24:
 		return 0x24;
-- 
2.7.4

