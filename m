Return-Path: <linux-media+bounces-14056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0991498B
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E23481C220DE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 12:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3BE13CF9E;
	Mon, 24 Jun 2024 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtCIfn4g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A2E13B5A7;
	Mon, 24 Jun 2024 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231235; cv=none; b=YyikkLvVfg4VFrCosBPzc9ShCk8cZdZgzOpljH91KlGO6BQffQsHCwLrrkj9sVDjDZ2sWZa2OyWwMH9FT9fzNCptFYA5B0e4KV64/RDTknNBA0LFJ3ySI/1p7uHikv/XI4/eKYPVM2Q2w8KtQG+OM0hF4+o6wg5TVfEMt3j2x+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231235; c=relaxed/simple;
	bh=82brtYM7j12B8u7W2GcHMM+CZ57ivQ2zfZ4Z0iv8Tyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMBgszDoZZdadkEbtWekzE8vjXHoA2Ai7NqhT7KSSMjGROynqQOF5ysjABxxWqTI/8VGYCJbkvFQLFh4onaQz98kGTBWEn69tmTC8/XpAzFfZoY4sl6KL0iSMhvYcBAIMhXAWxN5g1fu+UZsVeWvLciD+mb7EJvInJgEyLIRPmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtCIfn4g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94F25C4AF17;
	Mon, 24 Jun 2024 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719231235;
	bh=82brtYM7j12B8u7W2GcHMM+CZ57ivQ2zfZ4Z0iv8Tyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KtCIfn4gCyrLI+dL8GU6utsf+lnLwBpfNmd48u32yV5vczFQdabV7tRLZ5/ol4xbG
	 wge7YZXL0Y+EY/dz+9y5o51RqoGAGRO8/Apa4d9+4tILnIqwCJif1IPTUrw1JDatFM
	 1JIJJFeh1OWMWkqMhB0DzWucqwJGSp9rXKa3ZZ2OKOO+wrRZHttirfAF83899s7lIl
	 sKEBdaEm/TD31Oq5fIip6VT6qmnHkS04jHg4RlphD+DZVgYGnO94XXnwFqpGCxM1MN
	 BVpjLMaeRjPVAsiACfYX4DS+5WrSjQNpWY4yxACdxLw2mkSqyHa4AWAS6wBLgk3sek
	 2zzf6uAFy0DtQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89421C3064D;
	Mon, 24 Jun 2024 12:13:55 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 20:13:15 +0800
Subject: [PATCH RFT v3 4/5] media: qcom: camss: Add sc7180 resources
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-sc7180-camss-v3-4-89ece6471431@gmail.com>
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
In-Reply-To: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719231232; l=6912;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=+8YENQxMt00FwdhDAnrxPsB/bJGJg/aEMbwelAZpgaE=;
 b=XNUC0ew7jgY+a/WjeGEYH7S0fevKnPNaSupLMdr6fzAf5rei1jQ8QVc6YCBHuy02cYVsMQ638
 zltz1CfqDndA3WXZShkXGbpVZlRfrX84TeAkp0qU9gv17y5BnA7+VGW
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
 drivers/media/platform/qcom/camss/camss.c | 251 ++++++++++++++++++++++++++++++
 1 file changed, 251 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1f1f44f6fbb2..9ed810afc048 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -834,6 +834,244 @@ static const struct camss_subdev_resources vfe_res_845[] = {
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
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
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
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
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
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
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
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
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
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
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
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
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
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
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
+		.vfe = {
+			.line_num = 4,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
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
+		.vfe = {
+			.line_num = 4,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
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
 static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
@@ -2411,6 +2649,18 @@ static const struct camss_resources sdm845_resources = {
 	.link_entities = camss_link_entities
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
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
@@ -2445,6 +2695,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
+	{ .compatible = "qcom,sc7180-camss", .data = &sc7180_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ }

-- 
2.34.1



