Return-Path: <linux-media+bounces-58380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFI5FB8J2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A723CF479
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F16AC303132B
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344543368BF;
	Thu,  9 Apr 2026 20:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Blf/nvUK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F233093C6
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765706; cv=none; b=EAqYSfCmK6EjsfHKSkhl62C+E2jTL2tIB+vibVAQKi2YtI4ZSulCvtt0wKBMTpNKO/bByTR7U15RCq8BesGr9A7+Hh3fFt1ASmrJ5XuDeFPRkCtU6zHDig6b/AxWoadxPoSoSj2mNU6kUJcV8AvZLUTQww1RDeSxgoP2qqqS7lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765706; c=relaxed/simple;
	bh=aZGcUp5KkCtk3vITTF5BRApL969qn2zAhbCj6OTvxn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovMWoA7awp76uVOqPl8P4bL3mOyZ/R3B0quxtjah4hDt7ahnmSg/E6t/7PTbbDfR+wQHTMPMIB95w9koPy4I6DBtGXjuEQtN+oOeCTEnB+X4bFUamo6P52bQhOuLG2D9K8P4gESNWDPi1qo8TyQbEpaAua3cmpraCNgisk9IUqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Blf/nvUK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765705; x=1807301705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZGcUp5KkCtk3vITTF5BRApL969qn2zAhbCj6OTvxn4=;
  b=Blf/nvUKZBKSpZGscQFZbHRUyQ0Ye7veXhZpYbZT33KsKcI4GK/UH5qc
   EbL3S+NarE6SHy8UUD4QdSGFDUXuU6rj+lFeB4Yu1EI7mxsI0RJwJjgSc
   F3Qcq5hzlB8PG/VkFvj+vhbtoEy5+60kCSK64QgUVbslx8yVIxyemYfaq
   JC/h8nOJpZyL1Kb179bSKxX2xDBbWKCnpc85EFYAORvVRbyGIqcJIROHE
   9YXA69kvpnC+51sBEw4JDkTaBtNK2oXv9wx/9iMxkBLTJ5X0nrmZ+XKBv
   zVqkP2ZGlqkSyS61chjstPnyj0nz5eM+Rr6yZckuBzXHnMW2GLHPvcCeK
   w==;
X-CSE-ConnectionGUID: G2XiDyHgRXCt6LWALoXtng==
X-CSE-MsgGUID: uv3x1kJYQbWNiuLEr13eCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408552"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408552"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:02 -0700
X-CSE-ConnectionGUID: DXdfCrLcTf+VtpXtL9092g==
X-CSE-MsgGUID: KL5LxZt2SGmZWs6+jKoWhA==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:14:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 18092121D20;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045of-2Lgm;
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
Subject: [PATCH v12 60/86] media: imx219: Add embedded data support
Date: Thu,  9 Apr 2026 23:14:35 +0300
Message-ID: <20260409201501.975242-61-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58380-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: C6A723CF479
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The IMX219 generates embedded data unconditionally. Report it as an
additional stream, with a new internal embedded data pad, and update
subdev operations accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 187 +++++++++++++++++++++++++++++++------
 1 file changed, 161 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index d695987839e4..e744b96a08f6 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -154,6 +154,9 @@
 #define IMX219_PIXEL_ARRAY_HEIGHT	2480U
 #define IMX219_NATIVE_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
 
+/* Embedded metadata stream height */
+#define IMX219_EMBEDDED_DATA_HEIGHT	2U
+
 /* Mode : resolution and related config&values */
 struct imx219_mode {
 	/* Frame width */
@@ -345,11 +348,13 @@ static const struct imx219_mode supported_modes[] = {
 enum imx219_pad_ids {
 	IMX219_PAD_SOURCE = 0,
 	IMX219_PAD_IMAGE,
+	IMX219_PAD_EDATA,
 	IMX219_NUM_PADS,
 };
 
 enum imx219_stream_ids {
 	IMX219_STREAM_IMAGE,
+	IMX219_STREAM_EDATA,
 };
 
 struct imx219 {
@@ -375,6 +380,8 @@ struct imx219 {
 
 	/* Two or Four lanes */
 	u8 lanes;
+
+	u64 streams_enabled;
 };
 
 static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
@@ -418,6 +425,25 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
 	}
 }
 
+static u32
+imx219_get_embedded_format_code(const struct v4l2_mbus_framefmt *format)
+{
+	switch (format->code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		return MEDIA_BUS_FMT_META_8;
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	default:
+		return MEDIA_BUS_FMT_META_10;
+	}
+}
+
 static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
 			       u8 *bin_v)
 {
@@ -749,6 +775,15 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	int ret;
 
+	/*
+	 * The image stream controls sensor streaming, as embedded data isn't
+	 * controllable independently.
+	 */
+	if (imx219->streams_enabled) {
+		imx219->streams_enabled |= streams_mask;
+		return 0;
+	}
+
 	ret = pm_runtime_resume_and_get(&client->dev);
 	if (ret < 0)
 		return ret;
@@ -791,6 +826,8 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
 	__v4l2_ctrl_grab(imx219->vflip, true);
 	__v4l2_ctrl_grab(imx219->hflip, true);
 
+	imx219->streams_enabled = streams_mask;
+
 	return 0;
 
 err_rpm_put:
@@ -806,6 +843,10 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	int ret;
 
+	imx219->streams_enabled &= ~streams_mask;
+	if (imx219->streams_enabled)
+		return 0;
+
 	/* set stream off register */
 	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
 			IMX219_MODE_STANDBY, NULL);
