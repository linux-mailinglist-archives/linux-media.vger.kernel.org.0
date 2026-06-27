Return-Path: <linux-media+bounces-65787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gu8uEjB0P2pdTgkAu9opvQ
	(envelope-from <linux-media+bounces-65787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:56:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 956916D15D2
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:56:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=z0MBDnVy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65787-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65787-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCC9B3046E8C
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 06:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E233914EB;
	Sat, 27 Jun 2026 06:55:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E004E37F724
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:55:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543342; cv=none; b=O+fhxEqmQ4iJZyYqC2o0U9GMiqPoKQF5XM5dMsX4rLRM/l/4AU8/El8g8Y3Vkc+yA+r3f0SRc4oC89i8Lsy4Wf7kXJ8aqaOIvIpg1M1lqFC8KlcdADKBwJBu5hOZtIcLd4BczWLHeunC0yVhz1vCApwE8G0EQ5q5UQL3T3zwl0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543342; c=relaxed/simple;
	bh=9MtYuRi0f8vvz9OlNCUO2lRqNo4uQ41E0m6ZuTR4ysM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npf6oVx0wpHzinOHNIwxwMzZK3tfmFJ3qmspMI8K92ZofwFCvCqe/HlLpVRk0Xksj8oALZjxCSRLQ4W1gN6de9hFqY4D0xsnxMFFvxSkDgvAyd0RCuMkDMv1oWuWFm67Se/CymBTotkX13gSFQFWYgll5VUAMiBE81EEverouW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=z0MBDnVy; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-46cdc80779bso1529163f8f.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 23:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543339; x=1783148139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI0+mugrNh7ILt3xdXuUk2twFjJ58HUZZs7uu1IE4s8=;
        b=z0MBDnVyixxSJFiX6IDx8mUsRCi+R9RWo+0uDXb9mMZSa8XaXzfUa38oLv+D8/Z3uk
         XfuYg2ztnB2xUke4YoogScqIImXdbxB+rRS5nXP4Onkvc9MuryI4wC90+a9Fuy1hsDrC
         qRLaOuC2kCN4EzEZrzAxISHgw0rpI/FturCEaVmQ+tPR0a36DLOHsQyaNHjfiKAIvIR+
         oBXNYTsN5ahrviAnMDaBplgnO6JzE3/qaB9z1xdDJJbA/4d9S2eCyehqjH0TKXKw+jev
         CvMyV5jxjRrzHZcLMe57QOxj/Z57Je4nqbhyjZfeZ1s02AqLP4pYDeK3sv6pqmtdMKsY
         bO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543339; x=1783148139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CI0+mugrNh7ILt3xdXuUk2twFjJ58HUZZs7uu1IE4s8=;
        b=eMWiRePgrSyPftO4NX91kk4LyUttlxmBBXbBVWq9AskWdq/DZAw5TpAVbQqlFZqhd2
         ayvsFMdSh3oVxU20y+4TEcKlr2O7HjrcCxxCDvwGxYRtQ44FX8iSwZnEH67Mqd5uPCte
         ruEJLnShN97ACrzCeeaqoBzTyCRGCkcv5JFOXd92NHgmlWnl31OoqYxRsZyZ8EkD1g9o
         9VeEnBAl//8BJ4BK+f6oBhia1Z4h7BYKFHrrUFe5syzHzMcnAeeVD+1wzyfNsghaRipj
         zj8ukwJC+VIKLDqXFz2NND+4uKMkuwPYoNvtjrN1B2tfigdAD5LBjZBjKRhraASbU2Qn
         mafg==
X-Forwarded-Encrypted: i=1; AHgh+RpFZuEnip0vem0HQYzIz3+JTDvuBwnabZjKQnKU1aKwKOwmCKRqlSqv4FGmb1Sn1O2VivDfHHvHyRCTYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJgN2rUOCE0qDkKt0ci1AXUbYKwoGSsvQPKRs/G8blzN/KenU
	s5XYgOfqIYQDkyaIq8yJukB/nZCcZYLJb5XjruAvMmUfAhfBt8wAltdGQikc4HIV0OJrttgYRDE
	WWTD0L15x
X-Gm-Gg: AfdE7cmo/rS5UfiBPArOi6Hn4GqYKLA5cae5z5+WNRVV7nMZOtTtWhDIolwC2YJaBpq
	57ud5s/zpHHlT8xP4pUSxUp+25Gp+BQW1vvR0JcTLOGKnfEBNRgdkXiq3sWCc+k63Kjgxkz5yIc
	pvJ8IY+yuLFk6DWbJ0jMnysU6e/vUWwodTnlb5ZlnzUKZkE7NVgIJiVXGUnfdxiy47D72iWzP4v
	8GjbCqXe4FoisY4A8AaJjHnblO8HnPz5hoLYmaO9JpLi83tgwFoRtAHHDxuQ547VaAmsQcav8ZY
	7/xXWzOaucW3tu7OCgbzW7k1WXA99grbmGwyUOC15sUPPixs9JDuVZmdidIeXcWfSYo/+NII5vb
	TFU1/oS38ZJUa+EQ33TsoXbYZkg3MM3aA/JuHsaTfEMIh0V/plA+mJ3y97ErMbCh1nWB36Nc5/v
	BoTv15z3uCllEhfzfA1PnuA2plwFiZMgDmFY31A3ve3e8TNQOB6t82099aTq88m5hhFvH9bf2Z1
	GhiDMwQxtJC8e1yF4LoPWq+1HiYSebc5Rg=
X-Received: by 2002:a05:6000:2501:b0:470:c049:b444 with SMTP id ffacd0b85a97d-470c049b6a1mr1348264f8f.0.1782543339444;
        Fri, 26 Jun 2026 23:55:39 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:39 -0700 (PDT)
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
Subject: [PATCH 2/2] media: meson: vdec: guard against NULL prev_frame in codec_vp9_set_mpred_mv()
Date: Sat, 27 Jun 2026 08:55:34 +0200
Message-ID: <20260627065534.88527-3-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65787-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[0sec.ai];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,0sec.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0sec.ai:url,0sec.ai:from_mime,0sec.ai:dkim,0sec.ai:email,0sec.ai:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 956916D15D2

codec_vp9_set_mpred_mv() dereferences vp9->prev_frame unconditionally,
both when computing use_prev_frame_mvs (prev_frame->width, ->height,
->intra_only, ->show, ->type) and when programming the previous-frame
MV read registers via codec_vp9_get_frame_mv_paddr(vp9, vp9->prev_frame)
(HEVC_MPRED_MV_RD_START_ADDR, HEVC_MPRED_MV_RPTR and the RD_END_ADDR
computation).

vp9->prev_frame is only assigned (= vp9->cur_frame) after a frame has
been processed, and is NULL after allocation and after a flush. The
caller, codec_vp9_process_frame(), reaches codec_vp9_set_mpred_mv()
whenever the frame is a non-key, non-intra-only frame, without checking
that a previous frame exists. A stream whose first decoded frame is an
inter frame (malformed/adversarial input, or the first frame after a
drain) therefore triggers a NULL pointer dereference.

Disable previous-frame MV use (clear HEVC_MPRED_CTRL4 BIT(6), which the
function already does up front) and return early when prev_frame is
NULL, before any dereference. There are no previous-frame motion
vectors to consume in that case, so this is the correct behaviour as
well as the safe one.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 27 +++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 5ca27930239f..1df641202687 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -993,19 +993,32 @@ static void codec_vp9_set_mpred_mv(struct amvdec_core *core,
 				   struct codec_vp9 *vp9)
 {
 	int mpred_mv_rd_end_addr;
-	int use_prev_frame_mvs = vp9->prev_frame->width ==
-					vp9->cur_frame->width &&
-				 vp9->prev_frame->height ==
-					vp9->cur_frame->height &&
-				 !vp9->prev_frame->intra_only &&
-				 vp9->prev_frame->show &&
-				 vp9->prev_frame->type != KEY_FRAME;
+	int use_prev_frame_mvs;
 
 	amvdec_write_dos(core, HEVC_MPRED_CTRL3, 0x24122412);
 	amvdec_write_dos(core, HEVC_MPRED_ABV_START_ADDR,
 			 vp9->workspace_paddr + MPRED_ABV_OFFSET);
 
 	amvdec_clear_dos_bits(core, HEVC_MPRED_CTRL4, BIT(6));
+
+	/*
+	 * prev_frame is NULL when an inter frame is the first frame decoded
+	 * (e.g. a stream starting on a non-key frame, or the first frame
+	 * after a flush). There are no previous-frame motion vectors to use
+	 * and every read below would dereference a NULL pointer, so leave
+	 * prev-MV use disabled (BIT(6) already cleared) and bail out.
+	 */
+	if (!vp9->prev_frame)
+		return;
+
+	use_prev_frame_mvs = vp9->prev_frame->width ==
+				vp9->cur_frame->width &&
+			     vp9->prev_frame->height ==
+				vp9->cur_frame->height &&
+			     !vp9->prev_frame->intra_only &&
+			     vp9->prev_frame->show &&
+			     vp9->prev_frame->type != KEY_FRAME;
+
 	if (use_prev_frame_mvs)
 		amvdec_write_dos_bits(core, HEVC_MPRED_CTRL4, BIT(6));
 
-- 
2.53.0


