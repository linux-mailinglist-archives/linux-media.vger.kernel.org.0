Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2517433EDFB
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 11:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhCQKEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 06:04:34 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:37321 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhCQKES (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 06:04:18 -0400
Received: from uno.localdomain (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id BCE96100007;
        Wed, 17 Mar 2021 10:04:14 +0000 (UTC)
Date:   Wed, 17 Mar 2021 11:04:45 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/18] media: i2c: rdacm21: Give more time to OV490 to
 boot
Message-ID: <20210317100445.h3yqmrrnghq76mjb@uno.localdomain>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-13-jacopo+renesas@jmondi.org>
 <0826484e-8ae7-677e-6de2-8f019e9733fc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0826484e-8ae7-677e-6de2-8f019e9733fc@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran, Laurent,

On Mon, Mar 15, 2021 at 05:22:37PM +0000, Kieran Bingham wrote:
> On 15/03/2021 13:15, Jacopo Mondi wrote:
> > It has been observed through repeated testing (250 boots) that in the
> > 10% of the cases the RDACM21 initialization sequence errors out due a
> > timeout waiting for the OV490 firmware to complete its boot phase.
> >
> > Albeit being the current timeout relatively large (300-600 milliseconds),
> > doubling it reduces the sporadic error rate down to 1 over an 80 boot
> > sequences test run.
> >
> > The firmware boot delay is unfortunately not characterized in the camera
> > module manual.
> >
>
> I wonder if we could characterize this alone by pulling this down until
> we see failures increase, with all the other fixes in place...
>
> I don't think that's required, but it might be something to check later
> if we don't get rid of that 1/80 failure.

This is actually driving me crazy :/

I had another test run with a surprising 10% failures.
All the failures were due to the ov490 firmware boot I'm trying to
mitigate here.

I went up to give it -6 seconds- and I still get failures in the same
percentage. Another run of 20 boots gave 30% failures with the delay I
have here in this patch. Just to make sure I was not going crazy I
reduced the delay to 1msec and I get an 80% failure rate.

Still, I've seen the 1 on 80 failures (I swear! I have logs! :)

I've checked what the BSP does, and if after some 300 attempts the
ov490 doesn't boot, they simply go an reset it.
https://github.com/renesas-rcar/linux-bsp/commit/0cf6e36f5bf49e1c2aab87139ec5b588623c56f8#diff-d770cad7d6f04923d9e89dfe7da369bb3006776d6e4fb8ef79353d5fab3cd25aR827
(sorry, I don't seem to be able to point you to the ov490.c#827 with
an URL)

I assume we don't want anything like this in an upstream driver, but
I'm really running out of any plausible explanation :(

>
>
>
> > Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> > ---
> >  drivers/media/i2c/rdacm21.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > index 50a9b0d8255d..07cf077d8efd 100644
> > --- a/drivers/media/i2c/rdacm21.c
> > +++ b/drivers/media/i2c/rdacm21.c
> > @@ -53,7 +53,7 @@
> >  #define OV490_PID			0x8080300a
> >  #define OV490_VER			0x8080300b
> >  #define OV490_PID_TIMEOUT		20
> > -#define OV490_OUTPUT_EN_TIMEOUT		300
> > +#define OV490_OUTPUT_EN_TIMEOUT		600
> >
> >  #define OV490_GPIO0			BIT(0)
> >  #define OV490_SPWDN0			BIT(0)
> >
>
