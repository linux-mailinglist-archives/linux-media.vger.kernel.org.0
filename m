Return-Path: <linux-media+bounces-1027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB22E7F8D17
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 19:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DF6FB21099
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 18:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE40E2E413;
	Sat, 25 Nov 2023 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YVc8fFc+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655AFDB;
	Sat, 25 Nov 2023 10:24:30 -0800 (PST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AP1NcLf017784;
	Sat, 25 Nov 2023 19:24:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=2W7wCmX+NW6hmQI+fefcnZEdAolQngt0ItXz/a69y6s=; b=YV
	c8fFc+3++JkPvpRgNz0MlPsd2w76b3oGtor4ZTLK3rT50VrM1Z83p0F6Rm4W2/rO
	kc4JGd6jXgyHJQpb4ZvEmNOBn4nJH+ehbaU4qtApxd/VZhsKMnXoJFiin/fBn4gj
	vKt1iWhHPKDXhl4gaORTowhb9p6rby/fHbQf4rzN8bVAtek31HjaXT8KSSdFXj6w
	+3Z+ozl7P9ruuOXrLIL8O9Awj7/rRQvWhcFWbHlVlhzVZZ/Enktk6za42h78HvNF
	SYoFgIhfnbzr8JiYLAHA3XOGe72ZpeUYvgOA6oDZIhT+lVtsvYdA2CS/nF1W0qSq
	jAQrBmJiKMvOUZTWFChw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk77kj4t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Nov 2023 19:24:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C40BF10002A;
	Sat, 25 Nov 2023 19:24:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BABCD23C6AF;
	Sat, 25 Nov 2023 19:24:07 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 25 Nov
 2023 19:24:08 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/7] media: i2c: st-mipid02: use mipi-csi macro for data-type
Date: Sat, 25 Nov 2023 19:20:53 +0100
Message-ID: <20231125182057.1379357-6-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231125182057.1379357-1-alain.volmat@foss.st.com>
References: <20231125182057.1379357-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-25_18,2023-11-22_01,2023-05-22_02

Use MIPI data-type macros.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/i2c/st-mipid02.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 7af209905d7b..783c2848c584 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
@@ -158,17 +159,17 @@ static u8 data_type_from_code(__u32 code)
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
-		return 0x2a;
+		return MIPI_CSI2_DT_RAW8;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
-		return 0x2b;
+		return MIPI_CSI2_DT_RAW10;
 	case MEDIA_BUS_FMT_SBGGR12_1X12:
 	case MEDIA_BUS_FMT_SGBRG12_1X12:
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
-		return 0x2c;
+		return MIPI_CSI2_DT_RAW12;
 	case MEDIA_BUS_FMT_YUYV8_1X16:
 	case MEDIA_BUS_FMT_YVYU8_1X16:
 	case MEDIA_BUS_FMT_UYVY8_1X16:
@@ -177,13 +178,13 @@ static u8 data_type_from_code(__u32 code)
 	case MEDIA_BUS_FMT_YVYU8_2X8:
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 	case MEDIA_BUS_FMT_VYUY8_2X8:
-		return 0x1e;
+		return MIPI_CSI2_DT_YUV422_8B;
 	case MEDIA_BUS_FMT_BGR888_1X24:
-		return 0x24;
+		return MIPI_CSI2_DT_RGB888;
 	case MEDIA_BUS_FMT_RGB565_1X16:
 	case MEDIA_BUS_FMT_RGB565_2X8_LE:
 	case MEDIA_BUS_FMT_RGB565_2X8_BE:
-		return 0x22;
+		return MIPI_CSI2_DT_RGB565;
 	default:
 		return 0;
 	}
-- 
2.25.1


