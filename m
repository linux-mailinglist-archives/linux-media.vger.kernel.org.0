Return-Path: <linux-media+bounces-65785-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Czh1AvdzP2pQTgkAu9opvQ
	(envelope-from <linux-media+bounces-65785-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:55:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B85D6D15C1
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:55:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=0sec.ai header.s=google header.b=J3sT3DVk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65785-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65785-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF08B301D680
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 06:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483863914EB;
	Sat, 27 Jun 2026 06:55:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43584317144
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:55:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543339; cv=none; b=tJSgxsCnTA9RmdW+PmFevZiuNsgvs7Dm/dCpcLsIxr5aBjpujIbITAatWgClZCfL6KCyvzYZS5qNwjnWMKw5KKiXwSPAOZvV8OD7SMiSJC+wVu9CUiK2LDbicFL3qrV1Ck+AGCqkJLp11WfqSZX3wQyny9Ji96AHHwJFb6ZaWMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543339; c=relaxed/simple;
	bh=FnsURhbwub914yAdhXH1FXah1Lu9rnIP4/mLkjigKiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQtIv91CuCuKnI+FtG6mCMyxjYKhJUzUuZdbkHmIWoxQShUkBcJVauOoKc2iPCjxvib+WoD9wZzbCv2LWlBafXuDEeGU4NxbAMUCWlXGVRBzq21by4ELt1uYsR3p/C0sSumxEVmRk+0Smtqrz5KI8BRby1poo8hsvfmq+r2TO8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=J3sT3DVk; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49222fb062bso18224175e9.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543337; x=1783148137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6URRVOLLPbDGmOPQIy9/O+A7E0jEC0aohmFeB/EeHoE=;
        b=J3sT3DVkE24SE/MHerwQPqaN6YM/hUCqtbeAwPI6TKjf0an6m3ZzIu27aN4DeoK9Fl
         iK7lG4+DON/shXKkHmEwIG1TcDxn3CG/KKAfM2HPx2o/aERZgwXm3aupvJRD5YxHlFrM
         ycX5jp3gsq1W/3kwgZhTaM9MdCqxl3T2VxhHl+Hqm6S0HJedivuiCyn6+SWEVoBkIPh3
         KOI2IAKQi/u1xXNI0WHo+VxWWDemPD4fc+d8sDFnpWU0czGplWttQPWA5SR60U7pfEYK
         t9IuXx+AiaCg+WxHBx50HkFjdS8IhmNtFO0cgfTGLbenBqEI2wUqz9025efqYR//kqjw
         FXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543337; x=1783148137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6URRVOLLPbDGmOPQIy9/O+A7E0jEC0aohmFeB/EeHoE=;
        b=KmXG4pI9Y6tKybm3+n5ja7Bp8Cehd+p+sbSO1yp7bL6GTIwj0PTOBFI6TvoTw9t5WD
         CkzCBIvI3Bux6gt0CTRrkBlZFeuJfQEYLHY2crzzKZHANYTL52uUQU9TYN7Tr+FJyIE9
         ejXhx/0j2nTWZUCgFmHJ/6gMh2sKQF0SYX9YO/g9fV3VQHi/A5BjaH7J+Jx+mtUeoA5o
         ZwcapzL0Ul8fVr+XDeS6F9bfd0Ulll5fmS+JrcwH3NaOnlvVTSECuuPzUqqdzfCRcS0h
         4+zxCJtnP7nuJaeDTw4JUK5bbKcmPt6HdyZZzFMtdYspqStHXLgitzapTGojVGQsXArT
         X36g==
X-Forwarded-Encrypted: i=1; AFNElJ/Dqlcdb2XsOiMW7IKXnG8YgXPvpKB5R0tz+0VxZoToOgV361hyscaiOQrKSdSNWMsqL36JfiMXyazNdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjo0/05T6+HDbNxyDYf4ZWWFmcplndxrwYbyeWIzuJXPIuEci0
	/FW2yWizN5htBpr2ZJ4s8HDVRx88vaXII5GCeTtNXt4HcrQXCfLFkdrRErqm/H5gch5R
X-Gm-Gg: AfdE7ckEsX/Cdet30km9A08FpDLE4h2m6tmW2mhcjWIlWHGpTadzkOc/jN+uZR7D/Dm
	A7ckr0Nyxsd/khpNY2JtsAP9nxmDL51ilZeoc2J662qXWszqJUxTHKvZVmG5SpJ3fCpFmdgf08B
	dEmYv5b1sXrhqNvshmJ2YWNO9x0kZn19NH83iqkaKOkzvVvYnAbFhOY+03Jmj0eq6D3KqMevVU+
	iZcBaqSqjD1cRq7Wqj8a3x3O7RG9AMB7jqcdO2w67nYpRtn/F3lEofPuHdtCs4pWamBs06jfZ5J
	hpTvdNH9bgCN4Z7MWM1Ct/5ZF7V3slbaecGXjZXE22gF3cK6NZbImIehalqUefLy/Hgv50QpMJP
	gASkEafjx35kyvsO1VxE6O2nMo3BPC8gaO7aIMA9oUMYYHWdjyW/UyvR4zEZj8V9Ln4GaxV2+hD
	ZeC5cHdxO5+WAQZeHhbIaPIP8mZvqkiyJ1Z+4bdcqgUj3mKcjjqJNCLF/WJvfPKclxfjZfkYuha
	v1UE3z1oXiqJXEwEaT2GM3D7xmRGvkhabI=
X-Received: by 2002:a05:600c:820a:b0:492:6eda:4296 with SMTP id 5b1f17b1804b1-4926eda42afmr59822545e9.8.1782543336727;
        Fri, 26 Jun 2026 23:55:36 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:36 -0700 (PDT)
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
Subject: [PATCH 0/2] media: meson: vdec: fix two more VP9 reference-frame lifetime bugs
Date: Sat, 27 Jun 2026 08:55:32 +0200
Message-ID: <20260627065534.88527-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[0sec.ai:s=google];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65785-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[0sec.ai];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,0sec.ai];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:-];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,0sec.ai:mid,0sec.ai:url,0sec.ai:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B85D6D15C1

While reviewing the earlier VP9 prev_frame use-after-free fix, a
Sashiko AI review of that change surfaced two further reference-frame
lifetime bugs in the same decoder, both rooted in vp9->prev_frame /
vp9->cur_frame not being managed across all decode entry points.

Patch 1 clears the cached prev_frame/cur_frame pointers in the .drain
flush path, which frees every ref_frames_list node but left those two
pointers aliasing freed memory; a decode resuming with an inter frame
would then dereference freed vp9_frame storage in
codec_vp9_set_mpred_mv() (use-after-free).

Patch 2 guards codec_vp9_set_mpred_mv() against vp9->prev_frame being
NULL, which happens when the first decoded frame is an inter frame
(malformed/adversarial input, or the first frame after a flush). The
function dereferences prev_frame unconditionally, both for the
use_prev_frame_mvs computation and for the previous-frame MV read
register programming, so the NULL case is a NULL pointer dereference.

Both issues were found by static analysis and are not yet runtime-
reproduced (Amlogic Meson hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Doruk Tan Ozturk (2):
  media: meson: vdec: clear stale prev_frame/cur_frame on flush
  media: meson: vdec: guard against NULL prev_frame in
    codec_vp9_set_mpred_mv()

 drivers/staging/media/meson/vdec/codec_vp9.c | 37 ++++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

-- 
2.53.0


