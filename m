Return-Path: <linux-media+bounces-65788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id beAHG2Z0P2pnTgkAu9opvQ
	(envelope-from <linux-media+bounces-65788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:57:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E96D15D9
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:57:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=JhNyVfZG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65788-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65788-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E97F1301E3DA
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 06:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2013911AD;
	Sat, 27 Jun 2026 06:56:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB25389473
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:55:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543361; cv=none; b=h61r6fSqfT2gC+Ar9FzOOKCd/RrWcUdB6MiLBuc4ZLrG5JK/WMq1Y8YAVVTnSCmobNUxvC8hHJOodxh0ueZkxEMPXEwS+wqaE/en61Otyo5ThnQ2q4YLxJfG0HNIhnNxAnG0fx2XnpgLCmSj35nLHG00ExNW/SZwS7Ta4n1ftT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543361; c=relaxed/simple;
	bh=D9Cv781oiSTqV4iuqMvHiWA9WXdvdRNj6Mhji/kLCaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FFATI0lVTqf1GVBWzP1ENRkBAT6yAb5aQz6o9eRXObK+uGpSlGpbuSW75xWKoWMqHJN+zsi0Rk841+6qJlPK0enmhtx7OYQCpAFSQwqu75ooK6Zf43GK73qYH51L1NYM2+tJh1mgYk/VzwiBEscI2wqGVlXpu8zbsELrlriOoVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=JhNyVfZG; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49263703c6eso15852755e9.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 23:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543358; x=1783148158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMEWzYEbT1T1SfjfQGAsJMVAlI7tTUIW0mDhbwFaH88=;
        b=JhNyVfZGfxXxbZsqRgDBsNbF68s8sFwR47oKxTFzL/0vuXgZB3WCkxdhylFVn90zJ3
         GYyU6BHa9t8h+RAyCtrMaMMLoPeM+/C54ixXDBOqFuLUwOuuN4KBoECkwGJwMw044hY9
         qkM4Gz1+ZfQwf47TzYUBmxijLO6I49+vq4oOj7JV4Q++T76rPJfSB+6wp9qi81Xb2lDQ
         bA6UWpootGpZEuYA2gzLiMjKNq+50Yp0Hsv5+GoDVXI0NsOABrNdlkFCJiGqHBOxYFCz
         J+oK+P3KhaVce4Y8CLigL+a4tIx7FVgapbJ/f3Yr2wg+1dR9MfAMExfaFzQ2BpYqZcYd
         IcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543358; x=1783148158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMEWzYEbT1T1SfjfQGAsJMVAlI7tTUIW0mDhbwFaH88=;
        b=F6sC2uaVTbjPO75RmprkNlyENVovcd8KFshp1+0lhd67EoCqylLJh34npxg6nKnp2l
         3n1po7hBaPwyMA6Ek9Hfuo5gXtRTY6VSMaJK+pLPSPcxLmvEIDV4127Uohe7tVgpg/I1
         /VKZ9J1A6O+sJsnFOv9rCItghEeuqaByPRLV/qkqwfizOicS8hwf345sdZ7ds20OYAS4
         1B01HX/QPl51ZUsBWQZCezdFatN/+EkmX9Xf8yodqghMc6hVxcQ1cOVBCwaHkH61n+rZ
         YvN94qSy/A8uUaRJtTbsF7X+VgVyDKcHVFksYsQ88vPsL9NBryZ9qOr/VX8VKQ5WS+WB
         3r5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8UGYlNIanmae6qNTDkSJNUmbj9zU6264VQDggHEnKZ2jKAW9dQjwf7eKEnENw9XepuHl08CFy1taHOWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYR+QxOptVwGym0Ddynv0wkuVfsxcNw0a1TzW/Cor4gGAtO8nf
	6/fe5L4LnUeMW367/L53+K95EHrB5k3p2LIWXgs6T/UWjCoEvhfeK80t8E8n05l8uDnR
X-Gm-Gg: AfdE7clKoWWzn47ZEhX1P1n8Svz7ZM9vSoiFQi0pe7ImSpSKh2lsrNwmmq9+L1sM8W1
	FYmaud7VPVluKoL+uUp5LI/vu3lJtDVv+stCFjizTQRe8BU7jGhAelQC0/PjwvHoN+39eRkLog8
	lczso4paTryxrwgYzAIv7WPZc6sm2nSS/5nr0AG3vuPchqk/SXR+TCwPPUClOwGGKvGs6Ju3tvn
	74qM5TwQecrKF8xBYQNHY2K/I9rwn28bJTfM0So8ztQoaSk+oL85QYHMFDxBY4OD3/kEIvnriNo
	tjxXoBi4FV7xaf2lmAMOSuagF3pRALoJG+CZs547YER9SdLrZlU03b42RM9Zmn++8EBk5xr1Hru
	WXEABcr7dxhV/EQgy4HPF7j9Lv326Cp0GHpywnaKbxTSJOZ7/ZDblJ69hxC7VsPab82XB59XVX5
	l9Ibd5JWzEbxc4SvxNvgCWHYDbUISEiInf0/f9EpD/s8q4OujyJPgO9uOhdUv8+hctoEV8iR2/A
	8CMQpSbhoI0mFuyeyEdjjbHDijH/UMXiIls4lWWzmDAvg==
X-Received: by 2002:a05:600c:4f8f:b0:492:432b:d78b with SMTP id 5b1f17b1804b1-492668710e2mr151805515e9.15.1782543358284;
        Fri, 26 Jun 2026 23:55:58 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690a1a85sm235875035e9.15.2026.06.26.23.55.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:57 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH] media: atomisp: reject frame dimensions that overflow the size calculation
