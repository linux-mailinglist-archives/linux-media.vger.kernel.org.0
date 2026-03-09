Return-Path: <linux-media+bounces-54964-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJj3MXbjrmmsJwIAu9opvQ
	(envelope-from <linux-media+bounces-54964-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:12:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA9323B6F6
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4F543032A87
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AC83D9059;
	Mon,  9 Mar 2026 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k28Ig3qt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699653D904D;
	Mon,  9 Mar 2026 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068872; cv=none; b=YpqHkKMHW8czEqweLJk7vOyBvZpkxORm2U8bASUcs2F5qQWoly64QXzfKLuA4JUJ/mBuQJA3RHUxBmHoOvbTjuHkpAZTtWUof3fU1sd4Por9aLd4bflT2zAlgmmSYu+A/k8liminGffMOTBQUinU5iaqgJAPmLU69c9Uj73a1hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068872; c=relaxed/simple;
	bh=dP0IsHglcQ6dTUsG1KV+cQUMQBqUC70co6D60KK1tgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iNAgbb3WVKOk4s4NjfSR861AuiKYh56iBYNvlsWC3upRw1bmD8Uks4AiwQCGqvjbsNzfpWwOwwEJz0PRF2IpZer5729tMkvrxoEVD6Fobq+nNzTx1wYeTDSUo9shUDlKmW8AU4L3NUxOlPYEGMJXqgcr4GIE56BOiid/Y4ypsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k28Ig3qt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBC7C4CEF7;
	Mon,  9 Mar 2026 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773068872;
	bh=dP0IsHglcQ6dTUsG1KV+cQUMQBqUC70co6D60KK1tgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k28Ig3qt5ryQeriln0WYd6BrZm8DPNDnmDLLxVyq3u74a5bb509cokeJzEpqI/hpz
	 vj0oaF2xMbKulJBmjWzyuYOJ5Jbh0J6+HdmeU+f3HbiDjJUZZjB2llF9WRQj41I8vX
	 4lG1fe/C7jX8p7S5QUmNi0PmTmJfIkW0KQOtrwyd+B7LnVtYDcoSHIJ6R7MeaXvXEB
	 xJvvvUlY6cohOQe0bbn0DTVAm3JNQT1Zpf0vGyHNgac0/FWtLhWygSRa4mc6cHvROX
	 BMIT4CzxXz3Ys1pb6CIJjdi/5KD7llBlOeeYEUFZGe3Smj3Kg8P3jFaeNNeSHJ5sJS
	 n5M1L5+gNbg1w==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 09 Mar 2026 16:07:41 +0100
Subject: [PATCH v7 2/2] media: bcm2835-unicam: Fix RGB format / mbus code
 association
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-csi-bgr-rgb-v7-2-fcee993b13d8@kernel.org>
References: <20260309-csi-bgr-rgb-v7-0-fcee993b13d8@kernel.org>
In-Reply-To: <20260309-csi-bgr-rgb-v7-0-fcee993b13d8@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4368; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8sVTwa7Od27sQ3Z6DtUhRhIovDZYi2OMVB5yjCX2V6Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnrHtn57rv8R5bhypVDnEVyCT02j23KipKOLqvivrjor
 d7GbcfdOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE5q1lbHjZ8GuXfKanXaDQ
 Zp7l9lFiB75szdVZI3nC4MaS1B9sX66rnVbZdqH1uYDDd7Gu6AeH/zA2rNpitzbTzuZL4oQPNr2
 5c89nzXfVmrqKafPKO13b9rFmsAT+6FnLcXdyrN8EV+OjnLf9AQ==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: DCA9323B6F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54964-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.923];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:email]
X-Rspamd-Action: no action

From: Maxime Ripard <mripard@redhat.com>

The Unicam driver is a MIPI-CSI2 Receiver, that can capture RGB 4:4:4,
YCbCr 4:2:2, and raw formats.

RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and
associated to the MEDIA_BUS_FMT_RGB888_1X24 media bus code.

However, V4L2_PIX_FMT_RGB24 is defined as having its color components in
the R, G and B order, from left to right. MIPI-CSI2 however defines the
RGB888 format with blue first, and that's what MEDIA_BUS_FMT_RGB888_1X24
defines too.

