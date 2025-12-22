Return-Path: <linux-media+bounces-49313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A4CD51FE
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BAB15300E3F2
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499353043D2;
	Mon, 22 Dec 2025 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrygBmRj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddovn/vb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A61830FF26
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393082; cv=none; b=ie+qp/F/RofvD3I1aEylFxhr0dx96/jiB2znLN7N7T6qvriK8qF6r5xvlARYyq8Csiwi8Oi/IDKtMZTi7zLKFy0VY9wGgBE6/WHSnLVBCR5Us+SUQYys78xbZDNas2ujRnFEKWUO/yVEnVC+ttDNKqH8ctGXObihC9XIqNYxfH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393082; c=relaxed/simple;
	bh=HfL/wUgTKDglf3uflVWp56CXovorE8XBCiTxn77wjqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ueuWIXa/gOp530NdSEKbhHE2p6CIqSgdpVZ/NJQCH24Qxpl45YbMRL7qXNi8v3m51BPyoqL1yUnuN1fD+MGxz7V9TlNYcRBW/2T+ZuyDqzwsIjlhqKghW3s+aooJsZVahpweba9qhHkDDGOGJjWchLjCv/pVgoLzOQr4WCP0dws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrygBmRj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddovn/vb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8BvBB208636
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSpPyGHzRAaU011OLpKMebrhd6wERzecLAMZJXn86bE=; b=RrygBmRjj83DjAhW
	Cw3lfcjdr9ht8tB0WuNIGRCNZTV4nQ5CFTqE8r5bJWDah4ktg58TWHGBlqOgfN83
	FLbr24MS6RCALSlpN90uOzTdbVXJ84W+iBmFdbr44xFosaK6uncbMFInyrFuSYgs
	lw15gTxky1HAsy65fhjGjG/L0soZI+HvCjNKgLit/fMhae11dGMH3Eg8PulZPhyA
	SXB9h6ra4th0jx7J/zU7vSz+PQmA8jLgyD5Ac6jk0fjoQnvX3qQTrjOl03EaIwlq
	NtsYSPdLypySh+6p4YddIBoVNOED786VHUP2JlIG0YrE6SJWEsU5WdJ7wUANJi43
	NLOXzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mracbem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:44:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22ab98226so1293975785a.2
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766393075; x=1766997875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSpPyGHzRAaU011OLpKMebrhd6wERzecLAMZJXn86bE=;
        b=ddovn/vb8ecKqV7xuAhQzKkZ1sNaCgvRr/1k6Uerf0k/Eh+S6CFni+uKbA6gXFwfvD
         HUDlGB+cKwcbp4WOeLtRyBsw3bmqq5lnvpBWzDuVyWCTGDLwJf9ZWSYMPfF5MXY94pZg
         M7WaUlnqjAxB/epfx2y51edlarKIlgMhx4PpYrjvD66w8VhZY6VnmG+EsUfWVQwb+mjq
         P7+DAYHSzX7XBz0nFR0zgOjBtjqeJNL0PCTS7qPUQTYpeNi9Vq3akBjGAh3AyS9pyhkR
         5l7jjvURgstFBeBXx2VFlelen/vt3cDV0KCQ4Yo+Z5k2WNSINtT7/hWZTRDpKaWMW5wf
         I3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393075; x=1766997875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wSpPyGHzRAaU011OLpKMebrhd6wERzecLAMZJXn86bE=;
        b=KYibh+7Uki7WABjLpJg6xHJ2teFnL6O7yXEHLDpze6N/7JNo4hFgA/Q2gXz9BXyBcD
         JqOXX+uafXF3DWMZoJKQsYn1PLEDyRirlmN5gaPTSDkG0c8mhuNBmGtMYQPq0xT1vCGJ
         i+E7Kyygv+ZBXbk03CItjjZfzcKoToz/GbHPD1wnY57/di4bWkyW+qspw7s/mBT0oqJs
         drAfzBDWZ2K2WDzicD0RkfaVocN7HcbRxMCVJ9WCpGPImTS4X5haVezQRZKzzLcXaJjL
         XjgtUVRGf+ptBohsGwmDgCAsBsCGpk94BVfqUgvPetIlwPT5KoLMHErzN/ghaajKVDxq
         XNrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMgUGpyToQIReILG35nzVqAIlYHQEaP0qLGK5UiwWNj0IGxlKTuxmuDKNyrQEWyJ0O7ELdKsQRxezNJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNo5yUoQTHAG9a0jpMhyEq++IFPJ/lSbcJHE/mr0RzCJfuIK8W
	UetbuREdLFaS26L5Cq9gy/rV2/CGEoaKwl6+90iahlf0XMumHoEQXNpBe/WHrnuMtDP2hgSq+rX
	BHGsa8YRFFT5tKNzEOTMudwpFSrTNXwvbHtfKSEeebFp3jknmSN8YijFndQUkmwO9eA==
