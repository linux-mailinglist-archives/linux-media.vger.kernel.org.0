Return-Path: <linux-media+bounces-56681-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAEtAjMOwWngQAQAu9opvQ
	(envelope-from <linux-media+bounces-56681-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:56:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5542EF759
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21F903036E83
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E20388373;
	Mon, 23 Mar 2026 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fGJ/yIym"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348313876B8
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259642; cv=none; b=RjoaAU3U/otxB0RELqLoh5k7r5lRfU8rUmyj0PkpD2CqV5St6YsePTq5IVrGmyXsdDx4ReHBJRCdie8HK+oQ5QWtPtCfbFRv6TMSEb4hXz4HbD1XMlyfU2ZKUzZjZFTUye6f4WMKsLi3yXTdjqbaSeX2kHavMZUdhELyaZ91+v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259642; c=relaxed/simple;
	bh=j3lhbS5yXeDka5aOBVkUuRzIkBfkC70r22TX25YM4OI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbB2TurHQCNujBJlPwfxNtg0I8K9Zv9FnnTMtzHRUSXC7686nI37RgENZoxnwU7ZK41t9Z2u0DXQxyY/tQLANopobXPLsPJ8wXthstZmFpQcLg1XpeZWm+MgHyFK9dsNxRq4Wv3gtBx1e0WN4jHrXV0BFT2fFlysbOOYlRH+We8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fGJ/yIym; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a27a7f711eso2948696e87.2
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774259639; x=1774864439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nOCMs7tCfFxoJsdyprxw/heZAxhAPdbkd4N+2vm4T4=;
        b=fGJ/yIym9ymZic+WJUgUfjl3vCRCDL57tMN5T+qRHVPQZ2Id6q7v69KunwNXoEoI/e
         Yr03PeXMil870TKlX9zMiVy4RO5UQVteAvPVFEdDxfTdxpRyo0IyTdmVDT2OVBBwnCE6
         l1F1dXIE8I2Q7ovt1XVF1Ujp5S1ShYzLtNnMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259639; x=1774864439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/nOCMs7tCfFxoJsdyprxw/heZAxhAPdbkd4N+2vm4T4=;
        b=MxKnBZgKmOpnMeE3QvKp8XpRpMN0Kk7dxM5uVZEroMlaOwzq/lj7ZTowz6LKpTAnVb
         0NrS72SKJSJi1WlgR+B+TTpmcpKwS2jYuvJdMTZYrqlUKCQryS1xMqwL7Kjt2USG5kKQ
         3DrNl5nIJrBkC3fwzwG49VS+urC0aKCLzXPe4x9iyn985CExWsYeOEbZ01uqmxE+cloa
         +9sbbHLwGZuIyHqxYDug3l69oTBJF7D5wPKz/HH7wVSL/0+BTdUFDfdQNyQQGsuYG2Re
         wMaxzaaAiqOFJ81Ms/txy/tdKjPAeYPdmQ6ZfxKr+KPHk1Eee7vXtWfvHX7MTQPSzNCF
         kKjQ==
X-Gm-Message-State: AOJu0Ywn8VOys+jewIpNsm9YMufjyg36uZ3htxaHnQFcn1Xgx82eFL60
	OI4D+onZ6SwXzwEEh/76Ja6QMgnZ2d1gH6Vqg9XTEOtAiM2JfU0qJBSb2l1zOK2i9Q==
X-Gm-Gg: ATEYQzyUzqZBQq4sioOWl367KBQhvXpU3IGYl+4AZRGIqWeZXQq22yj2CS9gR52sA7E
	sx4OuqGPU2d53SDmGKU8691fv0sj+y6bJ3VgKhvNWSm1dNxDGpR4qsgP5vDueyu6NwFq4rTzQSc
	t4cHlczrcFi8GKP7usJH9lRqDEvYkJbDOhQllMKdSyOdA8fHrVyKGHh+TnllGyiV/324qe5VPYI
	ps1DkfwA3tR4dj5eq+ULZt3bSEQ9mUuDp98tDe/1+9nZ7XR3rxmMnn1kXgtz0W66/Xtjr2FH5ys
	BbHeYVPht0mtz3DndNmYnCmNlNF0PpopZudXw9zApYg4gXcfWmybOTS+7JpYjx68nhC9hNCSSib
	z7PaFxeuVuzu6Myx7mt8XNicbVprsjtrKp0PcyTPYIuOvDcO4OFNHkHrasyNApBWTPfUUbF6lVn
	/Tj2QLPC6fQ8mW5G5tBjoqjTquAzdOWtxnjkbedFijwJRs4qBIyfa0XUM51b0PEXTqdufLLAX/g
	8oTJNg=
X-Received: by 2002:a05:6512:39c4:b0:5a1:18b4:6c47 with SMTP id 2adb3069b0e04-5a285aa48c9mr4186709e87.0.1774259639367;
        Mon, 23 Mar 2026 02:53:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192e93sm2430001e87.13.2026.03.23.02.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:53:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Mar 2026 09:53:53 +0000
Subject: [PATCH v5 2/2] media: uvcvideo: Fix buffer sequence in frame gaps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-uvc-fid-v5-2-e2858b657aac@chromium.org>
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
	TAGGED_FROM(0.00)[bounces-56681-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D5542EF759
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In UVC, the FID flips with every frame. For every FID flip, we increase
the stream sequence number.

Now, if a FID flips multiple times and there is no data transferred between
the flips, the buffer sequence number will be set to the value of the
stream sequence number after the first flip.

Userspace uses the buffer sequence number to determine if there have been
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
index eddb4821b205..32c3469f26c6 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1223,6 +1223,20 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
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
+		if (buf) {
+			buf->buf.field = V4L2_FIELD_NONE;
+			buf->buf.sequence = stream->sequence;
+			buf->buf.vb2_buf.timestamp =
+					ktime_to_ns(uvc_video_get_time());
+		}
 	}
 
 	uvc_video_clock_decode(stream, buf, data, len);
@@ -1263,10 +1277,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
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
2.53.0.959.g497ff81fa9-goog


