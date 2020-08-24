Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB8C224F345
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 09:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgHXHoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 03:44:38 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:38735 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgHXHoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 03:44:38 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2AF5B10000F;
        Mon, 24 Aug 2020 07:44:32 +0000 (UTC)
Date:   Mon, 24 Aug 2020 09:48:18 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 2/4] media: i2c: max9286: Get format from remote ends
Message-ID: <20200824074818.ylrus7qevdpcgthi@uno.localdomain>
References: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
 <20200817143540.247340-3-jacopo+renesas@jmondi.org>
 <20200819124646.GB10049@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200819124646.GB10049@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Aug 19, 2020 at 03:46:46PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Aug 17, 2020 at 04:35:38PM +0200, Jacopo Mondi wrote:
> > The MAX9286 chip does not allow any modification to the image stream
> > format it de-serializes from the GMSL bus to its MIPI CSI-2 output
> > interface.
> >
> > For this reason, when the format is queried from on any of the MAX9286
> > pads, get the remote subdevice format and return it.
>
> That's not how MC-based drivers are supposed to work though. Userspace
> has to propagate formats between subdevs, it must not be done internally
> in the kernel.
>

I see your point, but in this case it's really not necessary to me.

The max9286 has not notion of image formats by itself, it just mirrors
what has been serialized on the GMSL bus and that's it.

As usual the line where things have to come from userspace and thing
that can be inferred by the driver is thin but if both you and Sakari
think this is not necessary, I'll drop.

Thanks
  j


> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 26 +++++++++++++++++++++-----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 7c292f2e2704..e6a70dbd27df 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -742,8 +742,10 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
> >  			   struct v4l2_subdev_format *format)
> >  {
> >  	struct max9286_priv *priv = sd_to_max9286(sd);
> > -	struct v4l2_mbus_framefmt *cfg_fmt;
> > +	struct v4l2_subdev_format remote_fmt = {};
> > +	struct device *dev = &priv->client->dev;
> >  	unsigned int pad = format->pad;
> > +	int ret;
> >
> >  	/*
> >  	 * Multiplexed Stream Support: Support link validation by returning the
> > @@ -754,12 +756,26 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
> >  	if (pad == MAX9286_SRC_PAD)
> >  		pad = __ffs(priv->bound_sources);
> >
> > -	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
> > -	if (!cfg_fmt)
> > -		return -EINVAL;
> > +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> > +		mutex_lock(&priv->mutex);
> > +		format->format = *v4l2_subdev_get_try_format(&priv->sd,
> > +							     cfg, pad);
> > +		mutex_unlock(&priv->mutex);
> > +
> > +		return 0;
> > +	}
> > +
> > +	remote_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > +	remote_fmt.pad = 0;
> > +	ret = v4l2_subdev_call(priv->sources[pad].sd, pad, get_fmt, NULL,
> > +			       &remote_fmt);
> > +	if (ret) {
> > +		dev_err(dev, "Unable get format on source %d\n", pad);
> > +		return ret;
> > +	}
> >
> >  	mutex_lock(&priv->mutex);
> > -	format->format = *cfg_fmt;
> > +	format->format = remote_fmt.format;
> >  	mutex_unlock(&priv->mutex);
> >
> >  	return 0;
>
> --
> Regards,
>
> Laurent Pinchart
