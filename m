Return-Path: <linux-media+bounces-58384-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE5LJDkJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58384-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA233CF4AB
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26E58303A91B
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADC240DFB3;
	Thu,  9 Apr 2026 20:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bi91oqRg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDD23368AB
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765708; cv=none; b=Re6JDuewIYwJuK9fRVVUNH/K4kBr4L1wF9F7pow10/AdTbygfpDDLPtekYd/m9AAHwuo5MSZvGP8b/ICt0gD0+OiCYMVu8wHy5TsjSbfhLvhJm5sFAIi9zcVr6vf/sPYf+pcbtwV9iYQM2nmdw+2I0dT+nMDoFu8km8PTGryNFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765708; c=relaxed/simple;
	bh=lanHIR/ddGCcbG7nleMGJ/q1pu8x0HGWvPqx3kD6hyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oi2l3tpSLe5zwZGxrhyp8oTM5xjf1l2akL3WiKaKl05kvJXgFufOmQlFE/2b8t6WaRlInHmzXpYBDW/StS24H2TAkSMimmL7AlhmgmVOcapopTIRubmZWlkZHGhxTtMjGGMPUDJroMq4lGy6zhbygZb4btXo8qJ6+SBxl+oteE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bi91oqRg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765707; x=1807301707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lanHIR/ddGCcbG7nleMGJ/q1pu8x0HGWvPqx3kD6hyA=;
  b=bi91oqRgRg7rSXuyxY5VqTZBInlld5xl0PzoBqyMoFXb8eikJnoGPi0j
   uD2KM0farQel+1LEm3/8KmgbM4Vc6WDZgVvO0/Qbs0DtJT0eSXQrBviSc
   BSRT8XQtl6vplDzNlkFdvO5sgziKCMgtT+51OIuFSBZDflkULcGKZNrI/
   h7ygoNA2BwPXFRbMgbXe1OWwxJo8V+NkwwkeTMMWu1BFDtIPZRxmG36Hn
   L+Yt66Bt6l7eQleku2bzA4BTRSYcNUOrEk+wnRS2c84ewyPtEvSqhAWxC
   xzlBI94jay8+Ik5cu3hA6BfN4VUkj7JrV0lkSay4Ntz/MApsI6nyhtpgN
   A==;
X-CSE-ConnectionGUID: NaNyEmXaR5iHS/H2WpaI0g==
X-CSE-MsgGUID: QBSVcUcAQwWtrDksqqo9xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408600"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408600"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:02 -0700
X-CSE-ConnectionGUID: jnWuILQzRLuZKgpfZIFy/Q==
X-CSE-MsgGUID: daijXKZXRgS6JnTJQVZ7sg==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:14:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 29D1F121D33;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045oz-2dC8;
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
Subject: [PATCH v12 64/86] media: imx219: Support LINE_LENGTH_PIXELS and FRAME_LENGTH_LINES controls
Date: Thu,  9 Apr 2026 23:14:39 +0300
Message-ID: <20260409201501.975242-65-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58384-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EAA233CF4AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Support V4L2_CID_LINE_LENGTH_PIXELS and V4L2_CID_FRAME_LENGTH_LINES
controls. These two controls provide direct access to sensor's line and
frame lengths, without requiring a reference crop rectangle.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 216 ++++++++++++++++++++++++++++---------
 1 file changed, 168 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 591feb3d539f..9f9503602040 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -383,13 +383,18 @@ struct imx219 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *fll;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *llp;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *binning;
 
 	/* Two or Four lanes */
 	u8 lanes;
 
+	/* For handling frame timing dependencies. */
+	bool setting_ctrl;
+
 	u64 streams_enabled;
 };
 
