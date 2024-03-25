Return-Path: <linux-media+bounces-7765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E41288A9AC
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82ED91C6175B
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 16:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADEB1514D7;
	Mon, 25 Mar 2024 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n8aepkce"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77F6130E4F
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 14:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378228; cv=none; b=PoH9jAfIAilUgW0XBvYh7eqZKp40U+PlZgg7YL80Zh3mrAhmpUUZYG4vcE8DBfDkMwYAvjNIHqc0YNSSWIxunJ2N32YuEVi9B73TWxncL1WWyRaYERhR4Xbl2KYuBxyFa31ylJssHMQXKfsWA7g9dg5ifrtuta/qjyUsiEYj9Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378228; c=relaxed/simple;
	bh=XuosJhLq9XO2f2Iz8q5BqXyhg3JPBHZ2/G19za/IC+w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V01HNbU1T1L+euS15sBxXzb0gZjR8c0KzhlDbw9P+GtEcw3MGZRG7X1DlrgE8iZn7xAUWWBYd3W3txXwIYUwz553eYWSRW7YPykzgB3MAzbZpnsbi5xKwG4Frj3T3oE9ZUyr64S4LVcCeL9crlkiY9AyvFhFrM1ObYzkNXfMtsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n8aepkce; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-430dbcfc2afso32626451cf.0
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711378224; x=1711983024; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pH1jT5inC85eoeQR+KEh1jf0eALiBVZ6LM3AeT5cMWA=;
        b=n8aepkceqW67KYGgLdRVr+PxaaD0O7n9RblWiOcUrXfnoYijyxVJSU8tNVXyJiVXfD
         AFEenoGs9fa1Kte9Cbtutcel/3lJe4+Ky65yEBze4iC1yFyOX9x+dZ1EJN2+Soh4l5L2
         4HVS7seYGrOOjrecpRxKTCHMLzKYKFJNI4N9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378224; x=1711983024;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pH1jT5inC85eoeQR+KEh1jf0eALiBVZ6LM3AeT5cMWA=;
        b=APX0OAoZueikBBVdfGjyHMkrjTk3ywUfpAEiMAJlKwlRUPNeOQX0WWkQHPB5iAOpe7
         db7Nb6jIDWQQMDnNUsSM0tNGspzdA2mgblSBXCDdHg5PTvJOV7KhpDFv7RaVLFhcYayi
         g7FvEzQqyhTt+UbHYIDhCvooPGaTCngk8utniwfMgVG8XBd/qNzdg2WMeoA+kaQflSnl
         u7ZhNl0BhW/CXELVtqaGfZREBXw/h0TACCC5g1pyuflSRwPO9Kb434oO9nM91KLu6z1L
         8/TOvMvJlP3InbT8QPgqH/OdgMB/IF3FCMvesZdfV5ULRHwXs8+SaACwuIVYwRhfCIo+
         mgFQ==
X-Gm-Message-State: AOJu0YwKaNeX6lJVadaRCmfhozKnTKJI6GTJAtC6cBWzvjRABAPb9sS9
	a4DUgiNVyPpD5ioMX6mwT4XtWD/eWYifLWuFGu1cLfIFNIAmJEXExjEDv2/Iew==
X-Google-Smtp-Source: AGHT+IFeN0Nzu5ziAfC1KxHAnbV156Nv0MLZtP9x2YPsCIAtNRoL4Uk2YVOl+IK8Y4idRu/fWLa7ew==
X-Received: by 2002:a05:622a:11cc:b0:431:59e9:4a5a with SMTP id n12-20020a05622a11cc00b0043159e94a5amr2582881qtk.68.1711378224682;
        Mon, 25 Mar 2024 07:50:24 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id eq17-20020a05622a5e1100b004313f54aaa9sm2491449qtb.5.2024.03.25.07.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:50:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/3] media: Fix gcc warnings
Date: Mon, 25 Mar 2024 14:50:22 +0000
Message-Id: <20240325-gcc-arm-warnings-v3-0-81b8c10dc18a@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAC6PAWYC/33NTQ7CIBCG4asY1mLoAPFn5T2MCzpSOouCGRQ1T
 e8u7coY4/L9knlmFNkz+SwOq1GwL5QpxRp6vRLYuxi8pEttAQqM0qBlQJSOB/lwHCmGLL3BxgC
 21qES9ezKvqPnQp7OtXvKt8Sv5UNp5vUPVhqppGqNRbTQ6b0/Ys9poPuwSRzE7BX4NOwPA6pht
 hY0dhZ36L6MaZrePUlX8vcAAAA=
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

