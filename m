Return-Path: <linux-media+bounces-56680-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCwFBPANwWk7QQQAu9opvQ
	(envelope-from <linux-media+bounces-56680-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:54:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E812EF6E7
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7FC83023E14
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF3238759C;
	Mon, 23 Mar 2026 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wbig5Xz7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6BD37EFE7
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259639; cv=none; b=ZLVtfxZbnmmXuSBdMMZ/EeBbY5M1gYBDch6nyX9GkG1P0Ct2UhG0gVKIxQ2YOvhOZna/+2pN0mWhTM2rO/MkhX2VDlgrT7waXkfZGu28WC73X63266NO8YGxqINtzMXcHekSpxCN5flVbjTgUqjw9I3P9UMvlp1PMC6FS9AzwNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259639; c=relaxed/simple;
	bh=deJ8vDPh7AgpBNRfW1abRccq9IFg9AwZ57gv7PceuKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZdAvYdfaTOLneYB8cFxeZd1/fTQ/oYF+ej9bmZen53jfDgw0urvgCM5qgVVlnE55T3O+v2WamiqnGKnqzu1sYnjjaVbHDUpTy+1N2YMF+nlfh7h68SHhRXBdMdEnWHh7lqayQmUchOtMlIKO0teatRDkk4SikNYMaoHAKpa5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wbig5Xz7; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a12c19affeso4921758e87.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774259636; x=1774864436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjCnvnQ7bmjieqUGn8j42PONezNCZ6Ds6MXHI51RPoE=;
        b=Wbig5Xz7N+u1Q3yYoHapl5ldrZFfFwLkVkcVm9xgBiS3UPyRzAVL8EFoXaSAfM1QaS
         wOus9nhBsteSpYn2a8drQdXBq3xoUClaxZABjgeG74FC8T8Mx1e03Cce0YSk2gVg7qi1
         C5kmQaFdpL+F0zkLrsLS0Wpi4oXNLayNpqClY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259636; x=1774864436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SjCnvnQ7bmjieqUGn8j42PONezNCZ6Ds6MXHI51RPoE=;
        b=nID5AzPso1Sq2dKOQ08GXwral2J0WQ9njrDBzi3+MEAdEnwHFRGJPSDbKWinttRygZ
         OJzZaL5uxdJ9TcLJsLzdZxNvprac2WEh9JGA/Y6AP0tLQdEeNtzPlUti98mXuoInvIAX
         JwGLxsXDNK0274uYLOx8TDv7z7Bx2rNq+YUN8ebcZoRlkBJelinAUueiPAgaJ728G57F
         yI7nbIVDPQpFVvSgxVCBbsQppZOiozOcYQYwoc37FT1rfYx4vzk4UsJ40vjK+7IkGgwc
         bVYkCb7v0MwEj7FI9z1e6MW9btgy3VIDUMMkqEodgjhvVRlz1RwluwRfOd9KFuM7FgzW
         hm2w==
X-Gm-Message-State: AOJu0Yz+AWEAXM9p5oQ4ksjExc+a1HKELptJ0uGpEJ1OUgPmOlM3LJUf
	6c9t819vBS7xwnov2Xh7opDxOFH9o3CYYs5t3MDElKK32peBKlzdrFAu3Myst4aXtA==
X-Gm-Gg: ATEYQzyyQJ6CfEYXOXiCf871beykqpr3FnrD5DXyjjkXHd+e2uVWysxx69qS6+RK/js
	HAVanwDGv8rQr56NfBRmDglFewpYcE+hOXVAEgCi/Suc43RYeOiu9qu2L9hYogrB4/SZ2PNPaM2
	KCyVkSOLe7G8es+9ZMnGND5ZbExqOPreLp4FY/B47+SNR4yGu2A6syGu+1PI9AAL9PzY8NWYFmC
	VpUt+V6BAt0W2w2gHE+QN/pwlPJcp3WI2SIgZEZKVKnGj2pQ9Q7B/4bI81mJB+XcRKY5coqknO+
	9X/0pFYTTr/LLTLQjn2a/65jZuWWTs8TZFjtt+5iOQkW8fJ865XhmrWhDRfGhDWyUw38f3qOOB2
	cyXVbNB8Vp+WokUK9RjlhM6cDEDIBG2oRxvdObni14mAmD//F1qIZDkyiGrcOA/SvzKup1oB/6h
	1i6hWpRRYzitc+r5pWXJcLuiQnf1/Jwex9A7UklADgQZbQ3JkNqMo5xxwO0bapWEZjjgGrAqzQu
	9Ynpds=
X-Received: by 2002:ac2:4c52:0:b0:5a1:42ae:88b6 with SMTP id 2adb3069b0e04-5a27de4f200mr5436170e87.18.1774259635817;
        Mon, 23 Mar 2026 02:53:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192e93sm2430001e87.13.2026.03.23.02.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:53:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Mar 2026 09:53:52 +0000
Subject: [PATCH v5 1/2] media: uvcvideo: Fix sequence number when no EOF
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-uvc-fid-v5-1-e2858b657aac@chromium.org>
References: <20260323-uvc-fid-v5-0-e2858b657aac@chromium.org>
In-Reply-To: <20260323-uvc-fid-v5-0-e2858b657aac@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@kernel.org
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56680-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: 96E812EF6E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the driver could not detect the EOF, the sequence number is increased
twice:
 1) When we enter uvc_video_decode_start() with the old buffer and FID has
   flipped => We return -EAGAIN and last_fid is not flipped
 2) When we enter uvc_video_decode_start() with the new buffer.