Date: Sat, 27 Jun 2026 08:55:56 +0200
Message-ID: <20260627065556.88673-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-65788-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev,0sec.ai];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[0sec.ai];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,0sec.ai:url,0sec.ai:from_mime,0sec.ai:dkim,0sec.ai:email,0sec.ai:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE5E96D15D9

ia_css_frame_allocate() computes the allocation size for a frame in the
frame_init_*_planes() helpers as width/padded_width * height *
bytes-per-pixel * plane-count. frame->data_bytes is a u32 and the
helpers use plain unsigned arithmetic with no overflow check; the
result is then passed to hmm_alloc().

width, height and padded_width are user-controlled: the
v4l2_framebuffer ioctl path reaches this via
atomisp_v4l2_framebuffer_to_css_frame(), which forwards arg->fmt.width
and arg->fmt.height straight into ia_css_frame_allocate() and then
copies arg->fmt.sizeimage bytes into the resulting buffer with
hmm_store(). A sufficiently large width/height makes the size
calculation wrap, so hmm_alloc() returns an undersized buffer that the
following copy overflows.

This is a memory-safety bug confined to the ISP-private hmm buffer
object (a separate bo allocator), not the kmalloc slab; it corrupts
ISP device memory rather than granting a kmalloc-heap primitive.

Reject up front, in ia_css_frame_allocate() (which already returns
-EINVAL for bad arguments), any dimensions whose worst-case byte count
cannot be represented in the u32 data_bytes field. The factor 16
conservatively bounds the largest per-pixel multiplier across all
supported formats (up to 6 planes, or 3x RGB planes with up to 4 bytes
per element).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel atomisp
hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 .../atomisp/pci/runtime/frame/src/frame.c     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 8614efc28b19..dea7b11ccc90 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitops.h>
 #include <linux/math.h>
+#include <linux/overflow.h>
 
 #include "assert_support.h"
 #include "atomisp_internal.h"
@@ -106,10 +107,30 @@ int ia_css_frame_allocate(struct ia_css_frame **frame,
 				      unsigned int raw_bit_depth)
 {
 	int err = 0;
+	u32 bytes;
 
 	if (!frame || width == 0 || height == 0)
 		return -EINVAL;
 
+	/*
+	 * The frame_init_*_planes() helpers compute frame->data_bytes (a u32)
+	 * as width/padded_width * height * bytes-per-pixel * plane-count using
+	 * unmodulated unsigned arithmetic, with no overflow check, and the
+	 * result is then handed to hmm_alloc(). width, height and padded_width
+	 * are user-controlled (e.g. via the v4l2_framebuffer ioctl path in
+	 * atomisp_v4l2_framebuffer_to_css_frame()). A large width/height pair
+	 * makes the size calculation wrap, producing an undersized hmm buffer
+	 * that a subsequent copy then overflows.
+	 *
+	 * Reject up front any dimensions whose worst-case byte count cannot be
+	 * represented in the u32 data_bytes field. The factor 16 conservatively
+	 * bounds the largest per-pixel multiplier across all supported formats
+	 * (up to 6 planes / 3x RGB planes with up to 4 bytes per element).
+	 */
+	if (check_mul_overflow(max(width, padded_width), height, &bytes) ||
+	    check_mul_overflow(bytes, 16u, &bytes))
+		return -EINVAL;
+
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_frame_allocate() enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
 			    width, height, format, padded_width, raw_bit_depth);
-- 
2.53.0


