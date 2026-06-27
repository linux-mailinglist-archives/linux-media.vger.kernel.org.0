Return-Path: <linux-media+bounces-65781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rtbVKztwP2qTTQkAu9opvQ
	(envelope-from <linux-media+bounces-65781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:39:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F816D1563
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:39:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=uaBKMamt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65781-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65781-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D5113041A1E
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 06:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA293749FF;
	Sat, 27 Jun 2026 06:39:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4E36E47E
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:39:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542352; cv=none; b=uDI5G9a7lalYA1IkVy6zLTX8HN5sh0YR4M351It7b/JG2Kk00Pem+A5J+hCcEdZLkh2J1sM+0/mAXWIDVAgSztRXcBAWg16Xk4qLu/soflVKXtXiarpSczpPSqkz7s1HAyWlMx6cKeRdnkZea7znofYh7ui6cPtQDZJwrE5Iviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542352; c=relaxed/simple;
	bh=nxNYPvmWkiMyssbGy/vyBZfAMksgd8lEg6+v+sNqj9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SWfsg6y+P832lNdDxcIYxWjOv3ZDLho11Nz3kB9qDTvH8TRp6+WWSwZLVPHtZ0QHQonXkyTYSZVzuF37K/TFMK8QxoWYD+W9BgZ1sqjJz53Aij+uzb3E4a7h7us8FbuCWTwDgHUOb//hm8sABPZTWRqlqnFroNgn20bty9hZeR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=uaBKMamt; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4624c1409c9so1014304f8f.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782542348; x=1783147148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajFU+HuHYiVxYPwroExLm2o4iOyX7zxK6N/HTFuJyzY=;
        b=uaBKMamtnY8ltBazRLWYx0pO5gxUGyB5kJzSYZ8RwRi4fA3us1qwZFF1xYmnuOpp2N
         Mdv3DzWh9UDDIymNNPSmhJlrXMHs6vA7ijuPQqMo3JboJu0DduORUzzkUOI6SCf4maZj
         ADDRxXCOcgFrX9nJ/fp4/JFHAKdT0YcSfCWjUfvyE9MHe9ZhlmQhBZnDOdNXz0mTrOqV
         sRWz83q/Bwn9WAbLkznPLx1KAF39Isb4WZ2Ctd6B2YX4v5nucr1TqPGf3xvXaNOjwRwZ
         +2yH4XzTqGfV3ktAnmi1B8K2O8c+qy+qOki6Oof1LziNCyM5fuTYYfaEka0zad4enJrm
         Ye7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542348; x=1783147148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajFU+HuHYiVxYPwroExLm2o4iOyX7zxK6N/HTFuJyzY=;
        b=GsjPL8k3TDjbWlhbD0jnj1ZIx+KwNh0CyyxnqBW2lxe1OgrfQbQ0Gh+DGWIOdkdR48
         L0pGLV/xK0Qj6LmdSQkoVCwjCBkBR3XHETGgD3xanOrS1p5WylItyHomj6ymtXQiKBJD
         d+cQKDDZzLu4ZpmXbo9wmNZ0cB3zVTp6mIdEVG/xT+LeIRsLHtCIRJCk29sHprgMQioO
         Lr35sP8Cp5SXFuxjf+IiM++pFYTVzG+biHHwgBr853tMcI63lu+J8kIqcFkeXOgNJlGD
         W26UmrDlg1MTynTkfUkooBHChsrkA27WoM8c+P6lR8MopKC9vL/qQ+YqxrIYqyTGaJbx
         oBBg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+0R8S9yIIDVlUrZzPxfiDbIVTOM1UKIkfakgplBG3rMaecbD6A8AaMm9CTz5oC1lbrsi0DNm5prZaig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkp2Ijnz8X8ire27XNw5Nj1/gT9EqXVhKyHINfJXZiO5k+kUhA
	7ap8MkuvW9ubdc97rueut6wRdlW+nvBuZ/5aGuIAp7yvbxhsBIMAZbtUYmztKSxIJAcg
X-Gm-Gg: AfdE7clugmy525lK61F7SbJAKaJkgdIzqJywpiBBkjSQDlCP4WX/lJZtYnOA95vsLoB
	FPCg8u8lTonm22fc19a8L8PFRdrwgCgVvigKbyUzkOCQ5A7E09a/0x1Tr9sklcMB3iefoApzkR4
	T551vHqRPesSHAybxUF9tL9P6lBFkDSoT4in+s5BMkSA1ObO6Y8UHH1auX7ePukVy8wRzwqJiI+
	7hM8W3EWwtaphOXotD94kisAYeGZJoqHJhpMwPp1FrVdk4MNr9z9w3V8cJ4jvwi+OHMySed4LPf
	anpKOE1eoWryduCuCOrPrToT4ZujKBGN94yTmaZdySt8EVmCEa5oaforDwi4KfUHZhc918hzPm+
	3iVpWOd542ogxipw8MRYpXsK2zFmxaqmn5JHGNSz1mtfbYAWKt8VusFAsZ6ESiQxkqAbXCNoTub
	i7WFbtNms34NIVeBL8fGz72s5rQyz1YK8iBY/2yd2f6FTQzL8b4paUHTmFe3y9cY0rMCSoBYAv8
	0x6o0KbFoxB4eJzXPtf987Cj4D66PtFGV0=
X-Received: by 2002:a5d:67cb:0:b0:46e:64f3:ee74 with SMTP id ffacd0b85a97d-46fb94541e4mr4577099f8f.45.1782542348074;
        Fri, 26 Jun 2026 23:39:08 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c22c680fasm31551666f8f.34.2026.06.26.23.39.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:39:07 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2] media: meson: vdec: fix use-after-free of in-use frames in codec_vp9_rm_noshow_frame()
