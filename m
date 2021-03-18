Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D54340F15
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhCRU3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbhCRU3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:31 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7E1C06175F
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:31 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id u9so6027219ejj.7
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3hi9oL99n8axRv4F2xKskdWpq2vH4h46Ymny3ztdTvk=;
        b=PVzxiSkyxe87SQaAcBYjQURstMVlXnK+tLPtxtdE6tpqXE1mRe3ciREBRxvQg/fAku
         ZCsIbVejywf27xZVexGr3GzBkpl8BYGxFaNZ4z/96cCKAJxYmy/giwj1t+ko8lmDZDfV
         MpJzHvA5uH3H/Bn2pRzDN167EaRkXVkkCwRtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3hi9oL99n8axRv4F2xKskdWpq2vH4h46Ymny3ztdTvk=;
        b=OaBFMQFiQN+BZKae/t+sBSC4sLUQH8avU8xpRIBkZy+CpbJUeDH0qFv5iZ/CZoVPzT
         MRbcEr9xOSM+hmWA8/Dzq+trCPtmPp8O/aZcymqwi1LEtODN/h1VLnco49EzSXEpWFlU
         eHZ3wTjgAjrxqRwc6t7KZC9bjktyHdnmnsVi9qSVGxXFL1sD+9eNtm6xBR9cRQ/Yo9GL
         isa/tydYlO05uifsuqe4VnleDTwWD/enEVcMx/M6nmAIDzCIG65DAynDLljW8/3CJXiS
         IKXv0Xc8ZJv8fWFRHHQ7QEdepJPQ6DTXlgiPXvz/NbQALxDzuTSRvHUsLCMaDFLVldQh
         cUwA==
X-Gm-Message-State: AOAM532gPDYECPJfAN5tj2cBLJAwGY1FMPPGEuvjUytOCqkHk+3q6gj4
        dw9kjAZmGhJf9/xq6HDnKOzuYw==
X-Google-Smtp-Source: ABdhPJzLP+uwu5YSXQao8b4J2rrtU919i1z94pi9b727GF+e7lQT+RoFDA3ZzII362HIXcnA2WVTYQ==
X-Received: by 2002:a17:906:a0d4:: with SMTP id bh20mr418725ejb.348.1616099370152;
        Thu, 18 Mar 2021 13:29:30 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a22sm2533767ejr.89.2021.03.18.13.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:29:29 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 00/17] uvcvideo: Fix v4l2-compliance errors
Date:   Thu, 18 Mar 2021 21:29:11 +0100
Message-Id: <20210318202928.166955-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance -m /dev/media0 -a -f
Total for uvcvideo device /dev/media0: 8, Succeeded: 6, Failed: 2, Warnings: 0
Total for uvcvideo device /dev/video0: 54, Succeeded: 50, Failed: 4, Warnings: 2
Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 102,
Failed: 6, Warnings: 2

After fixing all of them we go down to:

Total for uvcvideo device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
Total for uvcvideo device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 108,
Failed: 0, Warnings: 0

YES, NO MORE WARNINGS :)

Note that we depend on:
https://patchwork.linuxtv.org/project/linux-media/patch/20210315172531.101694-1-ribalda@chromium.org/

With Hans patch we can also pass v4l2-compliance -s.

Changelog  from v6 (Thanks to Hans)
- Squash all check_ext_ctrls patches
- Add documentation patch
- Return the correct ctrl_idx if the hw fails
- Fix accessible typo
- Set the proper name also for the metadata node

Hans Verkuil (1):
  uvc: use vb2 ioctl and fop helpers

Ricardo Ribalda (16):
  media: v4l2-ioctl: Fix check_ext_ctrls
  media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
  media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
  media: uvcvideo: Set capability in s_param
  media: uvcvideo: Return -EIO for control errors
  media: uvcvideo: refactor __uvc_ctrl_add_mapping
  media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
  media: uvcvideo: Use dev->name for querycap()
  media: uvcvideo: Set unique vdev name based in type
  media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
  media: uvcvideo: Use control names from framework
  media: uvcvideo: Check controls flags before accessing them
  media: uvcvideo: Return -EACCES to inactive controls
  media: docs: Document the behaviour of uvcdriver
  media: uvcvideo: Refactor __uvc_ctrl_commit
  media: uvcvideo: Set error_idx during ctrl_commit errors

 .../userspace-api/media/v4l/vidioc-g-ctrl.rst |   5 +
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   5 +
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c      |   4 -
 drivers/media/usb/uvc/uvc_ctrl.c              | 312 +++++++++++----
 drivers/media/usb/uvc/uvc_driver.c            |  22 +-
 drivers/media/usb/uvc/uvc_metadata.c          |  10 +-
 drivers/media/usb/uvc/uvc_queue.c             | 143 -------
 drivers/media/usb/uvc/uvc_v4l2.c              | 360 ++++--------------
 drivers/media/usb/uvc/uvc_video.c             |  13 +-
 drivers/media/usb/uvc/uvcvideo.h              |  53 +--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  59 ++-
 11 files changed, 408 insertions(+), 578 deletions(-)

-- 
2.31.0.rc2.261.g7f71774620-goog

