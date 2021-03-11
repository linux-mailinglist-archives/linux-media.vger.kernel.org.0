Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE7A33801D
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 23:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbhCKWT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 17:19:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhCKWTz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 17:19:55 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5A9C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 14:19:55 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id dx17so49500859ejb.2
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 14:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmEJpwXpy96wPy0Wn2mPt1c7y2RKVHHDQGI/F3VWN68=;
        b=gvIijDMs3UNbfQbZICXSqwNVSd2+Okw4B5WlV7s5XKHyRlzO6sWOJNzMGEhjtDApwf
         DOSdTqKuzJYBCEPjaf4QgDFJGJ8KiQLOugnMB1tNaqyXvMg5hKR3W7U3skOaUUSRvfn5
         43kUK6F5T1kKg6T3GjVFBB19rr1xs62jBM9xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmEJpwXpy96wPy0Wn2mPt1c7y2RKVHHDQGI/F3VWN68=;
        b=UN0nNZqoz4QgARMBMtcjSuupCcwfRoTofbftjNCvYVsQlPVBz4U1vt15cV0MQaQffJ
         EEzZYFCXnDAicrDqxd0HfQCCTqchxrRmu8Ba9lTRzTCH9YZeuumojegnKomdjvzMdyVG
         pDz1L2fBLAsIDQs8scCte/G3cjyF8jZIOoPEd1apn2S72iD5Qcisf76AJ1A9arnpIg0K
         T5QylhBnTRmr//XhXZAfIJ/jhhbXkne2Sg63QeHNf/Qu1+5Jg6f3Dc+ZcCqDGs6/W5sU
         nlcBRR3D2RVZRNm77rru2HZBjlMltml2sxWTEzO1KYsyXqzkSLKaXwJtyhDWJlXwhmTk
         JzuQ==
X-Gm-Message-State: AOAM533tfHBiWGhAa+Wvvn+LTu7Hfo91zjo8txhSRyXdYfWRFzxye0uC
        g1SSOYzKqATthFCVLu9E5ibOAQ==
X-Google-Smtp-Source: ABdhPJxEiV0/8FTUyoH+2YuL5QVGZZj14u74Ix9DA0IrhToipBp5SgyEMm+tqcCXSSD26v8EtX5xGA==
X-Received: by 2002:a17:906:7c48:: with SMTP id g8mr5343178ejp.138.1615501194090;
        Thu, 11 Mar 2021 14:19:54 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b18sm1942174ejb.77.2021.03.11.14.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 14:19:53 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] uvcvideo: Fix v4l2-compliance errors
Date:   Thu, 11 Mar 2021 23:19:40 +0100
Message-Id: <20210311221946.1319924-1-ribalda@chromium.org>
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

Ricardo Ribalda (6):
  media: v4l2-ioctl: Fix check_ext_ctrls
  media: uvcvideo: Set capability in s_param
  media: uvcvideo: Return -EIO for control errors
  media: uvcvideo: set error_idx to count on EACCESS
  media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
  media: uvcvideo: Set a different name for the metadata entity

 drivers/media/usb/uvc/uvc_ctrl.c     | 90 ++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c   |  5 +-
 drivers/media/usb/uvc/uvc_v4l2.c     | 10 +++-
 drivers/media/usb/uvc/uvc_video.c    |  5 ++
 drivers/media/usb/uvc/uvcvideo.h     |  7 +++
 drivers/media/v4l2-core/v4l2-ioctl.c |  4 +-
 6 files changed, 116 insertions(+), 5 deletions(-)

-- 
2.31.0.rc2.261.g7f71774620-goog

