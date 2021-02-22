Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E72320F52
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 03:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhBVCIH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 21:08:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55074 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbhBVCIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 21:08:06 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AE13517;
        Mon, 22 Feb 2021 03:07:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613959640;
        bh=N3aMmfIUEadOI2Iioow3EmeF/Ng+HvjdFDJWbVjH194=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wH/02blkfOHdWMcl1C5m7/PZWF8vIVCrvEFxlF3P+ll3s7E0bnLEHpQN3SqB+LNa5
         rmscB6c8/B4XmfI4N5lBOVNDIJFqTjgZifk5y91EBN2zE159r0J8qn0aB60B1eb7DL
         jm4no49nUlkkFR4Kt9FGhwYp1DnzGa2Q18NrPOMQ=
Date:   Mon, 22 Feb 2021 04:06:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/16] media: i2c: gmsl: Use 339Kbps I2C bit-rate
Message-ID: <YDMRuGL1HeKeYL18@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-17-jacopo+renesas@jmondi.org>
 <aa7d8a9c-93a0-8c14-4fe4-b831e7b45d88@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aa7d8a9c-93a0-8c14-4fe4-b831e7b45d88@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Feb 18, 2021 at 04:07:30PM +0000, Kieran Bingham wrote:
> On 16/02/2021 17:41, Jacopo Mondi wrote:
> > With the camera modules initialization routines now running with
> > the noise immunity threshold enabled, it is possible to restore
> > the bit rate of the I2C transactions transported on the GMSL control
> > channel to 339 Kbps.
> > 
> > The 339 Kbps bit rate represents the default setting for the serializer
> > and the deserializer chips, and the setup/hold time and slave timeout
> > time in use are calibrate to support that rate.
> 
> s/calibrate/calibrated/
> 
> Does that mean the setup/hold time and timeouts should be adjusted based
> on the i2c speed? (which we have not been doing?)
> 
> With all of your other reliability improvements, does *this* change
> alone have any difference or impact on reliability?
> 
> I.e. if we go slower (stay at current speed) - would we be more reliable?
> 
> Is there a reliability improvement by making this speed faster?
> 
> I presume we don't have a way to convey the i2c bus speed between the
> max9286 and the max9271 currently? Seems a bit like a bus parameter....

There's a max bus speed DT parameter that we can use. And I think we
should, as, in theory at least, there's no guarantee that all the
devices behind the serializer can operate at 400kbps.

> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 2 +-
> >  drivers/media/i2c/rdacm20.c | 2 +-
> >  drivers/media/i2c/rdacm21.c | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index aa01d5bb79ef..0b620f2f8c41 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -330,7 +330,7 @@ static int max9286_i2c_mux_init(struct max9286_priv *priv)
> >  static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
> >  {
> >  	u8 config = MAX9286_I2CSLVSH_469NS_234NS | MAX9286_I2CSLVTO_1024US |
> > -		    MAX9286_I2CMSTBT_105KBPS;
> > +		    MAX9286_I2CMSTBT_339KBPS;
> >  
> >  	if (localack)
> >  		config |= MAX9286_I2CLOCACK;
> > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > index 0632ef98eea7..d45e8b0e52a0 100644
> > --- a/drivers/media/i2c/rdacm20.c
> > +++ b/drivers/media/i2c/rdacm20.c
> > @@ -450,7 +450,7 @@ static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
> >  	ret = max9271_configure_i2c(&dev->serializer,
> >  				    MAX9271_I2CSLVSH_469NS_234NS |
> >  				    MAX9271_I2CSLVTO_1024US |
> > -				    MAX9271_I2CMSTBT_105KBPS);
> > +				    MAX9271_I2CMSTBT_339KBPS);
> >  	if (ret)
> >  		return ret;
> >  
> > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > index 80b6f16f87a8..552985026458 100644
> > --- a/drivers/media/i2c/rdacm21.c
> > +++ b/drivers/media/i2c/rdacm21.c
> > @@ -442,7 +442,7 @@ static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
> >  	ret = max9271_configure_i2c(&dev->serializer,
> >  				    MAX9271_I2CSLVSH_469NS_234NS |
> >  				    MAX9271_I2CSLVTO_1024US |
> > -				    MAX9271_I2CMSTBT_105KBPS);
> > +				    MAX9271_I2CMSTBT_339KBPS);
> >  	if (ret)
> >  		return ret;
> >  

-- 
Regards,

Laurent Pinchart
