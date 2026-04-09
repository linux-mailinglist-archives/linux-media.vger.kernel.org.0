Return-Path: <linux-media+bounces-58383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAwKOt0I2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1823CF3D9
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA6E53016D39
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98B02BE7DD;
	Thu,  9 Apr 2026 20:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZDr++yy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EDE33B970
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765708; cv=none; b=UVpT6oLnue3AmdOMuO6aNdTwPWhF/RBmNXQ6pgEsINSinqvhQiwXESqsgmB8Ouba3frgfDphbI98+KJtpcpBpbaiPENrrDCYDNa34DkqeCnOA5U6smkLQ7klj4AJCBCHvPQP5zLazXf4rxd3HpIfkpm3/mshs/aSvNOXIDJHyK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765708; c=relaxed/simple;
	bh=w9JRucs0aPBvNDj/qb1ZTiCqMog0UWGNI5Sag6lVj7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoZPtmUMlt1GnX+kIv9osUkhqW2A2m6noyj//wOBMIF3nfYpysTrVSOBYHAFnIOw4bAKxqAxqYZogL+9MBKAbSEDGxncCPK8dNGiAdncThtVgr2ZzmDIHXoBbWxZqWBRAR5mpCAbu6rP0o6N85FFbiNIXRTSfciIbj4zPb3XELI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZDr++yy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765707; x=1807301707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w9JRucs0aPBvNDj/qb1ZTiCqMog0UWGNI5Sag6lVj7c=;
  b=kZDr++yygxaf5+7ny4fXZ2Tf1VgtIeEY5+Cmtz5C4wCXjvo600zfaImC
   9BewZQ6W2Jv0pdyyE24edPkxe78vsdWTNRD4QhFKLUUjwy6rLMA6zhcjW
   Wl2Kh1bxZWP3On8kHZmuL27JdNhv2Kui4UPQkYJ/zvB9E+vg3FE6Y5t7i
   mshUsq4u66IVGDEKChoh+3/7lNY/kinIa0zGPNZtZlprq2+A2vzBZp58a
   Yfd9IjHWhRigmIawyBzC7KKJ+MPAncM/aW+Q6ZfEGFogCGdqTZdgMaPUZ
   TExDnOFcGDDtmvhuXarB0hXM+JkFUuG+xk58grnefZ1elaKeT3B5xqG85
   A==;
X-CSE-ConnectionGUID: k6ubCdcZRkyX4+MRBpqrzw==
X-CSE-MsgGUID: NlTXLgGWQTyaQ6shPl3pVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408587"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408587"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:02 -0700
X-CSE-ConnectionGUID: f1/0artzT7eZdHgUF3driQ==
X-CSE-MsgGUID: PQRVjm0tR8S4Wr08ERzEqQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:14:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 24358121D27;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045ou-2YMX;
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
Subject: [PATCH v12 63/86] media: imx219: Allow configuring cropping and binning through CRSM
Date: Thu,  9 Apr 2026 23:14:38 +0300
Message-ID: <20260409201501.975242-64-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58383-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B1823CF3D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the configuration of cropping and binning through the Common Raw
Sensor Model. Also change the minimum embedded data line length the same
as that of the output pixel data line.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 104 +++++++++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7ed53810f941..591feb3d539f 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -154,6 +154,9 @@
 #define IMX219_PIXEL_ARRAY_HEIGHT	2480U
 #define IMX219_NATIVE_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
 
+#define IMX219_OUTPUT_X_SIZE_MIN	0x100
+#define IMX219_OUTPUT_Y_SIZE_MIN	0x100
+
 /* Embedded metadata stream height */
 #define IMX219_EMBEDDED_DATA_HEIGHT	2U
 
@@ -479,6 +482,45 @@ static const s64 imx219_binning_factors[] = {
 	[IMX219_BINNING_22] = V4L2_BINNING_FACTORS_MAKE(2, 1, 2, 1),
 };
 
