Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E3133EB00
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 09:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhCQIEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 04:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhCQIEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 04:04:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E2CC06174A;
        Wed, 17 Mar 2021 01:04:20 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m22so1598576lfg.5;
        Wed, 17 Mar 2021 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FUPm4RpaV2flCAb6DF7pMgUp28+UBn+ziuYgSdeJeKc=;
        b=JgRgaDeGZutK+gtH0KLs+dAZbzISYUAYeTzXYmvUVbal4N2i/pGGZfWXYtoDY5HSt+
         gq0WTX98Nq9OgK+4yAY64ZhyHWz9ZzLjOVevI2QofS41rKMtuxqhWzzwjAoOpbkvFpU6
         oKNKaUPY+EvY6YQRXZxzwXl1rRKPQBnjrQlHx0LGNTVeo7KYpi811ANdO7ax5z+R1LWC
         57SYFh+88wEYoP0fh5TwXaCwg1dA+d/MUlM3BjeDHykjpX7SN0I062Fqa8CLlYsqJr5f
         azLs9xB20dgt16V3F4qpU1/sLfzt4TixkbJdOrePCdORsJ8+Mck+hJodt6cq6EIBPu4L
         w+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FUPm4RpaV2flCAb6DF7pMgUp28+UBn+ziuYgSdeJeKc=;
        b=RUBDCWzOV/0WDuInCIV1dhMqwsv+Mv5IHtWY2SA2zgDsCnV6K7qAb6yqUsEah5rSG4
         QrouxnBGf1ckB/iY1ZmxZnpXzgHy7YPdnZD/Bslhj9YoMUyhErGtJQGftgjDsl9Tkdim
         qfWz8PEeb3FKRz4rinyBCuqITSPhX97V6VWHBKu4Q3QcpxdQ+KgbEtNswqR3S3+jL4Vn
         zDPNjgIyUtvI9P8ok3Z9bANSlJfx63JK/H+tSD4MQIZxNMuKoOxBZi+NDKkLgD4p+3Zw
         +YYycxVz7zJOMUXYVZ7qCBDIujgMzn+39v6j6rCUl30ykZpNgYs9xMmbaxSckBEo/Ec3
         Iyxg==
X-Gm-Message-State: AOAM532IHXeRdH1VbPg2vyOO/qsvCXkeJvtYcBb3Cy5cjhv2U9YiIkob
        Y8R82vdz0ncQUubyweTvAldEbmw7+xay3a1Mzjg=
X-Google-Smtp-Source: ABdhPJwDn2GpqOrAKw0t8ZpmxbO4FyHNbGWf3qibDeKA/BSD2J0/eJfrDcUoPhDKX+B99CcMR7BMa0oSGRF/oQwncp4=
X-Received: by 2002:a05:6512:131c:: with SMTP id x28mr1621459lfu.387.1615968259071;
 Wed, 17 Mar 2021 01:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-2-sergey.senozhatsky@gmail.com> <CAPybu_19hztQQEi0H40sWZQMb-X7g7dDuW4Mz8_gRv-nG2tghw@mail.gmail.com>
 <YFFb2ePwiW+8ti4D@google.com>
In-Reply-To: <YFFb2ePwiW+8ti4D@google.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Wed, 17 Mar 2021 09:04:02 +0100
Message-ID: <CAPybu_1ng4GBVx64FQRR+rm2FcqLHkpW9c78AXg_P_6aR=2BKg@mail.gmail.com>
Subject: Re: [PATCHv2 1/3] media: v4l UAPI docs: document ROI selection targets
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Wed, Mar 17, 2021 at 2:31 AM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> On (21/03/16 19:19), Ricardo Ribalda Delgado wrote:
> > > +Configuration of Region of Interest (ROI)
> > > +=========================================
> > > +
> > > +The range of coordinates of the top left corner, width and height of
> > > +areas that can be ROI is given by the ``V4L2_SEL_TGT_ROI_BOUNDS`` target.
> > > +It is recommended for the driver developers to put the top/left corner
> > > +at position ``(0,0)``. The rectangle's coordinates are in global sensor
> > > +coordinates. The units are in pixels and independent of the field of view.
> > > +They are not impacted by any cropping or scaling that is currently being
> > > +used.
> >
> > Can we also mention binning here?
>
> What's binning? Is it in the UVC spec?

Binning is when you reduce an image by adding up surrounding pixels.

So you have a 100x100 image that you convert to a 50x50 but showing
the same area of interest.


>
> > > +The top left corner, width and height of the Region of Interest area
> > > +currently being employed by the device is given by the
> > > +``V4L2_SEL_TGT_ROI_CURRENT`` target. It uses the same coordinate system
> > > +as ``V4L2_SEL_TGT_ROI_BOUNDS``.
> >
> > Why do we need current? Cant we just read back V4L2_SEL_TGT_ROI ?
>
> We don't. Will remove it.
>
> > > +    * - ``V4L2_SEL_TGT_ROI_CURRENT``
> > > +      - 0x0200
> > > +      - Current Region of Interest rectangle.
> > > +      - Yes
> > > +      - No
> > > +    * - ``V4L2_SEL_TGT_ROI_DEFAULT``
> > > +      - 0x0201
> > > +      - Suggested Region of Interest rectangle.
> > > +      - Yes
> > > +      - No
> > > +    * - ``V4L2_SEL_TGT_ROI_BOUNDS``
> > > +      - 0x0202
> > > +      - Bounds of the Region of Interest rectangle. All valid ROI rectangles fit
> > > +       inside the ROI bounds rectangle.
> > > +      - Yes
> > > +      - No
> > > +    * - ``V4L2_SEL_TGT_ROI``
> > > +      - 0x0203
> > > +      - Sets the new Region of Interest rectangle.
> > > +      - Yes
> > > +      - No
> > As mentioned before I think we should not have TGT_ROI_CURRENT and TGT_ROI
>
> Agreed.
>
> > > diff --git a/include/uapi/linux/v4l2-common.h b/include/uapi/linux/v4l2-common.h
> > > index 7d21c1634b4d..d0c108fba638 100644
> > > --- a/include/uapi/linux/v4l2-common.h
> > > +++ b/include/uapi/linux/v4l2-common.h
> > > @@ -78,6 +78,14 @@
> > >  #define V4L2_SEL_TGT_COMPOSE_BOUNDS    0x0102
> > >  /* Current composing area plus all padding pixels */
> > >  #define V4L2_SEL_TGT_COMPOSE_PADDED    0x0103
> > > +/* Current Region of Interest area */
> > > +#define V4L2_SEL_TGT_ROI_CURRENT       0x0200
> > > +/* Default Region of Interest area */
> > > +#define V4L2_SEL_TGT_ROI_DEFAULT       0x0201
> > > +/* Region of Interest bounds */
> > > +#define V4L2_SEL_TGT_ROI_BOUNDS        0x0202
> > > +/* Set Region of Interest area */
> > > +#define V4L2_SEL_TGT_ROI               0x0203
> >
> > Nit: Maybe it could be a good idea to split doc and code. This way the
> > backports/fixes are easier.
>
> I'm quite sure this is the first time I'm being asked to split code
> and documentation :) I'm usually asked to do the opposite - merge code
> and documentation.

I got answered in both directions.  I prefer to split it because the
doc can go to different audience than the code, and then it makes my
life easier when backporting.

But if you or Laurent prefer  otherwise I am of course happy with any option ;)



-- 
Ricardo Ribalda
