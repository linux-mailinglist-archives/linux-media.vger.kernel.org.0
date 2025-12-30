Return-Path: <linux-media+bounces-49746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FDCCEA400
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16973301D631
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2072E30BBBC;
	Tue, 30 Dec 2025 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6HbKjvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B31PgZB0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34E32B991
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114200; cv=none; b=FOygQXdwnxz2VaaAa6V68m2/0Ybc34NG+eSGfjZt+NQW3bt1BcZ8Mpdwd/htlB2FCWdvwwrxXtQa6e4D17ccyItep25lpCd1HlEzF5bWZqEJMrmPS9vJqqV454LVlxPRzSPAieBZbcpMEd0kOztEPP7sr67eRGDCxAf3/WlMNW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114200; c=relaxed/simple;
	bh=jaDkHSkUQxL80bqG14RfcCWrPmG9RfF+KXEZvYh1jl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OZ6GFJ/AgGpdLbx//QfheLOb58xGIOUwzDXmfEFpx671BenPxmAlOmU9JCFexitr1fnhCghPFOyssCXI9YHoh135S0o3MXlpLAWyIjDQaqFowOk+tVpHPUlwlhwPX5A/ohLDZK7ClTwkzPbiJjwKKbWU43+sCDicaorK90WzNwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6HbKjvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B31PgZB0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB8lnf3971121
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37HuhnHaWDX91Lk3MPchwjS6G0pjrdeth4tGucAOCho=; b=Z6HbKjvKOM4a4omp
	MdtLWidssaxfCmAkaKJejXZgnePgxpUTUIBs8kxvxCUXKogSMRdmfbc7CluEXAuH
	jGMnjYe7n2mxcDxmHF3tLyqRi9RM7t4EwDbtxgYVq8oGRLnrN/Y2JzetN1vy5i8J
	OITEnFrpUTQiXNKlzPq4rXR7lFTxLggXiq0715G3bZZg9vupPVkm8N5fbGLXhd/W
	ghbV7+W+vWJZZIo6VfiF3EZtsMCahCDsrswZxYumJWaMROQFyX4XfYNqEj241xp2
	b2BjGdmj0PJ9uG5n/wcbmXaAv9Xm8bQjfFFeKywCUlPEiAQc20mE/y4wrNs6cFZb
	ep4cHw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky0t6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:17 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-78e728e39f5so103130837b3.2
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114196; x=1767718996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37HuhnHaWDX91Lk3MPchwjS6G0pjrdeth4tGucAOCho=;
        b=B31PgZB0pcl9SOMr2T1k4XkRc6TiGaKrHBJs5XKE8mtdNgJHnaY0hdUHoYHzxVAu6z
         XOnoBjwzVytlDwrATtBOuLps79LjmGqzdOTjRT3FjcCBikp7SvPGSxwNdUk8e2mE/W3c
         P5ESBRatNOEbAAjfCs9vDyoXBfsOKzJFwawKxtXQdeMAP1cBfR3w3ZN/sZErqIzIdPtt
         VaTlgljcBLgZ2Rc1YWnREh36WgJ3+0La1o8EJ1SdFCCR7Vxosbzwbau6E6A+SDFCADke
         1zrXaw0/7/OXAyYzQMdLy+pwdEWRFWpD6F9ZH9g/qAwZAkGMEWFGToyyXNwcUmnraHkP
         89Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114196; x=1767718996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37HuhnHaWDX91Lk3MPchwjS6G0pjrdeth4tGucAOCho=;
        b=GYvR33BBnaQvRGhnpHnnzdCgDQThnwEzTvbl++C7OWdoD/OpoJ49yZNf4Fl7BdZeZp
         UIxtwgV4P29b4vZ7+XgEsMTfmaZxlEsupIq4QTvbu/7+pEPiEthBTpmotYFdRsEry1bi
         5gph+G6HJ/rP5sZq90cG9z6g+g6CTFFlXb7I2bxF5IYbzBM5720nWIKUMi9l71eeAZfn
         H1lSbsMAwtxbziIadX6E91XLoJ35jf3ubv1DnCKWWQxCiT4xkoYaHLXe4L3kU8zWuczV
         wemTsbvsanb/OqOmF6gYI5wc5j6C5RWA+QHONsVKxYJoQBRU8jHUOu0jIoMXbART4uFL
         ht8w==
X-Gm-Message-State: AOJu0YxBShhUcdSTNnrBU5FtASLqv95u6HAzQfTZvKBPWAVicBoxMzps
	FoUt+YXZ3r5jhayi1v4/gcpsXPaLeJ7cveYfAEVFHpjXwk/WrRxYY10IUne4RK4T8HeWXtich6q
	Avk9xdnFVBqAcr1bIoOf+hQD0oCRcLROKtraO/PeJR9Pn5WegkOS31JiGXDq57nVfbzLhKV+64w
	==
