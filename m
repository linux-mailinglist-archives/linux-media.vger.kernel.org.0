Return-Path: <linux-media+bounces-30453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFEEA91AD5
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 13:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4915F447F60
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 11:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2588241665;
	Thu, 17 Apr 2025 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9LLGw1y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBD823ED6D
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 11:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889234; cv=none; b=DDkhhz/QMREZGraqwNtKz/fn8zcRBbehBApXWZ7lHKwSLHjLpOLaUKtpYEyfQueZ/OgbnHjYSt/UKl1XD4CfMvZveI/ZgmFtdH9C+XRaFqg0Ubcu50bx69A+PZMED+UMln0b5a5gbRlpU66Y2vHpwWJolfLDeoRU0GYzF4H6wFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889234; c=relaxed/simple;
	bh=4FrCLQO7j/YGHNafasJjx36+B+nSVYq5seBDTN9ltls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FgNmbw/tI8rBHRngPKNPVPY8giiVZ1N51qLnSg8guFDZklA+ZTZXdoFWi9vbdEjr4RBefC+uIT9nkFmCqMq1QIJI0CMLw1p6U1zrSEHruouUIbfZ+Bg6mb8aBbmZSg9B1/7bL6Knq+cpUvF24UMamQcYclAnZbdN19AitJXhE9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9LLGw1y; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so560442f8f.0
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 04:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889230; x=1745494030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kJ8ty7RIGmWcsy+9GDT37Q7U2J3An1slsXu7SJskUQ=;
        b=Z9LLGw1yqLAc4Gf/F92WjGLf2lZA5Dv+CoLnh0oHD+r6cdB4dZQHTL/wM5UHetcR7l
         k4GFYqueOA6Nt5NeHVqEz/ycb2A8PWO1axATo0JvemnCD1JobV6n9LqtLl1o6Jg35GPo
         QG4owukXtMDqWDWqPajvWQsCj+IKwJSWGIs5jpVDYjluZnVhdTkmWHMQ1zklHMEmpy/l
         oOd7Qz4wcEMZDNCT2R8RukCFVH1K+VNreLX5yDK62tgUh2genSXnoyn0YuxkUOfCRqh7
         fnSWCvGiAb3/1SjXH+KwLDxBPW+b6N7hs5/NkYUrX0mwQaNbH+1dAL+v5kwBF2EBzwMB
         t2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889230; x=1745494030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kJ8ty7RIGmWcsy+9GDT37Q7U2J3An1slsXu7SJskUQ=;
        b=Ao6EFcdGD/Tl7lNWSlJoNV+vKpSCuilgPSnXogkBUwh36UzmQhPUlIB7yJFNSB2fwS
         xhEeC6Ptakq3WnA7l+DK8y0ns9qkLMI8KbpRKIgEH66nikekgEfB6eKv75z7P1Yi+MZZ
         8dsHlEMwKHIpOxTUu5EYhlp+3tgVAa2p1DxlJBtjK9gZLEegCZKkAE7BHFzqDLzERFQP
         YT4aaSN8gZFa42spOF0Gk9P2fL2s7kcmsXeZDsH/5bxi+LNwnKCY27vJ9Jq5PEgIO+RS
         vtkvi/Zx7QfylWemZs1fM9s0Ir2WSbT6Hu6TcCSZeHWwm7LOzhhVCCjibvCBqIFdnqtX
         KYxw==
X-Forwarded-Encrypted: i=1; AJvYcCUXYHw8+IP8VGDxJ4NQZHrhSWztcpFwEKWz3oZFfJTrdtzknY9edy8Cr1JwyrIGZjsHbNCZEoeCETMNwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiyZkNW7xCocJhYZuA2C0NDcja1pTQlwWGdPdV+hcOqR1NzxaK
	4+6PlYn77J3O9Wn6MZo7qcqJUf8A8C7xXZSUEi/hFRuXiHboqHo6ajqhc16CWOw=
X-Gm-Gg: ASbGncvYgwnmCuq6BLzR2hYEWrGOhUpZgGbQQA8p9Dtxg0xoFgMnQefAv1T7zS7Pknf
	kk4Vh8sONohSAgNqQ8kojvtkCk/vp6BYBbGgb0zuHOTdtOE0MUPgcJmoxPIAxWNEof+jAP4m6Q2
	j9HbBB9P+vDb4UNkfq9OuajXiS24DEXTPzrGvpceUH51nq3cdVH8vvp/EB4OHMubZGRrPjBuIT/
	P43znufebdCZWL5iP25h9f9GFKRIkJuEeTFD/gd4XLaLht+ABZcrhqh0aStcKtqVu2EVuK2q1mL
	vDLiCFZ4frHY5XLF9/l31CDQReNmouK1U19x7UtSBTHmSdrhqb8uiqSCVDmr0BUSaw0NJsawb5L
	TIu2Zg25iBjvgQGBU
X-Google-Smtp-Source: AGHT+IGTbJ2TnuYIlie6eiSsOXwcNdw8/al3bp7vr+QQf1mn2X7l3IqvyM9VVHXIyUz8MJKBG/7oBw==
X-Received: by 2002:a05:6000:2403:b0:390:e7c1:59c4 with SMTP id ffacd0b85a97d-39ee5b1825emr4559707f8f.13.1744889230313;
        Thu, 17 Apr 2025 04:27:10 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Apr 2025 12:27:05 +0100
Subject: [PATCH v7 4/6] arm64: dts: qcom: x1e80100-crd: Define RGB camera
 clock and reset pinout
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-4-3fd4124cf35a@linaro.org>
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

The RGB camera sensor uses MCLK3/gpio100 as clock with CAM_RESET_N/gpio237
as reset.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index f73f053a46a08d875acdeeef9ac195a9b857ae3f..e2f6e342db7e2f7cfbda17cbe28199546de5449d 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1460,6 +1460,22 @@ &tlmm {
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
2.49.0


