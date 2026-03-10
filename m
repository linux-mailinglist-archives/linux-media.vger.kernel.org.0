Return-Path: <linux-media+bounces-55086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG+eBPUGsGlregIAu9opvQ
	(envelope-from <linux-media+bounces-55086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:56:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B6B24BC72
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 871E530BCED7
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 11:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE80B41C2FC;
	Tue, 10 Mar 2026 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l/d5A7t1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9935DA6E
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143669; cv=none; b=SvFgWNjWdHOVFsxCzGnPcepy/Tl7XoUzE0ALRoXhiR02BjATAtjRIu6iByY1cU65i9YYazb0aoTT9Yn4JblFZSae/8JTmdcoL0dsodnKWlk4gV9ChrWB3yQ+lNKY04LkYvBXh8LO6bXWHR7NodwUf2pZO3a3a4Ek3j+PsIQQqs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143669; c=relaxed/simple;
	bh=MbQ9yzEpvEZwdMo5iYtLA1h1dKF/RJrmVnffWfve6JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=psTlvm+xSSL3XniSz8XjfQ+94AkYLmu7m8lMaXWtwGivL9mRQG9dPeP7a5ISFVfQoxkg2NALJUKdMnwfu4LsoLQLRK2JPd/PSGP/4pv5HPhTbC9CosFCW6lEowywg9tZWKtqUDZCJ/xwg04dsuY0pfCi3xgnPmQHVHE8CxkzjSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l/d5A7t1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so7220561e87.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 04:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773143666; x=1773748466; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uajvx1507EYY9WjuAteyynfEckXb1ogXxoart7Qgrd8=;
        b=l/d5A7t1VhEjJzH6q2GuOlF6i6PmzVh15jFpqy4hKLHenNGIuku57L51ROzNyHlF4M
         lGIfJ+7y/VZkUFsg75f0NSZeZCBcpvj1wQK9ZBVCCs094lOE1uk8WSjWTLCUVhllqq3b
         Z1+0rP76n34aUBOMmV+2chWfJbkIB/FhDXFoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143666; x=1773748466;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uajvx1507EYY9WjuAteyynfEckXb1ogXxoart7Qgrd8=;
        b=sFKsxbAy0GGzLGdo1V2LSr6s6XjRFr8gOui4EvhUFPHQgb9Sz+GrohHbXXlFGc3uTr
         SlljXTgsYb73Ug3jfbYLEEdQCkeL2rdI6Zj3Fk9DIcrJsq3NbnoSTYwnWiaa0nMscVkh
         9w8DcIJJyNg2junLKhadY3S29idVBUriJykoTWruN3t3v9x5geKnK+QGM4soRFLbvAjW
         hR51TABJdUlC5MHN9lkIIaA/MsYQGIAw8vc6dymfsF99r9tHTSP1Fi0d3ceRgd8rO/dp
         JtXtL3YBGBH63YN7gS0M4/i6Zukpb2JVwywHKoJXNamBmoJ4QiRLP+HiK5kbKinN/QmS
         7pRg==
X-Gm-Message-State: AOJu0Yw3V+TNHJpZAVvyuEvSbfN6MlTfMm/yP1Uscp2F9xjVE0U7IOEv
	aS8yOvHp4CYVeMzJhhnYZQiS0qhe+rBdiLLY46Je0WHNhGx0Q0D1N3pr0vfd4OrxmyHj35g1W7y
	aHm4BSg==
X-Gm-Gg: ATEYQzy8tm07E3ViCwXey+m3wdKYX8915aARTiuHCYN1yEhu8bPv7DcuSYqtZ5+3oC2
	xp3hhos3gAPBzCrosH1bRwLgUC9Z0W+nH7XMMx7fbdfFVeG/zWOvukPKZdNDyUrJtCmukINHWxT
	+k2IY4e2b512qTo0utlqrJFKZ8CrMlCkiUtx3IOyirwQty5LrOHVQlAG+F7g654sA1uHNa2Fqis
	D39ZgTYJQuuNrPdYWDKYG1zx5Ea8+0hogRX23i/I4XbqrFnpQXY/leX3JM8WRHGl14fd+sWOBld
	UeziTTRkpleEDZlLamccPTMNhasUwoyaS7HR0BZDbwSL41AvsBmWcL6Lnoi1QgW0AQicC0p/cI8
	asKVBs9PNw3gBT/KNLPwRnxqrR0uDYXjbRgAoJsPggD61pmxXC8VGaBLakvNLSHMhnpy84gH458
	amvssjmYwrMLffQ4RuDpY8x1SFc5NGVoejhdMXSTIiQ5qKJXExUjqqnhwSDD8neCNuigXnKT4Yj
	g==
X-Received: by 2002:a05:6512:3f05:b0:5a1:2e0c:86de with SMTP id 2adb3069b0e04-5a13ccdd5dbmr4612857e87.32.1773143665803;
        Tue, 10 Mar 2026 04:54:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d033f96sm2772906e87.34.2026.03.10.04.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:54:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Mar 2026 11:54:24 +0000
Subject: [PATCH] media: uvcvideo: Fix buffer sequence in frame gaps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-uvc-fid-v1-1-5e37dc3c7024@chromium.org>
X-B4-Tracking: v=1; b=H4sIAG8GsGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MD3dKyZN20zBTdVMNUU1MTE/MkszRDJaDqgqLUtMwKsEnRsbW1AGi
 dz99ZAAAA
X-Change-ID: 20260310-uvc-fid-e1e55447b6f1
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, stable@kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 62B6B24BC72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55086-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

In UVC, the FID flips with every frame. For every FID flip, we increase
the sequence number. Userpace use that information to figure out if
there has been a gap between frames.

Now, we only update the sequence number on the first FID flip, which
results in frames being incorrectly numbered just after a frame gap.

This patch rewrites the sequence number of the buffer in those
situations.

Cc: stable@kernel.org
Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 40c76c051da2..ec769a504569 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1176,6 +1176,14 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		stream->sequence++;
 		if (stream->sequence)
 			uvc_video_stats_update(stream);
+
+		/*
+		 * If we have not received any data and FID flips, update the
+		 * sequence number of the buffer to tell userspace exactly
+		 * where the frame gap is.
+		 */
+		if (buf && !buf->bytesused)
+			buf->buf.sequence = stream->sequence;
 	}
 
 	uvc_video_clock_decode(stream, buf, data, len);

---
base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
change-id: 20260310-uvc-fid-e1e55447b6f1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


