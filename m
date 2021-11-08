Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C3B447F54
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 13:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239386AbhKHMNh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 07:13:37 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:38513 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237547AbhKHMNg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 07:13:36 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F160B240004;
        Mon,  8 Nov 2021 12:10:49 +0000 (UTC)
Date:   Mon, 8 Nov 2021 13:11:42 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: max9271: Ignore busy loop read errors
Message-ID: <20211108121142.r7v3pe36oojy2reg@uno.localdomain>
References: <20211104110924.248444-1-jacopo+renesas@jmondi.org>
 <20211104110924.248444-2-jacopo+renesas@jmondi.org>
 <163606709702.3601475.5348110236576814282@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <163606709702.3601475.5348110236576814282@Monstersaurus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran

On Thu, Nov 04, 2021 at 11:04:57PM +0000, Kieran Bingham wrote:
> Quoting Jacopo Mondi (2021-11-04 11:09:23)
> > Valid pixel clock detection is performed by spinning on a register read
> > which if repeated too frequently might fail. As the error is not fatal
> > ignore it instead of bailing out to continue spinning until the timeout
> > completion.
> >
> > Also relax the time between bus transactions and slightly increase the
> > wait interval to mitigate the failure risk.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> This seems good to me. In your testing did you identify how many
> spins/how long it usually takes before it first detects the pixel clock?
>
> I.e. - was it cutting it close at 10ms, and we should even still extend
> this further? (as the usleep_range means we could still loop this 10 ms)

Thanks for asking, this turned out to be much quicker than expected
with the pclk_clk detected at the first or second attempts all the
times. I would not bother reducing the sleep time though.

>
> Anyway, this looks like a strong improvement.
>
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks
  j

>
> > ---
> >
> > v1->v2:
> > - Do not continue but jump to a label to respect the sleep timout after a
> >   failed read
> >
> > Niklas I kept your tag anyway, hope it's ok.
> >
> > Thanks
> >    j
> >
> > ---
> >  drivers/media/i2c/max9271.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> > index ff86c8c4ea61..aa4add473716 100644
> > --- a/drivers/media/i2c/max9271.c
> > +++ b/drivers/media/i2c/max9271.c
> > @@ -55,7 +55,7 @@ static int max9271_write(struct max9271_device *dev, u8 reg, u8 val)
> >  /*
> >   * max9271_pclk_detect() - Detect valid pixel clock from image sensor
> >   *
> > - * Wait up to 10ms for a valid pixel clock.
> > + * Wait up to 15ms for a valid pixel clock.
> >   *
> >   * Returns 0 for success, < 0 for pixel clock not properly detected
> >   */
> > @@ -64,15 +64,16 @@ static int max9271_pclk_detect(struct max9271_device *dev)
> >         unsigned int i;
> >         int ret;
> >
> > -       for (i = 0; i < 100; i++) {
> > +       for (i = 0; i < 10; i++) {
> >                 ret = max9271_read(dev, 0x15);
> >                 if (ret < 0)
> > -                       return ret;
> > +                       goto skip;
> >
> >                 if (ret & MAX9271_PCLKDET)
> >                         return 0;
> >
> > -               usleep_range(50, 100);
> > +skip:
> > +               usleep_range(1000, 1500);
> >         }
> >
> >         dev_err(&dev->client->dev, "Unable to detect valid pixel clock\n");
> > --
> > 2.33.1
> >
