Return-Path: <linux-media+bounces-58378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONobNhMJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5503CF45D
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00F93302D5EB
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA6D33B6FC;
	Thu,  9 Apr 2026 20:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OK7eX8VD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADB6331211
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765705; cv=none; b=Ps9/FtTTWaWef5qSbkVL4PIsSJ9fUJpNiN2nwPgxS2XK6RaLrJuJ4rejHXKGTGsLjamSTOv8j6G6gcp22ZCsxdDf6H2wLR+JfWSd9OcEbPBP3DX1lw7UbDyTjFvO4d06k3AwD5vZCKqZ1rJSLcKIxeF+OM5MymHvaqseh849EkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765705; c=relaxed/simple;
	bh=zNUMqOPS437w2tYslbJjGYGQDmZDhBWIBvcIflx771c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxnXsvShoOQWHsf84asYb8i5km4FEnB3QDu9pri6OwUfMVwQZJdI7WndQex3XiYXyRANZlyuTXCSQZMF+67mVAY3KtSJzflpbLYJk5lA62fR/MxTsfcxxjmjkAnEmGMGeIBaBdqqZ4QTVoBRvARbaNMkTXwq8gPiX0WUteXlrO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OK7eX8VD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765704; x=1807301704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zNUMqOPS437w2tYslbJjGYGQDmZDhBWIBvcIflx771c=;
  b=OK7eX8VDH4qU8UqZsiySKj46VCVIIjvfNCnujA3U8mcRk2suQ78NsMmu
   EY/jjncfsd0vBgSNfLmGz45OsNDgWekDUn5cXTybVsYjpqi0TaEIf7q4j
   24SNfLbwy1wJmkqlo8fH9lzeYGzvUu5yUErlbY7jUEarjyZGwnxht7G5a
   ogjg8MFfwnufsVCpGtlruv28v2G+upJKUDCuOsdUcbjnw2SShTN985yq2
   Uvb/JXs2bryotiX7ZAPwkLqC+0tnwLLmLilMEua2mL68irNI8488Y0R6D
   uHbnu6IGyFvMMMVUxUBloSb5ZMjEq54ASsw+lp2FfZNg3chXk8CpbQ56L
   w==;
X-CSE-ConnectionGUID: lKFiyUs8TkSwZA+f84PQcA==
X-CSE-MsgGUID: yO+V+tU2Sl+M/PUJzLRdig==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408529"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408529"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:02 -0700
X-CSE-ConnectionGUID: 9njL5F6eStuCpqTHHaFGXQ==
X-CSE-MsgGUID: qMfF0EHWTdSXIDa/mbdsAA==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:14:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0A3F8121CF1;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045oL-25rh;
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
Subject: [PATCH v12 56/86] media: imx219: Add internal pads, routes for common raw sensor model
Date: Thu,  9 Apr 2026 23:14:31 +0300
Message-ID: <20260409201501.975242-57-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58378-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E5503CF45D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Support internal pads, routing, formats and selections for the newly added
common raw sensor model, with compatibility interface provided for the
existing users.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 230 +++++++++++++++++++++++++++----------
 1 file changed, 171 insertions(+), 59 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 67b02fa338d0..b4aa62cbb826 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -139,13 +139,19 @@
 #define IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED	363000000
 #define IMX219_DEFAULT_LINK_FREQ_4LANE	364000000
 
+/* For compatibility with the old UAPI. */
+#define IMX219_COMPAT_VISIBLE_TOP	8U
 /* IMX219 native and active pixel array size. */
-#define IMX219_NATIVE_WIDTH		3296U
-#define IMX219_NATIVE_HEIGHT		2480U
+#define IMX219_NON_VISIBLE_HEIGHT	42U
 #define IMX219_VISIBLE_LEFT		8U
-#define IMX219_VISIBLE_TOP		8U
+#define IMX219_VISIBLE_TOP		(IMX219_NON_VISIBLE_HEIGHT + 8U)
 #define IMX219_VISIBLE_WIDTH		3280U
 #define IMX219_VISIBLE_HEIGHT		2464U
+#define IMX219_PIXEL_ARRAY_LEFT		0U
+#define IMX219_PIXEL_ARRAY_TOP		IMX219_NON_VISIBLE_HEIGHT
+#define IMX219_PIXEL_ARRAY_WIDTH	3296U
+#define IMX219_PIXEL_ARRAY_HEIGHT	2480U
+#define IMX219_NATIVE_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
 
 /* Mode : resolution and related config&values */
 struct imx219_mode {
@@ -335,9 +341,15 @@ static const struct imx219_mode supported_modes[] = {
 	},
 };
 
