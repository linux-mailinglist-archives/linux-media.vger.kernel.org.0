Return-Path: <linux-media+bounces-64414-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a5xBLxVIKWojTgMAu9opvQ
	(envelope-from <linux-media+bounces-64414-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:18:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FB6668A89
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:18:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z1RscwSA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64414-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64414-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAD99311A982
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D301404BE9;
	Wed, 10 Jun 2026 11:11:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FB5404BDC
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:11:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089874; cv=none; b=kuAGoOHZ4G6fsyWqO0vSrsxJpQPEWncGAjTdiYVsziXtKWP1e99DTmxyV3Ep3lmG4zKReAKfHI+/VEmDmghjB/cV0lJ0L92As+gzHgb6FPt20zooZw624nXM49zqYYQHG1mKyz28VagKZlQrbp/OjxaJQ1phQfym0OwYwoBTr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089874; c=relaxed/simple;
	bh=BQDr02hg8bk8b59H7xT+yIe/Vc7+/qS3L7NVG79dJZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSbM+a2sJdzcWojPtmnosV9YtbJTjMruN9xAwty60NS+YcB717k8cWD1q0MWrCWjgxLoBHXJrDN8r7D7C+OCoRARuOTwsS7C22XNjbQq8xPJrUJI90p63VwF13vcZ3ZPJ10jZqwRjIR3FvcvHc+RCaFppU+hPQv0oSCe19nccHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1RscwSA; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so5565222a91.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089867; x=1781694667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58KjIEm+tfUZ6/SnUCwcMgCfLciGELGpkY//C+CJsmc=;
        b=Z1RscwSAIvqTQbQAReZTdaF05AAd85eTraQ5Q4hartPj2Af+q21cTTyAuqibRdeb/l
         oAi2rxESCYBZ5XGShRVu36ImtydsQgq/nJHwAkcgoMroHG1IvkbB1uReFs8zzqKE9pId
         wPy+2Jfdi7h8InRtMs8w+vcfpxs5Fce9ihJ/fEhcQTP02ERgZ9WTcet3qxR0XLuIkYUQ
         L/+DfTWUeZOPYyJFcF31EjU8eB0ljjUqRn00D8m0/cJ04FQRfoV5ahmtMaY/LeMI4PEt
         egA52mwNK8baKX/FQp17bsxiRpr9SH5S+FClWptdFzK2iqHkAfm/MTsnRhxcGBVsGF24
         qEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089867; x=1781694667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=58KjIEm+tfUZ6/SnUCwcMgCfLciGELGpkY//C+CJsmc=;
        b=IgyBSQrMtQRI+acgsYte0omzzagGhfbDgBsQYIyx8VZfcZ403U6ZLn3KFeKyNoAffK
         bOQX3eho/HAFrnzisxl7UN0FdJo461GH9BGUYa49V5CrgNoSzy6NY7XaU+vJwz6n6Hw/
         VchDq2SJDeEuyRDO9B/o/NdDIrJF2raGfjRx9vA8dyTSPyP6i7Ga5xbccItCAWtTIM/F
         104KcJ1Mcja8V4vuC9Zb6h0w5Mpj+44sEdbjYoVPktE/47ZAtlxerQuJc8thiypXdGIV
         IFoDdye68VVgVXVDea5Rsp3FO1kbjt0B+VkkJpA+sFnnHUfmvSaEY+NF2QpITEXKYwhZ
         VtGA==
X-Forwarded-Encrypted: i=1; AFNElJ9L5F9QwO0oPV9Y/9y25kXKBeeC69hURhn1yxqEfptZ/vx5dQS3yfLtRM77ZDXnfutRyxOHYkL0zCJLgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3xirToaPIxK9gXWXHwU9HkaMblce7VWKRjpObvH2rvAA43ZE7
	WIhTPg82hqRCyDhLLQ+0ESIVh5rowfR+pe8+/YVBP7ERdCkHN6D33CCE
X-Gm-Gg: Acq92OExofQg7dxWG9eg4+YBnj+GmPCrO8y0vzoE2DtA+sVGdv/YPnGjSHH6EE1NkgE
	o68bMO+dF87VBv83YKxWAs4So+lkPTprubhBEn8cKSEFHqpER84uB3Lu+Yv91jPfTQbjFwi30+1
	74dBawJ4HkR49Mzm8Os+ACmBNrcJCTCf9deonqbitR6XiIXGrgZBxg9b/uLGgxy2e8kU1QdmF0f
	jJW2sZK7V6AsA6reFub4f0nneld8ZRKhvNZ2JlzP/mkqwAiKprPfzwOu1Gz1QD6RDRheMDiUePV
	2dpt0L6QP2UyXbgNXIOwb1kKfqCDL3FAt5zZ0ykeLHVErVW/vqK7kA3P6jBX1TRZXvhic7AWLVz
	LOd7Psigb24rh3MoK/7LbIIblS1AZvK9vgQ5bajyj/8ms3X6nguqHkYd30sTS2zKR7+OgtI+Fp3
	IOLiVoVqyllNU74Jkhi+JW18Eo/5ikmG2O4OSggA==
X-Received: by 2002:a17:902:cecc:b0:2c2:9254:4c22 with SMTP id d9443c01a7336-2c2a1c66cbcmr84952005ad.17.1781089867451;
        Wed, 10 Jun 2026 04:11:07 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:06 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:30 +0530
Subject: [PATCH 5/9] arm64: dts: qcom: x1-asus-zenbook-a14: add HM1092 IR
 camera and wire cameras to camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-5-0c9907da47ed@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5785; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=BQDr02hg8bk8b59H7xT+yIe/Vc7+/qS3L7NVG79dJZk=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYPclse7Xk1U2IV8599YPyXZ1Qn7Qx2T31xb
 lmTDWgaRkCJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDwAKCRAVlYpeERwF
 3hI1D/9k344JCUn7kvROvURKzlIeZDMuy0eNOWRzc6bvZJDEwlNi8/6QEaYyeqEHXnKwrq67O3g
 gy9O9IFbNAJq3KW/6CgzGNIPhfmHaSg9CT3YFCdQiGgOee05na4PlhWE4+GTmePg7LkndgP9vtd
 IRv29T5+x9rGybFaG7Hjvp66xfwJL+PC5znBRvWtdI0Znkbvh9s2/prR05Zbx2zB5DvIWc71iBe
 HD1hwAclGTd7mbWidYJrp4OjxlxqcTPvVG4PdkqGy+xP9oDT+UjOmyu6PvP5bAB0kqJJkoyJ9PD
 W22HglRMS2Fsa/+mGPCp4AmqlkMR63fnPNtzRnZCr83zceS6dIuTXbQOrBTK7p823ukc2oYfauG
 riTHhePz/kvVA4g8r9bbCXyDQiYxukJ5XzuNPp7YMFR/nV2obIofiEWR1QSjM/GNlQc74Gc8J5o
 TzR5+SLMOyD0yCi6gOieIZZwr4+aJBN1MmyTMNrHOYkptDcYnJvD+IJUjwNrccXmSCnoap9qet+
 UAPu6yClV/LtMjbNb+mpR2dOZio5qr7F6woIeKnSFFRUqGGgiiTE+2CPkG89lfiun65NSSsNzDj
 G6NdP/PQ0B0qPAjE9bH2YGD9nI5xifpMuGasLWOb2ULPuwZfjoR+6OlT+qxYiA7XlI3y7Mmfk2m
 vuF/bFiLCUQgfNw==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64414-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53FB6668A89

Add the Himax HM1092 mono NIR (Windows-Hello IR) sensor on CSIPHY0,
together with its PM8550 IR illuminator and the pm8010 l4m/l7m camera
rails, and connect both sensors to the CAMSS input ports defined in
hamoa.dtsi.

On Purwa CAMSS exposes two CSIPHYs (0 and 4) and the camss input port
number selects the CSIPHY by index, so the board wiring is:

  camss port@0 -> HM1092  (IR,  1 data lane,  CSIPHY0)
  camss port@1 -> OV02C10 (RGB, 2 data lanes, CSIPHY4)

Each CSIPHY node carries its sensor's D-PHY lane routing in its own
port@0 endpoint, per the qcom,x1e80100-csi2-phy binding: the PHY driver
parses data-lanes from that endpoint at probe time, and its
remote-endpoint must reference an available device for
fwnode_graph_get_endpoint_by_id() to return it, hence each csiphy
port@0 points at its sensor. The CAMSS-to-CSIPHY association itself
comes from the phys/phy-names properties inherited from hamoa.dtsi.

The IR illuminator is a PM8550 flash LED (channel 4) referenced through
the generic "leds" consumer property from video-interface-devices.yaml.
The HM1092 driver strobes it while streaming (700 mA, re-fired within
the 1.28 s hardware safety timeout) so the scene stays lit for IR
face-unlock capture.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 140 ++++++++++++++++++++--
 1 file changed, 129 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 388737eaa624..ab8f231cad8d 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -8,7 +8,6 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
-#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -815,6 +814,20 @@ vreg_l3m_1p8: ldo3 {
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 };
 
