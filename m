Return-Path: <linux-media+bounces-47227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B36C6613F
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 21:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EF0E535FEAC
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 20:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D738833439B;
	Mon, 17 Nov 2025 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e/TSjmmm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482AE332EAB
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763410461; cv=none; b=rdug15NxTD7Q4c+lhPMkCjm3jrZ65Xkuwb32n3Y+cizYMx+xFURUj9ChkU0+vssnCeQctY0TTfqP1evCEr6HSKWoNE4VdpUwtMxyh7n/1+SG/Dpcf6cnhn5G8POPT/iTEBeEmLZdlf8ob3zuUe73UdYNt+mhe6gydDLwQqbeSV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763410461; c=relaxed/simple;
	bh=yAEG85GYrN3ElOkyTjNy3tCOE6XKbdGKYBvZg/pwYHA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mFDFQ5xw1ZCCYGHaf7e2nFhzWf9D5Z6AUpsUdMQrp1vb+rKAU64/9LY5FunHcbvjK/24Ci+wl7YPcCNwP95R+Seo1Ee/xhjnb1MNxcCwWoR7xTLkWQEBvj0q7wm0RRzt6ZbPa0WbJ8VCnc7QgkAWLqg7iv8x5+AsYsK1HCjvYA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e/TSjmmm; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5942e61f001so4743989e87.1
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763410457; x=1764015257; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgHXo4GJGpAcaLA4PTb3BZ5lDtzW4GBjMfZZU48RY5w=;
        b=e/TSjmmmZSLVN36oQ07xL+atzBJRGfOi8Bu/NK33RQ1oe5uY/48Ze9m5kCl7U30UlI
         tNsF9Suj3FDgGwEWZjZqAdV+1gXSySojulEqiQW7r1VdwsWI2jyQGTo1v6QonBCFskYW
         XiFSUuK1ozp1GcjJnVkPG7fnLaepkGOFzoQZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763410457; x=1764015257;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgHXo4GJGpAcaLA4PTb3BZ5lDtzW4GBjMfZZU48RY5w=;
        b=YOV0InpmL2NgsAhJpljphBpIOHT476p1glAo298cRkLGfWl26hgapwslkxsong01oa
         3BCmkjIHUnvLYaMIsfVq+khjNZS3pbIO1gMaJ/frJno2kAZk9ZN1AwOtuagyJ9HCpP05
         7la/7j1o/V6uyqc1yddNmeWhP23Py7h92nADmDSEdjwkvu1mNALhf+07aINQ8DqqA3Ew
         FzNDn/Cwy60tgQ3u6GiZD+EdjhQBrYBF1ocvA99emqKlYQmoGG2vlJKVuWnGRZMsooZt
         ufHmynOMRlKi1kI90AQbU1QEgomfZRvgf0+6ySWtABIgJO/Owl7NvIHDkPWczyBgmbrc
         r3pQ==
X-Gm-Message-State: AOJu0YyTRizJousv0O9D9Z0BYnALa9ug8sEa9NhjSICDSUaGlVstzteQ
	dbZhAZm2PZhyE4mLJrC4mc3lfh7SR3NQRqCufhhuCq6pVdt0EnPfrFcgYx/vgm/pvw==
X-Gm-Gg: ASbGnctbIsOO3h1l39OCtwpfWH7R28jA+tYAUrnnskBskvxP3q0rOgg0sQLDrQHKfyk
	bQLJ/dUXkICfnF2bpUHfJkNU3IdF1PFfFxiygpWoDqesEo2n6YOMisf+AwAfRn9tP5cnXP+Pnrd
	K+sJIJIR6NXL0CA+MupMhyOXJPbar4DrJqdCKlFG7OCzK46WVRloUzCH4fsGNNoJLXKZvXiswyn
	mgpSKQyq9nV3x30G/wpv8FtfHcTRASqhS2CQ+Rvox4DGTXDY6QpmM+g9DFao9neHyXMcCVaPci4
	bZNgKeOC3P9wNS+QskG7zmlR3LpQPkcD/aTmYj1HJ0UaSvfaozNcwa5JK/+iB+PT28I2fb9aBHf
	czroU9hmfCvAJEq83x9rA4U5Hw0vEuY8krK1woT4H+vteWN7OkNmzu4OhNM2bNrCyJ3nL7narR6
	fztcCbnXgr0BKfqNksAEnPCR9pYTmCIvvtm8mADDKh2c78l+EJyjIhQfVSbpUwh63vvsq5pVKh
