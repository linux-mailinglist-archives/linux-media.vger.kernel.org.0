Return-Path: <linux-media+bounces-49468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6379CDC35E
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181CF307157D
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536AD3358A2;
	Wed, 24 Dec 2025 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYQIvOjf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abNE08hw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D53358B7
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579481; cv=none; b=cVv9K4/I9DMySC5XHIi/LAad01Geu8p++2k3GHATKKMs7y/tU+7g7n6Cd1EDsRFK5tqecY9VI6QltocsaZL8h1rwkoE9gUN5BFhfAHCa9lqHJPkDeGVcv5r6ryjo5qYmV5KY+H2nz4yIQJd6UKH5MlQa3435VrimkzKg+6mTWNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579481; c=relaxed/simple;
	bh=V5hNscTUE9okWFBUacYTQQzzy81tL/hihVZt7dvwhIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYlo9bjGtLWgGQin0bwh7vySqNSHX7ABVQdLvfFCFzZy8fyOsVTNpPJES3w9XVVeK+6KX6u9y+xaTNS8ecxWzKAOK1kUd86C1YjNgdblJyDEfcluZ+sM8KGhwuxiYBtYcUIxCrlnnaE6vXa2wtKqAsM/bAbcCMHrzUTi6qmSV3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYQIvOjf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abNE08hw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7uCeg1056162
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/pv9ikPnnH+8sOBCPbx5yFQw75cMwx+JPtiYG8MJH0=; b=dYQIvOjfjRFwjYcm
	dsImnJBnI8vAO6FG47XzUx/O9ue0aV4LY6I0VrYnYFVzNg1jVWwpkqo0Q90DRAxa
	4xIwXkFwoA8dFs3AIJhEFN5tBowndzMhRZ59pHkmFtnBRr9nOgtHyaBWUnKkfd0Y
	kWyfFF+i+RrdCihTclHfVnIwrfRgL7bapgUti2rbyT4dWRIVQzYfX4ys/yObY6Sw
	qywi2JGDs675vVqAQXFfrV0IQrcqA6UpZsLzhnl0AVVJ5IE8jeRuAAdq/X43qeqT
	ovWpcMuq58IjriCB6ufVC5uyuX1DslCmSRvASI5IEjPMl2zltCLdPFI4xjFRpl97
	6AXc+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v2e26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b17194d321so743967385a.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579477; x=1767184277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/pv9ikPnnH+8sOBCPbx5yFQw75cMwx+JPtiYG8MJH0=;
        b=abNE08hwWYXh84a0ruGtX7iuIrYg1Tu8EEwPvNspIPvAnMqyNe3QPXzmrbvYDxkqm1
         19tSIq7hdduvoWZW/TtinZIXU1GwYwwQUkPfR05RUpXLasjhltsk9tziDMHgvrftvz6o
         UrglFq0KsLlTSYfeEbSvqv02i7Qdj4TK7sfXmXXgsmgpaLGlxo9Fm1O2PRQAkecZo9rf
         r0X27Eaib3+NSHsS8LEdjU7UkFeKQWR0EsjL5FbaTrozZxLpGA4GS+qkC3mXK3oIOr2Q
         Fbnwem7Ghq5YM39zh8edpcPxQnsHZUUfvfcxV0FWIqpmoPYWVp+iJhlg6xta1GmfPUwn
         ItPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579477; x=1767184277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/pv9ikPnnH+8sOBCPbx5yFQw75cMwx+JPtiYG8MJH0=;
        b=u8z4yae9MdrmYdKt913IhlbQKOukrLKNU+3ynWSb49P52NMfK+PEy3EBefmY/PxWX1
         aOcqNvwRoJgD7FKNEzKNetaYk7zALHy7dWNmPqAD7pjrpBfCgczK+3ACbBxQxOxMjaeo
         9OCxtQ6l0IBuxqojhlYAEfUWIBIxblyowbSPFNhTTBeKr41KOtUyI8KeJ/Of/5OUKBHI
         ojHtUd18eQwAyLGkqDsqN1BefTtNjueIbT81z53E9bKoiSLuthgpy5JMlsYQAV8kF/hM
         pQFCdgDJwH0bZfigVmYT4FdI1aeGCdsyCWW9b3XkZt8U05y+3zD+4o4NumJeUmZI94cz
         Vk2w==
X-Gm-Message-State: AOJu0YzRXNrNnVsP+FWhQpHHhgfNEQOeBf6pH/dYMPLiZy6GwZq9ANJG
	j5v4jA/dtvHaDR/wLv6xvjy7L/N5ZEV9JzyaG/USNJP8EG1fXs9DVvU+gB8P7xR/j0oWAQVefQB
	Cps/5ml0yI6CNlJfkkfR4ei2vNyZqHdCplBPw4p5pgrZ+IJOTttJOzIZTt4eWvyxntw==
