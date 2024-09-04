Return-Path: <linux-media+bounces-17564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C558B96B9E2
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BDA1283DEE
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64531D54EF;
	Wed,  4 Sep 2024 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B2vVGHR7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C821D014F;
	Wed,  4 Sep 2024 11:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448361; cv=none; b=L4a4AEu/f/k55w6DQR7OUQMuDmHqWDOHwaSYEE4GagFqSrfGTORlKlyKZQ9WiiDXsJ4Wcj1Q0TFsvRcs7uGApaclFJ6WcPQ57xkN/NnjizioqgKOQOBY4RwDNZyJj+aYM+gheC250KjrKYEL01Cb1KJrN76G4FcHw6+5QZi4hHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448361; c=relaxed/simple;
	bh=3o55IMd7Rd92JBDtHfXiJsTPuh3E7dt5jNiMWieXmWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=T9Oe73pTDQj6FyXYBKzld9aYGaWdqUheaqrynX6IuSdVbINwaqbqC88yUDdxh7z5gjC8EzIl7jJbY3YDxuiio5ZaspLbd4e3tWVHrhegNB3a5YeCcEF/mOfrGhKmifwQgp6wFj1h7osizPpqJX+qdBSgQAcD2YbTQRdWBZnyj4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B2vVGHR7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4848KXHQ009495;
	Wed, 4 Sep 2024 11:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kerS2jZYFfI+XEm5sc+JhUzfmntgFp7rZ77qb/uhnPE=; b=B2vVGHR7oYG0Ioqk
	z6+UodmMG0D9Mup6KCA6+aaYGGCQWxPEYdSWmRRpqqnghSoVdKT/cP3It1GKP7ig
	4pRPDIcwPjOrZSSF29ajX4Z4lqU/Bxp80/M+xQdNkL/Si08NKYrXLPAqUmawAUjE
	ZTbKu0a20NIiQGMjx08JU453gcLKTiRS6kzN2OIoVRJjBZsFwuBTTOK7IkzCZjkY
	b58eqtGJjVdFXpVRb73bLbVz8+vY242PbWQ+Dw9uEF2o6Pi49nOQ1yfaAykVLtGZ
	DRKOPCxVmOEvy3H2NlY6pmotdMI6v2cVYH1BO7hsFXdqGyQnais5f/fxJY56NWw1
	8L9wFA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41e0bhkqt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 11:12:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484BCQOn003373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 11:12:26 GMT
Received: from [169.254.0.1] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 04:12:20 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Wed, 4 Sep 2024 16:40:14 +0530
Subject: [PATCH 08/10] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine:
 Enable IMX577 sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-8-b18ddcd7d9df@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
        Hariram Purushothaman
	<quic_hariramp@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725448289; l=2580;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=3o55IMd7Rd92JBDtHfXiJsTPuh3E7dt5jNiMWieXmWc=;
 b=ZzD/bcaPGPNr2OVlW6f5ICZ7tzySK4TfSJU3NvA2OpZwS3EgDSsX2t01x4Lt3p3YhMIAnV+IB
 wRtbjLFUk/7BFZ8YjGjsnTeyQhCSSM1TKyhKoUJESdsqKIfIUvkhJ7c
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EgPCxTlnN7nQsOntx8wZx0A26N-QAeCV
X-Proofpoint-GUID: EgPCxTlnN7nQsOntx8wZx0A26N-QAeCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_09,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040084

Enable the IMX577 camera sensor for the qcs6490-rb3gen2-vision-mezzanine
board.

Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  1 +
 .../dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts  | 61 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ae002c7cf126..49ec82e0e28e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -111,6 +111,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts
new file mode 100644
index 000000000000..04b5fe80d38d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "qcs6490-rb3gen2.dts"
+
+&camcc {
+	status = "okay";
+};
+
+&camss {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+
+	ports {
+		/* The port index denotes CSIPHY id i.e. csiphy3 */
+		port@3 {
+			reg = <3>;
+			csiphy3_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default", "suspend";
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-1 = <&cam2_suspend>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply  = <&vreg_l18b_1p8>;
+
+		port {
+			imx577_ep: endpoint {
+				clock-lanes = <7>;
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};

-- 
2.25.1


