Return-Path: <linux-media+bounces-52953-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BWILKcNlGn4/QEAu9opvQ
	(envelope-from <linux-media+bounces-52953-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:41:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6021490AF
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC0083007B8C
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 06:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C102C028F;
	Tue, 17 Feb 2026 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hp5CtKoG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ACB23A98E
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 06:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310500; cv=none; b=Ba9Rma52Imsw1MgmyZTO7zT2elF5sYuOWwcSdoMGgpZGkEYnINnGgLR4P6JnA7L/94lAUA2S01ocMlshrmAqqW/Ybd13vq4KS/PpPCmW8/6+Fjk2ogFFMWEuuDHXqvhEwKpeg5VnT9EtvzlbgHU+wVEpgLvrZNX8JybXqzS/ZIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310500; c=relaxed/simple;
	bh=bWO18VWhl/lJIVX1nAvqa2U827Ja5osKWLe4Ii6PMOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GWftJhvAaFSg27ZRr6wBVzz7KK4fTE+UWPT6YBW6LXj+pi5XYXwdQ4fyeMBB7jqVIfxuWDy03Akxkt4lsWaAMjoIqDzKDQCP/F/rvVEgH6EqrWBtMdnyqO/0eYIPlFXTW9utMoQv5hA0smSP6ZX+mHJu03mhZuCc1N/W9gcsac4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hp5CtKoG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-482f2599980so41912515e9.0
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 22:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771310496; x=1771915296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hnMRVHPJNRuy6Y1rMEFRl1cpDiZ6JR5YGvfIe2PEtM=;
        b=hp5CtKoGSvzyCbCmk+Tc1XliYesrCsGbN5sl9+eOGZqEAYXS90Kxv9olKjkoN7eVdF
         rDyEvWB8P3dXRSIDHdjj05ODgT1oK1SRpPgyszuNv/aYWLI6wIeFWKClpXhjSBLtGWWc
         QrqOxyqG/rARBk4OSoBpjxU67ORVS67ceHp7yWWVasTuVkQeaSR9H/6wH7hq0uIzGxNy
         d+xtpSq+UxKeUgyD92G8Mp68vuic8+qYPT9EbkYMAY3HnRPLYiosZNJpS5ek+wzlmGA9
         oLkmvl921bZytoakLYUoF5Sw2S5EtRLsuPOns6XyNLEY/0DJIEvKX6wpt8VV48iMjfor
         hLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771310496; x=1771915296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6hnMRVHPJNRuy6Y1rMEFRl1cpDiZ6JR5YGvfIe2PEtM=;
        b=Ql84XaO62IXGm22SeVeEKJNhOLFOyLGIVY00mlMeF60exhga/YdA4vOdws9Z3fQmx0
         TP+pTVFG+ePVc9txJ7ExENdTB1kQk4TRLybVldJweGN3b335zhhqNQeG/lSklxEY0u0w
         PT45ycPs+aQT+Sw3fGFriL4skAZp8q+OukUK1bBiWWpeUz4NANTAytASHjPiy0p8rI35
         ixh6ZTSOB2/nOTIxwCnEbdRt3+jotTjIZPoHF1ENDfqDOF3w7FsgBm5E9N5SyZ0UnTQo
         9+eSvyFmrRxKIvtH3b3iYNN5Ys9zohimw+yIn10NeVNKQBG9UitQ0PoVki5d7wbvumxI
         Ct1g==
X-Gm-Message-State: AOJu0YyWyuZGsK/t/hikGKINTd+Zk0ri4soJ628AYadd9tHZ9D+HwLOw
	ANFCiwoq+2Dlv6uD0vLP5clPvfQxbzxN50vB/ETtKZAkQDmbFp8hsTsp
X-Gm-Gg: AZuq6aLThZDltNpeodC8ugNgkyCdp9bVGn78701cAvz6vImcIpDFMbhvqxisQ2PPRCF
	odnmRYSMdmlu3bTLEM0eHKrTEZ57f2BWA8WbjNKrkbrQuL77LSs/DJERKA36CLreKJ6Y+teRkpo
	BEgmEonyYiaXAsZ+ubXAR8kqzRrH9o6nbvow4//B8lFAEAaoUypxKpSbsNBHJ4H3PfuqZk0bQO9
	d0KnVUzFHqfVbAnsU5MBI8joTM8zgJXgTsqWaOkAe033wK4TEsrhIH38mm6bUNOFLwJUCJrFXvZ
	un1Y2KV3NlB7JeG+RMssTqw6nl3EgUfrg87KJGfz0xmHF7CZtKO1fiEFfXWl9NEeCdQQd4Jb2nU
	S3AXXPltpzNehB8ruLNIG7d3O/1foJE1wG0aylbySPO1+tC86qF2oqaqfvi/MlOcm7J4N6WHK+u
	Qfk9HdhBEcBUgrvi7/FIVzV0SkQGkaVE5g8tSqzVSfYYyvgXaHgjl3bk6tVO92FzF+8y/iyrZJe
	ztrhqQATA==
X-Received: by 2002:a05:600c:524d:b0:483:4807:210c with SMTP id 5b1f17b1804b1-48373a5d7a0mr259850485e9.24.1771310495620;
        Mon, 16 Feb 2026 22:41:35 -0800 (PST)
Received: from thinkpad ([204.18.30.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29438376f8f.33.2026.02.16.22.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:41:35 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 3/3] media: sun6i-csi: capture: Support MC-centric format enumeration
Date: Tue, 17 Feb 2026 10:10:50 +0330
Message-Id: <20260217064050.18388-4-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217064050.18388-1-arash.golgol@gmail.com>
References: <20260217064050.18388-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52953-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F6021490AF
X-Rspamd-Action: no action

Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
pixel formats based on the provided mbus code. Advertise MC I/O support
on the video device to reflect its intended usage within a media graph.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index dd06d4c116e0..f54d7a6397be 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -327,6 +327,21 @@ static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
 	return false;
 }
 
+static const u32 *sun6i_csi_capture_pixelformat_find(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
+		const struct sun6i_csi_capture_format_match *match =
+			&sun6i_csi_capture_format_matches[i];
+
+		if (match->mbus_code == mbus_code)
+			return &match->pixelformat;
+	}
+
+	return NULL;
+}
+
 /* Capture */
 
 static void
@@ -729,11 +744,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
+	u32 mbus_code = fmtdesc->mbus_code;
+	const u32 *pixelformat;
+
+	/* MC-centric or Video-node-centric */
+	if (mbus_code) {
+		/* There is only one pixelformat for a mbus_code. */
+		if (index)
+			return -EINVAL;
+
+		pixelformat = sun6i_csi_capture_pixelformat_find(mbus_code);
+	} else {
+		if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+			return -EINVAL;
+
+		pixelformat = &sun6i_csi_capture_formats[index].pixelformat;
+	}
 
-	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+	if (!pixelformat)
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	fmtdesc->pixelformat = *pixelformat;
 
 	return 0;
 }
@@ -1065,7 +1096,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
 	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_csi_capture_fops;
-- 
2.34.1


