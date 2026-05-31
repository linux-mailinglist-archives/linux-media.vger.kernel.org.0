Return-Path: <linux-media+bounces-63184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BplJYUzHGoeLgkAu9opvQ
	(envelope-from <linux-media+bounces-63184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 15:11:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1578A616402
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 15:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0C383065530
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 13:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBFE38F63D;
	Sun, 31 May 2026 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPPLu1Mh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB32381AE2;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780232893; cv=none; b=uRfSSiodrR76iwEaAC7LUe+aW3DCXkW5ZTgfPaAkTp3gm8mD9OIykvJCy2oUNx+tvIoBNe15ki13b9f5TakqDNYn4bIEQGZDVg6D4y+PHinE4Z2J0KH0T/i57GZ14Sat9uwVMUIkGokUQX6i5Ze2mGAn26agYLXdZ+XDPpmBhL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780232893; c=relaxed/simple;
	bh=EaRoxfgGQ5+/Eaqb4E0kPaWISAvjA5ezTqbtSUzMa/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJEqapSLSeWqTUKt4Cx6+vGIOCK9qcYP1gB82gK5GNAc2LKaFAziheR5HnxYdiKiGc+DKnul+7uKrnWs/hVn+GYs9ByBx0M/CQSl0AFuN/PXjVfZ5JFXg/1rlK1faSof0QRC4+eW3ePF4dlM+mNNqxmV8+Df/7WWoaWmUKRe96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPPLu1Mh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2502AC4AF15;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780232893;
	bh=EaRoxfgGQ5+/Eaqb4E0kPaWISAvjA5ezTqbtSUzMa/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fPPLu1MhB/V8YuYZIEVT3h5I+1cnz+A35HXhyp83OlBKMk1Q4/pIS2LON0SxjcWRR
	 R5YKcGoWan6IZ30C4WKqdfRS0KTMF6wSElXjt03hdKuIJSmWXl9h0UwbxEzA6m7brn
	 BdG+DzLeg74saKblLNEIzNUEfLS+XDQ1O2Ib3jKxeTQ4yn5Bti/+61PRykDxs+5dtP
	 seRh0OXkXez+wOpSH7scbJihI4eAATJDbFcG+YIWL39OMK/gHitYEqO4KGBPn9Ja5R
	 HoD1B49C51txpsMsMPkQ6GQRh0r1Nk6uBa+Ie17xu2qRKAwDeK/i77zbZyumqBGzu8
	 1EyQurG50rcmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19546CD6E5D;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 31 May 2026 15:08:16 +0200
Subject: [PATCH WIP v5 8/9] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-qcom-cphy-v5-8-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
In-Reply-To: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>, 
 Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7513; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=VfLsah7RMKW8BXaupqjSf+xkoWPRRbvrrl6O72OO1HM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqHDK6CYOhkdRZEuqsnJmobHtNhM6tSuROXOEVK
 ow8GWYfRrSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCahwyugAKCRBgAj/E00kg
 cnUhEADLWZtMQh8OQun0BUQdi9l5YUZAQEkd8tOG5700/WCi2knrXCTHlef+7VA62eEPAmTMdAk
 hVbCxMqnydQLh+i9QW0VfIHBElMImnJwX4dF43NXlPUtWNI8L2J/h1fKah3rsd02YpX/5NN//PX
 XLqpOgJZkipqf5STy4zYPEEV0rUPU5Yclj5yt3J+6Z+WqnhcCRxMDKF8bS4M3Bx7fWUFsSg8aj5
 dojmtK4Sz1u7jy7tWl1dWNdWaMt3odl7cBb3xx59AE1DfHKdkAtL4E/xmJVl/hTlLCXbA+FC4cM
 pDLMpELengdxCb2jZtaK/1HCv+CyHyXsTPY74E3bVGxcC67NikzSphWkoHx1LJjPFdqWCs76h24
 Iy1lNShBY+w7qfn5QoQRgWke62HIj+uvwySSV1dcUd+UwkfWrGyoWnrIovb8GY8Nm8qi67C3MZ2
 QYhW4Sr00hQ4OknACDVbEACMsNe26FgysJeve44opW64My/lewCBKIDZE4VdKYvKbXAkM9eqZAJ
 WWK4WZgS6buzfFmRTD7S7rPqJ4xFQipIItSym2Vrx0wekBoR516hCdtcw895Gw0m8OOY917FjB1
 2xwPy4MQTDbInsZSIarJ4cbbn6clpiAWGLqbnsC/WDjhkOWZ/cdsDGHI4jSOl5gUIFpKuUyD2im
 TrJabUFRYawC/bQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63184-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,intel.com:email,ixit.cz:replyto,ixit.cz:mid,ixit.cz:email]
