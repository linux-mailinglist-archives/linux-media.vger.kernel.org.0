Return-Path: <linux-media+bounces-36176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D9DAECE20
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A7D1897660
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE00235355;
	Sun, 29 Jun 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MScF0DyW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A0E230BEC;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208574; cv=none; b=BKNZ1Oc3tAGDK7kiFucJp1mZ5WGAmkVjzeyF9CsRhgPoaql1OuKq6ZjSBsoNT5cpoHCVhZedTYpZMKjTS6boIlJSjuJA+msZ0GsVt+hKG8W9e6Tq0ySfjkBCwj9UuSyL1unS3UOMLDSgnLIMoIFffg8GJJfzEsX2xHe+2K3aePw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208574; c=relaxed/simple;
	bh=HHCFQ4JI/dUulP883wPzwncQHxThZP/jrEtubFf6z3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jo8iRInbNbIr1+QCSz5CuRiWJj/larZATMz7FV9ODdlp4jvOj3MqlHOwqN+hUK758tVoDadd2gCMyWC7vJ3cc1Pp892v/fpSMCdu04hhW1eIyJoW/m864+uvCIIhOttd8F1WMpejQ4KkBi5YXqRrs2Rya3nYBm3Spe5BrO1uipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MScF0DyW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 526C2C4AF0B;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751208574;
	bh=HHCFQ4JI/dUulP883wPzwncQHxThZP/jrEtubFf6z3M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MScF0DyW8mwTzrP8DyhEzsgpli+Rxj4alvh1WAblPEfJR6MnkoI+is2SevlyM9Q+t
	 zeToocYTpeGgXKNup51Qs4BX6TKn+kTA64bIajVOXLH3n2QIZVdui6wFRO54vwUnB4
	 VdB7wLhQ/dwTkGLsHvUlhpCkHpugeQc054N0IXRjATbZiAzQaUW/Wh3n2Lvk9wVjtD
	 ioD8uWu/AkWMD/pAis2NeDYHpbGlomsqTMbLzIAXjKSDASrdeLpOhSeQeOvTsxX+L6
	 3DLB4eVyMUlcwASWhPgI0MzhBE0exp/Q8NtDJQrXvTj8RNWK83wJ5OH3hmIz4dEd31
	 Ca9sy37U/4qGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A28C8302A;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 29 Jun 2025 16:49:23 +0200
Subject: [PATCH 4/5] media: i2c: imx214: Move imx214_pll_update to
 imx214_ctrls_init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-imx214_fixes-v1-4-873eb94ad635@apitzsch.eu>
References: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
In-Reply-To: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751208572; l=8585;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=cy61DJ492FUgh7r4yJhsLHazreE9rqb3+/kYIW0bfHk=;
 b=GMhccfovyMTdJz7g8QRAmWNd/MnHvPJ0fnoLOiPMcBdqefCjUDcJHEygyxZCZXIWb0AjdnWl4
 +vTs5ZU0QjQBLXtEpHV8bcIoscNy0SY/O5Z468k0iF4hhkv2m94a91V
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

It is more logical to call the PLL update in imx214_ctrls_init(). So
let's move it there.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 219 +++++++++++++++++++++++----------------------
 1 file changed, 110 insertions(+), 109 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index b84197ee5177d609b1395e14e1404ffa5b9a6dbf..63cf30acdc241de2f9ab3db339590da4af3d5102 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -881,6 +881,109 @@ static const struct v4l2_ctrl_ops imx214_ctrl_ops = {
 	.s_ctrl = imx214_set_ctrl,
 };
 
