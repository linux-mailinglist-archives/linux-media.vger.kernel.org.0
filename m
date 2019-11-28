Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C2510CA56
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 15:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfK1O3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 09:29:03 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:46114 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1O3D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 09:29:03 -0500
Received: by mail-il1-f194.google.com with SMTP id q1so24358588ile.13;
        Thu, 28 Nov 2019 06:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sMU0IL8Rlq+6fLrJTHisOtaFzn6MftRpT5q5jbwKEnw=;
        b=YFZ7jtEkcvX4TmeNwPif9CPkdwTp+mxAUEY4FjYbYpXyvr6efWAcYCoSjcmloOni+C
         B2fcNsZhUGrmrruDM1Fn3X4PTW/l9ttFWinZhFQKNMSavM0wykqfuMFiTbZSRC36UeBK
         pLV3M7nttXdZVdlpHpkYXvsYGV5MV9SVURwDy9O/5Js5r5o+q/RVNMaEfoUKKVONYEmi
         HLg3M87cTSJGEVsZknsUUCwE67azeSxwSk7vAhOHPWIyNlJKro3oKWSJUPBFRJ9lm+vz
         GerFAYGEf0CKOc6/T05YALXGQXDLIErDrirC6thnR/8sLw2iW41oDC7q72EBEaU0UuSI
         ECnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sMU0IL8Rlq+6fLrJTHisOtaFzn6MftRpT5q5jbwKEnw=;
        b=rW+vAjZP9worDcfQMMP6EdvSaMYJeERhwrbK8fbBAXFWdiLBAxjZOxikH5Q+Vx16ea
         S8jaeF1ejZ4zH2TY1B28Unsio66yf4KCIvicWNCpv5vqntSM0DjeiDFqmtzqrlrUEh+3
         B7dgPaoXp5kh6g9ylzRy9FYxdT0hWyA5rfMx8yoeiRty/5bzFeFQIkPsFiOpKn8SkCgi
         1opt95XqB1bZ+l+4s/qmOmYbxGQLgH1S5uhbUH/Mow4nOEED8HAgwhL2GsDk5oX1w8sQ
         qOBRDfSLgrfqOr+9bVgyQtuTF4iofwf1Pr+LckysaN91+Lmr1HGVuTI/ZFhuJAxRHLA1
         QKXA==
X-Gm-Message-State: APjAAAWuObxHDV69yONcmx/A5S1eZvEnAMfz/aTmEn/RjqikYYD6HGGN
        TPlECHYyYHIz9sAOzf1+mqn7yQUvXdV/vnydTuY=
X-Google-Smtp-Source: APXvYqw67ERvKvsiBbN3SrEbzFjudGN5TzFNOBhuzvLOM1d9Nzm89YSmkAMVOANimiYGEaCZyTwj0zrIZHwowONaGWQ=
X-Received: by 2002:a92:4095:: with SMTP id d21mr7689377ill.158.1574951341870;
 Thu, 28 Nov 2019 06:29:01 -0800 (PST)
MIME-Version: 1.0
References: <20191029124211.15052-1-aford173@gmail.com> <CAHCN7xKAJ3koJc1H2zyGFG3J6qu+uw0jozT=pQ_0i8HStX5TbQ@mail.gmail.com>
 <20191128102141.beq7wzdu5vxwx7wk@uno.localdomain>
In-Reply-To: <20191128102141.beq7wzdu5vxwx7wk@uno.localdomain>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 28 Nov 2019 08:28:49 -0600
Message-ID: <CAHCN7xJpa68bB+acaywq+ca0sG0gYXM2wBiK=50KWLVp6e-9FA@mail.gmail.com>
Subject: Re: [PATCH] media: ov5640: Fix check for PLL1 exceeding max allowed rate
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Adam Ford <adam.ford@logicpd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 28, 2019 at 4:19 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Adam,
>
> On Tue, Nov 26, 2019 at 08:08:05PM -0600, Adam Ford wrote:
> > On Tue, Oct 29, 2019 at 7:42 AM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > The variable _rate is by ov5640_compute_sys_clk() which returns
> > > zero if the PLL exceeds 1GHz.  Unfortunately, the check to see
> > > if the max PLL1 output is checking 'rate' and not '_rate' and
> > > 'rate' does not ever appear to be 0.
>
> This seems a bit convoluted. What about:
>
> "The PLL calculation routine checks the wrong variable 'rate' to
> verify that the calculated PLL1 output frequency does not exceed
> 1GHz. Fix this by using the correct '_rate' one."
>
> Or something against these lines

That makes sense.

I'll do a V2 for this patch and change the description and add your
'acked-by' note to it.

I probably won't get to it until this weekend, since today is a
holiday in the US, and I am traveling.

adam
>
> > >
> > > This patch changes the check against the returned value of
> > > '_rate' to determine if the PLL1 output exceeds 1GHz.
> > >
> > > Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")
> > >
> >
> > I haven't seen any responses to this patch.  Has anyone had a chance
> > to review this?  It's been nearly a month.
>
> You're totally right! Sorry about this
>
> > I think it would be appropriate to backport to stable if deemed acceptable.
> >
>
> Indeed! This fixes a real issue
>
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Thanks
>   j
>
> > adam
> >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index 5e495c833d32..bb968e764f31 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -874,7 +874,7 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
> > >                          * We have reached the maximum allowed PLL1 output,
> > >                          * increase sysdiv.
> > >                          */
> > > -                       if (!rate)
> > > +                       if (!_rate)
> > >                                 break;
> > >
> > >                         /*
> > > --
> > > 2.17.1
> > >
