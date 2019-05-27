Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C61382B7C8
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 16:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfE0OoR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 10:44:17 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42499 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfE0OoR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 10:44:17 -0400
Received: by mail-wr1-f65.google.com with SMTP id l2so17155612wrb.9
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rIgF7xVDbaJhNhkT1oh5cfzIY7s90LlJVnYRpFWsS0Q=;
        b=QFaKOc6pMzB0FmBtt8ZehlKdjkgmC3jizvPS6unucxOPoEdC39a/y7HuRRiE6hT2/m
         wWY/Nnm35Wyj73PvUAfL3SjyF9SvLRxMFF00XPU/b7PjvNorH8ZR/41ZhROfwFc8byU3
         hyLxBQAS+iWE8jsVT4wnERgsy54HkGBPpok5qtr8vn1HxsMYO3uml84RYphkXR0qRyD/
         kcMLMioKeiaHNUoY6ZAzFfO8kerTPsHojKTmljXjt+pw8Wt4yJ/owenaxsBo8rT2SHes
         qQWRVzBr8d7Oq62IdQMosnTDusAL+gxpY96zFGyUZ8BnVhiYtQg1iqmVRFWNYjyZSy/b
         Nqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIgF7xVDbaJhNhkT1oh5cfzIY7s90LlJVnYRpFWsS0Q=;
        b=Pjhx4ISASQ5phzyroIooOr3UDjYnUkyFAUDSrovchcw74Ij/YryRPTZGhV2SFx1UWd
         sUXltdi7A8ZsxlhNOfIeMZC3GDgpDrt9d/IC73ALZwPWx+eRgAI6RFYLasnCuTX9oe0I
         XTxSQ3mCk9fImueXQDnBYLQL8TQyIZiDjM4fZEkj1gMJoS6wdDooTruXa6IRgiTmBZM4
         F6Ox953ktsixPxQSvi2vODlvJHpXJSre1uMr6QxO/cJupL5/qUQemZFeErKtpcy1ufZn
         jLmNTi+vIWkQGvkLdfgvtqprIIxkaajWIb4Db4xDkak8E5yzeALmaYLxWkzJ5H2j2eRk
         mORQ==
X-Gm-Message-State: APjAAAUMNE1ZDtyT72bJ6s2p6PtzOuPWmCEUU0WS21FoFpvKsxOel33B
        I3lseoE9Ckt3Al6nDXFKJERjzLdMpVtAqb40OgSMhA==
X-Google-Smtp-Source: APXvYqxt6xxV/5PxXtamSZZ0dnnDBlNoqz5BkRKvp9HFoI6M8x6CIvknGm0ooYEXbFVx1KWh3xPlUvM7IgMWD9vvRH4=
X-Received: by 2002:adf:de11:: with SMTP id b17mr3329045wrm.19.1558968254980;
 Mon, 27 May 2019 07:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190514135612.30822-1-mjourdan@baylibre.com> <20190514135612.30822-4-mjourdan@baylibre.com>
 <07af1a22-d57c-aff6-b476-98fbf72135c1@xs4all.nl>
In-Reply-To: <07af1a22-d57c-aff6-b476-98fbf72135c1@xs4all.nl>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Mon, 27 May 2019 16:44:04 +0200
Message-ID: <CAMO6naz-cG3F_h70Chjt+GprGWe2EShsMjrietu_JBAdLrPbpQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] media: meson: add v4l2 m2m video decoder driver
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
On Mon, May 27, 2019 at 12:04 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Maxime,
>
> First a high-level comment: I think this driver should go to staging.
> Once we finalize the stateful decoder spec, and we've updated the
> v4l2-compliance test, then this needs to be tested against that and
> only if it passes can it be moved out of staging.
>

I chose to send the driver supporting only MPEG2 for now as it keeps
it "to the point", but as it turns out it's one of the few formats on
Amlogic that can't fully respect the spec at the moment because of the
lack of support for V4L2_EVENT_SOURCE_CHANGE, thus the patch in the
series that adds a new flag V4L2_FMT_FLAG_FIXED_RESOLUTION. It
basically requires userspace to set the format (i.e coded resolution)
since the driver/fw can't probe it.
At the moment, this is described in the v3 spec like this:

>
> 1. Set the coded format on ``OUTPUT`` via :c:func:`VIDIOC_S_FMT`
>
>   * **Required fields:**
>
>     ``type``
>         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``
>
>     ``pixelformat``
>         a coded pixel format
>
>     ``width``, ``height``
>         required only if cannot be parsed from the stream for the given
>         coded format; optional otherwise - set to zero to ignore
>

But MPEG2 being a format where the coded resolution is inside the
bitstream, this is purely an Amlogic issue where the firmware doesn't
extend the capability to do this.

Here's a proposal: if I were to resend the driver supporting only H264
and conforming to the spec, would you be considering it for inclusion
in the main tree ? Does your current iteration of v4l2-compliance
support testing stateful decoders with H264 bitstreams ?

