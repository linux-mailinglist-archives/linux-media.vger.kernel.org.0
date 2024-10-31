Return-Path: <linux-media+bounces-20644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F59B7BF0
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 14:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9604A1C20C80
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 13:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0423C19F127;
	Thu, 31 Oct 2024 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="niyP9tPo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9662A19D89D
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730382201; cv=none; b=BpR013OY4hE6Z2tEj8BgNsXQM6qOQVqQwSbnhidmgomp5j8w7n9Oq77YaXaCfWNqn/numkPdYaeYdywMSsotJCO4QueKHaFVyJCGKcn1+crogCXML+ZrA64cxKo6LJHvn2COjIZEN2RnqRlDBmHmgytSNOt46x6xtwbLU+JqpmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730382201; c=relaxed/simple;
	bh=u3CUNqSGlQILoPq8Cq+1OeqehXRSgT59zsSa3ww3HpE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FEAEHFR61Ng6MVCZRvZVx7KSUhyN9I0ujvYNKhj0FxNs0lR0pneJwsvhTd5lcBPfhKte2OeNZiAL/GvleS4ufCUUFQuxpciKl0dSTwMTHo/GJ5HiwznMbmkt1xNJ5so+1C46jyAwua/iel+K21GE5hfe+1q2bf132wHxbgolt8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=niyP9tPo; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cbd092f7f0so6540366d6.0
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 06:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730382197; x=1730986997; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S10r38mNc1A1XVv9vYFVT6EvsR6sKBjOWRFqL8SKEXc=;
        b=niyP9tPozzcu2/2SMWDIKAfVvXm8D/Ig0u+J0zEQIQVB/wcU38q7BwX3t2ox1ucj2C
         4L9CPC+bWKt6iV0qgqeWf0TAdtqThj9Ao5u2aTK14sffMM8gVXjJXlEcX/PbtB/2zXYR
         NZ+qekOvawGSzUQVjUQ7B8DaWr7o2iOAIY6Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382197; x=1730986997;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S10r38mNc1A1XVv9vYFVT6EvsR6sKBjOWRFqL8SKEXc=;
        b=PIo30jNyL2wXXzMVUPi6xI9veG6CwbsNJAy/gvGPFJ4NrJkrn/PrTrnrMOmG18Qz6w
         ql7RzBCBT0q/YNi8cYjVe2JQeCXq/SVhkyLEsLzt6ncCxqS7UzQbP74F3fGZUdef57Z8
         WiJ/uY/wbNFHKQd9mjeepF1D9BBELX7Qc3SDN19jbjsH31cU2kR0MuvXp1zzQcv8JtnH
         0mfCmJ410/bW7SE975UvzVziyw5Ut2bYIhMnRCoAWmgcE7jJbMDme/WWvBh085NtQtAh
         UdVuernGC4ri735oAzdXPq5lwsyDIYJt97uTg7zjqovU2kf/pJauiCr9S3KO1iTGtGW1
         TA5A==
X-Forwarded-Encrypted: i=1; AJvYcCXcasRwVBQvcNXUdYuF3eYoCUus/tXnFj5g55kRPKx7egUQSFGc+RZwO7+qUDDk+Y0y0Frtck6I6llFDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycxmTkxJtpPBIyTLpBqepyA7b2kImaHsW2h3hfAisEy7acr62T
	4ckUTRaBBceZZA6L1JB2yj0jfyvI2ezBWPcUAhi+2+8ozF5Ge1SJ+a6gFx3NWA==
X-Google-Smtp-Source: AGHT+IECmc1hYl7iQdoq7SnqLdyMVDOKAjVzhUbcdsCN8poeTYFYwrB1zmuwJnLWi/yn512P/glYCg==
X-Received: by 2002:a05:6214:2d44:b0:6cc:2cda:bd5e with SMTP id 6a1803df08f44-6d345fae3c2mr80962396d6.11.1730382197500;
        Thu, 31 Oct 2024 06:43:17 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d354177d2fsm7837776d6.107.2024.10.31.06.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:43:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/7] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Date: Thu, 31 Oct 2024 13:43:13 +0000
Message-Id: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHGJI2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA2MD3dKyZN3i0qSU1DJdC8s0ExMz80QDgyRTJaCGgqLUtMwKsGHRsbW
 1AC6pDGlcAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Some notebooks have a button to disable the camera (not to be mistaken
with the mechanical cover). This is a standard GPIO linked to the
camera via the ACPI table.

