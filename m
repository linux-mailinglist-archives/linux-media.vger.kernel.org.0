Return-Path: <linux-media+bounces-58455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBVKEp4K2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:22:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B40A3CF73C
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CF1E30A3A0A
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14E536AB7B;
	Thu,  9 Apr 2026 20:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GE55CX5Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB88333FE06
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765744; cv=none; b=qHxDPHq8JnWsShFn4ZRLqFXE6pQEVeaoGmdsrRC+YLNqmUUG1L6WF9VjDGM3SGh/2v0O/renvuTls5gzEKUhZJz+Dw7uR8YIIN8uh9KvarKbt0Az9hKed9UAzorcNltkojIXPyGZ6OhYX95l95g7PxhNBjqegU8DHx36DAMnXHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765744; c=relaxed/simple;
	bh=Ep7XC9eI3GwnaBLYyiFahdyJrymy5JnccxU9UXg/e44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfhdjxHYdy6/OmmrkAp4irSLFlswyLqZyBxio+9zl+7OEFZ5qwUOOKce1epACUm9Af7rK3CrbIwE2xRBcHpBveo8sOBwSGFZ6AJrs2Epjo32cZ4HlKHS+3ndW1XLb6dlGJ+6wpWXWaEZ5XOrHi0PmviM6ARazYKC+yNec+PqL08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GE55CX5Q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765743; x=1807301743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ep7XC9eI3GwnaBLYyiFahdyJrymy5JnccxU9UXg/e44=;
  b=GE55CX5QlKb8iijBDJPCCHQtuUhPHkfT2p45f2Muq4OXGwOYds2yYzb/
   kczaXMUcs4/EuxujGIAjQmyVRkAC2tv+k3n5cymdLpsI1gyU9fRuS9FHS
   AqD2fsLuXyC7WB8rnxRx5QeJ5Qu4RjyRmHbYuO9faL0xa+L2sN5Xp0iMI
   /hu1VzOTQ9P9XS5t3Gi0Bw+RT2Yrx1cmQBJAiHM4dyNawP0hwhhj0Ifdu
   Bmq28XNjyFhGLW70waRvzcKBaobscRrndMBHscRDeyFRVJQvff7iohopU
   POhrC3R1GHUmqh8UmaP7EQqWh3sQCYhDVaeGSmlA8SrfDF7/bSJSaheMz
   w==;
X-CSE-ConnectionGUID: dnIxlth9QQy8TmISRdW4hQ==
X-CSE-MsgGUID: 689N1VtwRx2nRaJbVN/RVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176756"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176756"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:34 -0700
X-CSE-ConnectionGUID: dxrWPlphSsG3ufc0KoP1qQ==
X-CSE-MsgGUID: LsN/sWBKQaOWdqbZHnP7bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047636"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DA7F3122943;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045nZ-1J01;
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
Subject: [PATCH v12 45/86] media: ccs: Add support for embedded data stream
Date: Thu,  9 Apr 2026 23:14:20 +0300
Message-ID: <20260409201501.975242-46-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58455-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B40A3CF73C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for embedded data stream, in UAPI and frame descriptor.

This patch adds also a new embedded data pad (2) to the source sub-device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 342 +++++++++++++++++++++++++++++--
 drivers/media/i2c/ccs/ccs.h      |  15 +-
 2 files changed, 338 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 0248a51eba8f..c4fe400d1cef 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -899,7 +899,7 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 	struct v4l2_fwnode_device_properties props;
 	int rval;
 
-	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 21);
+	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 22);
 	if (rval)
 		return rval;
 
@@ -1105,6 +1105,12 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 			  V4L2_CFA_PATTERN_FLIP_BOTH, 1,
 			  V4L2_CFA_PATTERN_FLIP_BOTH);
 
+	v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, NULL,
+			  V4L2_CID_METADATA_LAYOUT,
+			  V4L2_METADATA_LAYOUT_CCS,
+			  V4L2_METADATA_LAYOUT_CCS, 1,
+			  V4L2_METADATA_LAYOUT_CCS);
+
 	rval = v4l2_ctrl_handler_init(&sensor->src->ctrl_handler, 0);
 	if (rval)
 		return rval;
@@ -1871,6 +1877,57 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	return rval;
 }
 
