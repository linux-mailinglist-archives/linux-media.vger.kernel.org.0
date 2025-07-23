Return-Path: <linux-media+bounces-38238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA694B0EED3
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 11:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21AB9632C2
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 09:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0DF289E12;
	Wed, 23 Jul 2025 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxZ+X4HX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A553926C3BD;
	Wed, 23 Jul 2025 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264403; cv=none; b=ZLKQQnZbDXus9dekQ4FezyL/QEJq4xP2/hghB494Gycww53N+ZA14KvRd5a2zkOdevQY+SDkmflq4gzEqDn0uMUmu1HHvaZf4tXX5kIeROhbnZMN6/ZDqa3m7arfV2TKQk+abGdFITqBL0M/xC6L1k5XmNkVolrk9uG2E2r9kIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264403; c=relaxed/simple;
	bh=DI7ekfWyCxlDtUa0spYzAbklePE7kl5NCBVy46hkkdg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HgpmMNaoBbQud7/3ZdYUVkiHw+x0d7VbpNImOZPXeY39AR4rFrGs2esPO82IXMqZSHKR5CFa6BozPbzEDCFta1VW9cIvpXZb+x+fdT16odpF9AzUzpb6HZ/TM5t465Dein1GsccffX3fQ/TDwXAfaJLVAWJQs/sMvyss/NiLJh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxZ+X4HX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-456108bf94bso45794205e9.0;
        Wed, 23 Jul 2025 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753264399; x=1753869199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EYp6k2DX5D5XbLlxdIv0kw8mpvco5bmHcOTW1MVImJ8=;
        b=hxZ+X4HXG/SyFOOE+M3NA62hwRy1slqDBRL49nVjQMHS20jz0Iqr/I6EdbLERKLtKr
         PaSgx+pIMk9eZs5rTlJNYxFY5G7PwmrkVb8MpYpoCS/xpodLB6MArUO0MrU0q+wDS4UY
         ai0KIJBfI7SSzGUN7rOIISzciOGDvz0Az4N5KSpqcKVxXFEYqEClhXVfev0UwaXFKW8q
         iSaK1Kf929H5qfCYoI0IFVKB9XDh7xz3f7FahWLMssW4LIHWpuiBuVuBlZa5yRqQjF0W
         aJtzJnH+bDJlZI1FIfPvEqL4/UmKlzn3CFJGg2ycN8ArLTd77pYcTYiyvGLYvdnXIqY9
         kMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264399; x=1753869199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYp6k2DX5D5XbLlxdIv0kw8mpvco5bmHcOTW1MVImJ8=;
        b=FX7o0EgCBvA62Lnwybi6JMXP4ctum2mbcf4UhF9C+6Q7MigulK6n1mi3CtdN0MXMz9
         r7Dwes5ModTC5nUwn3EsB2hA47Sa+q4FnGECjV2NzDJC4uRq9wiZCbLOqUotxP1pShk+
         MmQu56PPCCp92M+OaDO6lT8roEKm5vlkq5ld/+AfQn6dm6nS7R5bBeq8gssYKapqORYV
         UTieb4q1slUGoDWQb+xR9uQIEkzmw/qbj4Q+4oK7KFm/H+jRzY1HeVMYD8bAeF5Pp1O/
         yHhw3p0fpOiufN0EQlI29cNZU4FgMu5dKkBYClTI5PqfMJ+8megBqoj/8dYYFzUbhpDJ
         y18Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxz1XBj6+Waz2mZRa7I7lRa3dEv5A9QHtmann2qFt3v9hkRJZy3pja9rQ7s7Xsn/JA3C9rx/M1vaZWxOw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4R3CusI3JlyVZLzOkmHA9eE6VDJRCND9qxnZOqq1lzg8XxE4e
	mRXakUrsX/l6l85q5wvkOZaMOt7fpvcjr93+93jP/LI/ljbF3sfxZDEC
X-Gm-Gg: ASbGnct4OSz6fkXAkMb1GKkkTNbpigmETBhXXoIkwMbokDlF5y4EeWrnh3aewsl5WkU
	+ZhVkM4co7flJJEEYfx85OpUZH0tJcWmhsP8Hi5GZ57iw23kPHg4VFG/9QcLeR7Ra72RYUepQ+1
	J48faA5YdVKOba0F4tcV9mMB/FLjwRP11SWUK9py8IlKWkGmMPgru93lkUDaqMgnDvLLMOw6W02
	5wg2iMQVv9KZVeLmMkVzbZR8WJNuSotqMXXWBYSdF3UN4cMx5QDDwFwHLlLvQI+Uzwzw6JIrOXh
	TAaT+B+S/AEfNQOEsZ8KUDGowZVLq5cqChW6xtIEWSpu0qWE1gfY7YHogo0zzHGId2w4LewZJrr
	eMThb1ORz+ZpSXlv4WHprf8oG0N+mb49Bb7EG/OWdvU3uhX+yKFO5SthCSyk=
X-Google-Smtp-Source: AGHT+IGHhbL2sTaZXbG6R+vveuW5hqJzjcOEX+5FNByreYpvZYKCH9St+sdc+uLFjJtfcv8RAmaZFQ==
X-Received: by 2002:a05:600c:450b:b0:456:1abd:fcfc with SMTP id 5b1f17b1804b1-45868d304cemr17334835e9.25.1753264398802;
        Wed, 23 Jul 2025 02:53:18 -0700 (PDT)
Received: from thinkpad-ThinkPad-E15-Gen-2.router ([154.105.198.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4d807sm16038167f8f.73.2025.07.23.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:53:18 -0700 (PDT)
From: Imene Jaziri <imenjazirii18@gmail.com>
X-Google-Original-From: Imene Jaziri <imenjaziri@outlook.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Imene Jaziri <imenjaziri@outlook.com>
Subject: [PATCH] Add changes to uvcvideo driver 
Date: Wed, 23 Jul 2025 10:53:14 +0100
Message-Id: <20250723095314.16975-1-imenjaziri@outlook.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a pr_info() in the uvc_probe function to trace when the uvcvideo driver is loaded. 
This is for learning purposes.

Signed-off-by: Imene Jaziri <imenjaziri@outlook.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68..4e5d1d636640 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2170,7 +2170,6 @@ static int uvc_probe(struct usb_interface *intf,
 		(const struct uvc_device_info *)id->driver_info;
 	int function;
 	int ret;
-
 	/* Allocate memory for the device and initialize it. */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL)
@@ -2188,7 +2187,7 @@ static int uvc_probe(struct usb_interface *intf,
 	dev->info = info ? info : &uvc_quirk_none;
 	dev->quirks = uvc_quirks_param == -1
 		    ? dev->info->quirks : uvc_quirks_param;
-
+	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
 	if (id->idVendor && id->idProduct)
 		uvc_dbg(dev, PROBE, "Probing known UVC device %s (%04x:%04x)\n",
 			udev->devpath, id->idVendor, id->idProduct);
-- 
2.34.1


