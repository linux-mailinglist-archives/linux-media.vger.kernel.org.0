Return-Path: <linux-media+bounces-17643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F696CFB7
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0DF1C22A2E
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 06:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF42D192590;
	Thu,  5 Sep 2024 06:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jFGVs1d1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85D18BC21;
	Thu,  5 Sep 2024 06:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725518917; cv=none; b=iyASYbQ+xZaYPHz4mCLNsJA3TPHfgBZPdHRPqmP9gPmDhztKzwinGyTUCuueTUjT5EteZBJBm6umE942svOYxeREEzwMIiMcZ8TIeQ2vVxLopdKG9Z/amuCKz1DEH87UEvD92tuSSmET7FjeJRanaiU9cLspVIhqJIi+DO2/osc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725518917; c=relaxed/simple;
	bh=Ew0KXeXP7EW2ooMU99CIu6bEZN8qKZY34eH3IdlGuA0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qpy+ZMOrkvay+nblQNoNrnD2V0bm+cqIdbbUv3uIhJLwz4IIV59neeLtlOpI6IpiNv1d2gfnYF1Js6ZZQO/UTk34Nwh3IHod7OZcBRZRTXImZkLIfS11XZ32aLQTAdV9/ZmZYji3ji9GLlE03fR9lLifL7/Crn+mDKj0ODjZbTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jFGVs1d1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4851hpZk005471;
	Thu, 5 Sep 2024 06:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tiEldIwL8eljTPuN6cDWTs
	d/DTlYG4RsIDDy1RIqBqg=; b=jFGVs1d1yLv4xWZQ7ZVxFGzXkqmX3UFe7sGv00
	Jg/XT8cLQ5NaDrX/cUU7Bjfnbp4m0FsBWJAm2vPp2MNB9+Caht8gK+KGOeaDuqtc
	78QWNQ1c1eYkuHbagS8C+Rae2LjSZWPS3RVW1b6c7yOGOKmCHPUNESDeW1J9DC33
	6ZiKZi3ZZ8MueOacs1TlC+s44tcOV7efIRxf2lhBpHL4dn0dJ46BZVTCCJWqAzK2
	D6uxB1phSkS8Gqx54vfR7OXi/MXAoz49dIrDoLiR6lEmM0tfxzXrknX4g1/Vpa3V
	ws3zp+ZT7v2XDSppqifjhRZrzN5VO5tG4sKrlbaar5S0nHJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41epwe2f8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 06:48:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4856mU0J019337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 06:48:30 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Sep 2024 23:48:27 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Date: Thu, 5 Sep 2024 14:48:17 +0800
Message-ID: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-ORIG-GUID: wTfORUGZzPt7nZn3m5HFyqNVGbZ3DSr3
X-Proofpoint-GUID: wTfORUGZzPt7nZn3m5HFyqNVGbZ3DSr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050048

Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
 2 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 0c1b21def4b6..e5977dea1594 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -27,6 +27,83 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vreg_conn_1p8: vreg_conn_1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8654au_1_gpios 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_pa: vreg_conn_pa {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_pa";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8654au_1_gpios 6 GPIO_ACTIVE_HIGH>;
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddio-supply = <&vreg_conn_pa>;
+		vddaon-supply = <&vreg_l2c>;
+		vddpmu-supply = <&vreg_conn_1p8>;
+		vddrfa0p95-supply = <&vreg_l2c>;
+		vddrfa1p3-supply = <&vreg_l6e>;
+		vddrfa1p9-supply = <&vreg_s5a>;
+		vddpcie1p3-supply = <&vreg_l6e>;
+		vddpcie1p9-supply = <&vreg_s5a>;
+
+		bt-enable-gpios = <&pmm8654au_1_gpios 8 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&pmm8654au_1_gpios 7 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -453,6 +530,20 @@ &pmm8654au_1_gpios {
 			  "USB2_PWR_EN",
 			  "USB2_FAULT";
 
+	wlan_en_state: wlan-en-state {
+		pins = "gpio7";
+		function = "normal";
+		output-low;
+		bias-pull-down;
+	};
+
+	bt_en_state: bt-en-state {
+		pins = "gpio8";
+		function = "normal";
+		output-low;
+		bias-pull-down;
+	};
+
 	usb2_en_state: usb2-en-state {
 		pins = "gpio9";
 		function = "normal";
@@ -744,6 +835,17 @@ &uart17 {
 	pinctrl-0 = <&qup_uart17_default>;
 	pinctrl-names = "default";
 	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
 };
 
 &ufs_mem_hc {
@@ -837,3 +939,20 @@ &usb_2_hsphy {
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
+
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index e8dbc8d820a6..8d42b5e9c7d6 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -5570,7 +5570,7 @@ pcie0: pcie@1c00000 {
 
 		status = "disabled";
 
-		pcie@0 {
+		pcieport0: pcie@0 {
 			device_type = "pci";
 			reg = <0x0 0x0 0x0 0x0 0x0>;
 			bus-range = <0x01 0xff>;
-- 
2.25.1


