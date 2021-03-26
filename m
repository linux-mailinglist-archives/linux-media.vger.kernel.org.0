Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B6F34A509
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 10:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhCZJ6x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhCZJ6p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:45 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40338C0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:45 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id u21so7437894ejo.13
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tjQTtHVhiMLOKDkirjBwOrBbAr7RuF9oo6N4dkwJrD4=;
        b=DoTEkH3mGM3eg1OgpTZxL88d2VqbLDGm35xDcOrUh9iR/7hIdtgDEJu3oCMOOQIAMr
         xgDaplhpXpI1b7w7XjdFqomJddjMLyAUHY2LhFtUqZ7di3KhCcMOdcCEH3s9UnYNSLa7
         Tb+S3h/QScQBpxpWuV8D2KSJQzv290mHAeKgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tjQTtHVhiMLOKDkirjBwOrBbAr7RuF9oo6N4dkwJrD4=;
        b=OnBxEewuV/D2nIZwUjPez6q6kAWqEXO3MKJN14WMU3nzGPgun5ywxR+IbEmYYzJ/sM
         1HleXtipXq9sSLreGd97h/HTwVS2i3GdkAnbOMPk9aA8XoRwxaa9BEpwQOfQ26NqpyHs
         Hp5XyQC1bdsP0H/mtVlW2gBeiGInTtST0oqZxq7brMwQtCtre+piurYVviqb89va2Ppf
         bzuQv7epQ3XimakuhugK0iHKr3Ocl3USgtvcsWr/cIF6n+cxY8w40+icBmco5V8B2GPk
         /OajWYtyAIxEHYUOEtmTLgQrSO+A4Q/mWGuJJPvH/Qs3iDqnUFv6xc5s3qgghqO0dF5C
         zCTw==
X-Gm-Message-State: AOAM5308R3i/gBFXwvlo5ouXm0aixH7rysPuGFuI6HFQswDtCS18tUIc
        ccHeT4w0orRUxxBI16pUCb94KA==
X-Google-Smtp-Source: ABdhPJyaW92TsvrmmUc4oFjWTuBqvsVQF5Y8E0bUgtqrY0WSWE0Z0kRtEsgvufFFzHKb7wi0MmluFA==
X-Received: by 2002:a17:906:2404:: with SMTP id z4mr14016161eja.14.1616752723903;
        Fri, 26 Mar 2021 02:58:43 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:43 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v9 00/22] uvcvideo: Fix v4l2-compliance errors
Date:   Fri, 26 Mar 2021 10:58:18 +0100
Message-Id: <20210326095840.364424-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

*v4l2-compliance -m /dev/media0 -a -f
Total for uvcvideo device /dev/media0: 8, Succeeded: 6, Failed: 2, Warnings: 0
Total for uvcvideo device /dev/video0: 54, Succeeded: 50, Failed: 4, Warnings: 2
Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 102,
Failed: 6, Warnings: 2

After fixing all of them we go down to:

Total for uvcvideo device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
Total for uvcvideo device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 108,
Failed: 0, Warnings: 0

YES, NO MORE WARNINGS :)

Note that we depend on:

https://patchwork.linuxtv.org/project/linux-media/patch/20210317143453.483470-1-ribalda@chromium.org/

With Hans patch we can also pass v4l2-compliance -s.

Changelog from v8 (Thanks to Hans)
- 3 patches from Hans
- Add Reviewed-by

Hans Verkuil (4):
  uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
  uvcvideo: improve error handling in uvc_query_ctrl()
  uvcvideo: don't spam the log in uvc_ctrl_restore_values()
  uvc: use vb2 ioctl and fop helpers

Ricardo Ribalda (18):
  media: v4l2-ioctl: Fix check_ext_ctrls
  media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
  media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
  media: v4l2-ioctl: S_CTRL output the right value
  media: uvcvideo: Remove s_ctrl and g_ctrl
  media: uvcvideo: Set capability in s_param
  media: uvcvideo: Return -EIO for control errors
  media: uvcvideo: refactor __uvc_ctrl_add_mapping
  media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
  media: uvcvideo: Use dev->name for querycap()
  media: uvcvideo: Set unique vdev name based in type
  media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
  media: uvcvideo: Use control names from framework
  media: uvcvideo: Check controls flags before accessing them
  media: uvcvideo: Set error_idx during ctrl_commit errors
  media: uvcvideo: Return -EACCES to inactive controls
  media: docs: Document the behaviour of uvcdriver
  media: uvcvideo: Downgrade control error messages

 .../userspace-api/media/v4l/vidioc-g-ctrl.rst |   5 +
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   5 +
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c      |   4 -
 drivers/media/usb/uvc/uvc_ctrl.c              | 343 +++++++++++----
 drivers/media/usb/uvc/uvc_driver.c            |  22 +-
 drivers/media/usb/uvc/uvc_metadata.c          |  10 +-
 drivers/media/usb/uvc/uvc_queue.c             | 143 -------
 drivers/media/usb/uvc/uvc_v4l2.c              | 389 +++---------------
 drivers/media/usb/uvc/uvc_video.c             |  51 ++-
 drivers/media/usb/uvc/uvcvideo.h              |  54 +--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  67 +--
 11 files changed, 444 insertions(+), 649 deletions(-)

-- 
2.31.0.291.g576ba9dcdaf-goog

