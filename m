Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941E0443B27
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 02:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhKCB4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 21:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbhKCB4T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 21:56:19 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE93C061714;
        Tue,  2 Nov 2021 18:53:43 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id a24so1125820qvb.5;
        Tue, 02 Nov 2021 18:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gFLcv2iNn7US3zrzasnPKO6AXCRPJ7gLb5jCvOGUADY=;
        b=jcXf+Ciuvaj6v+ls6ZTfBbuy40OoXomKmlu/Ez5YnrrwxsRcn7jKAexUfD92xaKAMZ
         X56CskUI//poNj06E/w2ktPXhlxzFnou/XirhfFWpL9cT0JmkD77jhPObpDRGrJfV+Tc
         4AvuRnDMzTBUIfM8bsX2RvisklPuE4XwySge0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gFLcv2iNn7US3zrzasnPKO6AXCRPJ7gLb5jCvOGUADY=;
        b=qhJc0epKFTqcMZWusiXDHouWbDFPeHPGFlXW6nDIJD0yFhDo+VnmP1ClLvP4SpsHBb
         TgPhrovfxVqnLT8tdg5kWaucIFS2mCXAGtyB73Zrab6M3J9q+MeBOrWKXT4ibwb2IlEB
         F6kPnyrf9nozbjEjfUKzJLUHjzzEzMs9ImMK1Iy1WIuzH6jhwYGzVt2s929dLfgKV7ey
         U51lcUMis67styjKYkwaKccjgFTcDPTrkurE8gfEaAY9/B/OBlFp04rwJvqm666NGu2Y
         klisHp9+KuMxPReg3JelIWW76O7BqPrW/OhT8oeK2DVa0UcqWrKXM1EraDPHe5QjMbaq
         vE8Q==
X-Gm-Message-State: AOAM5328JNF/jxxROcJOjL5C+mgAu2iEBQ5Rx5HOy+4caEJvvaxSDFqT
        B0nTM7S+xA5g7uGhOPjhy1D7+pqn2sWv5CiMXag=
X-Google-Smtp-Source: ABdhPJy+StW+jzV25J6j1PkhBBtaSlkzkbT0bmfoxMxho8odzhmOY+bBdTb1ZsA8NxUhj4WcozWN0R7Get9OfSe6ThA=
X-Received: by 2002:a0c:edb0:: with SMTP id h16mr29696762qvr.17.1635904422404;
 Tue, 02 Nov 2021 18:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211103011357.22067-1-jammy_huang@aspeedtech.com> <CACPK8XcuhVVvbs4m5k=1d6oFiewEo2RqqOqf5R72KJ4yjiEiUw@mail.gmail.com>
In-Reply-To: <CACPK8XcuhVVvbs4m5k=1d6oFiewEo2RqqOqf5R72KJ4yjiEiUw@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 3 Nov 2021 01:53:30 +0000
Message-ID: <CACPK8XezrCtCbKVgNOPNt+N_7ki6Rctf9M8oLBHyixa+Wph2Sw@mail.gmail.com>
Subject: Re: [PATCH v2] media: aspeed: fix mode-detect always time out at 2nd run
To:     Jammy Huang <jammy_huang@aspeedtech.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 3 Nov 2021 at 01:47, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 3 Nov 2021 at 01:13, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
> >
> > aspeed_video_get_resolution() will try to do res-detect again if the
> > timing got in last try is invalid. But it will always time out because
> > VE_SEQ_CTRL_TRIG_MODE_DET is only cleared after 1st mode-detect.
> >
> > To fix the problem, just clear VE_SEQ_CTRL_TRIG_MODE_DET before setting
> > it in aspeed_video_enable_mode_detect().
> >
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

When applying, can we please have this tag added:

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")

Cheers,

Joel


>
> > ---
> > v2:
> >   - update commit message
> > ---
> >  drivers/media/platform/aspeed-video.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> > index 5ffbabf884eb..fea5e4d0927e 100644
> > --- a/drivers/media/platform/aspeed-video.c
> > +++ b/drivers/media/platform/aspeed-video.c
> > @@ -518,6 +518,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
> >         aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
> >                             VE_INTERRUPT_MODE_DETECT);
> >
> > +       /* Disable mode detect in order to re-trigger */
> > +       aspeed_video_update(video, VE_SEQ_CTRL,
> > +                           VE_SEQ_CTRL_TRIG_MODE_DET, 0);
> > +
> >         /* Trigger mode detect */
> >         aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
> >  }
> > @@ -809,10 +813,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
> >                         return;
> >                 }
> >
> > -               /* Disable mode detect in order to re-trigger */
> > -               aspeed_video_update(video, VE_SEQ_CTRL,
> > -                                   VE_SEQ_CTRL_TRIG_MODE_DET, 0);
> > -
> >                 aspeed_video_check_and_set_polarity(video);
> >
> >                 aspeed_video_enable_mode_detect(video);
> > --
> > 2.25.1
> >