X-Gm-Gg: AY/fxX53nLEyGHr1aJ4rAqjpO7n5MSRFVgLUdFDWznFXpEDwuNMknbopfgpuOPDiswc
	cbd45PgBwNMst3cMGFsPRv++D42dl6o+P1a+pqR/+5ry4FTre+ToyAW7njWhlWxqR9bkiSU1oi1
	aLbLgn35v/FhFyRMIUKnKTCUPvuoIzmuqjC5qkKIx9wPrO0s1GeduS920NiSdO0hXC35iyji9SA
	wsxYtx5H3VNgwlk7q873gmVQfD9oKGI8f88PjupNJyYCLYkLqovYpCzm0VAsLfos6eeQQUKPNjI
	B81voQq8obRtzWU3/pMf6BDyLhdJNDaWr6bLZbdal/OB/LW5wUSSpQzHsh6lenV6LvL1ggbx0SC
	gT+9c5+1S4nRO1KPuqjr52BN8wcLJUCh9+mDT4XwTq71jtFz0JkPAGtcO9uUB204l7ZA5OMXj05
	CWCYZGP6tSYPr5tTz/gdiJH9tN6iMe7nArG28076CV
X-Received: by 2002:a05:622a:1c11:b0:4e8:83b8:9e7f with SMTP id d75a77b69052e-4f4abca8385mr261455351cf.14.1766579477442;
        Wed, 24 Dec 2025 04:31:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcAATliWOuWnTc0wzLxS5bMTB0MMxejjzqichEIc3ZG9mgaOdJPIvccBxwgX49TCv9tZcTJA==
X-Received: by 2002:a05:622a:1c11:b0:4e8:83b8:9e7f with SMTP id d75a77b69052e-4f4abca8385mr261454661cf.14.1766579476828;
        Wed, 24 Dec 2025 04:31:16 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:16 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:12 +0100
Subject: [PATCH v4 03/15] media: mt9m114: Use aptina-PLL helper to get PLL
 values
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-3-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfXyzNVi3EneIE3
 ai/s+UGEQoz1W5YGJg0G5dxWuOQEZXJNoiLODR7NK77DEFUGVfU4C7FosOXUahmFp+k8qB0PTE6
 mZC4qTIPnvCA/vqMEzxMaIUoBcN7OV8CEDGR7qZBd5ttydUmr0h61mFoqpzJgeegwrfnXoIXj48
 8veWEiRtG1Xw8JxyXdyXiRc09vjyx0w7bBN98mXKSC4dDasJi6sI85SJB0DDJMX+iLNLUi/t5mo
 PBN3kyHTPB86i/Kuf3aPDbKjG+LV3N97lkwbhjinEbvQmFlFxCBCPRU+4JBq549XV4EpB/UWmZI
 U+vhBSgXHlqOpQc6BxRVsNKLw1xYPHJ+AG0BHs8jTZfOigBjaeJMJzBR4tvIdrh6IRHh7JQ9qvR
 X0ABoSu2+84RRtJGyX2XYKjJMhWYI+gq0sABPz3NDizO63Bq8AUqEPierN8oeg1Wq/68tl55bru
 Xc9OleuUSN6eynUlxvA==
X-Proofpoint-ORIG-GUID: OgftZtnNZj-EqrqU8j3Ob0_JWO6Eg5GS
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bdd16 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=HeJOk8pXgLY-FChRk_YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: OgftZtnNZj-EqrqU8j3Ob0_JWO6Eg5GS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240109

Before this change the driver used hardcoded PLL m, n and p values to
achieve a 48MHz pixclock when used with an external clock with a frequency
of 24 MHz.

Use aptina_pll_calculate() to allow the driver to work with different
external clock frequencies. The m, n, and p values will be unchanged
with a 24 MHz extclk and this has also been tested with a 19.2 MHz
clock where m gets increased from 32 to 40.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
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
 drivers/media/i2c/mt9m114.c | 50 +++++++++++++++++++++++++++++++--------------
 2 files changed, 36 insertions(+), 15 deletions(-)

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
index 51ebbe7ae996950a58f8fee30029e0a060feaf3f..d1635f49ee047ca696f6053f6c17e30d736ab795 100644
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
 
@@ -2283,12 +2283,25 @@ static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
 
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
@@ -2308,8 +2321,15 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
 	}
 
 	/* Check if the PLL configuration fits the configured link frequency. */
+	sensor->pll.ext_clock = clk_get_rate(sensor->clk);
+	sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
+
+	ret = aptina_pll_calculate(&sensor->client->dev, &limits, &sensor->pll);
+	if (ret)
+		return ret;
+
 	pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
-		/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
+		/ (sensor->pll.n * sensor->pll.p1);
 	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
 		sensor->pixrate = pixrate;
 		sensor->bypass_pll = false;

-- 
2.52.0


