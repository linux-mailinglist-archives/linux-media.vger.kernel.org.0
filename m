Return-Path: <linux-media+bounces-47089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDE7C5D62C
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E06603BC634
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B818F325481;
	Fri, 14 Nov 2025 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itzldL/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fi7Tm5oH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C75331E11F
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127513; cv=none; b=oUClbjDMcb+OgDrMsDJ7448Gj6DgZvgAbkeJ8pAe6vmkEGROocfRgQ+JgDNszyzj1bRpUiXtLXbLEL5uHky1ozKeILjLtJS/SfXYn0U/eHC/1ciOvATYF9sOxmkyVNgtY4AgTCQSnDJMv/OXEBrmO8FX5PBEmSakyBR6dcxWH+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127513; c=relaxed/simple;
	bh=PIO0LsUia40MfW4oZbbJfpOLKZecFNv6xRBZvdDtBt4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fDLp4n9D7k3qcB+z3XbUFrnKtIlJX/ZfwkN3CSuNn0DHqcThpGD/EV+gqKeRWgwpqT/yDVlkZ1IyuXCrKTK0GsxSFu4XGWMTp7YhXHHFHXxwNlv8j/ne86d5Va8GCNen1u+BnVM5+ooKK5O12DN9VKqoUATfmZw6QlqEUQDFTwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itzldL/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fi7Tm5oH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE81NS21630688
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w8lX1LihANo
	E0mdMtITfubDrEdVWLr/C7I3u2S1mFI4=; b=itzldL/l2Re/ER5GRI3H4QNhwfN
	wuVR6fctLDK+OjKMc0iGfHtq9VoBO7rVAAUZXDZFndVnIZtLEGF7MSJPvJuawnhm
	mwWWHEmn7OpTP30Q2vZNOuT3XwE/dG+WG/JRf3rfkIymdazeHIltHOXavPXPUFim
	C/phuAEmeCkXvjsyJ5170TiMmVBYSJOjQVtgm5vC0JXvUWDCK1nfJ9XYgK7wAbvO
	l6CPEH1PcQ2SQ9oInBOuFQKr0T1lbhd1RnCYYGLdJT5eipMzAn9UlKaIgGhJH1QT
	K5PoPl1FLhLSfBWU7Kk+NUwWcVJ+8YknClFECiIfa56ZYNS2LnU5HYPGRbA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9daan5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e884663b25so49075941cf.0
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 05:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763127509; x=1763732309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8lX1LihANoE0mdMtITfubDrEdVWLr/C7I3u2S1mFI4=;
        b=Fi7Tm5oHhY50fMuJLZ2Y0EO+SIOHIifqZ9tsz29B2G5/15f2TBGQ23f21XdlemB5gS
         e9wIH/0jJq2ZfVu6QhFIc1MdgMjUuChqKFLAgHNewaw55rwgS48vtOfyUReEdJC693JH
         qULJpXLBIY4b7/YMyKqCNxgRsJADCY0lagX5izjnWgfxRZ8CU4KneUyFXUa1WCjSIo4P
         APpRz24eoGq5eAY5eK3LooFX1E+kfdyWGg5Jba/v0It2NDsxayQmYTsm3Vwi14i1e3la
         ImSRuDIgQTm6rqeMKriMjv+3qdY6pKI/JIbNJ/q6sCW/LBk8AQOjmCeOWxp8HpIzfjwN
         Mukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127509; x=1763732309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8lX1LihANoE0mdMtITfubDrEdVWLr/C7I3u2S1mFI4=;
        b=aiGy9G+jqoPT0WEu4/NaKeAp0Hx9mpvKL3P+77YtxK0fFPnTmvqyPwk0KJYmCElJvF
         QWzGVrlnX4v7aaiXeDmyjhxnHFyBsBdkLbrnHNw6AWCSQ+83qG6eo+OCcZw++VOcN1In
         Hd+NQS5i/J2KgCORo1bQrpxggayfc9l2dNoyDv/S0eJztN6HrQx3yQUduZefMtWXkM9D
         Q9RlstqajUlhcg60Vxw46KvMeJ8e50jp1Z077N+WFLK6v+tUCnTvYWPQFw+Vkqvuvn5q
         hzmXRquYaVX25KTEQqaccoInhkZ11T+MqqoOofCEUsy8Z65Je7BqnKSjhft18Wt/lhR5
         6N+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk66SK51ciMMTtQw5ANwMzalukNq9ME8GWaXUuyjKpghXmlrAEu8frPpAt6zqNQcX9ePbObPfg69bzHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypk7Ip8+su2IvgiMrjgbVGJ75m2ogGGYJg/QhHcj/saN8qvN0Y
	fjD4lBduIDShLf1k18w9pw9i/br00shJRLN7SB+QHmnQ963V9eGwByNU5snQuGaVfWpNXdfNPWM
	ff7cYbbWgrCLG6K3wB3gOc8ql1qWNk/HN8hdBYfghdehrToaLHS1BHU9n2cI0VKWkyQ==
X-Gm-Gg: ASbGncuOt9LYArk7KLO+3IEUDnN59kx4f5PPXtSWU8d1OQVQyDRlGgsI67ea5UqVlpf
	A59+HFkJZnQbGkoWcsPxQ0UqTLiiPqB2yXgJVHD+b9xltRy8qtWtNIWNKH1f2BHpQ+SrFB8L3nr
	jsOmG7LKhMgeTLJf9G0W3FLfA5OhwIWDc4+9pgnV5VqHgX9/Wtj3b7N/UV0+bo0ms8+7fPB1Lny
	7orCIArugeuAEjWBMgJDgDuM/1SuWG8YgfRBWIO/aBDZLEBXA9T3LN5AITPZKt5KkhmSZ82LbU/
	MiZYohY7qF+wOCyyg7zmHCwPKRB/Tm+5hwJ756B7wWKxS2uSgL5Qb+t/WnqtH94pQebzMaV44EZ
	gc+OLeCQETbb74I9H8pncpFCl9YkI+SqWWgIntpM7pesouaTtDekxymuMiakqhTPKNw==
