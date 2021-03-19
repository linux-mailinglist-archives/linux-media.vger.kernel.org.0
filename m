Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3C8342030
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 15:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhCSOxg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 10:53:36 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:46807 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhCSOxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 10:53:17 -0400
X-Originating-IP: 5.92.35.220
Received: from uno.localdomain (mob-5-92-35-220.net.vodafone.it [5.92.35.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E589FC0002;
        Fri, 19 Mar 2021 14:53:12 +0000 (UTC)
Date:   Fri, 19 Mar 2021 15:53:44 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/18] media: i2c: rdacm21: Give more time to OV490 to
 boot
Message-ID: <20210319145344.ffhrxakrczxzzchp@uno.localdomain>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-13-jacopo+renesas@jmondi.org>
 <0826484e-8ae7-677e-6de2-8f019e9733fc@ideasonboard.com>
 <20210317100445.h3yqmrrnghq76mjb@uno.localdomain>
 <YFPwaoJUSxpPnbBM@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YFPwaoJUSxpPnbBM@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Mar 19, 2021 at 02:29:30AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Wed, Mar 17, 2021 at 11:04:45AM +0100, Jacopo Mondi wrote:
> > On Mon, Mar 15, 2021 at 05:22:37PM +0000, Kieran Bingham wrote:
> > > On 15/03/2021 13:15, Jacopo Mondi wrote:
> > > > It has been observed through repeated testing (250 boots) that in the
> > > > 10% of the cases the RDACM21 initialization sequence errors out due a
> > > > timeout waiting for the OV490 firmware to complete its boot phase.
> > > >
> > > > Albeit being the current timeout relatively large (300-600 milliseconds),
> > > > doubling it reduces the sporadic error rate down to 1 over an 80 boot
> > > > sequences test run.
> > > >
> > > > The firmware boot delay is unfortunately not characterized in the camera
> > > > module manual.
> > >
> > > I wonder if we could characterize this alone by pulling this down until
> > > we see failures increase, with all the other fixes in place...
> > >
> > > I don't think that's required, but it might be something to check later
> > > if we don't get rid of that 1/80 failure.
> >
> > This is actually driving me crazy :/
> >
> > I had another test run with a surprising 10% failures.
> > All the failures were due to the ov490 firmware boot I'm trying to
> > mitigate here.
> >
> > I went up to give it -6 seconds- and I still get failures in the same
> > percentage. Another run of 20 boots gave 30% failures with the delay I
> > have here in this patch. Just to make sure I was not going crazy I
> > reduced the delay to 1msec and I get an 80% failure rate.
> >
> > Still, I've seen the 1 on 80 failures (I swear! I have logs! :)
> >
> > I've checked what the BSP does, and if after some 300 attempts the
> > ov490 doesn't boot, they simply go an reset it.
> > https://github.com/renesas-rcar/linux-bsp/commit/0cf6e36f5bf49e1c2aab87139ec5b588623c56f8#diff-d770cad7d6f04923d9e89dfe7da369bb3006776d6e4fb8ef79353d5fab3cd25aR827
> > (sorry, I don't seem to be able to point you to the ov490.c#827 with
> > an URL)
>
> It resets both the sensor and the OV490. It could be interested to try
> the latter selectively to see what happens.
>

They do not make any difference :)

But..

> I also suspect that the OV490 has debugging features (possibly including
> a RAM log buffer that we could read over I2C), but we're probably
> getting out of scope here.
>
> > I assume we don't want anything like this in an upstream driver, but
> > I'm really running out of any plausible explanation :(
>
> As discussed, let's try the reset workaround, to see if it helps.
>
> I wonder if opening the camera and probing signals would be a useful
> option :-)

... I really think I've got something working (for real this time :)

Basically, as patch "media: i2c: rdacm21: Fix OV10640 powerdown" of
this series describes, the OV10640 power-up was broken before you
spotted the usage of the wrong gpio pad and it was working because of
an internal pull-up on the SPWDN line, which was erroneously left
floating. Once that was fixed, the OV10640 was always identified
correctly, leaving us with this puzzling "ov490 boot timeout error"
that manifested with more or less the same frequency of the ov10640
identification issue.

In the current implementation we power up the OV490 and wait for its
firmware to boot -before- powering up the ov10640 sensor. Most
probably (or looking at the results I get noaw, most certainly) the
OV490 firmware checks for the sensor to be available and probably
tries to program it. So we're back to the issue we originally had when
the sensor was powered because of the pull up resistor, failing to
boot in case the sensor didn't startup correctly which happened in the
20% of the cases.

If I do power up the OV10640 -before- the OV490 all the firmware boot
errors are now gone. I need to tune a bit the timeouts as after the
OV490 boot the OV10640 requires some time before being accessible.
Once I nail down the right timeouts I'll send v3. So far I got 0
errors on 50 boot attempts, finally \o/

Thanks for keep pushing, I would have swear this was an issue with the
HW design and was very close to give up like a month ago!

V3 out soon!

Thanks
   j


>
> > > > Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >
> > > > ---
> > > >  drivers/media/i2c/rdacm21.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > > > index 50a9b0d8255d..07cf077d8efd 100644
> > > > --- a/drivers/media/i2c/rdacm21.c
> > > > +++ b/drivers/media/i2c/rdacm21.c
> > > > @@ -53,7 +53,7 @@
> > > >  #define OV490_PID			0x8080300a
> > > >  #define OV490_VER			0x8080300b
> > > >  #define OV490_PID_TIMEOUT		20
> > > > -#define OV490_OUTPUT_EN_TIMEOUT		300
> > > > +#define OV490_OUTPUT_EN_TIMEOUT		600
> > > >
> > > >  #define OV490_GPIO0			BIT(0)
> > > >  #define OV490_SPWDN0			BIT(0)
>
> --
> Regards,
>
> Laurent Pinchart
