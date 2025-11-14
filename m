Return-Path: <linux-media+bounces-47092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 59417C5D72E
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E5161346D2A
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E569F31A7EA;
	Fri, 14 Nov 2025 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dt1nnhJW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cR7jvMMR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA644316183
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763128220; cv=none; b=IO6pwfeOLOjU1azb7h10oUQnvWk2yLNzVGRXadYO0cUjm7i1N3UyzXy/uo9HlwSOuJueNg62N2GhHfEsla4EVaj62FI26Kzxo5hu2waJl9hs+SggSVywkJVW2hUUsqLruSBVmPuA/DYccYZgJUL0OWzXLfmdF4pbr9b7XWyUOnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763128220; c=relaxed/simple;
	bh=m61eMS/4Zf1kuMzQQJkinZ8IQRWkDw0yg3iKL4VHoyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bMNMJ5+L1mldik/dbXz3QxMnqBkFHhx3BNo6eGAhby9n31JzxLSfCDuNAT1tATgSUFTPjApYsXtx8mKO/imu9dsxT3NbEqglBAi0c5+SoPVrC/JBFkkXzuyRY9Xtb3EktjyqMdtDRYgCc0/jEhXGxtOL24c6ewBFPjTeOJ18lIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dt1nnhJW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cR7jvMMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8PUKX1479481
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=poTbLM0qPOc
	Pg8sP6szKFYdlzJPOHxetHWTXDuuHwzo=; b=dt1nnhJW4mpWMHOpa5h5Hk+kf0/
	1Jq+AkvA7w2ySp9lvXoKwxBpYc0dKViTl4q2CAIY+9bum8T/GvtUerAyshoh1m4N
	hYp5zXz7jZe0ruLHz0HFvWHpKY2dhI9KNhRqybwX4NIccxgr2MEaXKI/xYFTnQ75
	ZoEmjdJ+UZ74+okGQi48KzrWl6do8AF4Op9VdPKfikVL9rNAaLS7JXmyI2bWXdMi
	efJhaRo/6R23mTZBX9cQw0wc7sJzuEigGqwd8jMsBbvsLomhaYWn9CYqepfsMQJS
	gUBE0y7kZd0B80BrepbPWzUkGdIJZi3i4AmoVVmwOa/lv3yNReWWlp2ZMeQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dtahs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:50:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8805c2acd64so60754146d6.3
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763128217; x=1763733017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poTbLM0qPOcPg8sP6szKFYdlzJPOHxetHWTXDuuHwzo=;
        b=cR7jvMMRn1prqtYWtApI6QkhWp8JeSYMQ2pru9T39OXvYUDtalNy4TovTVh9PeNb6/
         B8zqR9Lqm4nToKW5+8GG6OTophrPiCK3Egp8afU8Cu/cPr8v3hQm8bIvEa8PqLhVMVfl
         qR0N/2YuqoUVQKGHQsZN2OOXohsKpbTda98CFPM0OG4Scu9B5OgD3uH8bYFTrpuB7oed
         hKIpQFu9xY42hVAV9CTyfhczgAywNV2THKNCrIEJmMiQ9SI1nKZpfYraQZt7B7KzWDpw
         4kzutnKvwgpFfBRNp1QK6FoGxPY8nnVK20m5s4qWwYwhRvHTMYu8X/HpywOwdNfvvkFw
         syOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763128217; x=1763733017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=poTbLM0qPOcPg8sP6szKFYdlzJPOHxetHWTXDuuHwzo=;
        b=vPpcXc5Pe4RS+ATLwqorsC7C5g+nD//QREnoEcoqv1qAiqt6alK/id8sO4o1ELrxW0
         RZFIJlZ7tqY8Gk/Xgte8tridw36IH6UTs9UoJqU3yb4bGLmpFKUYOcwFG1LTjtoDJGHt
         g6y6j78wqbekDe3jlWfLnhy08wh3Zbk5e5UnfunEQ3CqVcluWw8v2wQdJ3kTwZbCtZhn
         DU0ARFciLghqANdpFINObS7WxFTDseOKHD1GlOOkKJRhfTRm3HrMJuez7Ez8DJQYv1mt
         vn81szC56a+gHCUmzaftpVJNHhO2P/M48DBHPNY4+o4y9/c3l1XAxkl3f/s5DrUrVjKo
         on7g==
