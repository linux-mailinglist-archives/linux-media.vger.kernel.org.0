Return-Path: <linux-media+bounces-66000-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oLX9G5CfQmpK+wkAu9opvQ
	(envelope-from <linux-media+bounces-66000-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:38:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 361676DD696
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:38:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Zjcx7ts/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66000-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66000-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BDB6300C325
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90105466B48;
	Mon, 29 Jun 2026 16:38:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE8845BD4C
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 16:38:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751097; cv=none; b=pEFfObt9HfZICSfpDI/LqcwtMlZhYrKH2vPOp9Q9lIEGkmiW0hP1N60OMznwadXDWH3iATqYJqROqfs7pACvfavw0paA1f0g2Dw9PuUAdm5iQ23ZDwDKLCK6tKSYJ595nia93X7q2ovkwtJgHmjJ28wLpgfzAlcE/233dLkAoq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751097; c=relaxed/simple;
	bh=xS9HXkHQt65kbdNX3PEY/ixQR504OdS8n7/Y+5xz3o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TavYiWz5mF47yba/Um9X4Z3vf8A6Q4LyJmiawXCpiQeVqhViQAN+HBf2n4QMZYztMBWL5gDp+RsqNugoIkyn57ZEMcOc+kXoC5puI26v7jcUamO3dQ0OLvJInRiHo+PfkwiHd7PVQUWZNe5YL2Cw82KlRrL554av78j5PNc+W2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zjcx7ts/; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1953076f8f.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 09:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751094; x=1783355894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+CxHy0SCXrpnemjCBAKhWexIpJlnOyaJVCHp2VG4Pg=;
        b=Zjcx7ts/EqreYudtfUHjHxJZm3wGEJempZOrTfWAC5WIW9tNOgwWLeiwJhSMs4sT9e
         j4S+lVmQLH6p51/oWstbQb78KFaGYO87aP1o0x6GOj8OcaJMUcPJ505qd1ucDaV4A8u+
         rge841X0wBv8a3UMIEfwBI6G/oQdaXOTT8agLQ5X8ZjGBr9/9VmgpUDq6NMQkeunZMdx
         BjZrPPIyJUJYAsUKmAwprgZROcAwtL3EvDF24Vi8aN8MMasNCot1+wN5rWIPoapG+am6
         XN/6fh2N6TjjIj1LDTKhE2WZsGy8M8541H4f6ChtMtO3bRdkQk9JA/kRNgP1mIu1zl0d
         8UFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751094; x=1783355894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+CxHy0SCXrpnemjCBAKhWexIpJlnOyaJVCHp2VG4Pg=;
        b=ZQGzRGkMq8U6R/Jo/lHRO4oMEfymKXblG3WAHfvg0oMXI1l9tRFk8MYXvcuqPsm9Am
         GrWfqb5cFS6b1c23P3kfL3fFE0ztXVDtdoold4gVXebKGIY6EkR0H1ShacvLy9RoLhKm
         VjvzajMaGunHKRdDQdYoCasW7I/YXEszbhN1+rZtzDmQVJsdfo+Wf3pj+S66idP2C01j
         YplkxMPplNbAz2/bnJoRR4Gk2lotJmrjDCRTXu6RV+C1oYmJ4RZ7w3QlCpVgI3lR5Yw6
         vluFzrEK12516IykXAu6H5NxlkgFPJpc1HW/8MQjJE0vUcDEdFpRluyUimcwRUjr6Uc7
         8Y1A==
X-Gm-Message-State: AOJu0YwDSRBGqKzoKLsTML43oYC/FzRqKwvBcr5mDA/jbQyUJ3EQSHJ2
	LcS6TOc7AoxMjUyCPTrGoRBpO1bEKD73HPm206ReHVe9DF7ZYalqQ7AW47/9JtnX
X-Gm-Gg: AfdE7cnnewkEmt6r+FPPAS49sLeEZHz5mf4bE44C2vS6kd9GvdNxUJ5W1TszIkAn4oB
	iOCxSBYrBCmQVO9VGpXs16pBnZGBth8FZQ4aQnsPFBPcDdeWpAUTMDJ96f34D8ADHANAI2VsAVz
	/5APGcJbL6lFzvcTr/xK/fWumA9zx/olj0hS85VR4Hej2qk7S/CoOvYZXDZ9teZzUOZLlKdBW6V
	1J6/9itrcMogDB8MiSb/mlw2/MonmZgJ2U688plKGy75EQh+dDO7C6FxcxKS/Yy30WDUteRIPZP
	yy1irHFzIgFie5PqH9PEvz2xhsaz7baBiefLgJ2RvnK4kahYhuOguOBkT6aAaOjOpNzcajW+4wy
	nr73nnsr9sx8rfZO4qtZ2VTp/i6Jtk+zhbiYTk7Ekb7Vko8eji1eYr4KyZNFWVPQGKvgx4u9pTK
	SBjajt1Dv1Xf5jwj5u2oa95Opo3i9CUlAC4TFFkK4lQ2jPrBxLhKnvvkOZ1AkU9DCYXD4RM0k0M
	/K4ruf/GBuwI6INftmL9zZw
X-Received: by 2002:a05:600c:800f:b0:493:b243:900f with SMTP id 5b1f17b1804b1-493b8281619mr6983255e9.1.1782751093660;
        Mon, 29 Jun 2026 09:38:13 -0700 (PDT)
Received: from helmholtz-coils-PC.nanosat.lab ([147.83.201.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4730937e18dsm15765501f8f.21.2026.06.29.09.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:38:13 -0700 (PDT)
From: =?UTF-8?q?Pol=20Fern=C3=A1ndez=20Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pol=20Fern=C3=A1ndez=20Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>
Subject: [PATCH 1/2] media: uvcvideo: add quirks for per-device stream error handling
Date: Mon, 29 Jun 2026 18:38:02 +0200
Message-ID: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
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
X-Spamd-Result: default: False [-0.57 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66000-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fernandezfernandezpol@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fernandezfernandezpol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fernandezfernandezpol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 361676DD696

The UVC_STREAM_ERR bit in the payload header signals that the device
could not deliver a frame correctly. By default, uvcvideo delivers
these frames to userspace with V4L2_BUF_FLAG_ERROR when uvc_no_drop_param
is set (the default). Applications that rely on strict JPEG decoders
(e.g. libjpeg) will display gray bands for the incomplete portion of
the image, since libjpeg fills undecodable MCU rows with a neutral gray
when the EOI marker is missing.

Add UVC_QUIRK_DROP_STREAM_ERR to force-drop frames flagged with
UVC_STREAM_ERR for specific devices, regardless of the uvc_no_drop_param
module parameter. This ensures applications never receive truncated frames
from devices known to set UVC_STREAM_ERR on genuine encoding errors.
The existing uvc_queue_to_stream() helper is used to reach the device
quirks from within uvc_queue_buffer_complete().

Additionally, uvcvideo unconditionally overrides the camera's probed
wCompQuality with the maximum value returned by GET_MAX. For devices
whose firmware treats wCompQuality=0 as an adaptive encoding mode (where
the encoder adjusts quality dynamically to fit within the available USB
bandwidth), this override increases encoding pressure and can contribute
to UVC_STREAM_ERR events. Add UVC_QUIRK_NO_FORCE_QUALITY to preserve
the camera's default quality value during probe negotiation.

Signed-off-by: Pol Fernández Fernández <fernandezfernandezpol@gmail.com>
---
 drivers/media/usb/uvc/uvc_queue.c | 3 ++-
 drivers/media/usb/uvc/uvc_video.c | 3 ++-
 drivers/media/usb/uvc/uvcvideo.h  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -81,6 +81,8 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_DROP_STREAM_ERR	0x00080000
+#define UVC_QUIRK_NO_FORCE_QUALITY	0x00100000

 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -451,7 +451,8 @@ int uvc_probe_video(struct uvc_streaming *stream,
 		if (ret < 0)
 			goto done;

-		probe->wCompQuality = probe_max.wCompQuality;
+		if (!(stream->dev->quirks & UVC_QUIRK_NO_FORCE_QUALITY))
+			probe->wCompQuality = probe_max.wCompQuality;
 	}

 	for (i = 0; i < 2; ++i) {
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -357,7 +357,8 @@ static void uvc_queue_buffer_complete(struct kref *ref)
 	struct vb2_buffer *vb = &buf->buf.vb2_buf;
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);

-	if (buf->error && !uvc_no_drop_param) {
+	if (buf->error && (!uvc_no_drop_param ||
+	    (uvc_queue_to_stream(queue)->dev->quirks & UVC_QUIRK_DROP_STREAM_ERR))) {
 		uvc_queue_buffer_requeue(queue, buf);
 		return;
 	}
--
2.43.0

