Return-Path: <linux-media+bounces-49992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1455CF79A1
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 10:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22E1030DDB37
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 09:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7D6320CAC;
	Tue,  6 Jan 2026 09:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3gfdMg5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCIy3AE+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E05C320CB1
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 09:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692438; cv=none; b=fiHiHlbPjSC7YH2G63kjfT8dSzSKlmjnlb6zogY1Fqws+tFevaozoKrqPD+4YFkMVT2PU6OXmJZhyyA/6aSH6A2xRdiQci4LL10Mji+OgXAVdQbmmL+0YX7QjD+v0fxhCePToVhOxIjx49JrrTJKanAwixcHWKUEBU2YhQKwjyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692438; c=relaxed/simple;
	bh=GzbWE4HtR5C1b1RFvKj9bOzbYDSyL9P3GiV/S2H6/8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EnEZ8yUKWbCCOgNmN3sWa0jeOjN8B7WPaUpWtV3qE4z43Ak00xY3EqVFkTgKnU5q+713YYqGc0H8Q+Iqtss0O4XrC0KmXzmvKYi1IwYPeM9oh96d4YgXiOJYrirH+02oGvWHJn1sD8/+ufAJWCqRlsWe1zylT/FdTm9pyD1dA2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3gfdMg5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCIy3AE+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069WkVY4091593
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 09:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+nv+aowTLPfhLkFxsSphthW/oMeakS2xuIpmkskesQ=; b=f3gfdMg5gytJpNs0
	gwIRFxVkOn0/pt9sRFpbtO6cEL8ED9lU4UakQcPXG+g8MC5d3yoYUzdrMw0nUEKN
	cO4aFspdqB3fEdowaTB21zgMzby/LaE5vBFcaSAYPiF0HEveRBoGC7fUOfH4GfLC
	anaLk7K/gCyYFBuR3+MsNB/kuiifLGsDMRaflhfe8ONVQj7r/hBSIY7VN9I28jig
	TDTFu7305J6rcAAxhiMC4uLEhpHnRejZYLf8VXFQ0A6gezlAt2IwqK23P/act39z
	lCb/RUJjbSZ7BWSIAZuvrDZYRpoVKVzifE+JDShptVpJrHUPJtLf6c+NsmkjYYL8
	VJ+cdw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun80rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 09:40:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2e9e09e6so27023236d6.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 01:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692430; x=1768297230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+nv+aowTLPfhLkFxsSphthW/oMeakS2xuIpmkskesQ=;
        b=aCIy3AE+lGMT8ATb8tDAAl6fUe+WCzChbzOkrc8mFFdOwQuSgj2AhPyLKH0NBC4+hb
         aQoG8GwPk3dG6a6aUrXQjcUMqqfUxSJsgvZY0H/wTXtuWOiMfiNkoDrIIfWmABBNSQsb
         VwgOx0H7iZfHP6L3ixIvfKiz/nB3zNhNjI9FLOmbnY6Dd7YeoKNd8IOKJRWAmp3qa3G/
         Z8PIlBMQMEY45k23uViSk5pONlJMjxKzKp0R/gc6S5iWa1DX372c6DA2Q+hjPU4v+nF4
         cwacAi8DaY1SqUvML9SrCLnGQAW0nNO/LzO8z1hWK5tGHQEkcuD7lPhDysbHkPuLU5wy
         v1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692430; x=1768297230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E+nv+aowTLPfhLkFxsSphthW/oMeakS2xuIpmkskesQ=;
        b=g9T1RLffYZrvc0oosfgmCPqb0xOmoIRMcqDEFgKxnLytTRmcpGmlXqhCXsDX48+TQt
         0pgi9jMFa/h8q2/yQh/UoiKToWQf1m160fEsuFjKrejpLTbcoYJQdEOn0pWMGgk0zTvR
         kSuxsSa2dHWJK1CywbWB0c8A8sb1ne4BR9S839nygDLU/NtxxQ/QKGEAfruUMFCuPVq4
         AOSq1kU+ZmacuNhKUj/5WduTuljWDL8rDr6W0k/aAFGHMTbXkU/FemzCanTyJsMjml75
         W0j7g2FUCDLojdqr0h3/yUEOxKc6xRsA2sAwQe8UqspexWXOVOzLoYJwpWIP9Z4tK1pf
         FWUw==
X-Forwarded-Encrypted: i=1; AJvYcCXkpVjIgHS4YXhSMJdxaDOyJUKwl1bTC5l8N6o+QB6TJJJIjYNFSrTFyySWJjR9MGtxjWd4I6AwczmD8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7VR2G2DlOzJn0Gukvi3jsn7qRoghDUihA00sUKam/sEYXMjxO
	xojGskpj4AQqlLDqhSTUtc69hh/Uqdssj380GtiBKjQHgsY2jPwaU3EIGc9UrhjEnXQSC0J2k6k
	CFpvpD32EwRjW5r+cMroGfhl9/lnqbpyAw/ouPYYDBbdl+jGCCcfJACBSHZG3OaT1yg==
