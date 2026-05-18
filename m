Return-Path: <linux-media+bounces-61954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDYkJEfvCmpv+AQAu9opvQ
	(envelope-from <linux-media+bounces-61954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:51:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A456B000
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 062283028101
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6E83EF669;
	Mon, 18 May 2026 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0+MkBkt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C8C3E7155
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101466; cv=none; b=bsm1vOMlnGgVFl0v2A4aQLYXvWnGULZYpkeyKviF6BeqcAY6lXJXN2QL1zw7lG4Nq38QPXBuoRpw78g+/ihY+Ut99/1CjSxK0et/5VPUpEIfbC2fH+2uWbSxCaUU0pcuGKpB8M3T+iJW4d1X6/B896ycyPqzZDD+l3KiF77X5+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101466; c=relaxed/simple;
	bh=uPXnstoQIYOFla6f9jhOieLybnCGhI4o89svjf2rQvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obfQ5bPJ99Mm92dlyBy7KtgYGHub2G4g/B2goxh3Ix2yU0m+udF0T85vDN8WZv3qiEE9CtmbPpVD8PrHisubImWuxgQDYEf1XPsXRryvMAfctDVOZ4OAVTDHO0YOYC9sYwuwlUonf3sYPTOjn2bOxKB0PLPVvJ2kKkzSzwwhwG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0+MkBkt; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-83975e992e1so765095b3a.2
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 03:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101456; x=1779706256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIMY2Bq2jV6px0A0JMLvS5BCI2aRnJA8nAgU6QBmpK8=;
        b=l0+MkBktYOgowCqXVWtDc+JijVMvVrqKNAFApCCnKJIrJIChdBveCFYnDhwHux2xcf
         ek3+omnQRrp09hhEpV1dJ0HyATTvYwBu0nes0ml1vo5S0qdP58dApKc9bDjA/8WTn7sm
         BqC7YIoSQ3A7CyYkwM39YiXY+CX80TsV2sVI9c9GDfICUIIFFXbYRmBA7SzCRXZssH7k
         cWpXIaiqhfqVb0S3kIoUKgmxBl0+7HZl7dPXMa0HUEWpt/5tgSxLvT0xLJwMK4XNYAda
         2vTTSzT+dIkJUXJ7+dQR51mAzWAdiJo/3mhfVGuTEXuGeRc3meaN1b5UX5S5/6RBAd9F
         e2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101456; x=1779706256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIMY2Bq2jV6px0A0JMLvS5BCI2aRnJA8nAgU6QBmpK8=;
        b=rQKR1vMFhSzqMPUhl32cvR33o0FOvZQU8r8ipk8Gux6gWjKNHQVxX1g9nlqVmO50ZZ
         UY2+1zxuQu1ARVQzUJTw5O6qjQ45A9WKiQEaI+WbkL7gyecKcC+Dd3LipzZlXSoj05JP
         8SQtfIf6JUE08Ea/qxF4CsnwEzSUt1m6+f21c4+oTLuCAT+KWZ/CZNf6WAM0cR1yzpg8
         kA8AMPL3ovQn14JrKvlTRjXCW7mI/MZnoiwWMFS5eUYDTzjG4iKbajbMceaB//JX1dcu
         C66N3FPKSIsTEJp7A9x4IYWkUUcmztTtuu3K9LMKr5pjGN/w6oJZVny/LSJ2OPUJwRfs
         rQig==
X-Forwarded-Encrypted: i=1; AFNElJ9BAM0Cy5vkUnyQiD8qmnLq1occE+pFCBCTqw5QtOOZNUeCW/dDX7BE3h9Sj63wDpuwBzX00A7YyliwRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnBDOL+x3d1bx2O47QtHyl6jf56IwI18aMglRgWEEMCu3raoEa
	LbzTHV6rA0EGfrIg9KOcwv7HDA/Wav/3PDYkqGGJplIrWAH/3/KDw1II
X-Gm-Gg: Acq92OFKkfmNFNCy3bPgzSsuKNIXxyEc7oiAtWXWrgdHYYDsavTdi3bNoFYlZzQUaK6
	vS+oAvP5PFXv6yGZEJ6OUhxBv55WDdESrF97FDgdK6EOhAdRvb8nzhA2yl7f4SNyYlMW+81ar7v
	R2eVaFF8sBQ/qVyTQX/a+FkTeqlPcbMNqlpTs2E5J2JlSUgsp8HH2nVk7kpNpqtHOVrvlgFVPsc
	4wujo82FQUqmefhYZ9ASKmL4+fdtGxazjQQQhpTlUZ5sMAZe20wPwAfXjoyvBWDDSZU3YIkBBA2
	fNq+4gjZhnIK7fbcXrcv7Sti6uFFS5aUuNKTKttk09zlmbqpkEcHAIZCRyRsjEq3NVZps8x2c4T
	ox/ckN9Kt4y7Jf/IkrCFlhDL7dmmkSF34VkoyKlf2P3IF1SwtclnwF3oB2MOPQf0N3EEwW8RHji
	yIt5IySvomOsD96Q==
X-Received: by 2002:a05:6a00:10c6:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-83f33c60b28mr15900647b3a.23.1779101456029;
        Mon, 18 May 2026 03:50:56 -0700 (PDT)
Received: from lgs.. ([101.36.109.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1979a0b2sm14013855b3a.26.2026.05.18.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:50:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Michael Krufky <mkrufky@linuxtv.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: cxusb: avoid double free on radio register failure
Date: Mon, 18 May 2026 18:50:33 +0800
Message-ID: <20260518105033.987729-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4C0A456B000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61954-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

cxusb_medion_register_analog_radio() allocates a video_device with
video_device_alloc() and releases it if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  cxusb_medion_register_analog_radio()
    -> video_device_release(cxdev->radiodev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free cxdev->radiodev through
vdev->release(). cxusb_medion_register_analog_radio() then releases
cxdev->radiodev exactly once on failure. Restore video_device_release()
after successful registration so the registered device keeps its normal
lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: e478d4054054 ("media: cxusb: add analog mode support for Medion MD95700")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/usb/dvb-usb/cxusb-analog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index 2d899af0d5c3..c31a46e59495 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -1690,7 +1690,7 @@ static int cxusb_medion_register_analog_radio(struct dvb_usb_device *dvbdev)
 	strscpy(cxdev->radiodev->name, "cxusb", sizeof(cxdev->radiodev->name));
 	cxdev->radiodev->vfl_dir = VFL_DIR_RX;
 	cxdev->radiodev->ioctl_ops = &cxusb_radio_ioctl;
-	cxdev->radiodev->release = video_device_release;
+	cxdev->radiodev->release = video_device_release_empty;
 	cxdev->radiodev->lock = &cxdev->dev_lock;
 	video_set_drvdata(cxdev->radiodev, dvbdev);
 
@@ -1702,6 +1702,7 @@ static int cxusb_medion_register_analog_radio(struct dvb_usb_device *dvbdev)
 		return ret;
 	}
 
+	cxdev->radiodev->release = video_device_release;
 	return 0;
 }
 
-- 
2.43.0


