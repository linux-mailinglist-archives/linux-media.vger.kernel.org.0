Return-Path: <linux-media+bounces-58382-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEl0F90I2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58382-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 619D33CF3D8
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37B0E3016B05
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D8333B6C8;
	Thu,  9 Apr 2026 20:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7T9XLqw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC8A33BBD2
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765707; cv=none; b=YH1VJhn7Zq7lc8M9+fVfoaWJmkx3ccQcHkUQAVKCjA1MNZhC1HHK6b1o3SPqDOyMqjiFBR00LQfmAF3EiORxDE3+P0qJRfit68EBTFvbwVuugGVdbBCEmBi4ZkB461G0/Qy9WXaz9Xu+OR6GOPMTDIQ8Zc0b23IMIFWCk8YBDj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765707; c=relaxed/simple;
	bh=185hRbRgwLLWnZvTS03Lm3JAPWVMX1WaswhVrFwXRss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxBjKudJvOf015i8zP31v2D61qzCEpvZdsTIknMx/ff0qin6AWkxiXZqyq+53jATJH5N/VscKRUnk5O4cJNyjA4b2G4SZjU2Rj5vPxoIVzj0ufzwZ6nVJ1baFcDysWwkL/kZGcAxytVld6/m56qWg9d9jWBQsOxwO5IhVCedqRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7T9XLqw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765706; x=1807301706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=185hRbRgwLLWnZvTS03Lm3JAPWVMX1WaswhVrFwXRss=;
  b=O7T9XLqwfX5mqcJU8Loe3UJgUf9etOtzr5m5cYDcecoFHKAZ7yH17wiC
   EgCIMIhF9c7QATCCK6HNBqSutRXPLaTuGOdPAJOlB+rgLO5nv22m1GnHh
   xnrB0bTq4qb+trKzyGuDXxPzmqSNtywQYNQAVbKrRtmfm4G52z6uyfh9p
   gdPLWxP+e2Htb7jfERo0q1e4YHciNrW++jZrYMW+eAiil+Ru1Uc/bZIRM
   x1OXW41E6YGuzD1gONB4vkmYPIwa+xBghz/icM2TsntVyvwz9wEwsETC0
   07cZ+FMqDNWstqfisVtQybB3Djnjh1wEEfjWCi7ZasnvovqLGMvk/KMz2
   A==;
X-CSE-ConnectionGUID: YBQEeBjYTCaqD+/7Ua7MKQ==
X-CSE-MsgGUID: nZQGlu1NSemBun/Fujp+FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408577"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408577"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:02 -0700
X-CSE-ConnectionGUID: 4wWefCGRTFmiZmM2Xdo1YA==
X-CSE-MsgGUID: NQpnVzuYRv+WoAEmPH07Jw==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:14:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 200B2121D24;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045op-2TzH;
	Thu, 09 Apr 2026 23:15:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 62/86] media: imx219: Add V4L2_CID_BINNING_FACTORS
Date: Thu,  9 Apr 2026 23:14:37 +0300
Message-ID: <20260409201501.975242-63-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58382-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 619D33CF3D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the V4L2_CID_BINNING_FACTORS control. It'll be read-only
for now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 77 +++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index a7d59d16add5..7ed53810f941 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -382,6 +382,7 @@ struct imx219 {
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *binning;
 
 	/* Two or Four lanes */
 	u8 lanes;
@@ -457,31 +458,27 @@ imx219_get_embedded_format_code(const struct v4l2_mbus_framefmt *format)
 	}
 }
 
-static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
-			       u8 *bin_v)
-{
-	const struct v4l2_mbus_framefmt *format =
-		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
-					      IMX219_STREAM_IMAGE);
-	const struct v4l2_rect *crop =
-		v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
-	u32 hbin = crop->width / format->width;
-	u32 vbin = crop->height / format->height;
-
-	if (hbin == 2 && vbin == 2) {
-		*bin_h = IMX219_BINNING_X2_ANALOG;
-		*bin_v = IMX219_BINNING_X2_ANALOG;
-	} else {
-		*bin_h = IMX219_BINNING_NONE;
-		*bin_v = IMX219_BINNING_NONE;
-	}
-
-}
-
 /* -----------------------------------------------------------------------------
  * Controls
  */
 
