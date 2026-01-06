Return-Path: <linux-media+bounces-49994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA6CF7956
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 10:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2BB23041F56
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 09:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3EC324B3C;
	Tue,  6 Jan 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBKbMFk6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lbec037o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DEF3242B7
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692450; cv=none; b=c5WEiZHK/4LaZYJZFnnGZdWegJ4F21iX43N4bOr8j+Ow34y3i9P2XBnm8qMZU5fkSGDPeZSKqKc9Rz5/FGGaopMt2AWK4slhoYF+ajm+7vgUvjyvCbry5w5XGH1ncWGg9G7cRzUlnB+exF+9DHXPvKl3UXdksjIeS5a0HMNTX48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692450; c=relaxed/simple;
	bh=qNL03PYuDa7zYQoE2ixEmUSblmXdpnNGEuV5SywZbG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WkHM35r5Ml40Ib4j7PgzbKH6PLPwgkYXkdPXZ85UDg2pAXhwu06rus2pEFGGYLgpK56wxJamTBmpMRkx+OhWF4qUqzy4QK2XkYlthtaD0GaH1KXXnwbjp+XnNTquFpjPTMKGqH1waa8zWZq7w81ayaG16APKI6pGTxaiw0854oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBKbMFk6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lbec037o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QYhZ529180
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 09:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50uGPgremaZPgc01PJvtHho9EVHbAkAnUxBw58+hi+o=; b=mBKbMFk6szSfF6dn
	lPoGvIlHufqRWy9ir9rjuRJiJz6xy8Eks7kIshus3YspIfjfq9+pOfMToPCr/9Xp
	QyC2VRG5wtqR1f6jtp/B4ONpC08MIPocIVRY9hWp6eGxg507A38CioS1h7sUNxjO
	/5amBG8RWpp4dWcaRigc+tWj/CuyvEwx7ATsbVcn2yw5mociWZevAamY/9FAP9eC
	aXwTimuemV4f4aaBLdpztNjQo8gwFsfUNiXwNgIUAVtPu08fj6X1NhrKHV+JwJI2
	UEEGjQu8TPPfR1AN/H2j6GxAK1JFWZ1znPABd5Cs/l2LmiouFsYh0seS4TsETg35
	c+8sRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu2nbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 09:40:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9fa6f808cso236793185a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 01:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692442; x=1768297242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50uGPgremaZPgc01PJvtHho9EVHbAkAnUxBw58+hi+o=;
        b=Lbec037oqOL/TC1t+NOLjY4MvGj88UfIaL1JGctDZr0njjoa6jr3nvBzv++kQiapCW
         9g4LsRgeOh/OLFX7Wd9fatMK+w+CYZwVpruNoRIqtZD3C8Q3uxw3UpMJmJEj8z6gsg8/
         OHmkVS3Td+yMCsmuutoCoGMYq4XosVsagYXZzljI0iejb2SH3e/0Yz7ZUfEnas8r6VDI
         IdygRszffsGm3EsjPxsZCwFj4iqPcD4LrFxdWuBbxRTZxcRjcSpkSj4VkaEpCvoJ5X7n
         kQMkDnHpBhkZa3gLIKqTEOyqgod01UkkrES5Tm3gNiQG6UwL1FE6nQVua6Tz/QoTZtxG
         VTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692442; x=1768297242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=50uGPgremaZPgc01PJvtHho9EVHbAkAnUxBw58+hi+o=;
        b=HFrkSx1a49xdtOfjI0rP7RvGV6XiG94+EILwJA/AbdMn3BehzDMjsMMtlVlieNIwsV
         CFwpbGPUNf1IbE+dtIoohaMPGhim76rbjapMBAxcZyd/TmmI/hzJzDQHVTPEj/Yg8jX9
         8TzVjgO8JICz+/DhitcMbkJj3qjosIjijSzTkk9FdQgXtSz6HndPe+LNdJxEuc+8nAEk
         vieWcUdhHGH8UBzJfAyi9NKsrresqk6s4/m84WCDqCWeS1RJG+FYHJa9sJigGuWnfsdN
         yYW1u69Qir/wKGLTlhlW2qmWkzDmcudSyO4Kqu305GGspDWKjos7zn78qDfc/GPMgdGJ
         PpTA==
