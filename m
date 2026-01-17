Return-Path: <linux-media+bounces-50956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3ED38F7E
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 16:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74AD4302D89D
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 15:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90193265CA8;
	Sat, 17 Jan 2026 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONwMfAek"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FAA238166;
	Sat, 17 Jan 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664182; cv=none; b=Tfe/+mOjaWltTbPCg1NpR5gwSsMROV62Dq094VTT6/6ZAsDJVG+TsEX1CjQQ+yK/FRMtgCIgKj9VFOyUPKa01Ay6tQZB+nD/cisaeLYU5ovVxgs7acZzu/Z0yDvTa60Ec/VT1yvmbe5yIx9e7430xaLJdBTLF2Wb9fau93AP49U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664182; c=relaxed/simple;
	bh=/BD78YXzOCcRS25O+L1zfxJJpZZr21mrmcTDTYb9IGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhlLXriQEijSmYh1cvkGT9OqGgqNVKmc0/ORusgnRhcwPk5+G1pBtxSEFUxYDUpHYxahOUrQqujnHvk2mqlWGMEC9bhd5YCAaJjxoM7T58YVeMu+ADsnbxB9FFq9TG+ozh5Jot1JVVJTIpLHa6+DEYGkFsfHOIvlxC8DOQ/+/ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONwMfAek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12017C19421;
	Sat, 17 Jan 2026 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768664182;
	bh=/BD78YXzOCcRS25O+L1zfxJJpZZr21mrmcTDTYb9IGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ONwMfAeknFZeKa2F2YI8Tz57lpQT8B9O4PWQZtFSAzVVR0RWen/89eOFd5bh+kWl5
	 98H7E+/r4RBv3QRO95KQXHyk9pOfCQinozNVsKqHT4STf/w+ree6VD1as6scMGa+MB
	 RajXlJht5SjCt048vYn5nPRcEOcq4TBV27nOFdtyI6NyMB1rLPk9gWtOFWUHZvQONS
	 wJh9f0nTSfWTCQzfHZYaF4e9CA48ubTGvLxX7YzHGTUjHeAcQCJlMl7w15IUB6gPtX
	 xVpzkdwX6xJMRnZjhpqKzOZoVnys1XjVXUbZQKx+AstDRnIi/i5LuHhPXGz5pILRj/
	 jc/8oK9Mur9qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B0DC9832F;
	Sat, 17 Jan 2026 15:36:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 17 Jan 2026 16:36:23 +0100
Subject: [PATCH v3 8/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-qcom-cphy-v3-8-8ce76a06f7db@ixit.cz>
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
In-Reply-To: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5230; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=zf+1tmC7easbpv6t/sgEpQwulzF8Aub919Uos8tEoRE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpa6xzgoNRTVAAaJfPCTH6vIbyFRNFO6sSOgG66
 pcVCvsCTOKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWuscwAKCRBgAj/E00kg
 coWID/9w6YaD2+O6F//ywNevpVhHnbznEzH2moI7FZhtYr4yOkh9G10xkK17UlPG271pOJbxzuO
 1+/0GJ9RAcRq/AMYL3FuCUnHtMiys0LeAPx/VNNzeUYfp6f1tDHYCl9bWV5rmPFhtENSqUTrWiD
 hAWbMoEOM8RhsmK+8zkUnZbaMXmPZzzSsHSOvbOJSOPT+iQI66akmxI16lFlgQy4xO71xcF0AA5
 gvhVoN5iuCg2hLoOFfRcOr+MKl+yhmS6VDPWEVYHbJUDvoh+5xCe9OlaV4JkOesVTz3pQCqSZyk
 wVtz8N+NoFrSed7RdwL6+ZkvE/plwR7z826T/RIHW6PSYfnm2Zf749/wOHoBIsucIC+Jj3Ljawv
 ihKPbGbAHjWUQznLnl5a/dcRX6UoKN3xRn7AoeDR5Lc5FIAdT3QQZcm7qaUyYpJEVD9zV6u0p95
 5sGMBX/2/rqJdT50s8KvoYyugFnGhGgotqC5PEb7Di00UrjWZxi3P/TezXGlIpVJlDKqqD9uLjx
 B/cE9NUkubCA5WMm0r0IewbIF1Wq9fvIvYdexa6BH6oLwywCKo6bFVA9GXcZT7K86QSdL+If56w
 TPEakLbmk1Jmg5YSHUR7fp8DIODhKCEltTyVEguut6Sz7hqmkBk1vY2Xdn4xAit4Q6Ga6IErH+n
 D54IWlfbHi8Ty0A==
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
index b50b0cfe280c1..24f244d2959c9 100644
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
index 08dd238e52799..1ea0d0ef354ff 100644
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
index ea0c8cf3cd806..556fedd92e065 100644
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
@@ -4280,20 +4288,22 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
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
index 6d048414c919e..6bf7738837b89 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -163,7 +163,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
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



