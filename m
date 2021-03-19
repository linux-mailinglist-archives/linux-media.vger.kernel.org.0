Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE645341178
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 01:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhCSAaP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 20:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbhCSAaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 20:30:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4416C06174A;
        Thu, 18 Mar 2021 17:30:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C11864FD;
        Fri, 19 Mar 2021 01:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616113808;
        bh=pboaeMKHTDgjLNXZNqaz3Xz2QAKkiPLdavp8ny4Rd94=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HlDObiI9w07ButFQxP2J5mmxd2huoornXc96s3dE2HwtVAznilgT8QA4mGgG9xPzL
         DKpWZ/F2O73jJCFSbwZUKaExLJH27JbvzzxFHFRa1VcCYmr23qa5xj7F4DXS3a9WRt
         /gU3Iv39EQCTgJ2v6leIhT6fOyty9zBgfWENLjT0=
Date:   Fri, 19 Mar 2021 02:29:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/18] media: i2c: rdacm21: Give more time to OV490 to
 boot
Message-ID: <YFPwaoJUSxpPnbBM@pendragon.ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-13-jacopo+renesas@jmondi.org>
 <0826484e-8ae7-677e-6de2-8f019e9733fc@ideasonboard.com>
 <20210317100445.h3yqmrrnghq76mjb@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210317100445.h3yqmrrnghq76mjb@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Mar 17, 2021 at 11:04:45AM +0100, Jacopo Mondi wrote:
> On Mon, Mar 15, 2021 at 05:22:37PM +0000, Kieran Bingham wrote:
> > On 15/03/2021 13:15, Jacopo Mondi wrote:
> > > It has been observed through repeated testing (250 boots) that in the
> > > 10% of the cases the RDACM21 initialization sequence errors out due a
> > > timeout waiting for the OV490 firmware to complete its boot phase.
> > >
> > > Albeit being the current timeout relatively large (300-600 milliseconds),
> > > doubling it reduces the sporadic error rate down to 1 over an 80 boot
> > > sequences test run.
> > >
> > > The firmware boot delay is unfortunately not characterized in the camera
> > > module manual.
> >
> > I wonder if we could characterize this alone by pulling this down until
> > we see failures increase, with all the other fixes in place...
> >
> > I don't think that's required, but it might be something to check later
> > if we don't get rid of that 1/80 failure.
> 
> This is actually driving me crazy :/
> 
> I had another test run with a surprising 10% failures.
> All the failures were due to the ov490 firmware boot I'm trying to
> mitigate here.
> 
> I went up to give it -6 seconds- and I still get failures in the same
> percentage. Another run of 20 boots gave 30% failures with the delay I
> have here in this patch. Just to make sure I was not going crazy I
> reduced the delay to 1msec and I get an 80% failure rate.
> 
> Still, I've seen the 1 on 80 failures (I swear! I have logs! :)
> 
> I've checked what the BSP does, and if after some 300 attempts the
> ov490 doesn't boot, they simply go an reset it.
> https://github.com/renesas-rcar/linux-bsp/commit/0cf6e36f5bf49e1c2aab87139ec5b588623c56f8#diff-d770cad7d6f04923d9e89dfe7da369bb3006776d6e4fb8ef79353d5fab3cd25aR827
> (sorry, I don't seem to be able to point you to the ov490.c#827 with
> an URL)

It resets both the sensor and the OV490. It could be interested to try
the latter selectively to see what happens.

I also suspect that the OV490 has debugging features (possibly including
a RAM log buffer that we could read over I2C), but we're probably
getting out of scope here.

> I assume we don't want anything like this in an upstream driver, but
> I'm really running out of any plausible explanation :(

As discussed, let's try the reset workaround, to see if it helps.

I wonder if opening the camera and probing signals would be a useful
option :-)

> > > Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > > ---
> > >  drivers/media/i2c/rdacm21.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > > index 50a9b0d8255d..07cf077d8efd 100644
> > > --- a/drivers/media/i2c/rdacm21.c
> > > +++ b/drivers/media/i2c/rdacm21.c
> > > @@ -53,7 +53,7 @@
> > >  #define OV490_PID			0x8080300a
> > >  #define OV490_VER			0x8080300b
> > >  #define OV490_PID_TIMEOUT		20
> > > -#define OV490_OUTPUT_EN_TIMEOUT		300
> > > +#define OV490_OUTPUT_EN_TIMEOUT		600
> > >
> > >  #define OV490_GPIO0			BIT(0)
> > >  #define OV490_SPWDN0			BIT(0)

-- 
Regards,

Laurent Pinchart
