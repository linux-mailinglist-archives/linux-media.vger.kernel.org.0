Return-Path: <linux-media+bounces-53374-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJPKBaESn2nWYwQAu9opvQ
	(envelope-from <linux-media+bounces-53374-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:17:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B23199676
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D859E30B3D3E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024A33ECBEA;
	Wed, 25 Feb 2026 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7/bafYr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC33ECBC1
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032314; cv=none; b=C70hb0guzquaPMxrpq4+l+hTC27nXPUyRIBxx6XLbtn1AbgaNHdVaD8O7q9+b5a4gVX45Kn77+Kug+KF4GGQHq9OxaNfjYtuYMd5YFtrGLFfigT/WR+35WOT1VfqrrIiI7GYsrPmudAMFSPWJb2EEhj1gzo7OmC3xfx0q11APJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032314; c=relaxed/simple;
	bh=PZliYhJiPFyZNkAm4JLciiLWwJQT5YMK35xTkwdH/J0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmUemoMXlvimRuap66bmgFVK17pwMIWMKsLxG8444cqrZ5qT3BO8KEDPjOA4rxVCE3wYtpiBdn4J9eIR++hQOG5VDwi/Bv9ds0kedbmGQu9LUoCgRBRoHmKHtgHMJIXn8oDYrRDKBIFe09mUtIE0JatG9ypwW0s4ohAgCaKtC4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P7/bafYr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso53483075e9.3
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032311; x=1772637111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ux9KlDrXiMeO+6sxOIbUbjCaB/XkjWdPsfbfbK0QR0=;
        b=P7/bafYrJ1uQSKyCISe+irlObd9BsUBuLEvBD93Xv9FbRzTX9qq0HVLHqCuF2Rca07
         jAU05Dpgum1X47wwdSqZVChiZcB8fwTIt1Pz0bcngVlOC7ckDgqWXkM0v8InicWN2Ajs
         uuVIhg4JZ8A69r1dEAL4Cwycv7UT74/GU6nCSQb099037NQBIhpt555NuU50TOC6xFkn
         W2Iy+SCg5BVPhRxEXf5g0KaV07cuU2liRVBDcfuC8jeG5zwq2Biv6s1dHOOfOcnpYgIf
         ltUAOw1Wrzmu+7CudCSDh9alsWUfS/cYPp5TyY8ujMSiQK3BMNUMO2WLH1HrrmpIKX/p
         Vr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032311; x=1772637111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Ux9KlDrXiMeO+6sxOIbUbjCaB/XkjWdPsfbfbK0QR0=;
        b=Lb7FlKmQJVZmTbwjxHB3U5Ts26kXXpjgykq25ilHWALfvRSYeXBi1XixjG84G/fmQ+
         VpA+L216MnO+CX63/oRM530OXMuyrhS5GhEo/Zs2nL75sOEEX+muVp1f3qwGwO6wtG3V
         +cEoIBui24SOn3v/s5sX+S0d39mNTfezNbWKxasADCg1appcVa04Oc1zUaniN4AQpFKN
         xeJD28JQ9n5DC5zhdyft46ky+djif9aIAI1mYIFwZ0mj7lDPlqTyymx1OQ8Qev4fNktI
         tRwe3xzml+R1ndJwS+3cdDoT+LeCTw47qLG/y5B1CmMpxsZxdaCGDsNhRXADkHVAWrAZ
         9xXA==
X-Forwarded-Encrypted: i=1; AJvYcCWqQu+Xd/C/tQx8+mtyPClPFU2K96iDDt9hTFXYJzwJJBhNq8avzsZj1OOLC5eBLdlWewzO2j8aMKv6jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZwgw8JkaxGyKHwmMXbsq4LLCwBwlrCF1wTtXA0Msg+RKJESW
	uvg6HsDD1H/1MIxft+vdMN7DFAl+OsGqBYNltzERXkffDDUNA3gpDuVrK5aHhQpIvZrVde+U4jv
	1gHCtaI8=
X-Gm-Gg: ATEYQzzWgQbMbslOg9Q/QvlFTEM4t3pko7CP7lHO6qS4SgZwUoZPldEnp6II8pc7MCK
	LhtRRdCsj6Es8+7MVGJ8RevdSNx0R9lmqkPBTZRtiu2ownLd45CZ5W7BNKEa2lh1ZbBTzv6VYgB
	CAc8WC/5YuAtV8oAMAjX7z94nSmtoxKPtfjGc6DPUOQa4aBiVZk9esLIp4MPVGgW+HK4C5jBmU0
	ZIDsLIzsdp1OEwb5nIq+Y3Y+1D4e3mvMLX/qY56FKle+CGwi0zX5+q+idBRJqChNbHg+1fOKHnb
	BzgTwoQtzPKcYR2+XttZsHxGw+zls0gr1A6ybijRAiHdLdpAopGDqm7k2zfrWjoGNaG6U0dgM4L
	TI9aitcOrYpwwJX+XlnprO3PRQTdcnKC+QeyIrjZQnbe69D0CAbloFiWH97Mdgjw4/qIXvcTV9A
	xDbjl/nhPoLqCMFsmy5NEQHYdvIK5DZj4b8gaZmwF5eXCi21WpTHLoFPOnIQt0kEC+
X-Received: by 2002:a05:600c:3f05:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-483a95aae85mr300261005e9.7.1772032311301;
        Wed, 25 Feb 2026 07:11:51 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:50 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:32 +0000
Subject: [PATCH v8 15/18] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-15-95517393bcb2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=PZliYhJiPFyZNkAm4JLciiLWwJQT5YMK35xTkwdH/J0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEcpBcDgV1rcC8gCdw2Y9aaG9IxgU6KKZkx2
 IqPdqJ8+DiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RHAAKCRAicTuzoY3I
 Ol/PD/9Ta3n6jBg6I+rtUxlr7kj6zjwKdWo6+AdyCUL+HHebRNhsAOlYe3pntshHdEO88QHo2eW
 xYJex6kKtZU7RCwMYj2B1kkO0cHeAcMV93rD5dodZiSxHq3ENr9Z5b5mweAgWUWGOavk6tA88YF
 eTKHW9zzvST5fYUWCQSBAUHcxsqA/n1p8wgTP6A2r5RvIxNlvQU6GMOn7Q5OVvxUKH7DVHqiJ2x
 TpKtvPSxKWsbC35lQSna53ZZ1xAC9L8/Il5JXMpJ8m09K3HKV+GJmyXc5HEPxFO1qNdBfhx/gWp
 PRbs5CO/C66iVJzB6GFiV/45sAB+JmWg1+gJj1E58B9TU+9BTcS6ZYqcfTk0ILzehzwLZpRgycG
 3TZm9ZS79Viey4ilgd0CREGgud1ilXaCpf5ElMFMPanSCARtZ/8FXGDsre8ojgLdZuus/2B18Hy
 j2UBn/Y4IAo5NT0Y+mHV7vYgwbY5qp5wAHUyaEhYUSPBOnbZ1Cbjr830NzXidnzaUPGjYjoL4EY
 USb0QJ7kayCX2C0YIbNSr623arD0p/wMewrfHdBePAkZbq4GU/SUXRYbs1oEFKDtqzKzPGvn3U1
 k/Mn90zMoNm8CyZ+dsCNq+fFeDSXFXN0Lvr2plKEoeqNh9qS4BB6NWRtvoPfFxOcDRy9TPPgfPE
 RhickmAq3dpQVrw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-53374-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.36:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3B23199676
X-Rspamd-Action: no action

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ee49785c9d005..54bf21f1c6f37 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -866,6 +867,66 @@ vreg_l7m_2p8: ldo7 {
 
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
 &gpu {
 	status = "okay";
 };
@@ -1447,6 +1508,22 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
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
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";

-- 
2.52.0


