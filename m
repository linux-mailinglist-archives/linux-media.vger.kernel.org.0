Return-Path: <linux-media+bounces-64410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yV5hCjVHKWr9TQMAu9opvQ
	(envelope-from <linux-media+bounces-64410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:15:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E32668A32
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:15:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GGoX7J+H;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64410-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64410-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D96F3097220
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE228403146;
	Wed, 10 Jun 2026 11:10:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9BD3FFADD
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:10:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089837; cv=none; b=l0Tz/WIJJT4nyU/7NnHvaTWRnpIUVRptSrXg9NPbK5UI0kDPkmvHcBrw69qfWADLZxXsdxGVSrFz3UOMMAIlqelYXcv5s0dS+BtUCVu1icOUQhr5/x3Z1LkqcSXwker3zmcCPhM0ZpB/7mIWQN4ZfT6fRCqCIAII+xqMwbM5AWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089837; c=relaxed/simple;
	bh=8YxhAGTFZb0zJ+5hLjkmzRBQlB5GdZCVJR37ofmfwbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwRJsl1LjRhHQolnacIxqwLF9iK1bWH4ijY2gUKpu4f3rQTPgP5lCIrCcqN86ne81TqB8/52WUiqAJfHcADsqTSnCCulUTor1QzyPFwzjamaiqcqM7V3akXq4ioWzbx/bYtgkaLOWMnAJdM/zz71SO7PoEePwJvKiYAx8WVGbYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGoX7J+H; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf55c39e16so29672315ad.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089828; x=1781694628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dePUqSBzKVLV+PoQEp9b+Ylpu4iFynHLielBVDVr8q0=;
        b=GGoX7J+HqPw01SHiw9alJlAwIPtoim/xDCiFREqTajKrDRCXKbXYGj7WPJlyj6ZFjT
         SzFwCMJody6MmV6pfwD4rUis95kNmtwCSZPTtWM5nsbYQhbBitQdw5b34fsY9iy67ujj
         AO9OorjXwVEF30UzvUCL3wiSoHeRl2BeCV+Sbgwv8sys8Dqu+Ev3VoaZGZ9jP+ntFyCh
         ME2HvWvEF9gPF5Mv3qHo29V29Gl/Afw1qkf57vdIHannQErDeo+J90LS4b6i/GpIFPDn
         9ZBWl3Vev13R56o5MtKRjedTQ5mGJd1amsX7g6GX0VxPcl0w2YVbVF7Qd7ClLtGPpsq3
         OktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089828; x=1781694628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dePUqSBzKVLV+PoQEp9b+Ylpu4iFynHLielBVDVr8q0=;
        b=fp3RldH+DPIyWm8AevCs+5AclHd+6ykAPRTc41F/QFoPDrHdBYk+xJoe4iVvHOv07q
         slNP1nhpDNfvDSGuuSaSLCgkAU5N5u3IADhS5Ukpr5ZgyT432Dasw+6Qo9MdXG/4b6iN
         YmgQXAtHhurS83awqZf8mrZB019JH1/bTN3u6oTAM/aWaCLEEWNan5saCOWJ2jYxfVA8
         BD1b/dk6EzejlXtOp7FZtOSWg+ZhjgPpMy3TomSQ8Hf/Wi5PVWSSzWu5trQzJt7QsG0+
         iSwcJPUuSF/H1hgAafVem/o//IBwqG5NkMf11JyfH+4co7UrbAg2TiYuhB5tqiD35Ua3
         ciPw==
X-Forwarded-Encrypted: i=1; AFNElJ8gFt7OAoaab3d9HMGfIUvKu17CtvW17/2QTAOrDXKlC3q2AclzjIxOYsBHDA+HCSXx+3Qc0KqgvlBACw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGD/Bw2ajv27vpU2p7LnupKzDL9hnj3WaEutwjScqF909gYeNj
	moIlHnz1ixGfDRflHQ42nbj5BQsSfpKteMbOa8+U1LQdq/gyNxDrIH5w
X-Gm-Gg: Acq92OEXyzhexh/lVhY5Mrc41xfJvfXJF3vFPUK4Tu+89x6z6Y8FQkalBEfgRJZEzZq
	id1iNqqT8tr0Ly08fDTYmPzYli19bfgCkyYrFFvQrNjin79rllGMnHzSzFvpZnnzAkT7caKjtxh
	V6EvCVMKKIKeTCubJmMiD2mN0ngce2hjaHHeSj5UHmU3CFwHQxObrNsqtgfQYeq3tLo7Qtn3TDV
	rbdnMx3aaFTDLMSfb3bGOGoq8d0I/COZArMNuOz5pVXoe463n3ESfDXAWEea57p4NVCPYZK2JZt
	rXvne5N+FUQ5CWtJWjxN4JuAhjvkr4v4aISo9FP4rk+Y8K5GlgiIzZ2Us9AKLARVA8Rlwy+ICnm
	whSoQMyOOBE0e6eDJ912HgqiqfqIq7Bf31P+L5Tz/ViFaDd1HEWuSW85waFJqiyFpwoxl4nzayF
	CQJ8IinskmgTmAWBS6GlER6y/UrxMsRWuGzQgUoEKUc651uFcZ
X-Received: by 2002:a17:902:ecd0:b0:2c0:b31b:b19 with SMTP id d9443c01a7336-2c1ec7d946fmr212617895ad.21.1781089828462;
        Wed, 10 Jun 2026 04:10:28 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:10:28 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:26 +0530
Subject: [PATCH 1/9] arm64: dts: qcom: x1-asus-zenbook-a14: Add on OV02C10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-1-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4082; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=ExaW/CgRG0HAtMjfXaofM76A3HEZ9NweHa0eL8KHYN0=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYNHeRo8C16a/eQs+ObZDs5Xo5SL21lIPOY/
 Tm3XHkc+cqJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDQAKCRAVlYpeERwF
 3mO/EACioDVqwwL0R5nMPC0+fQ3U6mxKkXRbIEJQwb17WeR8zy/5VJxVTVluMl9PWgVyD0Kveef
 6JnONYCqscivv0zqrj24Sw+JTk6SExuQkePDj7atKMZxFca2Nu5HXpQEAXWbqp5tKwiVWt7GWtj
 FieXbKrSM4Yp3eyOYEIC2e3q+D13idPqfG4jqpExYg59pythhUI+gbgVIQB3dyZkMHtON85SaYX
 zZfWZFoFsiFKDEzIAfh3g7TsU4J8/vp9jSA/J+7KXd3c5kMcyjUFRG2BW2wXcQhQZ3tV4qnfqkV
 ZO4FkWbYzIs6arGWhIcrDRlEtaVDb9vLN0UC+RlOdiU4Lw645d91VQUhe0ImObf3c59rXdnfbU8
 XPOdkVUYm8MPwDFnfWBIkWthblyaQ2hi/f+dBtXF1+5QFNb4Tq8jVkxVks2i1vfQJ2gTnlwB1u5
 2Af2VBTrQlm4TWu0S7LJ6fuhZn11d4carS1TTDUMvizNhqxkSy1MIxjb7vdhR9tje8O4uA4nBUQ
 U8Si9Ijv54wF3PEanBQaAZcspl8xp8g62L09GbM8EYcBseVlXraavDBtj2qh6mW/lq5Ke8WqH0t
 iOgoPxfbj4SUmw9+W2W3qJ2G/bqupsL+F5qCZB3YiJLCi1vQwEowDhfqoOd60T+wk5uvOjp60oW
 XKHXeefssu7uD1g==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64410-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vinarskis.com,vger.kernel.org,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vinarskis.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1E32668A32

From: Aleksandrs Vinarskis <alex@vinarskis.com>

The device uses Omnivision ov02c10 RGB sensor. Reset GPIO, privacy LED
GPIO, LDOs are extracted from decompiled AeoB files.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 109 +++++++++++++++++++++-
 1 file changed, 105 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 66d566808f58..388737eaa624 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -108,14 +109,11 @@ leds {
 		pinctrl-0 = <&cam_indicator_en>;
 		pinctrl-names = "default";
 
-		led-camera-indicator {
-			label = "white:camera-indicator";
+		privacy_led: privacy-led {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_WHITE>;
 			gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "none";
 			default-state = "off";
-			/* Reuse as a panic indicator until we get a "camera on" trigger */
 			panic-indicator;
 		};
 	};
@@ -546,6 +544,13 @@ vreg_l6b_1p8: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -796,6 +801,86 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
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
+			csiphy4_ep: endpoint@4 {
+				reg = <4>;
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
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		leds = <&privacy_led>;
+		led-names = "privacy";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>;
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+	phy-type = <PHY_TYPE_DPHY>;
+
+	status = "okay";
 };
 
 &i2c0 {
@@ -1283,6 +1368,22 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
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
2.53.0


