Return-Path: <linux-media+bounces-24218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A899FFBC2
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 17:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC6273A352E
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 16:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9617F187858;
	Thu,  2 Jan 2025 16:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zu+v2FSI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CA015B554
	for <linux-media@vger.kernel.org>; Thu,  2 Jan 2025 16:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835659; cv=none; b=gWoqcr/fjO/rv4yTaGsPccSNVheIygTWBW5jIsIpV8XXQsFiFkEDfsHxzIwe0bDOvh2S9BBl2feBv7O4pN5oMiKac7h105BKJGACfUHo4e1fCv5aSsg0yByiXlojd4zYe//boYoe+9Kxt4qQOvnE9J27UAwCpjW5jaJwM0I4J1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835659; c=relaxed/simple;
	bh=X+nwIbBfbLcCZT0e98AgVPsphz3+SNjG2j83drNBAAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5aoNwZ63U7YPa7v71eEPQMWoejRGUL//iTeMRf/NJP63fy6xlJ3pbQyz2FgzK4O050Yd92nptHNS7lyvSdyO2s1wRsa2SlTS+BWDwlqcLBatBKuUyhk8uH+yZ0IOeTDRv8EubeoYp34FTMHdUJpSQFrYMsbP7zu1Xs2FvojfSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zu+v2FSI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso78752375e9.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jan 2025 08:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735835654; x=1736440454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jQuo0hv2fipuMWchCJhbaPZljnbATox/IIGJSDo8Gw=;
        b=zu+v2FSIBxXWhWF4fJ8b/9YYuT6w68iLvoQGe15bOUpj/PG8Htyoq8CmxG0WAJGL7x
         3g/XokqMwmfuN7Yaf0KwOxxG8ldcgFPmdMB2n8qlcEkaBCvSWB3xwMThffRZRvgabWQB
         0c4O1u99+vmiHOss8S/cJc3JgLqNpK6+pLhBZ47QmIZJP8cWEbK3zSM5ZVs8W7xJH+oQ
         05P00dmRJzqIM7jwJ16RmDndK+E4Cb8PY/OqCHnAmc/aAc/OcY5E/sB7+8Lg0bKUEKnJ
         7cmdyYYxn1sgNZu7+2lI5c2s2EqlO53YeA2iYCLZIS5Ro1+SzHUoaMa4V10VufmdmiWl
         UiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735835654; x=1736440454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jQuo0hv2fipuMWchCJhbaPZljnbATox/IIGJSDo8Gw=;
        b=BVsIIOrAb1xb4HzxT8LvNx5K4zygJtCUlj7KZiEecZrDi2cymmZjS5QXCK7A5zbQfM
         FsMSBvKU4fVdyzS3hJRseV72p6eRkHAhAqDFZpCp4E9n1T1O+9cZ5uHo4QJIhNHFcyhD
         UM4ddH4GPhp0mplrkxNWi5/i4NLa24YopsOAk6EV1hT5V5IroD9SNx66uxVNnnp+Zeqg
         /ZgxpNxySTXkjtBT7jkRKhwoP5WhzqakjdxJR0mRcgfKiLTOTUmyseLN611IIuR85oeT
         2J7Rn8nHbuix/zwgU09Zm3h6y5PHqg44NF1iSYw2Qhe0Y8H3jusS1oexACGmk57hUErj
         TmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrogTHZUzR9i1atm0f8kQrZW3cPdvGajpLuK+RipoiVuZHlr2SsAcrlMyJTBjV9xWhXkyopCSqGp7VDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0qN1DHxAR5Cp8VFIuA8jCCYGXAeT1foTBpnj5sQS3Lgg5iwJV
	gWilLAmpDR9UCNglNWoocHjxcRmbR0EFaIzBrd4FpdaM4BeE5cb1MtgrdJqYCWk=
X-Gm-Gg: ASbGnct16Nt7frTVSrn4Rd9CtyID5YKdflHwxirayXcmUY55VdnrAySYMyf87HDAyZb
	v5ZTce8fN4W5fabYNHN6AlzO2V4Pp2oVVA0sepTyCQvtE2VYWxTo44VMr+1P31Nn0aguR62eQh0
	dPzXFETMN+nMELK0ODdFJpYTc3TZx9mytUtSgYIhojLDEk+ooNPRpvuXcDvPNO4eOOXCBYP/niy
	IN4p1Ac2eOXmlPK2vQ907scXcI6JSj7pMDjGZUF/d6x0JE8lHhwRnVI9ceX2DVbDQ==
X-Google-Smtp-Source: AGHT+IFGXaGo93pdyDn4mqp8rOY1szIMFAh58hYibFmxhgmI41KP0IOCq/MZvuynZ1a9IB0ztK3dpQ==
X-Received: by 2002:a05:600c:4ec9:b0:436:51bb:7a43 with SMTP id 5b1f17b1804b1-4366854852dmr391369655e9.5.1735835654422;
        Thu, 02 Jan 2025 08:34:14 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm499265665e9.33.2025.01.02.08.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 08:34:14 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 02 Jan 2025 16:32:09 +0000
Subject: [PATCH v3 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-4-cb66d55d20cc@linaro.org>
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..5c7b0c048d41a4ba3d74bbf77216ad09b652ed30 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -4647,6 +4648,21 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.45.2


