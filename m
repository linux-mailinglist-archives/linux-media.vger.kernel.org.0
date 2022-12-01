Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE0363E7DB
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 03:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbiLACcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 21:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiLACcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 21:32:17 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E0190745
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:15 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id x11-20020a056a000bcb00b0056c6ec11eefso610115pfu.14
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+mfuQao28BMhgL2St3TqeJw7N1JzOKRpfv2ncni4pwY=;
        b=pbF4/jqlYXrgzwPYJTYFp8yc+UOqinLQegnIdf4KwwUvJSdrohrSNn+gzEIsJuOEGF
         emDRlKAvqan1dmLmUJm6T57G/+S+6k4R6G7fDZsVoTiNmEd1LAw2y5H/ShZF1qTkGEyX
         CM4gjPlWlwv9YAXrbZuGlF6eUbixX9aFYPAqduq+AV6dLRyAitFRzCRTD9Kn09/T4wkI
         k9OLkyAQD8YKDAtITnmhwW7Hvgh6acCFcYDGXhCsvu3j75TOIjTO1VUIAxQZUxFmUNrH
         T36kBex1mGHymyik+5UoX3ojDdZeAb4KCmH1LySkEQi8KUFpkxq8Ame75+9/JYCSjO9i
         FY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+mfuQao28BMhgL2St3TqeJw7N1JzOKRpfv2ncni4pwY=;
        b=DCMX7RiUkTx3df9MBV04Y95X+7iPFjqEswqb82wIQ6AnaSfW43sqHTlMoQr/6jpJje
         7jaBKRes/Rzx6pQr9b2rPm3BznodcztOZLyIACSQsLO165IfZ5CzpkwUtRzQs7vso1zP
         Z6HMn5ulciSrmG7wwzQzbDNRrtqJ2y0JOyCgJkyVrgdmym8RMad3abHOI2p9yNU85poN
         uIgqG5vnsKTM/Dee2khD/EzO345dRYkQRw4rGsX96zjoOBItuTMcqMjkH1GKnuFLujQz
         5xxug+HRT0s7634rOYvSmFt3vM7O7WASJibxdiD69jdHudhBs+vR2e3InsZflF8EaurT
         PGfQ==
X-Gm-Message-State: ANoB5pkvBGn1R8IgzbD9kPqOUwV5CQcPXnWSmyjKqel1ryMm3Zi7yug3
        VE2ZHhws0wswag6Sw2dGlen4z/iJ9lY=
X-Google-Smtp-Source: AA0mqf4toRRhDcZrodUA/7sxoHxrO27pj68XMaLeZv33Pcfjon9YNtm7IqrCIp6IG0kGeZqTfOtR2hdukiQ=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:8366:b78e:6451:c163])
 (user=yunkec job=sendgmr) by 2002:a63:d012:0:b0:470:1aa:c99c with SMTP id
 z18-20020a63d012000000b0047001aac99cmr38772307pgf.453.1669861934614; Wed, 30
 Nov 2022 18:32:14 -0800 (PST)
Date:   Thu,  1 Dec 2022 11:31:53 +0900
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221201023204.2177458-1-yunkec@google.com>
Subject: [PATCH v10 00/11 RESEND] media: Implement UVC v1.5 ROI
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
control API. I rebased v10 and resended.

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
2.38.1.584.g0f3c55d4c2-goog