@@ -472,9 +477,10 @@ enum imx219_binning_factor_indices {
 
 static const struct {
 	u8 h, v;
+	u16 llp_min;
 } imx219_binnings[] = {
-	[IMX219_BINNING_11] = { IMX219_BINNING_NONE, IMX219_BINNING_NONE, },
-	[IMX219_BINNING_22] = { IMX219_BINNING_X2_ANALOG, IMX219_BINNING_X2_ANALOG, },
+	[IMX219_BINNING_11] = { IMX219_BINNING_NONE, IMX219_BINNING_NONE, IMX219_LLP_MIN, },
+	[IMX219_BINNING_22] = { IMX219_BINNING_X2_ANALOG, IMX219_BINNING_X2_ANALOG, IMX219_BINNED_LLP_MIN, },
 };
 
 static const s64 imx219_binning_factors[] = {
@@ -482,8 +488,9 @@ static const s64 imx219_binning_factors[] = {
 	[IMX219_BINNING_22] = V4L2_BINNING_FACTORS_MAKE(2, 1, 2, 1),
 };
 
-static void imx219_apply_binning(struct v4l2_subdev_state *state,
-				 struct v4l2_rect *crop, unsigned int index)
+static int imx219_apply_binning(struct imx219 *imx219,
+				struct v4l2_subdev_state *state,
+				struct v4l2_rect *crop, unsigned int index)
 {
 	struct v4l2_rect *compose =
 		v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
@@ -494,6 +501,7 @@ static void imx219_apply_binning(struct v4l2_subdev_state *state,
 		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
 					     IMX219_STREAM_EDATA);
 	s64 binning = imx219_binning_factors[index];
+	int ret;
 
 	crop->width = clamp(crop->width, IMX219_OUTPUT_X_SIZE_MIN *
 			    V4L2_BINNING_FACTORS_HNUM(binning),
@@ -519,6 +527,102 @@ static void imx219_apply_binning(struct v4l2_subdev_state *state,
 
 	embedded_format->width =
 		embedded_source_format->width = source_format->width;
+
+	int fll_min = IMX219_VBLANK_MIN + source_format->height /
+		V4L2_BINNING_FACTORS_VNUM(binning);
+	ret = __v4l2_ctrl_modify_range(imx219->fll, fll_min, IMX219_FLL_MAX,
+				       1, fll_min);
+	if (ret)
+		return ret;
+
+	int vblank_min = IMX219_VBLANK_MIN -
+		(int)(source_format->height *
+		      (V4L2_BINNING_FACTORS_VNUM(binning) - 1 ) /
+		      V4L2_BINNING_FACTORS_VNUM(binning));
+	ret = __v4l2_ctrl_modify_range(imx219->vblank,
+				       vblank_min,
+				       IMX219_FLL_MAX - source_format->height,
+				       1, vblank_min);
+	if (ret)
+		return ret;
+
+	int llp_min = imx219_binnings[index].llp_min;
+	ret = __v4l2_ctrl_modify_range(imx219->llp, llp_min, IMX219_LLP_MAX, 1,
+				       llp_min);
+	if (ret)
+		return ret;
+
+	return __v4l2_ctrl_modify_range(imx219->hblank,
+					llp_min - (int)source_format->width,
+					IMX219_LLP_MAX -
+					(int)source_format->width, 1,
+					llp_min - (int)source_format->width);
+}
+
+/* Do not copy this function to other drivers, make it generic instead. */
+static int imx219_fll_llp_set(struct imx219 *imx219,
+			      const struct v4l2_mbus_framefmt *format,
+			      struct v4l2_ctrl *src)
+{
+	struct v4l2_ctrl *dest;
+	s32 val;
+	int ret;
+
+	/* Was setting the control user-initiated or were we called again? */
+	if (imx219->setting_ctrl) {
+		imx219->setting_ctrl = false;
+		return 0;
+	}
+
+	/* We're being called for applying a value to register, bail out now. */
+	if (src->val == src->cur.val)
+		return 0;
+
+	switch (src->id) {
+	case V4L2_CID_FRAME_LENGTH_LINES:
+		dest = imx219->vblank;
+		val = src->val - format->height;
+		break;
+	case V4L2_CID_VBLANK:
+		dest = imx219->fll;
+		val = src->val + format->height;
+		break;
+	case V4L2_CID_LINE_LENGTH_PIXELS:
+		dest = imx219->hblank;
+		val = src->val - format->width;
+		break;
+	case V4L2_CID_HBLANK:
+		dest = imx219->llp;
+		val = src->val + format->width;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (val == dest->val)
+		return 0;
+
+	imx219->setting_ctrl = true;
+
+	ret = __v4l2_ctrl_s_ctrl(dest, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Only modify exposure range when setting fll, directly or via vblank.
+	 */
+	if (src->id != V4L2_CID_FRAME_LENGTH_LINES &&
+	    dest->id != V4L2_CID_FRAME_LENGTH_LINES)
+		return 0;
+
+	int exposure_max = imx219->fll->val - IMX219_EXPOSURE_OFFSET;
+
+	return __v4l2_ctrl_modify_range(imx219->exposure,
+					imx219->exposure->minimum,
+					exposure_max,
+					imx219->exposure->step,
+					min(exposure_max,
+					    IMX219_EXPOSURE_DEFAULT));
 }
 
 static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -535,22 +639,14 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 					      IMX219_STREAM_IMAGE);
 
 	switch (ctrl->id) {
-	case V4L2_CID_VBLANK: {
-		int exposure_max, exposure_def;
-
-		/* Update max exposure while meeting expected vblanking */
-		exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
-		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
-				exposure_max : IMX219_EXPOSURE_DEFAULT;
-		ret = __v4l2_ctrl_modify_range(imx219->exposure,
-					       imx219->exposure->minimum,
-					       exposure_max,
-					       imx219->exposure->step,
-					       exposure_def);
+	case V4L2_CID_FRAME_LENGTH_LINES:
+	case V4L2_CID_VBLANK:
+	case V4L2_CID_LINE_LENGTH_PIXELS:
+	case V4L2_CID_HBLANK:
+		ret = imx219_fll_llp_set(imx219, format, ctrl);
 		if (ret)
 			return ret;
 		break;
-	}
 	case V4L2_CID_BINNING_FACTORS: {
 		struct v4l2_rect *crop =
 			v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
@@ -558,15 +654,9 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		if (imx219->streams_enabled)
 			return -EBUSY;
 
-		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
-			  imx219_binnings[ctrl->val].h, &ret);
-		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
-			  imx219_binnings[ctrl->val].v, &ret);
-
-		if (ctrl->val != ctrl->cur.val)
-			imx219_apply_binning(state, crop, ctrl->val);
-
-		return 0;
+		ret = imx219_apply_binning(imx219, state, crop, ctrl->val);
+		if (ret)
+			return ret;
 	}
 	}
 
@@ -599,13 +689,22 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(imx219->regmap, IMX219_REG_ORIENTATION,
 			  imx219->hflip->val | imx219->vflip->val << 1, &ret);
 		break;
-	case V4L2_CID_VBLANK:
-		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
-			  format->height + ctrl->val, &ret);
+	case V4L2_CID_FRAME_LENGTH_LINES:
+		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A, ctrl->val,
+			  &ret);
 		break;
+	case V4L2_CID_LINE_LENGTH_PIXELS:
+		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A, ctrl->val,
+			  &ret);
+		break;
+	case V4L2_CID_VBLANK:
 	case V4L2_CID_HBLANK:
