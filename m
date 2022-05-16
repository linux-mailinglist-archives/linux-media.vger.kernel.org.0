Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5A855280CE
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 11:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238117AbiEPJWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 05:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234290AbiEPJW3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 05:22:29 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E4725EB0
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 02:22:27 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id j11-20020a05690212cb00b006454988d225so12528680ybu.10
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=MAh7Ju2NrIJj6iXnBziiVDF0qkSYhZwtRrrSWnf+1Kc=;
        b=dab0ULoFCCuIN1lTj5BGLSnELZPZqAXIOuAn3xu0SEysC8lO5/DoOMqthb0wNjh6vG
         GlHX9bFk3o0Tv0my3rct3VfZG6afhJoFObl468oxQb1LSlF3nLu8ZX7OOYD+OmPlTT8t
         2IgnGO00+DudpG5TTWASYtbvLLnPH6JxgxrJe/vD5X2JN+8bUWthUihFawxWCkT8Q/MY
         QZl9jJlg7engwVuOrggs4BnldIhte3hrLmjkv3olaoqrx7emsueMta0KF6KhivLwWLnV
         Lg2ZubPjvMHXy/oIZtZ38qwQyl9AA5ehKxfcIRQIawpPF4dvt3ZTrpnFwn8vshMUILCB
         xDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=MAh7Ju2NrIJj6iXnBziiVDF0qkSYhZwtRrrSWnf+1Kc=;
        b=S6A1bPCStxnLkazVB2zo+wCnElRQXm4T/gx2UgNdDlgYm9PoPq78BWA8IdlCeDrysx
         iqNfUA6rRup1OQIGaHdDaWJKRH7h7eJ4xOetrTOLarDgVtHtrMb5d9TuRmQfjOU4GtQ1
         VT1w9I9k0RVP6iaOQpiJiTyTsSypssnPqt7LfXUY7AzfdChHl6op7hTL3H4eZD57kBV8
         xSwh+ZFSpPvMbfuRxF03iR8eMewO5LZnqQvQ35ZALyjWdkBzz5YfiTeutCL6aBjJy3hg
         NobZuVTcaBjfsKGehx5SNKQjKUqInlsQVt7Mm/LzepHPhstVqRxAwCsqsxZqlPuOTvfo
         mjSQ==
X-Gm-Message-State: AOAM533DVby/gtIz//eyDimuZp/KlzpBbhJ8NUoyH0WFxpEoKBtBMSOU
        EUll43wcT/DMeAI5mfYr3BkpYTJNC/c=
X-Google-Smtp-Source: ABdhPJz/FG43eWgzl6/eu6+bDSRgDcYFrfhGPaOYALnBSmZv2JQYJk2gxYvXrsLIruzSxou9b/4/9NgwbBs=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:2bd1:4151:d530:8b73])
 (user=yunkec job=sendgmr) by 2002:a81:2008:0:b0:2f8:3968:e70a with SMTP id
 g8-20020a812008000000b002f83968e70amr19187093ywg.321.1652692946763; Mon, 16
 May 2022 02:22:26 -0700 (PDT)
Date:   Mon, 16 May 2022 18:22:03 +0900
Message-Id: <20220516092209.1801656-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v1 0/6] media: Implement UVC v1.5 ROI
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
 drivers/media/usb/uvc/uvc_ctrl.c              | 212 ++++++++++++++++--
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
 18 files changed, 531 insertions(+), 53 deletions(-)

-- 
2.36.0.550.gb090851708-goog

