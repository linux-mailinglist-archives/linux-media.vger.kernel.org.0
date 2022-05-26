Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEFD6534A1C
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 07:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244693AbiEZFHz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 01:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiEZFHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 01:07:54 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363F9BA563
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 22:07:53 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2d7eaa730d9so4587047b3.13
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 22:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=qRgyhN4y0sO1triSirLxJWkdDqe4Q2UN3RuFegaPcbs=;
        b=k6Z7X9KVdhIv5qqj+rkfKHyfRpW7mGv1rvsEHv66dJpd1bZ4aE9dNkFnjIellfyw61
         /M9JdXly8LMCfOOrk99X/X6Z00Ne9/wF2jiqbkqW+VhjoY816hPP+I2RVDq5y9yOynX2
         bqrVNKwzzgqQclDQ4PTpT7bS6+9Ta5I7/H1wyvVGIRC1ZaVnRX/j7iWKDt0SHgnukJis
         Z/01H1VGOxGe+IlxRBsyGLjQ1DWzH0syhxgYNWEvqnKGXaSx+TKNECh6ACPWVt4mdRX6
         okVYRKObsff9B722s7rNZX2k2+nL4ZeEykcdgAGLY3ejbeGXh0H6rJc9ytWXBAyUpMTM
         PdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=qRgyhN4y0sO1triSirLxJWkdDqe4Q2UN3RuFegaPcbs=;
        b=DAEDwqZYxkRyKVxt/NWItOr/HkqJmCR9BycPac28dMUb9lalp7pkWXdoZaWHb4yyD7
         mnuLEf2kprcla76gxnAK+h2ElxuxiZNT31HRnCzyb5FDqZjO18yonywxuPxnlGtAW9yV
         MQhMb0hDJcC6Yw24fmFUfNAN7eDBAswQde0g3SKAjKQlCUkhN7cSPBv7iuDBTVCNmXxJ
         RTgm+O8CKHLInKQPB8oMg8ys900H8Gt9s8bLENyowsA+yKRjp7nhD6an+BLqCPGEJl/L
         JaipVo0cxdDD9CQOCtMfgG+acBNXUpL7RonZOIqAAXhDpd32+Eti3yPD6UAfslnrC5vu
         HEBQ==
X-Gm-Message-State: AOAM530DnVtJGfmZMQBoUMFMYX9iwBFmtd/tBgZxjhGPcKnECcLJLbYw
        LYX+G2AmyOD9JsonbxLvLuzkQfWs1P0=
X-Google-Smtp-Source: ABdhPJz1L/pZPpRRBUS4dxXcEa7FCbJtopc5om3FC/ym4E4bI2VaswD4yghnWOS4/kqFXnAl0WmzIbmiBQ4=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:9e5b:ab60:68b2:d628])
 (user=yunkec job=sendgmr) by 2002:a81:ed4:0:b0:2fe:e028:ac5f with SMTP id
 203-20020a810ed4000000b002fee028ac5fmr35485487ywo.400.1653541672432; Wed, 25
 May 2022 22:07:52 -0700 (PDT)
Date:   Thu, 26 May 2022 14:07:39 +0900
Message-Id: <20220526050744.2431518-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH v5 0/5] media: Implement UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
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

This patch set implements UVC v1.5 region of interest using V4L2
control API.

ROI control is consisted two uvc specific controls.
1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
2. An auto control with type bitmask.

V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.

Tested on two different usb cameras using v4l2-ctl and calling ioctls.

Changelog since v4:
-Cherry-pick the original patch
 "v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL".
-Split patch "media: uvcvideo: implement UVC v1.5 ROI" into two patches.
 The codes for supporting min/max in uvc are in patch 4/5 now.
-Minor fixes. Detailed changelog in patches
Changelog since v3:
- Reordered/sliced the patches.
  1. Add rect type.
  2. Add min/max.
  3. Add the roi controls (including init to default).
  4. Document the roi controls.
- Define the roi controls as uvc-specific in uvcvideo.h.
- Modified documentation.
- Removed the vivid change. Given the controls are now uvc-specific.
  I'm not sure how valuable it is to add it in vivid. Let me know
  otherwise.

*** BLURB HERE ***

Hans Verkuil (1):
  v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Yunke Cao (4):
  media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
  media: uvcvideo: implement UVC v1.5 ROI
  media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
  media: uvcvideo: document UVC v1.5 ROI

 .../userspace-api/media/drivers/uvcvideo.rst  |  61 +++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  11 +-
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   5 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   4 +
 drivers/media/usb/uvc/uvc_ctrl.c              | 217 ++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c              |  12 +-
 drivers/media/usb/uvc/uvcvideo.h              |  10 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 +++-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 155 ++++++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  34 ++-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |  13 ++
 include/uapi/linux/v4l2-controls.h            |   8 +
 include/uapi/linux/videodev2.h                |   4 +
 16 files changed, 540 insertions(+), 53 deletions(-)

-- 
2.36.1.124.g0e6072fb45-goog

