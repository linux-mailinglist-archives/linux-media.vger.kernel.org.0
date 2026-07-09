Return-Path: <linux-media+bounces-67156-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rah2Gu+eT2rPlAIAu9opvQ
	(envelope-from <linux-media+bounces-67156-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:15:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F33E873178B
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:15:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=pUCt6kT5;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67156-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67156-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44A773038BB0
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAB927A477;
	Thu,  9 Jul 2026 13:12:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38B248F66
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:12:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602741; cv=none; b=JY3GjkCo++ikhaW5JjpJYmQY44L1sLUkf9zodT2EVaQ52o3tCwUqbkwRBlr2PPqdplE9IhU/NKAaeBr+0jwLhNWv8RpE7Io2OMWW3Uh2SSy5YknBJBo7gP/oE5Uq9Xwzg4y86VjUuDH2p5FpuVGVmaqnNVlX5/84d0O2pFE++OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602741; c=relaxed/simple;
	bh=6wPyJuyF+/xBBGX4QagqtP33CTHXZy52Mtv6fMLp970=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FLGNawo6+zG+Ik/irDNAbxtr+w3UU6PFTNlR558rfkvye4kRpgTg/1z5MaT7W/qN5EzTQgPC5jJRss15itycY9Q1ev/RilKhEFifsYwEljole4vl5HiL/GDWTMpVwIRY5aeotmtE81Dy9pO7Xl6NVh8rWaSecdS6q0iFSW4PKck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=pUCt6kT5; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so7163205e9.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783602734; x=1784207534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrKtzVIGFaIJtEucWTbdAfl+74MzcIHqgRfH6zC75gw=;
        b=pUCt6kT5ygqL8MsowtA7XXB92Uy7w1cRT5V1kxkuXLNEqrrg/2APBBJE1xiV14Yv/L
         f8hvefm3k1l4mYahtpXOdE52+McfeLZqGv4tmoRVLaefEOEOXejTzvlViPNPiDJ/GWNJ
         H8vWTaK3FzR46G0qNYcJ4UJO92AzuTS3AmxFSsez6Y2NVQ5dadfhCzrK0VI8Zp0aLPre
         734Z4ELnRbFz2y3LJ6ylPDsVYxIJcXfz1Z0RBRoBVfTp5jI9QcJGqN6Gp0gyzGvmqCAl
         yUgWVVxM57jqmmuk0koHr9TgfoGakltj2OmYW9l3yzm+DyRZ1rBubz+oRuSpJSJP2KI6
         k+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602734; x=1784207534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrKtzVIGFaIJtEucWTbdAfl+74MzcIHqgRfH6zC75gw=;
        b=o7bHUjzbYnyIJJ0qE50W6v1OhP409pKmaCvaCT5iwEFaQB+9LA/sMmOJX03P+/f5l9
         Mv6I6vmSd0bdvSb36A9MlZn4Mkg/CJn8pBsk6KqH+n+mVUZs7K+Lt4nCaRowJNcqTHBV
         ddzeUUS4JqJT8ZfVvOtFXsIFru0qOBVnoNITGkwap1aTll+swtWrlbrLU2wA3QisdeTL
         HeiuDqqmXoII30P6aBTnsGqw7gK726Ue9CzWKDUtWAwt5MODgMCIx5Dh+9S6ZmnhlDfI
         +Cp5x+hx3Vn7gBpkizDQDzlCJlzbM2csds29ggg2Ch+gH4tt4DzJvadCSwXxb9lcWSY6
         eFag==
X-Forwarded-Encrypted: i=1; AHgh+RoYy3CoSolUMX1zE+gHPM+JqN7YoaSZ/Ecky0jNbrpvYheOgIC/+j07Eh6/pxe/KdUgBBN8KBVrLojhbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN0qqLjezDpdwafEjVOtoCXLE8UiMvzKpzgPFTd6CI5ZZNnYlO
	i4DtBKgSjJLjwuVDqy3WHw4ACMDWjWw+iDB08dy8GwQxaJRNI7U7qmLba6pn00VAjxTRGx1H2sB
	djXywg8gw
X-Gm-Gg: AfdE7cnKiYgCqgUGE3hnBPd767ppEPq//1l0SqEaJurJqYoCZIDm/jBpFCN5pjltzvK
	oeohKLE7FXHtxxbw6epgzyQq+0ycB1MLnB9+qcO7th572pkoS2Jk8yp7woqxGcblkHk2tWc5+Zt
	nuTKOOwpnZGuxmpEbvKeroyP3xQtTcidlN70k8U1OMLjTMzjDUyDEgUaQQv8uSgjRWPpnG8SmG6
	qYwf84qndxJT8Jn/owlVdkeaAQOfErIFOl6nQSC4LXId2i4bNz2WzP/+6ixgelvJPP1KSVDpfuS
	E/tyXrxeOzDsZWi61kOaKMyUYZiGOYOpY/Gclmw7AUrh/xW7yrl07uq1Ne+TGgVcbvoGKF8mf1X
	5htXzEbONhmcxtFlDXR0aCDIrD7xtI68YcP0jeTaHqiZj70+2o/Zld0NjQypMdgfIoJPFk/Oy3n
	rqnWnh2b9OIHcf7E/oWNplhJ5LO1dUyd8SZfvlP0iAVU4Cfw/dWzg3oE79Wf8iOtXm3VZKZd5C8
	e8JpIkoT3H8+/GaGqlZQQIkw5XqTQuNhto=
X-Received: by 2002:a05:600c:628e:b0:492:6113:d4fc with SMTP id 5b1f17b1804b1-493e68cfbbcmr70465045e9.17.1783602734192;
        Thu, 09 Jul 2026 06:12:14 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm61196745e9.1.2026.07.09.06.12.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Jul 2026 06:12:13 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: hverkuil@kernel.org,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	detlev.casanova@collabora.com,
	kees@kernel.org,
	michael.bommarito@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2] media: v4l2-ctrls: validate AV1 ref_frame_idx and primary_ref_frame