X-Gm-Gg: AY/fxX5wpWchv2p42czYXOZOin6S53vVQYLz4eVc4JZ9KI/dYaiv8sSaqUr/jmWgoXR
	p//Y6CQSiWQfqmRhXKYdHgx7uuwIcdDlkcF8zrsGZm4AKBGQQlyLSrLP4vexz9gQQS1eVcgspo+
	mEc7WF+ERIvyLi2Vf7wh9WEdao0fi/QdFOzurp6noMRBkfSwnCWhTuK50FTstApDMDVFdZUaOhU
	m3D8KLotJcR+aGUeyGmXocN4O9xNW1Dy6zuDFh1W4alYL30P2g+vckGq9rL/62u5LjA2WP46vWk
	kw8rsdxDFRtZ6XWw/Hu9c6AUPxoHZRipWXx0cNfM4+CyNVktwvVuiknePNzCVPnfDkFaDXWv8tz
	tppXCnbml9Pd8ViOc8TSH3wjfUh9/l/4Z2Lo0az1hdAqR/SghCijiwZ7q7hN4wvUPslJjKUrqFo
	H8
X-Received: by 2002:a05:620a:454d:b0:8a1:21a6:e040 with SMTP id af79cd13be357-8c08fd1848amr1659564685a.77.1766393074852;
        Mon, 22 Dec 2025 00:44:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEizRpp+mrtp5hnMVcZyZ4Qx6OuxOwJGL0sIfb3UxsnVaeLyYU4VXPT19wl2BixO5QQcBke1Q==
X-Received: by 2002:a05:620a:454d:b0:8a1:21a6:e040 with SMTP id af79cd13be357-8c08fd1848amr1659562885a.77.1766393074453;
        Mon, 22 Dec 2025 00:44:34 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ec0f0sm782975385a.50.2025.12.22.00.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:44:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:44:15 +0800
Subject: [PATCH 2/3] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-sm6150_evk-v1-2-4d260a31c00d@oss.qualcomm.com>
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
In-Reply-To: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766393057; l=2695;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=HfL/wUgTKDglf3uflVWp56CXovorE8XBCiTxn77wjqQ=;
 b=9oGbgznAQW+rVLTTxOhhd6VvyN+B70opOr5UQsRd9OddBwJWbed7cr8JIbAp9Pk0eeG2cgn2o
 g8ba0o/5r/TBXI8wuEtfcnnzuzoG+iG3To3IgAO4+X41bb7YHK5LKrV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: TgiXjwCpUbAlo20iUhEiKQzeAA8QF4vf
X-Proofpoint-GUID: TgiXjwCpUbAlo20iUhEiKQzeAA8QF4vf
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=694904f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aTPIHvGNz_4l9C3dtW8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OCBTYWx0ZWRfX1dKfwXUWw3PJ
 uS9PrBhXRJ4STHphUfzPveJGL3MoEmRNnaMshqizFgO6tD8xSi7JxY+I7eB66TFzfU887qZxmSa
 ElUG8W0neA+iCTLbDe78kiTUZNCSXWT9y4RpV6PM7v8rWZH3wpUB9XAeAQ6L381PpbVyO3FRLJP
 VofShPoh4IZ30TJuFDsF4gUJOIH/0GRPn1wGRmg+uc0f5pVNszBaxpUM9zHeqPEKE/BcDga+oUT
 wzfWqeYMIu9YRy766O8161KpGhOdFjIx+tUG1egw/OoYSHpyKwdiZ+9IFIfVXGhrfnPMgjd/q3k
 CwZMhPlAk42bWNxhFRs/uePUg4Dyx+bCVqbP6N+D/Ec/CBcAn/eerVNkmU0LmNh/5XOCbUhHj1e
 jwbnzXckLQoWyE8/XkhIVN4bycGj33zYde/RkpPFBvS+oB3OoaYZyOCFYFZGp5OZAKiL2ifR+4n
 rMMR002sPCXeq4SCo0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220078

Qualcomm Talos SoC contains 1 Camera Control Interface controllers.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 2e2fa9dc11aed6e8413488302710bc219ca9b64d..ebb1807f0222c075d4207163ed4359a55616d903 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1550,6 +1550,46 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_default: cci0-default-state {
+				cci_i2c0_default: cci-i2c0-default-pins {
+					/* SDA, SCL */
+					pins = "gpio32", "gpio33";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				cci_i2c1_default: cci-i2c1-default-pins {
+					/* SDA, SCL */
+					pins = "gpio34", "gpio35";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			cci_sleep: cci-sleep-state {
+				cci_i2c0_sleep: cci-i2c0-sleep-state {
+					/* SDA, SCL */
+					pins = "gpio32", "gpio33";
+					function = "cci_i2c";
+
+					bias-pull-down;
+					drive-strength = <2>;
+				};
+
+				cci_i2c1_sleep: cci-i2c1-sleep-state {
+					/* SDA, SCL */
+					pins = "gpio34", "gpio35";
+					function = "cci_i2c";
+
+					bias-pull-down;
+					drive-strength = <2>;
+				};
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3786,6 +3826,42 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000  0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_default>;
+			pinctrl-1 = <&cci_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1