@@ -826,17 +867,32 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	if (code->pad == IMX219_PAD_IMAGE) {
-		/* The internal image pad is hardwired to the native format. */
+	switch (code->pad) {
+	case IMX219_PAD_IMAGE:
 		if (code->index > 0)
 			return -EINVAL;
 
-		code->code = IMX219_NATIVE_FORMAT;
-	} else {
-		/*
-		 * On the source pad, the sensor supports multiple raw formats
-		 * with different bit depths.
-		 */
+		code->code = MEDIA_BUS_FMT_RAW_10;
+		return 0;
+
+	case IMX219_PAD_EDATA:
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_META_10;
+		return 0;
+
+	case IMX219_PAD_SOURCE:
+	default:
+		break;
+	}
+
+	/*
+	 * On the source pad, the sensor supports multiple image raw formats
+	 * with different bit depths. The embedded data format bit depth
+	 * follows the image stream.
+	 */
+	if (code->stream == IMX219_STREAM_IMAGE) {
 		u32 format;
 
 		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
@@ -844,6 +900,15 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 
 		format = imx219_mbus_formats[code->index * 4];
 		code->code = imx219_get_format_code(imx219, format);
+	} else {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+						   IMX219_STREAM_EDATA);
+		code->code = fmt->code;
 	}
 
 	return 0;
@@ -855,15 +920,33 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	if (fse->pad == IMX219_PAD_IMAGE) {
+	switch (fse->pad) {
+	case IMX219_PAD_IMAGE:
 		if (fse->code != IMX219_NATIVE_FORMAT || fse->index > 0)
 			return -EINVAL;
 
-		fse->min_width = IMX219_PIXEL_ARRAY_WIDTH;
-		fse->max_width = IMX219_PIXEL_ARRAY_WIDTH;
-		fse->min_height = IMX219_PIXEL_ARRAY_HEIGHT;
-		fse->max_height = IMX219_PIXEL_ARRAY_HEIGHT;
-	} else {
+		fse->min_width = IMX219_VISIBLE_WIDTH;
+		fse->max_width = IMX219_VISIBLE_WIDTH;
+		fse->min_height = IMX219_VISIBLE_HEIGHT;
+		fse->max_height = IMX219_VISIBLE_HEIGHT;
+		return 0;
+
+	case IMX219_PAD_EDATA:
+		if (fse->code != MEDIA_BUS_FMT_META_8 || fse->index > 0)
+			return -EINVAL;
+
+		fse->min_width = IMX219_VISIBLE_WIDTH;
+		fse->max_width = IMX219_VISIBLE_WIDTH;
+		fse->min_height = IMX219_EMBEDDED_DATA_HEIGHT;
+		fse->max_height = IMX219_EMBEDDED_DATA_HEIGHT;
+		return 0;
+
+	case IMX219_PAD_SOURCE:
+	default:
+		break;
+	}
+
+	if (fse->stream == IMX219_STREAM_IMAGE) {
 		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
 		    fse->index >= ARRAY_SIZE(supported_modes))
 			return -EINVAL;
@@ -872,6 +955,21 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 		fse->max_width = fse->min_width;
 		fse->min_height = supported_modes[fse->index].height;
 		fse->max_height = fse->min_height;
+	} else {
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+						   IMX219_STREAM_EDATA);
+		if (fse->code != fmt->code)
+			return -EINVAL;
+
+		if (fse->index > 0)
+			return -EINVAL;
+
+		fse->min_width = fmt->width;
+		fse->max_width = fmt->width;
+		fse->min_height = IMX219_EMBEDDED_DATA_HEIGHT;
+		fse->max_height = IMX219_EMBEDDED_DATA_HEIGHT;
 	}
 
 	return 0;
@@ -883,13 +981,16 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 	const struct imx219_mode *mode;
-	struct v4l2_mbus_framefmt *format;
+	struct v4l2_mbus_framefmt *format, *embedded_format;
 	struct v4l2_rect *crop;
 	u8 bin_h, bin_v, bin_hv;
 	int ret;
 
 	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
 					      IMX219_STREAM_IMAGE);
