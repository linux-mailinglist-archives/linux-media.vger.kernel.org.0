Return-Path: <linux-media+bounces-41937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5473B480A5
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 00:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1C2E17F81E
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 22:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78B329C321;
	Sun,  7 Sep 2025 22:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqSjnq4+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B8D12D1F1;
	Sun,  7 Sep 2025 22:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757282676; cv=none; b=Gf2A/2o9usIcogy0W4yifIfVRCXUijLYV9jJr/KI2gJjYsBOkLXCUrVwr0tc+ppFneO2E6C0XfrRAUNJRzgBm6T88Rcx63/PETOq6wkM7KRiHGQeKgXvqiLlqMAEtQzahF8ugh6AvZq+nPEsiccwfQy3rg9mLB4pVTPAMgAnm3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757282676; c=relaxed/simple;
	bh=uDz0rDXPAk2921+YmQuTHPra4gt8i+wvHbzFfIgPPio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B42nobXOrNfBho3Ktx0ACWX51UA2xVvlP11fXei5hbeOlszgOf0gt4tN3NGua2tdxtwbYfrUDOzAnmSx/cRb9GBX6477Lf7+5i3Hh5FNJD9BujZAcWzaxDmgi0PiVOQmMydALhyjv0JdBDgEBmOXwY3IKWvuP6cs1vUV2OAeoaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqSjnq4+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CA22C4CEFC;
	Sun,  7 Sep 2025 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757282675;
	bh=uDz0rDXPAk2921+YmQuTHPra4gt8i+wvHbzFfIgPPio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bqSjnq4+dTsqLVLA/r6A40X4zLvhE7UyuEZgjyZ7MhkOR6Xf6luQ9Gm8LMt2Zf2PQ
	 5W5tKehDxDx9y10HjVj6RlFtYk8+OvdYiSJWKi/9/Wj//OEaFflvwdb0ujvIMPo8pN
	 XXO0TmLNv9/T66420MLkl9f5C93XtF/czLNgvdWeo0ySxt1BtPiepT2k5Q+wQTkDGm
	 VbwDjgvCoUl7j1MHuoVvkQad2UnQ2oyn+RfoupKZS700UiLOrrZT7UjmcC4NR1uDIB
	 ELsS2pMRILahJXlvzr3eNshsIa53kDuFCiURBZBSsyc+JbmdZzzomaX3dh8s1OemyQ
	 YNy2+PzzS4aOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC96CAC585;
	Sun,  7 Sep 2025 22:04:35 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 08 Sep 2025 00:04:17 +0200
Subject: [PATCH 3/4] media: qcom: camss: Add support for MSM8939
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250908-camss-8x39-vbif-v1-3-f198c9fd0d4d@apitzsch.eu>
References: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
In-Reply-To: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757282673; l=10672;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=RmtNzejBuhn19lSLlxQiZ/BLhciw1DlZaXAlz6G/V2Y=;
 b=ppCqpGccge6DUA5YVNbk40bsVaeitSKQ1YFe+nUoXxGgO9Aikct9dZBCTT/GyNOoG49zLdGAs
 /QpswgpUs50BTxOYCz2qnw2C7Xi/I/cyk4ePi7gzXeRcBrIDKaU6pXa
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
index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..a734fb7dde0a492cf6e33f53e379557665d54f64 100644
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
index 2dc585c6123dd248a5bacd9c7a88cb5375644311..aaf3caa42d33dcb641651e7f5bc0c2a564d85bfa 100644
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
index 691335f231a6001e6c535431a18b2e21ddc832c9..911f8da02f1fbb500ab9564978e2b0dddf93e84e 100644
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
index ac8e5e9471a426bec5d989abd5e082f5fa027364..3ad7f2296c504cdedcd9a0c1b418d543fa413381 100644
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
index e08e70b93824baa5714b3a736bc1d05405253aaa..68a48e625d900dc64ea0764a3a000b6187c94ab3 100644
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
@@ -3581,6 +3724,7 @@ static int camss_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (camss->res->version == CAMSS_8x16 ||
+	    camss->res->version == CAMSS_8x39 ||
 	    camss->res->version == CAMSS_8x53 ||
 	    camss->res->version == CAMSS_8x96) {
 		camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
@@ -3726,6 +3870,18 @@ static const struct camss_resources msm8916_resources = {
 	.link_entities = camss_link_entities
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
@@ -3862,6 +4018,7 @@ static const struct camss_resources x1e80100_resources = {
 
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
+	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a02194820016ccf554620d6521c8b..be11cf3af478627fa48827e70d5f0673939e1e63 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -80,6 +80,7 @@ enum camss_version {
 	CAMSS_660,
 	CAMSS_7280,
 	CAMSS_8x16,
+	CAMSS_8x39,
 	CAMSS_8x53,
 	CAMSS_8x96,
 	CAMSS_8250,

-- 
2.51.0



