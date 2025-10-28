Return-Path: <linux-media+bounces-45883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA95C170E2
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 22:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F305189A14F
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 21:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0462E7631;
	Tue, 28 Oct 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7GrOnc+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6528E2E3365;
	Tue, 28 Oct 2025 21:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761687134; cv=none; b=JgoWJ0KvG5eHt1gs0qiSQ12mKUBIkD95A0UPiCMTOdhmJkZ8RJwBz9TQ3H9yqKVvMVavMnzyHdqT0+2md7FdM4areUwrJwh5pbC4/+xxAJ2tcnWXu/b8hEy/LIPW3XbyuIiNU/wTX99PFemWMarLVN+diy/dtSepZ0eqR+D0dns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761687134; c=relaxed/simple;
	bh=QjOeJkN/SAw7dQA1CKQNPOICgKedm7UuGwp9AjDTw14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4YtVJTp6wok+2IpJNYos5demlmKzPGLzpYmCgPrWQMOvzVpfPnDCzNgxShN/H8zb1O1pjD+N9SRTTziEvRm0CjkXcMXQihFRZTsNglQ+7T67XFsx9yFU66wZAqWELBPxh6qzzi8oF8lHs+7CfIbo5RRIqOSLTfb5tiMS0Gclb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7GrOnc+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F137C16AAE;
	Tue, 28 Oct 2025 21:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761687134;
	bh=QjOeJkN/SAw7dQA1CKQNPOICgKedm7UuGwp9AjDTw14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c7GrOnc+cGhgGDPg2m2R2eiqWjPcClF6exXtDKqvyBfg2oK379v/60Y35omqEh6+J
	 d3Zkh08+ECZoksX+ebWmvNSAdBbMlCw7n07XVm2uy0B3RJDCfl2ORRrvi3ckOgEt/W
	 jgi8a7Rx87rLyvxMVEo/BCAWzEPLMxJ8J1hNFYEsjBgnhLadGbHs7skYEtW9qJr6YZ
	 HXxLAe91pbgMFs9ucRAOGIKz/Uw0AXl699SCzLx0UUfGnZY5g3v9LFQbc3S5YbQ7cu
	 q1mYybf4dHxoOAx73ErhcR8Dixih6ePzQDYEGMu59XlgMXXlNEtefU2KhBgMncibaj
	 JFYpk+QWGBWMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04399CCD1BF;
	Tue, 28 Oct 2025 21:32:14 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 28 Oct 2025 22:30:44 +0100
Subject: [PATCH v7 3/4] media: qcom: camss: Add support for MSM8939
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251028-camss-8x39-vbif-v7-3-91ee8becda85@apitzsch.eu>
References: <20251028-camss-8x39-vbif-v7-0-91ee8becda85@apitzsch.eu>
In-Reply-To: <20251028-camss-8x39-vbif-v7-0-91ee8becda85@apitzsch.eu>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761687132; l=10339;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=9THAeZ6cIes2MlpyedCBTpQO/izscaKV7CFtPZ4lPHQ=;
 b=64lENdnpBf3JdnRkGM3p70rqhjv5ohEHYJOtrIDydgJh1budOp+Oz1pp6vZF0RQXV+lTZQFWn
 wi9ZSfl0GcRAbXvkKH088vrJXADxAuZNqJXA7R20oqDQGAwfMmU7agC
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Vincent Knecht <vincent.knecht@mailoo.org>

The camera subsystem for the MSM8939 is the same as MSM8916 except with
3 CSID instead of 2, and some higher clock rates.