+static int imx214_pll_calculate(struct imx214 *imx214, struct ccs_pll *pll,
+				unsigned int link_freq)
+{
+	struct ccs_pll_limits limits = {
+		.min_ext_clk_freq_hz = 6000000,
+		.max_ext_clk_freq_hz = 27000000,
+
+		.vt_fr = {
+			.min_pre_pll_clk_div = 1,
+			.max_pre_pll_clk_div = 15,
+			/* Value is educated guess as we don't have a spec */
+			.min_pll_ip_clk_freq_hz = 6000000,
+			/* Value is educated guess as we don't have a spec */
+			.max_pll_ip_clk_freq_hz = 12000000,
+			.min_pll_multiplier = 12,
+			.max_pll_multiplier = 1200,
+			.min_pll_op_clk_freq_hz = 338000000,
+			.max_pll_op_clk_freq_hz = 1200000000,
+		},
+		.vt_bk = {
+			.min_sys_clk_div = 2,
+			.max_sys_clk_div = 4,
+			.min_pix_clk_div = 5,
+			.max_pix_clk_div = 10,
+			.min_pix_clk_freq_hz = 30000000,
+			.max_pix_clk_freq_hz = 120000000,
+		},
+		.op_bk = {
+			.min_sys_clk_div = 1,
+			.max_sys_clk_div = 2,
+			.min_pix_clk_div = 6,
+			.max_pix_clk_div = 10,
+			.min_pix_clk_freq_hz = 30000000,
+			.max_pix_clk_freq_hz = 120000000,
+		},
+
+		.min_line_length_pck_bin = IMX214_PPL_DEFAULT,
+		.min_line_length_pck = IMX214_PPL_DEFAULT,
+	};
+	unsigned int num_lanes = imx214->bus_cfg.bus.mipi_csi2.num_data_lanes;
+
+	/*
+	 * There are no documented constraints on the sys clock frequency, for
+	 * either branch. Recover them based on the PLL output clock frequency
+	 * and sys_clk_div limits on one hand, and the pix clock frequency and
+	 * the pix_clk_div limits on the other hand.
+	 */
+	limits.vt_bk.min_sys_clk_freq_hz =
+		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.vt_bk.max_sys_clk_div,
+		    limits.vt_bk.min_pix_clk_freq_hz * limits.vt_bk.min_pix_clk_div);
+	limits.vt_bk.max_sys_clk_freq_hz =
+		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.vt_bk.min_sys_clk_div,
+		    limits.vt_bk.max_pix_clk_freq_hz * limits.vt_bk.max_pix_clk_div);
+
+	limits.op_bk.min_sys_clk_freq_hz =
+		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.op_bk.max_sys_clk_div,
+		    limits.op_bk.min_pix_clk_freq_hz * limits.op_bk.min_pix_clk_div);
+	limits.op_bk.max_sys_clk_freq_hz =
+		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.op_bk.min_sys_clk_div,
+		    limits.op_bk.max_pix_clk_freq_hz * limits.op_bk.max_pix_clk_div);
+
+	memset(pll, 0, sizeof(*pll));
+
+	pll->bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
+	pll->op_lanes = num_lanes;
+	pll->vt_lanes = num_lanes;
+	pll->csi2.lanes = num_lanes;
+
+	pll->binning_horizontal = 1;
+	pll->binning_vertical = 1;
+	pll->scale_m = 1;
+	pll->scale_n = 1;
+	pll->bits_per_pixel =
+		IMX214_CSI_DATA_FORMAT_RAW10 & IMX214_BITS_PER_PIXEL_MASK;
+	pll->flags = CCS_PLL_FLAG_LANE_SPEED_MODEL;
+	pll->link_freq = link_freq;
+	pll->ext_clk_freq_hz = clk_get_rate(imx214->xclk);
+
+	return ccs_pll_calculate(imx214->dev, &limits, pll);
+}
+
+static int imx214_pll_update(struct imx214 *imx214)
+{
+	u64 link_freq;
+	int ret;
+
+	link_freq = imx214->bus_cfg.link_frequencies[imx214->link_freq->val];
+	ret = imx214_pll_calculate(imx214, &imx214->pll, link_freq);
+	if (ret) {
+		dev_err(imx214->dev, "PLL calculations failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_ctrl_s_ctrl_int64(imx214->pixel_rate,
+				     imx214->pll.pixel_rate_pixel_array);
+	if (ret) {
+		dev_err(imx214->dev, "failed to set pixel rate\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx214_ctrls_init(struct imx214 *imx214)
 {
 	static const struct v4l2_area unit_size = {
@@ -1003,6 +1106,13 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		return ret;
 	}
 
+	ret = imx214_pll_update(imx214);
+	if (ret < 0) {
+		v4l2_ctrl_handler_free(ctrl_hdlr);
+		dev_err(imx214->dev, "failed to update PLL\n");
+		return ret;
+	}
+
 	imx214->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
@@ -1115,109 +1225,6 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 	return ret;
 }
 
-static int imx214_pll_calculate(struct imx214 *imx214, struct ccs_pll *pll,
-				unsigned int link_freq)
-{
-	struct ccs_pll_limits limits = {
-		.min_ext_clk_freq_hz = 6000000,
-		.max_ext_clk_freq_hz = 27000000,
-
-		.vt_fr = {
-			.min_pre_pll_clk_div = 1,
-			.max_pre_pll_clk_div = 15,
-			/* Value is educated guess as we don't have a spec */
-			.min_pll_ip_clk_freq_hz = 6000000,
-			/* Value is educated guess as we don't have a spec */
-			.max_pll_ip_clk_freq_hz = 12000000,
-			.min_pll_multiplier = 12,
-			.max_pll_multiplier = 1200,
-			.min_pll_op_clk_freq_hz = 338000000,
-			.max_pll_op_clk_freq_hz = 1200000000,
-		},
-		.vt_bk = {
-			.min_sys_clk_div = 2,
-			.max_sys_clk_div = 4,
-			.min_pix_clk_div = 5,
-			.max_pix_clk_div = 10,
-			.min_pix_clk_freq_hz = 30000000,
-			.max_pix_clk_freq_hz = 120000000,
-		},
-		.op_bk = {
-			.min_sys_clk_div = 1,
-			.max_sys_clk_div = 2,
-			.min_pix_clk_div = 6,
-			.max_pix_clk_div = 10,
-			.min_pix_clk_freq_hz = 30000000,
-			.max_pix_clk_freq_hz = 120000000,
-		},
-
-		.min_line_length_pck_bin = IMX214_PPL_DEFAULT,
-		.min_line_length_pck = IMX214_PPL_DEFAULT,
-	};
-	unsigned int num_lanes = imx214->bus_cfg.bus.mipi_csi2.num_data_lanes;
-
-	/*
-	 * There are no documented constraints on the sys clock frequency, for
-	 * either branch. Recover them based on the PLL output clock frequency
-	 * and sys_clk_div limits on one hand, and the pix clock frequency and
-	 * the pix_clk_div limits on the other hand.
-	 */
-	limits.vt_bk.min_sys_clk_freq_hz =
-		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.vt_bk.max_sys_clk_div,
-		    limits.vt_bk.min_pix_clk_freq_hz * limits.vt_bk.min_pix_clk_div);
-	limits.vt_bk.max_sys_clk_freq_hz =
-		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.vt_bk.min_sys_clk_div,
-		    limits.vt_bk.max_pix_clk_freq_hz * limits.vt_bk.max_pix_clk_div);
-
-	limits.op_bk.min_sys_clk_freq_hz =
-		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.op_bk.max_sys_clk_div,
-		    limits.op_bk.min_pix_clk_freq_hz * limits.op_bk.min_pix_clk_div);
-	limits.op_bk.max_sys_clk_freq_hz =
-		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.op_bk.min_sys_clk_div,
-		    limits.op_bk.max_pix_clk_freq_hz * limits.op_bk.max_pix_clk_div);
-
-	memset(pll, 0, sizeof(*pll));
-
-	pll->bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
-	pll->op_lanes = num_lanes;
-	pll->vt_lanes = num_lanes;
-	pll->csi2.lanes = num_lanes;
-
-	pll->binning_horizontal = 1;
-	pll->binning_vertical = 1;
-	pll->scale_m = 1;
-	pll->scale_n = 1;
-	pll->bits_per_pixel =
-		IMX214_CSI_DATA_FORMAT_RAW10 & IMX214_BITS_PER_PIXEL_MASK;
-	pll->flags = CCS_PLL_FLAG_LANE_SPEED_MODEL;
-	pll->link_freq = link_freq;
-	pll->ext_clk_freq_hz = clk_get_rate(imx214->xclk);
-
-	return ccs_pll_calculate(imx214->dev, &limits, pll);
-}
-
-static int imx214_pll_update(struct imx214 *imx214)
-{
-	u64 link_freq;
-	int ret;
-
-	link_freq = imx214->bus_cfg.link_frequencies[imx214->link_freq->val];
-	ret = imx214_pll_calculate(imx214, &imx214->pll, link_freq);
-	if (ret) {
-		dev_err(imx214->dev, "PLL calculations failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = v4l2_ctrl_s_ctrl_int64(imx214->pixel_rate,
-				     imx214->pll.pixel_rate_pixel_array);
-	if (ret) {
-		dev_err(imx214->dev, "failed to set pixel rate\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int imx214_get_frame_interval(struct v4l2_subdev *subdev,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *fival)
@@ -1457,12 +1464,6 @@ static int imx214_probe(struct i2c_client *client)
 	pm_runtime_set_active(imx214->dev);
 	pm_runtime_enable(imx214->dev);
 
-	ret = imx214_pll_update(imx214);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to update PLL\n");
-		goto error_subdev_cleanup;
-	}
-
 	ret = v4l2_async_register_subdev_sensor(&imx214->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret,

-- 
2.50.0



