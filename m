Return-Path: <linux-media+bounces-1446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD724800491
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 08:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD06D1C20E96
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 07:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166B912B7E;
	Fri,  1 Dec 2023 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mxrsXSSl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E1B193
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:19:14 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-db547d41413so213660276.0
        for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701415154; x=1702019954; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0ly40XWtK8l7GtZTrOUAU5wEMWBLy5hr8qAfEHApx3g=;
        b=mxrsXSSlXAIoZ72Z60EDPqm82qMynMYvw/AyEOCg9JvLnjU4SS3om3ua9sOtW99fh5
         OBDx3CaHuOCJj8rFPGvkIp6amRJynYZ1hcNniggpIzF9BIPa8d/oE6srQIpM0q9DvVQj
         oozHFkdsqFJ/pJGc9Kw6OJgg9ch2xzXJkyemM4nedLSFzZcr9nfYraZKy2r6TDPxbc1m
         IvfowlXxB4/mv0/+bsdHxcUwyEKABLUT23uwqCoLlxmh8EjFoETJNcSmZtaQGro2drvS
         lFCrGyQUDIETNnJboMMDfQo7ECw6QY5YHyxAcn1I4evkeKq+YCg0NLkzQM664PswC2B6
         ROTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415154; x=1702019954;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ly40XWtK8l7GtZTrOUAU5wEMWBLy5hr8qAfEHApx3g=;
        b=cWFXJMWKmmKj0wIO0C00TAF5SXX+U7iynAI415XMM52IxAkSV+/yMOFuYTJSh6pKMC
         uFTbu7u1chj+RHX4C6B1XZwhJ8Gu/hd5B035EGVSrhpAAoCaZcUZjHgzY+c8REj6b72q
         JbAM5HvOw0og3phkp6NMHwAQ51OeEiQMEDrxYXcBAn0g6qI/fXYKsFn/DVtf7Ikd19Ga
         HuLdAUdbcNdD2vkPkWPMpyZHb7U5FHzIOt49ESjfWEqTc6RIqAtca3JgMTVqiVW9jfqE
         Uu+oKt96/iPkTIZb90XUUd5eGXjnH39yUnh/NO1kZ8Ew4h81RYLzdSs7UyZshopf9fMk
         YGuw==
X-Gm-Message-State: AOJu0YyECgkCjJ9EoJv90gaSIRwN+R8Yt6BNDGOvVHQM0Ur9eCTA2ewf
	7wstHySatsjV3YS2W9M4Rtj9lc1EwFk=
X-Google-Smtp-Source: AGHT+IF5BydPl/8Xatq3zC4YF9I0iscbZ4ltMjWaeFjAeVQagnrhRjWn48E9ronCQimS/SJIJubFgaytuoU=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:ea68:7c7a:2356:8a4a])
 (user=yunkec job=sendgmr) by 2002:a25:3055:0:b0:ca3:3341:6315 with SMTP id
 w82-20020a253055000000b00ca333416315mr847832ybw.0.1701415153876; Thu, 30 Nov
 2023 23:19:13 -0800 (PST)
Date: Fri,  1 Dec 2023 16:18:51 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201071907.3080126-1-yunkec@google.com>
Subject: [PATCH v14 00/11] Implement UVC v1.5 ROI
From: Yunke Cao <yunkec@google.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch set implements UVC v1.5 region of interest using V4L2
control API.

ROI control is consisted two uvc specific controls.
1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
2. An auto control with type bitmask.

V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.

The corresponding v4l-utils series can be found at
https://patchwork.linuxtv.org/project/linux-media/list/?series=11069 .

Tested with v4l2-compliance, v4l2-ctl, calling ioctls on usb cameras and
VIVID with a newly added V4L2_CTRL_TYPE_RECT control.

Hans Verkuil (1):
  v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Yunke Cao (10):
  media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
  media: uvcvideo: add uvc_ctrl_get_boundary for getting default value
  media: uvcvideo: introduce __uvc_ctrl_get_std()
  media: uvcvideo: Split uvc_control_mapping.size to v4l2 and data size
  media: uvcvideo: Add support for compound controls
  media: vivid: Add an rectangle control
  media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
  media: uvcvideo: implement UVC v1.5 ROI
  media: uvcvideo: initilaize ROI control to default value
  media: uvcvideo: document UVC v1.5 ROI

 .../userspace-api/media/drivers/uvcvideo.rst  |  64 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  26 +-
 .../media/v4l/vidioc-queryctrl.rst            |  14 +
 .../media/videodev2.h.rst.exceptions          |   4 +
 drivers/media/i2c/imx214.c                    |   5 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    |  34 +
 drivers/media/usb/uvc/uvc_ctrl.c              | 721 ++++++++++++++----
 drivers/media/usb/uvc/uvc_v4l2.c              |  18 +-
 drivers/media/usb/uvc/uvcvideo.h              |  24 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 167 +++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  38 +-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |  13 +
 include/uapi/linux/v4l2-controls.h            |   9 +
 include/uapi/linux/videodev2.h                |   5 +
 18 files changed, 997 insertions(+), 213 deletions(-)

-- 
2.43.0.rc2.451.g8631bc7472-goog