-		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
-			  format->width + ctrl->val, &ret);
+		break;
+	case V4L2_CID_BINNING_FACTORS:
+		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
+			  imx219_binnings[ctrl->val].h, &ret);
+		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
+			  imx219_binnings[ctrl->val].v, &ret);
 		break;
 	case V4L2_CID_TEST_PATTERN_RED:
 		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
@@ -680,10 +779,19 @@ static int imx219_init_controls(struct imx219 *imx219)
 		imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* Initial blanking and exposure. Limits are updated during set_fmt */
+	imx219->fll = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+					V4L2_CID_FRAME_LENGTH_LINES,
+					IMX219_VISIBLE_HEIGHT +
+					IMX219_VBLANK_MIN, IMX219_FLL_MAX, 1,
+					mode->fll_def);
 	imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
 					   IMX219_FLL_MAX - mode->height, 1,
 					   mode->fll_def - mode->height);
+	imx219->llp = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+					V4L2_CID_LINE_LENGTH_PIXELS,
+					IMX219_LLP_MIN, IMX219_LLP_MAX, 1,
+					IMX219_LLP_MIN);
 	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_HBLANK,
 					   IMX219_LLP_MIN - mode->width,
@@ -762,6 +870,11 @@ static int imx219_init_controls(struct imx219 *imx219)
 		goto error;
 	}
 
