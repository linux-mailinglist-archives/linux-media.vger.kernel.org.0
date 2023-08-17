Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC98D77F10C
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348418AbjHQHSY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348379AbjHQHR7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 03:17:59 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EAF272B
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:17:58 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-583312344e7so98411747b3.1
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692256678; x=1692861478;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tdPz/seJWqaHRmdkr9LsU5bHxyPcOGPwE6Ge6TgVOvU=;
        b=Jlz38pPdnswDNOBXIHfuJfiopZ79u0M7lB1xbVnOEmB9ratcGXy2y8BWrvb4MfbzDZ
         225Kl8P1xXx4V9Yd9u4eoF2mr10/fwwJrNuwgPoJNPQLqihrm08axS41x8C4rl/wH2RT
         uKBEhysPxBLkzhiUk0F30c6J/82FEKO9lA7EFuH18Q/dzEgVTpzyJv21XWAXcCtsOZoC
         8tlfPaLqUhzYBgm+aJ50zVQ50u8GPTqNfw7/8mR9CiBmhBFEm4mzEEi+0vjz1Lt6CyI/
         x2jyEszlptFG4k2sJcmQp9gX3tsnXlThBrmMqj7IvZJEjVJ3wQYwF+243pp9Iw6801kV
         dtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256678; x=1692861478;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdPz/seJWqaHRmdkr9LsU5bHxyPcOGPwE6Ge6TgVOvU=;
        b=bsn5/6r+MkWQEXQl438mae+z5Kz3uD/xc38FoV92PUSOu+KwG6iBbSguy9zQ8fa4aa
         jN1wa54hvcRxwoxGSvLtxdeDD48z3lRCHzPjIEIE+YOeHNbmy5Cw2x3oiXV3QcJdMksk
         ArdANGjVqLtBizg955ALzl1mZjibM/UB1+FtLYlDdZ52DavOKfg28sXwBeNvXpVBR/gk
         40AdfdoWP00Ecs/joLQlSBxkPd6MkW3q7w/fYvJelLpdkSRWJvKTdiYAvSI/1MuFGG9H
         j5ZqFTlmesJqfsgvLmw7K7JiYPwH78QUpXgv9vm1YiMZQDRKklIwTaFTYPm4m8SiEFEE
         VV2A==
X-Gm-Message-State: AOJu0Yxi4TUFzz5pETovYXIr1qf2uph7ecaC+ZTcXwMWTkOcdKIkr9f0
        8BK2/tIVPdl0DVIri1tniDoCQCP2rFM=
X-Google-Smtp-Source: AGHT+IFhvWanAqJAzxiuYusgRs4gzcBxd55ROitLntraTb07/Wrd7PMEK5Vb4EmqnhQtnUfrw6uBlplg160=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a81:b666:0:b0:583:591d:3d6c with SMTP id
 h38-20020a81b666000000b00583591d3d6cmr54453ywk.0.1692256677770; Thu, 17 Aug
 2023 00:17:57 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:17:28 +0900
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817071750.2830271-1-yunkec@google.com>
Subject: [PATCH v12 00/11] Implement UVC v1.5 ROI
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
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

A patchset in v4l-utils will be sent separately.

Tested with v4l2-compliance, v4l2-ctl, calling ioctls on usb cameras and
VIVID with a newly added V4L2_CTRL_TYPE_RECT control.

1/11 adds V4L2_CTRL_TYPE_RECT.
2/11, 3/11, 4/11 refactors uvc_ctrl.c.
5/11 adds support for compound controls.
6/11 is a cherry-pick for Hans' implementation of
V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
7/11 addes the rectangle control in VIVID.
8/11 supports MIN/MAX in UVC.
9/11 implements ROI in UVC.
10/11 initializes ROI control to default value.
11/11 documents the ROI changes.

Changes since v11
- Git rid of media: v4l2: document the usage of min/max for V4L2_CTRL_TYPE_RECT.
- Added a rectangle control in VIVID.
- Addressed comments in 6/11, details in patch.

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
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  20 +-
 .../media/v4l/vidioc-queryctrl.rst            |  14 +
 .../media/videodev2.h.rst.exceptions          |   4 +
 drivers/media/i2c/imx214.c                    |   5 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    |  34 +
 drivers/media/usb/uvc/uvc_ctrl.c              | 721 ++++++++++++++----
 drivers/media/usb/uvc/uvc_v4l2.c              |  18 +-
 drivers/media/usb/uvc/uvcvideo.h              |  24 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 176 ++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  36 +-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |  13 +
 include/uapi/linux/v4l2-controls.h            |   9 +
 include/uapi/linux/videodev2.h                |   5 +
 18 files changed, 1001 insertions(+), 210 deletions(-)

-- 
2.41.0.694.ge786442a9b-goog

