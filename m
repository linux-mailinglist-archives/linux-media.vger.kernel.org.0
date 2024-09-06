Return-Path: <linux-media+bounces-17728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA696E992
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 07:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E9AF1C232FA
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 05:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A3F13AA38;
	Fri,  6 Sep 2024 05:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LbeBAX0F"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9E51304BF;
	Fri,  6 Sep 2024 05:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725602194; cv=none; b=Ua5647s+VXAz/jVHZX/GCl731h6FjCMTPSdSF773/qwbnv8Qg8/mYbNm+G1t8t5oYQVHin4Im9GKBxYeFP08d9dvEvmp7NnnbwRqjHjn8g4WopCWdiV2oWfS/E8Y++dPsCcjdQogCnGmBVJSWUO6F+MPlSwE/ZoG0F8bw+7qKtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725602194; c=relaxed/simple;
	bh=jOfr/r81QKGR7cEzbqd7Gn00KfVxTthcoF7KwEd7GO8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gr84cZnHmXUWOdjuIGceYugbIAwVvffh/ZnBYpfUA2ONKF6+9Xe/mzCAj1Dolv01QY5urzU40FfNH1dER3XHxYFS+gw6uqOGLXb2JEI8RhiUTvz5uVrg3CMhuPMXu87qE6g0us3EJo5qiIDSvqAYsXupKeT+3gZ9nUV5Y20yFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LbeBAX0F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQ6SG010000;
	Fri, 6 Sep 2024 05:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nZE0xeUvqYud3Ac+j3jfkk
	yPii+AjbTuOj15gHOeQSk=; b=LbeBAX0FBvCftjscrWC0kyo2WQaTHxFiP+sT+x
	o11JTAzBmeEhZW0vVB5Ks9om8tjG513SrsOlVG0O881++HcaQ28y6KF0DMu5qZIw
	7nmZs7jK0NBX9eOpE03Id9CEyhlcQ552SdzCXDq+mpAkE96jWdSoIZL81Hfyr4h2
	iBQqVQtKoiRXW0mNaJjV4JOPuS+U2Yh0iO04ITyiPDvAjWaT5iuWHxfP6R8RStpE
	e1xRAmPPqA3Ws8XbS+3xcqq4CoWQdTilTELJwqHVHEo3sD727l6NTpJ6t18zpe9U
	hJb5+IzdDXMum4uY2ZrIY58wOEnRdvq56+EklONfE7PfiYww==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwrs7nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 05:56:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4865uR9n026681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 05:56:27 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 22:56:25 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Date: Fri, 6 Sep 2024 13:56:09 +0800
Message-ID: <20240906055609.2200641-1-quic_miaoqing@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 6MFUaSKbBINl93knhy5NJdE3btV4tYKl
X-Proofpoint-GUID: 6MFUaSKbBINl93knhy5NJdE3btV4tYKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060041

Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
v2:
  - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
  - relocate pcieport0 node in alphabetical order.
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
 2 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 0c1b21def4b6..b31e0c0c10e3 100644
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
@@ -702,6 +793,23 @@ &pcie1_phy {
 	status = "okay";
 };
 
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
+
 &remoteproc_adsp {
 	firmware-name = "qcom/sa8775p/adsp.mbn";
 	status = "okay";
@@ -744,6 +852,17 @@ &uart17 {
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


