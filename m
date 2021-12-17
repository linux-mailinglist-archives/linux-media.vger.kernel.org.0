Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4D2478C4D
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 14:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhLQN1R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 08:27:17 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:39869 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhLQN1Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 08:27:16 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B8F74240004;
        Fri, 17 Dec 2021 13:27:11 +0000 (UTC)
Date:   Fri, 17 Dec 2021 14:28:04 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/6] media: max9286: Implement set_routing
Message-ID: <20211217132804.n6hztoeajm2mnd3g@uno.localdomain>
References: <20211216174746.147233-1-jacopo+renesas@jmondi.org>
 <20211216174746.147233-3-jacopo+renesas@jmondi.org>
 <YbvuYIQJ6kDxDhHA@pendragon.ideasonboard.com>
 <Ybvziu4AAaaSSSIs@pendragon.ideasonboard.com>
 <Ybv0yYau//LuiqYd@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ybv0yYau//LuiqYd@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Dec 17, 2021 at 04:24:09AM +0200, Laurent Pinchart wrote:
> On Fri, Dec 17, 2021 at 04:18:51AM +0200, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Another comment.
> >
> > On Fri, Dec 17, 2021 at 03:56:48AM +0200, Laurent Pinchart wrote:
> > > On Thu, Dec 16, 2021 at 06:47:42PM +0100, Jacopo Mondi wrote:
> > > > Add the set_routing() subdev operation to allow userspace to configure
> > > > routing on the max9286 deserializer.
> > > >
> > > > Implement route verification but do not take routing into consideration
> > > > when configuring the CSI-2 output and pixel rate yet.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  drivers/media/i2c/max9286.c | 89 ++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 87 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > > index 1b9ff537d08e..eb76acdb2cd9 100644
> > > > --- a/drivers/media/i2c/max9286.c
> > > > +++ b/drivers/media/i2c/max9286.c
> > > > @@ -832,6 +832,91 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
> > > >  	return 0;
> > > >  }
> > > >
> > > > +static int max9286_routing_validate(struct max9286_priv *priv,
> > > > +				    struct v4l2_subdev_krouting *routing)
> > > > +{
> > > > +	unsigned int i;
> > > > +	int ret;
> > > > +
> > > > +	ret = v4l2_subdev_routing_validate_1_to_1(routing);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/*
> > > > +	 * Make sure all routes points to the single source pad which can have
> > > > +	 * up to 4 streams. All routes shall start from a sink pad and shall not
> > > > +	 * have more than one sink stream. The GMSL link for the sink has to be
> > > > +	 * enabled.
> > > > +	 */
> > > > +	for (i = 0; i < routing->num_routes; ++i) {
> > > > +		const struct v4l2_subdev_route *route = &routing->routes[i];
> > > > +		struct max9286_source *source = &priv->sources[i];
> >
> > There's no need to initialize source here.
> >
> > > > +
> > > > +		if (route->source_pad != MAX9286_SRC_PAD ||
> > > > +		    route->source_stream > 4) {
> > > > +			dev_err(&priv->client->dev,
> > > > +				"Invalid (%u,%u) source in route %u\n",
> > > > +				route->source_pad, route->source_stream, i);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +
> > > > +		if (route->sink_pad >= MAX9286_N_SINKS ||
> > > > +		    route->sink_stream != 0) {
> > > > +			dev_err(&priv->client->dev,
> > > > +				"Invalid (%u,%u) sink in route %u\n",
> > > > +				route->sink_pad, route->sink_stream, i);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +
> > > > +		source = &priv->sources[route->sink_pad];
> > > > +		if (!source->fwnode) {
> > > > +			dev_err(&priv->client->dev,
> > > > +				"Cannot set route for non-active source %u\n",
> > > > +				route->sink_pad);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +	}
> > >
> > > Apart from from possibly using the new helper I've submitted, this looks
> > > fine.
> >
> > The helper should allow to drop the source_pad and sink_pad checks, but
> > the source_stream and sink_stream checks are still needed. This may be
> > possible to factorize in the helper too, let's see when we'll have more
> > use cases.
> >
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int _max9286_set_routing(struct v4l2_subdev *sd,
> > > > +				struct v4l2_subdev_state *state,
> > > > +				struct v4l2_subdev_krouting *routing)
> > > > +{
> > > > +	struct max9286_priv *priv = sd_to_max9286(sd);
> > > > +	int ret;
> > > > +
> > > > +	ret = max9286_routing_validate(priv, routing);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/* Re-initialize the format on a routing change. */
> > > > +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> > > > +					       &max9286_default_format);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int max9286_set_routing(struct v4l2_subdev *sd,
> > > > +			       struct v4l2_subdev_state *state,
> > > > +			       enum v4l2_subdev_format_whence which,
> > > > +			       struct v4l2_subdev_krouting *routing)
> > > > +{
> > > > +	struct max9286_priv *priv = sd_to_max9286(sd);
> > > > +	unsigned int i;
>
> priv and i are not used (they will be used in a patch later in the
> series, so should be moved there).
>

Ah ups, I've not compiled this in isolation it seems

> > > > +	int ret;
> > > > +
> > > > +	v4l2_subdev_lock_state(state);
> > > > +
> > >
> > > I'd drop the blank line, or add one before the unlock call.
> > >
> > > > +	ret = _max9286_set_routing(sd, state, routing);
> > > > +	v4l2_subdev_unlock_state(state);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > >  static int max9286_init_cfg(struct v4l2_subdev *sd,
> > > >  			    struct v4l2_subdev_state *state)
> > > >  {
> > > > @@ -858,8 +943,7 @@ static int max9286_init_cfg(struct v4l2_subdev *sd,
> > > >  	routing.routes = routes;
> > > >
> > > >  	v4l2_subdev_lock_state(state);
> > > > -	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> > > > -					       &max9286_default_format);
> > > > +	ret = _max9286_set_routing(sd, state, &routing);
> > > >  	v4l2_subdev_unlock_state(state);
>
> This is identical to max9286_set_routing(), you could call it directly,
> and then merge _max9286_set_routing() and max9286_set_routing().
>

meh, yes it is right now, but later max9286_set_routing() will also
configure the pixelrate. Also, max9286_set_routing() needs a whence,
something I don't have here.

I would keep it the way it is if that's ok for you.

Thanks
   j

> > > >
> > > >  	return ret;
> > > > @@ -874,6 +958,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
> > > >  	.enum_mbus_code = max9286_enum_mbus_code,
> > > >  	.get_fmt	= max9286_get_fmt,
> > > >  	.set_fmt	= max9286_set_fmt,
> > > > +	.set_routing	= max9286_set_routing,
> > > >  };
> > > >
> > > >  static const struct v4l2_subdev_ops max9286_subdev_ops = {
>
> --
> Regards,
>
> Laurent Pinchart
