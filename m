Return-Path: <linux-media+bounces-53377-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LejFQoVn2nWYwQAu9opvQ
	(envelope-from <linux-media+bounces-53377-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:28:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C697199979
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C7AA31BFFCD
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859E33ECBFB;
	Wed, 25 Feb 2026 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BeaSEnys"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFD43ED12B
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032321; cv=none; b=AzZsN8pLsHYrwOKNnm4ktuMcSeyml79e1AXSa44TZiIMi1eIc9vt19E4PfzBitVz6JNQoqy4muK6Zs0NfsGAjXW+JuynXVzp1JKnUTuw4fLEtwfIJxXYpUNaaBnNSC/HlICUbODFG5/QLvTGYJSJuVg8ZzS+TIMX/n+Izd5ePHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032321; c=relaxed/simple;
	bh=ebkke2YANs9n6nYyCO22AE5aFFfEjzmYBdxWd0Lesig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GsQM6eFsShfQurQ/duJc3qsX4bStUyykWUgXnrjPGW2630SsmKo0f5cI3hV1uwqSyw6ot62TefCtlBSnUeDHBBDkfv/UF+KiG7eCcZbBzFTP1FWXT6LnAhsU5TTbXMFBNLGK+nhplndxpX3Qb5tmMQzeDSSYyTK5DmOlgCKGS0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BeaSEnys; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso55183535e9.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032316; x=1772637116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tos4+IgDSo6CwfLzCIfZMyKUALZ1R6xgwrZqzbsYVc=;
        b=BeaSEnysUQJJmPwOPyMxDwDj6Nvu47ngZf1f1KyeaSu1Ll1VPKQtbUJs9EVgH9x0cm
         hGwcDfdf1q8Y493gqvylCaUpywVdXMSbxPLI7Yu6EdAQjNVbmJimN4gXUb1mAFN5EBM6
         MjoPCGXkGd+vNEI/FnBSg7ueUdU6plzthAExgbSqRM4D7pH5O7oGZAjLwNr49y/5wVPz
         V+6ZpBxYhtV7NFT3ToMkztdb9p5nfr2nbgveWnkZa6/lzn5DTKxk1z2ML/p6uB7bFj6H
         +4HqMszswXAXtbS7YW5w0Mhw4wnctExv3zy2cMF5jtSZrKJoqy79oVcdVrDjuawElhmq
         IsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032316; x=1772637116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7tos4+IgDSo6CwfLzCIfZMyKUALZ1R6xgwrZqzbsYVc=;
        b=CkIMhGcP480iYyACXiEWjC4T7NwP8i/5M1caBiDxGF+84iIpx5goE6Yr4X8chlRhWl
         wicWHBgzlQ1Cpd2ChbEW4r9fuy2HK75P8iAmxyYRvx2dDLIiqUa+jP5BZIGls/0P9zBv
         aFywe/Tv74zq1OxCnWIy8MJuARTLBHUegaQA5+oL8DElZerskidUVdb5XG3PZkHWErUh
         34Vj/ixHktFxwmaELRxoJ5kvdGVO7nsvIbmus+D3ar18iSD4mXgNP0rQmqMJwwE8Lbts
         HNpiULcjsO+a95IM6rftUcrIQPaFUZ124IKpGCcsvOa7mL1TNNFHj75n6sAo3r46Zhmv
         vwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWts3QtPmN814F9cI5zBW5tibgw9TXYbfOHnbMl5X+aJ1Oo1pHFWC0k4jQhk8OUcpSras4zKR4HzyMPuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzilc6yJynazjmrUu5kP6XuvCkamrjXmLcTud/ceP/uZQvI4sNp
	Te9DLj2lXRAP1WBmPSyLuNzX4kZ7B9ANwGAN8iu/gz7z/iNduO0SH3cFRT0pfqyRr3U=
X-Gm-Gg: ATEYQzy9EdFxhf1UHWZgxGTdDvcoN7Lb9+9cdCZG0WMagxswRotiPFb5BGD4u9DE6X3
	6j8yOBIOZZvWvzTCpP7HxvCr4Dl0poLzkjvD18O7Y6JXy5WQcS+fQW/9vjQOJy1Ak7UMc1w2MS5
	SxIvNkT6pjaSuud8d8nsrGuqxhATlYSVrESmYLeh6+FoV43npNf4sI9v1P+k28e1N6hcSylB/L6
	hMoULCy34X14wyzgh99Sc1x1e3BkGKnGx/l4KikK7GkK1q9sWPBYOgfcIdbuYnGT15N/3EHWYL5
	ITJkdY3JYQdxrUEXK/QyV+phyxEkeTm18+rQCX7rdqrvbbPvYINGTuQqCC+4nTVMVYWDF6wDgrn
	FfBD+2xtIqrcZhLmINYMmWGsjF1pW9Dvsd9gdlKWe+0IDJq6jkJ+JMZR7uLSmGGShej5nHtYhZU
	SecOUZB8Mni9B7nNCt+7PmL+vAPcJer4TqdrzCC864n3BXBY4gIBaGg0XE8SSnWEas
X-Received: by 2002:a05:600c:5486:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-483a95dea69mr255370725e9.22.1772032316285;
        Wed, 25 Feb 2026 07:11:56 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:55 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:35 +0000
Subject: [PATCH v8 18/18] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-18-95517393bcb2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ebkke2YANs9n6nYyCO22AE5aFFfEjzmYBdxWd0Lesig=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEcTGwAibtB0wENsoOC1s/k6bz4RyirTAXoc
 7ZjukTPtpCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RHAAKCRAicTuzoY3I
 OitLD/99TbZpAmDM1v6XAbKZ/oSRLA+tzBou8rGcdJ5nf1guXh1CLNuuhnm6GqG7Pbyk8X3WfFW
 VE+3wWLJoFwv8kXwlkwwwCYtdMYID7E/IItqUBVlNyO9v4POOYomAgvjBfozD1ee25uZTMDvPQ5
 JCXh3ubpjOPoFOZ9VlFx/0i8ADEbFbthhl3lsFO4YNaj8dOmACrVm7nbtx6l1tAKm15W2KAc4jJ
 eaYLi68Ln3i1n0HKMsfO9tWtRlBvQw0K1hpyOq4vlUPGp+qJ2mfs7xldjCCIVXQJnSKhuE44yuA
 CXCKOt19GiwEtpFb+ZpAWmVrEsKOonWyEXYKvf+5H8bVcbo7joTfbcWsYm8PCGJHnG4VXqqjZdX
 XyOEXj4ys3FtU0JknkO55+9gxne80Eh5wUHcZJWl3DyOi1c3Tw9Y818tH6jqR0Ai9I7ZLNWVD9l
 95L8CTR6rg+NemKwEDFCRpelZWzCSjq3/Jm6b2F1Y2zQgwge3cJhwJdaFhIU9ieuy+Y7NqvP4Gr
 fD+O0qt54vAD0ZsrC6X5p8JZ2JxAcmvi2hiOtxN+3IWfbkHYrTTP8W2s44eap+9jKsMwInTUm0P
 dwqjIezR2ZTAeNOpYPyZ4op83A5xinGC08v3HfHM//5ak0BONBW86Xae0EV+pkI5UKV4CSv8NiD
 iX4GYktCULafB8A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[0.0.0.10:server fail,0.0.0.3:server fail,linaro.org:server fail,sea.lore.kernel.org:server fail,0.0.0.0:server fail];
	TAGGED_FROM(0.00)[bounces-53377-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.3:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.10:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 9C697199979
X-Rspamd-Action: no action

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index bf04a12b16bc9..d21963e52ee48 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,66 @@ vreg_l3j_0p8: ldo3 {
 	};
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
+				remote-endpoint = <&ov02e10_ep>;
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
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
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
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
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
 

-- 
2.52.0


