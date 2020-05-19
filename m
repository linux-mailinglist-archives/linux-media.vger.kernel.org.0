Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455ED1D974A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 15:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgESNMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 09:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728929AbgESNMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 09:12:43 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70145C08C5C1
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 06:12:42 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u6so13654355ljl.6
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 06:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tpNMY3wCI1KptL6YOjQlZxFs9A11srHnm/Al7AZhcsM=;
        b=cv2M7LSxhOICVnOuDKYQb89fe0gaVrNBwPxCJP56J0n9UKakzqSNg4g5bbaaU2hdqt
         OZk6MrFFkm084yS5qn8WLFlIArQSBnA5JBDDf63Di6KXFXz6yloPgiLOoyypJBnXPCxS
         yDx7QSiOX8LbX957dZ/7aoBQPRDVLWGTV52RYZ2EP33oy9mBIeHaM/LJC2dsFvbDwz3j
         JBkQou+Z94APdOewdQUN3HTgxNKDiS/LSlxlT602TYPHXDIKgE//zqBhft79MfQ3Yh3N
         Re3XRoFAmgsjrSGBZfPHy1xEJF3/eI4ZpiqDCOgX5cJQtIGhfP7Y5T/2NmtesgK32rP3
         LypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tpNMY3wCI1KptL6YOjQlZxFs9A11srHnm/Al7AZhcsM=;
        b=YRomYhqfOSNWsVUe2cy8EPoA7twJFfZwrtDxdKWT97a9T0a2D6iIiXx25lHq4/+ePh
         k+A8FHYMB1lh5cv1y7E+cJjwMGCQHCB9b1ussc1tXbDa6dXgBZUbj5CW55fnw33nMnOq
         iPnxyYaYJxY+YgXJ2PSuKrxYIHVG0xJ85F9tVnE5c+yIiRSdgteahaMGp53yCqdk7SMk
         eoksfzI9HdPd0Kll5sTR2FNTyP9CDcDXtunlEmA6NUq5wrVAwCT/tzHLh8dgrZ61xhLn
         Na8eVyRmiI0Cj/lbrtiI9VgtXkx/+CcxVD+zFRFkgFmO1P2d+4a1sFzOTcwYuqP2na4d
         fxEw==
X-Gm-Message-State: AOAM531ss3NOMLEe/GInzoS7vIgEFRial0iCaB6GaGJMfnK+3Er27TGO
        d3FZRZCivX5T2lhCxyCr2Dqelg==
X-Google-Smtp-Source: ABdhPJy7SfFtJeOLXK8sDHiWKeQj33p4yeDzmoct3eC0mXCQEBOb9nZfUZD7oH40EM0uRI5LaqF3Qw==
X-Received: by 2002:a2e:b3cd:: with SMTP id j13mr6998023lje.237.1589893960827;
        Tue, 19 May 2020 06:12:40 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id b15sm2750823lfa.74.2020.05.19.06.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 06:12:39 -0700 (PDT)
Date:   Tue, 19 May 2020 15:12:39 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] media: rcar-vin: Invalidate pipeline if
 conversion is not possible on input formats
Message-ID: <20200519131239.GA470768@oden.dyn.berto.se>
References: <1586945948-11026-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586945948-11026-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200512222648.GD2542285@oden.dyn.berto.se>
 <CA+V-a8tC2KrspKWGHn8=+7DYjOUNuBXn+biS9NDB+qcqnd6f9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tC2KrspKWGHn8=+7DYjOUNuBXn+biS9NDB+qcqnd6f9w@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

On 2020-05-13 12:16:00 +0100, Lad, Prabhakar wrote:
> Hi Niklas,
> 
> Thank you for the review.
> 
> On Tue, May 12, 2020 at 11:26 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hi Lad,
> >
> > Thanks for your work.
> >
> > On 2020-04-15 11:19:06 +0100, Lad Prabhakar wrote:
> > > Up until now the VIN was capable to convert any of its supported input mbus
> > > formats to any of it's supported output pixel formats. With the addition of
> > > RAW formats this is no longer true.
> >
> > Add blank line.
> >
> > > This patch invalidates the pipeline by adding a check if given vin input
> > > format can be converted to supported output pixel format.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > I like this patch I think there is a typo bellow and patch [1] have been
> > merged in the media-tree which unfortunately addes one more thing to do
> > in this patch. In rvin_enum_fmt_vid_cap() there is a TODO noted for what
> > needs to be done. In imagine the fix is simple and the end result would
> > look something like this.
> >
> >     switch (f->mbus_code) {
> >     case 0:
> >     case MEDIA_BUS_FMT_YUYV8_1X16:
> >     case MEDIA_BUS_FMT_UYVY8_1X16:
> >     case MEDIA_BUS_FMT_UYVY8_2X8:
> >     case MEDIA_BUS_FMT_UYVY10_2X10:
> >     case MEDIA_BUS_FMT_RGB888_1X24:
> >         break;
> >     case MEDIA_BUS_FMT_SRGGB8_1X8:
> >         if (f->index)
> >             return -EINVAL;
> >
> >         f->pixelformat = V4L2_PIX_FMT_SRGGB8;
> >         return 0;
> >     case default:
> >         return -EINVAL;
> >     }
> >
> > 1. d5f74a1eff9aef3b ("media: rcar-vin: Make use of V4L2_CAP_IO_MC")
> >
> Sure Ill take of care of this and just repost this patch is that OK with you ?

Yes, also please test it as you point out bellow my last suggesting had 
a typo which would break it ;-)

> 
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-dma.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > index 1a30cd036371..48bd9bfc3948 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > @@ -1109,13 +1109,17 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
> > >       case MEDIA_BUS_FMT_UYVY8_1X16:
> > >       case MEDIA_BUS_FMT_UYVY8_2X8:
> > >       case MEDIA_BUS_FMT_UYVY10_2X10:
> > > +             break;
> > >       case MEDIA_BUS_FMT_RGB888_1X24:
> > > -             vin->mbus_code = fmt.format.code;
> >
> > This is not right is it?
> >
> > Should you not add a case for MEDIA_BUS_FMT_SRGGB8_1X8 instead of taking
> > over MEDIA_BUS_FMT_RGB888_1X24?
> >
> Agreed, I blindly took this suggestion from your previous comments [1].
> 
> [1] https://lkml.org/lkml/2020/3/19/858
> 
> Cheers,
> --Prabhakar Lad
> 
> > > +             if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB8)
> > > +                     return -EPIPE;
> > >               break;
> > >       default:
> > >               return -EPIPE;
> > >       }
> > >
> > > +     vin->mbus_code = fmt.format.code;
> > > +
> > >       switch (fmt.format.field) {
> > >       case V4L2_FIELD_TOP:
> > >       case V4L2_FIELD_BOTTOM:
> > > --
> > > 2.20.1
> > >
> >
> > --
> > Regards,
> > Niklas Söderlund

-- 
Regards,
Niklas Söderlund