Fix this issue by moving the new frame detection logic earlier in
uvc_video_decode_start().

This also has some nice side affects:

- The error status from the new packet will no longer get propagated
  to the previous frame-buffer.
- uvc_video_clock_decode() will no longer update the previous frame
  buf->stf with info from the new packet.
- uvc_video_clock_decode() and uvc_video_stats_decode() will no longer
  get called twice for the same packet.

Cc: stable@kernel.org
Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
Reported-by: Hans de Goede <hansg@kernel.org>
Closes: https://lore.kernel.org/linux-media/CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com/T/#me39fb134e8c2c085567a31548c3403eb639625e4
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 92 ++++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 45 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 40c76c051da2..eddb4821b205 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1168,6 +1168,53 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 	header_len = data[0];
 	fid = data[1] & UVC_STREAM_FID;
 
+	/*
+	 * Mark the buffer as done if we're at the beginning of a new frame.
+	 * End of frame detection is better implemented by checking the EOF
+	 * bit (FID bit toggling is delayed by one frame compared to the EOF
+	 * bit), but some devices don't set the bit at end of frame (and the
+	 * last payload can be lost anyway). We thus must check if the FID has
+	 * been toggled.
+	 *
+	 * stream->last_fid is initialized to -1, and buf->bytesused to 0,
+	 * so the first isochronous frame will never trigger an end of frame
+	 * detection.
+	 *
+	 * Empty buffers (bytesused == 0) don't trigger end of frame detection
+	 * as it doesn't make sense to return an empty buffer. This also
+	 * avoids detecting end of frame conditions at FID toggling if the
+	 * previous payload had the EOF bit set.
+	 */
+	if (fid != stream->last_fid && buf && buf->bytesused != 0) {
+		uvc_dbg(stream->dev, FRAME,
+			"Frame complete (FID bit toggled)\n");
+		buf->state = UVC_BUF_STATE_READY;
+
+		return -EAGAIN;
+	}
+
+	/*
+	 * Some cameras, when running two parallel streams (one MJPEG alongside
+	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.
+	 * We can detect the end of a frame by checking for a new SOI marker, as
+	 * the SOI always lies on the packet boundary between two frames for
+	 * these devices.
+	 */
+	if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
+	    (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
+	    stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
+		const u8 *packet = data + header_len;
+
+		if (len >= header_len + 2 &&
+		    packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
+		    buf && buf->bytesused != 0) {
+			buf->state = UVC_BUF_STATE_READY;
+			buf->error = 1;
+			stream->last_fid ^= UVC_STREAM_FID;
+			return -EAGAIN;
+		}
+	}
+
 	/*
 	 * Increase the sequence number regardless of any buffer states, so
 	 * that discontinuous sequence numbers always indicate lost frames.
@@ -1224,51 +1271,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		buf->state = UVC_BUF_STATE_ACTIVE;
 	}
 
-	/*
-	 * Mark the buffer as done if we're at the beginning of a new frame.
-	 * End of frame detection is better implemented by checking the EOF
-	 * bit (FID bit toggling is delayed by one frame compared to the EOF
-	 * bit), but some devices don't set the bit at end of frame (and the
-	 * last payload can be lost anyway). We thus must check if the FID has
-	 * been toggled.
-	 *
-	 * stream->last_fid is initialized to -1, so the first isochronous
-	 * frame will never trigger an end of frame detection.
-	 *
-	 * Empty buffers (bytesused == 0) don't trigger end of frame detection
-	 * as it doesn't make sense to return an empty buffer. This also
-	 * avoids detecting end of frame conditions at FID toggling if the
-	 * previous payload had the EOF bit set.
-	 */
-	if (fid != stream->last_fid && buf->bytesused != 0) {
-		uvc_dbg(stream->dev, FRAME,
-			"Frame complete (FID bit toggled)\n");
-		buf->state = UVC_BUF_STATE_READY;
-		return -EAGAIN;
-	}
-
-	/*
-	 * Some cameras, when running two parallel streams (one MJPEG alongside
-	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.
-	 * We can detect the end of a frame by checking for a new SOI marker, as
-	 * the SOI always lies on the packet boundary between two frames for
-	 * these devices.
-	 */
-	if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
-	    (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
-	    stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
-		const u8 *packet = data + header_len;
-
-		if (len >= header_len + 2 &&
-		    packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
-		    buf->bytesused != 0) {
-			buf->state = UVC_BUF_STATE_READY;
-			buf->error = 1;
-			stream->last_fid ^= UVC_STREAM_FID;
-			return -EAGAIN;
-		}
-	}
-
 	stream->last_fid = fid;
 
 	return header_len;

-- 
2.53.0.959.g497ff81fa9-goog


