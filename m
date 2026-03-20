Return-Path: <linux-media+bounces-56478-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKWoMQv8vGny5AIAu9opvQ
	(envelope-from <linux-media+bounces-56478-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:49:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FBE2D6C7F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CE953012222
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D9B35F19E;
	Fri, 20 Mar 2026 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T2Y3PmmE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ADD35AC09
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 07:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992960; cv=none; b=QHz9cUuNBfNEndsiAHje62v0Nv2g03eGJhJy95KOJ/iBV28xIz0EJJkmkxJMwVW1OlnbIroSv3erEE/tRaN6Uk09cjJknNRL5c6nNDjiRIYvfQCtpgOT1zWtcfe6iX/z5FZMCZTByy52+dg+ZE99ScG3+oPBLYj9Olkiy5iP29Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992960; c=relaxed/simple;
	bh=dHOn47CxV3cioQiYZvZ36Ymk/HrieqiVTgJypVWy780=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qGTCaaTSMGx8nYeJWeDO6hLVKvqn09qAWOXcq2DwJiRukkikd7gwz28VfcJ/JViAP+59hHEaWxjnfl2X71gtamuxYnBGSzlN2H8mJuZ5vPRFOqAkrtnYRfprj3IGJ8YN3dd1r1+jrHTIptzVNXEbuVYYd3fxPGXjssdruQ/SHPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T2Y3PmmE; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a27a7f711eso1395640e87.2
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 00:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773992951; x=1774597751; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IABUD8O3WXGeDB/bSNbuo2NmXQhI4RO1dp9++xxBliA=;
        b=T2Y3PmmEEwOvKH5lj9elmQurMRuX+lS2KLLXLsM/vPIAxmrJ6kfXzDcXA5/Uyc7MFc
         Z6oHYhbF2Bsd+x5OqpsaSQNinxPYfPdiBLVaoWUDMDMfGmXqOFPUWEP9KcraboFtty0p
         4lkDbTIKh3YzvqubkcuUtypQCiQqH5mWnQCuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773992951; x=1774597751;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IABUD8O3WXGeDB/bSNbuo2NmXQhI4RO1dp9++xxBliA=;
        b=ZsMoptj89K6hV4UXgQD8OsT1AO9Kd/2PX5vkjWedbgls+cK1NeVdMKgmNjowXuX7J8
         I73czHLcGzwcr+XNi0Wd+qvgeWElamTBPPTyywdpazHKQLTgNMKurhjuZnYTs3p0trGC
         D/6tgwd4ftbt7JdggBtss/3xQh+wiULuABVJVKI5HJELQLdspFlF3AbOgCgb8W68Nirz
         iMVv9xGaCbpEv1JgEY86V8k7PTZ7JNQZyKS9GtXiK0mXoQzx97zb5qa6+4AfgpFX+c4Q
         hJXVM6SGwZmY9ElChKkQSZ0cTfxz98OjG11jtZZRSiAzkuhOGsjXYEhMPYVUAB4XXgxH
         NaUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVytbqWYANHNg2c+4ZPAdjKejzF6xTur/fTyfI/0o6XNdZKRvYm674VVaQejMXsFp/HSdU5A+BnMxr55Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYN/0iot2vQCakhMzajBHxOiCx9WhkOFEhw1GwUkPaFlhnZ/+f
	OVTNDUUo5/tKX75LgnJrIsdpq1NR4MHIVaQEoBkw8qA68Vd/pjdKY73bJ/jYwr9nYg==
X-Gm-Gg: ATEYQzz6iK19K8ud6W1ngTR6rAxsypO0dPkgn0bLc6D8h0KMRVFFR7QQg6kXsRsFQpf
	n+0XHiMxJzPslS2nPR0FO2WY9Xrplqhv9r9tkbeSYZ/59rF+/Hqpdb6j07RA68UHkMAKSEM7F7g
	0TU9LI+BsJLSPFFnMFY3zPBy7mUz+clgq27pae+r4u7qexE3rpCWPwF540DmJ3Z1dDg4hY3spBZ
	zfu8PYlAjZL89vddzkJoEBDjQhTXuH3A/W3Id2xzA6sw76SPQuHZnRhfKcRsOkJ6oy4Txst3KrJ
	ftyeSkP2wZasw8ElWCm2nnRGKQJT/K3w+G4Mb61McSP89I05RY/Dj5ms93heWqup7Z2dBJL35/L
	sJgcR65HfUiQvG7QI4udPKe15k1+1BL809wjV4+M+rRBiHbDfUkTVlM1wiU2lKzNyEBW1w4Kioq
	97u1KmiLNEKQu/Es5U4QEbq+TZRDbWY8NY0TNdgkT4CSBsWUHbGuBkJ8asNTZ8/PNqOYzHNQs15
	YxcJ+Y=
X-Received: by 2002:a05:6512:a96:b0:5a1:30b2:f2c with SMTP id 2adb3069b0e04-5a285b9c469mr641994e87.42.1773992951332;
        Fri, 20 Mar 2026 00:49:11 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530ce68sm372272e87.80.2026.03.20.00.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:49:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 20 Mar 2026 07:49:10 +0000
Subject: [PATCH] media: uvcvideo: Fix bug in error path of
 uvc_alloc_urb_buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-uvc-urb-free-error-v1-1-b12cc3762a19@chromium.org>
X-B4-Tracking: v=1; b=H4sIAPX7vGkC/x3MOwqAMBBF0a3I1A7kAxHciliY+KLTqExQBHHvB
 stT3PtQgQoK9c1DikuK7FuFbRtK67QtYJmryRkXjHeGzyvxqZGzAgzVXRmdj3aONsBZquGhyHL
 /02F83w9RAs7mZAAAAA==
X-Change-ID: 20260320-uvc-urb-free-error-e73b1db16e21
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TAGGED_FROM(0.00)[bounces-56478-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B4FBE2D6C7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Recent cleanup introduced a bug in the error path of
uvc_alloc_urb_buffers(). If there is not enough memory for the
allocation the following error will be triggered:

[  739.196672] UBSAN: shift-out-of-bounds in mm/page_alloc.c:1403:22
[  739.196710] shift exponent 52 is too large for 32-bit type 'int'

Resulting in:
[  740.464422] BUG: unable to handle page fault for address: fffffac1c0800000

The reason for the bug is that usb_free_noncoherent is called with an
invalid size (0) instead of the actual size of the urb.

This patch takes care of that.

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Closes: https://lore.kernel.org/linux-media/abycbXzYupZpGkvR@hyeyoo/T/#t
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Fixes: c824345288d1 ("media: uvcvideo: Pass allocation size directly to uvc_alloc_urb_buffer")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 40c76c051da2..f6c8e3223796 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1751,7 +1751,8 @@ static void uvc_video_complete(struct urb *urb)
 /*
  * Free transfer buffers.
  */
-static void uvc_free_urb_buffers(struct uvc_streaming *stream)
+static void uvc_free_urb_buffers(struct uvc_streaming *stream,
+				 unsigned int size)
 {
 	struct usb_device *udev = stream->dev->udev;
 	struct uvc_urb *uvc_urb;
@@ -1760,7 +1761,7 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 		if (!uvc_urb->buffer)
 			continue;
 
-		usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
+		usb_free_noncoherent(udev, size, uvc_urb->buffer,
 				     uvc_stream_dir(stream), uvc_urb->sgt);
 		uvc_urb->buffer = NULL;
 		uvc_urb->sgt = NULL;
@@ -1820,7 +1821,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 
 			if (!uvc_alloc_urb_buffer(stream, uvc_urb, urb_size,
 						  gfp_flags)) {
-				uvc_free_urb_buffers(stream);
+				uvc_free_urb_buffers(stream, urb_size);
 				break;
 			}
 
@@ -1868,7 +1869,7 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
 	}
 
 	if (free_buffers)
-		uvc_free_urb_buffers(stream);
+		uvc_free_urb_buffers(stream, stream->urb_size);
 }
 
 /*

---
base-commit: a93a51f42ac354425a252210183c4151d991f75d
change-id: 20260320-uvc-urb-free-error-e73b1db16e21

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


