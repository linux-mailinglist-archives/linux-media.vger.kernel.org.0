Return-Path: <linux-media+bounces-62363-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPHxAL09Dmqr9AUAu9opvQ
	(envelope-from <linux-media+bounces-62363-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:03:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA159C862
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31D7530FA093
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8D53C3BFA;
	Wed, 20 May 2026 22:44:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCB43D647E
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 22:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779317088; cv=none; b=ikOeMB+H+OabJxwoXlWvH9f2OQpiAPEsWHKkMUOlja3wqET300gzdV+vCk/jmEdFg6Bp5RaZ1FzFbm1hgzFA041eNvlGUZy8tp5Z45J+612v29qMho7QVBaf7+z7hYc5H4qkf3sNeJChfyad0KdG4Buh9vrXYW3jPnzfJq7TyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779317088; c=relaxed/simple;
	bh=0IhRByV21Q0AjS6ZSY9pdWPWVLGIv7YOL2lNhomYG5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pmi/wC3acsiqtz6DOrcArr96VzgQ1skXuymwnenAZZnvmJ7p9QsLqFXmnyHGEa9onBcDF8BIX0zo0JgPStYZ1zeKY+AUQ7tuLJr/5M++aI9o2YY09NpE1EM+0L+DU2+l9dyodCHbUEjF/3lxQE61U92rUqnFit5RyOXlGQ3P9Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wPpeR-0005vy-Qm; Thu, 21 May 2026 00:44:31 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Thu, 21 May 2026 00:44:10 +0200
Subject: [PATCH v7 05/28] media: v4l2-common: add
 v4l2_fill_pixfmt_mp_aligned helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-spu-rga3-v7-5-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
In-Reply-To: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62363-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,collabora.com:email,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: 00BA159C862
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a v4l2_fill_pixfmt_mp_aligned helper which allows the user to
specify a custom stride alignment in bytes. This is necessary for
hardware like the Rockchip RGA3, which requires the stride value to be
aligned to a 16 bytes boundary.

The code makes some assumptions about the v4l2 format to simplify the
calculation. They currently hold for all known v4l2 formats.

v4l2_format_plane_stride uses an unsigned int as argument type to avoid
the later multiplication from overflowing the u8 value. All other places
use u8, as no practical use cases for a larger alignment are known at
the moment.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
Changes in v7:
- Also adjust alignment when C plane is larger than the Y plane
  Flagged by Sashiko:
  https://sashiko.dev/#/patchset/20260515-spu-rga3-v6-0-e547152eb9c9%40pengutronix.de?part=5

Changes in v6:
- Fixed alignment multiplication of 0 for NV24 - flagged by Sashiko:
  https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40pengutronix.de?part=5
- Changed v4l2_format_plane_stride alignment parameter type to
  avoid overflow for 64/128 byte alignment by multiplication.
  Flagged by Sashiko URL above.
---
 drivers/media/v4l2-core/v4l2-common.c | 58 +++++++++++++++++++++++++++--------
 include/media/v4l2-common.h           |  4 +++
 2 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 3cc8b04e1ea63..b771ed9b659b0 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -432,14 +432,35 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
 }
 
 static inline unsigned int v4l2_format_plane_stride(const struct v4l2_format_info *info, int plane,
-						    unsigned int width)
+						    unsigned int width, unsigned int byte_alignment)
 {
 	unsigned int hdiv = plane ? info->hdiv : 1;
 	unsigned int aligned_width =
 		ALIGN(width, v4l2_format_block_width(info, plane));
 
-	return DIV_ROUND_UP(aligned_width, hdiv) *
-	       info->bpp[plane] / info->bpp_div[plane];
+	/*
+	 * Formats with a single memory plane derive the stride of the
+	 * other planes from the y stride. To avoid hardware or software
+	 * deriving a different stride for the composite plane,
+	 * multiply the alignment accordingly.
+	 *
+	 * It assumes the following format properties:
+	 * - bpp_div[0] == bpp_div[1]
+	 * - The multiplication factor doesn't differ between the non y planes
+	 * - The multiplication factor is a power of 2
+	 */
+	if (info->mem_planes == 1 && info->comp_planes > 1) {
+		if (plane == 0)
+			byte_alignment *= DIV_ROUND_UP(
+				info->hdiv * info->bpp[0], info->bpp[1]);
+		else
+			byte_alignment *= DIV_ROUND_UP(
+				info->bpp[1], info->hdiv * info->bpp[0]);
+	}
+
+	return ALIGN(DIV_ROUND_UP(aligned_width, hdiv) * info->bpp[plane] /
+			     info->bpp_div[plane],
+		     byte_alignment);
 }
 
 static inline unsigned int v4l2_format_plane_height(const struct v4l2_format_info *info, int plane,
@@ -453,9 +474,10 @@ static inline unsigned int v4l2_format_plane_height(const struct v4l2_format_inf
 }
 
 static inline unsigned int v4l2_format_plane_size(const struct v4l2_format_info *info, int plane,
-						  unsigned int width, unsigned int height)
+						  unsigned int width, unsigned int height,
+						  u8 stride_alignment)
 {
-	return v4l2_format_plane_stride(info, plane, width) *
+	return v4l2_format_plane_stride(info, plane, width, stride_alignment) *
 	       v4l2_format_plane_height(info, plane, height);
 }
 
@@ -476,8 +498,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 }
 EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
 
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
-			u32 pixelformat, u32 width, u32 height)
+int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
+				u32 pixelformat, u32 width, u32 height,
+				u8 stride_alignment)
 {
 	const struct v4l2_format_info *info;
 	struct v4l2_plane_pix_format *plane;
@@ -494,23 +517,34 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 
 	if (info->mem_planes == 1) {
 		plane = &pixfmt->plane_fmt[0];
-		plane->bytesperline = v4l2_format_plane_stride(info, 0, width);
+		plane->bytesperline = v4l2_format_plane_stride(info, 0, width,
+							       stride_alignment);
 		plane->sizeimage = 0;
 
 		for (i = 0; i < info->comp_planes; i++)
 			plane->sizeimage +=
-				v4l2_format_plane_size(info, i, width, height);
+				v4l2_format_plane_size(info, i, width, height,
+						       stride_alignment);
 	} else {
 		for (i = 0; i < info->comp_planes; i++) {
 			plane = &pixfmt->plane_fmt[i];
 			plane->bytesperline =
-				v4l2_format_plane_stride(info, i, width);
+				v4l2_format_plane_stride(info, i, width,
+							 stride_alignment);
 			plane->sizeimage = plane->bytesperline *
 				v4l2_format_plane_height(info, i, height);
 		}
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
+
+int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
+			u32 pixelformat, u32 width, u32 height)
+{
+	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
+					   width, height, 1);
+}
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
 
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
@@ -530,12 +564,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	pixfmt->width = width;
 	pixfmt->height = height;
 	pixfmt->pixelformat = pixelformat;
-	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width);
+	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width, 1);
 	pixfmt->sizeimage = 0;
 
 	for (i = 0; i < info->comp_planes; i++)
 		pixfmt->sizeimage +=
-			v4l2_format_plane_size(info, i, width, height);
+			v4l2_format_plane_size(info, i, width, height, 1);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 401d8506c24b5..edd416178c333 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -558,6 +558,10 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height);
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 			u32 width, u32 height);
+/* @stride_alignment is a power of 2 value in bytes */
+int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
+				u32 pixelformat, u32 width, u32 height,
+				u8 stride_alignment);
 
 /**
  * v4l2_get_link_freq - Get link rate from transmitter

-- 
2.54.0


