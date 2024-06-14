Return-Path: <linux-media+bounces-13264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EDC908BDC
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 14:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28B0C1F24060
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 12:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59602199258;
	Fri, 14 Jun 2024 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cwjx2ORl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B174194A7F
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718368901; cv=none; b=PiOQonZJK5G1aAUYBNPPjaznC67SJnPYSyi58a75ZvOGq7ixnKkZ4Bxe1RIB4YftJ+d4s2ItdgWvAyev0XGbGWEyC9ETz9WjcmV9MCjZwZlf4UNoz+5PryCKoajVKQF5n89U9ocZfzwTf6fkWpaFOMufN10fh0nYwAXxIJtFNC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718368901; c=relaxed/simple;
	bh=5YUAy/v9vbOWgyn64F/ohClnfmw7OfyrVXzdrl7025U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t9YJpXS0wgZPG9J92JaBSyRcueSWKVEY1/ouXYRkc0u7KJyqAaiu5SKUVCw2+Qcjmy6sQc2CesbcLFkVj5yQz44EqG/JhkcW4O8VlWFOkQHCyhRZhHST64ceCV8BZE+M37EJXrpGsJBi4GjoZ5Mgc/ir3AIl6FeBkvjp9W87iiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cwjx2ORl; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6b05e504bceso15113866d6.2
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718368898; x=1718973698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KkK/kPgUL4odHiBy6guZH3ikqbdzkjrt8yaE6xDHlz0=;
        b=cwjx2ORlSyxrCeSIBhLQJeI+18ev5J6CUKQkK1iUpmh56NDrrJ4lZg2K84Q/MueNuc
         q4aoutYAddIBwIgoohqvpwwMKCol/U2HXe2++zeARZgkFq4gUWfKcCfS5tDao4G47knI
         CJMCWWDIJV5QxvQHS1MoODAxTWEEt94SMhVbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718368898; x=1718973698;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkK/kPgUL4odHiBy6guZH3ikqbdzkjrt8yaE6xDHlz0=;
        b=eHtCeZYFhVm0vMFUi/aPXJxAxOjtGiA3cYb8bW7FK9E5W9WyQ2wMZ4ZbKOC67WLvK6
         NFuPRSjW1w3VwyoCX58CdwmNJMND1I7g2dE5YYRQQ9VI8sGXq0uPCPD7mAUhrBjmwHvW
         ZG6RsNs1heDsQ/q4d2wwDnpazjR9bT5g3nYNe2Ls1/dvr1WMy8loYL9AfRX39twQprTV
         5MdjdJ0frqCz9eGKHSm68rAYGmlA7AlGkD7PDVZs8MqL6WnX0wOPLQqg8Jd7agcsZH8x
         kK2c8V586hRRU1BWvloutL0Ud7aTmwRpfT8kWX5ftzs23n8D+2ceL/aMhzFxd57Y3DkN
         FYmg==
X-Forwarded-Encrypted: i=1; AJvYcCWN96DO++87kyTAY70R5xlzckGqqrq+lSjtPvFmfYiz9nZV2TI6crQKtB4Fc6CWEQSxuBcPkBu5+z2f3VUDmCY7d2pA4WQDl599UJQ=
X-Gm-Message-State: AOJu0YzrAj625liZ6yzzMITLCqOAIZM2oociuk2apuIM8QgCjTpaClTT
	M5VF0VFxkJnsQ9Oyp27CfpeXoJrxu+qnjTLHPSprUxEeTA2pCeFGcl9CgZJPag==
X-Google-Smtp-Source: AGHT+IHNqU2GJfptQrcQaG8pJjaC87mF0Mtx6eQJf/jOQN/ukdR0fH/cQhlVblx8FIcrL9gvEYednw==
X-Received: by 2002:ad4:551b:0:b0:6b0:67d0:ff76 with SMTP id 6a1803df08f44-6b2afcd2338mr23501166d6.26.1718368898477;
        Fri, 14 Jun 2024 05:41:38 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c202e8sm17734056d6.50.2024.06.14.05.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 05:41:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 0/4] uvcvideo: Attempt N to land UVC race conditions
 fixes
Date: Fri, 14 Jun 2024 12:41:26 +0000
Message-Id: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHY6bGYC/33PTWrEMAwF4KsMXtdF/o3dVe9RZhHbSmKYOGBPA
 mXI3UcUSktIuxJP8D2hB2tYMzb2dnmwiltueSkU7MuFxakvI/KcKDMJUoECz8cVyx0rn3PJ3Hl
 nRQCncRCMSOgb8lD7EidCZb3daDnldl/q59eJTdD4+KNtExy4lV0SEAeL3r7HqS5zXufXpY7sS
 l2b/M9L8mi1gGQ8JK1OvPr2GpQ0B6/IRx2iFYlegjOvf/vu4DV57b0xUXiHPZ548+OtEAdvyIP
 ugh3QJHDh4Pd9fwJY75PFsAEAAA==
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
Ricardo Ribalda (4):
      media: uvcvideo: Stop stream during unregister
      media: uvcvideo: Refactor the status irq API
      media: uvcvideo: Avoid race condition during unregister
      media: uvcvideo: Exit early if there is not int_urb

 drivers/media/usb/uvc/uvc_driver.c | 45 +++++++++++++++++++--------
 drivers/media/usb/uvc/uvc_status.c | 62 +++++++++++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c   | 22 ++++----------
 drivers/media/usb/uvc/uvcvideo.h   | 10 +++---
 4 files changed, 103 insertions(+), 36 deletions(-)
---
base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
change-id: 20230309-guenter-mini-89861b084ef1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