Date: Thu,  9 Jul 2026 15:12:11 +0200
Message-ID: <20260709131211.44425-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,collabora.com,kernel.org,gmail.com,vger.kernel.org,0sec.ai];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67156-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:detlev.casanova@collabora.com,m:kees@kernel.org,m:michael.bommarito@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[0sec.ai];
	DKIM_TRACE(0.00)[0sec.ai:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,0sec.ai:dkim,0sec.ai:mid,0sec.ai:from_mime,0sec.ai:url,0sec.ai:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F33E873178B

The stateless AV1 frame control V4L2_CID_STATELESS_AV1_FRAME carries
ref_frame_idx[V4L2_AV1_REFS_PER_FRAME] (signed, -128..127) and
primary_ref_frame (__u8), both copied from userspace. validate_av1_frame()
already checks flags, quantization, segmentation, loop filter, CDEF, loop
restoration and superres, but never bounds these reference indices.

Decoders use them directly as array subscripts. In the MediaTek decoder
vdec_av1_slice_setup_ref() does:

	int ref_idx = ctrl_fh->ref_frame_idx[i];
	pfc->ref_idx[i] = ctrl_fh->reference_frame_ts[ref_idx];
	slot_id = frame->ref_frame_map[ref_idx];

indexing reference_frame_ts[8] and ref_frame_map[8] with an attacker
controlled signed value. In the Rockchip/verisilicon decoder the CDF setup
does:

	rockchip_av1_get_cdfs(ctx,
		frame->ref_frame_idx[frame->primary_ref_frame]);

indexing ref_frame_idx[7] with the unbounded primary_ref_frame. Both are
out-of-bounds reads driven by unvalidated userspace input.

Validate in the core, like the other AV1 frame fields, so every decoder is
covered: reject ref_frame_idx entries outside
[0, V4L2_AV1_TOTAL_REFS_PER_FRAME) and primary_ref_frame >=
V4L2_AV1_TOTAL_REFS_PER_FRAME. The upper bound still permits the value 7
(PRIMARY_REF_NONE), which decoders handle explicitly.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Rockchip/MediaTek SoC
hardware required).

Fixes: 9de30f579980 ("media: Add AV1 uAPI")
Assisted-by: 0sec:claude-opus-4.8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: wrap a quoted decoder line in the commit message to satisfy checkpatch
    (<=75 cols); no code change from v1.
v1: https://lore.kernel.org/linux-media/20260628134105.21001-1-doruk@0sec.ai/

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index ba047d7d8601..5096c48ea402 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -793,6 +793,7 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
+	u32 i;
 
 	ret = validate_av1_quantization(&f->quantization);
 	if (ret)
@@ -836,6 +837,14 @@ static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 	if (f->superres_denom > GENMASK(2, 0) + 9)
 		return -EINVAL;
 
+	for (i = 0; i < ARRAY_SIZE(f->ref_frame_idx); i++)
+		if (f->ref_frame_idx[i] < 0 ||
+		    f->ref_frame_idx[i] >= V4L2_AV1_TOTAL_REFS_PER_FRAME)
+			return -EINVAL;
+
+	if (f->primary_ref_frame >= V4L2_AV1_TOTAL_REFS_PER_FRAME)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.43.0


