Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870EE3E55FD
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 10:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238356AbhHJIxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 04:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238291AbhHJIxB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 04:53:01 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 834B4C061798;
        Tue, 10 Aug 2021 01:52:39 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id k3so14537248ilu.2;
        Tue, 10 Aug 2021 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lWXJ4+PjF5glFDtXwt/vNE0iEHr+A6wHia7xM2/xz1w=;
        b=RSyf2G/TrYO742mmP79dNqVaAkt/Z+/FFY9knRlUQFKTfXEdKiP8qGt3UtV5nsPHRE
         CSLS8yC66Zp3D4ytzq51fAvkfkpTZdP2S4g2LCMq3JdiTk4J7o1FhADvTVKWP6PyplsF
         c74q+eJlFX8tMRziWa378uLAp9LZ1TnbAdsmCdnqAwEVjHEOjBQoZ2DIpfLwvUkZiaCj
         JpmtGDqEQiAPf3moCXNAza1rYWlHOI5IMHC9EGFmYzeTVjpRtZWPS7C4yK86yulJwxZS
         16/rnaR45WFBzrwyapORQ18rvwhqgHCTLZheMYf1jL4FokxZhjtOeWzs4m0cIRi0xfFi
         3k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lWXJ4+PjF5glFDtXwt/vNE0iEHr+A6wHia7xM2/xz1w=;
        b=f0J5MJHuCy5ojycOeNDKMPnN9m+4QFMtVfLZ0bHgrxhqfer012RjqUCcNXN5yJO7lO
         grOVajHBCO28eGDgmnotcbQG7lWiD7k2JWfdSX1bfUbAVbSXnmeVUpZMqKO/Q+/TBy5h
         wQCxWdS8uZAQbcv5AEP1FibPqTawNSjpol2XY8HcWzr9VYAygQoTQKKZT560ry1ICpkU
         tl4Byedu7Qg//hatx2qPqORqvxrI8HwiR1S0br3HklhukleYActppqWZBhJyx4GUz9KQ
         9aGUdTc2BlbYm4V6NB8Zip31xMeyw3OIAaPAWhyuqzRC/XE4fb6EOKHR9HGsWbQvAYta
         BuUA==
X-Gm-Message-State: AOAM531fqV+9CVU3weMBKckk4Ii/nGLFI26l6pyVH8e3HPXoNcYmxQm3
        VrZFP610f1fo/EUcVMlBP+shP9Mhv80/Tol9XuE=
X-Google-Smtp-Source: ABdhPJwzzeoVZ8XWeqwnCkOYfBWOdVOBvKw/YO8LbIhn6Mjk+DGdz9I9hHDwolLR9vxDRuFHs7u09g1OxGrGsMKRwmA=
X-Received: by 2002:a05:6e02:13b3:: with SMTP id h19mr49185ilo.218.1628585558984;
 Tue, 10 Aug 2021 01:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
 <1626341068-20253-18-git-send-email-dillon.minfei@gmail.com> <7131ee03-fc81-cb9b-665f-80e4ce8435ab@xs4all.nl>
In-Reply-To: <7131ee03-fc81-cb9b-665f-80e4ce8435ab@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Tue, 10 Aug 2021 16:52:04 +0800
Message-ID: <CAL9mu0+QF==63hzkLo1x=dVeXdnu7wyugmfQCRLsTE+=AJZWxw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] media: docs: add doc for the stm32 dma2d driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrice CHOTARD <patrice.chotard@foss.st.com>,
        hugues.fruchet@foss.st.com,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for the detailed review.

On Mon, 9 Aug 2021 at 17:16, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 15/07/2021 11:24, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > add stm32-uapi.rst for stm32's dma2d driver, explain the details of ioctl
> > V4L2_CID_DMA2D_R2M_MODE, V4L2_CID_DMA2D_R2M_COLOR.
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> > v2: introduce the stm32-uapi.rst to explain the detail of dma2d's ioctl.
> >
> >  .../userspace-api/media/drivers/index.rst          |  1 +
> >  .../userspace-api/media/drivers/stm32-uapi.rst     | 22 ++++++++++++++++++++++
> >  2 files changed, 23 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/drivers/stm32-uapi.rst
> >
> > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> > index 12e3c512d718..ce42915d48f4 100644
> > --- a/Documentation/userspace-api/media/drivers/index.rst
> > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > @@ -38,4 +38,5 @@ For more details see the file COPYING in the source distribution of Linux.
> >       max2175
> >       meye-uapi
> >       omap3isp-uapi
> > +     stm32-uapi
> >       uvcvideo
> > diff --git a/Documentation/userspace-api/media/drivers/stm32-uapi.rst b/Documentation/userspace-api/media/drivers/stm32-uapi.rst
> > new file mode 100644
> > index 000000000000..d7a4f717387d
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/drivers/stm32-uapi.rst
> > @@ -0,0 +1,22 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +STM32 Chrom-Art 2D Graphics Accelerator unit (DMA2D) driver
> > +================================================
> > +
> > +The DMA2D driver implements the following driver-specific controls:
> > +
> > +``V4L2_CID_DMA2D_R2M_MODE``
>
> Please mention the control type as well.

OK, how about change to
``V4L2_CID_DMA2D_R2M_MODE (boolean)``

>
> > +-------------------------
> > +    Enable/Disable the Register-To-Memory mode, filling a part or the
> > +    whole of a destination image with a specific color.
> > +
> > +    1 for enable, 0 for disable.
> > +
> > +``V4L2_CID_DMA2D_R2M_COLOR``
>
> Ditto.

I will remove this item in v3, turn to use your suggestion (add
V4L2_COLORFX_SET_COLOR_ARGB to V4L2_CID_COLORFX)

>
> > +-------------------------------
> > +    Set the color to fill a part or the whole of a destination image.
> > +    only used under Register-To-Memory mode, to set the DMA2D_OCOLR register
> > +    (RED, GREEN, BLUE) which is:
>
> Here you mention RGB only,
>
> > +
> > +    31 .. 24    23 .. 16  15 .. 8     7 .. 0
> > +    ALPHA[7:0]  RED[7:0]  GREEN[7:0]  BLUE[7:0]
>
> but here you also mention Alpha. So which is it?

Anyway this will be removed in v3, give a short explanation about it,
The DMA2D_OCOLR register contains alpha value for m2m-pfc-blend mode,
which defines the alpha channel of the output color. it's not used for R2M.

sorry for confusion.

>
> See also my review of patch 9/9.
>
> >
>
> I'm getting some warnings building this doc:
>
> Documentation/media/userspace-api/drivers/stm32-uapi.rst:4: WARNING: Title underline too short.
>
> STM32 Chrom-Art 2D Graphics Accelerator unit (DMA2D) driver
> ================================================
> Documentation/media/userspace-api/drivers/stm32-uapi.rst:9: WARNING: Title underline too short.
>
> ``V4L2_CID_DMA2D_R2M_MODE``
> -------------------------

OK, will be fixed in v3.

>
> Regards,
>
>         Hans


Thanks and Best Regards
Dillon
