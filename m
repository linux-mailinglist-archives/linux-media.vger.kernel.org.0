Return-Path: <linux-media+bounces-7780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ABF88ABC5
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 18:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C800A1C38C8D
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2BA1442F0;
	Mon, 25 Mar 2024 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VwInycUZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0822113A87A
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711384297; cv=none; b=kPCzMZ174/QqyGay4C3PtX+zxN4igDK44tgBFBnjocTZcGCRGvvWqPFVCELOxGMddmVAl24GD6ZbtwqjckVtaLpIaNN6pDUVB1BMrLftzX2vGUlPQaD7EhZLOoVz0a+DPT/eE5/8YMoqecFuuXANFRGLTBQQhtsw3cHY5Zy/h6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711384297; c=relaxed/simple;
	bh=w6DaHZ4TnuH9v4Emg920ReSzBuZ0z6XitbqFpiu3gYM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=duoalgVnJl9hrKhtUshIXcmF0zikiAsqdTMgK4c06p+MBV+KXQOy+iHb7sHqTRp9ZFFnRObw07zohv9P+G5bVRHcKetVGAUp32dPa6ikvTiHW4h71WhVoE4FRXZk9/RqryvUvZTQ0iSdUq3FHk7IX9sElTbNAs1ifk22XTR4SPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VwInycUZ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-789e83637e0so290871685a.2
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711384295; x=1711989095; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o8UG1sBf8YnVlAvzFRG9A1FKoAqPVTTNxUBmo7oEIgQ=;
        b=VwInycUZfUIpOGjAyeNlXv6ImsJYdFK875vMPrbsOGM76ya/bU+4B1dLAyA8DUgMsh
         HVqTaGjyXCxWt7bGqbrEeRLr5A1IqTuCDBNZLBDR7nFB5m/VsiC486rTSS56aKjK96GQ
         06WeoJqqA0+RlqULGqzXVauUj+bM5yWTP+hXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711384295; x=1711989095;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8UG1sBf8YnVlAvzFRG9A1FKoAqPVTTNxUBmo7oEIgQ=;
        b=MmE9ogMCCTr/cu/ckdUwPP9d8JzITov0DM8bE9gr0c8dJcyYwPJR68fwLZAVNHeU3K
         HXKSQCLnblgq/oqelw9eHC2wntHl+Nhd8yUiHR5pXIyGBxaYXeLxNbLGu4Q0XDHHNuv6
         Z03yBv2dE0DgwOqGkwBltEjZs1TzgBtXwvR2A10hroecwOI1j+3KvcgkzSBBHGxhS3Kr
         UT9NRL7Dvkb69h3bxYYY62sVfhpGQUY/YWI6YzMKv9X/Vp8GD4JpkjzJI9+KTVsMSPFS
         QTW3rKAK5oQPzj+xYicQE38BntCX6NsTxscAzm3ttPQyucNOyVdys72ZZm7Ggg7J41s5
         SvQw==
X-Forwarded-Encrypted: i=1; AJvYcCXUe2FMaIGBwDa/6bENHPKw6mRAh6UXvatnw2aqNlXLgyRYD0Bzuw2M+rk6DobpFxHDRbCTl0jqzgX2ObbqHmRr473RRxgrlNKmnoc=
X-Gm-Message-State: AOJu0Yw2lmKMyGPHcYFK2hgYt4w5oRjN45QFvoF2lHpSe7UFKtFa9GWB
	hRoGbIBlUd1iIpdIzc0Q46khmwBFskJDyFKEHRcF1R8IXg1fghiFhxWJpXGH/A==
X-Google-Smtp-Source: AGHT+IH/mEvmj35o2yh2gVgqDcryLvwe4uoBhQArWtHYzHUrsG6oW8txYwL5mmctJaOO3KYIqbXgYQ==
X-Received: by 2002:a05:6214:c66:b0:690:beb7:c6da with SMTP id t6-20020a0562140c6600b00690beb7c6damr10208230qvj.38.1711384294853;
        Mon, 25 Mar 2024 09:31:34 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id jr9-20020a0562142a8900b006905c8b37bbsm376330qvb.133.2024.03.25.09.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 09:31:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/3] uvcvideo: Attempt N to land UVC race conditions
 fixes
Date: Mon, 25 Mar 2024 16:31:32 +0000
Message-Id: <20240325-guenter-mini-v3-0-c4bc61d84e03@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSmAWYC/33NQQrDIBAF0KsE17WMmtrYVe9Rukh0EgcSBU2EE
 nL3SpeFdjX8D+/PzjImwsxuzc4SFsoUQw3q1DDr+zAhJ1czkyAVKDB82jCsmPhCgXhnOi0G6Fo
 cBatk6DPyIfXB+orCNs+19JTXmF6fF0XU8/ixVgQHruXVCbCjRqPv1qe40LacY5rYs24V+c/L6
 lG3AtzFgGvVlz+O4w2dFeAM8AAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.4

Back in 2020 Guenter published a set of patches to fix some race
conditions on UVC:
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

Which will make obsolete a lot off (all?) of the video_is_registered() checks on
Guenter's patches.

Besides those checks, there were some other valid races fixed on his
patches.

This patchset tries to fix the races still present in our code.

Thanks!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3: Thanks Hans!
- Stop streaming during uvc_unregister()
- Refactor the uvc_status code
- Link to v2: https://lore.kernel.org/r/20230309-guenter-mini-v2-0-e6410d590d43@chromium.org

Changes in v2:
- Actually send the series to the ML an not only to individuals.
- Link to v1: https://lore.kernel.org/r/20230309-guenter-mini-v1-0-627d10cf6e96@chromium.org

---
Ricardo Ribalda (3):
      media: uvcvideo: stop stream during unregister
      media: uvcvideo: Refactor the status irq API
      media: uvcvideo: Exit early if there is not int_urb

 drivers/media/usb/uvc/uvc_driver.c | 24 ++++++++-------
 drivers/media/usb/uvc/uvc_status.c | 62 +++++++++++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c   | 22 ++++----------
 drivers/media/usb/uvc/uvcvideo.h   | 10 +++---
 4 files changed, 83 insertions(+), 35 deletions(-)
---
base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
change-id: 20230309-guenter-mini-89861b084ef1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


