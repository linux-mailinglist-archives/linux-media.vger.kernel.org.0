Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B687F5F04F2
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 08:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbiI3GlJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 02:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiI3GlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 02:41:08 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D0827FDF
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:05 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 189-20020a2516c6000000b006bbbcc3dd9bso3075443ybw.15
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=ILzMj/J4nia5UE47hXmz/B5F5iCaFpwvX8EOe6Wkx5M=;
        b=cFwUin5FtAWrfHDZBEtYOoDpoy62MCkY66JWxlDT1/dAdjo/zM+uLjLiy0PIJvpHP0
         ie6+zNmbMNbv32qLWZXpMgflJEVWqwqtXSS7Fw2R4gPucoG0AdA+FU3EjHxFsv+xHG8P
         MYrlYH3LPg3b+v94IfQQxYILdpBN+SUHD0RZTJS7W2gb3AffKtL1eF422KSVFycIzFR3
         hTO9lrMbgjt14GFIdBRl89Q3WH43qoOLv56HL2nyYABploXuLn3JH6FkP7rTWi6mmhQM
         7u/NAtfIoSdhYnSAyDYmlzmgNFVMRbL0C2eMbmO9xznel/GxSnHplS3/Y5qVLbWd6Anb
         A2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=ILzMj/J4nia5UE47hXmz/B5F5iCaFpwvX8EOe6Wkx5M=;
        b=gLCR9KxPaHAI9frFsc1nVXgIPPPPVgXlsZFaELUhGZkJFKH/FuoayTv/rk3L1rdTLe
         OoJQHhRGRAjBIHhMIzgLG624mpyiJhY7WieojjMeAIRm3EXR5ZjZo/RghuWzp10sb/RW
         5zKxdcYJAwhEbaq7Cs538vHypi1DFYXQNmGAlBFc0ycbpIOV+5svGEcVPy1dyYdOpdG8
         XcJU337j5NlGvjcn6y68SWKI2lWEE0HvPDdSts713UVoSr4b/GT8HC1HhZ6DW7F66MFN
         WSUQjlkFt8QTci6n87mWwvUtvnpnvshglcvOmeRxL5R4VhCS2McTwky7tTTEUDeGJMH/
         pWZA==
X-Gm-Message-State: ACrzQf3w5OrPdJZ1cz7K7C9Zl2fB6m6Wq8UuNwhZQLMIOI/dCeGKzrce
        8WzM8/7SRC3aMOMCxH/L7rOSRJ/sB30=
X-Google-Smtp-Source: AMsMyM7QHXn49u8NmkP6UtK7F8gH44oplJjQAwp9q4nwXWdUy2fgWFCDPidMBkZ3TE2OPzhw6mewWu4ZrU8=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d86:8b01:88ae:86c1])
 (user=yunkec job=sendgmr) by 2002:a0d:e744:0:b0:34c:e2b1:950d with SMTP id
 q65-20020a0de744000000b0034ce2b1950dmr7483675ywe.56.1664520064809; Thu, 29
 Sep 2022 23:41:04 -0700 (PDT)
Date:   Fri, 30 Sep 2022 15:40:49 +0900
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20220930064059.3633710-1-yunkec@google.com>
Subject: [PATCH v8 00/10] media: Implement UVC v1.5 ROI
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

This patch set implements UVC v1.5 region of interest using V4L2
control API.

ROI control is consisted two uvc specific controls.
1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
2. An auto control with type bitmask.

V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.

Tested on two different usb cameras using v4l2-compliance, v4l2-ctl
and calling ioctls.

1/10 adds V4L2_CTRL_TYPE_RECT.
2/10, 3/10, 4/10 refactors uvc_ctrl.c.
5/10 adds support for compound controls.
6/10 implements ROI in UVC.
7/10 initializes ROI control to default value.
8/10 is a cherry-pick for Hans' implementation of
V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
9/10 supports MIN/MAX in UVC.
10/10 documents the changes.

Changelog since v7:
- Rebased onto media-stage master.
- Move the factoring logic from 5/10 to 2/10 and 3/10 (new patch in v8).
- In patch 4/10, split uvc_control_mapping.size to v4l2 and data size.
- Move initializing ROI control from 5/10 into its own patch 7/10.
- Address some comments. Changelogs are in patches.

Hans Verkuil (1):
  v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Yunke Cao (9):
  media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
  media: uvcvideo: add uvc_ctrl_get_boundary for getting default value
  media: uvcvideo: introduce __uvc_ctrl_get_std()
  media: uvcvideo: Split uvc_control_mapping.size to v4l2 and data size
  media: uvcvideo: Add support for compound controls
  media: uvcvideo: implement UVC v1.5 ROI
  media: uvcvideo: initilaize ROI control to default value
  media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
  media: uvcvideo: document UVC v1.5 ROI

 .../userspace-api/media/drivers/uvcvideo.rst  |  64 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  13 +-
 .../media/v4l/vidioc-queryctrl.rst            |   7 +
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   5 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 drivers/media/usb/uvc/uvc_ctrl.c              | 676 ++++++++++++++----
 drivers/media/usb/uvc/uvc_driver.c            |   2 +-
 drivers/media/usb/uvc/uvc_v4l2.c              |  22 +-
 drivers/media/usb/uvc/uvcvideo.h              |  23 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 166 ++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  36 +-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |  13 +
 include/uapi/linux/v4l2-controls.h            |   9 +
 include/uapi/linux/videodev2.h                |   4 +
 18 files changed, 926 insertions(+), 188 deletions(-)

-- 
2.38.0.rc1.362.ged0d419d3c-goog