X-Gm-Gg: AY/fxX5Q/Ab28VgUEvZPwv5d8aBJ3lTID0YY6YHJ68MihovsAsZIO18QFTd8tlK4LEa
	CLLh+y1xGgoZSrTyrVaaO7rDS5SbNtJVG5aDnzofjioLxvPdWg5OZfEOsQMiUpBh0w86Lk65gtI
	5VmvSuk+Ao5/mHMjgb6uGIlx9hVA8/Mpn9Ixr+miSZNWJ4NN/62GZdOcgEQGJVMbEynt2YnBAsD
	UFzBncsVhs52aHgmdQfnlEaay7czFIQGX7QHqbdBOrphqTeORryu574l5L0sXWjxda4TwPmiKsF
	prk1E+Jtcr1CdWZ/yAZpkQTsSayeH8nlFP5xBmbhndmZ4NaGuUP0PLSggqRLzJV2v7bHMEfZZTv
	tCof9dR4u1cRzVUh3wkpNH8MgTrmrskezXlrISc/6A9AGn6FXorx4Jkb5jv8HPjgXGRzQYOIAQn
	oKrzI/TIQNwjUpUr8YfPoS2XC3oR24A1pvR6adOo3S
X-Received: by 2002:a05:690c:380e:b0:788:b84:d509 with SMTP id 00721157ae682-78fb41326b2mr293022127b3.34.1767114195727;
        Tue, 30 Dec 2025 09:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEPkHy0ktU6NWM/oJBhUrwvLIRK/Jl2Sx/DDMxuZ5ShoRMFnestcegWRxq6GYxFY1nsKGaOQ==
X-Received: by 2002:a05:690c:380e:b0:788:b84:d509 with SMTP id 00721157ae682-78fb41326b2mr293021667b3.34.1767114194987;
        Tue, 30 Dec 2025 09:03:14 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:14 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:02:59 +0100
Subject: [PATCH v5 02/14] media: mt9m114: Use aptina-PLL helper to get PLL
 values
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-2-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX+Fei2XVXPsgR
 NaQJh3Bh8EQMF4l2mbVzCoSLB8QaM3r0zt9CbgelbMm3CPMXu6MYvDy0EFfAkckCxkiEf99ChDf
 qKsmxkWtSum6S4VB9J5lG/WO1I8AoHeGK3EzorB5dN4CRKXykJBGCHSwGoGkbPlXy1VEJ6YbPVu
 vmYVBevL4is3uIFMWLcJFWoVuaVTrukPWVwkq9xk1qBycMCmRLsx3ODhqQtoVZKbiaP090yBJuw
 Vq7gWaXmgifsiv3hz12w24F9ir4FQC4mVtR/wLWH4C+BgCBzSv9vhdtzMjGXnAOKrL2kOcRrn0F
 aeOuurHAw/0t27CDsCzQIy6TS6TTZV8553V58enaOEtUUruNsaXMIzy5jsyduSjnco0W1+MVqXR
 1NlQ9Vb8/IAHTgLXcr4g6UTXiTKyuIYCLLvmgOr95t2pWWON1KwdYHVuH0IXgNqCMG3ccWWveQ4
 UlHqD/X0m+W8+3GRYbA==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=695405d5 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=tvTusLfNoRRP9VFxzj0A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: iMHM0oZqx9DpcxIulzfYF-Rx0nqSqFud
X-Proofpoint-ORIG-GUID: iMHM0oZqx9DpcxIulzfYF-Rx0nqSqFud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300153

Before this change the driver used hardcoded PLL m, n and p values to
achieve a 48MHz pixclock when used with an external clock with a frequency
of 24 MHz.

Use aptina_pll_calculate() to allow the driver to work with different
external clock frequencies. The m, n, and p values will be unchanged
with a 24 MHz extclk and this has also been tested with a 19.2 MHz
clock where m gets increased from 32 to 40.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v5:
- Add a code-comment documenting the PLL chain, this is a verbatim
  copy of Laurent's ASCII-art PLL chain from the mailinglist.
- Use sensor->pll.ext_clock instead of calling clk_get_rate()

Changes in v4:
- After re-reading the docs out_clock_max should be 384MHz and P1 should
  always be 8, adjust the pll-limits accordingly and drop the comment
  about the out_clock_max from the documentation not working

Changes in v3:
- Document that using 768Mhz for out_clock_max does not work

Changes in v2:
- Add select VIDEO_APTINA_PLL to Kconfig
- Use correct aptina_pll_limits
---
 drivers/media/i2c/Kconfig   |  1 +
 drivers/media/i2c/mt9m114.c | 64 +++++++++++++++++++++++++++++++++------------
 2 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4db8c4f49657e19018535927eb41f7ad2a4f80..befea5952191184536ad7d7e5c81f567826d8aa7 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -305,6 +305,7 @@ config VIDEO_MT9M111
 config VIDEO_MT9M114
 	tristate "onsemi MT9M114 sensor support"
 	select V4L2_CCI_I2C