+#define CCS_EMBEDDED_CODE_DEPTH(depth, half_depth)			\
+	depth,								\
+	CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW##depth,		\
+	CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW##depth,		\
+	CCS_EMB_DATA_CTRL_RAW##half_depth##_PACKING_FOR_RAW##depth,	\
+	MEDIA_BUS_FMT_META_##half_depth,				\
+	MEDIA_BUS_FMT_META_##depth,					\
+
+static const struct ccs_embedded_code {
+	u8 depth;
+	u8 cap_two_bytes_per_sample;
+	u8 cap_no_legacy;
+	u8 ctrl;
+	u32 code_two_bytes;
+	u32 code_legacy;
+} ccs_embedded_codes[] = {
+	{ CCS_EMBEDDED_CODE_DEPTH(16, 8) },
+	{ CCS_EMBEDDED_CODE_DEPTH(20, 10) },
+	{ CCS_EMBEDDED_CODE_DEPTH(24, 12) },
+};
+
+static const struct ccs_embedded_code *ccs_embedded_code(unsigned int bpp)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ccs_embedded_codes); i++)
+		if (ccs_embedded_codes[i].depth == bpp)
+			return ccs_embedded_codes + i;
+
+	WARN_ON(1);
+
+	return ccs_embedded_codes;
+}
+
+static u32
+ccs_default_embedded_code(struct ccs_sensor *sensor,
+			  const struct ccs_embedded_code *embedded_code)
+{
+	if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+	    BIT(embedded_code->cap_two_bytes_per_sample))
+		return embedded_code->code_two_bytes;
+
+	if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+	      BIT(embedded_code->cap_no_legacy)))
+		return embedded_code->code_legacy;
+
+	WARN_ON(1);
+
+	return embedded_code->code_legacy;
+}
+
 static int ccs_enable_streams(struct v4l2_subdev *subdev,
 			      struct v4l2_subdev_state *state, u32 pad,
 			      u64 streams_mask)
@@ -2003,6 +2060,22 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 	if (rval < 0)
 		goto err_pm_put;
 
+	/* Configure embedded data */
+	if (sensor->csi_format->compressed >= 16) {
+		const struct ccs_embedded_code *embedded_code =
+			ccs_embedded_code(sensor->csi_format->compressed);
+		const struct v4l2_mbus_framefmt *meta_out_fmt =
+			v4l2_subdev_state_get_format(src_state, CCS_PAD_SRC,
+						     CCS_STREAM_META);
+
+		rval = ccs_write(sensor, EMB_DATA_CTRL,
+				 meta_out_fmt->code ==
+				 embedded_code->code_legacy ?
+				 0 : embedded_code->ctrl);
+		if (rval < 0)
+			goto err_pm_put;
+	}
+
 	if (CCS_LIM(sensor, FLASH_MODE_CAPABILITY) &
 	    (CCS_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
 	     SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE) &&
@@ -2133,6 +2206,61 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
 		subdev->name, code->pad, code->index);
 
+	if (subdev == &sensor->src->sd) {
+		if (code->pad == CCS_PAD_META ||
+		    code->stream == CCS_STREAM_META) {
+			struct v4l2_mbus_framefmt *pix_fmt =
+				v4l2_subdev_state_get_format(sd_state,
+							     CCS_PAD_SRC,
+							     CCS_STREAM_PIXEL);
+			const struct ccs_csi_data_format *csi_format =
+				ccs_validate_csi_data_format(sensor,
+							     pix_fmt->code);
+			unsigned int i = 0;
+			u32 codes[2];
+
+			switch (csi_format->compressed) {
+			case 8:
+				codes[i++] = MEDIA_BUS_FMT_META_8;
+				break;
+			case 10:
+				codes[i++] = MEDIA_BUS_FMT_META_10;
+				break;
+			case 12:
+				codes[i++] = MEDIA_BUS_FMT_META_12;
+				break;
+			case 14:
+				codes[i++] = MEDIA_BUS_FMT_META_14;
+				break;
+			case 16:
+			case 20:
+			case 24: {
+				const struct ccs_embedded_code *embedded_code =
+					ccs_embedded_code(csi_format->compressed);
+
+				if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+				    BIT(embedded_code->cap_two_bytes_per_sample))
+					codes[i++] =
+						embedded_code->code_two_bytes;
+
+				if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+				      BIT(embedded_code->cap_no_legacy)))
+					codes[i++] = embedded_code->code_legacy;
+				break;
+			}
+			default:
+				WARN_ON(1);
+			}
+
+			if (WARN_ON(i > ARRAY_SIZE(codes)) || code->index >= i)
+				return -EINVAL;
+
+			code->code = codes[code->index];
+
+			return 0;
+		}
+	}
+
 	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
 		if (code->index)
 			return -EINVAL;
