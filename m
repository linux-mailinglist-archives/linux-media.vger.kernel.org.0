Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A1742DB00
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 16:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhJNODZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 10:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhJNODW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 10:03:22 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B0DC061570;
        Thu, 14 Oct 2021 07:01:17 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id p68so3873116iof.6;
        Thu, 14 Oct 2021 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gMW7UXdmvsJT5m+Unn8LuzhWNMWKfB1LZgpARZu3h64=;
        b=SMa678vtRRct+9n4DfGBLqZbAGScVM2pO7kFcUbYoWYWLOdtHvFOApF+QasmcIS2Tv
         CnI5eTtKuh/YitnWZuy2znpW3L0iEW4gMf6tZSprPWTp89c+yVavbOy5Jflg9r/QIryH
         n7MUf89CrFHtn6vAn3k8vUMP9ai+o4KiK3jbhVL1OOuETLycRiN+FzYDN0MQyiF4Q7Mj
         SYupSuR5H7jBsKb2grUm7L3tt6VXVSiiBCqAdDVyzj+cCya9uTVJG3rSVOAdp/Ye8WE0
         USkqWmuvqTT+4W6t4bEukf2Yi7MySr0G5i53x1vrtVSCFhBfFo/aMdNN1ZGEPg5LSG7s
         Tclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gMW7UXdmvsJT5m+Unn8LuzhWNMWKfB1LZgpARZu3h64=;
        b=Xa3u8kUpI+MPNMuzBqa6HyP7PUK0HWscRwSXz45rDyPhKzgX0x9MEZgEqyKxh1XX4O
         xrULuN3RvlqNHEKLQEdIQ2ajhyQJzY4aNBakUXHrNjd/E3Af+LQLvITqZvZj2OxfGxuX
         407W96kTQbXDWr/+gU+/nB8qT2ls8qKRJI7zc2g1/AZEenU7wlPLT6fkYOgo+kG0ei19
         IL5mB7Q6bUnb97ekITx4Ov/K7Jk3pAENUnVSkbMe/B7QFQ1vMaw67AdduIya+hAp1UD0
         aR9UOlHz81+B2y0TUnIQCox3qwa91mRsAZ1KsA1EfKGxUMjzB5jx0+jGCevoLCccyv55
         2mJg==
X-Gm-Message-State: AOAM533tscGqeXiG9lesS1ILwzpayOzW1yjELsDdlp47YM+CxqsjL8Fa
        j4sZghoo1iTbjUK2A5Uflf0VBu8+M4f9mY1SCUqYgaYfrkIfoA==
X-Google-Smtp-Source: ABdhPJxjnX9wflAJg2fDLZI9CUfRZD8jZ7JeIn2UpSBHSxq/DFwxGjB0oXM6rkNnZq+ZpvHc5d0hy1AMI3cbbD99wRg=
X-Received: by 2002:a05:6602:3cb:: with SMTP id g11mr2525849iov.204.1634220076780;
 Thu, 14 Oct 2021 07:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
 <1634207106-7632-7-git-send-email-dillon.minfei@gmail.com>
 <2b0739f1-85e4-6b19-ff30-2587f0c622c2@xs4all.nl> <CAL9mu0LqkCpjYft4z6V4T97Mq46dCTXZ=BvfQa+DijjRd4pDkA@mail.gmail.com>
 <1d0e5b17-dd2c-d3d3-c514-775806ae99c9@xs4all.nl>
In-Reply-To: <1d0e5b17-dd2c-d3d3-c514-775806ae99c9@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Thu, 14 Oct 2021 22:00:54 +0800
Message-ID: <CAL9mu0KLckxypYMc=mWRrXYOiwLeo98rNBWLwzA2gK9JJEHf1Q@mail.gmail.com>
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

