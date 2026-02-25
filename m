Return-Path: <linux-media+bounces-53368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INAlEoITn2nWYwQAu9opvQ
	(envelope-from <linux-media+bounces-53368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:21:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F11997FE
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 551D931ADE99
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE5C3D524A;
	Wed, 25 Feb 2026 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1lAyHyp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E3A3D904B
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032305; cv=none; b=ZvJIoVWCNyEwyXUlZrNqpHGY91JE84nDLPUbnZCy3+kC2ErnXis+ynCLpEYwMZ4jN8J6bbAQBZ8vNBe4AbyQ77rZr7yfeLD+P75SwiVQGwGKar6GH9yb3XE7sF5tc6MYlG5QlHmw0fYcUatB82tIP+EIXYNwWjSnL9NzyCiikao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032305; c=relaxed/simple;
	bh=yLDu5cUjFhdo3AGB18pqGPkWdyiwCXvV+O3RIhuuAB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwwC7k9JyyLb7nBKPVNjmnXsUXJpCzlwG0yR37xRkBbMAGrD/x3+5qdOfJs1GXsXCjJ0x/RQTnphpRb2gPfTdbYr8p8msXbu0hVbr74QOEQsbLXcRwi4mA6GkVYV75hTpflzHIFTlIX6aRkN/qlFZnvQgpodrJvWokvJPQ7jGdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1lAyHyp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so71740515e9.3
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032301; x=1772637101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvIHme2tr+I1I9sXyZ4yONNWMUoW8jtQIkjCl+HmFNI=;
        b=H1lAyHypn8ZY9eW3538V8jGDRZmBH1GxlLuOhwTbSonXE++E4MnW9bgDfQe8pB2/Ep
         pSLP1ef8g9LWfQnnlo4v4UNexY3EBv/jHmJBMKTICHpmDGSqqfJyrCYxLEJaft4gOx+8
         s2076+wpxCGJPSbe4nvCEJz4W6/LyEYyGLN6oFJ+ZjN5Y4j9pLv6UVFUDGve3eBHqQZy
         4MoZtn0oF5G763Jk57SQxLuwQypC0pjDTgXRu79kQoZPvDZ4ZDYFtvQKab8yLAi5e19K
         wGWMyFbTrr0KDnPyjVxMwD65bXva+JTVtqXsGEGslbS2p43g98iSBWE+2NVuwxWOEiQ1
         a/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032301; x=1772637101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvIHme2tr+I1I9sXyZ4yONNWMUoW8jtQIkjCl+HmFNI=;
        b=kCZtqfp49Hunze9VXkDbUr9GIBGyt8+JtnwffPi8A4JG3tERy8sYIyMW+b7xVQdSKd
         kinO6TrhRB9V/yw6OZk72ptTv7pwk/05CEM0/WY9bUR+2HPNaGcnX6tpZGQ3m5bfa63N
         8KGebBzVQoyOiyJ70rVz0kbFg8zJ3mHdUgEEC212FzU+FarQrnDm/p5WFt+B/skamGJP
         GCMH2PNCLGYfuDzoFlLUyRN0hwHVeOq7L4dlWX+SzGCQOx5yJaVcqLWgjnHuX4eFAvK6
         SsuLR90MOg2LRLTEyMIesXVOyBh1kUy3cs+DNyWooJcApt8G9r55y07Fn9sONpzU554J
         UDKw==
X-Forwarded-Encrypted: i=1; AJvYcCUOhJ3EZaRUPcTflE32ndrnmi3XxnT76AYAaWbFDT+JUpbs636F9VZ+0X7EHQiiTevQMAPV8KmEn3Pa6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlxFuQcALEuHHU1SjhnSKjZ6zsdtH/RkePsKP+vuB5RZRBGYRS
	A65Ayx5/y8RAd4mVGf+oP5IlpuS0ioLQq5PSWuUmqXBaDnJH62MjfN0b081Wt325kuM=
X-Gm-Gg: ATEYQzyCEe36oDOBiAZF0GZok1E1zQa8CzOJZm+u3rpiXzWRgtAHjd/wX9TlOAXgnCS
	Yamo+cf1akrKyabLvejh0r74ZhPpFCt8qb/afYt18QmYSXK8rZqMURH/H2MUnOOEILnQbX4NGhl
	Ik4jOiIdAm43lR66OSb5yf8gPQcMlbBG8xSPM9iRuexgd4piHSHrJr9PqAuYV81SP33fcHi/csa
	ukBerEj1FMkQmYyDD6mKgXMGcQvJzmVPvHUtnakImu42zDfdXgYe5wRxChVQ9WA2/jyuirWXteJ
	QZKAro4LEpi+iE6YkJ40UZNq9NqRJkgL6QyRnHrKRJR7EFIAJ/hLNMti5ZTaxZb7ILq/ZwgQZ3V
	4HA7dd66g9++Zj8kJB+b3Y9A8EbLn3QYFDn702l/zXm8jRaUQ/f3SCcdae0Rw6/pwEoiLsRiC25
	WzfvIU4KcPezQzf0D1fStYVsqjoQ1pWrOgb6BxgiKwHP4ASPckcroCL1nt9r4mhl/w
X-Received: by 2002:a05:600c:4f4b:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-483a95e1f34mr287647055e9.17.1772032300778;
        Wed, 25 Feb 2026 07:11:40 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:40 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:26 +0000
Subject: [PATCH v8 09/18] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-9-95517393bcb2@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5036;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=yLDu5cUjFhdo3AGB18pqGPkWdyiwCXvV+O3RIhuuAB0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEb8evFKryPfWXoLNgddZVxCrCmepxB5ynqC
 TgG2k1AikGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGwAKCRAicTuzoY3I
 OqcwD/46WTcGJN/zASuhjm9WofPthVQonKCmecHDfreRJvLY4aTnlTfprnTKHrswCzFZJuwOFdJ
 uRhlKCdemzTPWa3+qOLTdcHLhz89ykQIT0EBpmc97xCym2ftiYYV22KfywqVKaZdXx/K44X2BeE
 sahj7ov3HeIE5BYNBFuPUXbTP5l+4uiZvI9YtOQt97oOLqL7YaEoI4+ADixbJECJtcmvv9/khOB
 Glassg/IR9atT3XxQTRli6o1xjJwcrs8oJHNYBXwZwnqPZjeVw9kM6AG/VsNt3DHVZzJIaW/O3F
 2MM/gli53E0lmmdAlql7Ic6Tu5fqB89tVyDhCqSMhgdmhZWrFt3iA/9flL8LhgD6U5Ry5DGdmoV
 pMdOQ7Po6rmdNupVzcdTM93mbaT0qW6rlO92dPb5dbkE8aU9PkB0fLEQlYMOKpynIYR26DSR5Ts
 EL88kBF9A5Gwm5cChXOXDIsulfJ5LIngwXktBZvkZAL9aLWuqjdgzEuTzO/s+JxuYJkKTlwTvaR
 oZWZrTDF7Cg35kVJ//ZrqGHMQF0rsE7Rmo16WG1I4CEWzMOR7uiobT6WCVhRPYHZpEyZyGtL2sm
 0aqVqcMnNMWx9jc9G2XjTBvD9mJ7HsIomNF9jnpWbqLYYlf8NTHhKUSOOmgpkowLzJ0nItxqDuH
 EhSwBw0Jj6GVIDQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53368-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,ade0000:email]
X-Rspamd-Queue-Id: 9D9F11997FE
X-Rspamd-Action: no action

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 149 ++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index f96411f481305..38f9da6ad9ca5 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5465,6 +5465,83 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
 
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
@@ -6116,6 +6193,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.52.0


