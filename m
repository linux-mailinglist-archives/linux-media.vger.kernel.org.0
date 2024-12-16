Return-Path: <linux-media+bounces-23515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DE19F3D90
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 23:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA9316970E
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5282C1D9A56;
	Mon, 16 Dec 2024 22:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYpij6A1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1289E5D8F0;
	Mon, 16 Dec 2024 22:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388247; cv=none; b=VqNuLqqLrswqdCgPK1liWAav0fXmAlOID2W3hL9U+FoF5eDq3PxUxwZts9xJ/QfM9oAtb7Fcs67HaHizOXGys3wSZIEWy45xnC4+lBDYRrPfotpU9mAcR6oqonBbC/1AMz20V/92vG56AfvYTiFye9yHbAJgTiZXAdTKTI8GoeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388247; c=relaxed/simple;
	bh=SUXc9u0TWw5gGgqFBFaLmZM31gG/4GGYqseRp9tI0eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+dfT1D82OWNA3zEm9Q1LUnUAQrtKAy3+Ok5HXdykfsMvNWmHzsBApkdb8sjtz7O4ZpkPKXt63rDLBjRIKA8/6FIBFLCrlurHvAFxHKoiTwsZ+QERfoV4wHngYo8SF+1FSgcH+uVhG31iU1fAqZEBdz5R1Z88RSCiP+cReSYA6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYpij6A1; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-844e394395aso129027239f.3;
        Mon, 16 Dec 2024 14:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734388245; x=1734993045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAMKrp0JYTN1qmcj0JowE768G+mhJyyGnyHL1I5N/Y0=;
        b=AYpij6A1OGy3NzxRuEzTdjIoKDMrMoaQP9nAYaKHJ0r195iCeSQCQmqpXtm8cBmljI
         WD5mqZHI+mEUrWJgPJ+NirehzSBOzDgajBK4rbjF+fnwzbHU1eoJlB4wKGwIgNqK1gs/
         YOrr2Z9TUFgOQD21Bdh8vOz+0OXMlAoxbhw7YV1bAyI7/gz2ngOvtpM1RJgRZ6XyLOTz
         sZu77B+//eibwApL9N9AaXR+12FnrlfqyeRFH5D+TSf9F7tsrILqanBvFMuB0kZEpKHW
         uI4ty+IZg00O2JB71jdyi3oZ6Toh9aXXyfR7IhKqqe5XtVnF7uk/TLjk+MX2ohyyhf4J
         GBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388245; x=1734993045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAMKrp0JYTN1qmcj0JowE768G+mhJyyGnyHL1I5N/Y0=;
        b=nszOR0mnDr+0yiL7HTnRz4fGzz+9YMX44w+s0OPva1HqKvkDl8V724wcK5UjQjYuNp
         l+Xoei9XnR7BgGJKFO/zN0RAtZwfIKqpDaAiLpbTYeidbblbArKt+KguExlF2deODVlA
         r8wpN8GATzgIosGiLA1k46w0cWxcxiyV0hin4mTxjl6IA0YV8tBqXt5kldt/xNglJ/fS
         S50g62i2xU0u3yf6TeMQoh3vMT8njPfx6u42BZRvXFT1OFzbMjquHZ5gKgqeT+sD3zDo
         h+9friNYpTXnx0wk3TmohHz87kpIsBYnvRwV8TLIt2svM9wjklIG2dMpMi9dI5DQofXt
         QVxA==
X-Forwarded-Encrypted: i=1; AJvYcCV6WO2JDEHr/ds2Z31O3p7ktRdBVWJXJXUp2askRGUCT6PDbBkEoXNPu6eKB2BUwMlDb/wxEUqu6L4d@vger.kernel.org, AJvYcCWMuXWC6TW42oPDy8v65y0EoqwSLKK+GGcYR429Ol1YA5sZ9MndVakXh67ZEWN9uK/yvitKeGER2W8VBnc=@vger.kernel.org, AJvYcCWZ6NySixvRbgOtnOxbdAnJFE8v/+R6kKNIeu5pDvr3362jfupYlDz2LfFdUTmRR2YYa2B/sFvLkzVsL++ulQ==@vger.kernel.org, AJvYcCXOZPY0Gb+1yLJd1huY4scafEb1PJD/bfkLi8RuNA43zlLBm2HIAU7I6MxrcuFnkZiyhXxO1Mhhn75r@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Ar+tGxUX1FzzCabOZXZbOp1pcUqWmNNO8QN5s87mx76wgesa
	c0hU/GTn3OzGeyvNHzXB4EBSdxCD4Ev8fXguJaYwD6fMe+6LuG04