@@ -824,14 +837,19 @@ &camss {
 	ports {
 		/*
 		 * port0 => csiphy0
-		 * port1 => csiphy1
-		 * port2 => csiphy2
-		 * port3 => csiphy4
+		 * port1 => csiphy4
 		 */
-		port@3 {
-			csiphy4_ep: endpoint@4 {
-				reg = <4>;
-				clock-lanes = <7>;
+		port@0 {
+			camss_csiphy0_inep: endpoint@0 {
+				reg = <0>;
+				data-lanes = <0>;
+				remote-endpoint = <&hm1092_ep>;
+			};
+		};
+
+		port@1 {
+			camss_csiphy4_inep: endpoint@0 {
+				reg = <0>;
 				data-lanes = <0 1>;
 				remote-endpoint = <&ov02c10_ep>;
 			};
@@ -869,18 +887,102 @@ port {
 			ov02c10_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64 <400000000>;
-				remote-endpoint = <&csiphy4_ep>;
+				remote-endpoint = <&camss_csiphy4_inep>;
 			};
 		};
 	};
 };
 
 &csiphy4 {
-	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Sensor input: D-PHY lane routing for the OV02C10 */
+		port@0 {
+			reg = <0>;
+			endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* Himax HM1092 mono NIR sensor (Windows-Hello IR camera) on CSIPHY0 */
+	camera@24 {
+		compatible = "himax,hm1092";
+		reg = <0x24>;
+
+		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_ir_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK0_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK0_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		orientation = <0>;
+
+		/* PM8550 IR illuminator, pulsed by the driver while streaming */
+		leds = <&ir_flash>;
+
+		avdd-supply = <&vreg_l7m_2p9>;
+		dvdd-supply = <&vreg_l7m_2p9>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			hm1092_ep: endpoint {
+				data-lanes = <1>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&camss_csiphy0_inep>;
+			};
+		};
+	};
+};
+
+&csiphy0 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
 	vdda-1p2-supply = <&vreg_l1c_1p2>;
-	phy-type = <PHY_TYPE_DPHY>;
 
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Sensor input: D-PHY lane routing for the HM1092 */
+		port@0 {
+			reg = <0>;
+			endpoint {
+				data-lanes = <0>;
+				remote-endpoint = <&hm1092_ep>;
+			};
+		};
+	};
+};
+
+&pm8550_flash {
+	status = "okay";
+
+	ir_flash: led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_IR>;
+		led-sources = <4>;
+		led-max-microamp = <180000>;
+		flash-max-microamp = <700000>;
+		flash-max-timeout-us = <1280000>;
+	};
 };
 
 &i2c0 {
@@ -1384,6 +1486,22 @@ reset-n-pins {
 		};
 	};
 
+	cam_ir_default: cam-ir-default-state {
+		mclk-pins {
+			pins = "gpio96";
+			function = "cam_mclk";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio109";
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


