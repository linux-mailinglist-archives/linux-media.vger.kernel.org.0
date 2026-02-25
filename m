Return-Path: <linux-media+bounces-53372-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJFyFqkSn2nWYwQAu9opvQ
	(envelope-from <linux-media+bounces-53372-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:18:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A861199692
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01113303E30C
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6806F3E95A8;
	Wed, 25 Feb 2026 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lE/li3tB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC0E3E95AB
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032310; cv=none; b=T2TlkjLRWz0EfBNnn9hpdcP8Qpi3siBzksATjJLxl//7rk/4jcquHor3QGUzfIQa1Vazd02T+PJ1cwDqE3UvoWBX87gbow2a1PAbWI1g3QUCXLu4XEBZ6sFo/mDetvZhrZGTNDnjaXZ1N9K01wqykPXPOahye0PuI291k4F+xl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032310; c=relaxed/simple;
	bh=3nVSYJBG/RHwLpzJ3jy8WUI63ecwZdGLAVBwNBEWi1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/ca5ApXj9LBWOXKQBviW2bXq5t0HpAXGAFgYcCZ4vwk06jNN3fukGnWGoLPged/gXHHGU0qZlBakb1DSwRTx5s9X/8+0VCB7+NLY9siurKYNeJaGwgSdE+td6VZFcP3CK/ZYnJS4uRmTs1t/OG1Wh0Ibnepr/NxSA0CzIZoLJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lE/li3tB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4398f9e3b40so861716f8f.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032308; x=1772637108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQHvQSUZFEo8KyeR/vWOplBdKKbajrVoCBMz2zzdolM=;
        b=lE/li3tB2GPNjM/zrGu9TVLUQiT2SC1M+uHwBV45omPx+5yCrAeCcE6xbfdo1Ist6m
         Sk2wlLmyWSLfPMV5CpoTLcVfJAWlXytj7gywPTNAaUk7TdNwwMGrEzGODTX/JSjKOA4X
         yAC/7ZDpWUSAQ28Vdm/ni8GgJQPkPMP5+paA3NDI3lHukMa661LssZ4DuiO3jFVNu8eq
         /jFu+ZSwyNChTXEODtKmruAx2hR1VhKzsDM+h8Ks0Eo7Fdb20Q5vJG32PDkmnbBj2EAN
         toSumOx0cYvXjNUpJrPVdrNpnUuxzmfLpc0nt1duJRRUeA10y14qsJADrfJ7DbsY1O9H
         xDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032308; x=1772637108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQHvQSUZFEo8KyeR/vWOplBdKKbajrVoCBMz2zzdolM=;
        b=cmjZYEfa4XSrMzog4HM4YMz/JcfqWjCZ/nU/TZ7dFnpnzKokFqFBZgT5VpG6EQd0bV
         fn27Z0h3e13Z+aYh7mNzB8lKKmJcDvzmmw3AQt7ewVmL+ZtoqUr3j2Ypq97buZ6k3o49
         KonU9i3ddDHvneeFl0s7w03RRoMx6vUxJZ4zEddntY4C6o42BLvQmwzbKZ5879Pm6QOi
         5HIo3MXJLSw0EUx3wuR0cWU695IKH51W1FdL0V/Bup+2K6+1sAcUIzhLi5ZpBVydurN+
         6Guk11MCKczFfDIUf725wBl9Hvs/KruZqoL90vkwsA1cKhc68mL5jq0vNzZOrHgL7rue
         HlxA==
X-Forwarded-Encrypted: i=1; AJvYcCUgPZUFDxmXGo/IIh7zkcgg2+g+0LYBwVTVhQfd/4ujwwCSbFoyEJueUdHlSdu6eATWsJ8ybz84GhVMcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx5nBVaFbjCsYjQmd9sozQ/FHL24MUwMLJPw1IcwjAWnkPBZi2
	ypTf1ZHdRjV0vQ1V0/YVvCouSCVLCUNqmulMhE+Jf5cqgU3Vnq1p2WdKfSBBUrApiho=
X-Gm-Gg: ATEYQzyMOWxe7a2GvyIvZqTWK++YWzpZODMRAdFMfc9nyLSIx4POsDlTXmQ7nPwxrTQ
	Z9LFxRSJS0EoukwEPbZrlc1zczHJx+4AMQ1wUrHuic16c+kU412ewHn8wzz222H1r8NnzoEe1dw
	3ez5mvKQCFA07nGqtU8e5VXJgzoxB1t7e9+wkuRTPQjqjq4DDPbkuMyK9BmJDu+hoPWsykQwumH
	xYEQsPL10Ev8cxTD3uJpnzwYpbiAe8BZqWUReQ2kYK46OVY5xeYzYqIsdVn358T9vHKoeOVwDae
	3PkCTiNlD+l/hmfgxSoikkBw2WPFDYCDjYxXoKxtBlm4Pu6WlbPyv1ZMDgClHcSbK1zy9XVM8Hz
	jvMS0GF9nDP791xs0sdzGBG3zutAlxquTR8gQAN7elvsDCIEddoesDyYAg9h2ji2RkkUJT2e4eJ
	e89AUTs3zSBi2TVKMXjZvaMcruQFhQQvhLtxbTndGv0hKYIyZcO24n+XzOi1Xh9B/XJSVa9/Fke
	qo=
X-Received: by 2002:a05:600c:548e:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-483a95643b3mr289071045e9.0.1772032307539;
        Wed, 25 Feb 2026 07:11:47 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:30 +0000
Subject: [PATCH v8 13/18] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-13-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=3nVSYJBG/RHwLpzJ3jy8WUI63ecwZdGLAVBwNBEWi1E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEb7CSmtfIK5ACJ7KMh5DX/uJXxriCk0bRWJ
 O8F//GMgXeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGwAKCRAicTuzoY3I
 OqrbD/0bfYxSqLJLOlyYGcoZBZrUyWLaQZf5OYRmDwsxDyUcrfAuIHhjcNgvT+SEVe3sbitWoLm
 Rm92aWMmkbQFR5TKuRyDgTKB4boxW+STX0TFb7sEe2Gole27Ou85zBHk6K+bpTxSLfUf9+EwacZ
 rEmvKKgtlMMwcdrd8+4DOO+KHbTuSvFTLxm4TQWD1M8gEWKC/feu5XWiM/iVK73YQQEphYnFi2S
 P3fHtbj5LNWVfKkj6KKtmHfyEgEaMfXq+LIuh2YVtz3NXEzQqjI4IY4td3wvqcTewc1NMJFAyYf
 5prw5aXUG0GofQjB7CkUdvbIoJuHBjivE90EMNbC3ymeJApFobOuoLpreTYII2zql9NEgYG3bjN
 VPL+yY0IuwEdruvY6ujYK48n0yyZh+suj7P1YY2labpReovJj0sys0z0ZaCXuvRqXIGUUN+O8H6
 /0iY3R6FVxocnKVtB+VGhzjBK70CYWZBJKZzRyE/OsmSMkzuUixOh0KCBXVcJTipNbB0yFIUHZp
 nDJLcqCZP/rCF5JuK7wFsJ8RJqeMRL253+kxcX0pJkye1iDSOhM066QR6vo8X+8AIw6dGEoIGUq
 GgWSAvWMx6a3S95f2eEi7FTPSCcS/Rk/dR+jkSdrIShb3R/tLf70CRL2b2miR5L3mGFTM/PhVAF
 lTfww/9nYO2YmVg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-53372-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.36:email]
X-Rspamd-Queue-Id: 6A861199692
X-Rspamd-Action: no action

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index c89f5ad0aed56..d47404c71b80b 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -901,6 +902,65 @@ &gpu {
 	status = "okay";
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep0: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov08x40_ep>;
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
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&camss_csiphy4_inep0>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1515,6 +1575,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.52.0


