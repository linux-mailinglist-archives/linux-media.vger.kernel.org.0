Return-Path: <linux-media+bounces-63462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CBu7HpNoH2rslgAAu9opvQ
	(envelope-from <linux-media+bounces-63462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:34:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A54DA632EF6
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:34:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=tC13Z4Mk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63462-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63462-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45C043031022
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 23:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A633D3CEB;
	Tue,  2 Jun 2026 23:30:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692D937C0F6;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780443053; cv=none; b=U5UHNS/WFirgRaKuKTaTPxAV4IHSJRCo3acfJjSSH7O9tzBYP0qHgwzQAAQrQWnnq1fPCegrNLlizu8vjnYd5FrKOyVtbAIvrWU4z3X5z95cY0fYpINKTuh/kB2lvSSNaed2SrYOx9zigzSOwkQjqzKes32MdKoqyY4rnR6N19Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780443053; c=relaxed/simple;
	bh=x34V6028WCIrBja/M0diJW68/ZAgOsQSDlSG4qUjtmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WResBR/yfxO5SXuGuEtHbibMEvXeHOFXts6PRuzuc5sMC2NyjTSRtTQpV2vSK176vI4zzqf+aQ/kaYYjZaJxt4a11AI47cSz4j/WRmkuXEi0WFZ2FnrtSVo3EtOYIuKoUh5pjifV60DeJNPIcG1+TcxrwUHk7UYnkT5KGN+xzQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tC13Z4Mk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4210DC2BCC7;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780443053;
	bh=x34V6028WCIrBja/M0diJW68/ZAgOsQSDlSG4qUjtmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tC13Z4MkEH5XrVcbz6C6PUu3yL+ZHZWxDwBcDmGSYuVzztVbiAANcKYanEHQyFYN7
	 YvbJwKj7mgKJAPml0hqa13CbPoMTH5r5BH6+sr7yKbnqj8ED5JG1N+r2HHc59/xYd0
	 cs0oFnY2iG0Avy4XFCxIkqA8x965L7UktjVgZpCJ5ycuFMIFPEq4Y5G/b+5ugVSaI+
	 nydkZiEFJVIfyib0vR+lqk4pI330XrLhu5Px23hv+E2G3kD9m2w2cVJkeCo1kw5vG7
	 OwOF7UF4uDsj25Ew2v60BwYRe1nQjswxHCmgJtDbhPFqAW1dxcfeBKAbv4p2/Jcsb+
	 fJQFXH2uSubJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3874ECD6E5D;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 03 Jun 2026 01:30:45 +0200
Subject: [PATCH v6 7/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-qcom-cphy-v6-7-e50de0b557a8@ixit.cz>
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
In-Reply-To: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7531; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XWpP665UVAOVGgSeSabqqYJqOyEqb1Fz4nUNtU0nD7I=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqH2erL5thC+tbl+E9HmemVZnKxn3gAHiR5sXiG
 svWbw92ETGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCah9nqwAKCRBgAj/E00kg
 ckqJEADLvrhlANOvvzj2y2zXpckctdRhYBSBPR+ZICIDGYnZM9TnqRdj4fhptvoiDu5R9botspM
 /U0WEiFChJFPklZOFjA3IKvFdt1Cq/iZ4paHV6j6ixE5DNhdRM8to6lnhNWXPh81bu/OfCC1Vg3
 NiKRn+VdyikTZPKZOJjXl5TMDzvBLFBDKcyRW9mLNkBzRWGBYgIsPKu+zzLTBWsNgOpwabuNiz1
 CunpsecNUaa5Y6TmWLuO1vxLIlJ2Ug9O2PwLOLy68wgwmpELskLs0jMG/pkkqhCAuURTKYdt0Lu
 hYciovfX3yKUhAaZz1+6Rt6AXyUAVGtruL3D9MscWc1r/qU8JKf1AYBdizwmzsjsbEHTdTNnWB2
 dznIBJRQZbMzURhUPercWdYJQ3rfO6Q+H7/XHXFZPahOufuYmHNHNrC/oR9tOdyqwU2ZSliKNtF
 5nhmmBrryhTNgJmf0GwFz4t9kIJiRsm/uxzEPCbytD3hsG1ygl9cW7Z0CQFq/tBKpNRtB96L/ag
 hAAVB4YG2mN2khh3oDRlAoxrQRkywS3PjTEEJmVn2XpobKYZD+RgNC1SzHTyxs8anO8bllGsfBe
 f8MZ1bCMetmOqI6BiICOAvmVu2ZbvXPN6U/yg8n2J8Sb5OIm/5zhC0y4g6ofHzMlknCz9RgTNmU
 Gs24wnv0dAG1CCQ==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63462-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:todortoo@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:email,linaro.org:email,ixit.cz:mid,ixit.cz:email,ixit.cz:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A54DA632EF6

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



