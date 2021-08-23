Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BE53F45B3
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 09:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234991AbhHWHUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 03:20:06 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:53843 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234917AbhHWHUG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 03:20:06 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4E13D240005;
        Mon, 23 Aug 2021 07:19:18 +0000 (UTC)
Date:   Mon, 23 Aug 2021 09:20:08 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [RFC 4/5] media: i2c: max9286: Fetch PIXEL_RATE in s_stream
Message-ID: <20210823072008.p6qi5lg73jsfezwn@uno.localdomain>
References: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
 <20210817072703.1167-5-jacopo+renesas@jmondi.org>
 <YSMFIfNSDvuiZWPh@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YSMFIfNSDvuiZWPh@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Aug 23, 2021 at 05:17:05AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Aug 17, 2021 at 09:27:02AM +0200, Jacopo Mondi wrote:
> > The max9286 driver needs to fetch the remote serializer PIXEL_RATE
> > control value in order to compute its own one, as the sum of the
>
> s/its own one/its own/ (or its own pixel rate)
>
> > values reported by the connected subdevices.
> >
> > Currently the control is verified to be present at notifier's bound
> > time, which requires the serializer driver to register the control at
> > probe time. As the serializer driver might need to register the control
> > later, by adding the control handler of its connected sensor, post-pone
> > the max9286 check for the control availability at start stream time.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 1b92d18a1f94..98fc90339a9e 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -595,7 +595,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
> >  	max9286_check_config_link(priv, priv->source_mask);
> >  	max9286_configure_i2c(priv, false);
> >
> > -	return max9286_set_pixelrate(priv);
> > +	return 0;
> >  }
> >
> >  static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
> > @@ -674,6 +674,10 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
> >  	int ret;
> >
> >  	if (enable) {
> > +		ret = max9286_set_pixelrate(priv);
> > +		if (ret)
> > +			return ret;
>
> That's very likely not going to work. The CSI-2 receiver connected to
> the max9286 will need to know the pixel rate as part of its
> initialization sequence, before calling .s_stream(1) on the max9286.
>

How so ? The R-Car CSI-2 receiver feteches the pixel rate at s_stream
time, I thought it was customary to do so. What is it needed for before
streamon time ?

> > +
> >  		/*
> >  		 * The frame sync between cameras is transmitted across the
> >  		 * reverse channel as GPIO. We must open all channels while
>
> --
> Regards,
>
> Laurent Pinchart
