Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334FF77546F
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 09:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbjHIHur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 03:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjHIHuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 03:50:46 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893CC1736
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 00:50:45 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so6476a12.1
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 00:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691567444; x=1692172244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G1Chrjuguup1B7Z6+XFHYpk20hT0QBXz2TAdHcOyfM=;
        b=PRmZnrWl9jUWZGsorzZ93K3/Uk/dhMgqLD+6pdGlkw4SEqF1vd5W2plRKsnZ37VJVm
         KCO5bnEtUnVllnHqVbXBDdfM4MZfyndADcedrB/Tm6LLSwaaMpYlMDBAL6Rs+ZQ8w421
         h4QzB9tBGN9WxInxuxlVyp2dZxDP2XZP7MLwDk0CAb5jJs7vNeKzaD1W2vKhjmYwHNgZ
         I8yooe1AJWVpyfPNWBVLLfU6+xeEvJMKVBlXnasZ7rYGEmcDWZay96FbB63R3HRNLafP
         jVZ68MRTEgg6AuID8KSCPEQIpjWlnc4ZkuEkb6xVnGqLEZz8hURANVXYZEKAkk8D2kSt
         6Cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691567444; x=1692172244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5G1Chrjuguup1B7Z6+XFHYpk20hT0QBXz2TAdHcOyfM=;
        b=dJKv/Bu1lzZkA725QUdrQ4zefCcaDedWCV5QVaRanGeE4rlpMedvNWeUbAoFj4SXms
         w5Y4P7ThDeltYrjBn0solF52TffdDL3PdCUxp4zImRFDZsfrpTsNt1inS9dbqHOcLZC5
         kCYTSA0Y3MsWz5mY9P6gW0+BDEd2Y3lRB8pnlcGz2enw2InpJeKZUM5ygsA/m9OaZ31B
         kZnfU5ZjMX+pSU0RWVkIPKCNjEkd6clsf9uSBrsEOy87/BWe/VxJuDOYV6tRJmmDf0Xv
         nC9cM0Pfw2jziA5LanhsXAkwJGsYoNIvv2v4qoTWwafWBzcn7LQ1EcXc6EXFr8xGGohA
         MGug==
X-Gm-Message-State: AOJu0YxBO9CHDZ7IE6Rg9RM1QgxFo8yXwVavRFLyHQzLYHzxOSX58lN0
        EYe3gAnvv0LHUVdwZiaf0RZGPEG5mhVqd+ppPuqPHA==
X-Google-Smtp-Source: AGHT+IHpGa36yT+AxTFy6mjYelcIK5IuUlK0lLA4m36sCoo1j5DbcALMNRivvbfKfA14Y6LGlN/FeBiRnLWzT0ojp8k=
X-Received: by 2002:a50:f60d:0:b0:522:41c9:9b9 with SMTP id
 c13-20020a50f60d000000b0052241c909b9mr47723edn.5.1691567443858; Wed, 09 Aug
 2023 00:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230426082923.132909-1-yunkec@google.com> <2127bd95-e918-a3b1-b09e-793eaa1bd86d@xs4all.nl>
In-Reply-To: <2127bd95-e918-a3b1-b09e-793eaa1bd86d@xs4all.nl>
From:   Yunke Cao <yunkec@google.com>
Date:   Wed, 9 Aug 2023 16:50:32 +0900
Message-ID: <CANqU6FeWoMYSXdJV90tTPD+6E+vFstMQmKzwm9R00fy=nVskQw@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] media: Implement UVC v1.5 ROI
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>
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

Hi Hans,

Thanks for the review!!

