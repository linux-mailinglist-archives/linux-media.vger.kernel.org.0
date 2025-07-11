Return-Path: <linux-media+bounces-37494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F04B01CA0
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6DB15A84CE
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7462E03F0;
	Fri, 11 Jul 2025 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5Mr7b+0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3C2D8DD3
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238693; cv=none; b=rKn5QUPO3VoocPViTEn16UL07D6rFNPTFoU0ptstAM0NdNZOivggsv8+/LpIA03ppNGGbdc53pNqVofhJ7CD594oyOC4Gb33k0B5nQhP8JsKp6E0J6txr836vP3iVfas+dJqTKBQUzrpYoKdZfhfL1rr/x2tFnz7u34i5pOP1Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238693; c=relaxed/simple;
	bh=Sk+XLN+fch0oWoINUVwniKgPhQoXp0xYBRIRNEdHrJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsEWP+7tCdC4M+q5ccShqKoRea8FO7VG0Mpp1cr7u1w9WaiHxyYKlpzxcRLkLiYNc6o8Eu+apL0I5M6sarMEJ21XrllDCwAnZi84Moc9ZPwR9hXt3bvmSErsKmRIhPxZtUlQvTuX3heZRKIUJbsC0qSwCmZ/YQayjFbzJfeDQH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5Mr7b+0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-454f428038eso6550955e9.2
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238689; x=1752843489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0TSyovWiYo0zQThET59bsfsSUy3rPkQ2lfj8hcRygA=;
        b=l5Mr7b+0Oji4DJcT0E1aeP4Ki3WOMoLl6dVN4t5s3WQewvqVKEfSvQMaxmdx9ELVo/
         0YwGNGFzFGF1DLhXEjVNeiiLpwFV/Ierg1AKwFNIaghuyH87Gt/WV6wWvRw7hHJCSepg
         xJOcI+1oooPmsJ4tcUthMsz5Sszv+5iCbhweqTJBXOa12Xul7We6awWJFMQNeqhxBYzP
         kLciId5R+lOkEvvThkG3zG6t5Fv9i8wZAQCx8HkgM17rHpU8i8KMcIcgsgLsJmKAxarC
         qQIE77efGgy+WCB7rnl26EUD3Fmo1r1kttT5UJgRllcBNeawpIBpaXY0S6kcJQqzJgDV
         H2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238689; x=1752843489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0TSyovWiYo0zQThET59bsfsSUy3rPkQ2lfj8hcRygA=;
        b=cc7jH1opCkKHWjrYgVWhVqNI/r8K3bqXLbhssFbMBdrRMO6AZliTBRKRWJRcsNeupP
         uqrnq+J2rOJuR5GiRFl+n1wdYw3Ein965s6uYw1LqzL/M26tsMCdl9nWujZ8ze6Grijh
         tp8LYx96uy0NpLgcAXeDE9bHpTko0TTwSXSjqGDvydMGHxhbZ08Iu0R5U+S+zo150WWp
         6wLD0zQiTJ7vTJNOz8kulv3rWwo9yF1abJFcq1TrsnhK2TEQRFBjcWAi44OH+K8Krd35
         GSJ8sBtfFDE/w9IFBdgZqvzp4j+b+TF5YhdFQcGwXnq9xLp6Emm/t2svF2QbB1dfxfi/
         pMfg==
X-Forwarded-Encrypted: i=1; AJvYcCUhz9wYNwZaDRBLh2Vld/EtaqATemy2fxbGd5TEqmP0Dzbgt/tN0TpHiAQ6a1mqoIXy5uzll2Cvwj7ctA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSgXcR0SGYtE3BBSXNg2J3rclxBJU4uqx8jVC9WLeB2FFSIoYI
	S9njykHBamelU50kN3e6ZZ5cFvln8dR5hXx8jQMUN3PSJDbOahEgfpR+EXd+T8gBQww=
