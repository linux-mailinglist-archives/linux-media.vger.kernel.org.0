Return-Path: <linux-media+bounces-55764-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFSlEuhVtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55764-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 19:22:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2764288B24
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 19:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 829243185AE4
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E143CCFD1;
	Fri, 13 Mar 2026 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eaGCClTr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761013947A6
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 18:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773426079; cv=none; b=mPbXRfsaUyXChVVk4/EQdmYZkCO0lBX5iWTyM2sByW/TubOVKRnNW6ieRNWOjUOq8xYXmmlu7/3EL4C1VHN3hDtT5Oi1iJdEEka17FiuaoQY3XvAg+Xbo/XAuVXm5sW1HHjLwj1nmQkEYV252DFwm3ozLe0lhPo+3+8CfhkNhyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773426079; c=relaxed/simple;
	bh=FPiOdnFRxwwj4yBBQS7IlAO9n0Q31tHDbSTTMEbWTz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TrZay8KOqFz366qD5u6PD97/gdZDGONmu1zFasNOTHsjXs53JbRI2f7NqCLOMd/hqqAd2Zx9wdMExBsTm8PLn3HxqszqWjuQM3KBioevQmcLwy4kPGmXG1OZDcM7ZlzKiyz/nHMdf5ZwF2i0Fr/e9Wafn4wPNi9aBhb1BeAhZ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eaGCClTr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a10d130b37so2177986e87.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 11:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773426076; x=1774030876; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/GRqsBWigY/fgWSjpHBrgBJmMne+sWw+2+mDk8tZ2o=;
        b=eaGCClTr/7yjDpwwrwPkTFT4zYsXtMiyBXPI/Bfsdv0fXf6XlXtXHUBaxE1FuI/Xu8
         X1Ub5Hh4OzBRoWEHiCOnxIFMYFJ98H5uXSPqCecKFu7xP0JGDIiU0JHFGUlTQ5ML4lzi
         auGX8DaxxqWJsUUn8HkjRCf7KiScChdH7VgjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773426076; x=1774030876;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/GRqsBWigY/fgWSjpHBrgBJmMne+sWw+2+mDk8tZ2o=;
        b=tHaX5KniGgG0a02DWs6XfDRrOMfAH8M1/pVNZDdl2gdXhYUCYpLVX9xhtqIGxF8l6i
         ZKWTZddDG4mhl44pUQPej+wYpuHSHKRHSmR6OfZ58JkAKHI0nf7yrzUuuNq9FR95LKLu
         DSIl2yIhNlCiSUFA9fK8Rmd+Bq4TwDrCL3XzBvVQkuvx5iYlmHcIt03GY6mTGP0UpFnG
         kPofrZ1P6fpwwpq3wWJhNnEIhbNtPkbxiHl/aGrpQgAjCLzetSoZSWl6TsPnGGHpeBhP
         KixvbpGLKtqo7nHFjnC6Isy5yF+ZceBnSboduRfIa/Hks8ib5H88KJQByv4rTdWC+51o
         UQpw==
X-Gm-Message-State: AOJu0YymE88uONNJ/kko/mAtx5udeIZB9I6tDUYJdubhErrDgQ5pd9Zk
	FqITjSzvi9G+fGIIX46d8epqq20uIpSpd77Uj2ja1+JTx8OZgynr5ZxMyLHdS8XgsA==
X-Gm-Gg: ATEYQzyiFlv5+8ux16rAaaaqczih1L10aCBFq6974jezCzxvLcPZ6VTk4KEMqh/pK6o
	Nk2s25mV4ZVwd1QgLTDVuQQtmTvZag6qyzXgw6Zj9MQ+6GvCKY3Hp5ptxktusmbD21Tq6RTizVl
	4pDznH93nPTR6J1iEvgj0iDzt/Rb652BhP2yzIEydYFMb/zqKbxyhOMwtv5BJUR4QtXX0AViFH2
	MyvKY3FE5Hx7CY76o/2jmr2SjLnsYjeX3KoL9Y/jkfRwrlt72uVSmwUXJfYt6/9dv2itudnF4kf
	pddfxphrTqNFw2Fk+zbOzVXnUxQvJf4XIvxHy4Q3dYRLlPA1GyjCs3fZK2eLHlcrYKJRt/xmQZa
	pE254WAi/YdDYCm1yZWP+DC0jb35kkspL6YTgBfCChQebxwKppPeGmd/P3+FAbCjx6kU212+5sv
	1huILJjYFAmeI3f6K1OSJUI0gRFK1F1txxn2ma+4V1gkgKlV8BBEDNPCckPyesmPu2j9MgAlh3Z
	g==
X-Received: by 2002:a05:6512:1310:b0:5a1:4246:4167 with SMTP id 2adb3069b0e04-5a15a4c78admr2865479e87.19.1773426076428;
        Fri, 13 Mar 2026 11:21:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636a96bsm1709243e87.79.2026.03.13.11.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 11:21:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 13 Mar 2026 18:21:13 +0000
Subject: [PATCH v2] media: uvcvideo: Fix buffer sequence in frame gaps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-uvc-fid-v2-1-3f7a996d9047@chromium.org>
X-B4-Tracking: v=1; b=H4sIAJhVtGkC/2XMSw7CIBSF4a00dyyGZ0kcuQ/TgcKl3EGLAUs0D
 XsXO3X4n5x8OxTMhAUuww4ZKxVKaw95GsDF+zojI98bJJcjV4KzrToWyDMUaIzW9jEGAf39zBj
 ofUi3qXek8kr5c8BV/NZ/owommEFlvVPOcqmvLua00LacU55haq19AX88+62hAAAA
X-Change-ID: 20260310-uvc-fid-e1e55447b6f1
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, stable@kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
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
	TAGGED_FROM(0.00)[bounces-55764-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2764288B24
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

This patch modifies uvc_video_decode_start() to provide the correct
correct buffer sequence number and timestamp.

Cc: stable@kernel.org
Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2 (Thanks Laurent):
- Improve commit message.
- Remove original timestamp and sequence assignment. It is not neeed
- Link to v1: https://lore.kernel.org/r/20260310-uvc-fid-v1-1-5e37dc3c7024@chromium.org
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

---
base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
change-id: 20260310-uvc-fid-e1e55447b6f1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


