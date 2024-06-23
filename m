Return-Path: <linux-media+bounces-14000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A568913F2B
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 213C9281893
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CB01891A8;
	Sun, 23 Jun 2024 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdoxwzIg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC6185E70;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719184976; cv=none; b=o6jeVgecg9agBEcJf7An+eDAcIwhpyjQDqxZ+S0ldmf5QNkyCA6Vr3ij64lD4ZcMZMBGRDCXmcq3/UbuZNn1s2f54Nrf5snIFZWTMc2f9egj5KJjcH8S4T3Kiq/+mE8QREYOBRJ+5frGYZUNqgHEQGQacB32YUj+YNassx+UIP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719184976; c=relaxed/simple;
	bh=qoe4zeVEEi+STk5gxxMg7Ue33w5bLBVqmmVRNs5lIPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHWzpaAlyzvUv4R9mpZhXsRg+3MmaLfOUJhPni8nFMWwZZzfi14T/jABEeMpUlEdMrIkbzn5hZKDFzZWlKeDC7509Eissblsim7QNGRI7RtzYPvjZ9g7PrKVkym4XMAAT7TzfZFVj8NkT0rrY2wJzG2DGOpMh9w1jeP807iHZ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdoxwzIg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 532C6C4AF14;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719184976;
	bh=qoe4zeVEEi+STk5gxxMg7Ue33w5bLBVqmmVRNs5lIPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GdoxwzIg0IB4zqVaw/fqaH+ieDpgjwn9ji8c/qqRXZfS4PB7TA2pO87LVlHg2Gdly
	 HLbP6perQlNMyGqUEsTVvMmMaMlhRxrjmsPyJwqZSSoFHnnG6sXMTXyg9LhOVRiwCj
	 fsHRm/i16rVu6uLZTYOxyRRuCpWGOoaZGnIJs7akirDfl+++CDBZSPjxs2w1lXBRPB
	 jXtDLCztjEXb24+XZK4YSVVno5VCcwkHy4UPJ2JQ38dhEz0GEd4zyx15iSVxtix7Wv
	 vw95LoNpAAWBpEAY585EW+/whfWlCAqRxBw2Fr7QMDjfjmzR4n5YqeGVKNPlBPEhsB
	 y4cZ7P/dyMemQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4572EC2D0D1;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 07:22:43 +0800
Subject: [PATCH v2 4/8] Add sc7180 resources
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-sc7180-camss-v2-4-0dfecdc50073@gmail.com>
References: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
In-Reply-To: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719184974; l=5971;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=eYOdfLNfRsR/Y0mGhFjRJip/UgmhUUZf9hPbYPKEjak=;
 b=i7ZRKHlI9DdJ5G+7EtxDj3+i4xLJDLUjdxubzGk6kl1k3SIPzbFhOwBddGUw7OyUr4Si/JzRh
 jxkMDlBypHcBNSakfYm7FNv10p3EoFP/UdHKrd1oKirzNmMRIbMWn1J
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=Ac2fkTqgUBlj2sns9hRIWJTYhWHO1BsmHbdBb5UpUUY=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20240621 with
 auth_id=176
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

This commit describes the hardware layout for the sc7180 for the
following hardware blocks:

- 2 x VFE
- 1 x VFE Lite
- 2 x CSID
- 1 x CSID Lite
- 4 x CSI PHY

