Return-Path: <linux-media+bounces-13913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E709120FA
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 11:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B9DB1C23546
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 09:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4589416F8ED;
	Fri, 21 Jun 2024 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLBloX56"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4716EBE8;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962858; cv=none; b=Pp3l+5HL6DqEkcLcq2wl1WZ2REaK+FJp9AFdVSDDknowmnHpQOLkfRLTU8+ZJlOeXz6ssdxP9UovQT2KA6usAl+IkZ1253UB5LDSZZkv1JFI5J+Wb2zn0PQdvKx9VmRCJSZQ8tyoJ0ZCkV3z9WmDPhHENEg0aYtABk7Idc2PW2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962858; c=relaxed/simple;
	bh=KVL37aI/mEK+Jaxu5LEBRdZLrd8x31HIyJv8AIRYS3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQvTM8scLr/38TAMGgoNmn1QkT+6w9A7xyfi6Kty5HHM2q63IlRtxf2jRyOQe3rnL4XL0JtieHrNzF/nVEyf3w+LxbnpczzBhjNipgjoNfMkE85vePbo1/IpaaUaaqDoEVruSM11iYL0M+71jACjwkHqidvVGTI3DHkgE2tzHLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLBloX56; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76F84C4AF17;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962857;
	bh=KVL37aI/mEK+Jaxu5LEBRdZLrd8x31HIyJv8AIRYS3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pLBloX56cYGdDzwLdh1mobIBAH/Fd4ewnnFusdDhBv7H6nwiBBJtcT2YYocMhS8p0
	 D2KJWSFqdst1e3SqwB6EDTbbxTDf1thbK7jtB2TD/BkQfl3QFC3dI+rnauPEIvToBr
	 FENowaym0w8TZjB7EbaK51JBG1+fdY5gprbns/yV65ELQO7l4iJYVJq4Yxn+b0YKVB
	 BzmfqY3bVBdR9J8gFkRtqmThglQcFugkgCZKtYKvzXtg+KJw88XksSCXDvAf4eIlf0
	 2SAUqTnzH2971nKkkkTb/88pUg8jutA2HjjQg7Vn0mOFxExEIGMN67kPpdj0IgnViK
	 C4b5ToQ0ZA6wQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF08C2D0D0;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Fri, 21 Jun 2024 17:40:57 +0800
Subject: [PATCH 5/6] media: qcom: camss: Add sc7180 resources
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-b4-sc7180-camss-v1-5-14937929f30e@gmail.com>
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
In-Reply-To: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718962855; l=6319;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=Nbr7Midohix3iAz4sw6Ut6JUp3rTkZVpkgm3ZSVgBf0=;
 b=UOtKxdLdTXVn54E94Mt1hoAQtQlJFUsvC4uZBRdD1GWc+ejxLIZDY6etCh3edg2Mo5UDQb8+X
 YsgN7fG3J3FBdPDwmA3UNEcWPbA25ME8Vr7LjAJXUlba6qIrYY15yTn
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
 drivers/media/platform/qcom/camss/camss.c | 218 +++++++++++++++++++++++++++++-
 1 file changed, 217 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1923615f0eea..d50f98565531 100644
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
@@ -1263,7 +1467,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 	for (i = 0; i < nclocks; i++) {
 		ret = clk_prepare_enable(clock[i].clk);
 		if (ret) {
-			dev_err(dev, "clock enable failed: %d\n", ret);
+			dev_err(dev, "clock enable failed: %s %d\n", clock[i].name, ret);
 			goto error;
 		}
 	}
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



