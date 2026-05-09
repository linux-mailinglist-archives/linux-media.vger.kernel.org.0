Return-Path: <linux-media+bounces-60989-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AmzFZLB/mn/vwAAu9opvQ
	(envelope-from <linux-media+bounces-60989-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 07:09:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B8B4FE18E
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 07:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 632843014281
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 05:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DD737AA98;
	Sat,  9 May 2026 05:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7S5vW2h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEDA1DB13A
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 05:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778303362; cv=none; b=E1GgXKIAUI3zfjR3px4DXfUlD9aEDdHvod9eDo1HKoN+DnElYXpeX1VJ2ZNu0GQ1qeLlszJPlV2PtdVLVOHjDhUuUoDzzA5Ehu9rn4W/FTtFeJxCFgEWYMGD//f8MNhMxEl4h/ozWXmnh3wJnxdwwvrfYBrDrBbTz3San/Wj2kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778303362; c=relaxed/simple;
	bh=l2h49IBJQQJeRXIpnECLHnQqhjjLmf/4MI621awvlys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GhgHQz44SUFTDQjq3LveKCsBWhdto2lDVokGEtEWZunt5bZ9EBQXtcJecmBjCRedl+TQuVaJh/h/MjxnSjB3GfiwYlvIa4LuoWH10PI83sLQdRq3ub23BaCnVMLuPiiTmBuPKdNsbiMFqcM1Q6vZDnJaYlixH0vzxPLAOxHR8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7S5vW2h; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so22875505e9.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 22:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303360; x=1778908160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5bmiBt/UaAj8FYk6z1JEgvnehBBxvzIZjMWnqTHpn8=;
        b=c7S5vW2hLNfVvUNsCunjdcjCoiyjZcAUAeP1Z4Cu8JLZ6L48px9hGSv1rbH1hbG/iN
         h51/v9V3sbEfV+QGWr7Aq5Oj/Oo15f556O24ffCgc5IOQKbloRXhyDHqrIvoYYcsS/wA
         b3Gqk9FrCRM6ydIcvyPaaexekOtKsb2AAFgelO/ZaQfAIoRlTCHwJt26M5jJd6wDStw9
         IfyXGbyg5KrgmgDbL1aefYiPc4eSq0F/RPI3pHfwvf1CWlbio77LiwJ8omxxZBBUSGDr
         +EULyxS7R/c6VLw01ZU4qjypSxtU/9vIXiX3aF+e2QH0HxNElrVldMwjIxn8n15nXV8O
         0Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303360; x=1778908160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5bmiBt/UaAj8FYk6z1JEgvnehBBxvzIZjMWnqTHpn8=;
        b=ZZJipKSY3DHquVtHPAU82dIHti1sSEkCe2BFOgPVjjeZRMubT+nPwxggLHmC8NN9Lt
         GF3CGabgXtdxOavHtst9krWp3wB7MvDwDuzjiJHtkRKt+uIfuyoBqewNS0ljwklypObK
         SGZp4Z6+TegZikMoHhnHwLw4nNBi5kcsdR5ZqGfYvdWs9dHGX/reLBgx4CdXeeKvLc7x
         sX4EsxNBp6YYEkSFGtDIfudTufeMVcYmjs8sGYZvP/CVnfc83WDvNvUhKPDY013vQG1F
         X5vhAF9muJojFmdgHv84vGb99q4AgJ5bCL2E8VedY/VYnW59cUCQyxICXTqLPL1ak7cl
         pIbg==
X-Gm-Message-State: AOJu0YzzF88pLB6w5WTSFz6N+70wF675gqU43Q576Vm04Tv60aX06ioA
	Qw9LWbh/zqkol3LuGVQjg7yRoxXdVLiT61XfdZl1TeAQqRI+ILgf53LC
X-Gm-Gg: AeBDieven48oULE9zxyQQGyNEmKClZD0h6Eto2fpV5+PwBtdXdXeOmb3fqH/w6iYRZL
	VDL/gwjWEmJVpAeqksMsTn0EuqKvwzLVDpcgVWIKNiFLNTnxeY1NWFQHXlFDljWxHnvcfKAVYd2
	sWCl09ZasnoUubGLiq3blZM9wayCG1JMdNeyc5QttFBF+SqLwS1me1Gy5ZWgp5qLmEEevaFVX75
	/6nYGN/svqqGk6K9Yp+2znuGxjGmNZ8VxgXhjdmDBGo4q9oLwLq4159ufgqFTMG6mXHTDTjP+Y2
	swyQCZ+6KTd7tbHQQk1mbbjxTSdQjiv6X0aVCqReL3SDUiEPuHvaLUsolhcW/ulK7UkAaUMCHps
	vIPHDuYPRCXsoxB7OeepsLpgUaL7jbuNM1sI0sTaKsC0W6mxoc670++LXMURej/EuiYHddo1Cdr
	xonP+6vcRcXMG5vYKazp0zCug6xJOEvxTPYq4mXqE2X1s6Dq/ip2PJh7RPVKFskjf0oAlUZzDoe
	XNcE8gLGw+8ddDKSNO5
X-Received: by 2002:a05:600c:c4a5:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48e6cbd6c10mr61082785e9.5.1778303359626;
        Fri, 08 May 2026 22:09:19 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702f407asm23776455e9.13.2026.05.08.22.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:09:19 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v3 3/3] media: sun6i-csi: capture: Support MC-centric format enumeration
Date: Sat,  9 May 2026 08:39:21 +0330
Message-Id: <20260509050921.22158-4-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509050921.22158-1-arash.golgol@gmail.com>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D6B8B4FE18E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60989-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Action: no action

Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
pixel formats based on the provided mbus code. Advertise MC I/O support
on the video device to reflect its intended usage within a media graph.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v3:
 - No change
 - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260508161721.94285-4-arash.golgol@gmail.com/

Changes in v2:
 - Return pixelformat directly instead of a pointer
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-4-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index f788b4234673..5737ebaa7297 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -327,6 +327,22 @@ static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
 	return false;
 }
 
+static u32 sun6i_csi_capture_pixelformat_find(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
+		const struct sun6i_csi_capture_format_match *match =
+			&sun6i_csi_capture_format_matches[i];
+
+		if (match->mbus_code == mbus_code)
+			return match->pixelformat;
+	}
+
+	/* Valid fourcc is non-zero. */
+	return 0;
+}
+
 /* Capture */
 
 static void
@@ -729,11 +745,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
+	u32 mbus_code = fmtdesc->mbus_code;
+	u32 pixelformat;
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
+		pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	}
 
-	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+	if (!pixelformat)
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	fmtdesc->pixelformat = pixelformat;
 
 	return 0;
 }
@@ -1065,7 +1097,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
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