This essentially means that the R and B will be swapped compared to what
V4L2_PIX_FMT_RGB24 defines. The same situation occurs with
V4L2_PIX_FMT_BGR24 being associated to MEDIA_BUS_FMT_BGR888_1X24.

In order to fix the swapped components, we need to change the
association of V4L2_PIX_FMT_BGR24 to MEDIA_BUS_FMT_RGB888_1X24, and of
V4L2_PIX_FMT_RGB24 to MEDIA_BUS_FMT_BGR888_1X24.

Since the media bus code is exposed to userspace, and validated by
unicam's link_validate implementation, we need to explicitly accept (and
warn) the old association still to preserve backward compatibility.

Signed-off-by: Maxime Ripard <mripard@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 41 ++++++++++++++++++------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 53a342853be6eeb99d62a777e2db41de8ce5da92..6710617f6e52c0f3716fd70c5b8af06c2dce31da 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -340,16 +340,16 @@ static const struct unicam_format_info unicam_image_formats[] = {
 		.code		= MEDIA_BUS_FMT_RGB565_1X16,
 		.depth		= 16,
 		.csi_dt		= MIPI_CSI2_DT_RGB565,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
-		.code		= MEDIA_BUS_FMT_RGB888_1X24,
+		.code		= MEDIA_BUS_FMT_BGR888_1X24,
 		.depth		= 24,
 		.csi_dt		= MIPI_CSI2_DT_RGB888,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
-		.code		= MEDIA_BUS_FMT_BGR888_1X24,
+		.code		= MEDIA_BUS_FMT_RGB888_1X24,
 		.depth		= 24,
 		.csi_dt		= MIPI_CSI2_DT_RGB888,
 	}, {
 	/* Bayer Formats */
 		.fourcc		= V4L2_PIX_FMT_SBGGR8,
@@ -2146,26 +2146,49 @@ static int unicam_video_link_validate(struct media_link *link)
 
 	if (is_image_node(node)) {
 		const struct v4l2_pix_format *fmt = &node->fmt.fmt.pix;
 		const struct unicam_format_info *fmtinfo;
 
-		fmtinfo = unicam_find_format_by_fourcc(fmt->pixelformat,
-						       UNICAM_SD_PAD_SOURCE_IMAGE);
+		fmtinfo = unicam_find_format_by_code(format->code,
+						     UNICAM_SD_PAD_SOURCE_IMAGE);
 		if (WARN_ON(!fmtinfo)) {
 			ret = -EPIPE;
 			goto out;
 		}
 
-		if (fmtinfo->code != format->code ||
-		    fmt->height != format->height ||
+		/*
+		 * Unicam initially associated BGR24 to BGR888_1X24 and RGB24 to
+		 * RGB888_1X24.
+		 *
+		 * In order to allow the applications using the old behaviour to
+		 * run, let's accept the old combination, but warn about it.
+		 */
+		if (fmtinfo->fourcc != fmt->pixelformat) {
+			if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
+			     format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
+			    (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&
+			     format->code == MEDIA_BUS_FMT_RGB888_1X24)) {
+				dev_warn_once(node->dev->dev,
+					      "Incorrect pixel format %p4cc for 0x%04x. Fix your application to use %p4cc.\n",
+					      &fmt->pixelformat, format->code, &fmtinfo->fourcc);
+			} else {
+				dev_dbg(node->dev->dev,
+					"image: format mismatch: 0x%04x <=> %p4cc\n",
+					format->code, &fmt->pixelformat);
+				ret = -EPIPE;
+				goto out;
+			}
+		}
+
+		if (fmt->height != format->height ||
 		    fmt->width != format->width ||
 		    fmt->field != format->field) {
 			dev_dbg(node->dev->dev,
-				"image: (%u x %u) 0x%08x %s != (%u x %u) 0x%08x %s\n",
-				fmt->width, fmt->height, fmtinfo->code,
+				"image: (%u x %u) %s != (%u x %u) %s\n",
+				fmt->width, fmt->height,
 				v4l2_field_names[fmt->field],
-				format->width, format->height, format->code,
+				format->width, format->height,
 				v4l2_field_names[format->field]);
 			ret = -EPIPE;
 		}
 	} else {
 		const struct v4l2_meta_format *fmt = &node->fmt.fmt.meta;

-- 
2.53.0