X-Received: by 2002:a05:622a:1a93:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4edf20a3e15mr42136161cf.24.1763127509386;
        Fri, 14 Nov 2025 05:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIFgCKtDigDyC8bQ7srqTSIhCpEdfQqVrQXwgabbO1yWpR3znyUto0mwnpga4CcCKP07i5sw==
X-Received: by 2002:a05:622a:1a93:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4edf20a3e15mr42135671cf.24.1763127508852;
        Fri, 14 Nov 2025 05:38:28 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:a4af:3f59:b032:5434])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm3659659a12.34.2025.11.14.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:28 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
Date: Fri, 14 Nov 2025 14:38:19 +0100
Message-Id: <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TY8T4fzeZW8pCeh7Vl9JFj7I9J25Gcz-
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=691730d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=psbRAKA4zCjcBXW6UngA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: TY8T4fzeZW8pCeh7Vl9JFj7I9J25Gcz-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEwOSBTYWx0ZWRfX+uGersD9jUy8
 zD7GYMJ0op1QWQrKyAuE+KbYokuSiWPUODnotjvBfre0mvIQs/Bixh7XDZP2+mphjqfvh4vR4IA
 ufLNNnFMMaelONvInFJJ8VdvGaKPW5HSXvfWJshlArhPVPUOPTnvHgruxv/hni8w/8bem5sz3+L
 tSjZwTmPJqVfd5FFNZvw3tcCFmF7hRqoUTvHu4VnFv0CR4P1y3y1p8OgmXbpERnrFKZyaT8COOp
 gLz4Mv0TnAjDAIqa+q7ZOV1tte8FITA/dDj8H4aniJl93OY55SHt+pMgdB/sHVHrOCHe1zr8cJy
 wYQkdwkZGsWl6ROtvAdhOQFGxcc+xlnNb8mU+g6iW9NakoWyR2+N24WcddzaKfxrjyHp7NyVymV
 eKNfK8H0Q2dwzNMT7Eu9JYV/7LZBPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140109

Ensure reset state is low in the power-on state and high in the
power-off state (assert reset). Note that the polarity is abstracted
by the GPIO subsystem, so the logic level reflects the intended reset
behavior.

To maintain backward compatibility with DTS files that use an incorrect
flag, we implement a mechanism similar to:
  commit 738455858a2d ("ASoC: codecs: wsa881x: Use proper shutdown GPIO polarity")

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/i2c/ov9282.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index a9f6176e9729..e79b326cdd94 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -160,6 +160,7 @@ struct ov9282_mode {
  * @sd: V4L2 sub-device
  * @pad: Media pad. Only one pad supported
  * @reset_gpio: Sensor reset gpio
+ * @reset_gpio_val: Logical value to reset the sensor
  * @inclk: Sensor input clock
  * @supplies: Regulator supplies for the sensor
  * @ctrl_handler: V4L2 control handler
@@ -180,6 +181,7 @@ struct ov9282 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
+	unsigned int reset_gpio_val;
 	struct clk *inclk;
 	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -1127,13 +1129,29 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 
 	/* Request optional reset pin */
 	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
-						     GPIOD_OUT_LOW);
+						     GPIOD_OUT_HIGH);
 	if (IS_ERR(ov9282->reset_gpio)) {
 		dev_err(ov9282->dev, "failed to get reset gpio %ld",
 			PTR_ERR(ov9282->reset_gpio));
 		return PTR_ERR(ov9282->reset_gpio);
 	}
 
+	/*
+	 * Backwards compatibility work-around.
+	 *
+	 * The reset GPIO is active-low, but the driver has always used the
+	 * gpiod API with inverted logic. As a result, the DTS had to
+	 * incorrectly mark the GPIO as active-high to compensate for this
+	 * behavior. Changing the flag in the driver now would break backward
+	 * compatibility with existing DTS configurations. To address this,
+	 * we add a simple value inversion so the driver works with both old
+	 * and new DTS.
+	 */
+	ov9282->reset_gpio_val = gpiod_is_active_low(ov9282->reset_gpio);
+	if (!ov9282->reset_gpio_val)
+		dev_warn(ov9282->dev, "Using ACTIVE_HIGH for reset GPIO. Your DTB might be outdated\n");
+	gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_val);
+
 	/* Get sensor input clock */
 	ov9282->inclk = devm_v4l2_sensor_clk_get(ov9282->dev, NULL);
 	if (IS_ERR(ov9282->inclk))
@@ -1237,7 +1255,7 @@ static int ov9282_power_on(struct device *dev)
 
 	usleep_range(400, 600);
 
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, !ov9282->reset_gpio_val);
 
 	ret = clk_prepare_enable(ov9282->inclk);
 	if (ret) {
@@ -1260,7 +1278,7 @@ static int ov9282_power_on(struct device *dev)
 error_clk:
 	clk_disable_unprepare(ov9282->inclk);
 error_reset:
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_val);
 
 	regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
 
@@ -1278,7 +1296,7 @@ static int ov9282_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov9282 *ov9282 = to_ov9282(sd);
 
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_val);
 
 	clk_disable_unprepare(ov9282->inclk);
 
-- 
2.34.1


