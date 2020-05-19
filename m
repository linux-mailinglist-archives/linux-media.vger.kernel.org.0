Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963AC1D91D7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 10:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgESINt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 04:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgESINt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 04:13:49 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF18FC061A0C
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 01:13:48 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id CE2E1634C87;
        Tue, 19 May 2020 11:13:31 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jaxNT-00016H-Px; Tue, 19 May 2020 11:13:31 +0300
Date:   Tue, 19 May 2020 11:13:31 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] fixes! [max9286]: Validate link formats
Message-ID: <20200519081331.GC3877@valkosipuli.retiisi.org.uk>
References: <e898b72f-f793-6c0d-27a8-5a34c61f763e@ideasonboard.com>
 <20200518161159.2185855-1-kieran.bingham+renesas@ideasonboard.com>
 <d09c4eef-ebeb-8577-18ed-233bc7f33786@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d09c4eef-ebeb-8577-18ed-233bc7f33786@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 18, 2020 at 07:44:41PM +0100, Kieran Bingham wrote:
> Hi Kieran
> 
> On 18/05/2020 17:11, Kieran Bingham wrote:
> > Disallow setting a format on the source link, but enable link validation
> > by returning the format of the first bound source when getting the
> > format of the source pad.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> >  drivers/media/i2c/max9286.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index ef824d2b26b8..6c01595936d7 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -711,7 +711,10 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> >  	struct max9286_priv *priv = sd_to_max9286(sd);
> >  	struct v4l2_mbus_framefmt *cfg_fmt;
> >  
> > -	if (format->pad >= MAX9286_SRC_PAD)
> > +	/* \todo: Multiplexed streams support
> > +	 * Prevent setting the format on the shared multiplexed bus.
> > +	 */
> > +	if (format->pad == MAX9286_SRC_PAD)
> >  		return -EINVAL;
> >  
> >  	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
> > @@ -743,11 +746,17 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
> >  {
> >  	struct max9286_priv *priv = sd_to_max9286(sd);
> >  	struct v4l2_mbus_framefmt *cfg_fmt;
> > +	unsigned int pad = format->pad;
> >  
> > -	if (format->pad >= MAX9286_SRC_PAD)
> > -		return -EINVAL;
> > +	/* \todo: Multiplexed Stream Support
> > +	 * Support link validation by returning the format of the first bound
> > +	 * link. All links must have the same format, as we do not support
> > +	 * mixing, and matching of cameras connected to the max9286.
> > +	 */
> > +	if (format->pad == MAX9286_SRC_PAD)
> > +		pad = ffs(priv->bound_sources);
> 
> of course this would have to be (ffs(priv->bound_sources) - 1) as the
> first pad index is 0 ;-)

You could be clever and use __ffs() instead. :-)

> 
> >  
> > -	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
> > +	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
> >  	if (!cfg_fmt)
> >  		return -EINVAL;
> >  
> > 
> 

-- 
Sakari Ailus