+enum imx219_binning_factor_indices {
+	IMX219_BINNING_11,
+	IMX219_BINNING_22,
+};
+
+static const struct {
+	u8 h, v;
+} imx219_binnings[] = {
+	[IMX219_BINNING_11] = { IMX219_BINNING_NONE, IMX219_BINNING_NONE, },
+	[IMX219_BINNING_22] = { IMX219_BINNING_X2_ANALOG, IMX219_BINNING_X2_ANALOG, },
+};
+
+static const s64 imx219_binning_factors[] = {
+	[IMX219_BINNING_11] = V4L2_BINNING_FACTORS_MAKE(1, 1, 1, 1),
+	[IMX219_BINNING_22] = V4L2_BINNING_FACTORS_MAKE(2, 1, 2, 1),
+};
+
 static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx219 *imx219 =
@@ -495,7 +492,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
 					      IMX219_STREAM_IMAGE);
 
-	if (ctrl->id == V4L2_CID_VBLANK) {
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK: {
 		int exposure_max, exposure_def;
 
 		/* Update max exposure while meeting expected vblanking */
@@ -509,7 +507,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 					       exposure_def);
 		if (ret)
 			return ret;
-
+		break;
+	}
+	case V4L2_CID_BINNING_FACTORS:
+		return 0;
 	}
 
 	/*
@@ -587,6 +588,9 @@ static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
 	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
 }
 
+static_assert(ARRAY_SIZE(imx219_binnings) ==
+	      ARRAY_SIZE(imx219_binning_factors));
+
 /* Initialize control handlers */
 static int imx219_init_controls(struct imx219 *imx219)
 {
@@ -688,6 +692,12 @@ static int imx219_init_controls(struct imx219 *imx219)
 	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CONFIG_MODEL,
 			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR,
 			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR);
+	imx219->binning =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
+				       V4L2_CID_BINNING_FACTORS,
+				       ARRAY_SIZE(imx219_binning_factors) - 1,
+				       IMX219_BINNING_11,
+				       imx219_binning_factors);
 
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
@@ -695,6 +705,8 @@ static int imx219_init_controls(struct imx219 *imx219)
 		goto error;
 	}
 
+	imx219->binning->flags = V4L2_CTRL_FLAG_READ_ONLY;
+
 	ret = v4l2_fwnode_device_parse(&client->dev, &props);
 	if (ret)
 		goto error;
@@ -746,7 +758,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 {
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
-	u8 bin_h, bin_v;
 	u32 bpp;
 	int ret = 0;
 
@@ -764,9 +775,10 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_VISIBLE_TOP + crop->height - 1, &ret);
 
-	imx219_get_binning(state, &bin_h, &bin_v);
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
+		  imx219_binnings[imx219->binning->val].h, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
+		  imx219_binnings[imx219->binning->val].v, &ret);
 
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);
@@ -1068,6 +1080,11 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 		int llp_min;
 		int pixel_rate;
 
+		ret = __v4l2_ctrl_s_ctrl(imx219->binning, bin_hv == 1 ?
+					 IMX219_BINNING_11 : IMX219_BINNING_22);
+		if (ret)
+			return ret;
+
 		/* Update limits and set FPS to default */
 		ret = __v4l2_ctrl_modify_range(imx219->vblank,
 					       (int)(mode->height / bin_hv),
@@ -1089,9 +1106,9 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 		 * operates on two lines together. So we switch to a higher
 		 * minimum of 3560.
 		 */
-		imx219_get_binning(state, &bin_h, &bin_v);
-		llp_min = (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ?
-				  IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
+		llp_min = imx219_binnings[imx219->binning->val].h ==
+			IMX219_BINNING_X2_ANALOG ?
+			IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
 		ret = __v4l2_ctrl_modify_range(imx219->hblank,
 					       llp_min - mode->width,
 					       IMX219_LLP_MAX - mode->width, 1,
-- 
2.47.3