+static void imx219_apply_binning(struct v4l2_subdev_state *state,
+				 struct v4l2_rect *crop, unsigned int index)
+{
+	struct v4l2_rect *compose =
+		v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
+	struct v4l2_mbus_framefmt *source_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					     IMX219_STREAM_IMAGE);
+	struct v4l2_mbus_framefmt *embedded_source_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					     IMX219_STREAM_EDATA);
+	s64 binning = imx219_binning_factors[index];
+
+	crop->width = clamp(crop->width, IMX219_OUTPUT_X_SIZE_MIN *
+			    V4L2_BINNING_FACTORS_HNUM(binning),
+			    IMX219_VISIBLE_WIDTH) & ~1;
+	crop->height = clamp(crop->height, IMX219_OUTPUT_Y_SIZE_MIN *
+			     V4L2_BINNING_FACTORS_VNUM(binning),
+			     IMX219_VISIBLE_HEIGHT) & ~1;
+	crop->left = clamp((unsigned int)crop->left, IMX219_VISIBLE_LEFT,
+			   IMX219_VISIBLE_LEFT + IMX219_VISIBLE_WIDTH -
+			   crop->width);
+	crop->top = clamp((unsigned int)crop->top, IMX219_VISIBLE_TOP,
+			  IMX219_VISIBLE_TOP + IMX219_VISIBLE_HEIGHT -
+			  crop->height);
+
+	compose->width = crop->width / V4L2_BINNING_FACTORS_HNUM(binning);
+	compose->height = crop->height / V4L2_BINNING_FACTORS_VNUM(binning);
+
+	source_format->width = compose->width;
+	source_format->height = compose->height;
+
+	struct v4l2_mbus_framefmt *embedded_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_EDATA);
+
+	embedded_format->width =
+		embedded_source_format->width = source_format->width;
+}
+
 static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx219 *imx219 =
@@ -509,9 +551,24 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 			return ret;
 		break;
 	}
-	case V4L2_CID_BINNING_FACTORS:
+	case V4L2_CID_BINNING_FACTORS: {
+		struct v4l2_rect *crop =
+			v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
+
+		if (imx219->streams_enabled)
+			return -EBUSY;
+
+		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
+			  imx219_binnings[ctrl->val].h, &ret);
+		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
+			  imx219_binnings[ctrl->val].v, &ret);
+
+		if (ctrl->val != ctrl->cur.val)
+			imx219_apply_binning(state, crop, ctrl->val);
+
 		return 0;
 	}
+	}
 
 	/*
 	 * Applying V4L2 control value only happens
@@ -705,8 +762,6 @@ static int imx219_init_controls(struct imx219 *imx219)
 		goto error;
 	}
 
-	imx219->binning->flags = V4L2_CTRL_FLAG_READ_ONLY;
-
 	ret = v4l2_fwnode_device_parse(&client->dev, &props);
 	if (ret)
 		goto error;
@@ -775,11 +830,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_VISIBLE_TOP + crop->height - 1, &ret);
 
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
-		  imx219_binnings[imx219->binning->val].h, &ret);
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
-		  imx219_binnings[imx219->binning->val].v, &ret);
-
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);
 	cci_write(imx219->regmap, IMX219_REG_Y_OUTPUT_SIZE,
@@ -981,7 +1031,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 		if (fse->code != MEDIA_BUS_FMT_META_8 || fse->index > 0)
 			return -EINVAL;
 
-		fse->min_width = IMX219_VISIBLE_WIDTH;
+		fse->min_width = IMX219_OUTPUT_X_SIZE_MIN;
 		fse->max_width = IMX219_VISIBLE_WIDTH;
 		fse->min_height = IMX219_EMBEDDED_DATA_HEIGHT;
 		fse->max_height = IMX219_EMBEDDED_DATA_HEIGHT;
@@ -1223,6 +1273,41 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
+static int imx219_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	if (!(ci && ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR))
+		return -EINVAL;
+
+	/*
+	 * The embedded data stream doesn't support selection rectangles,
+	 * neither on the embedded data pad nor on the source pad.
+	 */
+	if (sel->pad != IMX219_PAD_IMAGE || sel->stream != IMX219_STREAM_IMAGE)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		struct imx219 *imx219 = to_imx219(sd);
+		struct v4l2_rect *crop =
+			v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
+
+		imx219_apply_binning(state, &sel->r, imx219->binning->val);
+
+		*crop = sel->r;
+
+		return 0;
+	}
+	case V4L2_SEL_TGT_COMPOSE:
+		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
@@ -1347,6 +1432,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
+	.set_selection = imx219_set_selection,
 	.enum_frame_size = imx219_enum_frame_size,
 	.get_frame_desc = imx219_get_frame_desc,
 	.enable_streams = imx219_enable_streams,
-- 
2.47.3


