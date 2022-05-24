Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A591B532244
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 06:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbiEXEpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 00:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234482AbiEXEpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 00:45:17 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCF98BD36
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 21:45:16 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id y85-20020a253258000000b0064eaa00a2cbso13925204yby.2
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 21:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=eBiu4dXdYI9CMfkK+Fyb/3URqCtkbOx72WawwlqeE5c=;
        b=iFMKUTxlNTltmWwxWSuryLK4rf0nrFD5zxgxTMJ302lYXkzJNQzjLWHE6P/3xBta33
         m+MuZJDu0i2i/Ml2f0mcBAcHjG4Q5GeUP/a85sIruzHRsU5jXBXVJjBm89IClD+BMi54
         aga/2Y8a/19oyhPad3WpJ7XEEP1KzY6TORN7bwiMz2fZvwokwxIKFQn/zo8dZ9GFZu4D
         mw7rP+UKEAjev3umWkrt/tsOzByP8KQp7LFA8U7I+SA2IfLMRjmyhG7fnOLPK0qwGCha
         K2IKEjoSBCsN6FZOtJm7AXqenzDFvIxPGPi9Qi+dQJ2ET0+ALrguSB5JVTj82OnjWrlD
         /f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=eBiu4dXdYI9CMfkK+Fyb/3URqCtkbOx72WawwlqeE5c=;
        b=y/zu6a/XwPts4x1Xkehd3gb8/qNQpQpwwKkCh5fR6gqWyBI9f9rX4yCfY+yEG8Lusy
         De/8MMfX0nRGqr3CaSu3q1FMO7+U+PundNM+ZVnaD6i0bil2IEFvcPD7iXwKUz2bJt14
         zEszvQZ6Ji7m5lHeoVngJnEqx9FW5REI/DQx3K8jJmwXnpV9jZv552qRu9tbZyRS5ANX
         KQVIh1CulnUUgQF4/AitZoZKEFBUESuSFgJGegzVtsBCEPt3O2/5dJQybYR717QxqZz0
         aV0OKejN6+0FCNjVZdtXndb1zt7b0rV+3s2ZgEqCkxwuEj0qktrR7m71sEkyqcQOBWXV
         zfyw==
X-Gm-Message-State: AOAM531wCLeLSH48S7B/fuvshrmlh5MeEBzYjtSnt1c3VIhWwCYZFGuP
        OzRlNC50o7WSmKN7ga30iPquJWmCLkw=
X-Google-Smtp-Source: ABdhPJz0+Y9WflKUIuBgWWArqqbmg5WM0F3jdLyfo62if4mEi7TOYethJ6FMO8JaD0lyS/6DMNKfh2FNMMo=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7145:c41f:bdd2:acc])
 (user=yunkec job=sendgmr) by 2002:a05:6902:124e:b0:634:619e:4114 with SMTP id
 t14-20020a056902124e00b00634619e4114mr25179043ybu.181.1653367515656; Mon, 23
 May 2022 21:45:15 -0700 (PDT)
Date:   Tue, 24 May 2022 13:45:03 +0900
Message-Id: <20220524044507.1696012-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH v4 0/4] media: Implement UVC v1.5 ROI
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

Yunke Cao (4):
  media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
  media: v4l2_ctrl: Add V4L2_CTRL_WHICH_MIN/MAX_VAL
  media: uvcvideo: implement UVC v1.5 ROI
  media: uvcvideo: document UVC v1.5 ROI

 .../userspace-api/media/drivers/uvcvideo.rst  |  60 +++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  12 +-
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   4 +-
 drivers/media/usb/uvc/uvc_ctrl.c              | 214 ++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c              |  12 +-
 drivers/media/usb/uvc/uvcvideo.h              |  10 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 155 ++++++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  32 ++-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |  13 ++
 include/uapi/linux/v4l2-controls.h            |   8 +
 include/uapi/linux/videodev2.h                |   4 +
 15 files changed, 531 insertions(+), 52 deletions(-)

-- 
2.36.1.124.g0e6072fb45-goog

