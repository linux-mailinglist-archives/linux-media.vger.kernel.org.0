Return-Path: <linux-media+bounces-773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D7E7F438C
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75BC61C20ACC
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB3151C20;
	Wed, 22 Nov 2023 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jq+rojvi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6025618C
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:19:46 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7789577b53fso420312785a.3
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700648385; x=1701253185; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tVFvadoxSzf5SYQeJTY3QitzXTVI0S9cDNwIlxh29lY=;
        b=Jq+rojviM/AIfUjgTh5hQAUMnXPJxoq4U8F5h8j2S9+8nn2ubpWbRaM+KheJLVl0tH
         FVd7+/SugWj500/v1bFsdRh2goRd2sKnvR6pEVpcup/bLNC7KLT40OuVZ6wqqRsL58LD
         J9Ih06xisAtHcM5kAAhEY1AHzBpzPeP0PqBxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700648385; x=1701253185;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVFvadoxSzf5SYQeJTY3QitzXTVI0S9cDNwIlxh29lY=;
        b=A3Cd9lhzAMahhCnNg9Rs6W9bRQG/4idgxY3dRRcBieySiH0R0cnEZpLoSwsKiQZl+A
         xTk71gOChhG/XtMMklMbusM79LFyfJ5XpPw1oGnJ4JfUGInVxidZ3+Do407wK8wAPIVT
         KGt/yc2iIjRSwEG4/FJHm47OGbvOZz4pvPOMwhPUNC1QvN+qTizS8kqiHZGWmWl+Oq4v
         I+KWBOeWbUS/gasr8Drw98M9pI9R/O2wJotpfXhWZJnnJY09NzQELRd+VFiX+eZRL96i
         3NR9X3OIKAqXnfrdxSOl1X4WVCpuncihAp1oelNEX/GhKq2AJ4LPNJuIPATJ4vtqsima
         hZFw==
X-Gm-Message-State: AOJu0YyLWvlGRZsYnrzkRoCRDZjeeI/p5/qwUk+lgPa1pJmL6Lbi8GHe
	7wvtjBevRjovdzJVvbxvDD1smA==
X-Google-Smtp-Source: AGHT+IFK25yqYBsb8Rnd58NSQl61BGOexDH0O6LKARDslBijt86Yp+E6Ptm0ac9NlgtmXONUDZS3SQ==
X-Received: by 2002:a0c:f40b:0:b0:679:d238:8ca6 with SMTP id h11-20020a0cf40b000000b00679d2388ca6mr1576891qvl.65.1700648385476;
        Wed, 22 Nov 2023 02:19:45 -0800 (PST)
Received: from denia.c.googlers.com (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
        by smtp.gmail.com with ESMTPSA id di6-20020ad458e6000000b0066d1d2242desm4739352qvb.120.2023.11.22.02.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:19:45 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/3] uvcvideo: Attempt N to land UVC race conditions
 fixes
Date: Wed, 22 Nov 2023 10:19:33 +0000
Message-Id: <20231122-guenter-mini-v4-0-3d94e1e34dc1@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXVXWUC/33NwQqDMAwG4FeRntfRtLXTnfYeY4dqoxa0QquFI
 b77wg47yLZT+BO+PxtLGD0mdi02FjH75OdAQZ8K1g429Mi9o8ykkEooUfN+xbBg5JMPnld1ZaA
 RlcYOGJHGJuRNtKEdCIV1HGk5+LTM8fl+kYHG/UdbBi64kRcHou0M1ubWDnGe/Dqd59izB3Vl+
 c9L8mg0CFfWwmn1xauPB5Bw8Iq8q2yJFukum4Pf9/0FBgd7szABAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.3

Back in 2020 Guenter published a set of patches to fix some race
conditions on UVC.
https://lore.kernel.org/all/20200917022547.198090-5-linux@roeck-us.net/

That kind of race conditions are not only seen on UVC, but are a common
sin on almost all the kernel, so this is what it was decided back then
that we should try to fix them at higher levels.

After that. A lot of video_is_registered() were added to the core:

```
ribalda@alco:~/work/linux$ git grep is_registered drivers/media/v4l2-core/
drivers/media/v4l2-core/v4l2-compat-ioctl32.c:  if (!video_is_registered(vdev))
drivers/media/v4l2-core/v4l2-dev.c:     if (video_is_registered(vdev))
drivers/media/v4l2-core/v4l2-dev.c:     if (video_is_registered(vdev))
drivers/media/v4l2-core/v4l2-dev.c:     if (video_is_registered(vdev)) {
drivers/media/v4l2-core/v4l2-dev.c:             if (video_is_registered(vdev))
drivers/media/v4l2-core/v4l2-dev.c:     if (!video_is_registered(vdev))
drivers/media/v4l2-core/v4l2-dev.c:     if (video_is_registered(vdev))
drivers/media/v4l2-core/v4l2-dev.c:     if (vdev == NULL || !video_is_registered(vdev)) {
drivers/media/v4l2-core/v4l2-dev.c:             if (video_is_registered(vdev))
drivers/media/v4l2-core/v4l2-dev.c:     if (!vdev || !video_is_registered(vdev))
drivers/media/v4l2-core/v4l2-ioctl.c:   if (!video_is_registered(vfd)) {
drivers/media/v4l2-core/v4l2-subdev.c:  if (video_is_registered(vdev)) {
```

And recently Sakari is trying to land:
https://lore.kernel.org/linux-media/20230201214535.347075-1-sakari.ailus@linux.intel.com/

Which will make obsolete a lot of (all?) of the video_is_registered() checks on
Guenter's patches.

Besides those checks, there were some other valid races fixed on his
patches.

This series is just a rebase of what I think is missing on UVC even
if we fixed v4l2/core with all the video_is_register() checks removed.

I have tested the series with lockdep and a loop of authorize/de-authorize
while steaming.

Thanks!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v4 Thanks Sergey!:
- Reorder patches
- Improve commit messages
- Do not process async work on exit.
- Link to v3: https://lore.kernel.org/r/20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org

Changes in v3:
- Introduce media: uvcvideo: Do not halt the device after disconnect
- Introduce media: uvcvideo: Always use uvc_status_stop()
- Link to v2: https://lore.kernel.org/r/20230309-guenter-mini-v2-0-e6410d590d43@chromium.org

Changes in v2:
- Actually send the series to the ML an not only to individuals.
- Link to v1: https://lore.kernel.org/r/20230309-guenter-mini-v1-0-627d10cf6e96@chromium.org

---
Guenter Roeck (1):
      media: uvcvideo: Lock video streams and queues while unregistering

Ricardo Ribalda (2):
      media: uvcvideo: Always use uvc_status_stop()
      media: uvcvideo: Do not use usb_* functions after .disconnect

 drivers/media/usb/uvc/uvc_ctrl.c   |  4 ----
 drivers/media/usb/uvc/uvc_driver.c | 13 ++++++++++-
 drivers/media/usb/uvc/uvc_status.c |  8 +++----
 drivers/media/usb/uvc/uvc_v4l2.c   |  2 +-
 drivers/media/usb/uvc/uvc_video.c  | 45 ++++++++++++++++++++++++--------------
 drivers/media/usb/uvc/uvcvideo.h   |  4 +++-
 6 files changed, 48 insertions(+), 28 deletions(-)
---
base-commit: 98b1cc82c4affc16f5598d4fa14b1858671b2263
change-id: 20230309-guenter-mini-89861b084ef1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


