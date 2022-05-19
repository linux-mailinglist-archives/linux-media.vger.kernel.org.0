Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E466C52E0E9
	for <lists+linux-media@lfdr.de>; Fri, 20 May 2022 01:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242753AbiESX4B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 19:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235762AbiESXz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 19:55:59 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FA51AF33
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 16:55:57 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id v71so11655531ybi.4
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 16:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=doN1s2mk30giDbqnJK5pzrVfzUPqqMYIAoouOgH1Jxk=;
        b=ZIoJwJ962BjaE1MsN1jbt5+PL0hK31+VS6koi7h7gk4Rc86ok7Uh4GLD85tJaKBF4z
         ORxX3Sbtv6WSKPGX57Lfw+zQauzZ+NLYq0BoFfFRBsw/tBh9eRbpdKxbqSl8eBcGnnD6
         R1MKwbqN4SBeD48/71zpMoFZgsG9l0s5/1nXXJ7U4HUsvoszI8o10JmsgchFxcEWh8lF
         DJqvutbEdrHPn92tA1dhl62PeQYYItV49U+/ix1Vq1LV2q6xzdSoMCP2UmcrCPMYjPiN
         X/chNHwwyXCsJ6mDgQqvMPYDEtlLy18OBZbGUcHRdjgmC80sa1gp/1TtsxghiVo54R12
         +IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=doN1s2mk30giDbqnJK5pzrVfzUPqqMYIAoouOgH1Jxk=;
        b=tvA9iyp8o1Rl2yLsDF9X2yThH2LU0hRaXDyK+OjA7r5hYgZ0GI+hgNF615tUsE9Hjg
         p3ytKj8a6EalUF9mQqtDMZtObvIwXVHL+FP8xLO7ElV9wEbILrh26N4L8friU4iDe9Ki
         b5Q3pMh6Q6RGG5SSJSpaq41bmvcyozCxA3tZgxNUzgKYMU2B7zCFgH2kWawuR6WfByJm
         jwlL6nT4qW4CznlM5w3F+tbBOOlxCiH/za4x7DR+Y91DSscQYf8r1S2kuOcOp5NkSppd
         Tmxe/hzkmFmUAvEXM7FZiUOMyvHFXCKRQI6PDUFcGNszVmXnAcZVXI0GKZFpxMaOAScn
         /Dug==
X-Gm-Message-State: AOAM532OAWGRk0IYNk2PpDDgfQTCu5OqFygTck45q+qz4bEbxxDHuwae
        rlq0xf99+uEUpiCFtjkEx6Wjn72Jp72GeyIQfHUTTQ==
X-Google-Smtp-Source: ABdhPJzU/3e2vF6tCt+80b0DbA3xDn5mM005PzDq7Nly9r4yZjuBbFaWkhX9kjiYAZ0mhGIQ34hO2s99ZD4USyT+eeo=
X-Received: by 2002:a05:6902:10:b0:64a:68dd:2211 with SMTP id
 l16-20020a056902001000b0064a68dd2211mr7184082ybh.473.1653004556211; Thu, 19
 May 2022 16:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220518062412.2375586-1-yunkec@google.com> <5a372aa8296c1141a0da5f3eb240e6ca675a3a87.camel@ndufresne.ca>
In-Reply-To: <5a372aa8296c1141a0da5f3eb240e6ca675a3a87.camel@ndufresne.ca>
From:   Yunke Cao <yunkec@google.com>
Date:   Fri, 20 May 2022 08:55:45 +0900
Message-ID: <CANqU6FddfoPM0nwSxAmNa1wY8TSzq2=z5c74ZmRhBBYG_hYJ3w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] media: Implement UVC v1.5 ROI
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Nicolas!

Noted. I'm very new to the kernel community. Will do in the future :).

Best,
Yunke

On Fri, May 20, 2022 at 3:29 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Hi Yunke Cao,
>
> Le mercredi 18 mai 2022 =C3=A0 15:24 +0900, Yunke Cao a =C3=A9crit :
> > This patch set implements UVC v1.5 regioin of interest using V4L2
> > control API.
> >
> > ROI control is consisted an auto control with type bitmask and a
> > rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> >
> > V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
> >
> > A rectangle control is also added to the vivid test driver.
> >
> > Tested on two different usb cameras using v4l2-ctl and calling ioctls.
> >
> > Yunke Cao (6):
> >   media: v4l2_ctrl: Add region of interest rectangle control
> >   media: v4l2_ctrl: Add region of interest auto control
> >   media: v4l2_ctrl: Add V4L2_CTRL_WHICH_MIN/MAX_VAL
> >   media: uvcvideo: implement UVC v1.5 ROI
> >   media: uvcvideo: Initialize roi to default value
> >   media: vivid: Add a roi rectangle control
>
> A little about best practices, consider adding a change log in your revis=
ions,
> so we know what you have changed (or document what you decided not to cha=
nge).
> Its also nice to wait for the review comment to settle before posting a n=
ew set,
> it may appear rude otherwise.
>
> kind regards,
> Nicolas
>
> >
> >  .../userspace-api/media/drivers/uvcvideo.rst  |   1 +
> >  .../media/v4l/ext-ctrls-camera.rst            |  49 ++++
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |  12 +-
> >  .../media/videodev2.h.rst.exceptions          |   3 +
> >  drivers/media/i2c/imx214.c                    |   4 +-
> >  .../media/test-drivers/vivid/vivid-ctrls.c    |  34 +++
> >  drivers/media/usb/uvc/uvc_ctrl.c              | 214 ++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c              |  12 +-
> >  drivers/media/usb/uvc/uvcvideo.h              |  10 +-
> >  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 ++++-
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 155 ++++++++++++-
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   7 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
> >  include/media/v4l2-ctrls.h                    |  32 ++-
> >  include/uapi/linux/usb/video.h                |   1 +
> >  include/uapi/linux/uvcvideo.h                 |   1 +
> >  include/uapi/linux/v4l2-controls.h            |  11 +
> >  include/uapi/linux/videodev2.h                |   4 +
> >  18 files changed, 553 insertions(+), 52 deletions(-)
> >
>
