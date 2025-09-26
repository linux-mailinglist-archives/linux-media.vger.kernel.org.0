Return-Path: <linux-media+bounces-43236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 527A5BA2CF7
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 09:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C86F1C0140D
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 07:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6D11EDA02;
	Fri, 26 Sep 2025 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ow/MCiVg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980682877D3
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872072; cv=none; b=JS9b5TUo1KJjlirMMyZ/yuj/VJftOVeBmfJo1PMOFjjRQyy2utrx9TRrtJUQQxPpsXE9yCpJN3gcAzUZUGZm+MwNrvGm7GTKn0rvPuG9Iault+gVJb6ePBK3g0+87hXiQ54S5Ac8REEyn2f/T2xOd/5nPi+eWPVqmDL5+UYJ1tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872072; c=relaxed/simple;
	bh=QzHnA+jkGy7T2Hm/P9Pqt9a+k9vu3Zl/A+nJT8khFXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FsLISkaZq0EhAHecuenc1OzvvICPODH2Y1Ge+5z9/AahcegIS73nVVUniGs5LFJT31S2xFxGhjzwBY/VMx67HU1FGSXib27dxuacKaoTasEcqD02XTNLv46Omaf9CJbJiXiTxdN2iQtdiL6EWJXtX142VDvlF1CbmHkzIP/WHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow/MCiVg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6mdoP012446
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8g6eofdv0Dp
	+krIbYAADlccRDNujtYVAcBwP9CO6szY=; b=Ow/MCiVgiN04KoTga4tYUM+oCCd
	iRAZe1QKM6Hg88NjDG3fzGQ6YjRnA5beDHObfq8RU1ufOJZmxyoL5A46rtTbivpg
	Nv2Iv/Joym/UurA6Z5thnzq4uX7fmta6w+ObY/y9bnmlNptdPvPFW81m0uK/3vD5
	oY35rmZA9abhVd7vHy8JdQ1eh/gmgNUUCgrNESC6rdsNivn5ewly8aN+2sTlP1AR
	j+JY5t5Zys7s0Qxuq4YdhmgB0TRyOKpVl5wlOL80YLCL/y/uqCG0in4UXr4G0fw+
	kTG58BMJSgevARuH1HS+u9sQpZhVG9N4rBx4ebyW5hT5Rfyrz6M6Aa8sWIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q1x8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ca8c6ec82eso42397591cf.3
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 00:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758872068; x=1759476868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8g6eofdv0Dp+krIbYAADlccRDNujtYVAcBwP9CO6szY=;
        b=oqPWbaPBlI4jJIJyAgZ0l+cOffpYBLaTprJQbb3BSuTWmy02U9Hr80oOTiDKBTwUyz
         BfByXuAvKOXAQpL6tmLMRXOW30OhDX5m/vl0+wvpuMF4xY4FuT1Xfd3kwnZVGfxBvDG8
         RbA0dfbRpWt4yWVPtdohCeOCNugoapnSqoXgFvDNHgimfDvL80YDzQBaWmz3OqnEXwEX
         xdj0u4syqRQU6PhTTruK5xD/7/rZS6/jyH22OAmI5U2OPuIIMb/97Xq9eMHiv4FqK3cN
         S8jDrA2vtnz3GZGWHZGxGz1IsbDchrfXCw1hTTvB2qaoWxhDXPxQRE/3WUQk6szAuMkd
         S2YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaaZ+Y0i28FqY5AZIwzRsHlBhG2QxYwue5Q/XqZU7I+ArnjxrgclmvP5hegguMLUHWUOhMjTzpfx7SDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyQzbZgvMyx06BdOhsaCbUhJGfme2dmvZ3mKke1h3KKf4leL0B
	VIx/POp48AjMjaz6blMsC+BF2FZJiap+8fknE2K3ilADcbfTY/BzjmpWToYcUYrDfms9bZmRNYP
	Nsq0wrPOUuba8YRespc73O7K2zGBWRVWYA23MWFBsm+7oomerjJQPmbZxazefGW6k/Q==
