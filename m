Return-Path: <linux-media+bounces-61948-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNUpEKzwCmpv+AQAu9opvQ
	(envelope-from <linux-media+bounces-61948-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:57:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9356B137
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 939A83122161
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4148C3EDAC7;
	Mon, 18 May 2026 10:33:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9901C3EFFAD;
	Mon, 18 May 2026 10:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100400; cv=none; b=PrONikM8N/O5CokpQv9qakv9r+ax9rC1vcUiGQ36mneEO0u0ttijrWItnFrkuLBlcjfKK2/qVy0SZ705pVZxJ0HcKDa8FN2+YEIknWTyhsHb6MShjtjJrP8KOfaFjJiXOvQvRjHLB5ynX4bMB6mcW5YRQa6WyjNTXQPWccyqKDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100400; c=relaxed/simple;
	bh=2ryYcYdMDv3PHd8raqE/i1so2/ppAY539lB4WGhZSA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOMcdfz8yYCXRu3iQjJuDNmYHIamh/LpO4ogm2UMcLiSx39/OkKoYqFOLqhgvhWl1R11pGOsFExLUUG3KyZ2pMNfP4rJF0ZLthK4zejXZN54G4fr9A5eaiP7+2T/0JTZ//WwA3XKRveP8e8PLsz2ERAqAiYZxGg4B24JCP0tlB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 000331F8004A;
	Mon, 18 May 2026 10:32:52 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7FCC9B407FE; Mon, 18 May 2026 10:32:52 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 0912DB407FE;
	Mon, 18 May 2026 10:25:02 +0000 (UTC)
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
Subject: [PATCH 15/16] media: sun6i-isp: Add support for MC-centric format enumeration
Date: Mon, 18 May 2026 12:24:50 +0200
Message-ID: <20260518102451.417971-16-paulk@sys-base.io>
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
X-Rspamd-Queue-Id: B6C9356B137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61948-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sys-base.io:email,sys-base.io:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Just make sure the provided mbus code is supported and carry on with the
existing implementation since the pixelformat is independent from the
mbus code.

The params video node only supports a single format and does not care
about the mbus format, but we can still report MC-centric support.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 9 ++++++++-
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c | 3 ++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 24e731bcabe9..372b9331bd6d 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -436,8 +436,14 @@ static int sun6i_isp_capture_querycap(struct file *file, void *priv,
 static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
+	u32 mbus_code = fmtdesc->mbus_code;
 	u32 index = fmtdesc->index;
 
+	if (mbus_code && !sun6i_isp_proc_format_find(mbus_code))
+		return -EINVAL;
+
+	/* Capture format is independent from proc format. */
+
 	if (index >= ARRAY_SIZE(sun6i_isp_capture_formats))
 		return -EINVAL;
 
@@ -697,7 +703,8 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *isp_dev)
 
 	strscpy(video_dev->name, SUN6I_ISP_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_isp_capture_fops;
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 0cc48e2bc8c6..2622e5a07817 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -531,7 +531,8 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
 
 	strscpy(video_dev->name, SUN6I_ISP_PARAMS_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_TX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_isp_params_fops;
-- 
2.54.0


