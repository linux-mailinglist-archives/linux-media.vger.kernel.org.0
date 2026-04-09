Return-Path: <linux-media+bounces-58379-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE3NKxYJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58379-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB53CF46A
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BDF5302E41C
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A46233C1BE;
	Thu,  9 Apr 2026 20:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgCfKY/s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45526339B2D
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765705; cv=none; b=OH1R86X1spTOdfleK67YLhFdjHP3X8iC2dBDatP/gJ3/Vo1j4oZiTfEKVRFBzA0OsYO3/ITnTnzmLB7qtDvXzqxEnmurl1AetHVNPXu+yOxO1hb6uDidmof/cF+Yy+c0L0ScUpDImoEthUx28xnMoDtNf7ks56bKmNjSa+BQEyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765705; c=relaxed/simple;
	bh=mw8FqobLPBh3Z9FHMZdNXjWXDAqSx/VEHVWFj9OuFf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSEp+8SDKxY9kl9sQxalVgGvDFKo4lUe7dXAj7CWZJru5PKbOIkcs83aYJAvNuvGLFhkZL1p8FKDOoE2FjMBX32trIUqnCY2wMSf9RRbyCa4bjKY7AGzUOotcuaXldQOOTdIYoX8/nkSyBRurWoBaCIduqrRRqYgdYeD1DwzKPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgCfKY/s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765704; x=1807301704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mw8FqobLPBh3Z9FHMZdNXjWXDAqSx/VEHVWFj9OuFf4=;
  b=IgCfKY/sT7auI0kmte+CZLrnr4gxy685yezht7ZQgMN5YyRRqsOGydK5
   uswYTIx3ncfK496D7a5IWLh4Gg0dWoM2NulLgIZt4O282qkjemB5FFUA3
   /pBFVTPo3UF3A2KL+v78cyjoxRE8NF97nTxo0dRE5G5ozSkw6AIoQJCK4
   haFYaXsfkfakTOA7qO2kKL8srlhass0wkyhSgJYLJRK+vmFrPkNnDvMKk
   q4dSsTEdvJqkaFIq2OCAdotZp5DwJ32kpm9TLfv9RhgeBExhsRImGp9m/
   JRo2YLxwqQaepMOlGG05VqyJMhhVC7jaMzPR9cCQqSKAJcHIn0oOFsoEu
   g==;
X-CSE-ConnectionGUID: 2e2DmVzIT6mT+zIWNNNImw==
X-CSE-MsgGUID: vVrctjJ+RlqFx/b4hSWL8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408540"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:02 -0700
X-CSE-ConnectionGUID: qZWtWUD/Q7SV21MkXHjEXQ==
X-CSE-MsgGUID: cfEFBwtaSkCFCyCJ5mKLaQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:14:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0D2D4121CF2;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045oQ-29si;
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
Subject: [PATCH v12 57/86] media: imx219: Add image stream
Date: Thu,  9 Apr 2026 23:14:32 +0300
Message-ID: <20260409201501.975242-58-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58379-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 26FB53CF46A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

In preparation for embedded data stream support, introduce a new
imx219_stream_ids enumeration for stream IDs, with a single value,
IMX219_STREAM_IMAGE for the image data stream. Use it when accessing the
formats, crop and compose rectangles on the source pad. This is meant to
reduce the size of further commits, and doesn't introduce any functional
change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index b4aa62cbb826..bb7b2e4b34fd 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -347,6 +347,10 @@ enum imx219_pad_ids {
 	IMX219_NUM_PADS,
 };
 
+enum imx219_stream_ids {
+	IMX219_STREAM_IMAGE,
+};
+
 struct imx219 {
 	struct v4l2_subdev sd;
 	struct media_pad pads[IMX219_NUM_PADS];
@@ -417,9 +421,10 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
 			       u8 *bin_v)
 {
 	const struct v4l2_mbus_framefmt *format =
-		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 	const struct v4l2_rect *crop =
-		v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
+		v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 	u32 hbin = crop->width / format->width;
 	u32 vbin = crop->height / format->height;
 
@@ -447,7 +452,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
@@ -672,7 +678,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	u32 bpp;
 	int ret = 0;
 
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 	bpp = imx219_get_format_bpp(format);
 
@@ -862,7 +869,8 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 	u8 bin_h, bin_v, bin_hv;
 	int ret;
 
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 
 	/*
 	 * Adjust the requested format to match the closest mode. The Bayer
@@ -894,7 +902,7 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
 	bin_hv = min(bin_h, bin_v);
 
-	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
+	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 	crop->width = format->width * bin_hv;
 	crop->height = format->height * bin_hv;
 	crop->left = (IMX219_PIXEL_ARRAY_WIDTH - crop->width) / 2;
@@ -964,7 +972,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->pad != IMX219_PAD_SOURCE)
 		return v4l2_subdev_get_fmt(sd, ci, state, fmt);
 
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 
 	format->code = fmt->format.code =
 		imx219_get_format_code(imx219, fmt->format.code);
@@ -1047,7 +1056,8 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	struct v4l2_rect *compose =
 		v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
 	struct v4l2_mbus_framefmt *source_format =
-		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					     IMX219_STREAM_IMAGE);
 
 	/* The image pad models the pixel array, and thus has a fixed format. */
 	pixel_array_format->code = MEDIA_BUS_FMT_RAW_10;
-- 
2.47.3


