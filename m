Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18D714844E
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727678AbfFQNoR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:44:17 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:38501 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726215AbfFQNoR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:44:17 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5HDfQkO016948;
        Mon, 17 Jun 2019 15:44:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Yp0bFSnxg47LGWXkCBcDsGAcLvPwKkpEg+xTLQR3KdE=;
 b=vi1yD4sbQFogkqjr12uHPbgtkf+zvAbJEIX6Sqqpc88EdSS6bkg9J3oT9JeGMDEnjcUA
 3DTnSpa7wIup+VF8dOn0lFy2TWWZMdbzO42PH9Iy44e5KNA+iHImsqcJ+VvgzK83X0Ld
 oiN1sPa1QI3mfT4G/eYN+ZEtw0z9q062yKY0lyQDj9Qcf5ZBk6OFScGVjMgEjiLO1RIi
 EwvHUYVeD1fRbwmRWBgs1Fi0dtA4c0CYOqd4CdbTt22kCRnNkTGEOirOPqRt1tKt5OMT
 xYvBHUQDzy79UYyqEBtq8jNQpboZ2CF3NhvfhtsiHfPNyTYzux/tSzzULQb+IIbR4qtF cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2t4peu2rmf-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 17 Jun 2019 15:44:11 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB64431;
        Mon, 17 Jun 2019 13:44:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B4B0A29A6;
        Mon, 17 Jun 2019 13:44:10 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun
 2019 15:44:10 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun 2019 15:44:10
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mickael Guene <mickael.guene@st.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v2 1/3] media: st-mipid02: add support of RGB565
Date:   Mon, 17 Jun 2019 15:43:56 +0200
Message-ID: <1560779038-26012-2-git-send-email-hugues.fruchet@st.com>
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

Add support of RGB565 pixel format.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/i2c/st-mipid02.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 9369f38..76a9f52 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -61,7 +61,8 @@ static const u32 mipid02_supported_fmt_codes[] = {
 	MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12,
 	MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12,
-	MEDIA_BUS_FMT_UYVY8_1X16, MEDIA_BUS_FMT_BGR888_1X24
+	MEDIA_BUS_FMT_UYVY8_1X16, MEDIA_BUS_FMT_BGR888_1X24,
+	MEDIA_BUS_FMT_RGB565_2X8_LE, MEDIA_BUS_FMT_RGB565_2X8_BE,
 };
 
 /* regulator supplies */
@@ -128,6 +129,8 @@ static int bpp_from_code(__u32 code)
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
 		return 12;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_RGB565_2X8_LE:
+	case MEDIA_BUS_FMT_RGB565_2X8_BE:
 		return 16;
 	case MEDIA_BUS_FMT_BGR888_1X24:
 		return 24;
@@ -158,6 +161,9 @@ static u8 data_type_from_code(__u32 code)
 		return 0x1e;
 	case MEDIA_BUS_FMT_BGR888_1X24:
 		return 0x24;
+	case MEDIA_BUS_FMT_RGB565_2X8_LE:
+	case MEDIA_BUS_FMT_RGB565_2X8_BE:
+		return 0x22;
 	default:
 		return 0;
 	}
-- 
2.7.4