X-Gm-Gg: ASbGncsZc4VTf/70sAQgsWA9arURsUm6UZ+gh8NkPiiCbKMdHwRjJCTgAISPh3W+SLi
	GFSG3Wmf9kPUBXYfZpSjSsvWAcD3lU3TQlNzHhfzR48CM8ntbiizp2Iu/BXqOB87Bxkk0N+K4zz
	TFzoEIhAWZ135lZqezubT5MF8ePA9gV1RX6963lyvM6iaXpXUoyjpALtb6PpbDgmnUBNf5VD/X1
	bXl+ucrPa12EOVoN+5mEyqSci0409W5s3hH+yVNOXcmhWbJw3S48nfiKbci/fDtbHjHoLyH8oKL
	uE+EULfX14k87ko3x9xQMLIA+8CyyEcQiEGcmhKgMiHZ2iN/yNdWNjh+NrhcYRBBJ90oVjXODv3
	Qcm0XVeBToL6XJ92p+Bs+w855ckwaTdoe6e2DMLG+zSxqJZs1yEScsdgAwbL0IKE+
X-Google-Smtp-Source: AGHT+IFw8QMth7RNEHRPxzNd8Lkx83ng6nvNC1bJ4o3fh7Hh8yer4bOnz+VGr7l+hp1XTzf7ZEiRcQ==
X-Received: by 2002:a05:600c:638e:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-454ec15ee55mr37137235e9.10.1752238689486;
        Fri, 11 Jul 2025 05:58:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:58:00 +0100
Subject: [PATCH v7 08/15] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-8-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Sk+XLN+fch0oWoINUVwniKgPhQoXp0xYBRIRNEdHrJU=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpTQnI8GFdMlYF+BdvI6MSWYnrPVcz1ZMzNp
 nn8o0Apj3uJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUwAKCRAicTuzoY3I
 OqkyD/9cc5wBQgDeWieg156Wstei4KLNf4HtxNYf4TCZpkSaLTeXIa1o5ph6q+DoXlW8GtjO4fN
 TXzq7am0Ia+TI3rNVY+rJ6fESUFEr9v0SguWhS4rSOYJ7P1RM2OVZ4ylAtmcqloOG2jqIwCWne4
 a3I9lOaWwhHNBO+E+HBB6lvw6HO9dkcFiPTBdX6gcfaMg0Md+tmAHdlQDv3Tl0roJdCrH3IOcws
 ulnVsm2x97Mo2CMI9T4CgVXT/ItpsDssz8wtei+UzjRiCufz+dM2aHYpBdncxfQzc6li4v8f/7J
 wGxtrSVAOCO8AeMLwzP7ytJ1SeXLm8btVLhpT6Z549FkvjCHkDnHCl8P4uKMgmC0wDLFJmkmKbr
 3aIXBJIASWxxqov++QPyvLRLrqKaHIOvejrTXBkqqQ/1guTQ9IA7gQ/rD2W/Qv2DFa7aloGTD+F
 Tbob1qtO6C6dPGDmoSvdfKtUTWmVKGuZ+Oqp/7Kr+OPS9wRHyYKgD002ZzGkouEHJO+ZrjARi29
 HMOzm2WNDImoY375zg4vfQn0vvvCVfgd5bH3twqsb5MUz/wZO5fUSo5DRzm8KV1SjDkVce7cvvc
 Y9uRf9BTvr6NvPgytVHgCTxVAr1yQUn19DgoTYVrGhCdpC+LU+KcgRiPNakH8Tv9JOILVnTCnhX
 SqkB8oXNcutBwcA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add csiphy nodes for

- csiphy0
- csiphy1
- csiphy2
- csiphy4

The irregular naming of the PHYs comes directly from the hardware which for
whatever reason skipped csiphy3.

Separating the nodes from CAMSS as we have done with the sensor I2C bus aka
the CCI interface is justified since the CSIPHYs have their own pinouts and
voltage rails.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 41245e8592f78edf141141f2f5b7c5b841318f46..e385d6f329616360e089ba352be450c9eca6aab6 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5244,6 +5244,94 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: csiphy@ace4000 {
+			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
+			reg = <0 0x0ace4000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy",
+				      "csiphy_timer";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		csiphy1: csiphy@ace6000 {
+			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
+			reg = <0 0x0ace6000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy",
+				      "csiphy_timer";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		csiphy2: csiphy@ace8000 {
+			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
+			reg = <0 0x0ace8000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy",
+				      "csiphy_timer";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		csiphy4: csiphy@acec000 {
+			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
+			reg = <0 0x0acec000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy",
+				      "csiphy_timer";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

-- 
2.49.0


