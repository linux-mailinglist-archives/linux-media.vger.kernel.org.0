Return-Path: <linux-media+bounces-47400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D85B5C70DC4
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7CDFF4E3AA8
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770BD371DC4;
	Wed, 19 Nov 2025 19:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nxeowbLf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91DE27CCF2
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581037; cv=none; b=MM0BCdKvdZjC3BcPlyPXfLKvPw8EtN07owANIKeWCpk/B9Gp+R1y4CnKH1VF46vCWsiASSt8Wq1T239omHlMfZu4ll0BVfBeR6A5/zJfxsulvjDfcAKwmjJ+XHCjTk3rsK3DUF8hiAEHNHCrHQar31ez5CXYuW7FunDBdu/Ax9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581037; c=relaxed/simple;
	bh=lbXjJbO0uwFmG+NsSnDB6lEQZzznbgKBQhL/o6GtWpc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=onCvFwHL/ba2QzwlAJkJi1MzXS3YezbPWcHKHxF7O+JeHcGtYMHiyuXBYf/Tq2LtdSsxfa0wjKal32udN/ThRi09B0HcZuy+Ahd3q9LwjfWRCLPAapRccen4Un+qAJpoDUevDqoqMqmtb7o9OXpLkX73u0Vm0dgyKQRr1xxSTxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nxeowbLf; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5943d20f352so46842e87.0
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 11:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763581032; x=1764185832; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVcrPY5lB8g6Yq3/nbhcAcjAFdjQxMWHkVEFIRUZNpk=;
        b=nxeowbLfI9YessB7uI0+7F7rv+0A/w7OTdRM8BEHf+q4HemXWd29tzYPJvgRjcA0Jb
         71SjfdQQr4KZGKBImQhD7SD00oW8qkj3dd3Mhr5CO1syJGpOY9kX+A1iWG7aYT7mgyEV
         QVeYp7Bi4o15wNhSUewK2/RXAILUzKLoNNvnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581032; x=1764185832;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVcrPY5lB8g6Yq3/nbhcAcjAFdjQxMWHkVEFIRUZNpk=;
        b=awVwjul/qha31RGxQJeroTRtw03UJVGXem+Po0SlyLspTLlj8qCtPNvclBNcZKiLyx
         +W50mNfelYNABLplVt1xqdmrJkW8TrSlXB+yZ+AHZ3GzEUSdDp8lixIRS+DN3mLiN95H
         efbQj9ckz2f0/PUfKf+RVuc2y7Tta+nBIXjsLEjOit84DqXpfmhYNjNviAFS02NENe63
         VsLtC3jBkAeMWcaRYIIg8lnEpESaCdStuIlZTzi6LPGEB3ecO+WkhsFYotaNVsYsxxU7
         /ZlktgrtQZ0V9vpK3NeFgyhhYG3NjK/bafMeZFRdCbupk8l34NcysmkdeulfHB0c6DKI
         3+TA==
X-Gm-Message-State: AOJu0YwjW7KZhyfYDuctWJ/49e2JKLGSh1J33a6jYbY0+Uo8Y0H81IVa
	OHnqFcgdLdZP4IgbOn2jGtR54qCP4Myq0KrHBDWtg0RIV+HOC8JGUDQROxTUzLALig==
X-Gm-Gg: ASbGncs4aopM+oQNvRAL6UjjA6VTBAj6CxDhSGnbAyv7uMRL4rjjJRPi+KskfizohM0
	DQoNjLbChBpT/JGRtStEnsSHPhFcvfOK7O2hrPfwrjWdMH77AIzeHCOwofMpUZsCJreDevt0pD/
	Zmt9cSs3DP2QilhqoyDgkPc2cd+sLpv0ZIH+MTevSzGjD4jV8bF6+CWJtVqVETJ6gShRq1ijJQR
	rvKfIlX6XxLJnZVdbSBYCQ5SLx+X+8b4tFfdvRuQJ8rUPYnQBg2FwUCxL2hQC23+54H2dhU9AGi
	lspCTqUacF61Fc37aee5uNVAszR6nWIJuZE+n6iDD+POCGhpYNH0PwXVIFRMSG47dfRIlO7hxsh
	2l2GQdUr5bNCFvh+XZFTmgujzOnJGu9shQV8Hj2GospFxMNoULYy/+axbmglEPBLkAHtFBL0NcO
	ljNpZQ5twBQSv/pmv/jF7MvpzDH3u7PqLFsrNMIt++kQHNMpNvMbFjo1yaZdAsRbHga+HvFKu0E
	har5l1lOO4=
X-Google-Smtp-Source: AGHT+IE6fWXRDxmuimRIZXGfgyPy1g1a/RxvR7Jv24xHtWIzgc+Y0FKSwI6JSExKOqG/k0LVvYByiw==
X-Received: by 2002:a05:6512:b8d:b0:594:2ff7:9d29 with SMTP id 2adb3069b0e04-5969e2da506mr22335e87.13.1763581032514;
        Wed, 19 Nov 2025 11:37:12 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd15a1sm65790e87.98.2025.11.19.11.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:37:11 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: uvcvideo: Map known XU controls
Date: Wed, 19 Nov 2025 19:37:09 +0000
Message-Id: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGYcHmkC/23MQQ6DIBCF4auYWZcGbA2mq97DuBAYdJIqzaCkx
 nD3Utdd/i953wERmTDCozqAMVGksJSoLxXYaVhGFORKQy3rRimlxZas2xe78kto00rfGG/MXUE
 5vBk9fU6s60tPFNfA+2kn9Vv/MkkJKQZ0WuLg/M21TztxmGmbr4FH6HPOX3rZ1WCnAAAA
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
Changes in v2:
- Document how to get GUIDs
- Show clear deprecation intentions to the user.
- Add new patch for the Kconfig approach (Thanks Mauro).
- Remove duplicated control in commit message, provide background and
  add documentation. (Thanks Laurent)
- Block also uvc_query_ctrl for privacy controls (Thanks Gergo Koteles)
- Link to v1: https://lore.kernel.org/r/20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org

---
Ricardo Ribalda (6):
      media: uvcvideo: Remove nodrop parameter
      media: uvcvideo: Import standard controls from uvcdynctrl
      media: uvcvideo: Announce deprecation intentions for UVCIOC_CTRL_MAP
      media: uvcvideo: Document how to format GUIDs
      media: uvcvideo: Introduce allow_privacy_override param
      media: uvcvideo: RFC: Convert allow_privacy_override into Kconfig

 .../userspace-api/media/drivers/uvcvideo.rst       |   2 +
 drivers/media/usb/uvc/Kconfig                      |  11 ++
 drivers/media/usb/uvc/uvc_ctrl.c                   | 212 +++++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c                 |  19 --
 drivers/media/usb/uvc/uvc_queue.c                  |  25 ---
 drivers/media/usb/uvc/uvc_v4l2.c                   |  11 ++
 drivers/media/usb/uvc/uvcvideo.h                   |   2 +-
 include/linux/usb/uvc.h                            |  18 ++
 8 files changed, 255 insertions(+), 45 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251117-uvcdynctrl-7b80f5bfbb41

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


