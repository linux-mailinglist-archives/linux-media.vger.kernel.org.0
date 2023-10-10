Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A764D7BF0C4
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 04:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379403AbjJJCVr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 22:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378796AbjJJCVp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 22:21:45 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7572D93
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 19:21:44 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a7aa161b2fso14395787b3.2
        for <linux-media@vger.kernel.org>; Mon, 09 Oct 2023 19:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696904503; x=1697509303; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2sWkf0ns+Oo3C8tyMkYUEpJjI7Vps2VWGTTlNaf5Z1Q=;
        b=BV91xL2Sj0L655s7og481huWX1JTys02f528r/9j01OkEl0pIdTthtkqDGQCdWeUu9
         ehkkziDOpMy9b2oxCE2Ft1wkV5JUxqwzAOT9H8BymUJ72tmWaXvxScQ97c+iMZekF0G6
         0FlmqNIRBIORLixOxk/YLdQQv76kjK6Osn6ntjS08aXACLiITAX/904Rs+7QH554hZex
         so5n+W2/BA4/XM0jc7Lxwi3NfrgmxCFKzpY/eK8tXuaKnuB0HwZrlxuyRUQizcWDBAK+
         sQoK4d/mswAXwHumOQ14q5Z2EPdZ6cn3gqBbsNlwzP8FW5adXlgZLUJ9MYVr3UXgjOYX
         IJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696904503; x=1697509303;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2sWkf0ns+Oo3C8tyMkYUEpJjI7Vps2VWGTTlNaf5Z1Q=;
        b=v+UDfYNVMUJaAwpI3LTTbM82cxn/FFLU+4mePCEmE5jay19S+8aslt6OMffz9a9FA0
         MfupldqrcFXGpSRK9SiN1lxAE+IRYVnuyEiZU7zT466jb/ItwpM7GF0nvN5TNsYvSHEW
         ZFTtuqwHZGPb/20c17yFKOA68CanB9KEr4CzBc8/CuoFv3TKhBRrTBqk90I/X62mTYTb
         hNCpgvjhPY+zYivLrWUEYKJPTcevx8Un9MiROWK5OMu3NgTK5hmUCG3Dpz5FGYcR7jfx
         AZWen4O1yCSDiICcUz5rFFVJ9y1GqRKwH1kIKme0rZi9KZAhc7+PcqMDckCiFkLc/AM0
         KO8A==
X-Gm-Message-State: AOJu0YxAs3KeH4YjBaIK7PHj7C7JgOZwP6JSzs6KVk34CjFSFFAPn291
        qmn253ocPybp20SU44MzIYWWnLJ+XqQ=
X-Google-Smtp-Source: AGHT+IGfcBl2hDX8Du0kS3AEAJYpfwz4E1jCRKxTnxplm/Vzo/L0mjXhEhHR0DPLNHrgYltgoK4HNaBqP4U=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7303:2d54:5b83:e60b])
 (user=yunkec job=sendgmr) by 2002:a5b:741:0:b0:d81:bb31:d2fa with SMTP id
 s1-20020a5b0741000000b00d81bb31d2famr279999ybq.3.1696904503644; Mon, 09 Oct
 2023 19:21:43 -0700 (PDT)
Date:   Tue, 10 Oct 2023 11:21:23 +0900
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231010022136.1504015-1-yunkec@google.com>
Subject: [PATCH v13 00/11] Implement UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham
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
 include/media/v4l2-ctrls.h                    |  36 +-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |  13 +
 include/uapi/linux/v4l2-controls.h            |   9 +
 include/uapi/linux/videodev2.h                |   5 +
 18 files changed, 995 insertions(+), 213 deletions(-)

-- 
2.42.0.609.gbb76f46606-goog

