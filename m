Return-Path: <linux-media+bounces-19379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7B999AD6
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 05:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B77F31C21FAB
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 03:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5CB1F4735;
	Fri, 11 Oct 2024 03:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MqdB9Jo9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A90FEBE;
	Fri, 11 Oct 2024 03:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728615796; cv=none; b=sO6lOZLVZMJ1NFx4aCGXLE8LloL7eFBkXVLUT6LsFVCcq5gSSE9Hn4l63uTtq6rVm59RToivE96v9QMFBaud4oxetLD68aemNkQ9CxfH3lP9WtatTPr08ogUAQMmbQiNKnJAQzo7pBxQyGfAhH7ILLQ53huOLoPdaGJmFPawza4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728615796; c=relaxed/simple;
	bh=P3TSos/91W1lViiaVUcSn2jpJ+gJDjpOvwBp2Pw/FE4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A0om1vNUark1YmmnSImhYdFwtZ/EcvAC2G9NHAY6UQ6mQEzyQI5+Wf6BkAlVAcAK4ExVNipkRMasRlaCjwYRR/qeQnlOxFPVRotjQ9U9h+1zuhUPlpzdhCS6ix/C4Ueuqq2ZlmiKtrmN0jTunX5shzmPYxcOvKVNvW6UPtCUTSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MqdB9Jo9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ACSQX0011418;
	Fri, 11 Oct 2024 03:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6f3uHrKBFZE0TezqG7rTj2
	3m1ABTyz8fgG6j+UM3RIY=; b=MqdB9Jo9sUkxOLHvK7QpNrh+ZOX2wEIKzUEicu
	MT6514d7zJI4z6BNgiXMhhfc06ViRBOvVO0Nj2XcshACaWwMyjCmvrxqP3WTD2vm
	DumIX8DgJ1Pbg88hx/r6Zqztut+7Ak6TrHwseWlF+VmWND2TFKdDilI5hggCHJQL
	a5oahs1LPsdOT7Tk0SfjH2PuzosRBpRwLhwhA5NpghDiRqx5MNrxQwBUDKIudCPC
	0TWZRJmHmBcwR37Ows4PWYmPt54kZsjxyR9LwNwDG/XJA9eqQHmcfgKxV+QLK8Hx
	77t9ael0fHBj6EgLG8bNfGt7O+3RzNMFQmX9CAJQav3Td6Sw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xthvcfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 03:03:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B336f6003325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 03:03:07 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 20:03:03 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <dmitry.baryshkov@linaro.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Date: Fri, 11 Oct 2024 11:02:54 +0800
Message-ID: <20241011030254.2915173-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uSvkxu_kZc3dlzv4VtXSbwQNcn3-QWQD
X-Proofpoint-GUID: uSvkxu_kZc3dlzv4VtXSbwQNcn3-QWQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410110017

Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
v2:
  - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
  - relocate pcieport0 node in alphabetical order.
v3:
  - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
v4:
  - update 'ath11k-calibration-variant' to "Ride".
v5:
  - update 'Ride' to 'QC_SA8775P_Ride'.
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 121 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
 2 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 0c1b21def4b6..c41fac1eb6c2 100644
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
+		compatible = "qcom,wcn6855-pmu";
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
@@ -702,6 +793,25 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		qcom,ath11k-calibration-variant = "Ride";
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
+
 &remoteproc_adsp {
 	firmware-name = "qcom/sa8775p/adsp.mbn";
 	status = "okay";
@@ -744,6 +854,17 @@ &uart17 {
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


