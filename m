Return-Path: <linux-media+bounces-21412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 519019C9221
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D8BE2811AA
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A6C19D886;
	Thu, 14 Nov 2024 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bknDODJp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB0A1487CD
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611448; cv=none; b=tmBDWPaTcdbyLT2Smnq65EwEKUYwo/TybPrEORJVL0iS1RdJyt+JrxqbDNVNO6ZDXNy6c2VrgRtzKazJwyj7SN5FaVJcKHuJD7pGHVG+GBV9KkMBPnhjrV8vUu8OSMjE28gbEOxO0SFWOdaK2w6Bh1R5gtAXcs3CcfX8gquIGwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611448; c=relaxed/simple;
	bh=QOVfo2cFW9KORd9WPDy4R/uzsDOrwnZ7aHiZiYRxNDk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a2l06DQO1oPWNuswJyKfTm1+egN541oIPJ8Np6iE1PqpH8WAVFdRsbpqMbf0YnckS5Yk88zsCQuEYK9ruDxXC/cVJgrxeEVylUOkrZ7+H3d3ivabweugjd4kqNyYGpAlcqdN4NLmwmVXqelKoZdM8+cCbEuiA6kok/BXpvPLeEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bknDODJp; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d18dff41cdso6292036d6.0
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611445; x=1732216245; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPgixAbdIlp8B+ecfqqyWBidgsH+LckhnUGfHrml6kA=;
        b=bknDODJpYje+11+1YmPz/oLpztMlZouAbvLAOc/Agwhs8AWZyVNO8fiJ/pxPFkCnDu
         K3KcW3XzWUH+U5WWzXh+vxM13etb96gjAgGHc3OzuD8VLUdjX1yzKUlX7BDWs+AwKWTI
         trN2EoxPJQhTccNQWeon+9UyH+Se8TVh3vTMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611445; x=1732216245;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPgixAbdIlp8B+ecfqqyWBidgsH+LckhnUGfHrml6kA=;
        b=uN2OHI9C9ObpDi3apxuY1dd1a9HEqwNyuaewBlA0rAjTBphzMTAOCVrpAOdNZMYHwK
         QYC/QBOW12rxaJx+FKc5rX3bm5S1ejfb61yb+RPpeWzh02R8A8HeeZA1ryu5MgyKun5y
         rIdZLGITJd0CuhqXD/Lzi5nv14Q41hML9l9mJKgtJvRhIkp/LBCADUpSAyLUnSs7Jczw
         9sJI/TiIPVHnA5jC2n/nHK5XZCUJw1K3XLwLMXQ9/z/XnzP7s64D+f9lNL7GH6RlezGp
         XsuNs8pbUyB/zujsmlgKMkCOmyUyTpjlVeqz7IgX9mio3nfyShJefFcfCNCk75R79/Tm
         6ikQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL4VcOihosY/l2rk6l2ZGkXOaPFJmBBzXvMn7676kXxfzRf1lEBoFfXjZAR/I3wdQmNlmCuKCGlyjkFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwahrPGuRtPY5zFQmhN7lnYyEkRXhO4UA2OK/+DiG3SzXaKi7qe
	a0sBVoScAKK2ikG3AyUgNXFZj6rBzHTQiYSwd5o1HE/pvTjiuG6xdkE4W8lmdg==
X-Google-Smtp-Source: AGHT+IHjqf72bVaMMMCz/rqyNt37/4FEE/tea+TsMcQkfnFDcEutn7duKRASVy3FvFq7gQaXkttvYA==
X-Received: by 2002:a05:6214:2c0a:b0:6d1:8fa2:6f81 with SMTP id 6a1803df08f44-6d39e16719amr335673196d6.9.1731611445266;
        Thu, 14 Nov 2024 11:10:45 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:10:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v15 00/19] media: uvcvideo: Implement UVC v1.5 ROI
Date: Thu, 14 Nov 2024 19:10:29 +0000
Message-Id: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVLNmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDE11FJSSM
 xLz0lN1M1OAAkpGBkYmhoaGxrqlZcm6RfmZumZmSSlmyWmJhqlmJkpA1QVFqWmZFWCjomNrawF
 AnqdqWgAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Yunke Cao <yunkec@google.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.13.0

This patchset implements UVC v1.5 region of interest using V4L2
control API.

ROI control is consisted two uvc specific controls.
1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
2. An auto control with type bitmask.

V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.

The corresponding v4l-utils series can be found at
https://patchwork.linuxtv.org/project/linux-media/list/?series=11069 .

Tested with v4l2-compliance, v4l2-ctl, calling ioctls on usb cameras and
VIVID with a newly added V4L2_CTRL_TYPE_RECT control.

This set includes also the patch:
media: uvcvideo: Fix event flags in uvc_ctrl_send_events
It is not technically part of this change, but we conflict with it.

I am continuing the work that Yunke did.

Changes in v15:
- Modify mapping set/get to support any size
- Remove v4l2_size field. It is not needed, we can use the v4l2_type to
  infer it.
- Improve documentation.
- Lots of refactoring, now adding compound and roi are very small
  patches.
- Remove rectangle clamping, not supported by some firmware.
- Remove init, we can add it later.
- Move uvc_cid to USER_BASE

- Link to v14: https://lore.kernel.org/linux-media/20231201071907.3080126-1-yunkec@google.com/

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hans Verkuil (1):
      media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Ricardo Ribalda (12):
      media: uvcvideo: Fix event flags in uvc_ctrl_send_events
      media: uvcvideo: Handle uvc menu translation inside uvc_get_le_value
      media: uvcvideo: Handle uvc menu translation inside uvc_set_le_value
      media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
      media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls: handle NoP case
      media: uvcvideo: Support any size for mapping get/set
      media: uvcvideo: Factor out clamping from uvc_ctrl_set
      media: uvcvideo: Factor out query_boundaries from query_ctrl
      media: uvcvideo: Use the camera to clamp compound controls
      media: uvcvideo: let v4l2_query_v4l2_ctrl() work with v4l2_query_ext_ctrl
      media: uvcvideo: Introduce uvc_mapping_v4l2_size
      media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map

Yunke Cao (6):
      media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
      media: vivid: Add a rectangle control
      media: uvcvideo: add support for compound controls
      media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
      media: uvcvideo: implement UVC v1.5 ROI
      media: uvcvideo: document UVC v1.5 ROI

 .../userspace-api/media/drivers/uvcvideo.rst       |  64 ++
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |  26 +-
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |  14 +
 .../userspace-api/media/videodev2.h.rst.exceptions |   4 +
 drivers/media/i2c/imx214.c                         |   4 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |   9 +-
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |  34 +
 drivers/media/usb/uvc/uvc_ctrl.c                   | 805 ++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c                   |  77 +-
 drivers/media/usb/uvc/uvcvideo.h                   |  25 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |  54 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          | 167 ++++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +-
 include/media/v4l2-ctrls.h                         |  38 +-
 include/uapi/linux/usb/video.h                     |   1 +
 include/uapi/linux/uvcvideo.h                      |  13 +
 include/uapi/linux/v4l2-controls.h                 |   9 +
 include/uapi/linux/videodev2.h                     |   5 +
 18 files changed, 1062 insertions(+), 291 deletions(-)
---
base-commit: 5516200c466f92954551406ea641376963c43a92
change-id: 20241113-uvc-roi-66bd6cfa1e64

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


