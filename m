Return-Path: <linux-media+bounces-53376-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NRJMNUSn2nWYwQAu9opvQ
	(envelope-from <linux-media+bounces-53376-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:18:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6C1996D0
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C793D308F616
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418533EDAA1;
	Wed, 25 Feb 2026 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J2N4q69a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DB33ECBFF
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032317; cv=none; b=YI3dAj3GT2bc6ddr7HY5dkSRO54epLHGbceM5plb5bFYq7uzZB0LT7hv0+vBNLwa0dgyP8V+SpGvR7G8hDqTbvhVM6LUELppoh9F011Y07ec8gECg3DB8w4Z5PAFeBaA2+rU0XCxz05XI54uZTjeD5AK50ARBvNfq9lHc66qC1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032317; c=relaxed/simple;
	bh=DrwmilfbhVbwoRyPsthY10dn2lxMLjOqnT8GTS28KV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gz+5RJjttg5Up26IZKzzGjXkBqzu+WhTSmNyGW8HwA9OJHxsBSmyI4IFhaWGg1QgDuoWBn9cy52e900c0T4C4lRE2KAgmDDlW+sA10l82mXa6kxRfquK0UysFMvl2ii1I3WweQQkJa0DWs3bQZyZN+rZjeAi87RSwfciBGhxrj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J2N4q69a; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso6857905e9.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032315; x=1772637115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KoKID4v0mnxnTWENYR3FoM5lSpx++rYbQlr/lLVOPQ=;
        b=J2N4q69aTX3nkBJ/EE2xz7Divxua96+N8JUc+9Y3ZA5DCtY/CVmguiC+gNL8Rc+9vG
         PTssRdj2bEutCjILPAA1vI4VKXZltkt850KUeBRMZTgaNM5RA8p/3KV39u1UrSANPXoL
         W3G3yjPAKyqiIhJSGTNAY0ur5KY9+Pqby32e9fxMPtasOjh0TOiKbo0oYjqKI0agPDL+
         cftv1OBly12ltpGYlXvxBWfJ8AcSzrKf86IAEQofupLV8jipnsWNW4bhE/eczFBsby29
         fHFktyfTK2bon/KAZuBYQbt1xlWqDFqTAsr9iLs74yBoB+yz7FGsRJ+DlaG8rxSCeX/e
         jFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032315; x=1772637115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1KoKID4v0mnxnTWENYR3FoM5lSpx++rYbQlr/lLVOPQ=;
        b=HMh913RzkUj0IZXT9bX3/Q0oRs4B+aiAluy5wyck2zdXGjM8jeXE+s4AbQvZnD1n68
         zJIZfG6Jj2uDb4xY5cf3LXdMd0XQBX6n5twAub0u+BpFv5HLNftDyKcG4uz9roQkvFtL
         yzuvmQnVwj4nJ7NlwmBzmSYqeQxGDvGCckBKEHP2O9CmaNFQ/Sh5op3H4+uZspOJSggr
         bgC1gAoVtbgxQfPEi0/C8D1+ASnxDIH0T+33MIzKnpyiABx+Cd4ZbRAQ0EgJPtRnjkb9
         CVVV2V9FbWSxvhnm7TDRQK0sZRCw2PbJ4EuuLPb82GFzieJlt/OUTO5zSz4OGfbS0XHL
         faLg==
X-Forwarded-Encrypted: i=1; AJvYcCWK3MEuDWx+2Tt5Q7qJqpv0yrIXRH8AG8MBN6udPtqQlCHWrT80RbIbMXeEWcBgdXenIW0pyY/ZLNEqAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEU2iDjsKIu3JbQuxDXcDu0CXPnfpSXA7r5jgnaR/EPWE/diSV
	/0T2+ZSnjbV5fxGRRHNFlzUz8QLV6D0yn1SKUobUjxwi06I7HKOuAC8X1520UW/W1FA=
X-Gm-Gg: ATEYQzy5iaXzhfGYyA/X3Jkc8+NOhse60JkWyaFI1Nm/xUK903a0rbvmpXRfAmie2CR
	Oc2DSEwH3lkJIFgRwiLcISymxYhlDbhb3VpzcP41PAkVaOy6UAuMblQJc2ePLOML0jwBoCiY0+C
	49lKaqNmwsY7Mb4sR1uZq+CBeT5ElNFMyR1uaTQSj/3hVVjD094JtGXJgYWO5nc07LptUEqQnnb
	38j5IaKOtSElYmyJWCauZykr2a3zJuofDIVEQhH6tle8hOH2sDfAwuJMlr6TV3eTUSE19JRs9Tl
	H12MZeGTAwWwsBq7pyaoLZYKqko+k2haOBo8PlhgIZw+7CsCW38KbTDhe4glp69yKd47g1EtxUN
	bxOPHKXBMCdUC5TDhDDK+GP1O17hRToqrO5ZsO393yMaIYJn0nWsKFBRTzHpetn4H24Fw7v0/IX
	LqXU6RHVzDZ86M8JkiX0urtYu9DAQrIx4luSpqniHLFqnhTFE75X2CLvgJlXlm+b/Z
X-Received: by 2002:a05:600c:34d4:b0:477:a53c:8ca1 with SMTP id 5b1f17b1804b1-483bd76baccmr68833025e9.14.1772032314591;
        Wed, 25 Feb 2026 07:11:54 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:53 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:34 +0000
Subject: [PATCH v8 17/18] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-17-95517393bcb2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2557;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=DrwmilfbhVbwoRyPsthY10dn2lxMLjOqnT8GTS28KV4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEc42i4AHvCRHILDFfBpKTM5a+zhccClsXse
 0gk0uwAwpKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RHAAKCRAicTuzoY3I
 OudPEACS1IfYxR/T3bF6bXsHhP8PmV3lI4k8+TFolToWHLEdvc59BSDjuDMNcLcyf//rD0wIs43
 /hRy1bL6e7uoIioY9ARs4/fE0E24UItmHAq3z8Wsc94QzgWitWOduk7+2yvvBHx2prvIVo/1/fk
 HRE78Y6eQZN2a6Lt9GM7PwEVxbio5yObthWDaGBxogePf9DZScUKQSBUCrDgtURvkrnMTwh4Qfd
 8cnAX9mY9j59kKOd7tGF/F6IFp+geo/uuAEdT1D8qgoa9jGQ9P3rt6OFCQqe6CmNOlA2OXmYam3
 Fu5pve3WRAqYl5VO5eWeyeD1+6nzlHA/bxzDbdT11pd9lkTQxtz9VdRMB6EkuwJ36we07gvNdxT
 5KeQVZCYwA6NWSlBgBaCWaSjNatBaoBJVgMrhz+RWtHMjyudyIDefQxl5UcgmuqSTjf7svZwAVI
 zXeXVwH4ZGsQ/e1pNJB2REOCvtE6Rh11uL7m7Bkvs+ppJPHJ8qfBuSl4hCzYQ3CqUH21Y50Tmx/
 zDvb3htp16mqBMXSFe+xVmQ78tjMiku575qk1aYnZfLTwRbxbIi9qKveW54CRLrTAb+kLxlnAXH
 vAq6xZwhu4JL4N3wa2zSeQXRPNwsdqpUEPiwm3nnVXDR5V7zU9m+p7V6hvDwS281oM/aB1DI7+a
 T8OqXZW8QWnLWQA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-53376-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.36:email]
X-Rspamd-Queue-Id: 62A6C1996D0
X-Rspamd-Action: no action

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index f10dff1da7f8e..f3f4841ad2c83 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -856,6 +857,66 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
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
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02c10_ep>;
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
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7m_2p8>;
+		dvdd-supply = <&vreg_l2m_1p2>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
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
 
@@ -1403,6 +1464,22 @@ &tlmm {
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