Date: Sat, 27 Jun 2026 08:39:05 +0200
Message-ID: <20260627063905.79363-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65781-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	DMARC_NA(0.00)[0sec.ai];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,0sec.ai];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[0sec.ai:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07F816D1563

codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
ref_frames_list without excluding frames that are still in use. When the
previously decoded frame was a non-show (alt-ref) frame and the current
frame is a non-show inter frame, the freed object is the one
vp9->prev_frame still points to; codec_vp9_set_mpred_mv() then
dereferences the stale pointer (use_prev_frame_mvs and
codec_vp9_get_frame_mv_paddr()), a use-after-free. Freeing a frame that
is still an active reference (codec_vp9_is_ref()) or the current frame
has the same in-use-then-free shape and additionally desyncs the
reference bookkeeping in codec_vp9_sync_ref().

The sibling cleanup codec_vp9_show_frame() already guards exactly these
cases before freeing:

	if (codec_vp9_is_ref(vp9, tmp) || tmp == vp9->prev_frame)
		continue;

rm_noshow_frame() simply omits the same check. Add it, also skipping
cur_frame, so both cleanup paths agree on which frames are safe to free.

The fields that drive this path (show_frame, frame_type, intra_only) are
parsed from the VP9 bitstream, so a crafted stream fed to the stateless
decoder can trigger the free-then-use.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: Per Dan Carpenter's review, also skip active reference frames
    (codec_vp9_is_ref()) and cur_frame, matching codec_vp9_show_frame()
    exactly — freeing an in-use altref/reference frame here also caused a
    codec_vp9_sync_ref() desync, not just the prev_frame UAF.

 drivers/staging/media/meson/vdec/codec_vp9.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84193..dad75950933c 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -1238,6 +1238,8 @@ static void codec_vp9_show_existing_frame(struct codec_vp9 *vp9)
 	pr_debug("showing frame %u\n", param->p.frame_to_show_idx);
 }
 
+static bool codec_vp9_is_ref(struct codec_vp9 *vp9, struct vp9_frame *frame);
+
 static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
 {
 	struct codec_vp9 *vp9 = sess->priv;
@@ -1247,6 +1249,18 @@ static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
 		if (tmp->show)
 			continue;
 
+		/*
+		 * Mirror codec_vp9_show_frame(): never free an active
+		 * reference frame, the previously decoded frame, or the
+		 * current frame here. prev_frame is still dereferenced by the
+		 * MV predictor in codec_vp9_set_mpred_mv(), and freeing an
+		 * in-use altref/reference also desyncs codec_vp9_sync_ref();
+		 * either is a use-after-free of an in-use frame.
+		 */
+		if (codec_vp9_is_ref(vp9, tmp) || tmp == vp9->prev_frame ||
+		    tmp == vp9->cur_frame)
+			continue;
+
 		pr_debug("rm noshow: %u\n", tmp->index);
 		v4l2_m2m_buf_queue(sess->m2m_ctx, tmp->vbuf);
 		list_del(&tmp->list);
-- 
2.53.0


