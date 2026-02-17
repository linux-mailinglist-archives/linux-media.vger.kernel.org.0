Return-Path: <linux-media+bounces-52952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIEdJ58NlGn4/QEAu9opvQ
	(envelope-from <linux-media+bounces-52952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:41:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 149711490A8
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF4EB301914A
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 06:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA7B27979A;
	Tue, 17 Feb 2026 06:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3ZlqvyH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3C623EAB7
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 06:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310489; cv=none; b=sVRoEsH2KKvX/oilIswolqhJhRfe/ZkC3Mxlv6TTnqSX6lSkPkNCZnNuct0txEJj+iy37zAYL/Lt64Qv3LyKRvbqzDao3HFpP7jQ/ntCYoTRyN0lM3SIee6Z6xVDqC91LQuiycSmiEnyaGvrFoFxMDz7hmvCXBNo+CnJ5matqn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310489; c=relaxed/simple;
	bh=6QAaRCbkp2RPgmmp0U5tXx6iD0Q42olMqYXmxNetrCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H93qOeKWWQrtCTG9eDmSVzuchCul2eG0GfLyvrKWltr4B9HaViFctuHPu86y0rqPEjbaCscmAKIfYB0UTsxqtz5OuoHQdyerJIVfU0PLK9XFEDy8HQChjvD7Mo3N3k6lP4PulkgDDO0TXUJeZxUzgKeMnpZ80A01nOw/dv5+8ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3ZlqvyH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483770e0b25so32732545e9.0
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 22:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771310486; x=1771915286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coylU+9YFK5E+sqrx3pjXggNhPG4ewWmS2RRAiRWKNw=;
        b=R3ZlqvyHmDe/6GIAWJ8+ME2uGVQn4xe1gU+TJLJLw20g325Nwfe/x6zpJvVKuTNzkV
         //7IgdS//zMS08b9ZIgfr+UjQbTngS9Yvm8kwvZ9fj38GnbIoGJ/Lxv6lgBwu+cYJf9C
         vH7S3A0u88GMH8EjgzXddgHc8eSCvQX2Ob4/sNXDK4MacgUNwLU3VGpfccGTTFDllR+G
         gt064OvSvkUcHOk9kKJFOXHE0+8pIwYfEqrjO/HjiXvFp9u3NtTgPvsnrxSDVCC57X8f
         eyyrxsZpVbH9A3+D8nYxTyLCjUKBeRY8UGvfqhQMvig1SXFy0sKDZn6hDbwLxUv0mjkd
         FsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771310486; x=1771915286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coylU+9YFK5E+sqrx3pjXggNhPG4ewWmS2RRAiRWKNw=;
        b=SB/46ZBLqFkmk2yAgdylBS75P9ymDWY6PkNVRwZHfi+PlscADuojMVI3iSTc+b68YF
         qMSTCemi6KVtY0C4FR5jaJTwCPRD4+EwzIV8tCU+/24Jba5EtrSR2MTGU9hXFBZrGs6s
         nbOf1NhiDemSV+z4LHoPmHbJO/ptohHC9w0eykD1AaQKsLE7Az7spEu1df57lhsLpzwk
         lksNavnRvXe6NBg8E3fMQcgx6Dj+XudpQdCVDJ0SOzv9goSmOXSthN6iE8ebAvRLOOzq
         T6zi3X3t9QrP9udgcEeNwMgygchAsPaSueCxyk8yyjpJI1WT+bggpEq/sY/jWkr2bSSE
         Rulw==
X-Gm-Message-State: AOJu0Yw/6fHpRKLJrru99qYWIHwSiUlQYVP01soTMpQWnlsV+YOXD4kN
	686L1/DdFRaawwsTSYMeLmD/F7TR4XPiHQhsMavTf3zB/++NGo3AmK8Sdz+XWG0Dh0VPug==
X-Gm-Gg: AZuq6aJMkRCQkWquJHqzPRE1EVdYW13RIM/xZtshrE6829tSSEgKKs3/l260qa2hams
	wat7p3/ojRPWJA49Gp/ynVQCAzIJkniMyQDlPynjHuA50SaW2SGCxu/YHZR2R2IpHEZGqTbxu8E
	Zca7Ys+8/3HYiLYuShuQOuyWgeMUBH1aCMTQOBfs1f5G3eBgX7uSczpsVj35Dvhl/p5cC65UINw
	KoTpIEUXbfRyomJ4f3tmCytqaic82ohOPu6pAd2AtPzA7iN9o/h+SMcncKD2Fomx4qeN2ERx6vt
	cNDx1uLHi5uEU4dK6MEN75knMRVhsXJ7/xmSyTkIgVZDR83U784RfLOoqLH5HpMQ0Un0UmFS8UV
	dPeIHxSXdQxqlpxIL7TtSjeBMJid2NmzbGvK2YC/EaJLXFKO20Soe00XbtlSOIYQG9JndUqYjaR
	rLnfe4YEwa1t0o/NUkWzzZfGpFgaH+oYZDHkOzkTgym6KV8ce/BUdlNonL030XOfPZniq4QjbUn
	9uZ5umlkA==
X-Received: by 2002:a05:600c:8b4c:b0:480:5678:1fdd with SMTP id 5b1f17b1804b1-4837105240amr217898335e9.12.1771310485987;
        Mon, 16 Feb 2026 22:41:25 -0800 (PST)
Received: from thinkpad ([204.18.30.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7e50casm480575605e9.8.2026.02.16.22.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:41:25 -0800 (PST)
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
Subject: [PATCH v1 2/3] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Tue, 17 Feb 2026 10:10:49 +0330
Message-Id: <20260217064050.18388-3-arash.golgol@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52952-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 149711490A8
X-Rspamd-Action: no action

Report the stepwise frame size range supported by the CSI capture
hardware for the pixel formats exposed by the driver.

The hardware does not perform scaling and accepts any even width and
height within the reported limits.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index a21a146fb02a..dd06d4c116e0 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
+					     struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index)
+		return -EINVAL;
+
+	/* Only accept format in map table. */
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_width = 2;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -805,6 +826,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1