As a quirk, this SoC needs writing values to 2 VFE VBIF registers
(see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
This fixes black stripes across sensor and garbage in CSID TPG outputs.

Add support for the MSM8939 camera subsystem.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe-vbif.c |   6 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 157 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 172 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2de97f58f9ae..a734fb7dde0a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -600,6 +600,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		return PTR_ERR(csiphy->base);
 
 	if (camss->res->version == CAMSS_8x16 ||
+	    camss->res->version == CAMSS_8x39 ||
 	    camss->res->version == CAMSS_8x53 ||
 	    camss->res->version == CAMSS_8x96) {
 		csiphy->base_clk_mux =
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index 2dc585c6123d..aaf3caa42d33 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -1112,6 +1112,8 @@ int msm_ispif_subdev_init(struct camss *camss,
 	/* Number of ISPIF lines - same as number of CSID hardware modules */
 	if (camss->res->version == CAMSS_8x16)
 		ispif->line_num = 2;
+	else if (camss->res->version == CAMSS_8x39)
+		ispif->line_num = 3;
 	else if (camss->res->version == CAMSS_8x96 ||
 		 camss->res->version == CAMSS_8x53 ||
 		 camss->res->version == CAMSS_660)
@@ -1128,7 +1130,8 @@ int msm_ispif_subdev_init(struct camss *camss,
 		ispif->line[i].ispif = ispif;
 		ispif->line[i].id = i;
 
-		if (camss->res->version == CAMSS_8x16) {
+		if (camss->res->version == CAMSS_8x16 ||
+		    camss->res->version == CAMSS_8x39) {
 			ispif->line[i].formats = ispif_formats_8x16;
 			ispif->line[i].nformats =
 					ARRAY_SIZE(ispif_formats_8x16);
@@ -1162,7 +1165,8 @@ int msm_ispif_subdev_init(struct camss *camss,
 	ispif->irq = ret;
 	snprintf(ispif->irq_name, sizeof(ispif->irq_name), "%s_%s",
 		 dev_name(dev), MSM_ISPIF_NAME);
-	if (camss->res->version == CAMSS_8x16)
+	if (camss->res->version == CAMSS_8x16 ||
+	    camss->res->version == CAMSS_8x39)
 		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x16,
 			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
 	else if (camss->res->version == CAMSS_8x96 ||
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-vbif.c b/drivers/media/platform/qcom/camss/camss-vfe-vbif.c
index 691335f231a6..911f8da02f1f 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-vbif.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-vbif.c
@@ -14,6 +14,9 @@
 #include "camss-vfe.h"
 #include "camss-vfe-vbif.h"
 
+#define VBIF_FIXED_SORT_EN	0x30
+#define VBIF_FIXED_SORT_SEL0	0x34
+
 void vfe_vbif_write_reg(struct vfe_device *vfe, u32 reg, u32 val)
 {
 	writel_relaxed(val, vfe->vbif_base + reg);
@@ -21,5 +24,8 @@ void vfe_vbif_write_reg(struct vfe_device *vfe, u32 reg, u32 val)
 
 int vfe_vbif_apply_settings(struct vfe_device *vfe)
 {
+	vfe_vbif_write_reg(vfe, VBIF_FIXED_SORT_EN, 0xfff);
+	vfe_vbif_write_reg(vfe, VBIF_FIXED_SORT_SEL0, 0x555000);
+
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 6e28b672b1fa..c013e914a9ee 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -290,6 +290,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 
 	switch (vfe->camss->res->version) {
 	case CAMSS_8x16:
+	case CAMSS_8x39:
 	case CAMSS_8x53:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..cfd0ed3a75ce 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -154,6 +154,149 @@ static const struct camss_subdev_resources vfe_res_8x16[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_8x39[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda" },
+		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
+		.clock_rate = { { 0 },
+				{ 40000000, 80000000 },
+				{ 0 },
+				{ 100000000, 200000000 } },
+		.reg = { "csiphy0", "csiphy0_clk_mux" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_2ph_1_0,
+			.formats = &csiphy_formats_8x16
+		}
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdda" },
+		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer" },
+		.clock_rate = { { 0 },
+				{ 40000000, 80000000 },
+				{ 0 },
+				{ 100000000, 200000000 } },
+		.reg = { "csiphy1", "csiphy1_clk_mux" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_2ph_1_0,
+			.formats = &csiphy_formats_8x16
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_8x39[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
+			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
+		.clock_rate = { { 0 },
+				{ 40000000, 80000000 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_4_1,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_4_1
+		}
+	},
+
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
+			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
+		.clock_rate = { { 0 },
+				{ 40000000, 80000000 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_4_1,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_4_1
+		}
+	},
+
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
+			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
+		.clock_rate = { { 0 },
+				{ 40000000, 80000000 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_4_1,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_4_1
+		}
+	},
+};
+
+static const struct camss_subdev_resources ispif_res_8x39 = {
+	/* ISPIF */
+	.clock = { "top_ahb", "ispif_ahb", "ahb",
+		   "csi0", "csi0_pix", "csi0_rdi",
+		   "csi1", "csi1_pix", "csi1_rdi",
+		   "csi2", "csi2_pix", "csi2_rdi" },
+	.clock_for_reset = { "vfe0", "csi_vfe0" },
+	.reg = { "ispif", "csi_clk_mux" },
+	.interrupt = { "ispif" },
+};
+
+static const struct camss_subdev_resources vfe_res_8x39[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ispif_ahb", "vfe0", "csi_vfe0",
+			   "vfe_ahb", "vfe_axi", "ahb" },
+		.clock_rate = { { 0 },
+				{ 40000000, 80000000 },
+				{ 50000000, 80000000, 100000000, 160000000,
+				  177780000, 200000000, 266670000, 320000000,
+				  400000000, 465000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.has_vbif = true,
+			.vbif_name = "vfe0_vbif",
+			.hw_ops = &vfe_ops_4_1,
+			.formats_rdi = &vfe_formats_rdi_8x16,
+			.formats_pix = &vfe_formats_pix_8x16
+		}
+	}
+};
+
 static const struct camss_subdev_resources csid_res_8x53[] = {
 	/* CSID0 */
 	{
@@ -4171,6 +4314,7 @@ static int camss_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (camss->res->version == CAMSS_8x16 ||
+	    camss->res->version == CAMSS_8x39 ||
 	    camss->res->version == CAMSS_8x53 ||
 	    camss->res->version == CAMSS_8x96) {
 		camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
@@ -4302,6 +4446,18 @@ static const struct camss_resources msm8916_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_8x16),
 };
 
+static const struct camss_resources msm8939_resources = {
+	.version = CAMSS_8x39,
+	.csiphy_res = csiphy_res_8x39,
+	.csid_res = csid_res_8x39,
+	.ispif_res = &ispif_res_8x39,
+	.vfe_res = vfe_res_8x39,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8x39),
+	.csid_num = ARRAY_SIZE(csid_res_8x39),
+	.vfe_num = ARRAY_SIZE(vfe_res_8x39),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources msm8953_resources = {
 	.version = CAMSS_8x53,
 	.icc_res = icc_res_8x53,
@@ -4468,6 +4624,7 @@ static const struct camss_resources x1e80100_resources = {
 
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
+	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,qcm2290-camss", .data = &qcm2290_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a70fbc78ccc3..cc1a226b6791 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -81,6 +81,7 @@ enum camss_version {
 	CAMSS_2290,
 	CAMSS_7280,
 	CAMSS_8x16,
+	CAMSS_8x39,
 	CAMSS_8x53,
 	CAMSS_8x96,
 	CAMSS_8250,

-- 
2.51.2



