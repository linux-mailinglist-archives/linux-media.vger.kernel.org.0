Return-Path: <linux-media+bounces-52966-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLjBHXUplGlTAQIAu9opvQ
	(envelope-from <linux-media+bounces-52966-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:40:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5914A0C7
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59CF3300B057
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D822E718B;
	Tue, 17 Feb 2026 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqDgC4MC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7652D97AA;
	Tue, 17 Feb 2026 08:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771317549; cv=none; b=Ri1ZAwODwcQiz9N1asNokX91gmLuKuY7nG8x1ToiTvkvuGPxz02vH4V7MYKSdm1/NTG5/F8CiNLz+U4HYdSs+GdZScnfN7gf+TlEeqZchuDqbhFM7IKQyhIYgW3PIYPe2p9Jsv3gzs6nOuZwBqQ4LNurwVZHgIa80iSHjKoLI5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771317549; c=relaxed/simple;
	bh=Tp91x9TqhD35zOegm+OJH/4SKa8jd4LWFafw1/btbJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZy5glZDT03U3YyhyabVjMU2sLgOxAQziOzLXTz9QRjxq4OEKp33lLgka4deg4YpO0rIEZnn5mpXMAsZU/+xtTmQEQqv7GU3xVepbTYRXfJSSstLI2vnAobggCI//xkrAunHG6bP13wzcYpKaEuLdULb+luSUD4Gjh+0sApDNdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqDgC4MC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD21C2BC86;
	Tue, 17 Feb 2026 08:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771317549;
	bh=Tp91x9TqhD35zOegm+OJH/4SKa8jd4LWFafw1/btbJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SqDgC4MCziDbBeXMmftaofkJFKELatSa5v38gJekRirjMNg3/Wa4rWp5ADCruX2Is
	 Ub7PCkoiCIpmWQJE4Ye0eNZfcKDXzCZfZIv48gBLG8/DF7m+TPRP/6VAWynLnXpn2I
	 y0FAsm+vrXlNK2zooKzvWTBH9HO/grGtrsyB8MBhNAKOKIrVOwuGDJt7J9SUeqEwaj
	 ctKjrdnoljallYAOcAwjHmZXtIDuQI8F/Kf5FZb8zHyNpIGPEq5RAw/5p1WueN9nln
	 1l6ghHH29F68xpyKLnr6oK5+AWbL/t3ufyRwgaNlNWgGhpODs9DJVwSGjwqwlMSajy
	 S2qh5+xYimLFw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 17 Feb 2026 09:38:58 +0100
Subject: [PATCH v6 2/2] media: bcm2835-unicam: Fix RGB format / mbus code
 association
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-csi-bgr-rgb-v6-2-064607effe42@redhat.com>
References: <20260217-csi-bgr-rgb-v6-0-064607effe42@redhat.com>
In-Reply-To: <20260217-csi-bgr-rgb-v6-0-064607effe42@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4311; i=mripard@redhat.com;
 h=from:subject:message-id; bh=7vE1azt3GG4cI62AESkJAWUjyKm6TXjOqPzm/WP2EhM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlTNJVvPlqx0j9P9OjfC5aP1z7edWvPqZm9K0RfvPP6Z
 /Zsw5H6yR1TWRiEORlkxRRZnsiEnV7evrjKwX7lD5g5rEwgQxi4OAVgIuuWMzZ8zjDam2y1N/qO
 o3CaykaluLeO05KEjpkG9Thuf9Xye9631YZnjvfVzOGWm2bkE+igwMPYsChUdlrxs5T9OrknH90
 V3W+ksjPgnrjleqnAALeiuCrrz+tO3Xr+dZI2n1znWhVuH85rAA==
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-52966-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: CEF5914A0C7
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
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 43 +++++++++++++++++++-----
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index f10064107d543caf867249d0566a0f42d6d8c4c6..648d81b741e258cc24075d5f95903ee748280695 100644
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
@@ -2146,26 +2146,51 @@ static int unicam_video_link_validate(struct media_link *link)
 
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
+		 * Unicam initially associated BGR24 to BGR888_1X24 and
+		 * RGB24 to RGB888_1X24.
+		 *
+		 * In order to allow the applications using the old
+		 * behaviour to run, let's accept the old combination,
+		 * but warn about it.
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
2.52.0


