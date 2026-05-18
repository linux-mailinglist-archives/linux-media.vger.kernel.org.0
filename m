Return-Path: <linux-media+bounces-61942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNhvChjtCmo89gQAu9opvQ
	(envelope-from <linux-media+bounces-61942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:42:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FC256ADC4
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F7B8304C6A0
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98CE3EBF14;
	Mon, 18 May 2026 10:31:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD153EC2F7;
	Mon, 18 May 2026 10:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100258; cv=none; b=hQX/9ggB0laEUcfYZtpIH90aumqdjn1uCDKnY1hANi9kLBhTbgzDP5m2YB8P4cwUjm+afcVnrx1ubRT5bP+wSxq29wKcNcutFyvMJ3vTFLWgy29l7eOt/aQaq0iHW3n2NXG3c7i7uyLkwokf9K3J/rKZswbM9/wz64RvRqbeRvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100258; c=relaxed/simple;
	bh=a94F18r5g+FvBqZBmEeOdOnNuIqh/W6Oyf8UGJe6Jgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uetNDeDhgqmU5qfPRVfmCOYiTy+TehQD8FWJ1O3sctc/1rcdaayAbyfRo+gMdeTH0TAP2fQrdsDTqytdq6YqTMoNDRnjhZyHMClO8yx5CKxgwznP8Eyrrbhx+OrlaPnsJRCbsu8M2v0iKo4zVJU6LH2Em/BB0nI8pm+nxBxvWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 10DDF1F80044;
	Mon, 18 May 2026 10:30:28 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id E28B0B4081A; Mon, 18 May 2026 10:30:26 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 5C629B407F7;
	Mon, 18 May 2026 10:25:00 +0000 (UTC)
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
Subject: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric format enumeration
Date: Mon, 18 May 2026 12:24:45 +0200
Message-ID: <20260518102451.417971-11-paulk@sys-base.io>
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
X-Rspamd-Queue-Id: 35FC256ADC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61942-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sys-base.io:email,sys-base.io:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Use the dedicated helper to check possible pixelformats against the
provided mbus code in order to support MC-centric format enumeration.

Note that multiple pixelformats may be returned for a given mbus code.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index a836fa7f081a..409c28621093 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct file *file, void *priv,
 static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
+	const struct sun6i_csi_capture_format *capture_format;
+	const struct sun6i_csi_bridge_format *bridge_format;
+	u32 mbus_code = fmtdesc->mbus_code;
 	u32 index = fmtdesc->index;
+	unsigned int index_valid = 0;
+	unsigned int i;
+
+	/* Video-node-centric enumeration. */
+	if (!mbus_code) {
+		if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+			return -EINVAL;
+
+		fmtdesc->pixelformat =
+			sun6i_csi_capture_formats[index].pixelformat;
+		return 0;
+	}
 
-	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	if (!bridge_format)
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
+		capture_format = &sun6i_csi_capture_formats[i];
 
-	return 0;
+		if (!sun6i_csi_capture_format_check(capture_format,
+						    bridge_format))
+			continue;
+
+		if (index_valid == index) {
+			fmtdesc->pixelformat = capture_format->pixelformat;
+			return 0;
+		}
+
+		index_valid++;
+	}
+
+	return -EINVAL;
 }
 
 static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
@@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
 	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_csi_capture_fops;
-- 
2.54.0


