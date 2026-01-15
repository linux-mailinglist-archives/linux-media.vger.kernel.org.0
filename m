Return-Path: <linux-media+bounces-50770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24336D23E24
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC4073024E50
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2909B36164A;
	Thu, 15 Jan 2026 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJUfNhBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnVuBE+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDD1D8E10
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472021; cv=none; b=rl0Zaa9kNkP0eXFPyfsekEyHCZaAktAQAxAJVHuWK+nHRa88AnIRmjuSGtd+CMkkwon3VpxysKdu7r1QZekWCNb12I5xFBmffn+bWvsAtYCfmSF8gA+U+z4tpWe0smzz9hurZHnILrixCCbdIMwjTNabEja+Bo3FbcSSzArMN58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472021; c=relaxed/simple;
	bh=EUwITNGph9Sz556YywpxKThBBpgFxFypVVqI/HuOP1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UUz3QBll4Uykl3f1as3Dt9NjuwtBhBeQO2sXVt9EurFd6oJu1pQIVVf/K4SI8HlX3NHeQiOsQWWfUn7HDCKfXCJTfYtjMCyvYy/7DJ+P5Q7kiAFVj4PV1iiWxqdt2X4pNMYNjsdpb6U5quSv7WQ2McNf7hJAWxrvCHhNPUAyefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJUfNhBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnVuBE+4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6frVA1745060
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=; b=CJUfNhBxOo3pTxZ4
	3RO9aPIy1FWoIA4JcU/SRpJHHUjytf6O7B4S4+yYEoy2dQZzhO90ZraiU6+8t1Mc
	udl/2arYKyWRAnKczl6u1c4p88hus91WNjoIsH3levkx5WlVB/5L5cGajkf7nWML
	sLqJEZANkA1qQacK/4gecfSV9VFCP2O6mRBiqgjAcP0obJTIAPCjqumX7s86wHAJ
	HGEjrz2ButmdihkBA+ugqPoiY+KSTvN6qRyfhJmFcrUTc15CmH2MZL4i0tUi9sC/
	rgC1U+a1JQIkp7Z5d1OUoHptzl8HAdh9c3IgcgWbnJifq/0DmxWq+mAB2mbinWUF
	e1oqtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2gpct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f89b415so206317285a.0
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 02:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472016; x=1769076816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=;
        b=jnVuBE+45W8OTr7CR2K5wXPsdoJvPQEd0MeYbOvSy3BTWl7SgF72nsGdUpoov2KUCp
         OgLIWaA1MAtdg6Bic0Dad19CU4ycTa/KnNvcDou+yLZc+gN44TmV6wScfPPGE1tvslj4
         4ICz5jE8UZawjUzJdx67xKIcToKuIXChKyMVO2tTvm9wBoxNqtyJbII3nDNOg2Cx8Etz
         Os7gNppkPSUEaL/Lf38hCMLpHFx130jZWkUDvSxVQCIx6KchkU5/F20LAIC4/nCFKfjP
         U1zawHTpSkdNZonf+SsI3eGTQcFOrc198wCAeXXM3/wmEhof6SXoWtL4GkTv0fuJOWPx
         5gEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472016; x=1769076816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=;
        b=bMr8oKW3CLcAjdH7yFuDzMjHLsiDX7jz5mL/PpQiBXyEe9ZtAdxgKCIxZvN/fo1CCj
         gvL7Qz6OpQNiV8yid06amyPP5Yz1bIkCBl6QYR0yN8f0Wb3D/AyNW6B8a7WFyj9GzqV6
         Yo58+qWbTZESv/NZBYBS/pnhxQQ3m0mfpht5ujpQT2AtsNEpB6pW4qgyvPymWyTAMO45
         UdRiJM5ShmIPN3PSOha3SxcwvVEmAXxTRNC/+uo3OM0aVNp/WCnMwtaNIO8nwUcvKI6a
         iiFLmyL2K/lEFmA6ZrYQ9ArVfa5rIdIbzIFr/KLLGyyG9Tj89g4G8xGtvwqRDhdNpNuO
         s3kw==