On Wed, Aug 9, 2023 at 4:19=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all.=
nl> wrote:
>
> On 26/04/2023 10:29, Yunke Cao wrote:
> > From: Yunke Cao <yunkec@chromium.org>
> >
> > Hi,
> >
> > This patch set implements UVC v1.5 region of interest using V4L2
> > control API. I rebased v10 and resended.
> >
> > ROI control is consisted two uvc specific controls.
> > 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> > 2. An auto control with type bitmask.
> >
> > V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
> >
> > Tested on two different usb cameras using v4l2-compliance, v4l2-ctl
> > and calling ioctls.
> >
> > 1/11 adds V4L2_CTRL_TYPE_RECT.
> > 2/11, 3/11, 4/11 refactors uvc_ctrl.c.
> > 5/11 adds support for compound controls.
> > 6/11 is a cherry-pick for Hans' implementation of
> > V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
> > 7/11 documents min/max for the rectangle control.
> > 8/11 supports MIN/MAX in UVC.
> > 9/11 implements ROI in UVC.
> > 10/11 initializes ROI control to default value.
> > 11/11 documents the changes.
>
> I just looked at the core control code, and except for some minor issues
> it looks good.
>
> One thing needs to be added here, though: I want to have a patch adding
> a rectangle control + min/max support to the vivid driver, similar to
> the existing VIVID_CID_AREA control. This makes it possible to do regress=
ion
> tests without requiring hardware that supports this.

Sounds good, I can add a patch with VIVID_CID_RECT control in the next vers=
ion.

>
> v4l2-ctl/compliance also need to be adapted for min/max.

This patchset doesn't break v4l2-compliance for the cameras I tested with.
I can try to come up with something to verify min/max .

Laurent, Daniel,
Do you have time to look at the UVC patches?

Best,
Yunke

>
> Regards,
>
>         Hans
>
> >
> > Changelog since v9:
> > - Reordered patches, move MIN/MAX related patches (patch 6, 7, 8) befor=
e
> >   implementing ROI control in UVC. Clamping set current ROI value based=
 on
> >   MIN/MAX values.
> > - Fixed some minor issues. Changelog in patches.
> > Changelog since v9:
> > - Rebased onto Linus' master branch.
> > - Fixed some minor issues. Changelog in patches.
> > Changelog since v9:
> > - Rebased onto Linus' master branch.
> > - Fixed some minor issues. Changelog in patches.
> > Changelog since v8:
> > - Rebased onto media-stage master (v6.1-rc2).
> > - Addressed Hans' comments in 8/11 v4l2-ctrls: add support for
> >   V4L2_CTRL_WHICH_MIN/MAX_VAL. Including adding a new documentation pat=
ch
> >   9/11.
> > Changelog since v7:
> > - Rebased onto media-stage master.
> > - Move the factoring logic from 5/10 to 2/10 and 3/10 (new patch in v8)=
.
> > - In patch 4/10, split uvc_control_mapping.size to v4l2 and data size.
> > - Move initializing ROI control from 5/10 into its own patch 7/10.
> > - Address some comments. Changelogs are in patches.
> >
> > Hans Verkuil (1):
> >   v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
> >
> > Yunke Cao (10):
> >   media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
> >   media: uvcvideo: add uvc_ctrl_get_boundary for getting default value
> >   media: uvcvideo: introduce __uvc_ctrl_get_std()
> >   media: uvcvideo: Split uvc_control_mapping.size to v4l2 and data size
> >   media: uvcvideo: Add support for compound controls
> >   media: v4l2: document the usage of min/max for V4L2_CTRL_TYPE_RECT
> >   media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
> >   media: uvcvideo: implement UVC v1.5 ROI
> >   media: uvcvideo: initilaize ROI control to default value
> >   media: uvcvideo: document UVC v1.5 ROI
> >
> >  .../userspace-api/media/drivers/uvcvideo.rst  |  64 +-
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |  15 +-
> >  .../media/v4l/vidioc-queryctrl.rst            |  11 +
> >  .../media/videodev2.h.rst.exceptions          |   3 +
> >  drivers/media/i2c/imx214.c                    |   5 +-
> >  .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
> >  drivers/media/usb/uvc/uvc_ctrl.c              | 702 ++++++++++++++----
> >  drivers/media/usb/uvc/uvc_v4l2.c              |  18 +-
> >  drivers/media/usb/uvc/uvcvideo.h              |  24 +-
> >  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +-
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 171 ++++-
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
> >  include/media/v4l2-ctrls.h                    |  36 +-
> >  include/uapi/linux/usb/video.h                |   1 +
> >  include/uapi/linux/uvcvideo.h                 |  13 +
> >  include/uapi/linux/v4l2-controls.h            |   9 +
> >  include/uapi/linux/videodev2.h                |   4 +
> >  17 files changed, 942 insertions(+), 204 deletions(-)
> >
>
