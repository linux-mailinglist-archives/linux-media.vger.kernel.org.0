Return-Path: <linux-media+bounces-18594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2DB986C1F
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 07:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63DBB1C21F14
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 05:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA24183CAD;
	Thu, 26 Sep 2024 05:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QvYy3Opo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D9C82488
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 05:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727329813; cv=none; b=dqJzINm/RXXk/riLp0HdUh0vXmewTDpNYi/V2k9q3OaSzltHPUKjPp2nqgY1xHF/U0SYTQWP/XhyBJS8zz8NGXj8FUZXxDokBEa/ZFGTU/kUkoqZfmfol/G/Ht6OzL+pesezROTWd2//Rs8oIQSn6efqQdB4lu+Pd4eLppUcJYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727329813; c=relaxed/simple;
	bh=5qE3HPbGnmGnq/bfKidr8OAmix2zZTfS4euuqEGtj04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GEZ1Ka31FeXQPNdXEYPJyT44MYHHus5NxlgyGFjvKlZh1O/b1oRKI3YRQXN60v0jG7cltAGIOIfPptK+9f53hS6mg/bEwsws5POFAYqbeGcPG4NHjLcQWk9DA6nsoLGTSa0bHC/IPnQlw1t1VwBjg4kjBJsNY0MmtURCCnLdlEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QvYy3Opo; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4585721f6edso3727571cf.2
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 22:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727329809; x=1727934609; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmnwbRZXt68sKfwx65b7/DqmMES69Nh+rYd0FR9ZPAk=;
        b=QvYy3OpoGqRluyPk6EwBlCZBll1QogaVdnSH88lsJD6d18TlSpbvJjdouYXrdZnbRg
         R8KC4bLFGxl3i15SFskCODZEL645cnfbWffpYmr8wbONiSzDy5RVC/qcz6Sz0+v/oJaJ
         uHYFneXQM+8R9AaQnY08vNyv4veoaVi8z6G6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727329809; x=1727934609;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmnwbRZXt68sKfwx65b7/DqmMES69Nh+rYd0FR9ZPAk=;
        b=oImx0jmi7oZ406Q1gGN1UVLAsFmFP5NfQTEyFbpJmRnIhGZNbDXSwJvJoGYt7ttH+Z
         9cyNCTVRoFzXtThnyaklCBhW2G1Vub9giDk6L4x8k+3Mx7F/q8oR32b9PVjwUG7+QI4K
         Q9PjLNVt77FHF5IG9cC996tV/Khw5ZURs2zT7Q+mmEaPkFY6zaXWSOKW0v/n0bE19eh/
         gYclEcEGH6JL2jSGZ5HJ0FloDZTXrfiPm7g9yKeSpWZbmErCuNHGHzT4fouima/7KLXa
         qsUk8nBmmyE6U81k+1HfkHGvYnTofLegcWl/jT+7SaxvlBgxFoEk7Rwc7KPdI9VFcqM9
         VK6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwTGxZ+TepdHx5sN+1kya9hkv/r8Va2Ls438s1BsgvpMOsYK3/l0K7wLCAScOwwxbGibgxWK06koV1jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6/2mE6btK4R2aavWclve9FKuHk3iqpHk5ojdizQ+aVUfs6buE
	rtlABWcKreebvmHjHZ2ts2z+82YhaKBY+ZiEwk00SgyQ0HPcG2VgWQIRRc/k9A==
X-Google-Smtp-Source: AGHT+IENl+VmG/2isMIysOo5vyR+UhZoDqUMSdlMlZmQjAqG7+OkwQvoHL7sMK4Afl4NqR1+u7AuUQ==
X-Received: by 2002:a05:622a:1896:b0:458:4bf1:1f42 with SMTP id d75a77b69052e-45b5e096c82mr80975001cf.45.1727329809165;
        Wed, 25 Sep 2024 22:50:09 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5264b629sm22406781cf.64.2024.09.25.22.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 22:50:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 0/3] uvcvideo: Attempt N to land UVC race conditions
 fixes
Date: Thu, 26 Sep 2024 05:49:56 +0000
Message-Id: <20240926-guenter-mini-v7-0-690441953d4a@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAT29GYC/33PS2rEMAwG4KsMXtdFfsez6j1KF7GtJIaJA/YkU
 IbcvaJQOoS0K/ELPj0erGHN2Nj18mAVt9zyUii4lwuLU19G5DlRZhKkAgWejyuWO1Y+55J55zs
 rAnQaB8GIhL4hD7UvcSJU1tuNmlNu96V+fq/YBJX3P6ZtggO30iUBcbDo7Vuc6jLndX5d6sg+a
 NYm//OSPFotIBkPSasTr368BiXNwSvyUYdoRaKX4MzrZ+8OXpPX3hsThe+wxxNvfr0V4uANedA
 u2AFNgi6cePvs9cFb8i64IUUVpAjH+/d9/wISMTMR8AEAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.13.0

Back in 2020 Guenter published a set of patches to fix some race
conditions in UVC:
https://lore.kernel.org/all/20200917022547.198090-5-linux@roeck-us.net/

That kind of race conditions are not only seen in UVC, but are a common
seen in almost all the kernel, so this is what it was decided back then
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

Which will make obsolete a lot off (all?) of the video_is_registered() checks in
Guenter's patches.

Besides those checks, there were some other valid races fixed in his
patches.

This patchset tries to fix the races still present in our code.

Thanks!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v7: Thanks Laurent
- Split "media: uvcvideo: Stop stream during unregister" into a separate
  patchset.
- Use guards.
- Improve naming and comments.
- Link to v6: https://lore.kernel.org/r/20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org

Changes in v6: Thanks Hans
- s/uvc_queue_streamoff/uvc_queue_release/
- Link to v5: https://lore.kernel.org/r/20240611-guenter-mini-v5-0-047b6fe5d08b@chromium.org

Changes in v5: Thanks Hans!
- Refactor unregister as vb2_video_unregister_device
- I have tested the first patch independently from the others, so it
  could be merged in two steps if needed.
- Link to v4: https://lore.kernel.org/r/20240327-guenter-mini-v4-0-49955c198eae@chromium.org

Changes in v4: Thanks Sergey and Guenter
- Fix typos
- Move location of mutex_init
- Split patch to make the suspend change explicit
- Link to v3: https://lore.kernel.org/r/20240325-guenter-mini-v3-0-c4bc61d84e03@chromium.org

Changes in v3: Thanks Hans!
- Stop streaming during uvc_unregister()
- Refactor the uvc_status code
- Link to v2: https://lore.kernel.org/r/20230309-guenter-mini-v2-0-e6410d590d43@chromium.org

Changes in v2:
- Actually send the series to the ML an not only to individuals.
- Link to v1: https://lore.kernel.org/r/20230309-guenter-mini-v1-0-627d10cf6e96@chromium.org

---
Ricardo Ribalda (3):
      media: uvcvideo: Refactor the status irq API
      media: uvcvideo: Avoid race condition during unregister
      media: uvcvideo: Exit early if there is not int_urb

 drivers/media/usb/uvc/uvc_driver.c | 13 ++-------
 drivers/media/usb/uvc/uvc_status.c | 60 +++++++++++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c   | 22 ++++----------
 drivers/media/usb/uvc/uvcvideo.h   | 10 ++++---
 4 files changed, 70 insertions(+), 35 deletions(-)
---
base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
change-id: 20230309-guenter-mini-89861b084ef1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


