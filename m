Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400CA338D6D
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 13:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbhCLMtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 07:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbhCLMse (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 07:48:34 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BCBC061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:48:34 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id y6so7755475eds.1
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lj7q7tEWKTCMfgaXxTFWVmPcIkg2nm6V2yaP1LDvpB4=;
        b=fckJQiQRzbx2nIfl0GkMgp2/+ZpoWngEbKvCjLRRqGtQS8JhdibQrTju3XyhrG5/PB
         Bc/uifXMvCG2oNKUvUPTeb93ls5MnkJc7vQl8CF2dL/rGNGXxs8RLfWn4bGXUwzj4aFV
         Q/5h7gXfq8NaW3FenVIdlWVn4VIul3Eu9Ywhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lj7q7tEWKTCMfgaXxTFWVmPcIkg2nm6V2yaP1LDvpB4=;
        b=TyYIEZrbo+qm3TTJzbgBmCJBqHXLLsaoj4faCoiJgdBnfmK9kAfVmewCFTsNP/+ivr
         sSSvHEa8q7Z2p84pJsYFpDb87T2snTfIMCSBFOSCcIfhtfV+aFhJGVYEpMvCww1/7BUY
         5oKx4tk1oM6FNMBXu5m4T+a6ZHWqesut5D/vEJoOsbuKukGDUvdmiFt96izLDEomKWT+
         4+HmkITTo9GxvmLQc410VaBxkwwEj+7wvvf0e43wkbjyXz2EqMxviAbD4RMzAiGlpLfd
         xblitzFvmfbuEt9YN0RwwsxHzCTmWOSWN/S8hiVKPwH2eg3HhrzU4HAlIx6mEh45Z4hq
         cRtQ==
X-Gm-Message-State: AOAM53173IaMxiGoKgXKSyQ13AcJEu+/EeeuJV4uNpmd1DWskkZgREUD
        O3PK5hdMzx0PUBCn3gycSD+z7A==
X-Google-Smtp-Source: ABdhPJxHpE0wOkr/j/CzksRzYi+Ig31z/GzcrhLPewHpCsyjpwZuC+8uumea9MLXmQKh6x2wP20s9g==
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr14030016edd.103.1615553313143;
        Fri, 12 Mar 2021 04:48:33 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t6sm2924402edq.48.2021.03.12.04.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 04:48:32 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/8] Fix v4l2-compliance errors
Date:   Fri, 12 Mar 2021 13:48:22 +0100
Message-Id: <20210312124830.1344255-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In my computer I am getting this output for

v4l2-compliance -m /dev/media0 -a -f
Total for uvcvideo device /dev/media0: 8, Succeeded: 6, Failed: 2, Warnings: 0
Total for uvcvideo device /dev/video0: 54, Succeeded: 50, Failed: 4, Warnings: 2
Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 102,
Failed: 6, Warnings: 2

After fixing all of them we go down to:

Total for uvcvideo device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
Total for uvcvideo device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 9
Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 108,
Failed: 0, Warnings: 9

We are still not compliant with v4l2-compliance -s:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
                fail: v4l2-test-buffers.cpp(1265):
node->streamon(q.g_type()) != EINVAL
        test MMAP (no poll): FAIL
                fail: v4l2-test-buffers.cpp(1265):
node->streamon(q.g_type()) != EINVAL
        test MMAP (select): FAIL
                fail: v4l2-test-buffers.cpp(1265):
node->streamon(q.g_type()) != EINVAL
        test MMAP (epoll): FAIL

But fixing that will probably require a lot of changes in the driver
that are already implemented in the vb2 helpers. It is better to
continue Hans work on that:
https://git.linuxtv.org/hverkuil/media_tree.git/commit/?h=uvc-4.19&id=a6a0a05f643521d29a4c1e551b0be73ce66b7108

Changelog v2 (Thanks to Hans and Laurent)

- Reimplement the CTRL_CLASS as a patch on queryctl
- Do not return -EIO for case 8
- Handle request bug and which_def multiclass in core

Hans Verkuil (1):
  uvc: use vb2 ioctl and fop helpers

Ricardo Ribalda (7):
  media: v4l2-ioctl: Fix check_ext_ctrls
  media: uvcvideo: Set capability in s_param
  media: uvcvideo: Return -EIO for control errors
  media: uvcvideo: set error_idx to count on EACCESS
  media: uvcvideo: refactor __uvc_ctrl_add_mapping
  media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
  media: uvcvideo: Set a different name for the metadata entity

 drivers/media/usb/uvc/uvc_ctrl.c     | 137 +++++++++++--
 drivers/media/usb/uvc/uvc_driver.c   |  36 +++-
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 131 -------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 280 +++------------------------
 drivers/media/usb/uvc/uvc_video.c    |   5 +
 drivers/media/usb/uvc/uvcvideo.h     |  34 +---
 drivers/media/v4l2-core/v4l2-ioctl.c |  25 ++-
 8 files changed, 206 insertions(+), 450 deletions(-)

-- 
2.31.0.rc2.261.g7f71774620-goog