+enum imx219_pad_ids {
+	IMX219_PAD_SOURCE = 0,
+	IMX219_PAD_IMAGE,
+	IMX219_NUM_PADS,
+};
+
 struct imx219 {
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[IMX219_NUM_PADS];
 
 	struct regmap *regmap;
 	struct clk *xclk; /* system clock to IMX219 */
@@ -405,8 +417,9 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
 			       u8 *bin_v)
 {
 	const struct v4l2_mbus_framefmt *format =
-		v4l2_subdev_state_get_format(state, 0);
-	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	const struct v4l2_rect *crop =
+		v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
 	u32 hbin = crop->width / format->width;
 	u32 vbin = crop->height / format->height;
 
@@ -434,7 +447,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
-	format = v4l2_subdev_state_get_format(state, 0);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
@@ -659,8 +672,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	u32 bpp;
 	int ret = 0;
 
-	format = v4l2_subdev_state_get_format(state, 0);
-	crop = v4l2_subdev_state_get_crop(state, 0);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 	bpp = imx219_get_format_bpp(format);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
@@ -787,10 +800,25 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
-		return -EINVAL;
+	if (code->pad == IMX219_PAD_IMAGE) {
+		/* The internal image pad is hardwired to the native format. */
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = IMX219_NATIVE_FORMAT;
+	} else {
+		/*
+		 * On the source pad, the sensor supports multiple raw formats
+		 * with different bit depths.
+		 */
+		u32 format;
 
-	code->code = imx219_get_format_code(imx219, imx219_mbus_formats[code->index * 4]);
+		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
+			return -EINVAL;
+
+		format = imx219_mbus_formats[code->index * 4];
+		code->code = imx219_get_format_code(imx219, format);
+	}
 
 	return 0;
 }
@@ -800,27 +828,32 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx219 *imx219 = to_imx219(sd);
-	u32 code;
-
-	if (fse->index >= ARRAY_SIZE(supported_modes))
-		return -EINVAL;
 
-	code = imx219_get_format_code(imx219, fse->code);
-	if (fse->code != code)
-		return -EINVAL;
+	if (fse->pad == IMX219_PAD_IMAGE) {
+		if (fse->code != IMX219_NATIVE_FORMAT || fse->index > 0)
+			return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = fse->min_height;
+		fse->min_width = IMX219_PIXEL_ARRAY_WIDTH;
+		fse->max_width = IMX219_PIXEL_ARRAY_WIDTH;
+		fse->min_height = IMX219_PIXEL_ARRAY_HEIGHT;
+		fse->max_height = IMX219_PIXEL_ARRAY_HEIGHT;
+	} else {
+		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
+		    fse->index >= ARRAY_SIZE(supported_modes))
+			return -EINVAL;
+
+		fse->min_width = supported_modes[fse->index].width;
+		fse->max_width = fse->min_width;
+		fse->min_height = supported_modes[fse->index].height;
+		fse->max_height = fse->min_height;
+	}
 
 	return 0;
 }
 
