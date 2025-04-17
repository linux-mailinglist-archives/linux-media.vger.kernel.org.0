Return-Path: <linux-media+bounces-30451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FDBA91ACB
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 13:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0222A19E345F
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 11:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AD423ED7B;
	Thu, 17 Apr 2025 11:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9TAXcW0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487CC23D2BD
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889231; cv=none; b=uPKm2A2awuRmEoBfPXvK6bmE4h1u194fRW6FL0rdJLI8DTo5yEmh18lXUq41W59qoY4Ka9AvMH1oUkFDQwdzLy1m68Rxk3rcepjsDH6SpwyTnH/SE5A9IbL59H80Op9hmBcBDgVGMPd9scMDjAIw8couUQ6FAjsk4NWaW36dQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889231; c=relaxed/simple;
	bh=hDddIwvlTDMzReVuUyCkrtqQUet2IXs5iUQX60KMgaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbZY4dtRhs/X5eLQuTVfXbBXPEym79MOTyOn27sTw743lAg/hqOIG63u0KswOUmMUwwW7c5+1aCv9vodl2tHurZLdtDhcCHysyME8bRO7rLFwlAebWzSw3aDi7ZdjRwCg99rvukk51kO4D1OuNcMW167rqkFigML8DpcSDcehbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9TAXcW0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso4665245e9.0
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 04:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889226; x=1745494026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jgi1FQ5Hy/QuNveGTgtne5MVjuvQZSqeo7o4egSVbSw=;
        b=Z9TAXcW04nmtXvI8nRCsOd7I2QIW6PSILHCk2GSJud/vZu41UniREoRfcZgrxRp2JW
         oFoHV61ojvGYAK2w405TO7LorskBo5q7NbuNcRMxDPJU0x7WNNpUQ7ZDLz5tM3CW0blt
         9J4Zc+djEk9UctDU8Wy9sSrj0QjsTziG/IpOsmWhEtDFc6QP7x3BCemH7YX4FsQrJ7em
         2oYRlESbPsb+uAl2HR7vOrR3+Ub398FWoclcE2wF7PtXBGq1D7o3P8+gD8xp0cloeNZL
         QJWbPn3WBevby+lwERiIvY5D04gbG7AwRvoXPatyn+yAzkeWfdfptcYYalWUShCaynO+
         nJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889226; x=1745494026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jgi1FQ5Hy/QuNveGTgtne5MVjuvQZSqeo7o4egSVbSw=;
        b=l0ZOkWilMctFLKB+zO6HOc/xx0ROLFEzPBm6YE83YZ3raV0QUJPJsuOdsp+gbIM1A7
         TmqrCTSPW5gD6fbuMhJlNO3EoMA1ixm4pSM189f+98Qnw54G9kUmIyaLTSNV0c2mdaIj
         F0LCbNL/Qc3tEAPm2evu/lh7ioSgwgM+fzB8vx2J8IS9+Ib6JP2zdtYbIRG+NMke2L3H
         Typzoqth8Cfsorp1P4gKFLqg8P1B8vRNJIMriWAEwuvIy8GPqZ5nbyEbm1Hrta3Ks8fd
         xebE4/3OhT8S6YsoxhMLoA9peBF0bSjyNmowJEBiPP/zyy8xpcwYx8u9NiK/VcxqnZOo
         kuKA==
X-Forwarded-Encrypted: i=1; AJvYcCUTKKe0quiRrRhBE+DaFs3ftIq5BKP9sAahQ8/3PQmmfDC25ud3ckhXmmGXnSHUpfE2PO4xN9lWysZh6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxStzfKIBSgtpqXmfjEKGJ6e7g5YQQ5xyU+mQnTxS7sQwvjf7ea
	qpi+vvHAITbIn5GfRMU0WcfXmj+NhH+4n4jxwQ8rfZjNyd+AVviiR/dReQ9JT6s=
X-Gm-Gg: ASbGncuActPiJCGWd17HBemZLFUfVST+QWWLMw70tSPReOIsPIG9u1XXeefDlhpuLBB
	TjJiwdVPe+tojWGaYZuJye2u39i/PRasRGECLUW0PVmlR6lr7go9D1TassdU2zkXsOSboFiMby5
	ul/vJNPhC3P2RwdlGEVr8zta3Qpe6gXhwcxAO4hD/dtyCbQFdRCn7UprKaKE714D3Zq/bKws9J5
	xPGjIhR+ARve9rDRuqnMHUcritZFFP9qPh79P6C/71FHP1nqoloxwEW18QveGXthsPNkumrIgFT
	bfStY3FqOMuqqDDiGiVJF0ABhWE1XpFYR/fB5uA1zxgqES9vK52i4B9heLRjCcBnn5L4hhk4w/D
	PN5cmZg==
X-Google-Smtp-Source: AGHT+IGN81sMeD9tcxfnFwYfOV4hKuARvvD9rpzZ33eZh0pIDM265CED5xrBR0aBqKfLf+uRTRzidw==
X-Received: by 2002:a05:6000:430e:b0:39a:e71d:ef3f with SMTP id ffacd0b85a97d-39ee5b13fe8mr4740139f8f.5.1744889226436;
        Thu, 17 Apr 2025 04:27:06 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Apr 2025 12:27:02 +0100
Subject: [PATCH v7 1/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-1-3fd4124cf35a@linaro.org>
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce92c90d969e3de48bc88e27915d1592bb..17e044dbb3b6de278d446eaf448561333e407843 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5116,6 +5117,22 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.49.0


