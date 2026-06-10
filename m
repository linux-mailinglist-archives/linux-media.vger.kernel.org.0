Return-Path: <linux-media+bounces-64514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6QtIAl2tKWqObwMAu9opvQ
	(envelope-from <linux-media+bounces-64514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:30:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D666C445
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:30:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=H2qJYRRo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64514-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64514-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B425730F4AD9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA45363C45;
	Wed, 10 Jun 2026 18:28:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7E357D0C;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781116106; cv=none; b=RJaVnM+EkMyYdUDCTHN52iXwwUg+L4BmlgnTvVM+YajXcCvTg6JfI3LsuKh0jsbnhwUs6ztmPsZSiC07LaE6+5uj3z95SHI/kvf9FccSX1aPpzXOgWFXZT9mKQElsfe2NYhGFNwntOd7e+fCyzh1kO1sxMXQF0g4vSL2r3PBgNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781116106; c=relaxed/simple;
	bh=23ujETeHyNMlyqF2CM9K0eByUZo1COTvzR1UvtGRCR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjz2+hGlUXusgfwQYxn2Fj2Wh52e/EKMtcnMOxPEW+9dRgbSg72GaecEhOfKmhRDgFBSE5KMKKlSYOxLYWHRUoPER2KNCw5oviHD7umTs20wVQp5XXzr94ahQyUCiZbYnc1EwmnZSiVGNMFinY5gn6MrTW5K2wIYu6tJKO7OTj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2qJYRRo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87DABC2BCC7;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781116106;
	bh=23ujETeHyNMlyqF2CM9K0eByUZo1COTvzR1UvtGRCR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H2qJYRRoYNISRHVTZm8esfcOZ8pdUbq+xCncepSwj+FOLXpGVWeKX2T51e+m/cUTS
	 K8qdc+YIoZaHf4epRNJqX52gEg9h1FKUD15SGXJdSpecMGWx2KqwrKjlMqRySlaU+M
	 +tW7B1j3L308YEI84rlExiJP+amfYmGY3uAEmmJhw+NTsvRDGA1LCtFNe++GnvSNIh
	 KWPsjB8/nJM38IIdQYK0MkeMhAuUpJxigw0tyhY2fAS1N7vSaddHrwgneFKXitqiJc
	 /cqSx9qc3GopSz9II+f8hRlE8Z7UULjEFAO58YbvxOvIyZiypPWg53ge1HZQNffW/E
	 4lY8GG37f2QAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8022BCD98CC;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 10 Jun 2026 20:28:28 +0200
Subject: [PATCH v8 8/9] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-qcom-cphy-v8-8-cd4387785179@ixit.cz>
References: <20260610-qcom-cphy-v8-0-cd4387785179@ixit.cz>
In-Reply-To: <20260610-qcom-cphy-v8-0-cd4387785179@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7330; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=sVPrk/XzjkPG3qz+AM7isEZRhSTJ3CSoEJ0qxo3ZGDs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqKazHAF84d7nVkkgCE7VYGHj3ShNf3CZvAGanT
 qhWZbBezeaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaimsxwAKCRBgAj/E00kg
 ctfdD/9uup5MR/5vJ2wVzy2nT67yAU42jTHrN3CT73F2VhWQ5vsa6PfhS0d4wd3x6wclYD+1IY4
 o6TwEQ7htBwJZuzTD5RNP+w+ET8ISY9d6eyZkuZiDQpa9sArSDdG7LC5UuYFtdy9iSgwlCftIwZ
 1AcNclRByHQfQSNiDz4CPusabBaOkjPQg8/mwQv3Vq52JlP2mj9se5QPItbjPjMYSdhx+zPK3Y0
 03fu5lI0nFicPSHlcNNtiDUee79dlToo4SJlGeIrJBFt9ODzBKjH4LAjrSVxYB9RDC8VvtAFrxj
 t8TVsucNRt6thw3KinsBUW0fPsLd6CV9bOAVRAbyJpNoeuFbdzRlojFJsCYN3MLPCFVYcu7BL+n
 kX/YWJFzhDYIphhOhSMzRQVPzqAERtK3ymmrnKsEfHT4Zhx9R0YvOgSSe69SLcE5XNtJM0PdKJI
 0TrTbQiT1GEWlr5ik602Vx8/NHfKGk60VBX0g5UwH1VMnyUEUwyISK6EYXbDdkEAPvzt01T9svW
 kXMj4S3bf3jQfzBRbePJwjqawqCBfIFIcwuLl3llCUbkRhTNAMMl96xZUrFEIi06/JdsE0Z8OUB
 BRvEIEgUcFnAN3NU1Xbnd46fJdJomcTq6h0e5wucKFiXi69e08tueYALRCvE5hyzn3R632CLpA3
 WVUt4x3EVsGZrDQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64514-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:hverkuil@kernel.org,m:nihal.gupta@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ixit.cz:replyto,ixit.cz:email,ixit.cz:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 705D666C445

From: David Heidelberg <david@ixit.cz>

Ensure that the link frequency divider correctly accounts for C-PHY
operation. The divider differs between D-PHY and C-PHY, as described
in the MIPI CSI-2 specification.

For more details, see:
https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid.c   |  6 ++++--
 drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++++--
 drivers/media/platform/qcom/camss/camss.c        | 15 +++++++++++++--
 drivers/media/platform/qcom/camss/camss.h        |  2 +-
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index bcc34ac9dd212..c8cb6f1a3d3bc 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -535,24 +535,26 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
 /*
  * csid_set_clock_rates - Calculate and set clock rates on CSID module
  * @csiphy: CSID device
  */
 static int csid_set_clock_rates(struct csid_device *csid)
 {
 	struct device *dev = csid->camss->dev;
 	const struct csid_format_info *fmt;
+	const bool cphy = (csid->phy.phy_sel == CSID_PHY_SEL_CPHY);
+
 	s64 link_freq;
 	int i, j;
 	int ret;
 
 	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
 				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
-	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
-					csid->phy.lane_cnt);
+
+	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp, csid->phy.lane_cnt, cphy);
 	if (link_freq < 0)
 		link_freq = 0;
 
 	for (i = 0; i < csid->nclocks; i++) {
 		struct camss_clock *clock = &csid->clock[i];
 
 		if (!strcmp(clock->name, "csi0") ||
 		    !strcmp(clock->name, "csi1") ||
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 539ac4888b608..a136cd27880a6 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -139,18 +139,19 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
 	struct device *dev = csiphy->camss->dev;
 	s64 link_freq;
 	int i, j;
 	int ret;
 
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+	const bool cphy = (csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
 	if (link_freq < 0)
 		link_freq  = 0;
 
 	for (i = 0; i < csiphy->nclocks; i++) {
 		struct camss_clock *clock = &csiphy->clock[i];
 
 		if (csiphy->rate_set[i]) {
 			u64 min_rate = link_freq / 4;
@@ -265,19 +266,20 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 static int csiphy_stream_on(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
 	s64 link_freq;
 	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+	const bool cphy = (csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);
 	u8 val;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
 
 	if (link_freq < 0) {
 		dev_err(csiphy->camss->dev,
 			"Cannot get CSI2 transmitter's link frequency\n");
 		return -EINVAL;
 	}
 
 	if (csiphy->base_clk_mux) {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 072c428e25166..66171069057f8 100644
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
@@ -4619,29 +4627,32 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
 	}
 }
 
 /**
  * camss_get_link_freq - Get link frequency from sensor
  * @entity: Media entity in the current pipeline
  * @bpp: Number of bits per pixel for the current format
  * @lanes: Number of lanes in the link to the sensor
+ * @cphy: If C-PHY encoding is used.
  *
  * Return link frequency on success or a negative error code otherwise
  */
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes)
+			unsigned int lanes, const bool cphy)
 {
 	struct media_pad *sensor_pad;
+	unsigned int div = lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
+					       CAMSS_DPHY_DIVISOR);
 
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
index 93d691c8ac63b..12b14ba8fcec3 100644
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
+			unsigned int lanes, const bool cphy);
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