X-Gm-Gg: ASbGncuOH/mZ9NOhR0f4F2xJxccBp+abbAIAAUxpGJ9TUZOcu00S9Ndg0Or48p0DRlx
	jPfaLziMIbnhVaUebY0fT4ZfWmRtvZBvHrYDjf7hqF2Q5oDQNTyvXBpWUxa+bjH2bZ2ZCThloZA
	8/XCt2Wr6m2PodBBCAG0e0AByZNNb0+JcM8obGOmvi+3YEGiLrYqLmgM+MamKHTCMLdc4TraUma
	Sf1JDFfqTta+ZSmx0albTA1Q5GF3hizmLXI+pApYPa9
X-Google-Smtp-Source: AGHT+IGw8iJLS9XfQoERiWK9b4sI3kwpeOpATbiohknGUzBz3ZUqIqj5tM1VknrgFO6fBedFcnp32g==
X-Received: by 2002:a05:6e02:1989:b0:3a7:6e59:33ad with SMTP id e9e14a558f8ab-3aff80100a3mr112262315ab.17.1734388245152;
        Mon, 16 Dec 2024 14:30:45 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::d916])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3b24cf3adedsm17783995ab.53.2024.12.16.14.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 14:30:43 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v8 3/5] media: qcom: camss: add support for SDM670 camss
Date: Mon, 16 Dec 2024 17:30:24 -0500
Message-ID: <20241216223019.70155-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216223019.70155-8-mailingradian@gmail.com>
References: <20241216223019.70155-8-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem for the SDM670 the same as on SDM845 except with
3 CSIPHY ports instead of 4. Add support for the SDM670 camera
subsystem.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/qcom,sdm670-camss.yaml     |  72 +++----
 drivers/media/platform/qcom/camss/camss.c     | 191 ++++++++++++++++++
 2 files changed, 227 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index f8701a8d27fe..892412fb68a9 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -31,21 +31,6 @@ properties:
       - const: vfe1
       - const: vfe_lite
 
-  interrupts:
-    maxItems: 9
-
-  interrupt-names:
-    items:
-      - const: csid0
-      - const: csid1
-      - const: csid2
-      - const: csiphy0
-      - const: csiphy1
-      - const: csiphy2
-      - const: vfe0
-      - const: vfe1
-      - const: vfe_lite
-
   clocks:
     maxItems: 22
 
@@ -74,6 +59,21 @@ properties:
       - const: vfe_lite
       - const: vfe_lite_cphy_rx
 
+  interrupts:
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
   iommus:
     maxItems: 4
 
@@ -177,10 +177,10 @@ required:
   - compatible
   - reg
   - reg-names
-  - interrupts
-  - interrupt-names
   - clocks
   - clock-names
+  - interrupts
+  - interrupt-names
   - iommus
   - power-domains
   - power-domain-names
@@ -221,25 +221,6 @@ examples:
                         "vfe1",
                         "vfe_lite";
 
-            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
-            interrupt-names = "csid0",
-                              "csid1",
-                              "csid2",
-                              "csiphy0",
-                              "csiphy1",
-                              "csiphy2",
-                              "vfe0",
-                              "vfe1",
-                              "vfe_lite";
-
             clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
                      <&camcc CAM_CC_CPAS_AHB_CLK>,
                      <&camcc CAM_CC_IFE_0_CSID_CLK>,
@@ -285,6 +266,25 @@ examples:
                           "vfe_lite",
                           "vfe_lite_cphy_rx";
 
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite";
+
             iommus = <&apps_smmu 0x808 0x0>,
                      <&apps_smmu 0x810 0x8>,
                      <&apps_smmu 0xc08 0x0>,
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9fb31f4c18ad..aba2dbc00e82 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -738,6 +738,185 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_670[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "soc_ahb", "cpas_ahb",
+				"csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "soc_ahb", "cpas_ahb",
+				"csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "soc_ahb", "cpas_ahb",
+				"csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_670[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "soc_ahb", "vfe0",
+				"vfe0_cphy_rx", "csi0" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 384000000 },
+				{ 19200000, 75000000, 384000000, 538666667 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "soc_ahb", "vfe1",
+				"vfe1_cphy_rx", "csi1" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 384000000 },
+				{ 19200000, 75000000, 384000000, 538666667 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "soc_ahb", "vfe_lite",
+				"vfe_lite_cphy_rx", "csi2" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 384000000 },
+				{ 19200000, 75000000, 384000000, 538666667 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_670[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
+				"vfe0", "vfe0_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
+				"vfe1", "vfe1_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 4,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+
+	/* VFE-lite */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
+				"vfe_lite" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_845[] = {
 	/* CSIPHY0 */
 	{
@@ -2582,6 +2761,17 @@ static const struct camss_resources sdm660_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources sdm670_resources = {
+	.version = CAMSS_845,
+	.csiphy_res = csiphy_res_670,
+	.csid_res = csid_res_670,
+	.vfe_res = vfe_res_670,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_670),
+	.csid_num = ARRAY_SIZE(csid_res_670),
+	.vfe_num = ARRAY_SIZE(vfe_res_670),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.csiphy_res = csiphy_res_845,
@@ -2627,6 +2817,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
+	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
-- 
2.47.1