@@ -2172,8 +2300,11 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
-	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
-	fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
+	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad,
+						    fmt->stream);
+
+	if (fmt->pad != CCS_PAD_META && fmt->stream != CCS_STREAM_META)
+		fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
 
 	return 0;
 }
@@ -2263,6 +2394,86 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 	return ccs_pll_update(sensor);
 }
 
+static inline unsigned int ccs_embedded_data_lines(struct ccs_sensor *sensor)
+{
+	return sensor->embedded_end - sensor->embedded_start;
+}
+
+static int ccs_set_format_meta(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_mbus_framefmt *fmt)
+{
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	const struct ccs_csi_data_format *csi_format;
+	struct v4l2_mbus_framefmt *pix_fmt;
+	struct v4l2_mbus_framefmt *meta_fmt;
+	struct v4l2_mbus_framefmt *meta_out_fmt;
+	u32 code;
+
+	pix_fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
+					       CCS_STREAM_PIXEL);
+	meta_fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_META, 0);
+	meta_out_fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
+						    CCS_STREAM_META);
+
+	code = fmt ? fmt->code : 0;
+
+	meta_fmt->width = pix_fmt->width;
+	meta_fmt->height = ccs_embedded_data_lines(sensor);
+
+	csi_format = ccs_validate_csi_data_format(sensor, pix_fmt->code);
+
+	switch (csi_format->compressed) {
+	case 8:
+		meta_fmt->code = MEDIA_BUS_FMT_META_8;
+		break;
+	case 10:
+		meta_fmt->code = MEDIA_BUS_FMT_META_10;
+		break;
+	case 12:
+		meta_fmt->code = MEDIA_BUS_FMT_META_12;
+		break;
+	case 14:
+		meta_fmt->code = MEDIA_BUS_FMT_META_14;
+		break;
+	case 16:
+	case 20:
+	case 24: {
+		const struct ccs_embedded_code *embedded_code;
+
+		embedded_code = ccs_embedded_code(csi_format->compressed);
+		meta_fmt->code =
+			ccs_default_embedded_code(sensor, embedded_code);
+
+		if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+		      BIT(embedded_code->cap_no_legacy)) &&
+		    code == embedded_code->code_legacy)
+			meta_fmt->code = embedded_code->code_legacy;
+
+		if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+		    BIT(embedded_code->cap_two_bytes_per_sample) &&
+		    code == embedded_code->code_two_bytes) {
+			meta_fmt->code = embedded_code->code_two_bytes;
+			meta_fmt->width <<= 1;
+		}
+
+		break;
+	}
+	default:
+		WARN_ON(1);
+		return 0;
+	}
+
+	meta_out_fmt->width = meta_fmt->width;
+	meta_out_fmt->height = meta_fmt->height;
+	meta_out_fmt->code = meta_fmt->code;
+
+	if (fmt)
+		*fmt = *meta_out_fmt;
+
+	return 0;
+}
+
 static int ccs_set_format(struct v4l2_subdev *subdev,
 			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
@@ -2272,10 +2483,21 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *crop;
 
+	if (ssd == sensor->src && fmt->pad == CCS_PAD_META)
+		return ccs_get_format(subdev, ci, sd_state, fmt);
+
+	if (ssd == sensor->src && fmt->stream == CCS_STREAM_META) {
+		ccs_set_format_meta(subdev, sd_state, &fmt->format);
+
+		return 0;
+	}
+
 	if (fmt->pad == ssd->source_pad) {
 		int rval;
 
 		rval = ccs_set_format_source(subdev, NULL, sd_state, fmt);
+		if (ccs_embedded_data_lines(sensor) && ssd == sensor->src)
+			ccs_set_format_meta(subdev, sd_state, NULL);
 
 		return rval;
 	}
@@ -2527,6 +2749,12 @@ static int ccs_sel_supported(struct v4l2_subdev *subdev,
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 
+	if (sel->stream != CCS_STREAM_PIXEL)
+		return -EINVAL;
+
+	if (sel->pad == CCS_PAD_META)
+		return -EINVAL;
+
 	/* We only implement crop in three places. */
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
@@ -2576,7 +2804,8 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	if (sel->pad == ssd->sink_pad) {
 		struct v4l2_mbus_framefmt *mfmt =
-			v4l2_subdev_state_get_format(sd_state, sel->pad);
+			v4l2_subdev_state_get_format(sd_state, sel->pad,
+						     CCS_STREAM_PIXEL);
 
 		src_size.width = mfmt->width;
 		src_size.height = mfmt->height;
@@ -2638,7 +2867,9 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 		} else if (sel->pad == ssd->sink_pad) {
 			struct v4l2_mbus_framefmt *sink_fmt =
 				v4l2_subdev_state_get_format(sd_state,
-							     ssd->sink_pad);
+							     ssd->sink_pad,
+							     CCS_STREAM_PIXEL);
+
 			sel->r.top = sel->r.left = 0;
 			sel->r.width = sink_fmt->width;
 			sel->r.height = sink_fmt->height;
@@ -2724,6 +2955,18 @@ static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
 	entry++;
 	desc->num_entries++;
 
+	if (ccs_embedded_data_lines(sensor)) {
+		struct v4l2_mbus_framefmt *meta_out_fmt =
+			v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
+						     CCS_STREAM_META);
+
+		entry->pixelcode = meta_out_fmt->code;
+		entry->stream = CCS_STREAM_META;
+		entry->bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+		entry++;
+		desc->num_entries++;
+	}
+
 	v4l2_subdev_unlock_state(sd_state);
 
 	return 0;
@@ -3064,7 +3307,8 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 	ssd->sensor = sensor;
 
 	ssd->npads = num_pads;
-	ssd->source_pad = num_pads - 1;
+	ssd->source_pad =
+		ssd == sensor->pixel_array ? CCS_PA_PAD_SRC : CCS_PAD_SRC;
 
 	v4l2_i2c_subdev_set_name(&ssd->sd, client, sensor->minfo.name, name);
 
@@ -3078,6 +3322,10 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 		ssd->sd.owner = THIS_MODULE;
 		ssd->sd.dev = &client->dev;
 		v4l2_set_subdevdata(&ssd->sd, client);
+	} else {
+		ssd->sd.flags |= V4L2_SUBDEV_FL_STREAMS;
+		ssd->pads[CCS_PAD_META].flags =
+			MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
 	}
 
 	rval = media_entity_pads_init(&ssd->sd.entity, ssd->npads, ssd->pads);
