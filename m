Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF16428A48
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 12:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235705AbhJKKC7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 06:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235602AbhJKKC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 06:02:58 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592F5C061570;
        Mon, 11 Oct 2021 03:00:58 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id 5so19076403iov.9;
        Mon, 11 Oct 2021 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yXcvq1zADtmcg32ryQtdH4a+0FvgZKed0QthCOmoDpI=;
        b=QAQqV+bDQO33uF6/KpR9PYACxfCcadoANuvPU7QoHKA0od6J0LHRYUxhgY+Ygo5K9B
         l31yjNV3TWME2U8o3xy8xoTAj9d31NtM7T1tmVgMizsqcAFY/VOIr1LydauRgLj8qjaH
         2jMTrlzUf9EFxOq1mReHwa3+yI+/AbAaAkJGPn3dO2k4j75o59XafFv4PRZdUQRyNQXT
         jjfQjAVyw+jqueCZixlDtbYCJel+1r2Hf7/iUzO6JeDbwlFL58KOi4//2eQpFQgz8tza
         t2mGtfo0ZFVbqwVNgSWmm/Bxi2Ub9/8/5nZ2aNNWonGCoalVHlAH6pPBAftRKVo1BueJ
         voNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yXcvq1zADtmcg32ryQtdH4a+0FvgZKed0QthCOmoDpI=;
        b=sbwrLRTIEA9HtUfWxAwk9d2RkaAOReKW8IV0b+9Epz7/hdOLTz98QCVeZYSsk42TaG
         VDKSjlICH5uES2UYWFnnilXcpxAqwE1W/T+u3QgrUHpCmgFwn2TEyycT5Q3nvMj/uSXa
         1Os8/wjkKMaJei2Dl/jE2ZKg/qBUBL0dV5WlOyXU1NXhexKzV5vNe1XdSgzmfs/S0eUC
         p/KKZsOACQznBJUySb/ivjdRH4Nrnso19jzQ7XNvWwWrbNn/vz4Sjk/Tur3JSBRdW6S7
         Hnqi8v1gLiHiHhTi8TT2n9IqMslnXfD/swykeNHNoWsYzWfq44GYGRgKrEpCrIIx1tO9
         N7Vw==
X-Gm-Message-State: AOAM531a/44bsAbsGhsOaJBYByi1jR5OCEdU9QdsGROEX2+rrLpktegq
        tYV9PPuWZrPsTR94NmTdj6zKKrz4VcpyNFKsbpU=
X-Google-Smtp-Source: ABdhPJwxaGE2iK30U5/jrs1jVvsUDLIabaQ09onY1Mk3bondvsaQahhYyWt4k5W8cnGvxl3udGcwTpQ+9J3IO1h35kE=
X-Received: by 2002:a02:7105:: with SMTP id n5mr1133311jac.64.1633946457732;
 Mon, 11 Oct 2021 03:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
 <1633689012-14492-7-git-send-email-dillon.minfei@gmail.com> <290d78b5-b6d4-a115-9556-f2f909f573da@xs4all.nl>
In-Reply-To: <290d78b5-b6d4-a115-9556-f2f909f573da@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Mon, 11 Oct 2021 18:00:21 +0800
Message-ID: <CAL9mu0KxAmULQofQMgt2JxVLs=L-YT5HZa+mA7sSKebG88GbcA@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] media: v4l2-ctrls: Add ARGB color effects control
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com,
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

Thanks for the quick reply.

On Mon, 11 Oct 2021 at 17:40, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 08/10/2021 12:30, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > - add V4L2_COLORFX_SET_ARGB color effects control.
> > - add V4L2_CID_COLORFX_ARGB for ARGB color setting.
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> > v3: according to Hans's suggestion, thanks.
> > - remove old stm32 private R2M ioctl
> > - add V4L2_CID_COLORFX_ARGB
> > - add V4L2_COLORFX_SET_ARGB
> >
> >  Documentation/userspace-api/media/v4l/control.rst | 8 ++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
> >  include/uapi/linux/v4l2-controls.h                | 4 +++-
> >  3 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> > index f8d0b923da20..319606a6288f 100644
> > --- a/Documentation/userspace-api/media/v4l/control.rst
> > +++ b/Documentation/userspace-api/media/v4l/control.rst
> > @@ -242,8 +242,16 @@ Control IDs
> >      * - ``V4L2_COLORFX_SET_CBCR``
> >        - The Cb and Cr chroma components are replaced by fixed coefficients
> >       determined by ``V4L2_CID_COLORFX_CBCR`` control.
> > +    * - ``V4L2_COLORFX_SET_ARGB``
> > +      - ARGB colors.
>
> How about:
>
>         - The ARGB components are replaced by the fixed ARGB components
>         determined by ``V4L2_CID_COLORFX_ARGB`` control.

