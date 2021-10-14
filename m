Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A04E42D782
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhJNKzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhJNKzo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:55:44 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCECC06174E;
        Thu, 14 Oct 2021 03:53:39 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id r9so2980618ile.5;
        Thu, 14 Oct 2021 03:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DaTb+4k+F0V+OcIZQk92noaDq0ER0qSofHMcijTckv0=;
        b=TPJsMFvULPki9Oib0kikIYimr4BHFLGvb81lAZjzg9PojxC7poB+99om045GHW3M+g
         1Tt3sX+6b55TB4Dl+8VUFGFpGqFM+ZsVjxZjWj93Oj+ecwLwkMaSf2e/xqFgt3nW5I4/
         kW51c5JlESqxYeni3Uj1zQE12ig1C+AHTObOqGHHuxEGwmm2ub2AcJlqiyrx5sFZrnkm
         Bg2NyYGZ9wU/wH/MUb4fVNf9JxB6M8xpsQrU6ZSP7ExD+wT1agXB759kD5goBnkY9vT4
         N1suJEAslCNMirQVm2yWq0edXZIpmPBID3g8JeH39NZDpBJywExFVBXcwImmSTMLDiKt
         X3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DaTb+4k+F0V+OcIZQk92noaDq0ER0qSofHMcijTckv0=;
        b=VTYfaFLV2rsPsP2Uy2bvfCFaAp8CWy/uMttyXgboFy7Nqv0QRJkGj8Jjf99Mm4He1f
         x7NKn8exLnBirU7EFnhwmqfLiDmNfb7usmOcN+1lT6GAkxB/D7xGxqmeTD7I5GVnTzi0
         TEXHovrPPq1VQKKFC81lba/TWP3dHJWuDlT9j63UlL1UHR2u/BW2PFjv8WGc2yf4q3k5
         MLz/ouiq7OtNYpJ5gRzcaIlJcf3KMZROPbbwjn0bLwlH6JpQC55+j7eLaqWCRv1Kg+Ks
         Y5g0QpsWxnp3WpTacUTNZmnp4MmsMYm1HJPEj5GJ2kFU7pRYlu5h1M+0hA5HoEcpFp4e
         AvXg==
X-Gm-Message-State: AOAM5306n2CPEGwE46uLyAOAz1q26nlReGoauMKRk6IP4x6FirybNrwX
        eHFxFfGeg4rwhZjugFO+DGNeg8WUAvSeXObZC84=
X-Google-Smtp-Source: ABdhPJy3KKlDt7N5ANo6q+NVxGeDTThueZ6yjtppRpWOMOoXdTqmDKkwFqmftkhqmNs8rVQ1pAx8untdJgkpOjspvLU=
X-Received: by 2002:a05:6e02:13cb:: with SMTP id v11mr1927428ilj.44.1634208818924;
 Thu, 14 Oct 2021 03:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
 <1634207106-7632-7-git-send-email-dillon.minfei@gmail.com> <2b0739f1-85e4-6b19-ff30-2587f0c622c2@xs4all.nl>
In-Reply-To: <2b0739f1-85e4-6b19-ff30-2587f0c622c2@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Thu, 14 Oct 2021 18:53:02 +0800
Message-ID: <CAL9mu0LqkCpjYft4z6V4T97Mq46dCTXZ=BvfQa+DijjRd4pDkA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] media: v4l2-ctrls: Add RGB color effects control
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

Thanks for quick reply