drivers/staging/media/tegra-video/tegra20.c: In function ‘tegra20_vip_start_streaming’:
    drivers/staging/media/tegra-video/tegra20.c:624:72: warning: ‘yuv_input_format’ may be used uninitialized [-Wmaybe-uninitialized]
      624 |                          VI_INPUT_VIP_INPUT_ENABLE | main_input_format | yuv_input_format);
    drivers/staging/media/tegra-video/tegra20.c:617:22: note: ‘yuv_input_format’ was declared here
      617 |         unsigned int yuv_input_format;
          |                      ^~~~~~~~~~~~~~~~
    drivers/media/radio/radio-shark2.c: In function ‘usb_shark_probe’:
    drivers/media/radio/radio-shark2.c:191:17: warning: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 32 [-Wformat-truncation=]
      191 |                 .name           = "%s:blue:",
          |                 ^
    In function ‘shark_register_leds’,
        inlined from ‘usb_shark_probe’ at drivers/media/radio/radio-shark2.c:306:11:
    drivers/media/radio/radio-shark2.c:212:17: note: ‘snprintf’ output between 7 and 42 bytes into a destination of size 32
      212 |                 snprintf(shark->led_names[i], sizeof(shark->led_names[0]),
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      213 |                          shark->leds[i].name, shark->v4l2_dev.name);
          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    drivers/media/radio/radio-shark2.c: In function ‘usb_shark_probe’:
    drivers/media/radio/radio-shark2.c:197:17: warning: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 32 [-Wformat-truncation=]
      197 |                 .name           = "%s:red:",
          |                 ^
    In function ‘shark_register_leds’,
        inlined from ‘usb_shark_probe’ at drivers/media/radio/radio-shark2.c:306:11:
    drivers/media/radio/radio-shark2.c:212:17: note: ‘snprintf’ output between 6 and 41 bytes into a destination of size 32
      212 |                 snprintf(shark->led_names[i], sizeof(shark->led_names[0]),
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      213 |                          shark->leds[i].name, shark->v4l2_dev.name);
          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      AR      drivers/staging/media/tegra-video/built-in.a
      AR      drivers/staging/media/built-in.a
    In file included from ./include/asm-generic/preempt.h:5,
                     from ./arch/arm/include/generated/asm/preempt.h:1,
                     from ./include/linux/preempt.h:79,
                     from ./include/linux/spinlock.h:56,
                     from ./include/linux/mmzone.h:8,
                     from ./include/linux/gfp.h:7,
                     from ./include/linux/umh.h:4,
                     from ./include/linux/kmod.h:9,
                     from ./include/linux/module.h:17,
                     from drivers/media/dvb-core/dvbdev.c:15:
    In function ‘check_object_size’,
        inlined from ‘check_copy_size’ at ./include/linux/thread_info.h:251:2,
        inlined from ‘copy_from_user’ at ./include/linux/uaccess.h:182:6,
        inlined from ‘dvb_usercopy’ at drivers/media/dvb-core/dvbdev.c:987:7:
    ./include/linux/thread_info.h:215:17: warning: ‘sbuf’ may be used uninitialized [-Wmaybe-uninitialized]
      215 |                 __check_object_size(ptr, n, to_user);
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ./include/linux/thread_info.h: In function ‘dvb_usercopy’:
    ./include/linux/thread_info.h:208:13: note: by argument 1 of type ‘const void *’ to ‘__check_object_size’ declared here
      208 | extern void __check_object_size(const void *ptr, unsigned long n,
          |             ^~~~~~~~~~~~~~~~~~~
    drivers/media/dvb-core/dvbdev.c:959:17: note: ‘sbuf’ declared here
      959 |         char    sbuf[128];
          |                 ^~~~
      AR      drivers/media/radio/built-in.a

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3: Thanks Luca
- Fix error while rebasing the change from Thierry. (sorry :S)
- Link to v2: https://lore.kernel.org/r/20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org

Changes in v2: Thanks Thierry
- Make tegra20_vi_get_output_formats() and tegra20_vi_get_inut_formats,
  consistent.
- Link to v1: https://lore.kernel.org/r/20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org

---
Ricardo Ribalda (3):
      staging: media: tegra-video: Fix -Wmaybe-unitialized warn in gcc
      media: radio-shark2: Avoid led_names truncations
      media: dvbdev: Initialize sbuf

 drivers/media/dvb-core/dvbdev.c             | 2 +-
 drivers/media/radio/radio-shark2.c          | 2 +-
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
change-id: 20240323-gcc-arm-warnings-e4c142cb5ac0

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


