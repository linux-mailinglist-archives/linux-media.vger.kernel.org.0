Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0C1A6EF03B
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 10:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239788AbjDZI3n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 04:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjDZI3l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 04:29:41 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5833A94
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:29:40 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-54c2999fdc7so116137787b3.2
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682497780; x=1685089780;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FjhbWtlCDE4TpXjqR27LucXk6/mZcN7eys3dvwtfV/8=;
        b=p8stDKvZr11yKKoRLEq/gpPKz+HO+KPsa4UXPZGMxTmz07AnZwDdRBqF7pYs1w3ZgK
         bUi8E5r3o6v38pn2Vv7sUZcg4x0Fv+o+ikYgOegAccGH2TSWwTps3Y5MfpHHYWXmk3tt
         CDlBgFw37vWDsj0qxAz7dGFPPOgYosVwU6/GhTSVL2zFdJFv1OO5bzJc6HLF13g/s3Vg
         kXPpdp6Z3qH2OBDw/KHaucsCzD0ZGcXByApeCwEN1Aje53LDKrBpA2MkY97vWqg3ODwx
         0lp8uVqxxylSjnsiLjPnfo4CqBnzQitjlpOlDBIWA3XhQ5Mq8nAsdOvFJkqwfhqOHc9b
         a98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682497780; x=1685089780;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjhbWtlCDE4TpXjqR27LucXk6/mZcN7eys3dvwtfV/8=;
        b=N0i3tEBhUUQwkc1wNGr37qWTx1mCuM6hqvdTLPknxJucft7NWUtUpIix6hhSLfRLfk
         fospgg72aHnCT/BI71CYi1r9NfXn0b35Xb/o+FwLjOWGtWnGN1jopbHGlPkp9lZeRrYL
         flcYRJ7pfPORveeYQKk4IBOzLvLQkGvHMmGVEwB+dhobTIFOxQt42lVNF1uXmGRDwWwl
         162plNZeEeTVI8NlGjsJ9evY4u0molqmMtPtp16swLGAiM00ae3loPQtMngTnDLeXTsv
         k39qHDatZiUAw2FlzyXeEyAIfmC+0ZiTq1FQ1E2sEasiAplgX1SmgLBbOqv6hCDY48y1
         bizg==
X-Gm-Message-State: AAQBX9cZibnLo/BICg/Rx3ku1BNyqCbQSGr149DgKRCqfwoG3S6r0Ncf
        j/BYM1lGIevUVTfxCk+iHZ31JzjDtAU=
X-Google-Smtp-Source: AKy350Z1FCcBdclwZ8c14Tw3gaUJOvqNGVLlFc+fqkQ30W1iM1tBUNCCHiAlQhWkbQ6ix+jci1En4JAsEn8=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:1f4e:598b:ed:99bd])
 (user=yunkec job=sendgmr) by 2002:a81:441c:0:b0:545:62cb:3bcf with SMTP id
 r28-20020a81441c000000b0054562cb3bcfmr10506542ywa.2.1682497779879; Wed, 26
 Apr 2023 01:29:39 -0700 (PDT)
Date:   Wed, 26 Apr 2023 17:29:12 +0900
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230426082923.132909-1-yunkec@google.com>
Subject: [PATCH v11 00/11] media: Implement UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunke Cao <yunkec@chromium.org>

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
6/11 is a cherry-pick for Hans' implementation of
V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
7/11 documents min/max for the rectangle control.
8/11 supports MIN/MAX in UVC.
9/11 implements ROI in UVC.
10/11 initializes ROI control to default value.
11/11 documents the changes.

Changelog since v9:
- Reordered patches, move MIN/MAX related patches (patch 6, 7, 8) before
  implementing ROI control in UVC. Clamping set current ROI value based on
  MIN/MAX values.
- Fixed some minor issues. Changelog in patches.
Changelog since v9:
- Rebased onto Linus' master branch.
- Fixed some minor issues. Changelog in patches.
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
  media: v4l2: document the usage of min/max for V4L2_CTRL_TYPE_RECT
  media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
  media: uvcvideo: implement UVC v1.5 ROI
  media: uvcvideo: initilaize ROI control to default value
  media: uvcvideo: document UVC v1.5 ROI

 .../userspace-api/media/drivers/uvcvideo.rst  |  64 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  15 +-
 .../media/v4l/vidioc-queryctrl.rst            |  11 +
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   5 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 drivers/media/usb/uvc/uvc_ctrl.c              | 702 ++++++++++++++----
 drivers/media/usb/uvc/uvc_v4l2.c              |  18 +-
 drivers/media/usb/uvc/uvcvideo.h              |  24 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 171 ++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  36 +-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |  13 +
 include/uapi/linux/v4l2-controls.h            |   9 +
 include/uapi/linux/videodev2.h                |   4 +
 17 files changed, 942 insertions(+), 204 deletions(-)

-- 
2.40.1.495.gc816e09b53d-goog

