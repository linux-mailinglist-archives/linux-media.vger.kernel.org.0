Return-Path: <linux-media+bounces-20722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DC9BA2D2
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 23:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15DA12832EA
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 22:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078A21AF0C2;
	Sat,  2 Nov 2024 22:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VNb1v8B6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670891AC43E;
	Sat,  2 Nov 2024 22:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730587187; cv=none; b=SMmd2hTBKIADKZ3WGimYBZ2u8QKt33KBCXBkIw8e9LgbhyvnOTX+sZ4dOneFsoK690bklDXXxRiyR7I/+Z2d9S+g5ekSOggEOCzGd8LPBBypvplaHJzYjx15ipm37p5OLFrtzkSlftLmwYKUaBtp4gB1OlvauGlI/5E3bKE+BvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730587187; c=relaxed/simple;
	bh=8uapuhzcoEEROc/m3t3yzzxEVVf0sVrzaxgbMRbq6Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjJYLLrmfP6p9J9F3wBOQcCkJJC1iQQgHiVs5am6Cc/msvKGOWEs5XnWQ6pEg10Brei4dTld5IcHyRuslrvrANfRtJJF9o1Cp3NQ1xdhq36jxMAb0o9f7vNKUDf7ISXNC0OO/9TVIyxZ5ea9ZeyBuxEfHbj2KozxQ92iLtZ1D3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=VNb1v8B6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.0.162] (254C1E29.nat.pool.telekom.hu [37.76.30.41])
	by mail.mainlining.org (Postfix) with ESMTPSA id 8C2B5E45BD;
	Sat,  2 Nov 2024 22:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730587178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWlhsEsm/LLraQLpzm4h4Y3dCktYQ70fSrM1iKEi9dQ=;
	b=VNb1v8B6fWfvcfud38uz0Euj+w777SMNoW235H1+WwOkJsyokIsTDRcaL9CEMYVS7qqzdC
	ZUW3lV3wseE4jz3Zr8zwHAi3fK4A5XlvSQvNzkfAwGSHDyZpVku3HCcupDVQh3RDgZve1U
	Otql9mr9sWyA3NY/jDgFvy29Q9IHV1sqpqtb5I9UgbM7eHgMZgqUD3RZngNrclaRKcS0ef
	27qUAn9H8DenYbNkEclMSXlRalHkLIPTJ4JqZu7wTO00ul6LQ5tnv+TLrMX49fpr/1WaPl
	H9j5mITWQJxPpkbJG1+1nN0c8RoNzYjRMFjrtWT+Vpkz6PeBQ4Yc3G/kL6wJqQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 02 Nov 2024 23:39:14 +0100
Subject: [PATCH v3 3/3] media: qcom: camss: Add MSM8953 resources
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241102-camss-msm8953-v3-3-7041c9fa7a58@mainlining.org>
References: <20241102-camss-msm8953-v3-0-7041c9fa7a58@mainlining.org>
In-Reply-To: <20241102-camss-msm8953-v3-0-7041c9fa7a58@mainlining.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730587174; l=10199;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=0ZFaFBNFOmvZEnGfKS4IFJZ6Ufox5bd2zyapf/sD3pA=;
 b=AZvnT3tK8lUSg7EQh+UVquWnRCMmFlOX7ilZ/vpuBTPzGQp+TXLWB6lpud1bW+UsAgxW2966i
 YOt4Bs26xpIDHS07Uf/RVMuDx2lUSX+HPpneWHF0tEK6gZyrDs3hCqA
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Vladimir Lypak <vladimir.lypak@gmail.com>

This commit describes the hardware layout for the MSM8953
for the following hardware blocks:

