Return-Path: <linux-media+bounces-55911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLBrAjYGuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:31:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0131E29A6E1
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 656B53017330
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DA439A06C;
	Mon, 16 Mar 2026 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ILn5y5KI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857733976AF
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667835; cv=none; b=Q/Z12jq5plTqNs5WuMe8t21omFsq5QBjr6P9MXzDHFxUZQLJGObMbruEIAhfNoUwvfuOh7tWNXJ6vX3kojbwMoMmNfmpRga84FlXx6YdCWdBtJgdo2tp58Piie5iQ8hKfEGZLsGFWLqd/oF1JOBB16hPUmZmp4T2Jks3UwM5mlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667835; c=relaxed/simple;
	bh=RB+Ts3QkIKlZ/tRagbOBunzShfDi7jafPn0xkXpiu9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBBwVRgVdnxstNDbPXVcUD/1Z8CkkvrVQdimeW4LMzARkyAAcmeMJwJPjaHdb1uvWNNUCvyo+ZIFZEY34zn6xoBw9vZMR7vrKP6dCAYln/+My6AcqigzbHmjsQJ8rjaWkR0VjITlmi9XoU3DsjEn4Gl9ZmSMO42M44gAQxWrbh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ILn5y5KI; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a12fbbd9d2so7040469e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773667832; x=1774272632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWcSfGy9KQONYfZbcr63kentbs7tqTbeJBgJ1hS1gko=;
        b=ILn5y5KIZGFilQab4r3Y++jBJmuD1590hAunuMNNFNxAmO8/RSA+g0s6JTCfW1fhtY
         Rb0n5ARnYEPrkNQuSN0DqfhlIhvpyIv2o0nIV/RIq9nMyFsJSH/c0hiq2TzuwilQVc3Y
         WvQlFVvQ51qYJ4nq6ee5eDKXtNWAtqq84LFr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667832; x=1774272632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWcSfGy9KQONYfZbcr63kentbs7tqTbeJBgJ1hS1gko=;
        b=lvdCXtbmdB7glCtpIfjCzJnzKCFIkE6k0Ev5itY8qsPqe633wVugJGrYeppI4qNLxA
         L4uJXsXpB9G0CFniZS3QCsgPvgUNVty95tOoGUF4YSwQiOj0Em6Xb5L59KHTIEAVSA5C
         mxpXy3glaQ/HxlY3d0NiIfMfK4GVb2wUw7cCM7cMi36XHZYhTGCxcKHZZHho1xDXwKn4
         WC9srskjIizySDZeySr8UF8xO5rPUK8I1bWbe+o5spkXy5JK/ErHBFAYsHZfrDvf/Veq
         eNdp+foTV4Mp+rjkYfpaS1SblPGSFkqthh/IFjjBTGtUjbSRaggZmwAX7x8zvpcRR5NM
         xOrg==
X-Gm-Message-State: AOJu0YyfEb1RXGF1xUD5Tnqb9XDUWkUVdQhl2EFAqiuhoGi463e68ErK
	c8iqWB2tG1kECogvZDnoxXOP2YfcOkcIrk/QfYawogD6BZZbOa/39ugZFcXmSzaaKQ==
X-Gm-Gg: ATEYQzyA3Ff20p3FwvMJq8j8+Y6Q675keW1OpJw8KfbVkkMfRZrB6WzHJOWRsm0sxG3
	FS+WC1fNrqPRnunGutz7fa+C8ipuj7dICGZTGKN8KdQ8MmBX8Vuuo3GZtaiGjBp4w4Unez+HplV
	w+dQ3bRP4ZZhuhoGP2UyCa5kdc1F4srQBFEVFsR9yl/J80u8bz1yGV3elATb6H5QBT6aXq+eJyQ
	R1fD/iCXt6cWc87hn/BuDd8kqo8ZMP5CbJxyyXQba/ang+Qqy44IvuWDFsLGsR0AcY8mjbxsHZu
	zd8DaBGoBb/Y9lD/XzMnqFEUygdqaP7Jm6VLuqhbF9ywrRFwwNMnrOgSvl3qMSs5PnXzs5jzI9X
	RMYIgW3b/rGwdgZGyPA6xxNEW7QPkvPF9gfQZpUt3Fa+dlizNBItNZQf+Q2dvf5i8OKOHUV5DnK
	/l2NppLX+E57tZ0coznY2hrmeCeb1sws1ehMeHkxaav/xP7uEuzqsyV5tmoXfTrjdrfv+0Kfnx7
	g==
X-Received: by 2002:ac2:4ed9:0:b0:5a1:2a20:9255 with SMTP id 2adb3069b0e04-5a16270eaf4mr4277043e87.18.1773667831543;
        Mon, 16 Mar 2026 06:30:31 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636b69dsm3469985e87.82.2026.03.16.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:30:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Mar 2026 13:30:29 +0000
Subject: [PATCH v3 1/2] media: uvcvideo: Fix buffer sequence in frame gaps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-uvc-fid-v3-1-c793354469b5@chromium.org>
References: <20260316-uvc-fid-v3-0-c793354469b5@chromium.org>
In-Reply-To: <20260316-uvc-fid-v3-0-c793354469b5@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55911-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0131E29A6E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In UVC, the FID flips with every frame. For every FID flip, we increase
the stream sequence number.

Now, If a FID flips multiple times and there is no data transferred between
the flips, the buffer sequence number will be set to the value of the
stream sequence number after the first flip.

Userspace uses the buffer sequence number to determine if there has been
missing frames. With the current behaviour, userspace will think that the
gap is in the wrong location.

This patch modifies uvc_video_decode_start() to provide the correct buffer
sequence number and timestamp.

Cc: stable@kernel.org
Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 40c76c051da2..9e06b1d0f0f9 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1176,6 +1176,20 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		stream->sequence++;
 		if (stream->sequence)
 			uvc_video_stats_update(stream);
+
+		/*
+		 * If there is a FID flip and the buffer has no data,
+		 * initialize its sequence number and timestamp.
+		 *
+		 * The driver already takes care of injecting FID flips for
+		 * UVC_QUIRK_STREAM_NO_FID and UVC_QUIRK_MJPEG_NO_EOF.
+		 */
+		if (buf && !buf->bytesused) {
+			buf->buf.field = V4L2_FIELD_NONE;
+			buf->buf.sequence = stream->sequence;
+			buf->buf.vb2_buf.timestamp =
+					ktime_to_ns(uvc_video_get_time());
+		}
 	}
 
 	uvc_video_clock_decode(stream, buf, data, len);
@@ -1216,10 +1230,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 			return -ENODATA;
 		}
 
-		buf->buf.field = V4L2_FIELD_NONE;
-		buf->buf.sequence = stream->sequence;
-		buf->buf.vb2_buf.timestamp = ktime_to_ns(uvc_video_get_time());
-
 		/* TODO: Handle PTS and SCR. */
 		buf->state = UVC_BUF_STATE_ACTIVE;
 	}

-- 
2.53.0.851.ga537e3e6e9-goog


