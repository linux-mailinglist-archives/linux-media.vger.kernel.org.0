Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49BA13C6F1
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 11:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404914AbfFKJEP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 05:04:15 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:25288 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404702AbfFKJEP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 05:04:15 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5B8u8HA021898;
        Tue, 11 Jun 2019 11:03:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Yp0bFSnxg47LGWXkCBcDsGAcLvPwKkpEg+xTLQR3KdE=;
 b=1Mlh6SJcPGRysv+LFfRyuf1T5VyHPL+wjsmK+mt02SK6UGOm5FkF7zC3O5Ywfz1WZzcb
 92P0lKQQYhJvnaBNpwOZsZCh/DlU5o2EQL+jT7UI3PrOPFkJDaPSsPd+Z8ljSv6YimJO
 JCd0OE0IbB+hfngdKTAzFCxssDiaBV+48bSQ4nJzcdnVpR/eBD4YAFecYZQtb8J3SK1a
 h3Jzm3hlDd0LWNuUF/c+Ix9eWXtQDs0xkWJOpPrJMk0fV1zseotMnFXXnraQ/CQo+MLq
 d7fMJSgoWy+DcfGGgkZRuIybqL8uLfiNACVkoCHWvZymSb+HXpnxuUPv0VmbufWImRQG zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2t26rp8vsx-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 11 Jun 2019 11:03:08 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D909D4A;
        Tue, 11 Jun 2019 09:03:07 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C049B256F;
        Tue, 11 Jun 2019 09:03:07 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 11 Jun
 2019 11:03:07 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 11 Jun 2019 11:03:06
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mickael Guene <mickael.guene@st.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH 1/3] media: st-mipid02: add support of RGB565
Date:   Tue, 11 Jun 2019 11:02:47 +0200
Message-ID: <1560243769-17510-2-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560243769-17510-1-git-send-email-hugues.fruchet@st.com>
References: <1560243769-17510-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-11_03:,,
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