Sure, will be addressed by v4.

>
> I also wonder if it makes sense to include the alpha channel here.
>
> Looking at the driver code it appears to me (I might be wrong) that the alpha
> channel is never touched (DMA2D_ALPHA_MODE_NO_MODIF), and setting the alpha
> channel as part of a color effects control is rather odd as well.

Indeed, Alpha channel is not used in current code. I'll remove this item in v4.
how about change the code like below:

    * - ``V4L2_COLORFX_SET_RGB``
       - The RGB components are replaced by the fixed RGB components
         determined by ``V4L2_CID_COLORFX_RGB`` control.

``V4L2_CID_COLORFX_RGB`` ``(integer)``
    Determines the Red, Green, and Blue coefficients for
    ``V4L2_COLORFX_SET_RGB`` color effect.
    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
    bits [15:8] as Green component, bits [23:16] as Red component, and
    bits [31:24] must be zero.


>
> Alpha channel manipulation really is separate from the color and - if needed - should
> be done with a separate control.

OK, Will use a separate control when adding blend features.

Best Regards,
Dillon

>
> Regards,
>
>         Hans
>
> >
> >
> > +``V4L2_CID_COLORFX_ARGB`` ``(integer)``
> > +    Determines the Alpha, Red, Green, and Blue coefficients for
> > +    ``V4L2_COLORFX_SET_ARGB`` color effect.
> > +    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
> > +    bits [15:8] as Green component, bits [23:16] as Red component, and
> > +    bits [31:24] as Alpha component.
> >
> >  ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
> >      Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 421300e13a41..53be6aadb289 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >       case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:   return "Min Number of Output Buffers";
> >       case V4L2_CID_ALPHA_COMPONENT:          return "Alpha Component";
> >       case V4L2_CID_COLORFX_CBCR:             return "Color Effects, CbCr";
> > +     case V4L2_CID_COLORFX_ARGB:             return "Color Effects, ARGB";
> >
> >       /*
> >        * Codec controls
> > @@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >               *min = *max = *step = *def = 0;
> >               break;
> >       case V4L2_CID_BG_COLOR:
> > +     case V4L2_CID_COLORFX_ARGB:
> >               *type = V4L2_CTRL_TYPE_INTEGER;
> >               *step = 1;
> >               *min = 0;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 5532b5f68493..2876c2282a68 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -128,6 +128,7 @@ enum v4l2_colorfx {
> >       V4L2_COLORFX_SOLARIZATION               = 13,
> >       V4L2_COLORFX_ANTIQUE                    = 14,
> >       V4L2_COLORFX_SET_CBCR                   = 15,
> > +     V4L2_COLORFX_SET_ARGB                   = 16,
> >  };
> >  #define V4L2_CID_AUTOBRIGHTNESS                      (V4L2_CID_BASE+32)
> >  #define V4L2_CID_BAND_STOP_FILTER            (V4L2_CID_BASE+33)
> > @@ -145,9 +146,10 @@ enum v4l2_colorfx {
> >
> >  #define V4L2_CID_ALPHA_COMPONENT             (V4L2_CID_BASE+41)
> >  #define V4L2_CID_COLORFX_CBCR                        (V4L2_CID_BASE+42)
> > +#define V4L2_CID_COLORFX_ARGB                        (V4L2_CID_BASE+43)
> >
> >  /* last CID + 1 */
> > -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
> > +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
> >
> >  /* USER-class private control IDs */
> >
> >
>