X-Gm-Gg: ASbGncvG0fdl6bPotMZ5DdkdsqARiGgzX+1KGmEOwElBpWBS48JrqscNzY++RSgIbp5
	9ZRT2Wb4HyBc8enI6r4FgiqvbiNTjY7cSDnQ33al7qXKx6V0IdDdgSZZdWe1ANFb+/AmaCXB78O
	YPu/wmDfml5feTflUuTMSQ919sl9BGwDZgtRBFUr8/nqUGI8e+ItcQUmHdmRkTD8jE/d1zoG5yq
	MY1HhHMlm1LngdZd37jlwquIaZAz88q0xMUgnN4JZBtNUSdijddo0G533LrfdfZn69loOlYMN0Q
	JlcUQhOWTl66w/yaZKfYFtVfgm3KxpuclvSxKzZn2jjChJ2f9A5dFTI+mw2uzTlOAZpUPZYrEHU
	0eZIup3+0nwmH0upyi3lpD9dUfbes
X-Received: by 2002:ac8:5741:0:b0:4d1:b3c6:83f8 with SMTP id d75a77b69052e-4da4bfbbcc5mr78322751cf.59.1758872068172;
        Fri, 26 Sep 2025 00:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg+iEUU+FfcxqH3JfO86nibzpft35RkBMciIbzfqmknwwxIx7udaPazf3tnGccaB3WDFEnrA==
X-Received: by 2002:ac8:5741:0:b0:4d1:b3c6:83f8 with SMTP id d75a77b69052e-4da4bfbbcc5mr78322501cf.59.1758872067721;
        Fri, 26 Sep 2025 00:34:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:5de9:cd6:92fe:bfb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a54sm320481666b.86.2025.09.26.00.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:34:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 1/3] media: i2c: ov9282: Fix reset-gpio logical state
Date: Fri, 26 Sep 2025 09:34:19 +0200
Message-Id: <20250926073421.17408-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TvF3lgkNogyIoLcKIeDu3fJJM-Y6FCEm
X-Proofpoint-GUID: TvF3lgkNogyIoLcKIeDu3fJJM-Y6FCEm
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d64205 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=S5KZz0PuJSRxqgQEqnYA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXxT6bjXlGpWsB
 SzLTUuj21a6fgEtIg/hkB2MvzP6z3W5tw1QqVqXY9E9XzmkXEFnNPHU1l4xImBZwokyI2tLDpeY
 btzGsKFnsUV958gmyQfPB2aCjM2R2AT7leWKG+BFUGlcnh7zs4zoQThk8v7EFg09fXqYeIMD1+a
 gniBHzs7qjf8U5Kb8uTLE+xdO6BsXQNlDSjB8fDHU3n1CZO873cSQj7hBeRXRPgYtqnPshvIoCk
 bLZ43giR/FqAkz/WaX5obYbseWzBw1ikDsFf60eh+bpMZU8s8YiHSXrgIb0fMriwYzHwB74OvWO
 aPiraGDf6MC6DL0UV3mBaqi1LD04HJ+0OoRsdI/3OF2BtMTnPr/4EP1EoBGZ6ARiDn1oTdZT55J
 +P3pxZwnw0cQUDkXknmf5lLhpDfk4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

Ensure reset state is low in the power-on state and high in the
power-off state (assert reset). Note that the polarity is abstracted
by the GPIO subsystem, so the logic level reflects the intended reset
behavior.

This breaks backward compatibility for any downstream dts using the
wrong polarity.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/i2c/ov9282.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c882a021cf18..fb6fcba503c8 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1127,7 +1127,7 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 
 	/* Request optional reset pin */
 	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
-						     GPIOD_OUT_LOW);
+						     GPIOD_OUT_HIGH);
 	if (IS_ERR(ov9282->reset_gpio)) {
 		dev_err(ov9282->dev, "failed to get reset gpio %ld",
 			PTR_ERR(ov9282->reset_gpio));
@@ -1238,7 +1238,7 @@ static int ov9282_power_on(struct device *dev)
 
 	usleep_range(400, 600);
 
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
 
 	ret = clk_prepare_enable(ov9282->inclk);
 	if (ret) {
@@ -1261,7 +1261,7 @@ static int ov9282_power_on(struct device *dev)
 error_clk:
 	clk_disable_unprepare(ov9282->inclk);
 error_reset:
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
 
 	regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
 
@@ -1279,7 +1279,7 @@ static int ov9282_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov9282 *ov9282 = to_ov9282(sd);
 
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
 
 	clk_disable_unprepare(ov9282->inclk);
 
-- 
2.34.1