X-Forwarded-Encrypted: i=1; AJvYcCWnXI/ng3UON5dH67dETTWDMPsxfMgbHjBcdRSwzLoXMsIx0DGD90NbDIat8P/Zj/6juV9E0ith0oe5Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp+3161mMrqg1eRBqRBKN6L8vgNNSRP7R3Fb2XylmyWX4bT+ph
	vV0pWYQFhuWXgdj+ebh8rQ1sve7bRS949siAPBBxEGGFFHy73np4hqQxy4vgyizrBo5PifKWSv2
	5skC4JrzU45489AcexUA5EsLfCupwEsmPKN0PiIFKsw0IpHmCNhrn/fDiGaXnliS0kg==
X-Gm-Gg: ASbGncuNcRYFGZOvjmHm6DpTonjw3nK+SGoDh9+PEogFIYWu3MIhDMVFXciO+Pja4Ou
	vh2agWrOkFhOgIyk6ifDC0l9heTnt4YiVhTAzIwCsR9Sf9QvYJV0gyj9L1b8YCEV7DjE/9WFEAV
	IZ8lBOFGYh8cCHhukw2BiwRF37389av23wLzp4/6OlceVbB4bNpySmhJVb364ah3jtboCg2I8N2
	prSp3eirH/0uW0n1IbMSb+g2hQSeGpNLrJ7e5u87I1brD8sTLLzuyNEgkUezijlq8j4v9YhP6st
	G5GrFeAWJNrjnuZTotTszQgEChO0N00Q2TqYsAk0mhoauhcsNWNqlQ06dm/kq+EgGS3gDeSCHU6
	BRFLuV2j06usvhTiP3+jUd8qwu/wzcOylVojyHhEQBlkXTqErJlHxfSO9A4HSBSjPYg==
X-Received: by 2002:ac8:57d0:0:b0:4ec:f8c3:c470 with SMTP id d75a77b69052e-4edf21b6e12mr47077431cf.84.1763127513244;
        Fri, 14 Nov 2025 05:38:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPtFh/HJ5A1gMnV2UIJSRzHjxUEjIBQB6ZHT3M7JyGrmD+egfnYsszHoP0C1u/KIfi3tkYhA==
X-Received: by 2002:ac8:57d0:0:b0:4ec:f8c3:c470 with SMTP id d75a77b69052e-4edf21b6e12mr47077121cf.84.1763127512760;
        Fri, 14 Nov 2025 05:38:32 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:a4af:3f59:b032:5434])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm3659659a12.34.2025.11.14.05.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:31 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
Date: Fri, 14 Nov 2025 14:38:21 +0100
Message-Id: <20251114133822.434171-4-loic.poulain@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69173399 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=XkKmpa5t3BpS1E1QlwAA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: GcIPSTRPVO7XH84l_3IG4oKmv9dSedgs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExMCBTYWx0ZWRfXxDdTdvLXY8ip
 9xXZJPAGaHszPmJpLIHYUvBkJYazWzYJyqWFyfpd4bvfjiK3QD94cP5EFXkLxy/eK0GC0TEQvj1
 ru4sqV9xvU9uuBhzckPTUKRPNJy7VxO6l8R2Vz9DJ4RJjgBtmhmAJaLJ/auypydBfjEvwrzmzqa
 PXRfs0YiK/CrSedA0Avey/p51JCS51edMbS2vQYUXiElxC3IS5hpeJEtLWVLDqHvvsJrSOCWyR+
 kfETOu7nwrq0LfxHVmtcIOATA0zZNJ4nFbrKJ/5Sfvjro9Ld4trSSrWl7I8nUxSGO3nNaXLJno2
 vrtKC7xggKtRSHOye1U3jFXhtT8/t0QydgGeALb26m1ZF3NgIfTdA0ecSg4TiTg39SXPuU7OVkF
 iA/yJObH/2JJEXAcK51NWfIfR2TuEA==
X-Proofpoint-GUID: GcIPSTRPVO7XH84l_3IG4oKmv9dSedgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140110

The PM8008 device is a dedicated camera PMIC integrating all the necessary
camera power management features.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 75 ++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 1b9ca957a94b..9814ac4896c5 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -267,6 +267,81 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm2290/a702_zap.mbn";
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	pm8008: pmic@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+
+		interrupts-extended = <&tlmm 25 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&pm4125_s3>;
+		vdd-l3-l4-supply = <&vph_pwr>;
+		vdd-l5-supply = <&vph_pwr>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-supply = <&vph_pwr>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		status = "disabled";
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3404000>;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.34.1


