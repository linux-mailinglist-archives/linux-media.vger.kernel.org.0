Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55B042B861
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 09:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbhJMHH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 03:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhJMHH1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 03:07:27 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C8CC061746
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 00:05:24 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id r19so7302230lfe.10
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 00:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PfnVX7fs5mOAIg5g0IqUeD9+3NCJp4mY90XboBsyTc0=;
        b=PJn70qZ0of/CLO+ZxZI67bYUqZTq5pvu4J69Nxw34dbToC6iLbo2ubHihqjbU+KWvU
         jT02ga161bl+/F27IiyaK0qLauaVLgIhgN5hOmgGgxjZ+XoUH49428zf2pNFYPHFfaCR
         bplSjSXtd3xozXnXz7wtrKc5ZFxoqxM+9OoRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PfnVX7fs5mOAIg5g0IqUeD9+3NCJp4mY90XboBsyTc0=;
        b=WVTmeC1pfdFtLPvaiQMaQ56kuKi0axag9PtaxW3UCHrCKVEW4bwR9wslnNesO9XRrD
         +Fs+/jtLl5xX0J6acUy4Hhc0KKed5SeZkyliZjmT+NHaDuXrCt2Hss0AN6FxripYZZMK
         WA4e7M6E+FDHY8wxOZer/JohINTBEkI0N3Zc5GwK9srj2R1OEuI5FYa9H3zgoIDI6+Fi
         WI2q8ExgkbtBJ5Ia9FEhh7sCzPclLRCLjNTafxm65jvJQe5sBfrHFJ9dJ8wtedAPwF1R
         RuzRQ2LjJ5xLoEUHapncdBG+yVlAtH/MiCkR+evqFGh0yWKy4+oxXWlWVbiksn/ViNHm
         112w==
X-Gm-Message-State: AOAM5336H497g6wFk10o1oRXmE8PLgUvAS+Vs/tY3S78hHJvEACVV9B5
        U40uE6XCp2XnnDySV1tX+SA0pghXKwJhEQiB1CWBM4kw3VbUdQ==
X-Google-Smtp-Source: ABdhPJxYjLoBprzSyIXGzP7xjmn68PtGM7ruxdJkHX33kuYTv8KEpFlP6xZXAhM7paKE8nSoUpMNEuk3fyQqHBpe0pM=
X-Received: by 2002:ac2:4e07:: with SMTP id e7mr1074589lfr.308.1634108722948;
 Wed, 13 Oct 2021 00:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211008100423.739462-1-wenst@chromium.org> <f108f23dadc846222c63c88af826dae9c5082d83.camel@ndufresne.ca>
In-Reply-To: <f108f23dadc846222c63c88af826dae9c5082d83.camel@ndufresne.ca>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 13 Oct 2021 15:05:11 +0800
Message-ID: <CAGXv+5FnFq1mN79sqUp-o6pHirYvp55gurnsUCgqYvEAX2=4oQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro and Cedrus
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-staging@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Oct 8, 2021 at 11:42 PM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Hi Chen-Yu,
>
> thanks for looking into this.
>
> Le vendredi 08 octobre 2021 =C3=A0 18:04 +0800, Chen-Yu Tsai a =C3=A9crit=
 :
> > Hi everyone,
> >
> > While working on the rkvdec H.264 decoder for ChromeOS, I noticed some
> > behavioral differences compared to Hantro and Cedrus:
> >
> > 1. The driver always overrides the sizeimage setting given by userspace
> >    for the output format. This results in insufficient buffer space whe=
n
> >    running the ChromeOS video_decode_accelerator_tests test program,
> >    likely due to a small initial resolution followed by dynamic
> >    resolution change.
> >
> > 2. Doesn't support dynamic resolution change.
> >
> > This small series fixes both and aligns the behavior with the other two
> > stateless decoder drivers. This was tested on the downstream ChromeOS
> > 5.10 kernel with ChromeOS. Also compiled tested on mainline but I don't
> > have any other RK3399 devices set up to test video stuff, so testing
> > would be very much appreciated.
> >
> > Also, I'm not sure if user applications are required to check the value
> > of sizeimage upon S_FMT return. If the value is different or too small,
> > what can the application do besides fail? AFAICT it can't split the
> > data of one frame (or slice) between different buffers.
>
> While most software out there just assumes that driver will do it right a=
nd
> crash when it's not the case, application that do map the buffer to CPU m=
ust
> read back the fmt structure as the drivers are all fail-safe and will mod=
ify
> that structure to a set of valid value s for the context.

I believe what is happening in Chromium is that the decoder is opened with
some default settings, including the smallest viable resolution for the
output side, and the buffers allocated accordingly. When dynamic resolution
change happens, the decoder does not check if the current buffers are
sufficiently sized; it just assumes that they are. And when it starts
pushing data into the buffers, it realizes they are too small and fails.

The spec also says:

    Clients are allowed to set the sizeimage field for variable length
    compressed data flagged with V4L2_FMT_FLAG_COMPRESSED at ioctl
    VIDIOC_ENUM_FMT, but the driver may ignore it and set the value itself,
    or it may modify the provided value based on alignment requirements or
    minimum/maximum size requirements.

The spec only guarantees that the buffers are of sufficient size for the
resolution configured at the time they were allocated/requested.

So I think my first patch is a workaround for a somewhat broken userspace.
But it seems the other stateless drivers are providing similar behavior,
as I previously mentioned.

> As for opposite direction (output vs capture) format being changed, this =
should
> be documented in the spec, if you find it too unclear or missing for sate=
less
> codec (I know it's there for stateful but can't remember, would have to r=
e-read,
> for stateless) let us know.

AFAICT the capture side is working OK and to spec.


Regards
ChenYu

> regards,
> Nicolas
>
> >
> > Andrzej, I believe the second patch would conflict with your VP9 series=
.
> >
> >
> > Regards
> > ChenYu
> >
> > Chen-Yu Tsai (2):
> >   media: rkvdec: Do not override sizeimage for output format
> >   media: rkvdec: Support dynamic resolution changes
> >
> >  drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
> >  drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++-----------
> >  2 files changed, 23 insertions(+), 22 deletions(-)
> >
>
>
