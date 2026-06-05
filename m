Return-Path: <linux-media+bounces-63906-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VbTtLtXNImqTdwEAu9opvQ
	(envelope-from <linux-media+bounces-63906-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:23:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1464882E
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:23:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=htrVUw75;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63906-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63906-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05FF5303DA9A
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F523FFFAB;
	Fri,  5 Jun 2026 13:14:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C23A3EBF0C;
	Fri,  5 Jun 2026 13:14:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665285; cv=none; b=FW74ClCvS3pu2DdPodm1sjIYCeFnofmRfLR8E9YiFErXKVtHHbyou2GqR9hYmVnvc3NU5ZMfVufm8Ty5X+KlaFAW1ToLXKl5svFUSYa0319dw9M/r+3q7LeAIZwiZshCzmDOHMa+Ijx4NE1IU/miulXYYs+tBASDbuEdDcrSxZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665285; c=relaxed/simple;
	bh=mIBpzoLsYYpzL9RT4TD3QA5kH0+SeiIoOs0i0v91v6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAZhGIAWWVCIyGnaapYtJwfn0OWSiyBWQrt+ZbokBZCh+RAjK2hwqrePOtmv783hpUBNcPWZjwGPDVltuo3gUlo4/G5gfq4Z1krsL85VlTOySTMtjArxa4qYO7ZllVg4MXXV5USdN/Ar7Or5wC7jfmWdbfcYx5/ZvyKguiCxY7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htrVUw75; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F910C2BCF5;
	Fri,  5 Jun 2026 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780665285;
	bh=mIBpzoLsYYpzL9RT4TD3QA5kH0+SeiIoOs0i0v91v6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=htrVUw75GL9u7Wv7F4ALh/1pw+TO8IY8ioUeyyuZwaX/AQ4LIFkJzjAaud1SxvcJ9
	 46/1CplsUMMpNPCL3phvrd7XPRUOtGkndzWjzdCDqdPmxqvKAGpcWvvuQqo87dex/4
	 TjOiHXa/t2Xq+erxWDQhH1i3ObJS1+FA8BVRabY6wggEUx/xd+UVDPtWnyG+gEsi1D
	 tlMoTP70I7yrWg/9xndvKDm3ibOaZiZJI3L5vpwczohp7ttsfF1adJKHIgzmw92pcG
	 wzbpcfZFpZOgTkRS2Q5oqVmMF6vqQbPK/UVKI077fj6Lfev59F4I5aRQhB9cAdMZCN
	 WN3R1D2rGX3vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48050CD8C81;
	Fri,  5 Jun 2026 13:14:45 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 05 Jun 2026 15:14:45 +0200
Subject: [PATCH v7 7/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-qcom-cphy-v7-7-426c37e9008f@ixit.cz>
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
In-Reply-To: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7531; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dMZP7gPqJE1k13DCIY0n4Cw62GBidlljoZhlTRnWYUw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqIsvCe9fI2Z2m7WNMuoJBBkcFloUwf1AEaJzYq
 ZEr2aImPSiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaiLLwgAKCRBgAj/E00kg
 cjCwD/4j7P/BftQ0KhLdHfbG8D4aUp1Ssy0zS97Gscsel36ST3lcMNCnqfowCLuvgb2M1alciin
 RKWFc231DNE6YGPB5o1AKk1xtsW0pF1l0oi0gYa6NzQafojcgFJH1SOKRYkPExiIVHLFuNSgeZi
 iDRMes08mX9TruP36DjqJZRafjhFDCKa4H9HVXn/GSwq+cJAXJGEKoo0/Z3g3E/Qk65Z2FKlA0L
 GefQVgc0JLJM4EXoIrZyJGk0EfMNNmfUjSpxorgfI245h6IyEt32ULiYExfzHcG1lgn1dcCufVm
 9gBOI86aOT59Dk20XBkXAzGiBcrFX6iSZLngGvI8t5C4+2rgznbR4Us4FjZJITnlz5di7V8jNnf
 eQ6FHlX1SV62d5U2Fq7h+0Pxkf4365dDDZxkoBWE36YfCl/JMZoy6AEmo/qhZv3m9UEsQZW1gxC
 B0dqazBJs3MVLowDqiUBXX3yXw2Po8wbsUt344hJin8KwA4BwGUtrxTkAAFuh7LRQRSRTB/uE6c
 gHJZbFgDLDKO6nXwwZlPBojI1/FBZTDHrR0I4WbTDJYhlqk9pG2Ee7oLZMqB9iqEeXJE7SJU8sH
 8CbC7fYfzBUCZodbdmKZLsre9+0p0Kx0EqjrUCTE+oWg9BpGeOw6WTOH5+HXcpu6pAB7g+gBP7T
 xQhxaKBpRnGtzsg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63906-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:todortoo@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EB1464882E

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
Link: https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid.c   |  7 +++++--
 drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++----
 drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++++++---
 drivers/media/platform/qcom/camss/camss.h        |  2 +-
 4 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index bcc34ac9dd212..7415e811082da 100644
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
index 539ac4888b608..f9b1ed79e15de 100644
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
@@ -264,20 +263,19 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
  */
 static int csiphy_stream_on(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
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