X-Forwarded-Encrypted: i=1; AJvYcCVR7INiO5C/KXHS0Xg9o5hTg3GKI53v6YShVtoonzaOvvqpxdga9NtAuZWQWTMCoJ4PkSxiHQecWe4BMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1U9yp3UrWd1jlOnNff0xdSoclRZ0QyJg+yoLLnCDlzN/REnon
	yTjNkUEkUYfuTEZak5wtLROVopwxZftno/8LGwLxc2DdNoQ4uHZ+/F37EFtx62oM6FIUSiMN8t8
	g1I/jrO/PpXxUtDifDE8LHU7QpwgWlS1Y1psDOMUeDJyGGPPY72B8/O0PrtSS21e9qQ==
X-Gm-Gg: AY/fxX5V3Fa/Voz8J8wdhuimH2vQuRle8cq8qmLLzNGLLIdr/NBic1d+1ogRBWTsl7u
	LeP2Hb+RNq2XYJMJ/qWLdtyinYQnwqiVyKDYFNZphB757Fs4+J+djiMHKBb4YHpqHWzZGuO5dgf
	vmOTRMXg633JYtOZLrV4sjxy370mgNj58qZ/1HSNMR0rD+YtMUHE+dkuvT3y6TYXAIY5Qb0U+ii
	fTcAFUrRswyVYaQYbtdDFSWRS/XlQMxc8HQ5VUZY/svzsklY21a/0NNyLqUDg0bv7iX2ruvIvJY
	mRKX6J0KKcdv/MnDSaW+1o99lywFXUfZTN+d+CZzASD+pAjf9RlHUR4ydTzQ5quuOO0Jm0nZj0j
	MQ/7s13sXFhSW9Ksz0K7YI0zBLTs+qID/dlXsMl/HXqYglQs+ggX1MmJC+v9pb7491mm7ITPziM
	Pw
X-Received: by 2002:a05:620a:2552:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c52fb1ccdemr819225185a.21.1768472016095;
        Thu, 15 Jan 2026 02:13:36 -0800 (PST)
X-Received: by 2002:a05:620a:2552:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c52fb1ccdemr819219585a.21.1768472015581;
        Thu, 15 Jan 2026 02:13:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:40 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-4-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EUwITNGph9Sz556YywpxKThBBpgFxFypVVqI/HuOP1I=;
 b=0q1i37h0jVD3ntw9Vu3U70sABycxfu87F4li7lGcRJwkx/MEcqkj7wdamB2OCdQqakoNOQgsG
 V8ZIfTI3VktCPlJ3kOvcr4OtTPhZwG8rakNTebLe6U4d+JV39oMNoNU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX3iXYjuJWDzn4
 ub2/RVAMmTrxE+bSqGRM1+ijCWrphoNk75TpbFuMEoywm+MgCO4FXXGAZkoyFazkxYurFEDXG7N
 P3o+6dBLyUKhl49r0zCqQHmvlS4JHAGGGZMLBHqngseoWtsf3voxqFrrH5qrSTkLgptzVDRKnXJ
 juMX3HzDdHEZ9UVGRwGQwA0IVpyeYUgFwg2WvVgBBVuBApLU+3xwhtpE4M8WLUXup2vCul355oj
 USxOPFCVGuQeYfcG+8sXHAus0HdgWBRwFq6SOD1mys35ubv5KL1RQZH1NuG0gx0aO2mFcAJx8mS
 yJiRJV9x/5P95fw9qYNQB+mdXMQh7jyWmkzFrHrrzWRsKeExat00JvpUfFkz+Kgse9m9sQuxEZL
 kLWcUsgs++3lK2U/Jocz4hjkmdSecg5YeKqPsMrabVXNwmuqY9CP4C9ZWzmaOxye/WVlLnGOFRd
 yBqmrzbEVy47E7KScXg==
X-Proofpoint-ORIG-GUID: mlTGhsJh-zKKrHPn_YUcRcms6JwYQNiU
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=6968bdd3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tfCBMw9KTM5U2-pTabYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mlTGhsJh-zKKrHPn_YUcRcms6JwYQNiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150073

Define pinctrl definitions to enable camera master clocks on Talos.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 162bbe353b62342478885f22972a816f1b60d820..f77c7faa97561a0a95974de1a39cc4ba0e43f663 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1554,6 +1554,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