+	embedded_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					     IMX219_STREAM_EDATA);
 
 	/*
 	 * Adjust the requested format to match the closest mode. The Bayer
@@ -911,6 +1012,8 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 
 	*format = fmt->format;
 
+	embedded_format->code = imx219_get_embedded_format_code(format);
+
 	/*
 	 * Use binning to maximize the crop rectangle size, and centre it in the
 	 * sensor.
@@ -988,7 +1091,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	if (!(ci && ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR))
 		return imx219_set_pad_format_compat(sd, state, fmt);
 
-	if (fmt->pad != IMX219_PAD_SOURCE)
+	if (fmt->pad != IMX219_PAD_SOURCE && fmt->stream != IMX219_STREAM_IMAGE)
 		return v4l2_subdev_get_fmt(sd, ci, state, fmt);
 
 	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
@@ -1038,7 +1141,11 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	if (sel->pad != IMX219_PAD_IMAGE)
+	/*
+	 * The embedded data stream doesn't support selection rectangles,
+	 * neither on the embedded data pad nor on the source pad.
+	 */
+	if (sel->pad != IMX219_PAD_IMAGE || sel->stream != IMX219_STREAM_IMAGE)
 		return -EINVAL;
 
 	switch (sel->target) {
@@ -1068,35 +1175,41 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
-	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
-	u32 code;
+	u32 img_code;
+	u32 ed_code;
 
 	if (pad != IMX219_PAD_SOURCE)
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
-					   IMX219_STREAM_IMAGE);
-	code = fmt->code;
+	img_code = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+						IMX219_STREAM_IMAGE)->code;
+	ed_code = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					       IMX219_STREAM_EDATA)->code;
 	v4l2_subdev_unlock_state(state);
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
-	fd->num_entries = 1;
+	fd->num_entries = 2;
 
-	fd->entry[0].pixelcode = code;
+	fd->entry[0].pixelcode = img_code;
 	fd->entry[0].stream = IMX219_STREAM_IMAGE;
 	fd->entry[0].bus.csi2.vc = 0;
-	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8 ?
+	fd->entry[0].bus.csi2.dt = imx219_format_bpp(img_code) == 8 ?
 		MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
 
+	fd->entry[1].pixelcode = ed_code;
+	fd->entry[1].stream = IMX219_STREAM_EDATA;
+	fd->entry[1].bus.csi2.vc = 0;
+	fd->entry[1].bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+
 	return 0;
 }
 
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
-	struct v4l2_subdev_route routes[1] = {
+	struct v4l2_subdev_route routes[] = {
 		{
 			.sink_pad = IMX219_PAD_IMAGE,
 			.sink_stream = 0,
@@ -1105,6 +1218,14 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
 				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
 				 V4L2_SUBDEV_ROUTE_FL_STATIC,
+		}, {
+			.sink_pad = IMX219_PAD_EDATA,
+			.sink_stream = 0,
+			.source_pad = IMX219_PAD_SOURCE,
+			.source_stream = IMX219_STREAM_EDATA,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
 		},
 	};
 	struct v4l2_subdev_krouting routing = {
@@ -1127,6 +1248,11 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *source_format =
 		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
 					     IMX219_STREAM_IMAGE);
+	struct v4l2_mbus_framefmt *embedded_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_EDATA);
+	struct v4l2_mbus_framefmt *embedded_source_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					     IMX219_STREAM_EDATA);
 
 	/* The image pad models the pixel array, and thus has a fixed format. */
 	pixel_array_format->code = MEDIA_BUS_FMT_RAW_10;
@@ -1151,6 +1277,13 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	source_format->width = compose->width;
 	source_format->height = compose->height;
 
+	embedded_format->code = MEDIA_BUS_FMT_META_10;
+	embedded_format->width = source_format->width;
+	embedded_format->height = IMX219_EMBEDDED_DATA_HEIGHT;
+	embedded_format->field = V4L2_FIELD_NONE;
+
+	*embedded_source_format = *embedded_format;
+
 	return 0;
 }
 
@@ -1426,6 +1559,8 @@ static int imx219_probe(struct i2c_client *client)
 	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 	imx219->pads[IMX219_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
 					     | MEDIA_PAD_FL_INTERNAL;
+	imx219->pads[IMX219_PAD_EDATA].flags = MEDIA_PAD_FL_SINK
+					     | MEDIA_PAD_FL_INTERNAL;
 
 	ret = media_entity_pads_init(&imx219->sd.entity,
 				     ARRAY_SIZE(imx219->pads), imx219->pads);
-- 
2.47.3