-static int imx219_set_pad_format(struct v4l2_subdev *sd,
-				 const struct v4l2_subdev_client_info *ci,
-				 struct v4l2_subdev_state *state,
-				 struct v4l2_subdev_format *fmt)
+static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_format *fmt)
 {
 	struct imx219 *imx219 = to_imx219(sd);
 	const struct imx219_mode *mode;
@@ -829,7 +862,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	u8 bin_h, bin_v, bin_hv;
 	int ret;
 
-	format = v4l2_subdev_state_get_format(state, 0);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
 
 	/*
 	 * Adjust the requested format to match the closest mode. The Bayer
@@ -861,11 +894,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
 	bin_hv = min(bin_h, bin_v);
 
-	crop = v4l2_subdev_state_get_crop(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
 	crop->width = format->width * bin_hv;
 	crop->height = format->height * bin_hv;
-	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
-	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
+	crop->left = (IMX219_PIXEL_ARRAY_WIDTH - crop->width) / 2;
+	crop->top = (IMX219_PIXEL_ARRAY_HEIGHT - crop->height) / 2;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		int llp_min;
@@ -917,51 +950,129 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct imx219 *imx219 = to_imx219(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	if (!(ci && ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR))
+		return imx219_set_pad_format_compat(sd, state, fmt);
+
+	if (fmt->pad != IMX219_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, ci, state, fmt);
+
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+
+	format->code = fmt->format.code =
+		imx219_get_format_code(imx219, fmt->format.code);
+
+	return 0;
+}
+
 static int imx219_get_selection(struct v4l2_subdev *sd,
 				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
-	switch (sel->target) {
-	case V4L2_SEL_TGT_CROP:
-		sel->r = *v4l2_subdev_state_get_crop(state, 0);
-		return 0;
+	if (!(ci &&
+	      ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR)) {
+		if (sel->pad != IMX219_PAD_SOURCE)
+			return -EINVAL;
+
+		switch (sel->target) {
+		case V4L2_SEL_TGT_CROP:
+			sel->r = *v4l2_subdev_state_get_crop(state,
+							     IMX219_PAD_IMAGE);
+			sel->r.top -= IMX219_VISIBLE_TOP;
+			return 0;
+
+		case V4L2_SEL_TGT_NATIVE_SIZE:
+			sel->r.top = 0;
+			sel->r.left = 0;
+			sel->r.width = IMX219_VISIBLE_WIDTH;
+			sel->r.height = IMX219_VISIBLE_HEIGHT;
+
+			return 0;
+
+		case V4L2_SEL_TGT_CROP_DEFAULT:
+		case V4L2_SEL_TGT_CROP_BOUNDS:
+			sel->r.top = IMX219_COMPAT_VISIBLE_TOP;
+			sel->r.left = IMX219_VISIBLE_LEFT;
+			sel->r.width = IMX219_VISIBLE_WIDTH;
+			sel->r.height = IMX219_VISIBLE_HEIGHT;
+
+			return 0;
+		}
 
-	case V4L2_SEL_TGT_NATIVE_SIZE:
-		sel->r.top = 0;
-		sel->r.left = 0;
-		sel->r.width = IMX219_NATIVE_WIDTH;
-		sel->r.height = IMX219_NATIVE_HEIGHT;
+		return -EINVAL;
+	}
 
-		return 0;
+	if (sel->pad != IMX219_PAD_IMAGE)
+		return -EINVAL;
 
-	case V4L2_SEL_TGT_CROP_DEFAULT:
+	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		sel->r.top = IMX219_VISIBLE_TOP;
 		sel->r.left = IMX219_VISIBLE_LEFT;
 		sel->r.width = IMX219_VISIBLE_WIDTH;
 		sel->r.height = IMX219_VISIBLE_HEIGHT;
-
 		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = IMX219_VISIBLE_TOP;
+		sel->r.left = IMX219_VISIBLE_LEFT;
+		sel->r.width = IMX219_VISIBLE_WIDTH;
+		sel->r.height = IMX219_VISIBLE_HEIGHT;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
+		return 0;
+	case V4L2_SEL_TGT_COMPOSE:
+		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
+		return 0;
+	default:
+		return -EINVAL;
 	}
-
-	return -EINVAL;
 }
 
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-		.pad = 0,
-		.format = {
-			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
-			.width = supported_modes[0].width,
-			.height = supported_modes[0].height,
-		},
-	};
+	struct v4l2_mbus_framefmt *pixel_array_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_IMAGE);
+	struct v4l2_rect *analogue_crop =
+		v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
+	struct v4l2_rect *compose =
+		v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
+	struct v4l2_mbus_framefmt *source_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+
+	/* The image pad models the pixel array, and thus has a fixed format. */
+	pixel_array_format->code = MEDIA_BUS_FMT_RAW_10;
+	pixel_array_format->width = IMX219_VISIBLE_WIDTH;
+	pixel_array_format->height = IMX219_VISIBLE_HEIGHT;
+	pixel_array_format->field = V4L2_FIELD_NONE;
+	pixel_array_format->colorspace = V4L2_COLORSPACE_RAW;
+	pixel_array_format->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	pixel_array_format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	pixel_array_format->xfer_func = V4L2_XFER_FUNC_NONE;
+
+	analogue_crop->top = IMX219_VISIBLE_TOP;
+	analogue_crop->left = IMX219_VISIBLE_LEFT;
+	analogue_crop->width = IMX219_VISIBLE_WIDTH;
+	analogue_crop->height = IMX219_VISIBLE_HEIGHT;
+
+	compose->width = analogue_crop->width;
+	compose->height = analogue_crop->height;
+
+	*source_format = *pixel_array_format;
+	source_format->code = IMX219_NATIVE_FORMAT;
+	source_format->width = compose->width;
+	source_format->height = compose->height;
 
-	return imx219_set_pad_format(sd, NULL, state, &fmt);
+	return 0;
 }
 
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
@@ -1228,14 +1339,15 @@ static int imx219_probe(struct i2c_client *client)
 	if (ret)
 		goto error_power_off;
 
-	/* Initialize subdev */
 	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-	/* Initialize source pad */
-	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
+	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	imx219->pads[IMX219_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
+					     | MEDIA_PAD_FL_INTERNAL;
 
-	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
+	ret = media_entity_pads_init(&imx219->sd.entity,
+				     ARRAY_SIZE(imx219->pads), imx219->pads);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to init entity pads\n");
 		goto error_handler_free;
-- 
2.47.3


