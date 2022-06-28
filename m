Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A23B55CE85
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242948AbiF1H5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 03:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243712AbiF1H50 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 03:57:26 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D8A1B786
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:25 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-317765eb7ccso97827527b3.13
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=4cS0V6zPUcG0dtGWhSVjGZTgbzblPxHVzGk2natZUFI=;
        b=mCr1guAA7+0qR6WgmVGqFlqC7+kbsnpKXRkP7yKzxBqunhHncTpQZ7Jim5OQofW5pd
         vlbOXkMDWOXP0CDMW5DcWS5RjaUNyhDB4HXUatRgp9GkOCxPZQQpIDVNLBwi6tkgdjuQ
         yv4PfwtwzGr4CHe7JGeOUeHa4NTnLaLxy47gZ6yfL0nduJmhqf2eMJJcb/+YDybsxDO2
         sa8w7uYEP6RCM4eclN11U5jlMqkj3PBmt4rUAsJ8QbQhN84TGchnu8/Xpl/CzESpLovu
         1Zu50YZMVf2VtqagheC9dWRtqNvXEXxbFGTSJgm5FrVeHYq+QwpulurC0dJskQuQPF7N
         gIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=4cS0V6zPUcG0dtGWhSVjGZTgbzblPxHVzGk2natZUFI=;
        b=gIIHYAwPdIv7fqYzKNWcLeIFj2WqRmiyDMUrVGElC3WR7bqRjLfWvpr90Av/MmkjWA
         CCXe1YHOWTPvIt+ZHCX6nmH8CaRqcUrX6gM92xOUB2Ewc/QjS7PxC2e+a8pIEF7DYUko
         G+UsdgzOFGNcG19XndJXQQSsOOK5cYnAVIRsqCdX6YLYGckeMdfTqvrx+VvOWtTnlqoU
         zP0pKddHkcxy2X+m/b9g46K711Pd02IWNHFuOLImCzOsJqPsXzxN1x9eC8dheJpXzeJl
         l8tHphJMMCGyXcKnOsu3H2QJ7HNHP9Ntuqho1wbDJlbfL9F1pdcZighgdYXtzNbHzMZJ
         t5bw==
X-Gm-Message-State: AJIora/LEcojvD5lqz+VfoRXxmsFcHj2XeU0l00G7HoWR7+71mUuF22O
        Q0ObvcBZl2WDCpJbp8zN0pL1BHeMtVM=
X-Google-Smtp-Source: AGRyM1vvZlVbUex4RjKMJHbBm3R9RSWTfZEJf34K2m64FYSQL3TcC/t1di6JajL3fGxgqdMRLQpJVkH8Y9A=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:983d:14d6:e059:135f])
 (user=yunkec job=sendgmr) by 2002:a25:428e:0:b0:66c:9ca8:565f with SMTP id
 p136-20020a25428e000000b0066c9ca8565fmr14075842yba.650.1656403044290; Tue, 28
 Jun 2022 00:57:24 -0700 (PDT)
Date:   Tue, 28 Jun 2022 16:56:58 +0900
Message-Id: <20220628075705.2278044-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v7 0/7] media: Implement UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
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

Tested on two different usb cameras using v4l2-compliance, v4l2-ctl
and calling ioctls.

1/7 add V4L2_CTRL_TYPE_RECT.
2/7 and 3/7 support compound types in UVC.
4/7 implement ROI in UVC.
5/7 is a cherry-pick for Hans' implementation of
V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
6/7 support MIN/MAX in UVC.
7/7 document the changes.

Changelog since v6:
-Add patch 2 and 3 to support compound types properly in UVC and
implement ROI on top of them.
-Reorder the patches.

Changelog since v5:
-Add a __uvc_ctrl_get_p_rect_to_user instead of modifying
 __uvc_ctrl_get.
-Support V4L2_CTRL_FLAG_NEXT_COMPOUND correctly.
-Fix formats.

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

Hans Verkuil (1):
  v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Yunke Cao (6):
  media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
  media: uvcvideo: add uvc_ctrl_get_fixed for getting default value
  media: uvcvideo: Add support for compound controls
  media: uvcvideo: implement UVC v1.5 ROI
  media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
  media: uvcvideo: document UVC v1.5 ROI

 .../userspace-api/media/drivers/uvcvideo.rst  |  61 +++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  11 +-
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   5 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   4 +
 drivers/media/usb/uvc/uvc_ctrl.c              | 479 ++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c              |  20 +-
 drivers/media/usb/uvc/uvcvideo.h              |  14 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 155 +++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  34 +-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |  13 +
 include/uapi/linux/v4l2-controls.h            |   8 +
 include/uapi/linux/videodev2.h                |   4 +
 16 files changed, 788 insertions(+), 79 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

