Return-Path: <linux-media+bounces-52418-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGBTLmn4iWn5FAAAu9opvQ
	(envelope-from <linux-media+bounces-52418-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:08:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F056111970
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE6BE304AD12
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D7037F0E4;
	Mon,  9 Feb 2026 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHKLWNFB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6B837D13B;
	Mon,  9 Feb 2026 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649412; cv=none; b=WsLzbh3R1MgJIYI8/HtY+i6g4MInKFE8WN/LcT61AQ+nG2xZTsAIr4rJcumWO4yna7jV7M0P57Lu+LWcxGjZQTYlkHxFqZQeSxHe4gqWM18oWEMju5DkPAicaE98Iun6kmeSx+KK8hI6DNRdTB/AbnNQbYXIkQdZHuPlHpu+L+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649412; c=relaxed/simple;
	bh=F2khG7L1dR+0zU65qFss9557GzPTMPDXuNJP8BR35mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kCNdQvy/rPIRy85wpoDeOJs/WNDFS5Zy5i98bhXimFlG70AtEQzHRmcMUcmtuRPEPM5pRE7opYXsuAo8733W5rvRdAhGURGHBcqE0OCYAmFxFrMbEN094+YYbpEAlwQ3xWIdlPVIaUlqjNxQDZXQczfVH+K/ohEabkInfQ6Ub8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHKLWNFB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D1FC116C6;
	Mon,  9 Feb 2026 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770649412;
	bh=F2khG7L1dR+0zU65qFss9557GzPTMPDXuNJP8BR35mU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oHKLWNFBbZaOpHziby7n/fa4U7UewBZWLA4cyFsJVUjMhLvgz+ljHaAhwInujp4YP
	 zz+KUXqzUkxapjyrqsPrt4o/snFIL3jbD9QFAkGFm0YCmcnJ3GUuTvDx62F9T2vHNd
	 2X7QgcgRQrK2DWYh0w/ciWUKbp/ZgppYo/2sBL63xNRIOQ2+vI2cyergdPv3pLqHaT
	 7tYrk3cvIsFjj4mRceqioDb08eg/X4EDri3LbGkIy/FkN6cGw6vmUM+idxJuBVhm6R
	 bv9yRUrG3mc2+x3/GhKROMWuatx6WuXnvfnCT601dUwc3asiI9fNEgR34BdyBrbI75
	 2WwNgcpQKFeQA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 09 Feb 2026 16:03:17 +0100
Subject: [PATCH v5 2/2] media: bcm2835-unicam: Fix RGB format / mbus code
 association
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-csi-bgr-rgb-v5-2-e7af3cd6cde6@redhat.com>
References: <20260209-csi-bgr-rgb-v5-0-e7af3cd6cde6@redhat.com>
In-Reply-To: <20260209-csi-bgr-rgb-v5-0-e7af3cd6cde6@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3835; i=mripard@redhat.com;
 h=from:subject:message-id; bh=73PUMIGPELjm99pGEtCMcu8OVoQto0KLcNqUrl0lEf4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmd363aN2/pzsjbxTB1q/bKlqKUop6nP88IcK8wVFj4a
 f7LnrcWHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi3IqMDUeZjqtOYJNdzVMu
 0yrZuuUqw3xd/dIPL5iWluazs2efaTqte/veQ/nWkIsev9YckbeLZKxma3yhIpN/6LbvkefMP78
 o37dZvunoPo79CfqMe92Cwv5+NQutydcq2HknXvz4R4ZvrF4A
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	TAGGED_FROM(0.00)[bounces-52418-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 2F056111970
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
 drivers/media/platform/broadcom/bcm2835-unicam.c | 36 +++++++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index f10064107d543caf867249d0566a0f42d6d8c4c6..5e4850831c931d346146aa8e22c53f0655e462c9 100644
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
@@ -2153,12 +2153,40 @@ static int unicam_video_link_validate(struct media_link *link)
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
+		if (fmtinfo->code != format->code) {
+			if (fmtinfo->fourcc == V4L2_PIX_FMT_BGR24 &&
+			    format->code == MEDIA_BUS_FMT_BGR888_1X24) {
+				dev_warn_once(node->dev->dev,
+					      "MIPI-CSI media bus code for RGB88 is RGB888_1X24. The application must be fixed.");
+			} else if (fmtinfo->fourcc == V4L2_PIX_FMT_RGB24 &&
+				   format->code == MEDIA_BUS_FMT_RGB888_1X24) {
+				dev_warn_once(node->dev->dev,
+					      "MIPI-CSI media bus code for BGR888 is BGR888_1X24. The application must be fixed.");
+			} else {
+				dev_dbg(node->dev->dev,
+					"image: (%u x %u) 0x%08x %s != (%u x %u) 0x%08x %s\n",
+					fmt->width, fmt->height, fmtinfo->code,
+					v4l2_field_names[fmt->field],
+					format->width, format->height, format->code,
+					v4l2_field_names[format->field]);
+				ret = -EPIPE;
+				goto out;
+			}
+		}
+
+		if (fmt->height != format->height ||
 		    fmt->width != format->width ||
 		    fmt->field != format->field) {
 			dev_dbg(node->dev->dev,
 				"image: (%u x %u) 0x%08x %s != (%u x %u) 0x%08x %s\n",
 				fmt->width, fmt->height, fmtinfo->code,

-- 
2.52.0


