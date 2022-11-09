Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E216223AD
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 07:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiKIGGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 01:06:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiKIGGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 01:06:30 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105E71F9DD
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 22:06:29 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id h4-20020a5b02c4000000b006bc192d672bso16109322ybp.22
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 22:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EqCODufal7SYmgtmYLuIda30kvRGG48OnBq0oGO/PMY=;
        b=fT7VTs1zcJrbZvAH1IYYKeIM3vAlIk5Pzvy6nZzxWx+BD9sddsdG6KEQUap8CbpAhe
         m9uMhRYmJCwbHnivKvqtcWksfFCJCsnmrgtaZ6L0XHE5BwngM7GB5u0bPGfVV5WXbQGD
         bVxs4oNZ1reX0x5N9C1PvAhr9EevSls34kNPrskQm9LHnZ4psnYT+PkcYknLpO6jfUjc
         IHxbfRhPGIMVTZBioysWoq74kJglIPZzBxVsglGtWFV0kt79MQYkyEeMhyoiJE4Rr2qg
         KpxaPsDg+623PPGvOm5/nRPwOk6HUSft978Nex2mflCR9HXaN69bUFQgdeUT9zZ2aUeW
         k2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqCODufal7SYmgtmYLuIda30kvRGG48OnBq0oGO/PMY=;
        b=qLvbQKAXADDg4D3z6IpMAPfvUNln9q56vu6iNfG4/RJVCDOLj09kUyD3uuAc20W+07
         DGd1aljw4eyfETFxMYioDIU5602NkEici/oMeuH2gsW0Gafw9J7p5hhIMXH9sBzm4f8L
         yhh8fqviNqNyjob6evleoy0g8dSVYSnoH4MwZa7bZURJ5eXWdfWcTmsUT2HoBAH/8Bai
         7ynU5noNWGtZqYgA3osKrDtBWKfqMtit7fUjDaBAbguQNP8GU5YYqc0aQGzU3K2VZ/oT
         NnJIcxb1wXXFm35FhNmQNODe4R2ja890+jTDmApvNkE2REAx+t2FQ7+o+O1mLEkbKidu
         uGTQ==
X-Gm-Message-State: ACrzQf0KHUhE3Ya55Y82XHns2pIa9LTazIE0WQFP+9C1VkAlR7OOJMB3
        lGpcWSJ/AnXeG7AmvwZfqLRuI8r9krQ=
X-Google-Smtp-Source: AMsMyM4c0oJYiXQ/EWNLZMifAnSimkGELdCD8Czz1CUqMr4WtCvA7nI1XcKKjkhhi9S6idtY89q0bBEc15o=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:124f:15d3:a305:3dbf])
 (user=yunkec job=sendgmr) by 2002:a25:db43:0:b0:6cc:476c:bad3 with SMTP id
 g64-20020a25db43000000b006cc476cbad3mr947813ybf.86.1667973988293; Tue, 08 Nov
 2022 22:06:28 -0800 (PST)
Date:   Wed,  9 Nov 2022 15:06:10 +0900
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221109060621.704531-1-yunkec@google.com>
Subject: [PATCH v10 00/11] media: Implement UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
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

Changelog since v9:
- Rebased onto Linus' master branch.
- Fixed some minor issues. Changelog in patches.
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
 drivers/media/usb/uvc/uvc_v4l2.c              |  18 +-
 drivers/media/usb/uvc/uvcvideo.h              |  23 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 171 ++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  36 +-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |  13 +
 include/uapi/linux/v4l2-controls.h            |   9 +
 include/uapi/linux/videodev2.h                |   4 +
 18 files changed, 919 insertions(+), 202 deletions(-)

-- 
2.38.1.431.g37b22c650d-goog

