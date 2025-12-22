Return-Path: <linux-media+bounces-49329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1FCCD5715
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 11:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E51B33051325
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C71130F545;
	Mon, 22 Dec 2025 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PGyN+4Og"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9330DD11;
	Mon, 22 Dec 2025 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397608; cv=none; b=eqnMrPbpJgvTvs2K8OuMBREjHanrxgPFLB6heoFc/R4OqId5vsV1uToj4pXMv6Tg7ZGZErYjSQrmzi75l4w7E+Py/+bqQD+4l3My6bNKTF/2xX0vIASwZgCdAclqfnzlgQxhioJ+a9rZvyEPtwUB0ho4RrXO0rVMwjo74bkgP5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397608; c=relaxed/simple;
	bh=GCy3vxjrhphXY3SBRQ6gcvkVo7qezoDUE7N+hbhgnRk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f8iiQXgbk9DAhDYnuYzvzb0qWEGywk63MA2J4AaaUAthuOxhhYP/uES1zcakoKz1D31bhxlBihqHXAuU9Yq12sYG9LQ7NY7aiH+mQnVTrwt46VINoX0Z69bjgcbBeKIYNSnGkt8tF6NsCP4ycjMTdHl9YYT5R4zGfscfUJ1pvX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PGyN+4Og; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7g4F43898705;
	Mon, 22 Dec 2025 09:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIXnflSc/RxnEjlyvDAhENUWxwkCvNNXaThEWH3lCrk=; b=PGyN+4Oga63xiCZo
	2mJGvoU05fbP0heZY6CSctRDrQIShA1SPQwF3izoiPd+2l/Ahb8+eKWVWWhhiAkp
	8q/iulhvFzlAUr6gC5LKQmrw3ITdSm3bSoXcql9SioGqroj5aKnmDYeMjn5JerFk
	7H54dd9aoiaiQSNmT+QmW+K4U9dcygyFowtEmqUYvnudyPRcxRBf0I3SDVa7MTrW
	cSNcVlawzNoAHwjxItRyULiZBN6GhLyPphrP5m7scz/8pib1XxGDYsyZcZgE7PJK
	Y/ii2Eu4FbeXlObVkPBEHxLn7CAS8ieTBW2MpQ19lBFYhLDBmjBAwRgv1IwJp/5R
	VMWn6w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmjbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 09:59:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BM9xuHl022584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 09:59:56 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Dec 2025 01:59:51 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v8 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD regulators
Date: Mon, 22 Dec 2025 15:29:13 +0530
Message-ID: <20251222095914.1995041-5-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=6949169d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KSpx70hPW1lZ7Xonwr0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VMf_zQyf-87t5wOJtrtIN6Z_7afEobvi
X-Proofpoint-GUID: VMf_zQyf-87t5wOJtrtIN6Z_7afEobvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MCBTYWx0ZWRfX4+ji3xhyrQ7A
 epfSiyzd14GRBcrc0GSZzslsxVAzxRw91u4JA51+n4rtW+cj4Leh4dLNnCthy/XoWStm4icXPw9
 tB0AGkbeF1ipuVifauV2pDRwAxSh6LRIcshtDorTdUY8rS+c9EFF/Tu4zHBEyfpBWcOc82jHBbT
 HE508Ry2tBDjL6Gxv0rb8nwjONaHWXW4cqYPSfrWnwyBiIdiPpjUeE00FF/wi41BU4PTw84ToGU
 1619iS+nx6Mjm5ZV/UweAs5cf10inuHtKLxiUUtQEkUw2jiiBwY2d+HjDi95QvVLfm1yQSLz/ub
 uwuKK/7ph1ThxLml0nKmSaCQOOMFq58FPgjzhlYdcYqN/extll41NI38yjt84pLj+1taJvAfrU9
 wTgPXk8+QCJv19mHtVu9XFMpyICoxZgqEqY8ohlYXfXE7dgczFd0HQOzJWTdoSn+Q3PoavyLZGU
 2ai7ATsYyoPSOcQ9xxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220090

Define three fixed regulators for camera AVDD rails, each gpio-controlled
with corresponding pinctrl definitions.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 51 +++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index bb35893da73d..003c24d08c71 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -76,6 +76,36 @@ platform {
 			};
 		};
 	};
+
+	vreg_cam0_2p8: vreg-cam0-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam0_2p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam1_2p8: vreg-cam1-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_2p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam2_2p8: vreg-cam2-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam2_2p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &apps_rsc {
@@ -458,6 +488,27 @@ qup_i2c1_default: qup-i2c1-state {
 		bias-pull-up;
 	};
 
+	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
+		pins = "gpio73";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
+		pins = "gpio74";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	qup_i2c15_default: qup-i2c15-state {
 		pins = "gpio91", "gpio92";
 		function = "qup1_se7";
-- 
2.34.1


