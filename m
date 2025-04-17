Return-Path: <linux-media+bounces-30455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2EFA91AE0
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 13:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 506F919E5581
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 11:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323DC2417E6;
	Thu, 17 Apr 2025 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zr4dOeTW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1D623AE7B
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889235; cv=none; b=Swgg9+aSIQZWxRL9u9pDbrmeyLAHAVyEPzyU/Kd/vG/s8s3FNNavqn29P/6LMaaZQVI0yIAG5/Kv65DcGOPtjOcrzujLQwhzJ3XDMg74gbTGHtWPtnz0/BaffpVMZNFuaXi/1jEkD2IeT6xrj7lW80Df9sSGdmU8a3qMhdNmwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889235; c=relaxed/simple;
	bh=NcriGYMZwRZRM1Qw6vuW4UuCPYe+VfMiyfd9EF14yzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbvPpJm9L0SLLdmxeoF9MMKHHFbjXQekowDlhkYhEpEpcIuhUtVHaCtiutnqOCOjjd142j2fy/zjX7qSM6MHlUzLhDFgsiF0WbbtGPm+YZVeV4WGUWdUYXN57GvjMCBal5HwUIiq0QzxLVat28ExEtsSAkawzXcRJQ9snGDPplc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zr4dOeTW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf257158fso4626905e9.2
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 04:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889231; x=1745494031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcZh3O74YpUyGxnBpp2yZbicwq/KGRckATMaGfA2GkA=;
        b=zr4dOeTWbXHGv/WSI1kV148Pl/EjZ2k65+XUgNp/h8XxtTjG1WN9VA2uhR+zahX5+z
         qNUGpNw/4+BOb4Zi9NmnblJT9wfklKrxokcCnTabKPxuBrnjQkXz6qPnBLKvihEvYLZR
         Ae6OefkkDV1V2OhJQDxLIxph30sOCs8LCtrwiUfYUpaxzfUznquKRv1wrIvxnM5UepcO
         m9z01WGZ1WUDWA190Hh+3kjYTXR/dOoqBOTgyotXYHt7/ZHfFtIcGu1d1nxnYHC0DKQr
         IMatADvBVsCUGNyz6s+lIwLdK/AwlXIpwW36E+9JGZXURozkt4J9l7qa5I/g+iH7WSUH
         7vXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889231; x=1745494031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcZh3O74YpUyGxnBpp2yZbicwq/KGRckATMaGfA2GkA=;
        b=Phpl9nTmUbLeyPB3m1/nw4tOCgv8hAPGYOVC+2wfbT8uA+CjMNmfzocL3cWLmnCDed
         AmaC35iMdlATrWsxmeumXSv6BbyfyXdXDbgJyVMmWQ8o2LjLAwMyvepd05goHFCeoUcP
         Q+eAydQV3dBP18yK3WJAIFQ5jez7mMWzBDryz1988eYkgvkDfQODOVNem12Kwsg4a0bU
         urM9gpfD24Z3uDFKjWZs6mf3htPMfZ1Y5A206rdxkamtPCe/5XkEz2xAsjd31MOKziOp
         30qMihsv35Vxi/qVZG7yX09XJ5CjsbYSsG7ENF7j2ez/fd4McUpIVMXhnELn7wCL+T+X
         mctA==
X-Forwarded-Encrypted: i=1; AJvYcCU2dLyJyfkPcvGvUaacXq9ZwVDJQHk6TNu4CbihhY+lAeHBx8I5msoTW8M93BVQEHoNgUy+4DRuS8rAAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXd6qvKO+klPttHqpPDm6u4B+0L2CrDMusX0hhCJZVNYgMQe6v
	ecvpS0V+p73iR/pZEVODss0I7xjeRqzi2Zx7uKRO2zE3kEpGM4+XHPZDFnWdt2Y=
X-Gm-Gg: ASbGnctkoYGT9NOCaTAaV3QBXUYwh7z2+RSW+VJCt3KPmFTnUfZGdbSLHTw/ybjztoT
	Ij6dAXVFGirC3/6XpWakrOGji+rXdPZzRVrNMngkvEHlmcas2FHsbki/FmqCX0+sWcqpnlo8j4R
	rrqsIE2S5yq4AabmtLCWAJ7fzA+AmgmZ1Z8D56z8oF33ist7NgjpS19ktNQiemC6gBQuVpO/eXv
	UCzbfhEJ7dVteH9OqHaN90JM6vhq7ptoYEdFxhPgvCUnyWjnMr4+FsiGnhTRY3BTnseEo3mBbrn
	QKQHzWCc9gALVEEgdUA2gOZGu5avOyajJAPKasaJ7KdRMvaNUTWCkAgoO5EyhOtrB8Ah54GJcuK
	z0S4ncA==
X-Google-Smtp-Source: AGHT+IHYDrL+8g1EtW3z+xAlBB/JWa/n5mlaOnthkSWN9ndNXgNcV4bD3PEl2KB/vdDssbFxhpK52w==
X-Received: by 2002:a05:600c:1c22:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-4405d62a53fmr55768145e9.17.1744889231465;
        Thu, 17 Apr 2025 04:27:11 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Apr 2025 12:27:06 +0100
Subject: [PATCH v7 5/6] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org>
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

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index e2f6e342db7e2f7cfbda17cbe28199546de5449d..74bf2f48d93522d3f5b7ca990c06519ca664d905 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -858,6 +858,36 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vrer_l4m_1p8: ldo4 {
+			regulator-name = "vrer_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.49.0


