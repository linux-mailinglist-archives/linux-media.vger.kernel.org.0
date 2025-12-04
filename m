Return-Path: <linux-media+bounces-48242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B145CA486D
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 17:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 107293026BEE
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 16:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0823002B9;
	Thu,  4 Dec 2025 16:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROBf9lFo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F92FBDE2;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865968; cv=none; b=C/6aZn+iutr+CPIWscOtNiou/tMeMeoVc5EVbz2nLvJ22p4Ghuoz/ya7XzEDzYUqvUZfbwkboa0U7soz+8vJyKnU+vPZwjLdCNverEI9Ujc40IwgsBWMiIImwMqbNe88Cw5BliGEdFvIcPBnCq3We/rWXgvGmf/N8+rqX0JwDaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865968; c=relaxed/simple;
	bh=Lzd+d6ieW5CartjptTmOhf3AJteTtZmGLAkDwoaVU0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5hUGfbyX+IOLm210ucnv4NvdEqiDDUERhkP0iwK4U5/saBahOOUFOiSDN81Dt85ZyB7iSg99i4zpEqqVet9ShbEuVeGbtkpBZhAWhXRoa0Igcz1Cl057V/8Wknm7WnSgtomqZLwVYhCPLMmZcNIHJVyD171MKeAdQZFtlZ6bc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROBf9lFo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 887EAC19423;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764865967;
	bh=Lzd+d6ieW5CartjptTmOhf3AJteTtZmGLAkDwoaVU0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ROBf9lFoPcawAKsxMzsTVMIHfKh4Tg86EKtBSlXIKlY6rfvc6jl3CYkuj7zaCyXbc
	 QML2HJlI7E8DSyuRWDWPBYlYVBwmK3MB2dGxQowEr/1oTOybQc7IvM7FXLmoVY3xkf
	 HnpZpi6C+StWeA5BDhQMtGPgXvtxB9QqCM7dmhxh1sQwBQFyITKH/JCOPRWTPF/Ibw
	 6K6gSnpWKiTRPdr2ody4gow1K5TFjo0R6oeKJdnNvAQPBOwGkbvVBdorsxzTvE5BrV
	 SbCPfkN2tzXsiwN3JmfBWnkWedDODiU5zk/y5ldowDxGtnxVu7eX2BjsxulAtD6Y5j
	 RYI4kBmCkh24Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F31DD216AE;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 04 Dec 2025 17:32:42 +0100
Subject: [PATCH WIP v2 8/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcom-cphy-v2-8-6b35ef8b071e@ixit.cz>
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
In-Reply-To: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5230; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=b1nclvoHacIkz7OV2Q02X6ymuveqnuBFG4Fw6qspG18=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMbetO8v9IP/fCl+iBxVyeBnOtgKMpCe6yBF3S
 wFhmEpWu5qJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTG3rQAKCRBgAj/E00kg
 cl+9EACfXP/Tbp6aGoowpOVft73F4HARvALH0Cr4oFK3BECz02pgSBIq1Huv9OWvV9xwd8jDNv7
 8Ofzv2dqg1MNzlc+B24wGsh9gBCvexmRtC/MARlAcS9gzNd8dDk+S6fOU2gO7IRklOisRIyDGMu
 hkSIZlJnvKlXW/vi25ndaI5VY9hrg18OXGWDtosCn4pNYfIWaax+iUxndE9GNGrm7gIxQiYdC+R
 4Y/vgVX7VtfrR4PF6ZR25DsE381R0/n5fJt2tXTuoBxaBhKufAbbwn7v2SuVVH3VejZheCr8jOh
 fQbh+YTeDED8Z6jPSNggCmHbYFhWWsDX1n5FgFIhQINEbyJ80k/Ihp5Qg0U5S0efOFxnnsvnsP8
 mSkBCrCgGtpKyJ7Vz0fNsY+rCpyGGq8EW9fkQztzQYy7BDosIvuNzrDG1BNFHDEwC0uN12rl3hg
 Afe9lHXD4qZEPaGBhWrLkHBJx5uIOprgnt75vETEkJGtxGpv+/RPf1RI8Ja/M7w6HfR81MvBW+r
 SJxOKZAxyPx59BUXNVZ2mKGwiE7+OiQbiFcNmlmnlMOEEgbmVOfgiwdq6PtkO3KukqySNsDWdab
 5iLrT5waOzglhzAajmBQolnj4Amwna9w9Bo3gmCKuvM4vvWEKFGzuAyc1GDV3eLSVGqnBH0Pzlb
 3s9/bzkunvFTUrw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Ensure that the link frequency divider correctly accounts for C-PHY
operation. The divider differs between D-PHY and C-PHY, as described
in the MIPI CSI-2 specification.

For more details, see:
https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid.c   |  2 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++++--
 drivers/media/platform/qcom/camss/camss.c        | 16 +++++++++++++---
 drivers/media/platform/qcom/camss/camss.h        |  2 +-
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index d9026fd829d61..437f51dc86f9f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -545,7 +545,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
 	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
 				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
 	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
-					csid->phy.lane_cnt);
+					csid->phy.lane_cnt, csid->phy.cphy);
 	if (link_freq < 0)
 		link_freq = 0;
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index a734fb7dde0a4..bac3a9fa3be50 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -144,8 +144,9 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+	bool cphy = csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
 	if (link_freq < 0)
 		link_freq  = 0;
 
@@ -270,9 +271,10 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+	bool cphy = csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY;
 	u8 val;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
 
 	if (link_freq < 0) {
 		dev_err(csiphy->camss->dev,
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 414646760ae6b..6333f5dd73b53 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -32,6 +32,14 @@
 #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
 #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
 
+/*
+ * C-PHY encodes data by 16/7 ~ 2.28 bits/symbol
+ * D-PHY doesn't encode data, thus 16/16 = 1 b/s
+ */
+#define CAMSS_COMMON_PHY_DIVIDENT 16
+#define CAMSS_CPHY_DIVISOR 7
+#define CAMSS_DPHY_DIVISOR 16
+
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
@@ -3912,20 +3920,22 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
  * camss_get_link_freq - Get link frequency from sensor
  * @entity: Media entity in the current pipeline
  * @bpp: Number of bits per pixel for the current format
- * @lanes: Number of lanes in the link to the sensor
+ * @nr_of_lanes: Number of lanes in the link to the sensor
  *
  * Return link frequency on success or a negative error code otherwise
  */
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes)
+			unsigned int nr_of_lanes, bool cphy)
 {
 	struct media_pad *sensor_pad;
+	unsigned int div = nr_of_lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
+						     CAMSS_DPHY_DIVISOR);
 
 	sensor_pad = camss_find_sensor_pad(entity);
 	if (!sensor_pad)
 		return -ENODEV;
 
-	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
+	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, div);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9d9a62640e25d..0ab908b0c037f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -162,7 +162,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes);
+			unsigned int lanes, bool cphy);
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);

-- 
2.51.0