- 2 x VFE, 3 RDI per VFE
- 3 x CSID
- 3 x CSI PHY

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c |   1 +
 drivers/media/platform/qcom/camss/camss-ispif.c  |   5 +
 drivers/media/platform/qcom/camss/camss-vfe.c    |   1 +
 drivers/media/platform/qcom/camss/camss.c        | 170 +++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h        |   1 +
 5 files changed, 178 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 68a3ea1ba2a5299cf28289dfdb958cfdff3c91e0..5af2b382a843c2b8857339ba28930fe1682c9412 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -596,6 +596,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		return PTR_ERR(csiphy->base);
 
 	if (camss->res->version == CAMSS_8x16 ||
+	    camss->res->version == CAMSS_8x53 ||
 	    camss->res->version == CAMSS_8x96) {
 		csiphy->base_clk_mux =
 			devm_platform_ioremap_resource_byname(pdev, res->reg[1]);
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index a12dcc7ff438c55167bc2981fd399dbf178181df..2dc585c6123dd248a5bacd9c7a88cb5375644311 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -830,6 +830,7 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
 		ispif_select_cid(ispif, intf, cid, vfe, 1);
 		ispif_config_irq(ispif, intf, vfe, 1);
 		if (camss->res->version == CAMSS_8x96 ||
+		    camss->res->version == CAMSS_8x53 ||
 		    camss->res->version == CAMSS_660)
 			ispif_config_pack(ispif,
 					  line->fmt[MSM_ISPIF_PAD_SINK].code,
@@ -848,6 +849,7 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
 
 		mutex_lock(&ispif->config_lock);
 		if (camss->res->version == CAMSS_8x96 ||
+		    camss->res->version == CAMSS_8x53 ||
 		    camss->res->version == CAMSS_660)
 			ispif_config_pack(ispif,
 					  line->fmt[MSM_ISPIF_PAD_SINK].code,
@@ -1111,6 +1113,7 @@ int msm_ispif_subdev_init(struct camss *camss,
 	if (camss->res->version == CAMSS_8x16)
 		ispif->line_num = 2;
 	else if (camss->res->version == CAMSS_8x96 ||
+		 camss->res->version == CAMSS_8x53 ||
 		 camss->res->version == CAMSS_660)
 		ispif->line_num = 4;
 	else
@@ -1130,6 +1133,7 @@ int msm_ispif_subdev_init(struct camss *camss,
 			ispif->line[i].nformats =
 					ARRAY_SIZE(ispif_formats_8x16);
 		} else if (camss->res->version == CAMSS_8x96 ||
+			   camss->res->version == CAMSS_8x53 ||
 			   camss->res->version == CAMSS_660) {
 			ispif->line[i].formats = ispif_formats_8x96;
 			ispif->line[i].nformats =
@@ -1162,6 +1166,7 @@ int msm_ispif_subdev_init(struct camss *camss,
 		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x16,
 			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
 	else if (camss->res->version == CAMSS_8x96 ||
+		 camss->res->version == CAMSS_8x53 ||
 		 camss->res->version == CAMSS_660)
 		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x96,
 			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 83c5a36d071fcc32c4b8a89e4e429dc1820df139..80a62ba11295042802cbaec617fb87c492ea6a55 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -285,6 +285,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 
 	switch (vfe->camss->res->version) {
 	case CAMSS_8x16:
+	case CAMSS_8x53:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fabe034081ed0a7c0e0fcd8bc76c4eb396cb0067..9fb31f4c18adee886cd0bcf84438a8f27635e07f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -152,6 +152,160 @@ static const struct camss_subdev_resources vfe_res_8x16[] = {
 	}
 };
 
+static const struct camss_subdev_resources csid_res_8x53[] = {
+	/* CSID0 */
+	{
+		.regulators = { "vdda" },
+		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
+			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 310000000,
+				  400000000, 465000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_4_7
+		}
+	},
+
+	/* CSID1 */
+	{
+		.regulators = { "vdda" },
+		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
+			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 310000000,
+				  400000000, 465000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_4_7
+		}
+	},
+
+	/* CSID2 */
+	{
+		.regulators = { "vdda" },
+		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
+			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 310000000,
+				  400000000, 465000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_4_7
+		}
+	},
+};
+
+static const struct camss_subdev_resources ispif_res_8x53 = {
+	/* ISPIF */
+	.clock = { "top_ahb", "ahb", "ispif_ahb",
+		   "csi0", "csi0_pix", "csi0_rdi",
+		   "csi1", "csi1_pix", "csi1_rdi",
+		   "csi2", "csi2_pix", "csi2_rdi" },
+	.clock_for_reset = { "vfe0", "csi_vfe0", "vfe1", "csi_vfe1" },
+	.reg = { "ispif", "csi_clk_mux" },
+	.interrupt = { "ispif" },
+};
+
+static const struct camss_subdev_resources vfe_res_8x53[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "ispif_ahb",
+			   "vfe0", "csi_vfe0", "vfe0_ahb", "vfe0_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 50000000, 100000000, 133330000,
+				  160000000, 200000000, 266670000,
+				  310000000, 400000000, 465000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "vfe0",
+			.hw_ops = &vfe_ops_4_1,
+			.formats_rdi = &vfe_formats_rdi_8x16,
+			.formats_pix = &vfe_formats_pix_8x16
+		}
+	},
+
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "ispif_ahb",
+			   "vfe1", "csi_vfe1", "vfe1_ahb", "vfe1_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 50000000, 100000000, 133330000,
+				  160000000, 200000000, 266670000,
+				  310000000, 400000000, 465000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "vfe1",
+			.hw_ops = &vfe_ops_4_1,
+			.formats_rdi = &vfe_formats_rdi_8x16,
+			.formats_pix = &vfe_formats_pix_8x16
+		}
+	}
+};
+
+static const struct resources_icc icc_res_8x53[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "cam_vfe0_mem",
+		.icc_bw_tbl.avg = 939524,
+		.icc_bw_tbl.peak = 1342177,
+	},
+	{
+		.name = "cam_vfe1_mem",
+		.icc_bw_tbl.avg = 939524,
+		.icc_bw_tbl.peak = 1342177,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x96[] = {
 	/* CSIPHY0 */
 	{
@@ -2248,6 +2402,7 @@ static int camss_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (camss->res->version == CAMSS_8x16 ||
+	    camss->res->version == CAMSS_8x53 ||
 	    camss->res->version == CAMSS_8x96) {
 		camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
 		if (!camss->ispif)
@@ -2389,6 +2544,20 @@ static const struct camss_resources msm8916_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources msm8953_resources = {
+	.version = CAMSS_8x53,
+	.icc_res = icc_res_8x53,
+	.icc_path_num = ARRAY_SIZE(icc_res_8x53),
+	.csiphy_res = csiphy_res_8x96,
+	.csid_res = csid_res_8x53,
+	.ispif_res = &ispif_res_8x53,
+	.vfe_res = vfe_res_8x53,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
+	.csid_num = ARRAY_SIZE(csid_res_8x53),
+	.vfe_num = ARRAY_SIZE(vfe_res_8x53),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources msm8996_resources = {
 	.version = CAMSS_8x96,
 	.csiphy_res = csiphy_res_8x96,
@@ -2455,6 +2624,7 @@ static const struct camss_resources sc8280xp_resources = {
 
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
+	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 0ce84fcbbd25c7825212beb74073ffd4c70858a8..9da7f48f5dd762d27521d449051892e956693970 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -78,6 +78,7 @@ enum pm_domain {
 
 enum camss_version {
 	CAMSS_8x16,
+	CAMSS_8x53,
 	CAMSS_8x96,
 	CAMSS_660,
 	CAMSS_845,

-- 
2.47.0


