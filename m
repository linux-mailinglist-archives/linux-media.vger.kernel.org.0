Return-Path: <linux-media+bounces-56531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMBnFaJNvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:37:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D25A2DB11F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CA47305D6DB
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1303282F2C;
	Fri, 20 Mar 2026 13:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cfQv+pTW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F63728002B
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013756; cv=none; b=MLolctS96U50/huiVPctQgfqpLeYyR2iHyWZ3DEZZaaEAZvStiuezFsCY6N+Piz0JNLBoKkSUuX3QNa0xkiFM9BBKsPCX7uMcoX8OYquJfalYtcUmce8FaE5ijUTAgwkUR02mgBVcvqSlNrZr9TVn/BjykdKQ7sWjIrUbAG42iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013756; c=relaxed/simple;
	bh=miFrhbRHPBR7IxqWfeNvfXTotnKkMaSESs0/zZPtX9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgoNh1yFlM6tXzDxM3Ux+1lMve+vaIMUBR1tYgboiiFt3jsOVOZpWOugxteuNINnMv8OSkcBUY8+gQTW2GHAhc0Vq9QCJ0d8LniyciQ5szUubC7CBmGanxycDIQ3niey812iIMNnWqJThxoWDlemubrwJHhynzkC1Jvjf/dEOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cfQv+pTW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59dea72099eso1090066e87.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774013751; x=1774618551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pz5PvY7PDquH57JJyFz19TUFwGgCWvrCD8pS5CRc+Dg=;
        b=cfQv+pTWERdnxLytJa0SC1mTQGrSZen38FY/aS1vAfZnVc4NTFl4asIKDLZLarqr+0
         mUGhpTGrROEWWBhCS2b/hLZ++qw2THDSGPNMc5g+67ISruw7VyZozMKm/YTZ/t44riGt
         slpkuUMnS1HH5qhOmZ9u4HuAI2Uz8AqyeTRjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774013751; x=1774618551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pz5PvY7PDquH57JJyFz19TUFwGgCWvrCD8pS5CRc+Dg=;
        b=QlBSQ7e8QQO/0e2+kWun8/xuom6phWz0eB+2kwntlZi/zTdtV2XfJ6mneu7/CDlhGw
         JjCFhln8blzH/1gKl0DAL49WCq4uB0qnTm0L/HpMFVa5/KrbvRurn7a/J5eSS3xfea/0
         TBykdEK4D5E992V59M37HqnutRdLy4/GQn4c1XLaFgR9MgK0F0t+PpL/lZgolXjCGFUi
         iNrfTpZTfkRcOpjBtJjm22JAygPFJ9PjPsb8MkFR+fhguB90UwClLZ2sriowzu6U4Ci+
         4HkCMmpMmJ/+XrQ0V4vSigy7IUeYO0LuQGSdANZ7h0MEpdYJ1vQ+Eg0EWQeCQ/bKz20B
         aKfw==
X-Gm-Message-State: AOJu0Yx0Fgo6unrtzSfqwouHTGwGrrxbo7dq4yPOCNMq3LQjTjuqCaTJ
	Cg14PqYhwww1bCO+mz29bjnBuWJH3hfYVSElVWa98PBg7+AqLyZkkuycMrGspDi9cyhIZwcZHLO
	C0zZ1bOJ3
X-Gm-Gg: ATEYQzyMCsjyeTkQP+1+pLWY0+sAExjfbflmttW5zS0ngiHPEtZXMIDOjn4ofQk13Q1
	GHdKtlSFsSnpCWKRS0JrShXocstQyvVDcvbWo2hpjT2sSBNPjlGUp1uEgmmwMC+UKHXNhtxAMna
	UGjMw9J16BjRb5dbcQipUzqhx7bdd5oM3g9qTLODnJhjmmat7jlvch4JVx0+9DfMoHA9SIGOkZI
	N7vbcxl6vCtNlJOg70Ch4moAjDuOLAMPgaM/x14AZdEDIvSOBJkhOFxPZ57gOFaQ6VJK54HPGxo
	qsl5RqlxbtfjlbEPLQerveJhQqm+tRUNSF+2dNw70X9ciJG9TOxzMykvBn5H6uaNsFU0s3yOqZs
	yrn5epG2ZjryXzysdoyMA1OJYzZDa/btfIp9f2CJHKy29IrOIvO5ijFkTGNq7BIzFtODzTi2q/j
	tHIRrgZOFBFI0KdxsdL2bZ+SoZd/D6cEp5tn+X79pdqUrFeRLcOB4Kw7xBlE8kS72iklNu1wa1r
	aj1l8Kl/8oB98uReA==
X-Received: by 2002:a05:6512:692:b0:5a1:d354:2fb3 with SMTP id 2adb3069b0e04-5a285b5417cmr968699e87.27.1774013751386;
        Fri, 20 Mar 2026 06:35:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cb91sm553112e87.77.2026.03.20.06.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 06:35:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 20 Mar 2026 13:35:45 +0000
Subject: [PATCH v4 1/2] media: uvcvideo: Fix buffer sequence in frame gaps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-uvc-fid-v4-1-f24f168ca2f9@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56531-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: 0D25A2DB11F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In UVC, the FID flips with every frame. For every FID flip, we increase
the stream sequence number.

Now, if a FID flips multiple times and there is no data transferred between
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
2.53.0.959.g497ff81fa9-goog