+	select VIDEO_APTINA_PLL
 	help
 	  This is a Video4Linux2 sensor-level driver for the onsemi MT9M114
 	  camera.
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 51ebbe7ae996950a58f8fee30029e0a060feaf3f..bbac5fd9b2ad85a1ab56a7e36de16659bc38a369 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -32,6 +32,8 @@
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
+#include "aptina-pll.h"
+
 /* Sysctl registers */
 #define MT9M114_CHIP_ID					CCI_REG16(0x0000)
 #define MT9M114_COMMAND_REGISTER			CCI_REG16(0x0080)
@@ -267,9 +269,9 @@
 #define MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE			BIT(0)
 #define MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE			0x00
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N		CCI_REG16(0xc980)
-#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		(((n) << 8) | (m))
+#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		((((n) - 1) << 8) | (m))
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P		CCI_REG16(0xc982)
-#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		((p) << 8)
+#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		(((p) - 1) << 8)
 #define MT9M114_CAM_PORT_OUTPUT_CONTROL			CCI_REG16(0xc984)
 #define MT9M114_CAM_PORT_PORT_SELECT_PARALLEL			(0 << 0)
 #define MT9M114_CAM_PORT_PORT_SELECT_MIPI			(1 << 0)
@@ -330,7 +332,7 @@
  * minimum values that have been seen in register lists are 303 and 38, use
  * them.
  *
- * Set the default to achieve 1280x960 at 30fps.
+ * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				38
@@ -340,6 +342,8 @@
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120
 
+#define MT9M114_DEF_PIXCLOCK				48000000
+
 #define MT9M114_PIXEL_ARRAY_WIDTH			1296U
 #define MT9M114_PIXEL_ARRAY_HEIGHT			976U
 
@@ -384,11 +388,7 @@ struct mt9m114 {
 	struct v4l2_fwnode_endpoint bus_cfg;
 	bool bypass_pll;
 
-	struct {
-		unsigned int m;
-		unsigned int n;
-		unsigned int p;
-	} pll;
+	struct aptina_pll pll;
 
 	unsigned int pixrate;
 	bool streaming;
@@ -758,7 +758,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 							       sensor->pll.n),
 			  &ret);
 		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
-			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p),
+			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p1),
 			  &ret);
 	}
 
@@ -2281,14 +2281,39 @@ static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
 	return 0;
 }
 
+/*
+ * Based on the docs the PLL is believed to have the following setup:
+ *
+ *         +-----+     +-----+     +-----+     +-----+     +-----+
+ * Fin --> | / N | --> | x M | --> | x 2 | --> | / P | --> | / 2 | -->
+ *         +-----+     +-----+     +-----+     +-----+     +-----+
+ *                                         fBit       fWord       fSensor
+ * ext_clock    int_clock   out_clock                             pix_clock
+ *
+ * The MT9M114 docs give a max fBit rate of 768 Mhz which translates to
+ * an out_clock_max of 384 Mhz.
+ */
 static int mt9m114_clk_init(struct mt9m114 *sensor)
 {
+	static const struct aptina_pll_limits limits = {
+		.ext_clock_min = 6000000,
+		.ext_clock_max = 54000000,
+		/* int_clock_* limits are not documented taken from mt9p031.c */
+		.int_clock_min = 2000000,
+		.int_clock_max = 13500000,
+		/* out_clock_min is not documented, taken from mt9p031.c */
+		.out_clock_min = 180000000,
+		.out_clock_max = 384000000,
+		.pix_clock_max = 48000000,
+		.n_min = 1,
+		.n_max = 64,
+		.m_min = 16,
+		.m_max = 192,
+		.p1_min = 8,
+		.p1_max = 8,
+	};
 	unsigned int pixrate;
-
-	/* Hardcode the PLL multiplier and dividers to default settings. */
-	sensor->pll.m = 32;
-	sensor->pll.n = 1;
-	sensor->pll.p = 7;
+	int ret;
 
 	/*
 	 * Calculate the pixel rate and link frequency. The CSI-2 bus is clocked
@@ -2308,8 +2333,15 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
 	}
 
 	/* Check if the PLL configuration fits the configured link frequency. */
-	pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
-		/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
+	sensor->pll.ext_clock = clk_get_rate(sensor->clk);
+	sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
+
+	ret = aptina_pll_calculate(&sensor->client->dev, &limits, &sensor->pll);
+	if (ret)
+		return ret;
+
+	pixrate = sensor->pll.ext_clock * sensor->pll.m
+		/ (sensor->pll.n * sensor->pll.p1);
 	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
 		sensor->pixrate = pixrate;
 		sensor->bypass_pll = false;

-- 
2.52.0