4 years ago we added support for this button in UVC via the Privacy control.
This has two issues:
- If the camera has its own privacy control, it will be masked
- We need to power-up the camera to read the privacy control gpio.

We tried to fix the power-up issues implementing "granular power
saving" but it has been more complicated than anticipated....

Last year, we proposed a patchset to implement the privacy gpio as a
subdevice https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/

I think it is a pretty clean solution and makes sense to use a
subdevice for something that is a sub device of the camera :).

This is an attempt to continue with that approach.

Tested on gimble:
gimble-rev3 ~ # v4l2-ctl --all -d /dev/v4l-subdev0
Driver Info:
        Driver version   : 6.6.56
        Capabilities     : 0x00000000
Media Driver Info:
        Driver name      : uvcvideo
        Model            : HP 5M Camera: HP 5M Camera
        Serial           : 0001
        Bus info         : usb-0000:00:14.0-6
        Media version    : 6.6.56
        Hardware revision: 0x00009601 (38401)
        Driver version   : 6.6.56
Interface Info:
        ID               : 0x0300001d
        Type             : V4L Sub-Device
Entity Info:
        ID               : 0x00000013 (19)
        Name             : GPIO
        Function         : Analog Video Decoder

Camera Controls

                        privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only, volatile

gimble-rev3 ~ # media-ctl  -p
Media controller API version 6.6.56

Media device information
------------------------
driver          uvcvideo
model           HP 5M Camera: HP 5M Camera
serial          0001
bus info        usb-0000:00:14.0-6
hw revision     0x9601
driver version  6.6.56

Device topology
- entity 1: HP 5M Camera: HP 5M Camera (1 pad, 1 link)
            type Node subtype V4L flags 1
            device node name /dev/video0
        pad0: Sink
                <- "Extension 8":1 [ENABLED,IMMUTABLE]

- entity 4: HP 5M Camera: HP 5M Camera (0 pad, 0 link)
            type Node subtype V4L flags 0
            device node name /dev/video1

- entity 8: Extension 8 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
        pad0: Sink
                <- "Extension 4":1 [ENABLED,IMMUTABLE]
        pad1: Source
                -> "HP 5M Camera: HP 5M Camera":0 [ENABLED,IMMUTABLE]

- entity 11: Extension 4 (2 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
        pad0: Sink
                <- "Processing 2":1 [ENABLED,IMMUTABLE]
        pad1: Source
                -> "Extension 8":0 [ENABLED,IMMUTABLE]

- entity 14: Processing 2 (2 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
        pad0: Sink
                <- "Camera 1":0 [ENABLED,IMMUTABLE]
        pad1: Source
                -> "Extension 4":0 [ENABLED,IMMUTABLE]

- entity 17: Camera 1 (1 pad, 1 link, 0 routes)
             type V4L2 subdev subtype Sensor flags 0
        pad0: Source
                -> "Processing 2":0 [ENABLED,IMMUTABLE]

- entity 19: GPIO (0 pad, 0 link, 0 routes)
             type V4L2 subdev subtype Decoder flags 0
             device node name /dev/v4l-subdev0

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (6):
      media: uvcvideo: Factor out gpio functions to its own file
      Revert "media: uvcvideo: Allow entity-defined get_info and get_cur"
      media: uvcvideo: Create ancillary link for GPIO subdevice
      media: v4l2-core: Add new MEDIA_ENT_F_GPIO
      media: uvcvideo: Use MEDIA_ENT_F_GPIO for the GPIO entity
      media: uvcvideo: Introduce UVC_QUIRK_PRIVACY_DURING_STREAM

Yunke Cao (1):
      media: uvcvideo: reimplement privacy GPIO as a separate subdevice

 .../userspace-api/media/mediactl/media-types.rst   |   4 +
 drivers/media/usb/uvc/Makefile                     |   3 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |  40 +----
 drivers/media/usb/uvc/uvc_driver.c                 | 112 +------------
 drivers/media/usb/uvc/uvc_entity.c                 |  20 ++-
 drivers/media/usb/uvc/uvc_gpio.c                   | 178 +++++++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c                  |   4 +
 drivers/media/usb/uvc/uvcvideo.h                   |  31 ++--
 drivers/media/v4l2-core/v4l2-async.c               |   3 +-
 include/uapi/linux/media.h                         |   1 +
 10 files changed, 242 insertions(+), 154 deletions(-)
---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241030-uvc-subdev-89f4467a00b5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