X-Rspamd-Queue-Id: 1578A616402
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Ensure that the link frequency divider correctly accounts for C-PHY
operation. The divider differs between D-PHY and C-PHY, as described
in the MIPI CSI-2 specification.

For more details, see:
https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Cory Keitz <ckeitz@amazon.com>
Tested-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid.c   |  7 +++++--
 drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++----
 drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++++++---
 drivers/media/platform/qcom/camss/camss.h        |  2 +-
 4 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 8d5c872f84ed5..594f280a455ed 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -534,25 +534,28 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
 
 /*
  * csid_set_clock_rates - Calculate and set clock rates on CSID module
  * @csiphy: CSID device
  */
 static int csid_set_clock_rates(struct csid_device *csid)
 {
 	struct device *dev = csid->camss->dev;
+	struct csiphy_device *csiphy = &csid->camss->csiphy[csid->phy.csiphy_id];
+	struct csiphy_lanes_cfg *lane_cfg = &csiphy->cfg.csi2->lane_cfg;
 	const struct csid_format_info *fmt;
+
 	s64 link_freq;
 	int i, j;
 	int ret;
 
 	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
 				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
-	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
-					csid->phy.lane_cnt);
+
+	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp, lane_cfg);
 	if (link_freq < 0)
 		link_freq = 0;
 
 	for (i = 0; i < csid->nclocks; i++) {
 		struct camss_clock *clock = &csid->clock[i];
 
 		if (!strcmp(clock->name, "csi0") ||
 		    !strcmp(clock->name, "csi1") ||
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index ec0dc9d31b585..cd16743858d6a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -138,19 +138,18 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
 {
 	struct device *dev = csiphy->camss->dev;
 	s64 link_freq;
 	int i, j;
 	int ret;
 
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
-	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, &csiphy->cfg.csi2->lane_cfg);
 	if (link_freq < 0)
 		link_freq  = 0;
 
 	for (i = 0; i < csiphy->nclocks; i++) {
 		struct camss_clock *clock = &csiphy->clock[i];
 
 		if (csiphy->rate_set[i]) {
 			u64 min_rate = link_freq / 4;
@@ -265,20 +264,19 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 static int csiphy_stream_on(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
 	const struct csiphy_hw_ops *ops = csiphy->res->hw_ops;
 	s64 link_freq;
 	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
-	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
 	u8 val;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, &csiphy->cfg.csi2->lane_cfg);
 
 	if (link_freq < 0) {
 		dev_err(csiphy->camss->dev,
 			"Cannot get CSI2 transmitter's link frequency\n");
 		return -EINVAL;
 	}
 
 	if (csiphy->base_clk_mux) {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 072c428e25166..db4e14a84a95f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -27,16 +27,24 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-fwnode.h>
 
 #include "camss.h"
 
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
 	/* CSIPHY0 */
 	{
 		.regulators = {},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
 		.clock_rate = { { 0 },
@@ -4618,30 +4626,34 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
 			return pad;
 	}
 }
 
 /**
  * camss_get_link_freq - Get link frequency from sensor
  * @entity: Media entity in the current pipeline
  * @bpp: Number of bits per pixel for the current format
- * @lanes: Number of lanes in the link to the sensor
+ * @lane_cfg: CSI2 lane configuration
  *
  * Return link frequency on success or a negative error code otherwise
  */
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes)
+			struct csiphy_lanes_cfg *lane_cfg)
 {
 	struct media_pad *sensor_pad;
+	u8 num_lanes = lane_cfg->num_data;
+	bool cphy = lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY;
+	unsigned int div = num_lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
+						     CAMSS_DPHY_DIVISOR);
 
 	sensor_pad = camss_find_sensor_pad(entity);
 	if (!sensor_pad)
 		return -ENODEV;
 
-	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
+	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, div);
 }
 
 /*
  * camss_get_pixel_clock - Get pixel clock rate from sensor
  * @entity: Media entity in the current pipeline
  * @pixel_clock: Received pixel clock value
  *
  * Return 0 on success or a negative error code otherwise
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b..d65a9b62f7e66 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -164,17 +164,17 @@ struct parent_dev_ops {
 };
 
 void camss_add_clock_margin(u64 *rate);
 int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes);
+			struct csiphy_lanes_cfg *lane_cfg);
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
 int camss_vfe_get(struct camss *camss, int id);
 void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,

-- 
2.53.0