Signed-off-by: George Chan <gchan9527@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 216 ++++++++++++++++++++++++++++++
 1 file changed, 216 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1923615f0eea..86ba80c47188 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -713,6 +713,210 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_7180[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy0",
+			 "csiphy0_timer"
+		},
+		.clock_rate = {
+			{ 150000000, 270000000, 360000000 },
+			{ 300000000 },
+		},
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.ops = &csiphy_ops_3ph_1_0
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy1",
+			"csiphy1_timer"
+		},
+		.clock_rate = {
+			{ 150000000, 270000000, 360000000 },
+			{ 300000000 },
+		},
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.ops = &csiphy_ops_3ph_1_0
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy2",
+			"csiphy2_timer"
+		},
+		.clock_rate = {
+			{ 150000000, 270000000, 360000000 },
+			{ 300000000 },
+		},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.ops = &csiphy_ops_3ph_1_0
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {},
+		.clock = {
+			"csiphy3",
+			"csiphy3_timer"
+		},
+		.clock_rate = {
+			{ 150000000, 270000000, 360000000 },
+			{ 300000000 },
+		},
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.ops = &csiphy_ops_3ph_1_0
+	}
+};
+
+static const struct camss_subdev_resources csid_res_7180[] = {
+	/* CSID0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = {
+			"soc_ahb",
+			"vfe0",
+			"vfe0_cphy_rx",
+			"csi0"
+		},
+		.clock_rate = {
+			{ 0 },
+			{ 240000000, 360000000, 432000000, 600000000 },
+			{ 150000000, 270000000, 360000000 },
+			{ 150000000, 270000000, 360000000, 480000000 },
+		},
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.ops = &csid_ops_gen2
+	},
+
+	/* CSID1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = {
+			"soc_ahb",
+			"vfe1",
+			"vfe1_cphy_rx",
+			"csi1",
+		},
+		.clock_rate = {
+			{ 0 },
+			{ 240000000, 360000000, 432000000, 600000000 },
+			{ 150000000, 270000000, 360000000 },
+			{ 150000000, 270000000, 360000000, 480000000 },
+		},
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.ops = &csid_ops_gen2
+	},
+
+	/* CSID2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = {
+			"soc_ahb",
+			"vfe_lite",
+			"vfe_lite_cphy_rx",
+			"csi2",
+		},
+		.clock_rate = {
+			{ 0 },
+			{ 240000000, 360000000, 432000000, 600000000 },
+			{ 150000000, 270000000, 360000000 },
+			{ 150000000, 270000000, 360000000, 480000000 },
+		},
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.is_lite = true,
+		.ops = &csid_ops_gen2
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_7180[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = {
+			"camnoc_axi",
+			"cpas_ahb",
+			"soc_ahb",
+			"vfe0",
+			"vfe0_axi",
+			"csi0",
+		},
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 0 },
+			{ 19200000, 240000000, 360000000, 432000000, 600000000 },
+			{ 0 },
+			{ 150000000, 270000000, 360000000, 480000000 },
+		},
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.pd_name = "ife0",
+		.line_num = 4,
+		.has_pd = true,
+		.ops = &vfe_ops_170
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = {
+			"camnoc_axi",
+			"cpas_ahb",
+			"soc_ahb",
+			"vfe1",
+			"vfe1_axi",
+			"csi1",
+		},
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 0 },
+			{ 19200000, 240000000, 360000000, 432000000, 600000000 },
+			{ 0 },
+			{ 150000000, 270000000, 360000000, 480000000 },
+		},
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.pd_name = "ife1",
+		.line_num = 4,
+		.has_pd = true,
+		.ops = &vfe_ops_170
+	},
+	/* VFE-lite */
+	{
+		.regulators = {},
+		.clock = {
+			"camnoc_axi",
+			"cpas_ahb",
+			"soc_ahb",
+			"vfe_lite",
+			"csi2",
+		},
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 0 },
+			{ 19200000, 240000000, 360000000, 432000000, 600000000 },
+			{ 150000000, 270000000, 360000000, 480000000 },
+		},
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" },
+		.is_lite = true,
+		.line_num = 4,
+		.ops = &vfe_ops_170
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
@@ -2105,6 +2309,17 @@ static const struct camss_resources sdm845_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
 };
 
+static const struct camss_resources sc7180_resources = {
+	.version = CAMSS_7180,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_7180,
+	.csid_res = csid_res_7180,
+	.vfe_res = vfe_res_7180,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_7180),
+	.csid_num = ARRAY_SIZE(csid_res_7180),
+	.vfe_num = ARRAY_SIZE(vfe_res_7180),
+};
+
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
@@ -2137,6 +2352,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
+	{ .compatible = "qcom,sc7180-camss", .data = &sc7180_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ }

-- 
2.34.1