X-Gm-Gg: AY/fxX4bGY220E44NMs1g8yFVmTy7zHul2qy6KH8O31f6X/M+s5Cd8OSSKJq2C1SFR3
	mqG7fAqCI9GIab0OiQCOswsEFL57MV4A2WDI1GPPgo+3fiLZ0K5Hfl/t9LlgBCkRRo/OT8Lyjoi
	9+z5xIkotXXKnv5wX7zKkw4GpjDh6CGkm0cBylynZ8NDS6uaG1v37hOuoKCDPYnyL3y+OvKzCoQ
	GjrbsCAN6+GuvAPJlRlecU1mhcnTJPYm5HF7HAetQtUfCVOUGMZGmW2LgYaFwUu89kPWklWpOSY
	j+u1+KeVo+b+kCOpR6XGAIMsCf7tBX19Y5f31Zxnlci7Jni51ZeXw7iM29GtCpH1o9LNIqGJPLL
	iukRZCS7uareK/oxGPPkpdWbnZs9QKbQ0beHiNUj2fNJjaQPn8FQzRGRxCuYtRhK7hci0KPV/LP
	9T
X-Received: by 2002:a05:620a:280c:b0:8b2:d256:d064 with SMTP id af79cd13be357-8c37ebce256mr297203185a.41.1767692429881;
        Tue, 06 Jan 2026 01:40:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzjg417KZ8UQ7XSRkClfJTUyxVpYPdsytNk9Sb1rtVrUkCFtBCKZbzw1xTOiaz70BsWVDmAw==
X-Received: by 2002:a05:620a:280c:b0:8b2:d256:d064 with SMTP id af79cd13be357-8c37ebce256mr297200885a.41.1767692429451;
        Tue, 06 Jan 2026 01:40:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:28 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:39:54 +0800
Subject: [PATCH v2 2/4] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150_evk-v2-2-bb112cb83d74@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=2687;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=GzbWE4HtR5C1b1RFvKj9bOzbYDSyL9P3GiV/S2H6/8Q=;
 b=gZTQsZ6ESoZqhyEtTpL2UgTR/HbQntYNQpfxYGx9UIGIo8ETk51u0EKjSIQixiJAIGdk1p1RO
 gaMUdCkXGMmDLUhhc8EEur+Gmfe3h+Ap6b+/suLS3vwN/PTxD1HOSvA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MiBTYWx0ZWRfX6QW45Bv/Lm1v
 F/LNx32Cq1U6yeCSGr9lrWpGjWgMeyZIX4if9HmQg0hZ9SrYOEUB40pItmPo6E5Cr9/7KnxoLpH
 05tZWIjFISGmSNjLMWUbO9IADSVVh6BnXtL6G/a2twgm/U/76BP5Ab7Mn1QtMwtjkMXpn7kSAmC
 LPwMREMqTDCMp0w7Ku5qBULCPnu6yeMLEWSD227Eia3dKWRnB5LfOUOm/seC766tIGiSbeyURiR
 ktn4W9KRQMYgVQ9l5DsOoX6gA8l0fIpV8MDDlqPrVszMzVpubAiJ2aT7TQgckBtclwQAX9r0y84
 Hmxs7+StCAygNYWUjO46psfZMSVe/I2Fs6aYQXiv2VX1zNdiAPTmh2GqG1gaeK/T7lKRK4cbrNk
 0q/p6lySKoIgUqGwkmGayqkN509+ufNmfLHux/Ob+tAruuAL5gRZpxMWf+nwtk3i3kOzsyhgYE4
 MABVaGbTut/A18kC1rA==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695cd890 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aTPIHvGNz_4l9C3dtW8A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 9Ulgv75v_lfWVDaoKlrl6TaoVB1PT5JK
X-Proofpoint-ORIG-GUID: 9Ulgv75v_lfWVDaoKlrl6TaoVB1PT5JK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060082

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index e1dfaff9b6bf8641b19a685e74d60ad4e1e99d41..461a39968d928260828993ff3549aa15fd1870df 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1549,6 +1549,42 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_default: cci0-default-state {
+				cci_i2c0_default: cci-i2c0-default-pins {
+					/* SDA, SCL */
+					pins = "gpio32", "gpio33";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci_i2c1_default: cci-i2c1-default-pins {
+					/* SDA, SCL */
+					pins = "gpio34", "gpio35";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci_sleep: cci-sleep-state {
+				cci_i2c0_sleep: cci-i2c0-sleep-state {
+					/* SDA, SCL */
+					pins = "gpio32", "gpio33";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci_i2c1_sleep: cci-i2c1-sleep-state {
+					/* SDA, SCL */
+					pins = "gpio34", "gpio35";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3785,6 +3821,42 @@ videocc: clock-controller@ab00000 {
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


