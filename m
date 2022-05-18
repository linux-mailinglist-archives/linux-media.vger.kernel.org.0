Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 219B752B249
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 08:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbiERGYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 02:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiERGYb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 02:24:31 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D806CFE03
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 23:24:30 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id v140-20020a252f92000000b0064d955c7b4eso1046460ybv.18
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 23:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Xzrbq/QRbvTckO/BgNy9D4JsGbzA3gNJNXqXX8S5Bv0=;
        b=YW/zRioo9A2r/z9GtSsMEBuNNUwapGnmagXriuMHcZqX38QJDSaXPWVeU/t+gDh5Xs
         3+czAmmZCPDxwjRqtKpRCBDnYCjupfhHt9umItY99i830uaaG7WaLgKe+9ywNg3d4A7K
         juj2mQtEE29UHgomLSJR7THw0HIgGGmdxQwtOTjcBf+YYkBc/P5BufXjEy2uHaCnaS9d
         /lNo0ykeCZmzKC0OuIgJ8zxnUf0EnFD8Pr7r53vOzBVJIMfIvfdCnMOGrq2r9/eOCl/h
         BZ9VqaDN7MLHtJ62XF/cvSgNZDVUfp7WP42dxXMerMG/fX9jCodVWwO3lsH7uwivebxP
         keYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Xzrbq/QRbvTckO/BgNy9D4JsGbzA3gNJNXqXX8S5Bv0=;
        b=IbupCIKjq4fM/dpXrFjMW00uvweDlVBYiN1iIz//WmQP7MlSEwEzZrMSqNl67YzAoL
         6E8k61pQ3DVyhfHws7ajkKmdGIHFlXUklHJ2MaybFJPhuhFzJBffoRBE17MO+lxFeI+d
         /wTYtLsHM//v+lLHOA9wnkn3EC8NrDQ3cOgzuxahlL21Uv6zVZGL7WvFp3cpC7rhTUAz
         gKljVP9UkBI9fVwc/6LSVlKloDcs+vXzjbVspUH1Wp1/lqEB6pLtW/KiMW6fGaDgBJbC
         Vsw7CJoIyuXDdEDCNXvHjH8SsAfvcJZ9i20+ulm3gMjHwoelgv8R7u/x3kn7xBGfXOm9
         JMxQ==
X-Gm-Message-State: AOAM53217vdYxmPVsr2jnkP9VVQgJQ4l2TeGaDTa1PpyBZncPfMreYWw
        LeTq8l/DqIVlozCwyTfbtyXBUiwjhqg=
X-Google-Smtp-Source: ABdhPJxthWzsmEPBgk2ZArx5skbyu+R4qAz+IdSBhb9XzhWujrNQ/UzgHmLGQeJJlThFMw4l3CGeI4p7wRU=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d4d4:2a73:fa69:7d32])
 (user=yunkec job=sendgmr) by 2002:a5b:cc9:0:b0:64b:22ea:9165 with SMTP id
 e9-20020a5b0cc9000000b0064b22ea9165mr26343058ybr.612.1652855069651; Tue, 17
 May 2022 23:24:29 -0700 (PDT)
Date:   Wed, 18 May 2022 15:24:06 +0900
Message-Id: <20220518062412.2375586-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v3 0/6] media: Implement UVC v1.5 ROI
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
 .../media/v4l/ext-ctrls-camera.rst            |  49 ++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  12 +-
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   4 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    |  34 +++
 drivers/media/usb/uvc/uvc_ctrl.c              | 214 ++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c              |  12 +-
 drivers/media/usb/uvc/uvcvideo.h              |  10 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 155 ++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   7 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  32 ++-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |   1 +
 include/uapi/linux/v4l2-controls.h            |  11 +
 include/uapi/linux/videodev2.h                |   4 +
 18 files changed, 553 insertions(+), 52 deletions(-)

-- 
2.36.0.550.gb090851708-goog

