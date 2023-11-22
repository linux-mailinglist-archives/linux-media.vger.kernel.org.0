Return-Path: <linux-media+bounces-789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 511C77F4514
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 12:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C213B21185
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F356C13C;
	Wed, 22 Nov 2023 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qx/CRIhs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BC61A4
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:45:51 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-41eae4ebf61so39281551cf.2
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700653550; x=1701258350; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n31djRAaV6tjpTqEszH4BC9BC0zt3h2aG6InVmgkwt4=;
        b=Qx/CRIhsarK6zkmlADP3tyfJ0R5aEUfiGZGpmEm9Ehx1zblg11WbKUJTXy3RLdY9p4
         8tznEU27t123wWfUcbLAA2E0GKtJ6ofQBpMmefY8kbM2ZO2lART+Xw7jWyrdfXD6S3Lt
         V/CTSZjxWy7vpL5aIJk3k1jH8978M0Qr+bUQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700653550; x=1701258350;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n31djRAaV6tjpTqEszH4BC9BC0zt3h2aG6InVmgkwt4=;
        b=KWIs7paMuF7IFAR5F+wzoJBKAItTTKx2LhzMAS+Rtkse8aei251Wc0kEwdIcY/TROj
         g5GWy9cgfcXkCej4j+JfqVnLUKSkpt0XESwDuvR8LuNM3ryph16f8uTlXwml/gJRkHUf
         S31wc2DSk+VZeYQbjjg/QY6SJBexr1MjGKUr6/7lPsS8Rf+O4mOOLVuQYuZmaqH+GM/q
         O+YQojLXZHKaEyusnV+mMUncgI+dUJDxBSHj/ivJM6vbtAn1VoOBxtyiiMn08Ki6z8rj
         bOC2Sq2t7S+qCmHD513ceBuOB/jfdlnlSrYUVon+HdoyOfoa23MkxpWcbHRDUQpvA1f1
         FBxQ==
X-Gm-Message-State: AOJu0YwCu/+euvoOu3YpprLcQahV5MAdeL1xLWhTwJibRNRQyDtDkXUQ
	wuVBs1yzwILilLAzUMgrchr5BDjAXOoqRqyVUwsUXw==
X-Google-Smtp-Source: AGHT+IECXo/tZBfuqmymuR+Gnbmc+u2ZF16Q3ecI8p7H9p4A8nZdlPDcQYeQZwN/Bs32QZHsq5DRsg==
X-Received: by 2002:ac8:4e51:0:b0:41e:1b18:f4a2 with SMTP id e17-20020ac84e51000000b0041e1b18f4a2mr2331132qtw.36.1700653550098;
        Wed, 22 Nov 2023 03:45:50 -0800 (PST)
Received: from denia.c.googlers.com (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
        by smtp.gmail.com with ESMTPSA id h3-20020ac85143000000b00419732075b4sm4357790qtn.84.2023.11.22.03.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:45:49 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 0/3] uvcvideo: Attempt N to land UVC race conditions
 fixes
Date: Wed, 22 Nov 2023 11:45:46 +0000
Message-Id: <20231122-guenter-mini-v5-0-15d8cd8ed74f@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvpXWUC/33NwQrCMAwG4FcZPVtp2q6unnwP8dC1cSu4Dlo3E
 Nm7GzyIjOkp/AnfnycrmCMWdqyeLOMcSxwThXpXMd+71CGPgTKTQiqhhOXdhOmOmQ8xRd7YxkA
 rGo1XYERaV5C32SXfE0rT7UbLPpb7mB/vFzPQOP9om4ELbuQhgPBXg9acfJ/HIU7Dfswdu1DXL
 P95SR6NBhFqK4JWG159PICElVfkQ+NqdEh32W54/e3lymvyKliNgEoHDyu/LMsLPvAj8XABAAA
 =
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
Changes in v5:
- Some code from 2/3 ended in 3/3... Sorry about that.
- Link to v4: https://lore.kernel.org/r/20231122-guenter-mini-v4-0-3d94e1e34dc1@chromium.org

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


