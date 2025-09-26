Return-Path: <linux-media+bounces-43237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9CEBA2CFD
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 09:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ED9516FBE9
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 07:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51565288C3F;
	Fri, 26 Sep 2025 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXagsmun"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD332882A9
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872073; cv=none; b=MM6qrqZ/3mEvzfmNB249QytSKDtten0PdatzppZyyi6V6vrio0TYJT1rXUTtgupbUc+HOsBGL2XKhx4P5T6c6dA5LWnZQZTu7D/M54nhb3aOnJrsziBDfG/vAMS9+x1sthrxR+XOhiKctB7aZnr2QiFuUxcAz6eWWOq0ocI8pjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872073; c=relaxed/simple;
	bh=eTSQJRLNVpqRNk7dZulLnwyOVl9KiWPfmgcL8ODH1AI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=frRAwSGlz39iW+aQF4lw2MhPgRm6W0GWMwCNWodCt9+KkzgLhXpMFpzqc+ho7kGXyhMyFJ9TXEoNallf1Wdebn7dwhWerXzq5F23KLCie7F0DOAH0msgnPzm9qLxplg89VL5PP/IUWPuGmTem+oTh+Rf1wN7pLIyLjt5nrjK8lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXagsmun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q74dPZ014483
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaIamYDiNSb
	0xXfIe7Pmy/TEDF0fop9c573zzDyPXZ8=; b=TXagsmunZsqR0v5elepNgn7/Qxm
	4vSct0W6uCD4wM+z9XkMT/+eKY9DJKrdE1SdOKyScZYxsST301r9Kbuk+8GJ7yZf
	1ecngVDRQbeWaJV+Nn5VyklD9TyG62kLgFQdOsonQ6Ie1dwUOEpW/FdX18Tn9nnG
	00V68MV9n9ew4wDqu+pZIleDToUyB0vzYcLU19inbKeviCrw0oDgTWx3l/iBPyDy
	oPVP4A0RHxmiFbaPULjlm3yd5TzMBrp12YSDuonmcY1wMW4OysATVhDBUtn3Pcel
	+FPgbAX0uoBkzjr1A+s5bZDaOCpbv6je51SD+UTga43UbprMAtkbJzPlP0w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rhx1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d6a82099cfso47284811cf.2
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 00:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758872070; x=1759476870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaIamYDiNSb0xXfIe7Pmy/TEDF0fop9c573zzDyPXZ8=;
        b=O9a6mgb0W2Vdn6ZIl2GG42Ctsq8lSvsoOS9uIw2FsjAZLmfx/WLqCh8MbBHGPLXUzu
         11DXg3BSBHr7dNRD/cn5DZ/Q6sjCQMwd8s/NSnFQr+0y9Wl+7NmJ1U4gQDOwJh+vYBwT
         H6CC3TnuOqRQ6rPBnPhg8jktFmiHo0vrHih62dHZbdtXFPLu4EzQZ50qCmaY24M0Zap9
         ZN3jsnV5MvGLPoXSihHBA2dDw3WZVyqQANR353pnhWBilVlSWd6RB3lpRk32RuCeXEOX
         96mvFiqUCMeUEr5NNUigP2Qn/wU6qYIQA+InMOAKndHn4tllOKTQ6XPKng0a5CtBPfsO
         Y1vg==
X-Forwarded-Encrypted: i=1; AJvYcCVmhd9wfprynBAunPGhUrfWPuZG0gienBoQg4lGVQZt7j2qNY05K4BVUERpxerXd4Sg2+rYvS/dIncMGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTLD8brIUmec7KKy/QE1ZJ5M/SbUGYDHyZI0LBDRxMhOcmQ5E9
	DcHpHydNV2Iw2WojKnQ2cJ92FJ87bGD3kP5xbv0hF1AlTlrEgoSO5KvW6yxOKDcepK+naBkiYBF
	IKAnZGzAQFzJmS8nyljoB++/23u98QjyvApfkrV1Yx56SxXbXf4jVXJJjYdn5xI4X7A==
X-Gm-Gg: ASbGncu1O/jay3V20Fdqtq/0v8APvmdCbGW864rTcNRd9LEg5KI6l83hPXStmRHFaBb
	tkMdOOP1czjxftKukhsHY7RJYl11/I6q2SbZEWSCHFwFVZKWd8h9jutDOezWABcz67ieJ7sNO8H
	rH8okb9R1tNHweaCQIHivXTYMEW8vnOKGY9daNlUW/nD1o7q++M/10IcckTjpOQVDgjCwHoZ8rQ
	atxm+JTAQD2EyRNNPNB980ulN4nodvtbzhWQiBVI8+PERPdnWKQDb8gkDiuR++Bkne9w9vPxcyl
	z4wJfvmkHfTra1gG1/T8cRYpXN8bSn7R/yLCM6ROGvme+yJPAGNV0PiM9oHwT1oLvVKdOhY71NY
	xtu6RuMjmNevYwbaWiPS9Skdx3V7b
X-Received: by 2002:ac8:5213:0:b0:4dd:3871:93d6 with SMTP id d75a77b69052e-4dd3871940dmr21090131cf.6.1758872070322;
        Fri, 26 Sep 2025 00:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEomDHwnqrNgSLZa3d9+J9ef+aR/0pZimtQ8JtUbDUBZgtnI4UeIiqdjGrrF8Oxvj4gdUm/xQ==
X-Received: by 2002:ac8:5213:0:b0:4dd:3871:93d6 with SMTP id d75a77b69052e-4dd3871940dmr21090001cf.6.1758872069828;
        Fri, 26 Sep 2025 00:34:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:5de9:cd6:92fe:bfb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a54sm320481666b.86.2025.09.26.00.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:34:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
Date: Fri, 26 Sep 2025 09:34:20 +0200
Message-Id: <20250926073421.17408-3-loic.poulain@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d64207 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=XkKmpa5t3BpS1E1QlwAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: xijjVAS6XqU80REKXDYR1vxiksyy3DSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXykWFoFAIHfgq
 4yjabqqF8p4cUpgMwQh2qsM8QLNev+t31dcLkcJfdNdPRZjS9ag0a+q7HwNp9u90H0p6wqwYtBQ
 QtP/Pg40EatHkw73UtDOr8vGRC5a9I/WJ7MqgB94X1WaFHCsbMAmPZhzGZuneRVZLeYwrYYweSQ
 xYayj/qN4mykXmIl8xR2e07jR57B71zrxpcadnSJPCh/m1qj6PDXVgCRjW88aA6cGi2g6WtZ6t4
 ZnTOuRymFTl+tsww2oYoKCgicI4OmVI9csaLMi19jZjg/r2oCcc/11PSmg68Q86eEZ+Kh3TfK6w
 u7oVtrZpmUQlqmXQp49smuuTpFiAPsjPX6EPenGDL8ctWw3MFwFlbLRWG/FkI3O1CYezFe2aE3t
 oe5ArmYZaaHJQDEAmLOM0qGNZAJQsQ==
X-Proofpoint-GUID: xijjVAS6XqU80REKXDYR1vxiksyy3DSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

The PM8008 device is a dedicated camera PMIC integrating all the necessary
camera power management features.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 75 ++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 67ba508e92ba..453e81412c5c 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -220,6 +220,81 @@ zap-shader {
 	};
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


