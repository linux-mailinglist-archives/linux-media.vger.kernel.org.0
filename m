Return-Path: <linux-media+bounces-21196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F849C2676
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 21:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B204A282C1E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 20:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5099A1C1F15;
	Fri,  8 Nov 2024 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C90Q7ca9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0561F233D95
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 20:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097551; cv=none; b=h/4BksSg+dL7zrXSxkNGfegxqqB8JqRjhpq+AqOZlRr2/YejlnQgwf31YPPdmPtijsyYD7fwuHhGBg6l1DvJMAglcmVG4AmdT3/d9mwKN4YDmXHsmme4Q6qx8q6anHGr/1arjHnlwDfYXTReTGwV/H1ig3Ie5YOsnm9jSpMPJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097551; c=relaxed/simple;
	bh=SPYUj08KZZs00BmP0A4n0oggWI2chMN6PBHObp6ler0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NPwUKNqLLftI80MtX3pP7H0BBweflPfmzqIXbpWwAVLIWntAbqkZ1S62klgcqGinJdQJ29lseqHk8B4wto41Hhk9QHGUMLjUEHgdWj4/JgRYBVT4c/b4X7UTwxvtFK3IrhjumdSa/mOh2vITV07AsTDYYXN2OhboxCU0wwv9KsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C90Q7ca9; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5ebc0dbc566so1280376eaf.3
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 12:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731097549; x=1731702349; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/TFb6IeVsDCpfqd0CiP+Pk+T22ECRcURc9Q3A791vo=;
        b=C90Q7ca9/+mGMobhwkP8kvInAb16S3oLHLjPj2n28ttu/cD2L1SZtHKsyBC9pxdr7I
         IWP3pQfB0H2QZ8gHTjcAVzBD58Xooj+2aeyKcF6QCTG99yPDVDLNK8wdLzk1QDSZdju9
         NqjndPdUhXvqWh+cG1YsFsAXGEEWroCBrEzkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731097549; x=1731702349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/TFb6IeVsDCpfqd0CiP+Pk+T22ECRcURc9Q3A791vo=;
        b=slejcP5y6cXHX3SvMB2JY+VlngOsn0+NkX23Oj8lIr3cTIqc0Nf0NDtTgoMPbnc8jy
         it+AkSyZIeswJGWK3EaJB121WqkWKPKQVLIClPSeu5mGnrc5ma+R9fWYDH5eyo2UY3HB
         MFdDbQ7lD6WuYPvhqfKvY7p+D9qJPcv0T6MF4mOTIzo4uxAClqKcxUmaASNhBx8rUuRY
         EWqB+hSz41lj8O2wVLuyqXbb+iG5/RkCi/7e2j3sE6ES9+U4HoX0+215pWDLSLJy1GKi
         Nfh5Az5JJBUupH11C4ZojLGuLdazPLApsO4RwcZkoXfU8kKcCqUcXslkN/WATqSjvswF
         0aCA==
X-Forwarded-Encrypted: i=1; AJvYcCVPSRio+48nQOBEueXHvVDDN5POTh+/YrPu5nTPvag6BfxsTGUlonRZvmhbsK8dHVg96LkDv5TBN0hMdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym6UbkXbY0CWVzxO+vk0/iu1ceDtKbMUTJi2bte63kf17ezORH
	uHR5RP3l/+yzb5+EOXIMpRA67sZAnhQ10xwkpNyq/iuQUvIlQPi7h/sX8uhzMQ==
X-Google-Smtp-Source: AGHT+IEnsHyMovnAPvn+fqdnsE5MgQGU7Ffj4/xcbET17i/QQMnfwL795MIoqo7MNYztzxd1+xCJLw==
X-Received: by 2002:a05:6358:848b:b0:1b8:211a:e7b3 with SMTP id e5c5f4694b2df-1c641e75181mr354972255d.5.1731097549066;
        Fri, 08 Nov 2024 12:25:49 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff46d440sm24207341cf.52.2024.11.08.12.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:25:48 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Date: Fri, 08 Nov 2024 20:25:44 +0000
Message-Id: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhzLmcC/03MQQ6CMBCF4auQWVszLQjoynsYFqUd6CygpJVGQ
 7i7lcTE5f+S920QKTBFuBUbBEoc2c851KkA4/Q8kmCbGxSqSmKJYk1GxLW3lER7HaqqbjRif4F
 8WAIN/DqwR5fbcXz68D7sJL/rj5H/TJICha7bspSGrG3U3bjgJ16nsw8jdPu+fwCKQfCVpwAAA
 A==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
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
        Function         : Unknown sub-device (00020006)

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
Changes in v2:
- Rebase on top of https://patchwork.linuxtv.org/project/linux-media/patch/20241106-uvc-crashrmmod-v6-1-fbf9781c6e83@chromium.org/
- Create uvc_gpio_cleanup and uvc_gpio_deinit
- Refactor quirk: do not disable irq
- Change define number for MEDIA_ENT_F_GPIO
- Link to v1: https://lore.kernel.org/r/20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org

---
Ricardo Ribalda (5):
      media: uvcvideo: Factor out gpio functions to its own file
      Revert "media: uvcvideo: Allow entity-defined get_info and get_cur"
      media: uvcvideo: Create ancillary link for GPIO subdevice
      media: v4l2-core: Add new MEDIA_ENT_F_GPIO
      media: uvcvideo: Use MEDIA_ENT_F_GPIO for the GPIO entity

Yunke Cao (1):
      media: uvcvideo: Re-implement privacy GPIO as a separate subdevice

 .../userspace-api/media/mediactl/media-types.rst   |   4 +
 drivers/media/usb/uvc/Makefile                     |   3 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |  40 +----
 drivers/media/usb/uvc/uvc_driver.c                 | 123 +-------------
 drivers/media/usb/uvc/uvc_entity.c                 |  20 ++-
 drivers/media/usb/uvc/uvc_gpio.c                   | 187 +++++++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c                  |   4 +
 drivers/media/usb/uvc/uvcvideo.h                   |  34 ++--
 drivers/media/v4l2-core/v4l2-async.c               |   3 +-
 include/uapi/linux/media.h                         |   1 +
 10 files changed, 252 insertions(+), 167 deletions(-)
---
base-commit: 4353256f5487e0c5c47e8ff764bf4f9e679fb525
change-id: 20241030-uvc-subdev-89f4467a00b5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


