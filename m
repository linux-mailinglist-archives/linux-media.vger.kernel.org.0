Return-Path: <linux-media+bounces-56532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAKIAopNvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:37:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A052DB10F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DB693126A51
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0350929E10F;
	Fri, 20 Mar 2026 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RN9zrsce"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B602741B6
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 13:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013756; cv=none; b=Xn7UBb8kcnvKetCRg3Ra6535yW7dVX2gSba6CyMle79AfggiIWKQTAsb63Jo5VxfLv3grskfRcL6hLj172X4jdHnUCbC0S6z7DlwMihbPEjTX2VolHDYT/wu8N9hgDkpi0MepYJCadpXj29OqWtKJjoOWcdxOnKBNzyuWZLyvEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013756; c=relaxed/simple;
	bh=6CWH+DoAkZWDYlegW6DuQt254f8sQDEAC3ANY98zX4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fDCj8I0ZKyrpMKPjGKoPzTPurGx0IaYa3UfsG8MFG2Q/fLmRe6rDM10s89qi9ZhIKwRvoFNMG+EYZ9RjOzSujfokOsQrAx0xn0N2aN7RNoWkdSbcKF3p9RYbDv9IVvwMtxAAH0ZuCYnWQR6lzPAICyioiXcTfPAGN4KCDTWhmYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RN9zrsce; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a27bfadca9so2471316e87.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 06:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774013752; x=1774618552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TXL6c7LUgKb9Aew541ybqee4zxwirjPc5tbVKmIJqo=;
        b=RN9zrsceyPZpx3vSaLNRm7S872TZ73sPvl87W3ODw37MJpXK5Z1K2gvQZy5CsiPoJ6
         +3H2XsJfh7KkbLuAAqxM3zcrgDdupsFbp/9rI5a6s7+oWIFL6Icd2e77JBb8DeyhufRR
         ACdU+1lvpuJtOcxlwjn/ZxV/Lvfwa/Ujk+Y+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774013752; x=1774618552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7TXL6c7LUgKb9Aew541ybqee4zxwirjPc5tbVKmIJqo=;
        b=Lsmz58xIM2FvUDuixPewDpHrVObQtnXCO3LydAbNhoAUsrxeOsbteKUruE26eRNQ2d
         X6Hm2MJMqejizX/7d1BfE5+NQA7YkZmrcwMDl418/jjpz30s/HC7ldm4VQIREL3jms+C
         HK2f+UDqqY0TwcdXEyjbyiD68iQVjjKywQe8pYe+A6nb+fp9+ljLPX4w2RWK2J76M+KL
         MNwvYONV30Mv7dJS4WChDDyBmZsummH0rxEHw80eRVdFTgWPF3/IORjPkQknmvj5/zSQ
         jQWnWLDKnyN8lsJBZfqtFOHfe+S2qn210Ql2fbPsIZGB6rXHy9iy/46A33W8cg6tgFmy
         ATxQ==
X-Gm-Message-State: AOJu0YyZUzUcYMrQ6kJ5wqxZTI2OmY/ruUjkzfjixsaX0IWEOXy6bIHn
	SKkfMWPixvZfSporKEgYp35/GFmpjzSUyGzcld+2R1yOekFLSF+ymA3Jk9biyWDZI08jqWfWnwB
	6ITtYxTW8
X-Gm-Gg: ATEYQzyohPnEQEL2LMHzC+LD8wMz6xZHZ+8p8TI8k8o74ztrL1BzQi8mxls12jfvs20
	5SfJI879J7FUAOhmwLVqnSa+q36Y2ii5QeoRYVyZl3XwEKyIoxUH864SAoXfpHdJtuZAe1bEz0I
	3fk5TPrBaswfc1tbvzehCSBueVp0BhZ3bI/xSRZHGz12eKxbVIUVdcAvjji4CAwgh44/rJhBumm
	SgPwE6Fc9HYo4KBFAYz9xAG/iFoXrFUm4eK16v0V86da6znqDEIE6O5eTQfULedvAYsBZIvWYEU
	6R33+0Up6zAjk5DELBGNqk9NQ5/CTjy6FFI7MFD3fOXtU+J9jLDqjP1LX7+qV9WsHD89oPn48KQ
	ER3kQo6x46BQV7CKJj0USjgI5jcgvaniOXmMyBBpOlkQK0jSmT3RvG9OkpNCfyglLfvtTxAJ4Ud
	ZOizeqKTqThnijlVPo75eNM8nducBvFzzx8+Wx4EJygOVzowNcz6wv2l+oRLhGeHL25rBvDVabA
	0/RadHoXscynaKgbA==
X-Received: by 2002:a05:6512:3d23:b0:5a1:4570:a8c0 with SMTP id 2adb3069b0e04-5a285b5da3fmr930610e87.41.1774013752081;
        Fri, 20 Mar 2026 06:35:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cb91sm553112e87.77.2026.03.20.06.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 06:35:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 20 Mar 2026 13:35:46 +0000
Subject: [PATCH v4 2/2] media: uvcvideo: Fix sequence number when no EOF
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-uvc-fid-v4-2-f24f168ca2f9@chromium.org>
References: <20260320-uvc-fid-v4-0-f24f168ca2f9@chromium.org>
In-Reply-To: <20260320-uvc-fid-v4-0-f24f168ca2f9@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56532-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: A6A052DB10F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the driver could not detect the EOF, the sequence number is increased
twice:
 1) When we enter uvc_video_decode_start() with the old buffer and FID has
   fliped => We return -EAGAIN and last_fid is not flipped
 2) When we enter uvc_video_decode_start() with the new buffer.

Fix this issue by moving the new frame detection logic earlier in
uvc_video_decode_start().

Cc: stable@kernel.org
Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
Reported-by: Hans de Goede <hansg@kernel.org>
Closes: https://lore.kernel.org/linux-media/CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com/T/#me39fb134e8c2c085567a31548c3403eb639625e4
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 48 ++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 9e06b1d0f0f9..2218e4d8e564 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1168,6 +1168,31 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
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
+	 * stream->last_fid is initialized to -1, so the first isochronous
+	 * frame will never trigger an end of frame detection.
+	 *
+	 * Empty buffers (bytesused == 0) don't trigger end of frame detection
+	 * as it doesn't make sense to return an empty buffer. This also
+	 * avoids detecting end of frame conditions at FID toggling if the
+	 * previous payload had the EOF bit set.
+	 */
+	if (stream->last_fid != -1 && fid != stream->last_fid &&
+	    buf && buf->bytesused != 0) {
+		uvc_dbg(stream->dev, FRAME,
+			"Frame complete (FID bit toggled)\n");
+		buf->state = UVC_BUF_STATE_READY;
+
+		return -EAGAIN;
+	}
+
 	/*
 	 * Increase the sequence number regardless of any buffer states, so
 	 * that discontinuous sequence numbers always indicate lost frames.
@@ -1234,29 +1259,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
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
 	/*
 	 * Some cameras, when running two parallel streams (one MJPEG alongside
 	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.

-- 
2.53.0.959.g497ff81fa9-goog


