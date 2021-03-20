Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DB2342E07
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 16:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhCTPxD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 11:53:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46918 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCTPw7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 11:52:59 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C5378D3;
        Sat, 20 Mar 2021 16:52:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616255577;
        bh=EiUtEauCYCYABkl/HNQCuW9f4LXK6zPiXwbNfVE/d5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qmAKcm0HGaTvd+xD2xXV8sJsFifeJFfMbNT5H6rNchVPat+UFwicijfS4jrkpmBF0
         Fj0fZNc+EIW/f3op9PEb1WTmmyEX6MtXdBGsA1URqAlK1oB78yn6946/R/yDr5cpwu
         XWegTa0nBgumGAdoZaMR5MaR2jZ7qVZduZ+6iSuo=
Date:   Sat, 20 Mar 2021 17:52:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/19] media: i2c: rdacm21: Add dealy after OV490 reset
Message-ID: <YFYaMh832WYlsR9u@pendragon.ideasonboard.com>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
 <20210319164148.199192-12-jacopo+renesas@jmondi.org>
 <99971a13-4d02-2255-6653-569915da181d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99971a13-4d02-2255-6653-569915da181d@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Mar 19, 2021 at 04:49:44PM +0000, Kieran Bingham wrote:
> Hi Jacopo,
> 
> s/dealy/delay/ in $SUBJECT
> 
> On 19/03/2021 16:41, Jacopo Mondi wrote:
> > Add a delay after the OV490 chip is put in reset state. The reset
> > signal shall be held for at least 250 useconds.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/rdacm21.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > index babd14b21252..875bec9f7904 100644
> > --- a/drivers/media/i2c/rdacm21.c
> > +++ b/drivers/media/i2c/rdacm21.c
> > @@ -448,7 +448,10 @@ static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
> >  	if (ret)
> >  		return ret;
> >  
> > -	/* Enable GPIO1 and hold OV490 in reset during max9271 configuration. */
> > +	/*
> > +	 * Enable GPIO1 and hold OV490 in reset during max9271 configuration.
> > +	 * The reset signal has to be asserted for at least 250 useconds.
> > +	 */
> >  	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> >  	if (ret)
> >  		return ret;
> > @@ -456,6 +459,7 @@ static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
> >  	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> >  	if (ret)
> >  		return ret;
> > +	usleep_range(250, 500);
> 
> Aha, for a second there I thought the comment meant it had to be
> asserted for 250 uS before clearing it again. But it's 250 uS before
> using the OV490.
> 
> Perhaps possible to update the comment a little, but nothing that matters.

The commit message and comment should match the code, especially given
that I'm not sure here which of the two is actually incorrect. I suspect
the sleep is actually in the wrong location.

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> 
> >  	ret = max9271_configure_gmsl_link(&dev->serializer);
> >  	if (ret)
> > 

-- 
Regards,

Laurent Pinchart
