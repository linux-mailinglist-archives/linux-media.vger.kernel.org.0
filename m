Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A038632453B
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 21:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235342AbhBXUbo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 15:31:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54192 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235572AbhBXUbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 15:31:38 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D4E56F2;
        Wed, 24 Feb 2021 21:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614198656;
        bh=pLgfsuafsPDboJPr9N3N8ecDqm7hVj7xTmyhFWSz2ek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jZmVUqy+8Xs6bIOHQfS3fbNpdxiSEFk1qkhYIYuKvs5Twi2P0URL5iE+zcd94AKVu
         YH7j1kAKPlj9lf6QYebrLQKvUb2KeTcI0ovpBCpTvYS9HZQSTwZBawjn8uY9IwKl34
         R/GPUBXa+oWD+51fjlNIKJ1/NtnW55aL1u5ulNkw=
Date:   Wed, 24 Feb 2021 22:30:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/16] media: i2c: rdacm21: Re-work OV10640 initialization
Message-ID: <YDa3ZEY1FFdxlCkl@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-10-jacopo+renesas@jmondi.org>
 <YDMIfTtc7ottA6Ir@pendragon.ideasonboard.com>
 <20210222151913.a4teevpafzxi2xlz@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210222151913.a4teevpafzxi2xlz@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 22, 2021 at 04:19:13PM +0100, Jacopo Mondi wrote:
> On Mon, Feb 22, 2021 at 03:27:25AM +0200, Laurent Pinchart wrote:
> > On Tue, Feb 16, 2021 at 06:41:39PM +0100, Jacopo Mondi wrote:
> > > The OV10640 image sensor reset and powerdown on signals are controlled
> >
> > s/ on//
> >
> > > by the embedded OV490 ISP. The current reset procedure does not respect
> > > the 1 millisecond power-up delay and releases the reset signal before
> > > the powerdown one.
> > >
> > > Fix the OV10640 power up sequence by releasing the powerdown signal,
> > > waiting the mandatory 1 millisecond power up delay and then releasing
> > > the reset signal. The reset delay is not characterized in the chip
> > > manual if not as "255 XVCLK + initialization". Wait for at least 3
> > > milliseconds to guarantee the SCCB bus is available.
> > >
> > > This commit fixes a sporadic start-up error triggered by a failure to
> > > read the OV10640 chip ID:
> > > rdacm21 8-0054: OV10640 ID mismatch: (0x01)
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/i2c/rdacm21.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > > index b22a2ca5340b..c420a6b96879 100644
> > > --- a/drivers/media/i2c/rdacm21.c
> > > +++ b/drivers/media/i2c/rdacm21.c
> > > @@ -333,13 +333,15 @@ static int ov10640_initialize(struct rdacm21_device *dev)
> > >  {
> > >  	u8 val;
> > >
> > > -	/* Power-up OV10640 by setting RESETB and PWDNB pins high. */
> > > +	/* Power-up OV10640 by setting PWDNB and RESETB pins high. */
> > >  	ov490_write_reg(dev, OV490_GPIO_SEL0, OV490_GPIO0);
> > >  	ov490_write_reg(dev, OV490_GPIO_SEL1, OV490_SPWDN0);
> > >  	ov490_write_reg(dev, OV490_GPIO_DIRECTION0, OV490_GPIO0);
> > >  	ov490_write_reg(dev, OV490_GPIO_DIRECTION1, OV490_SPWDN0);
> > > -	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
> > > +
> > >  	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_SPWDN0);
> >
> > Shouldn't this be OV490_GPIO_OUTPUT_VALUE1 ?
> 
> Ouch, yes it should
> 
> > > +	usleep_range(1500, 3000);
> > > +	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
> >
> > I'm a bit puzzled by why this patch would improve the ID read issue,
> > given that it sets GPIO0 to 1, then sets GPIO0 to 1, compared to
> > previously setting GPIO0 to 1 following by setting GPIO0 to 1 :-) Maybe
> 
> :) it doesn't make things worse at least!
> 
> > it's the additional delay ? In any case, it would probably be a good
> > idea to perform additional tests after fixing this.
> 
> I think the additional delay plays indeed a role, as it's a
> requirement in the datasheet that was not respected, but now I'm dead
> scared to fix this and find out I've opened another can of worms..

With some luck it will be the opposite, and fixing this will make the
startup sequence much more reliable. Of course luck has been quite
scarce so far for anything even remotely related to GMSL, so I won't
hold my breath.

> > >  	usleep_range(3000, 5000);
> > >
> > >  	/* Read OV10640 ID to test communications. */

-- 
Regards,

Laurent Pinchart