On Thu, 14 Oct 2021 at 18:44, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 14/10/2021 12:25, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > Add V4L2_COLORFX_SET_RGB color effects control, V4L2_CID_COLORFX_RGB
> > for RGB color setting.
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> > v4:
> > - replace V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to
> >   V4L2_COLORFX_SET_RGB, V4L2_CID_COLORFX_RGB since Alpha paramter not used
> >   in current. thanks Hans.
> >
> >  Documentation/userspace-api/media/v4l/control.rst | 9 +++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
> >  include/uapi/linux/v4l2-controls.h                | 4 +++-
> >  3 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> > index f8d0b923da20..3eec65174260 100644
> > --- a/Documentation/userspace-api/media/v4l/control.rst
> > +++ b/Documentation/userspace-api/media/v4l/control.rst
> > @@ -242,8 +242,17 @@ Control IDs
> >      * - ``V4L2_COLORFX_SET_CBCR``
> >        - The Cb and Cr chroma components are replaced by fixed coefficients
> >       determined by ``V4L2_CID_COLORFX_CBCR`` control.
> > +    * - ``V4L2_COLORFX_SET_RGB``
> > +      - The RGB components are replaced by the fixed RGB components determined
> > +        by ``V4L2_CID_COLORFX_RGB`` control.
> >
> >
> > +``V4L2_CID_COLORFX_RGB`` ``(integer)``
> > +    Determines the Red, Green, and Blue coefficients for
> > +    ``V4L2_COLORFX_SET_RGB`` color effect.
> > +    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
> > +    bits [15:8] as Green component, bits [23:16] as Red component, and
> > +    bits [31:24] must be zero.
> >
> >  ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
> >      Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 421300e13a41..f4bd90170105 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >       case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:   return "Min Number of Output Buffers";
> >       case V4L2_CID_ALPHA_COMPONENT:          return "Alpha Component";
> >       case V4L2_CID_COLORFX_CBCR:             return "Color Effects, CbCr";
> > +     case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
> >
> >       /*
> >        * Codec controls
> > @@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >               *min = *max = *step = *def = 0;
> >               break;
> >       case V4L2_CID_BG_COLOR:
> > +     case V4L2_CID_COLORFX_RGB:
> >               *type = V4L2_CTRL_TYPE_INTEGER;
> >               *step = 1;
> >               *min = 0;
>
> Can you make another small change here? Please change:
>
>         *max = 0xFFFFFF;
>
> to:
>
>         *max = 0xffffff;
>
> to keep in line with the coding standard for hex values.

Sure, do it right now.

>
> Also, can you add a separate patch that adds an entry here for V4L2_CID_COLORFX_CBCR
> that sets *max to 0xffff? I noticed that that was missing. While adding V4L2_CID_COLORFX_RGB
> it's good to fix V4L2_CID_COLORFX_CBCR as well.

Sure, you mean the final code like this? first patch to fix cbcr 0xFFFFFF,
another one to add V4L2_CID_COLORFX_RGB entry.

1395         case V4L2_CID_BG_COLOR:
1396         case V4L2_CID_COLORFX_RGB:
1397                 *type = V4L2_CTRL_TYPE_INTEGER;
1398                 *step = 1;
1399                 *min = 0;
1400                 /* Max is calculated as RGB888 that is 2^24 */
1401                 *max = 0xffffff;
1402                 break;

Best Regards
Dillon

>
> Regards,
>
>         Hans
>
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 5532b5f68493..9aa3fd368383 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -128,6 +128,7 @@ enum v4l2_colorfx {
> >       V4L2_COLORFX_SOLARIZATION               = 13,
> >       V4L2_COLORFX_ANTIQUE                    = 14,
> >       V4L2_COLORFX_SET_CBCR                   = 15,
> > +     V4L2_COLORFX_SET_RGB                    = 16,
> >  };
> >  #define V4L2_CID_AUTOBRIGHTNESS                      (V4L2_CID_BASE+32)
> >  #define V4L2_CID_BAND_STOP_FILTER            (V4L2_CID_BASE+33)
> > @@ -145,9 +146,10 @@ enum v4l2_colorfx {
> >
> >  #define V4L2_CID_ALPHA_COMPONENT             (V4L2_CID_BASE+41)
> >  #define V4L2_CID_COLORFX_CBCR                        (V4L2_CID_BASE+42)
> > +#define V4L2_CID_COLORFX_RGB                 (V4L2_CID_BASE+43)
> >
> >  /* last CID + 1 */
> > -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
> > +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
> >
> >  /* USER-class private control IDs */
> >
> >
>
