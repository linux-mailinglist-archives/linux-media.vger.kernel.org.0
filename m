Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 301FC528664
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 16:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242089AbiEPOEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 10:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbiEPOEn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 10:04:43 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BB63A1AC
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:04:42 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 9-20020a250909000000b006484b89c979so13017058ybj.21
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=UZT3PAb4K7opjtaYevwRHrWwACR0HHIGMTbWh6Nhs7g=;
        b=UwdxVnA4s531zS18mMV4k7p1/npgPZew7dT0Q8OnmyJdHImxopb6WIVVk0nu0LN1b3
         7Yksn/wclZeAdn/lhuTirolsU3ZQCk/PPNFZGzF3tAi4XYeBdRZWpAO38lFNt0mfO26o
         0ZFeFhvYgYG7Pi3C2dwE/5VnIHDD8djJ5Zp+dQIFc4JW83Yr7DUwgklmtngho5yb3Igi
         w2bUGHeP7CaurpWFhu0lIjmfdttCnC1YrSRLY7QPah/Zzrl+HnlufGuCW0sScxuYh+g/
         aRZWXvUUN+BAeBCGSizH5FEVS/+Yn3jfHJnVgz9rmxXik3n9ga4/mYfjXo5FO5ehz+M4
         hreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=UZT3PAb4K7opjtaYevwRHrWwACR0HHIGMTbWh6Nhs7g=;
        b=OZaz7iPpF+KLnpcuUI+fnvk8wY+FA9TgLWk9qIBJOWDAkb+RLahvz5V8nKod9mdUEv
         SqGony0SAWwUemqRhkVaOw7cTQ9UeFJL8ETF/vUyhI069wvOG5xBiDAHKNoC7NHDyyaq
         3gRivMp85b7oDAic3ZZ3PGKZA1bnn/Ai+ueD1hX8IqHWlUcs8RiZQG+Mno4geOwbwlO9
         Ybw3BL2nlCQbVARJtpCsnfeJGgP8SOlTVtLhsxGElApKOtPGg0Aka0qOa0pYSG0P+s7v
         068C6KCNn0y6CmYgj6zD+Ge2A4rKuJ2CXot9vZ5zbQ96Blr2m5HR9Z9+oZeN+sco/iJH
         gAHw==
X-Gm-Message-State: AOAM531bwewLN1WDZb+cWe4LdlDw+4/O0DbR7G5fS1i1LLEJ1k0JR9GC
        L7JYtabsC7iE5TIQ+DuJngwAAuij+24=
X-Google-Smtp-Source: ABdhPJzF9fyxNi0TzUVC88umZsh7aRLg1BN2JTGE0s0/CuV9CRLSG9GHBAz3FkVbgr6CMAcwOuxttTihUR4=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:2bd1:4151:d530:8b73])
 (user=yunkec job=sendgmr) by 2002:a5b:c0e:0:b0:64d:d170:ee39 with SMTP id
 f14-20020a5b0c0e000000b0064dd170ee39mr2378372ybq.389.1652709881762; Mon, 16
 May 2022 07:04:41 -0700 (PDT)
Date:   Mon, 16 May 2022 23:04:28 +0900
Message-Id: <20220516140434.1871022-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v2 0/6] media: Implement UVC v1.5 ROI
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch set implements UVC v1.5 regioin of interest using V4L2
control API.

ROI control is consisted an auto control with type bitmask and a
rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.

V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.

A rectangle control is also added to the vivid test driver.

Tested on two different usb cameras using v4l2-ctl and calling ioctls.

Yunke Cao (6):
  media: v4l2_ctrl: Add region of interest rectangle control
  media: v4l2_ctrl: Add region of interest auto control
  media: v4l2_ctrl: Add V4L2_CTRL_WHICH_MIN/MAX_VAL
  media: uvcvideo: implement UVC v1.5 ROI
  media: uvcvideo: Initialize roi to default value
  media: vivid: Add a roi rectangle control

 .../userspace-api/media/drivers/uvcvideo.rst  |   1 +
 .../media/v4l/ext-ctrls-camera.rst            |  29 +++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  14 +-
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   4 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    |  34 +++
 drivers/media/usb/uvc/uvc_ctrl.c              | 213 ++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c              |  12 +-
 drivers/media/usb/uvc/uvcvideo.h              |  10 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 155 ++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   6 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  32 ++-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |   1 +
 include/uapi/linux/v4l2-controls.h            |  11 +
 include/uapi/linux/videodev2.h                |   4 +
 18 files changed, 532 insertions(+), 53 deletions(-)

-- 
2.36.0.550.gb090851708-goog

