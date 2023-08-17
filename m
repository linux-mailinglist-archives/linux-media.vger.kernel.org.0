Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9290477F130
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241455AbjHQH3Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348499AbjHQH3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 03:29:10 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D0D2D69
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:29:06 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe2d620d17so65855e9.0
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692257345; x=1692862145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13K2ERo2Xuf5EHuaPh2CMoqjVma1LN01zzm1eCkGhk8=;
        b=y/RBehc88egYTEcHs9O9jvhNHEzDRdtnC3dFJKXeG3dYncgaML1mkv6R2ISdg2vMSg
         PXdygdVHdnfsh4JFiC30a/B7f0geibCJ8AjT6LnOdtXcwXmT1QpxI3IOI1sdaxzZ6OV+
         7qR/KnSpGrCWUi7MJwqIvFLmBr4zhSNEmb4IGWCirzcHZCVjZe5K4kweVy9cW0G7uXp0
         azvje9nOiEV0vsMC9U4x27+O4TeAJUpTGQs/PMEGtMKIWWKpRJEJln0YbIc7gGPXpRel
         BUfSDtx8dV8TF/deWjoh+IKCTrtm3Aq5ej4nYEP+p9pvYmxYsiog6L29Z3Dy6NoXQrtv
         VC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692257345; x=1692862145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13K2ERo2Xuf5EHuaPh2CMoqjVma1LN01zzm1eCkGhk8=;
        b=Q0QxQwiAP7mt5i2r13UmA3NRpW1PmPVrgpy6UjXFg6Igbx3aMnWSmfGAvzGr77Uas6
         eFG5Zh/N/1H1RD3DRX2930BJkztxedeb6h/WE9ESa46JIo823lNvePFjny1d6FV6S+h6
         EqBGX2pB9G0sUx8VwxWMk/qHk7GIRCLXHsbqCkUAlHGlr57GwhXN7hjhxcFJi878ZF0O
         c7QZROp9Ean8k8jjKDVWDebxDkJbRfo5U/SimxVi1Mu+WHjXN9hQd13envlvb53r7tGH
         i0u9JkFWO8HXAZghEyMVLxJDjGqUMmoVG3DccflL1tyJv3urs3lee15SzoezbUdjaox/
         4DFg==
X-Gm-Message-State: AOJu0Yw983lO0i0iW4U0mRXE2y4ql1H94LwsmE0eKwQhW8qWnbIZg/va
        EFmuI8nymvQeGt3sQ8r/yIh17g+RomFe6dcqp9EWng==
X-Google-Smtp-Source: AGHT+IFkcfZvVfHrWoXgmMuXJzBsjcg2ntX8YbSL6+d4kgbqTMrLqsZRc5bDNWsQ24tLJcrkNuKnhdYLm/xZCYx9U4M=
X-Received: by 2002:a05:600c:2804:b0:3fd:e47:39c7 with SMTP id
 m4-20020a05600c280400b003fd0e4739c7mr78031wmb.4.1692257344961; Thu, 17 Aug
 2023 00:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230817071750.2830271-1-yunkec@google.com>
In-Reply-To: <20230817071750.2830271-1-yunkec@google.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Thu, 17 Aug 2023 16:28:53 +0900
Message-ID: <CANqU6Fc2ehCXcyvCx9axokMtXQmgRGWSbEtEQcrmCQOnmVVT6A@mail.gmail.com>
Subject: Re: [PATCH v12 00/11] Implement UVC v1.5 ROI
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l-utils series can be found at
https://patchwork.linuxtv.org/project/linux-media/list/?series=3D11069 .

On Thu, Aug 17, 2023 at 4:17=E2=80=AFPM Yunke Cao <yunkec@google.com> wrote=
:
>
> Hi,
>
> This patch set implements UVC v1.5 region of interest using V4L2
> control API.
>
> ROI control is consisted two uvc specific controls.
> 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> 2. An auto control with type bitmask.
>
> V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
>
> A patchset in v4l-utils will be sent separately.
>
> Tested with v4l2-compliance, v4l2-ctl, calling ioctls on usb cameras and
> VIVID with a newly added V4L2_CTRL_TYPE_RECT control.
>
> 1/11 adds V4L2_CTRL_TYPE_RECT.
> 2/11, 3/11, 4/11 refactors uvc_ctrl.c.
> 5/11 adds support for compound controls.
> 6/11 is a cherry-pick for Hans' implementation of
> V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
> 7/11 addes the rectangle control in VIVID.
> 8/11 supports MIN/MAX in UVC.
> 9/11 implements ROI in UVC.
> 10/11 initializes ROI control to default value.
> 11/11 documents the ROI changes.
>
> Changes since v11
> - Git rid of media: v4l2: document the usage of min/max for V4L2_CTRL_TYP=
E_RECT.
> - Added a rectangle control in VIVID.
> - Addressed comments in 6/11, details in patch.
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
>   media: vivid: Add an rectangle control
>   media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
>   media: uvcvideo: implement UVC v1.5 ROI
>   media: uvcvideo: initilaize ROI control to default value
>   media: uvcvideo: document UVC v1.5 ROI
>
>  .../userspace-api/media/drivers/uvcvideo.rst  |  64 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  20 +-
>  .../media/v4l/vidioc-queryctrl.rst            |  14 +
>  .../media/videodev2.h.rst.exceptions          |   4 +
>  drivers/media/i2c/imx214.c                    |   5 +-
>  .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
>  .../media/test-drivers/vivid/vivid-ctrls.c    |  34 +
>  drivers/media/usb/uvc/uvc_ctrl.c              | 721 ++++++++++++++----
>  drivers/media/usb/uvc/uvc_v4l2.c              |  18 +-
>  drivers/media/usb/uvc/uvcvideo.h              |  24 +-
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 176 ++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>  include/media/v4l2-ctrls.h                    |  36 +-
>  include/uapi/linux/usb/video.h                |   1 +
>  include/uapi/linux/uvcvideo.h                 |  13 +
>  include/uapi/linux/v4l2-controls.h            |   9 +
>  include/uapi/linux/videodev2.h                |   5 +
>  18 files changed, 1001 insertions(+), 210 deletions(-)
>
> --
> 2.41.0.694.ge786442a9b-goog
>