@@ -3103,9 +3351,9 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 	unsigned int pad = ssd == sensor->pixel_array ?
 		CCS_PA_PAD_SRC : CCS_PAD_SINK;
 	struct v4l2_mbus_framefmt *fmt =
-		v4l2_subdev_state_get_format(sd_state, pad);
+		v4l2_subdev_state_get_format(sd_state, pad, CCS_STREAM_PIXEL);
 	struct v4l2_rect *crop =
-		v4l2_subdev_state_get_crop(sd_state, pad);
+		v4l2_subdev_state_get_crop(sd_state, pad, CCS_STREAM_PIXEL);
 
 	guard(mutex)(&sensor->mutex);
 
@@ -3119,7 +3367,8 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 	if (ssd == sensor->pixel_array)
 		return 0;
 
-	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC);
+	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
+					   CCS_STREAM_PIXEL);
 	fmt->code = ssd == sensor->src ?
 		sensor->csi_format->code : sensor->internal_csi_format->code;
 	fmt->field = V4L2_FIELD_NONE;
@@ -3129,6 +3378,47 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ccs_src_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CCS_PAD_SINK,
+			.source_pad = CCS_PAD_SRC,
+			.source_stream = CCS_STREAM_PIXEL,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		}, {
+			.sink_pad = CCS_PAD_META,
+			.source_pad = CCS_PAD_SRC,
+			.source_stream = CCS_STREAM_META,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		}
+	};
+	struct v4l2_subdev_krouting routing = {
+		.routes = routes,
+		.num_routes = 1,
+	};
+	struct ccs_subdev *ssd = to_ccs_subdev(sd);
+	struct ccs_sensor *sensor = ssd->sensor;
+	int rval;
+
+	if (ccs_embedded_data_lines(sensor))
+		routing.num_routes++;
+
+	rval = v4l2_subdev_set_routing(sd, sd_state, &routing);
+	if (rval)
+		return rval;
+
+	rval = ccs_init_state(sd, sd_state);
+	if (rval)
+		return rval;
+
+	if (ccs_embedded_data_lines(sensor))
+		ccs_set_format_meta(sd, sd_state, NULL);
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops ccs_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 	.pre_streamon = ccs_pre_streamon,
@@ -3141,6 +3431,14 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
 	.set_fmt = ccs_set_format,
 	.get_selection = ccs_get_selection,
 	.set_selection = ccs_set_selection,
