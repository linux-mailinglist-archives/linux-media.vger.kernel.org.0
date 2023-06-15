Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E846A731103
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 09:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238940AbjFOHlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 03:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238877AbjFOHlW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 03:41:22 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD86E69
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 00:41:03 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7607919000aso272963985a.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686814861; x=1689406861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oqj2ebvLfPmvYAyt7OAZpC63YWJwTlRk+nfYe4vKGvM=;
        b=n46JGfWXcSGpxCMcRWz4W5ku4qqbxejF+nmH+rzhlShYP5Iguu47Um0loqa0E/cCaX
         B4ZoY4dA+6Miu53zsitO4rDC4EsdYELKkgrRFDRPK7Yk0grL108nbD6hd883FPGNHtJ1
         Z+0bJzhhiodmcyshjJ4X8w/RW5V6Um2kk/ZHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814861; x=1689406861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oqj2ebvLfPmvYAyt7OAZpC63YWJwTlRk+nfYe4vKGvM=;
        b=OjoiNiqqr/xEedHK7xesVuDT0CBYpD1TJcRn+kHoHKKxOClkH9JUzgUEqIKQ+bAM6V
         g8PNy00T4d8Iwt/Ao8CPrnoMXg7ZmYWrfEA021g6fYnd6N/+mv80+K2cUjB8HDaYgUiL
         22PjGbhz/P7tNBm6kP+hboSYKxnA1fhK6uy7VtWoMMwtSKxgW2rQvt5RbCEN4hGxYL05
         j08Rq2UDexvMmzjwbXrilmhLPhRUsjF84boMgV8dDl9B7y4x+MbtrGYfVNdxDmqf5HBU
         qecBpaI3AOh6U42bbCnv64NjCPEnxXEZiQQ8wc8yaZ0EdAO6Ce231JL9WjV5baVHGcHZ
         f9FQ==
X-Gm-Message-State: AC+VfDzDgCXEcYfgWr3MQ7Y2PL6cZKzxu46vJhWPbaVt58cjn2khZSYx
        1tG1N2DRj5NuJucKTzhqjh25pcuUZr+YEtCnoVD9jw==
X-Google-Smtp-Source: ACHHUZ6hjnMcl9qck6aTiM2ICsXgdPh9FYo61hU3uJxh1OHpe8Iisv7LK4cloZAel2QFejWR7N1zbA==
X-Received: by 2002:a05:620a:8d6:b0:75b:23a1:411 with SMTP id z22-20020a05620a08d600b0075b23a10411mr14822994qkz.39.1686814861260;
        Thu, 15 Jun 2023 00:41:01 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a148800b0075b168fcde9sm5072275qkj.77.2023.06.15.00.41.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 00:41:00 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-62de5392c7bso23738046d6.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 00:41:00 -0700 (PDT)
X-Received: by 2002:a05:6214:d8e:b0:625:77a0:86b0 with SMTP id
 e14-20020a0562140d8e00b0062577a086b0mr17727226qve.45.1686814859782; Thu, 15
 Jun 2023 00:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230426082923.132909-1-yunkec@google.com>
In-Reply-To: <20230426082923.132909-1-yunkec@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 15 Jun 2023 16:40:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5APBojPkQBHHzDeLYa0wcTzGwqB49dhmc_jTFcTTgdqfA@mail.gmail.com>
Message-ID: <CAAFQd5APBojPkQBHHzDeLYa0wcTzGwqB49dhmc_jTFcTTgdqfA@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] media: Implement UVC v1.5 ROI
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Yunke Cao <yunkec@google.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans and Laurent,

On Wed, Apr 26, 2023 at 5:29=E2=80=AFPM Yunke Cao <yunkec@google.com> wrote=
:
>
> From: Yunke Cao <yunkec@chromium.org>
>
> Hi,
>
> This patch set implements UVC v1.5 region of interest using V4L2
> control API. I rebased v10 and resended.
>
> ROI control is consisted two uvc specific controls.
> 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> 2. An auto control with type bitmask.
>
> V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
>
> Tested on two different usb cameras using v4l2-compliance, v4l2-ctl
> and calling ioctls.
>
> 1/11 adds V4L2_CTRL_TYPE_RECT.
> 2/11, 3/11, 4/11 refactors uvc_ctrl.c.
> 5/11 adds support for compound controls.
> 6/11 is a cherry-pick for Hans' implementation of
> V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
> 7/11 documents min/max for the rectangle control.
> 8/11 supports MIN/MAX in UVC.
> 9/11 implements ROI in UVC.
> 10/11 initializes ROI control to default value.
> 11/11 documents the changes.
>

Would you have some time to take a look at this series, please? Thanks
in advance!

I think we need Hans's acks for 1, 6 and 7, since they modify the
control framework and then from Laurent for the uvc driver parts.

Best regards,
Tomasz

> Changelog since v9:
> - Reordered patches, move MIN/MAX related patches (patch 6, 7, 8) before
>   implementing ROI control in UVC. Clamping set current ROI value based o=
n
>   MIN/MAX values.
> - Fixed some minor issues. Changelog in patches.
> Changelog since v9:
> - Rebased onto Linus' master branch.
> - Fixed some minor issues. Changelog in patches.
> Changelog since v9:
> - Rebased onto Linus' master branch.
> - Fixed some minor issues. Changelog in patches.
> Changelog since v8:
> - Rebased onto media-stage master (v6.1-rc2).
> - Addressed Hans' comments in 8/11 v4l2-ctrls: add support for
>   V4L2_CTRL_WHICH_MIN/MAX_VAL. Including adding a new documentation patch
>   9/11.
> Changelog since v7:
> - Rebased onto media-stage master.
> - Move the factoring logic from 5/10 to 2/10 and 3/10 (new patch in v8).
> - In patch 4/10, split uvc_control_mapping.size to v4l2 and data size.
> - Move initializing ROI control from 5/10 into its own patch 7/10.
> - Address some comments. Changelogs are in patches.
>
> Hans Verkuil (1):
>   v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
>
> Yunke Cao (10):
>   media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
>   media: uvcvideo: add uvc_ctrl_get_boundary for getting default value
>   media: uvcvideo: introduce __uvc_ctrl_get_std()
>   media: uvcvideo: Split uvc_control_mapping.size to v4l2 and data size
>   media: uvcvideo: Add support for compound controls
>   media: v4l2: document the usage of min/max for V4L2_CTRL_TYPE_RECT
>   media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
>   media: uvcvideo: implement UVC v1.5 ROI
>   media: uvcvideo: initilaize ROI control to default value
>   media: uvcvideo: document UVC v1.5 ROI
>
>  .../userspace-api/media/drivers/uvcvideo.rst  |  64 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  15 +-
>  .../media/v4l/vidioc-queryctrl.rst            |  11 +
>  .../media/videodev2.h.rst.exceptions          |   3 +
>  drivers/media/i2c/imx214.c                    |   5 +-
>  .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
>  drivers/media/usb/uvc/uvc_ctrl.c              | 702 ++++++++++++++----
>  drivers/media/usb/uvc/uvc_v4l2.c              |  18 +-
>  drivers/media/usb/uvc/uvcvideo.h              |  24 +-
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 171 ++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>  include/media/v4l2-ctrls.h                    |  36 +-
>  include/uapi/linux/usb/video.h                |   1 +
>  include/uapi/linux/uvcvideo.h                 |  13 +
>  include/uapi/linux/v4l2-controls.h            |   9 +
>  include/uapi/linux/videodev2.h                |   4 +
>  17 files changed, 942 insertions(+), 204 deletions(-)
>
> --
> 2.40.1.495.gc816e09b53d-goog
>