X-Forwarded-Encrypted: i=1; AJvYcCXAOxOMCbEXk5CGOpokgw372lII8R6rOpYFhvKye43cNUxF0gDnzK1saLjnYJLG0aUqxlRtMYmThM2e5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWFdWKYBGiZTGJURRsClwjZ0M89fvqxO0MJ1lqmQp0BFB/KtPb
	0y3qAFdJ6Z9Orc3czEo/Wk7FcZTF9nUo0EeZfas5vQec4CPcoSBIhRIWaKLVssgCKSOWyvL/jQL
	HVIl7sPiibqLhCEPWQu59SubCFf3GCvmoS026F9hrT84U4xwRQjn7zOooBAEZNcs0tQ==
X-Gm-Gg: AY/fxX6Q9ktAOP3ned18tAZbD35p29r9/7h6GOiAtV5FXA41v95G4HvQ2+0ENAroIPJ
	T/aQTdBQl4pbdSmSX0s5uGmp57ddIeiRpCjrbzepe4iaThI11uI+i2py1GoTjRtN9Naf5B99iNP
	GtxN23YHAeCGVGHgwlOxhP5tsp72q52cioe+q6cXmB4OozypCvoCkmm6jlE/EZayyrvNSV8JPda
	AB2Hx+Pxq3HMh7EjxQASaP5dx4BxY0MpseuoJEJzu53p/NfAuHpLcgyGRj3GPpRgAHbpLjkIxMw
	V/D9Vbo+sEVghybOazgEjcGDsVBLJI9rUcVxpubVqCvs7YP0upCeScIhP6vRBEUgTQ/Bkw+xWHC
	DrxHr3qVsCD1VfytQE8mTkm3N/pfhkzZL5FN0YXIexwS15qlC3uZpkn+H7QEuUUX80vWopBR3Qe
	S9
X-Received: by 2002:a05:620a:468f:b0:8b2:745c:f770 with SMTP id af79cd13be357-8c37ebee205mr311804385a.77.1767692441642;
        Tue, 06 Jan 2026 01:40:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzmqr0sIU1T8rAjETrwYmJaA2AIPD9Ca4WO/R2S3Ug8BRQeR5VlDtRUVT3CC3A9ZxOK/1M+A==
X-Received: by 2002:a05:620a:468f:b0:8b2:745c:f770 with SMTP id af79cd13be357-8c37ebee205mr311802185a.77.1767692441248;
        Tue, 06 Jan 2026 01:40:41 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:40 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:39:56 +0800
Subject: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=2970;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=qNL03PYuDa7zYQoE2ixEmUSblmXdpnNGEuV5SywZbG0=;
 b=S9vvds46ZDgLtaIcAVjt1Lxuu4uhj7iF6n3cTOb3r/LJ2S4HF3CO0cF8KG2SVtXT3cyJReZ8c
 zpV691CX8yQAkbAZkg0OuV8vWOHrmKIUpuKcNFqIoe+0otyhMRLVDzw
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MiBTYWx0ZWRfX62zcM4zPPuH1
 xrIMgH3qMOP2rwWh00rUeISvn1Vy/F+IkH984kojYCtg/l12DdyY0BxoH7f7jCA05WX65H54XRu
 aNsCkPivO9phSaRMMAKuhR6ehcCi0OY69+EMalG3S2+IBrTrUlP6g2fOZJSJ1kibqa71b0MQ+si
 pa2NIEj7TRg4ie+77khQNjG5t5QJeyvYyrOkjJj88/upi3hAtqmpsbGWW/YZ4GBRw8JIq0yuPxw
 RgHrgxRG329iNTqWaWWP6gUQ6o/6L2VSytbDvvtklsHE+P8uAQRg8LxUu4Emly0o3H2fytFzxv9
 /sOYMrf5IbdG4IUSRfJ4vPNSq0YdNxFLuhG6BlVIBthcdApGaI3EY8/fJ8J6E1flDupDcrDVC1o
 ucTC9iMhkp7REEZ7B3k44GRW5mEPuclti4raJ2HaitANRZHaVgr8ivOqtWFJSj3wKHTP/ucEUng
 91bU6ZJtAC3EIksMfbw==
X-Proofpoint-ORIG-GUID: lRetKZ-fpnBKKHMkv-K4ihNeviPwqFIb
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695cd89a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ASysW7YtxmCszPwO3C4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: lRetKZ-fpnBKKHMkv-K4ihNeviPwqFIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060082

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this overlay reflects the possibility of
attaching an optional camera sensor.
For this reason, the camera sensor configuration is
placed in talos-evk-camera.dtso, rather than
modifying the base talos-evk.dts.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  2 +
 arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4258776b71bdba351de8cefa33eb29a0fe3ec6f3..bfaa0b47ab5cabc9aa1c6fba29faa3e6fd18f913 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -333,8 +333,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+talos-evk-camera-dtbs	:= talos-evk.dtb talos-evk-camera.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