+	imx219->fll->flags |= V4L2_CTRL_FLAG_UPDATE;
+	imx219->vblank->flags |= V4L2_CTRL_FLAG_UPDATE;
+	imx219->llp->flags |= V4L2_CTRL_FLAG_UPDATE;
+	imx219->hblank->flags |= V4L2_CTRL_FLAG_UPDATE;
+
 	ret = v4l2_fwnode_device_parse(&client->dev, &props);
 	if (ret)
 		goto error;
@@ -1127,23 +1240,34 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 	crop->top = (IMX219_PIXEL_ARRAY_HEIGHT - crop->height) / 2;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		int llp_min;
+		unsigned int binning = bin_hv == 1 ?
+			IMX219_BINNING_11 : IMX219_BINNING_22;
 		int pixel_rate;
 
-		ret = __v4l2_ctrl_s_ctrl(imx219->binning, bin_hv == 1 ?
-					 IMX219_BINNING_11 : IMX219_BINNING_22);
+		ret = __v4l2_ctrl_s_ctrl(imx219->binning, binning);
+		if (ret)
+			return ret;
+
+		ret = imx219_apply_binning(imx219, state, crop, binning);
 		if (ret)
 			return ret;
 
 		/* Update limits and set FPS to default */
 		ret = __v4l2_ctrl_modify_range(imx219->vblank,
-					       (int)(mode->height / bin_hv),
-					       IMX219_FLL_MAX - mode->height, 1,
+					       imx219->vblank->minimum,
+					       imx219->vblank->maximum, 1,
 					       (int)(mode->fll_def / bin_hv) -
 					       (int)mode->height);
 		if (ret)
 			return ret;
 
+		ret = __v4l2_ctrl_modify_range(imx219->fll,
+					       imx219->fll->minimum,
+					       imx219->fll->maximum, 1,
+					       (int)(mode->fll_def / bin_hv));
+		if (ret)
+			return ret;
+
 		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
 					 (int)(mode->fll_def / bin_hv) -
 					 (int)mode->height);
@@ -1156,17 +1280,9 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 		 * operates on two lines together. So we switch to a higher
 		 * minimum of 3560.
 		 */
-		llp_min = imx219_binnings[imx219->binning->val].h ==
-			IMX219_BINNING_X2_ANALOG ?
-			IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
-		ret = __v4l2_ctrl_modify_range(imx219->hblank,
-					       llp_min - mode->width,
-					       IMX219_LLP_MAX - mode->width, 1,
-					       llp_min - mode->width);
-		if (ret)
-			return ret;
-
-		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, llp_min - mode->width);
+		ret = __v4l2_ctrl_s_ctrl(imx219->hblank,
+					 imx219_binnings[binning].llp_min -
+					 mode->width);
 		if (ret)
 			return ret;
 
@@ -1293,8 +1409,12 @@ static int imx219_set_selection(struct v4l2_subdev *sd,
 		struct imx219 *imx219 = to_imx219(sd);
 		struct v4l2_rect *crop =
 			v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
+		int ret;
 
-		imx219_apply_binning(state, &sel->r, imx219->binning->val);
+		ret = imx219_apply_binning(imx219, state, &sel->r,
+					   imx219->binning->val);
+		if (ret)
+			return ret;
 
 		*crop = sel->r;
 
-- 
2.47.3