> It is just a bit too soon to have this in mainline at this time.
>
> One other comment below:
>
> On 5/14/19 3:56 PM, Maxime Jourdan wrote:
> > Amlogic SoCs feature a powerful video decoder unit able to
> > decode many formats, with a performance of usually up to 4k60.
> >
> > This is a driver for this IP that is based around the v4l2 m2m framework.
> >
> > It features decoding for:
> > - MPEG 1
> > - MPEG 2
> >
> > Supported SoCs are: GXBB (S905), GXL (S905X/W/D), GXM (S912)
> >
> > There is also a hardware bitstream parser (ESPARSER) that is handled here.
> >
> > Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> > ---
> >  drivers/media/platform/Kconfig                |   10 +
> >  drivers/media/platform/meson/Makefile         |    1 +
> >  drivers/media/platform/meson/vdec/Makefile    |    8 +
> >  .../media/platform/meson/vdec/codec_mpeg12.c  |  209 ++++
> >  .../media/platform/meson/vdec/codec_mpeg12.h  |   14 +
> >  drivers/media/platform/meson/vdec/dos_regs.h  |   98 ++
> >  drivers/media/platform/meson/vdec/esparser.c  |  323 +++++
> >  drivers/media/platform/meson/vdec/esparser.h  |   32 +
> >  drivers/media/platform/meson/vdec/vdec.c      | 1071 +++++++++++++++++
> >  drivers/media/platform/meson/vdec/vdec.h      |  265 ++++
> >  drivers/media/platform/meson/vdec/vdec_1.c    |  229 ++++
> >  drivers/media/platform/meson/vdec/vdec_1.h    |   14 +
> >  .../media/platform/meson/vdec/vdec_ctrls.c    |   51 +
> >  .../media/platform/meson/vdec/vdec_ctrls.h    |   14 +
> >  .../media/platform/meson/vdec/vdec_helpers.c  |  441 +++++++
> >  .../media/platform/meson/vdec/vdec_helpers.h  |   80 ++
> >  .../media/platform/meson/vdec/vdec_platform.c |  107 ++
> >  .../media/platform/meson/vdec/vdec_platform.h |   30 +
> >  18 files changed, 2997 insertions(+)
> >  create mode 100644 drivers/media/platform/meson/vdec/Makefile
> >  create mode 100644 drivers/media/platform/meson/vdec/codec_mpeg12.c
> >  create mode 100644 drivers/media/platform/meson/vdec/codec_mpeg12.h
> >  create mode 100644 drivers/media/platform/meson/vdec/dos_regs.h
> >  create mode 100644 drivers/media/platform/meson/vdec/esparser.c
> >  create mode 100644 drivers/media/platform/meson/vdec/esparser.h
> >  create mode 100644 drivers/media/platform/meson/vdec/vdec.c
> >  create mode 100644 drivers/media/platform/meson/vdec/vdec.h
> >  create mode 100644 drivers/media/platform/meson/vdec/vdec_1.c
> >  create mode 100644 drivers/media/platform/meson/vdec/vdec_1.h
> >  create mode 100644 drivers/media/platform/meson/vdec/vdec_ctrls.c
> >  create mode 100644 drivers/media/platform/meson/vdec/vdec_ctrls.h
> >  create mode 100644 drivers/media/platform/meson/vdec/vdec_helpers.c
> >  create mode 100644 drivers/media/platform/meson/vdec/vdec_helpers.h
> >  create mode 100644 drivers/media/platform/meson/vdec/vdec_platform.c
> >  create mode 100644 drivers/media/platform/meson/vdec/vdec_platform.h
> >
>
> <snip>
>
> > diff --git a/drivers/media/platform/meson/vdec/vdec_ctrls.c b/drivers/media/platform/meson/vdec/vdec_ctrls.c
> > new file mode 100644
> > index 000000000000..d5d6b1b97aa5
> > --- /dev/null
> > +++ b/drivers/media/platform/meson/vdec/vdec_ctrls.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2018 BayLibre, SAS
> > + * Author: Maxime Jourdan <mjourdan@baylibre.com>
> > + */
> > +
> > +#include "vdec_ctrls.h"
> > +
> > +static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct amvdec_session *sess =
> > +           container_of(ctrl->handler, struct amvdec_session, ctrl_handler);
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
> > +             ctrl->val = sess->dpb_size;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     };
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops vdec_ctrl_ops = {
> > +     .g_volatile_ctrl = vdec_op_g_volatile_ctrl,
> > +};
> > +
> > +int amvdec_init_ctrls(struct v4l2_ctrl_handler *ctrl_handler)
> > +{
> > +     int ret;
> > +     struct v4l2_ctrl *ctrl;
> > +
> > +     ret = v4l2_ctrl_handler_init(ctrl_handler, 1);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ctrl = v4l2_ctrl_new_std(ctrl_handler, &vdec_ctrl_ops,
> > +             V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 1);
> > +     if (ctrl)
> > +             ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
>
> Why is this volatile? That makes little sense.
>

I copied this over from other stateful decoders, they all used
volatile so it didn't cross my mind too much.

It seems that there are 2 cases:
 - the control is actually volatile, e.g its value is read from firmware.
 - the control is not really volatile, e.g its value is set by the driver

My driver falls in the second case. Is the correct way to deal with
that to use v4l2_ctrl_s_ctrl() and remove the volatile flag ?

Regards,
Maxime


> > +
> > +     ret = ctrl_handler->error;
> > +     if (ret) {
> > +             v4l2_ctrl_handler_free(ctrl_handler);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(amvdec_init_ctrls);
>
> <snip>
>
> Regards,
>
>         Hans
