Return-Path: <linux-media+bounces-61941-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHccJ0TrCmqR9QQAu9opvQ
	(envelope-from <linux-media+bounces-61941-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:34:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0777156AC72
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD0163084335
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8573C3EDAB9;
	Mon, 18 May 2026 10:30:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7313ECBD4;
	Mon, 18 May 2026 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100204; cv=none; b=fqtNnQigghn5JvdlzqQyZ/4Q64XMXlLRDwQLRFALd7cOrmaZ20UD59UkFWRzQcrgw3lRl86uQZRQZyaH65axd3nPFt8rNfJTmS9o7+JkBBzoai7nKi0NNAUp9sROlf4VHZNG6qKg98jOeSV+rnljHyLC4IZIsULm16ul+3w3rl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100204; c=relaxed/simple;
	bh=N6jBm7mjftN6RyzhLYEDB/ctTHQIpMFcWgaVKSlq3IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BR9YFIAjf/IkWx1wVV7sfm66zRXr5GskDFYy3ARSBk10ZIBrDgUWxHum3fd7YqOgtQDkyQhLEhoaUlXcQZsAtSL30Ag3iY65dfkYqh0mDDPYfGXLIwR2zpcKObSO6EbyU1h1VC58yqbumBW+TYb5ohbfele7OYRbv6+znpmmIUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 2659F1F8004A;
	Mon, 18 May 2026 10:29:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 9DEC6B407F6; Mon, 18 May 2026 10:29:52 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 0C8EBB407F6;
	Mon, 18 May 2026 10:24:56 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 09/16] media: sun6i-csi: Split format validation to a dedicated helper
Date: Mon, 18 May 2026 12:24:44 +0200
Message-ID: <20260518102451.417971-10-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0777156AC72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61941-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	DMARC_NA(0.00)[sys-base.io];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Introduce a new sun6i_csi_capture_format_check helper based on the
link_validate code, which will be reused to implement MC-style
pixelformat enumeration.

Formats not listed in v4l2_format_info are now checked via
sun6i_csi_capture_format_check (which only concerns raw formats)
instead of blindly allowing them.

Also fix a comment in the raw format table.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 87 +++++++++++--------
 1 file changed, 49 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index f788b4234673..a836fa7f081a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -213,7 +213,7 @@ struct sun6i_csi_capture_format *sun6i_csi_capture_format_find(u32 pixelformat)
 /* RAW formats need an exact match between pixel and mbus formats. */
 static const
 struct sun6i_csi_capture_format_match sun6i_csi_capture_format_matches[] = {
-	/* YUV420 */
+	/* YUV422 */
 	{
 		.pixelformat	= V4L2_PIX_FMT_YUYV,
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
@@ -327,6 +327,51 @@ static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
 	return false;
 }
 
+static bool
+sun6i_csi_capture_format_check(const struct sun6i_csi_capture_format *capture_format,
+			       const struct sun6i_csi_bridge_format *bridge_format)
+{
+	const struct v4l2_format_info *format_info;
+	u32 pixelformat = capture_format->pixelformat;
+	u32 mbus_code = bridge_format->mbus_code;
+	bool match;
+
+	format_info = v4l2_format_info(pixelformat);
+
+	/* Some raw formats like JPEG are not listed: try a direct match. */
+	if (!format_info)
+		return sun6i_csi_capture_format_match(pixelformat, mbus_code);
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
+	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
+		return false;
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_RGB &&
+	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
+		return false;
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+		if (bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV420 &&
+		    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV422)
+			return false;
+
+		/* YUV420 input can't produce YUV422 output. */
+		if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_YUV420 &&
+		    format_info->vdiv == 1)
+			return false;
+	}
+
+	/* With raw input mode, we need a 1:1 match between input and output. */
+	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
+	    capture_format->input_format_raw) {
+		match = sun6i_csi_capture_format_match(pixelformat, mbus_code);
+		if (!match)
+			return false;
+	}
+
+	return true;
+}
+
 /* Capture */
 
 static void
@@ -915,13 +960,11 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	const struct sun6i_csi_capture_format *capture_format;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	unsigned int capture_width, capture_height;
-	const struct v4l2_format_info *format_info;
 	struct v4l2_subdev_format src_fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = link->source->index
 	};
 	u32 pixelformat, capture_field;
-	bool match;
 	int ret;
 
 	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
@@ -950,44 +993,12 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 		return -EINVAL;
 	}
 
-	format_info = v4l2_format_info(pixelformat);
-	/* Some formats are not listed. */
-	if (!format_info)
-		return 0;
-
-	if (format_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
-	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
-		goto invalid;
-
-	if (format_info->pixel_enc == V4L2_PIXEL_ENC_RGB &&
-	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
-		goto invalid;
-
-	if (format_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
-		if (bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV420 &&
-		    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV422)
-			goto invalid;
-
-		/* YUV420 input can't produce YUV422 output. */
-		if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_YUV420 &&
-		    format_info->vdiv == 1)
-			goto invalid;
-	}
-
-	/* With raw input mode, we need a 1:1 match between input and output. */
-	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
-	    capture_format->input_format_raw) {
-		match = sun6i_csi_capture_format_match(pixelformat,
-						       src_fmt.format.code);
-		if (!match)
-			goto invalid;
+	if (!sun6i_csi_capture_format_check(capture_format, bridge_format)) {
+		v4l2_err(v4l2_dev, "invalid input/output format combination\n");
+		return -EINVAL;
 	}
 
 	return 0;
-
-invalid:
-	v4l2_err(v4l2_dev, "invalid input/output format combination\n");
-	return -EINVAL;
 }
 
 static const struct media_entity_operations sun6i_csi_capture_media_ops = {
-- 
2.54.0


