Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE94401ABB
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 13:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241425AbhIFLsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 07:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241342AbhIFLsc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 07:48:32 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A778C061575;
        Mon,  6 Sep 2021 04:47:27 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id e18so1810157qvl.4;
        Mon, 06 Sep 2021 04:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ydkSeattX7pqtmLuoMARpH6s/V85guG4/Y69kcyoKjI=;
        b=DP9qLeF/ReuP+/BRT604rMJmBYUser8C7kY0DRQwQSMF57xyB43PcaW+L7jArum/3z
         YfbhrnPDs2trWpYG8QQ0trqcIEOWSI+JAlaQtyo7TozwxxB8MpRiyvxwfgRfcH3D00K6
         FW8SxuXScr8jrkSt8P469DkDgLJAojMkby6lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ydkSeattX7pqtmLuoMARpH6s/V85guG4/Y69kcyoKjI=;
        b=bs0vPWNhptBqAMRL9z3esrfZht7OGQd4WMMbLvBwBzjYQFH9TOoOUvnGDqTCKLS1GL
         e8no2PqRQw++c0lXQk+Pqd2Xryml6Db6854uZ+LWMoQ7UF0GJPfbM5g+cHnvXfZaV62O
         FbZ053nF2WirJuFeI6nUoAvKPbBqOMip7gWQHvm9GXHkSZ4xzlFxEErTrmXh7QFE/zBG
         iQQwzCwS7Gm2xx/o9zVAbX1Hy9kjU45y3vDUl+KvlSXbDCIh8JpV/7OPYQQoYn82yOYb
         Iin3Z00EZgRPrq+0Ydgf+g8X4dUAFQnDZ2uIgqRGTVPSYLv84VwythUka11K9LxJ6Eq9
         jHww==
X-Gm-Message-State: AOAM533pOWkBv5G4G2qARr/MVCyoxq6QrAeHy2ETJgQaQjd7Cv3bcuyC
        WtPt6O4mC1NPyLYE9w1v0Uh7MjCIvb84QQ3I9j8=
X-Google-Smtp-Source: ABdhPJxPQH0wBMCr0pExnt7qJRixTkXQl+3Qg1d8UOcjWp23ojc7rVeaEtT0MVyZnZngr+ytTVe6IXgeNlYpnps2dW0=
X-Received: by 2002:ad4:5cc2:: with SMTP id iu2mr11555814qvb.41.1630928846389;
 Mon, 06 Sep 2021 04:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210617220229.7352-1-zev@bewilderbeest.net> <46edf81d60a38747f7d2511f840253a1c6867652.camel@linux.ibm.com>
 <HK0PR06MB338081E134AA6F43ECBCBA4DF2D29@HK0PR06MB3380.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB338081E134AA6F43ECBCBA4DF2D29@HK0PR06MB3380.apcprd06.prod.outlook.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 6 Sep 2021 11:47:14 +0000
Message-ID: <CACPK8XfE6zB9BWYq7e8WbXkPFp2Cicwv2x2dc8h6jNaR2qZV0g@mail.gmail.com>
Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't enabled
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Zev Weiss <zev@bewilderbeest.net>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, 6 Sept 2021 at 10:10, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
> > Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
> > enabled
> >
> > On Thu, 2021-06-17 at 17:02 -0500, Zev Weiss wrote:
> > > As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
> > > garbage interrupts"), the ASpeed video engine sometimes asserts
> > > interrupts that the driver hasn't enabled.  In addition to the
> > > CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
> > > patch, COMP_READY has also been observed.  Instead of playing
> > > whack-a-mole with each one individually, we can instead just blanket
> > > ignore everything we haven't explicitly enabled.
> >
> > Suspect this will fix an intermittent problem on AST2500 with screensaver.
> > Change looks good, thanks!
> >
> > Reviewed-by: Eddie James <eajames@linux.ibm.com>
> >
> Reviewed-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > >
> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

I notice this wasn't merged in the pull request you sent for v5.15.
Would you be able to ensure it makes it in the next pull request you
send?

It can have some fixes tags too:

Fixes: 65d270acb2d6 ("media: aspeed: clear garbage interrupts")
Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> > > ---
> > >
> > > Changes since v2 [1]:
> > >  - minor commit message improvements
> > >
> > > Changes since v1 [0]:
> > >  - dropped error message
> > >  - switched to a blanket-ignore approach as suggested by Ryan
> > >
> > > [0]
> > > https://lore.kernel.org/linux-arm-kernel/20201215024542.18888-1-zev@be
> > > wilderbeest.net/
> > > [1]
> > >
> > https://lore.kernel.org/openbmc/20210506234048.3214-1-zev@bewilderbees
> > > t.net/
> > >
> > >  drivers/media/platform/aspeed-video.c | 16 ++++++----------
> > >  1 file changed, 6 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/aspeed-video.c
> > > b/drivers/media/platform/aspeed-video.c
> > > index 7bb6babdcade..77611c296a25 100644
> > > --- a/drivers/media/platform/aspeed-video.c
> > > +++ b/drivers/media/platform/aspeed-video.c
> > > @@ -563,6 +563,12 @@ static irqreturn_t aspeed_video_irq(int irq, void
> > > *arg)
> > >     struct aspeed_video *video = arg;
> > >     u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
> > >
> > > +   /*
> > > +    * Hardware sometimes asserts interrupts that we haven't
> > > actually
> > > +    * enabled; ignore them if so.
> > > +    */
> > > +   sts &= aspeed_video_read(video, VE_INTERRUPT_CTRL);
> > > +
> > >     /*
> > >      * Resolution changed or signal was lost; reset the engine and
> > >      * re-initialize
> > > @@ -629,16 +635,6 @@ static irqreturn_t aspeed_video_irq(int irq, void
> > > *arg)
> > >                     aspeed_video_start_frame(video);
> > >     }
> > >
> > > -   /*
> > > -    * CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even
> > > when these
> > > -    * are disabled in the VE_INTERRUPT_CTRL register so clear them
> > > to
> > > -    * prevent unnecessary interrupt calls.
> > > -    */
> > > -   if (sts & VE_INTERRUPT_CAPTURE_COMPLETE)
> > > -           sts &= ~VE_INTERRUPT_CAPTURE_COMPLETE;
> > > -   if (sts & VE_INTERRUPT_FRAME_COMPLETE)
> > > -           sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
> > > -
> > >     return sts ? IRQ_NONE : IRQ_HANDLED;  }
> > >
>