+};
+
+static const struct v4l2_subdev_pad_ops ccs_src_pad_ops = {
+	.enum_mbus_code = ccs_enum_mbus_code,
+	.get_fmt = ccs_get_format,
+	.set_fmt = ccs_set_format,
+	.get_selection = ccs_get_selection,
+	.set_selection = ccs_set_selection,
 	.enable_streams = ccs_enable_streams,
 	.disable_streams = ccs_disable_streams,
 	.get_frame_desc = ccs_get_frame_desc,
@@ -3157,6 +3455,12 @@ static const struct v4l2_subdev_ops ccs_ops = {
 	.sensor = &ccs_sensor_ops,
 };
 
+static const struct v4l2_subdev_ops ccs_src_ops = {
+	.video = &ccs_video_ops,
+	.pad = &ccs_src_pad_ops,
+	.sensor = &ccs_sensor_ops,
+};
+
 static const struct media_entity_operations ccs_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -3165,8 +3469,8 @@ static const struct v4l2_subdev_internal_ops ccs_internal_ops = {
 	.init_state = ccs_init_state,
 };
 
-static const struct v4l2_subdev_internal_ops ccs_internal_src_ops = {
-	.init_state = ccs_init_state,
+static const struct v4l2_subdev_internal_ops ccs_src_internal_ops = {
+	.init_state = ccs_src_init_state,
 	.registered = ccs_registered,
 	.unregistered = ccs_unregistered,
 };
@@ -3308,8 +3612,8 @@ static int ccs_probe(struct i2c_client *client)
 
 	sensor->src = &sensor->ssds[sensor->ssds_used];
 
-	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_ops);
-	sensor->src->sd.internal_ops = &ccs_internal_src_ops;
+	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_src_ops);
+	sensor->src->sd.internal_ops = &ccs_src_internal_ops;
 
 	sensor->regulators = devm_kcalloc(&client->dev,
 					  ARRAY_SIZE(ccs_regulators),
@@ -3576,12 +3880,20 @@ static int ccs_probe(struct i2c_client *client)
 		goto out_cleanup;
 	}
 
-	rval = ccs_init_subdev(sensor, sensor->scaler, " scaler", 2,
+	rval = ccs_init_subdev(sensor, sensor->scaler, " scaler",
+			       sensor->ssds_used != CCS_SUBDEVS ?
+			       CCS_PADS_NOMETA :
+			       ccs_embedded_data_lines(sensor) ?
+			       CCS_PADS : CCS_PADS_NOMETA,
 			       MEDIA_ENT_F_PROC_VIDEO_SCALER,
 			       "ccs scaler mutex", &scaler_lock_key);
 	if (rval)
 		goto out_cleanup;
-	rval = ccs_init_subdev(sensor, sensor->binner, " binner", 2,
+	rval = ccs_init_subdev(sensor, sensor->binner, " binner",
+			       sensor->ssds_used == CCS_SUBDEVS ?
+			       CCS_PADS_NOMETA :
+			       ccs_embedded_data_lines(sensor) ?
+			       CCS_PADS : CCS_PADS_NOMETA,
 			       MEDIA_ENT_F_PROC_VIDEO_SCALER,
 			       "ccs binner mutex", &binner_lock_key);
 	if (rval)
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index df044dbde23f..122287ab5399 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -176,11 +176,18 @@ struct ccs_csi_data_format {
 #define CCS_SUBDEVS			3
 
 #define CCS_PA_PAD_SRC			0
-#define CCS_PAD_SINK			0
-#define CCS_PAD_SRC			1
-#define CCS_PADS			2
+enum {
+	CCS_PAD_SINK,
+	CCS_PAD_SRC,
+	CCS_PAD_META,
+	CCS_PADS_NOMETA = CCS_PAD_META,
+	CCS_PADS,
+};
 
-#define CCS_STREAM_PIXEL		0
+enum {
+	CCS_STREAM_PIXEL,
+	CCS_STREAM_META,
+};
 
 struct ccs_binning_subtype {
 	u8 horizontal:4;
-- 
2.47.3


