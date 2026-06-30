Return-Path: <linux-media+bounces-66069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UE+vMYOaQ2pzdAoAu9opvQ
	(envelope-from <linux-media+bounces-66069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:29:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E26E2D93
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:29:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=MU3bmiiz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66069-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66069-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B4EF301FF34
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590533EFD37;
	Tue, 30 Jun 2026 10:28:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB0C331EA5
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 10:28:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815335; cv=none; b=iuGXfFRJo3YZF7dWIfIC1PQLiNpdYhrwRg9obFt43/6KVipPNpSsGlN3VeGrInKxVbTLhNU/udnMqnVUN/mem1Q/UZOFUYjn7L+qw8gYwwQKtw467b4IapYiokQiUNhgPwIhERBR15Rjj+klDpaxfeAcixMNXJTf6jEW4UIZAwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815335; c=relaxed/simple;
	bh=FO9Y4NDt1xeAvZIufZf8IfyxUZYt7nOLxBM1k5dNniM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CX5Cm9pZHpuCIspbZgupRJvx4DmyYbDozhkNmvvQ+8vMilHqpJeLMDb6vPuStY1Q+SUBTVqf88ZyU2iK5wDgu+XdIXtIfXkLWYzmXewVkHNOlE//ViZkg6V++s2MMtCQj9GJe3ENNaQi1zzmgP+OqoxwWaKUvD8gW4yJcP34UJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MU3bmiiz; arc=none smtp.client-ip=209.85.208.175
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39afb0d9f7eso26597131fa.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 03:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782815332; x=1783420132; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QBBDHN12paKOknFgOoTt+soIt/YlLreXomWGzNG85zk=;
        b=MU3bmiizRO4TAmjahI0XtR/vAhgGzv+3TvKpWpKciy0Qq7IjlfUwKZu7M46rNH/0oW
         7FsBf3t4wAVF1bHx+5gd2LTtcZnm3KN6xZ1/xUvUuj5Ydq2AJZi21S0Dp+/N91PWzrTj
         IOlX46y8juVfn01CIhGF3O22HoDDjTUJ2qfng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815332; x=1783420132;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBBDHN12paKOknFgOoTt+soIt/YlLreXomWGzNG85zk=;
        b=OfBTUV8vHHk5eLMiIP6ONd61ExSmPlviS5Wrb0uKPyCwXUXaZrcz356AUyRIDatrCd
         FzDPzBnNUYrPCG6Nt3LBA+b/Ly2zhIiG21MwL6N5Iz50UgnQbJELq8jfDJhHRmgjILHu
         isui/EImA5hGGE0s0QgrMi4ftK1lHWM/s3XHffbDhqYvO0ugiOcv0WkpbCWPIkHg9hPx
         eltrZ+QCVuRd/0yk9TFhBB7QtaRf/adiP9ztlXHLK/4Bo+0XrdV+3iyKfTiSGxOjP5h1
         /9qJWFufdp5Cs3RcKNp3BXtpyuSvVb4AhuZr4lBSnCksGwyOb0R8810lQCfMCjcPZXt2
         V6oA==
X-Gm-Message-State: AOJu0YyTYKE+F5V9eN7vphvkhjOl7YR3QjI5vBDu9nFF39HdstK3HvWn
	xfTnafSuWq7Mk2BDk2BtuPPNSjUa7iUWb2RPIAdRkt15UE/aVqgcRGOFXfKhYbBpGJENymWKwWc
	pN396reMJ
X-Gm-Gg: AfdE7clnEOlBFKZ/djnd90FGp5QtId0zNUkIcbgDMZ/T2JuW2QQ6UxuIrRJu8MuHvwv
	Nbpw3mUnoSwreeppnxK16q+LygYHIlwJTj6HeyZ0QZt14i1U2WCW3ttyos6i9UB0FiPnDYT7Ipo
	6TVCpjt8v8xzt+Uj2zvc2b51WYKidLL2ITnKr2MScZJDc0Cgb1TAD+QVfFmKF0FvYFijM1nyl3A
	9iUnWQIBmgse2h7IeZmDyRpg0dNoZeaPr5+62TlG3T0uclZGgQr2Hzd3cbxhXIy/a2ZQtpBcYeg
	TgPFYNN+0kMHkw2str5I2tM4gBzCnyPlWIJLEq2bT0ODxW55iGLTdpCDFsSbgzuTBJD5PLcjtsT
	mEVIe4fJ+PinFHYGM2BFarRfps4iNneOUJ4DvTtTxvLK2eJ1zcG+T1Y5YFHfldMIPPYGatX7rRB
	iOOOOJ0BdsfbMCW94l//Z264LMcGrp3pE1EqW39rvUgeQFVqgb46vuVLzp4bX/OA/7C3X+hIZ6Q
	1JJD1M=
X-Received: by 2002:a2e:bcc1:0:b0:39a:e7f6:49ae with SMTP id 38308e7fff4ca-39b28bd0733mr493481fa.0.1782815332499;
        Tue, 30 Jun 2026 03:28:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1da777edsm4378091fa.35.2026.06.30.03.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:28:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 30 Jun 2026 10:28:50 +0000
Subject: [PATCH] media: uvcvideo: Remove unused active field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-uvc-remove-active-v1-1-ed1421b99429@chromium.org>
X-B4-Tracking: v=1; b=H4sIAGGaQ2oC/x2MywqAIBAAfyX2nKApIv1KdMhtqz30QEsC8d+TT
 sMcZjJECkwR+iZDoMSRz6OKahvAbTpWEjxXh052VlotxZNQBNrPRGLCmyucM1o55dF7A7W7Ai3
 8/s9hLOUDheIbbGMAAAA=
X-Change-ID: 20260630-uvc-remove-active-8843181bcbb4
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,sto.lore.kernel.org:server fail,chromium.org:server fail];
	TAGGED_FROM(0.00)[bounces-66069-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ribalda@chromium.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 646E26E2D93

The active field in struct uvc_streaming is not used anymore, drop it.

Reported-by: Hans de Goede <hansg@kernel.org>
Closes: https://lore.kernel.org/linux-media/20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org/T/#m3078f0d5fd71435b5cfacaa5c99f23a446db581f
Fixes: c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop helpers")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 --
 drivers/media/usb/uvc/uvcvideo.h  | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index fc3536a4399f..0167f0f8e846 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -2229,8 +2229,6 @@ int uvc_video_init(struct uvc_streaming *stream)
 		return -EINVAL;
 	}
 
-	atomic_set(&stream->active, 0);
-
 	/*
 	 * Alternate setting 0 should be the default, yet the XBox Live Vision
 	 * Cam (and possibly other devices) crash or otherwise misbehave if
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b6bcee4a222f..021fd9af78b5 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -456,7 +456,6 @@ struct uvc_streaming {
 	struct list_head list;
 	struct uvc_device *dev;
 	struct uvc_video_chain *chain;
-	atomic_t active;
 
 	struct usb_interface *intf;
 	int intfnum;

---
base-commit: 253355887a1ab0ac8f33b356c7c1140eee554d18
change-id: 20260630-uvc-remove-active-8843181bcbb4

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


