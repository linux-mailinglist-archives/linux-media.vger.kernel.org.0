Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6152A5280BF
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 11:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237744AbiEPJVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 05:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbiEPJVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 05:21:15 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185D362FA;
        Mon, 16 May 2022 02:21:11 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G7UHnR024416;
        Mon, 16 May 2022 11:20:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=0BSoCdtIzeozy9JDSMEC2EkfA3L2AByvAuj91yhKQPw=;
 b=43Y+VEymvQKxUSe8/n/y16VFlxqNHOB9ddS0zgM+NFWy5WiD2+fbNfIbQzcleu4xWYvM
 f16DSN/UaJRUsPtpOijUs5PFwHshwkmKMTUrkkPDt54E9QrFXCqWGmAbMYOaOlt/P7m7
 bPItgJBAmGAinIZsdijf+Xo6X9U5aWvQ9A/HdBE4wQzpBpFPRA06n3FsjJA0tWt9EoUh
 e9WxPVyGYtEJSgDmL5n3nxEwwBli7OHrI9mhnEL3UnKRCYkTgb4NZ8LS4q+ATvT4gtq7
 gK1ZZI1sdvAqVzcC1dfsS5ZesW55HPUDVPqoD11CBZrHguGyCH12uBDcNEXuulwYRFV9 mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23ah9k15-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 16 May 2022 11:20:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE60E10002A;
        Mon, 16 May 2022 11:20:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B62252171DB;
        Mon, 16 May 2022 11:20:01 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 16 May 2022 11:20:00
 +0200
From:   Hugues Fruchet <hugues.fruchet@foss.st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [PATCH 3/3] media: st-mipid02: expose 1X16 serial pixel format
Date:   Mon, 16 May 2022 11:19:34 +0200
Message-ID: <20220516091934.263141-4-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516091934.263141-1-hugues.fruchet@foss.st.com>
References: <20220516091934.263141-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_05,2022-05-13_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Expose RGB & YUV 1X16 serial pixel format variants to comply
with CSI-2 camera sensor pixel formats.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 drivers/media/i2c/st-mipid02.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index fe884d81b08b..16cc547976dd 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -62,7 +62,9 @@ static const u32 mipid02_supported_fmt_codes[] = {
 	MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12,
 	MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12,
-	MEDIA_BUS_FMT_UYVY8_1X16, MEDIA_BUS_FMT_BGR888_1X24,
+	MEDIA_BUS_FMT_YUYV8_1X16, MEDIA_BUS_FMT_YVYU8_1X16,
+	MEDIA_BUS_FMT_UYVY8_1X16, MEDIA_BUS_FMT_VYUY8_1X16,
+	MEDIA_BUS_FMT_RGB565_1X16, MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_RGB565_2X8_LE, MEDIA_BUS_FMT_RGB565_2X8_BE,
 	MEDIA_BUS_FMT_YUYV8_2X8, MEDIA_BUS_FMT_YVYU8_2X8,
 	MEDIA_BUS_FMT_UYVY8_2X8, MEDIA_BUS_FMT_VYUY8_2X8,
@@ -132,7 +134,11 @@ static int bpp_from_code(__u32 code)
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
 		return 12;
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
+	case MEDIA_BUS_FMT_RGB565_1X16:
 	case MEDIA_BUS_FMT_YUYV8_2X8:
 	case MEDIA_BUS_FMT_YVYU8_2X8:
 	case MEDIA_BUS_FMT_UYVY8_2X8:
@@ -165,7 +171,10 @@ static u8 data_type_from_code(__u32 code)
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
 		return 0x2c;
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
 	case MEDIA_BUS_FMT_YUYV8_2X8:
 	case MEDIA_BUS_FMT_YVYU8_2X8:
 	case MEDIA_BUS_FMT_UYVY8_2X8:
@@ -173,6 +182,7 @@ static u8 data_type_from_code(__u32 code)
 		return 0x1e;
 	case MEDIA_BUS_FMT_BGR888_1X24:
 		return 0x24;
+	case MEDIA_BUS_FMT_RGB565_1X16:
 	case MEDIA_BUS_FMT_RGB565_2X8_LE:
 	case MEDIA_BUS_FMT_RGB565_2X8_BE:
 		return 0x22;
@@ -207,8 +217,16 @@ static __u32 get_fmt_code(__u32 code)
 
 static __u32 serial_to_parallel_code(__u32 serial)
 {
+	if (serial == MEDIA_BUS_FMT_RGB565_1X16)
+		return MEDIA_BUS_FMT_RGB565_2X8_LE;
+	if (serial == MEDIA_BUS_FMT_YUYV8_1X16)
+		return MEDIA_BUS_FMT_YUYV8_2X8;
+	if (serial == MEDIA_BUS_FMT_YVYU8_1X16)
+		return MEDIA_BUS_FMT_YVYU8_2X8;
 	if (serial == MEDIA_BUS_FMT_UYVY8_1X16)
 		return MEDIA_BUS_FMT_UYVY8_2X8;
+	if (serial == MEDIA_BUS_FMT_VYUY8_1X16)
+		return MEDIA_BUS_FMT_VYUY8_2X8;
 	if (serial == MEDIA_BUS_FMT_BGR888_1X24)
 		return MEDIA_BUS_FMT_BGR888_3X8;
 
-- 
2.25.1