On Thu, 14 Oct 2021 at 19:22, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 14/10/2021 12:53, Dillon Min wrote:
> > Hi Hans
> >
> > Thanks for quick reply
> >
> > On Thu, 14 Oct 2021 at 18:44, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 14/10/2021 12:25, dillon.minfei@gmail.com wrote:
> >>> From: Dillon Min <dillon.minfei@gmail.com>
> >>>
> >>> Add V4L2_COLORFX_SET_RGB color effects control, V4L2_CID_COLORFX_RGB
> >>> for RGB color setting.
> >>>
> >>> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> >>> ---
> >>> v4:
> >>> - replace V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to
> >>>   V4L2_COLORFX_SET_RGB, V4L2_CID_COLORFX_RGB since Alpha paramter not used
> >>>   in current. thanks Hans.
> >>>
> >>>  Documentation/userspace-api/media/v4l/control.rst | 9 +++++++++
> >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
> >>>  include/uapi/linux/v4l2-controls.h                | 4 +++-
> >>>  3 files changed, 14 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> >>> index f8d0b923da20..3eec65174260 100644
> >>> --- a/Documentation/userspace-api/media/v4l/control.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/control.rst
> >>> @@ -242,8 +242,17 @@ Control IDs
> >>>      * - ``V4L2_COLORFX_SET_CBCR``
> >>>        - The Cb and Cr chroma components are replaced by fixed coefficients
> >>>       determined by ``V4L2_CID_COLORFX_CBCR`` control.
> >>> +    * - ``V4L2_COLORFX_SET_RGB``
> >>> +      - The RGB components are replaced by the fixed RGB components determined
> >>> +        by ``V4L2_CID_COLORFX_RGB`` control.
> >>>
> >>>
> >>> +``V4L2_CID_COLORFX_RGB`` ``(integer)``
> >>> +    Determines the Red, Green, and Blue coefficients for
> >>> +    ``V4L2_COLORFX_SET_RGB`` color effect.
> >>> +    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
> >>> +    bits [15:8] as Green component, bits [23:16] as Red component, and
> >>> +    bits [31:24] must be zero.
> >>>
> >>>  ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
> >>>      Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> index 421300e13a41..f4bd90170105 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> @@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>       case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:   return "Min Number of Output Buffers";
> >>>       case V4L2_CID_ALPHA_COMPONENT:          return "Alpha Component";
> >>>       case V4L2_CID_COLORFX_CBCR:             return "Color Effects, CbCr";
> >>> +     case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
> >>>
> >>>       /*
> >>>        * Codec controls
> >>> @@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >>>               *min = *max = *step = *def = 0;
> >>>               break;
> >>>       case V4L2_CID_BG_COLOR:
> >>> +     case V4L2_CID_COLORFX_RGB:
> >>>               *type = V4L2_CTRL_TYPE_INTEGER;
> >>>               *step = 1;
> >>>               *min = 0;
> >>
> >> Can you make another small change here? Please change:
> >>
> >>         *max = 0xFFFFFF;
> >>
> >> to:
> >>
> >>         *max = 0xffffff;
> >>
> >> to keep in line with the coding standard for hex values.
> >
> > Sure, do it right now.
> >
> >>
> >> Also, can you add a separate patch that adds an entry here for V4L2_CID_COLORFX_CBCR
> >> that sets *max to 0xffff? I noticed that that was missing. While adding V4L2_CID_COLORFX_RGB
> >> it's good to fix V4L2_CID_COLORFX_CBCR as well.
> >
> > Sure, you mean the final code like this? first patch to fix cbcr 0xFFFFFF,
>
> For cbcr max should be 0xffff.

Sure.

>
> > another one to add V4L2_CID_COLORFX_RGB entry.
> >
> > 1395         case V4L2_CID_BG_COLOR:
> > 1396         case V4L2_CID_COLORFX_RGB:
> > 1397                 *type = V4L2_CTRL_TYPE_INTEGER;
> > 1398                 *step = 1;
> > 1399                 *min = 0;
> > 1400                 /* Max is calculated as RGB888 that is 2^24 */
>
> Actually, the comment is wrong: it should be 2^24-1. Let's fix that too.

Okay.

>
> > 1401                 *max = 0xffffff;
>
> Yes, that's what I am looking for.
>
> Regards,
>
>         Hans
>
> > 1402                 break;
> >
> > Best Regards
> > Dillon
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> >>> index 5532b5f68493..9aa3fd368383 100644
> >>> --- a/include/uapi/linux/v4l2-controls.h
> >>> +++ b/include/uapi/linux/v4l2-controls.h
> >>> @@ -128,6 +128,7 @@ enum v4l2_colorfx {
> >>>       V4L2_COLORFX_SOLARIZATION               = 13,
> >>>       V4L2_COLORFX_ANTIQUE                    = 14,
> >>>       V4L2_COLORFX_SET_CBCR                   = 15,
> >>> +     V4L2_COLORFX_SET_RGB                    = 16,
> >>>  };
> >>>  #define V4L2_CID_AUTOBRIGHTNESS                      (V4L2_CID_BASE+32)
> >>>  #define V4L2_CID_BAND_STOP_FILTER            (V4L2_CID_BASE+33)
> >>> @@ -145,9 +146,10 @@ enum v4l2_colorfx {
> >>>
> >>>  #define V4L2_CID_ALPHA_COMPONENT             (V4L2_CID_BASE+41)
> >>>  #define V4L2_CID_COLORFX_CBCR                        (V4L2_CID_BASE+42)
> >>> +#define V4L2_CID_COLORFX_RGB                 (V4L2_CID_BASE+43)
> >>>
> >>>  /* last CID + 1 */
> >>> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
> >>> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
> >>>
> >>>  /* USER-class private control IDs */
> >>>
> >>>
> >>
>

Best Regards.
Dillon
