Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D935260C383
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 07:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiJYFzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 01:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiJYFzh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 01:55:37 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F7432B9D
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:55:35 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id lk10-20020a17090b33ca00b0020da9954852so10107345pjb.1
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hCTrgj30KiKZFoVMtrvRb/nCA2yDxlk4E13ZcsjVjd4=;
        b=mj2sN/5WZAvWn0No/3z9RP5jrojsMeaydH+n3/BKEVgJS6gT1D+k4/jOS51G+y5viN
         KgaGau6+Ehc0+LA5AejG3JwBwn4Z2gvOQWPtqE5DLgpy8F8QW4WyJxdoMY1hC87u7JGX
         1dFUaUVozfJzX2RZkT2cRt7gQHQ2XRk8ker7mtFaAzoCYhpFDN/ODlQpjAnKF+FzOjz2
         bFlr+zg8j5Gy+IV5fX45aecLLVRY+SDHr7e0EjgI++UAah/g62qyNQwoO9gEVb0zgj28
         rPHx/25lIT+zDyRtfvwzxY9yjzNmKdl5qSmOQ2txzFVsVXck/8X7KAtsgtNgjnh2kbJW
         HRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCTrgj30KiKZFoVMtrvRb/nCA2yDxlk4E13ZcsjVjd4=;
        b=k8uIpWiwHIou5VLY9U2rJ2wyYxBu7KipYarcVA8R0t7QuAmkNUwLEsL3YQvRSbjUaG
         SkJkKuNoM4+uyAl+0R0luEX5HfKfxmAJLqzsJFtTQUqM/58crQr821b9ns8yHSlhEBq+
         fO4Wy2mEoEpeKBfUM5f8GJkUPCDTMzTIwlYODTfCfS/BYR1sYrvieOnCdy2rMun1UnHl
         NBOvfGIId3cTz6W3YGQGXiX9ipg011PgkkDNN1amdOuUYVBGxMgylzhNY9MYoRqruOa7
         Eearbtl3MCmxsm3AkV7grSeyeS0e6jxHFuTuvRTv2KkfU1Jk7GpXNulONY0CT0lw1bRi
         OVuQ==
X-Gm-Message-State: ACrzQf0lTYVQFMSh2GOUI1THJqjGXnMDUy8mjZnEMoSvkIHsokGQH2Ko
        LL9DEPTMfLFh6AVfBTi/bORPGEQvaww=
X-Google-Smtp-Source: AMsMyM7eTmt6mAtTKMtNR5RgbMFAL1WgbKqJF3U68iO8tay0LV5U7bUhFKCBkT+t0lgnj2jnPhqRb1iCw/0=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7ee8:fa64:12b0:14f3])
 (user=yunkec job=sendgmr) by 2002:a17:902:eb92:b0:186:7067:3e9a with SMTP id
 q18-20020a170902eb9200b0018670673e9amr23544462plg.80.1666677334956; Mon, 24
 Oct 2022 22:55:34 -0700 (PDT)
Date:   Tue, 25 Oct 2022 14:55:17 +0900
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221025055528.1117251-1-yunkec@google.com>
Subject: [PATCH v9 00/11] media: Implement UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This patch set implements UVC v1.5 region of interest using V4L2
control API.

ROI control is consisted two uvc specific controls.
1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
2. An auto control with type bitmask.

V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.

Tested on two different usb cameras using v4l2-compliance, v4l2-ctl
and calling ioctls.

1/11 adds V4L2_CTRL_TYPE_RECT.
2/11, 3/11, 4/11 refactors uvc_ctrl.c.
5/11 adds support for compound controls.
6/11 implements ROI in UVC.
7/11 initializes ROI control to default value.
8/11 is a cherry-pick for Hans' implementation of
V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
9/11 documents min/max for the rectangle control.
10/11 supports MIN/MAX in UVC.
11/11 documents the changes.

Hans, Laurent, thank you for the review on v7/v8. 
It would be great if you can take another look, thanks!

Changelog since v8:
- Rebased onto media-stage master (v6.1-rc2).
- Addressed Hans' comments in 8/11 v4l2-ctrls: add support for
  V4L2_CTRL_WHICH_MIN/MAX_VAL. Including adding a new documentation patch
  9/11.
Changelog since v7:
- Rebased onto media-stage master.
- Move the factoring logic from 5/10 to 2/10 and 3/10 (new patch in v8).
- In patch 4/10, split uvc_control_mapping.size to v4l2 and data size.
- Move initializing ROI control from 5/10 into its own patch 7/10.
- Address some comments. Changelogs are in patches.

Hans Verkuil (1):
  v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Yunke Cao (10):
  media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
  media: uvcvideo: add uvc_ctrl_get_boundary for getting default value
  media: uvcvideo: introduce __uvc_ctrl_get_std()
  media: uvcvideo: Split uvc_control_mapping.size to v4l2 and data size
  media: uvcvideo: Add support for compound controls
  media: uvcvideo: implement UVC v1.5 ROI
  media: uvcvideo: initilaize ROI control to default value
  media: v4l2: document the usage of min/max for V4L2_CTRL_TYPE_RECT
  media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
  media: uvcvideo: document UVC v1.5 ROI

 .../userspace-api/media/drivers/uvcvideo.rst  |  64 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  15 +-
 .../media/v4l/vidioc-queryctrl.rst            |  11 +
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   5 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 drivers/media/usb/uvc/uvc_ctrl.c              | 676 ++++++++++++++----
 drivers/media/usb/uvc/uvc_driver.c            |   2 +-
 drivers/media/usb/uvc/uvc_v4l2.c              |  22 +-
 drivers/media/usb/uvc/uvcvideo.h              |  23 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 171 ++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  36 +-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |  13 +
 include/uapi/linux/v4l2-controls.h            |   9 +
 include/uapi/linux/videodev2.h                |   4 +
 18 files changed, 923 insertions(+), 202 deletions(-)

-- 
2.38.0.135.g90850a2211-goog