X-Google-Smtp-Source: AGHT+IFc43tykLdR7iGrO4WldYv3LdTnARilIJdABWioVTl/8nUjj1uXHiVVOMgIMBPJ5aNeGwOKtg==
X-Received: by 2002:a05:6512:b9a:b0:595:8200:9f79 with SMTP id 2adb3069b0e04-595842134a8mr4845108e87.43.1763410457359;
        Mon, 17 Nov 2025 12:14:17 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003a4sm3413302e87.59.2025.11.17.12.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 12:14:16 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/4] media: uvcvideo: Map known XU controls
Date: Mon, 17 Nov 2025 20:14:15 +0000
Message-Id: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABeCG2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0Nz3dKy5JTKvOSSohxd8yQLgzTTpLSkJBNDJaCGgqLUtMwKsGHRsbW
 1AGA9BM1cAAAA
X-Change-ID: 20251117-uvcdynctrl-7b80f5bfbb41
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Manav Gautama <bandwidthcrunch@gmail.com>, 
 Martin Rubli <martin_rubli@logitech.com>
X-Mailer: b4 0.14.2

The UVC driver uses a custom ioctl `UVCIOC_CTRL_MAP` to map XU controls
into v4l2 controls. The most well know user of this feature is the
uvcdynctrl app.

This app has a set of XML files which contains the list of mappings.
Some of these mappings are standard and other ones are custom.

This series move the standard mappings to the kernel driver, so
userspace do not need to depend on external apps to use them.

While we are at it we realized that some of the mappings can be harmful
for the privacy of the user. This series introduce a mechanism to block
those mappings.

While we are at it, we complete the deprecation of the nodrop parameter.
Ideally, this patch should belong in a different series, but then we
will have conflicts... and who wants to works twice?

I have tried this series with a Logitech Webcam Pro 9000, that has been
donated by Hans de Goede (Thanks Hans!!!).

Without this patch and uvcdynctrl the device has 14 controls. (Ctrls A)

With this patch the device has 15 controls (Ctrls B):
Ctrls A
+
control 0x009a090a `Focus, Absolute' min 0 max 255 step 0 default 0 current 0

With uvcdynctrl and this patch the device has 17 controls (Ctrls C):
Ctrls B
+
control 0x0a046d71 `Disable video processing' min 0 max 1 step 1 default 0 current 0
control 0x0a046d72 `Raw bits per pixel' min 0 max 1 step 1 default 0 current 0

With uvcdynctrl and without this patch the device has 19 controls:
Ctrls C
+
control 0x0a046d05 `LED1 Mode' min 0 max 3 step 1 default 3 current 3
  0: Off
  1: On
  2: Blinking
  3: Auto (*)
control 0x0a046d06 `LED1 Frequency' min 0 max 255 step 1 default 0 current 0

BTW, Driver tested with virtme-ng. First time that I use it for uvc
development, and it works like a charm :).
virtme-run --kimg arch/x86/boot/bzImage --mods auto --show-command \
	--show-boot-console --verbose --qemu-opts -usb -device qemu-xhci \
	-device usb-host,hostbus=1,hostport=4

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (4):
      media: uvcvideo: Remove nodrop parameter
      media: uvcvideo: Import standard controls from uvcdynctrl
      media: uvcvideo: Announce deprecation intentions for UVCIOC_CTRL_MAP
      media: uvcvideo: Introduce allow_privacy_override

 .../userspace-api/media/drivers/uvcvideo.rst       |   2 +
 drivers/media/usb/uvc/uvc_ctrl.c                   | 161 +++++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c                 |  24 +--
 drivers/media/usb/uvc/uvc_queue.c                  |  25 ----
 drivers/media/usb/uvc/uvc_v4l2.c                   |  36 +++++
 drivers/media/usb/uvc/uvcvideo.h                   |   2 +-
 include/linux/usb/uvc.h                            |  10 ++
 7 files changed, 215 insertions(+), 45 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251117-uvcdynctrl-7b80f5bfbb41

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


