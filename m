Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1873525D9AD
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 15:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730470AbgIDNeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 09:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730447AbgIDNaV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 09:30:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E091C061245;
        Fri,  4 Sep 2020 06:29:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D53C540;
        Fri,  4 Sep 2020 15:29:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599226164;
        bh=gaKQogjFkemHMpyyZ83iJjezV+gtGiFSIdmO7pGnQ3I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t/3vUViVhSO2SDIgevxig29k+/zBCmBsi0EwtNN/drZPC+MQc5uwwNrDJ+W+MKSW/
         Bq6aNmoE905kePmpwCDjj7xi1raIBP8gRZZBZeo2SzWUeEvrCRuY9O62H8a+XLF19F
         di6kYDU18fAuIDrx5jbE+ClIDsuyQrWCN1KvV6OM=
Date:   Fri, 4 Sep 2020 16:29:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 1/2] media: i2c: ov772x: Add support for BT656 mode
Message-ID: <20200904132900.GA7518@pendragon.ideasonboard.com>
References: <20200824190406.27478-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824190406.27478-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200904012000.GA9369@pendragon.ideasonboard.com>
 <20200904075553.qjdyskcpext7fxcy@uno.localdomain>
 <20200904082104.GE4392@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200904082104.GE4392@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Fri, Sep 04, 2020 at 11:21:04AM +0300, Sakari Ailus wrote:
> On Fri, Sep 04, 2020 at 09:55:53AM +0200, Jacopo Mondi wrote:
> > On Fri, Sep 04, 2020 at 04:20:00AM +0300, Laurent Pinchart wrote:
> > > On Mon, Aug 24, 2020 at 08:04:05PM +0100, Lad Prabhakar wrote:
> > > > Add support to read the bus-type and enable BT656 mode if needed.
> > > >
> > > > Also fail probe if unsupported bus_type is detected.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  drivers/media/i2c/ov772x.c | 32 ++++++++++++++++++++++++++++++++
> > > >  1 file changed, 32 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> > > > index 2cc6a678069a..67764d647526 100644
> > > > --- a/drivers/media/i2c/ov772x.c
> > > > +++ b/drivers/media/i2c/ov772x.c
> > > > @@ -31,6 +31,7 @@
> > > >  #include <media/v4l2-ctrls.h>
> > > >  #include <media/v4l2-device.h>
> > > >  #include <media/v4l2-event.h>
> > > > +#include <media/v4l2-fwnode.h>
> > > >  #include <media/v4l2-image-sizes.h>
> > > >  #include <media/v4l2-subdev.h>
> > > >
> > > > @@ -434,6 +435,7 @@ struct ov772x_priv {
> > > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > > >  	struct media_pad pad;
> > > >  #endif
> > > > +	struct v4l2_fwnode_endpoint ep;
> > > >  };
> > > >
> > > >  /*
> > > > @@ -581,6 +583,13 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
> > > >  	if (priv->streaming == enable)
> > > >  		goto done;
> > > >
> > > > +	if (priv->ep.bus_type == V4L2_MBUS_BT656) {
> > > > +		ret = regmap_update_bits(priv->regmap, COM7, ITU656_ON_OFF,
> > > > +					 enable ? ITU656_ON_OFF : ~ITU656_ON_OFF);
> > > > +		if (ret)
> > > > +			goto done;
> > > > +	}
> > > > +
> > > >  	ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
> > > >  				 enable ? 0 : SOFT_SLEEP_MODE);
> > > >  	if (ret)
> > > > @@ -1354,6 +1363,7 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
> > > >
> > > >  static int ov772x_probe(struct i2c_client *client)
> > > >  {
> > > > +	struct fwnode_handle *endpoint;
> > > >  	struct ov772x_priv	*priv;
> > > >  	int			ret;
> > > >  	static const struct regmap_config ov772x_regmap_config = {
> > > > @@ -1415,6 +1425,28 @@ static int ov772x_probe(struct i2c_client *client)
> > > >  		goto error_clk_put;
> > > >  	}
> > > >
> > > > +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > > > +						  NULL);
> > > > +	if (!endpoint) {
> > > > +		dev_err(&client->dev, "endpoint node not found\n");
> > > > +		ret = -EINVAL;
> > > > +		goto error_clk_put;
> > > > +	}
> > > > +
> > > > +	ret = v4l2_fwnode_endpoint_parse(endpoint, &priv->ep);
> > >
> > > v4l2_fwnode_endpoint_parse() is deprecated for new drivers,
> > > v4l2_fwnode_endpoint_alloc_parse() is recommended instead. Please note
> > > that v4l2_fwnode_endpoint_free() then needs to be called in the error
> > > path and in remove().
> > 
> > Doesn't alloc_parse() differ from just _parse() as it reserve space
> > for the 'link-frequencies' array ? As this device does not support
> > CSI-2 and the 'link-frequencies' property is not allows in bindings,
> > isn't using endpoint_parse() better as it saves a call to _free() ?
> 
> Yeah. I think the documentation needs to be updated.
> 
> The thinking was there would be other variable size properties that drivers
> would need but that didn't happen. So feel free to continue use
> v4l2_fwnode_endpoint_parse() where it does the job.

I thought the goal was to remove v4l2_fwnode_endpoint_parse() in the
future. If Sakari is happy to keep it and see it used for parallel
buses, I have no objection.

> > Or are we deprecating that function unconditionally ? The
> > documentation suggests "please use v4l2_fwnode_endpoint_alloc_parse()
> > in new drivers" but here it doesn't seem required..
> > 
> > > On the other hand, not setting .bus_type and letting the parse()
> > > function determine the but type automatically is also deprecated, and I
> > > don't think forcing drivers to call v4l2_fwnode_endpoint_alloc_parse()
> > > once for each bus type until one succeeds is a good API. As change will
> > > be needed in that API, you can ignore v4l2_fwnode_endpoint_alloc_parse()
> > > for the time being if you want.
> > 
> > But indeed relying on auto-guessing of the bus type is deprecated since
> > some time now (and the API could be improved, yes). Sorry I missed
> > that yesterday.
> 
> There's one case where the bus type does not need to be set: when bindings
> require it *and* at the same time you have no default configuration that
> requires something to be set in the bus specific struct. Bindings where
> bus-type is required were added later so I think the documentation should
> be changed there, too.
> 
> I can send the patches.

This patch shows a common use case, with a source supporting both
parallel and BT.656. Having to call v4l2_fwnode_endpoint_parse() twice,
once for each bus type, isn't a very good API in my opinion. I'd like
v4l2_fwnode_endpoint_parse() to be able to determine the bus type (using
the bus-type property) *and* support defaults with a single call.

Speaking of defaults, I wonder if it's a good idea to let that up to
drivers, or if we should standardize on one set of defaults that would
be shared by all DT bindings.

> > As we support parallel and bt.656 only I must be honest I don't mind
> > it here as otherwise the code would be more complex for no real gain,
> > but I defer this to Sakari which has been fighting the battle against
> > auto-guessing since a long time now  :)
> 
> I think you should require bus-type property in bindings in that case.
> 
> But as it's an existing driver, bus-type will be optional. You'll need to
> default to what was supported earlier. This is actually an interesting case
> as bindings do not document it.
> 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > > +	fwnode_handle_put(endpoint);
> > > > +	if (ret) {
> > > > +		dev_err(&client->dev, "Could not parse endpoint\n");
> > > > +		goto error_clk_put;
> > > > +	}
> > > > +
> > > > +	if (priv->ep.bus_type != V4L2_MBUS_PARALLEL &&
> > > > +	    priv->ep.bus_type != V4L2_MBUS_BT656) {
> > > > +		dev_err(&client->dev, "Unsupported bus type %d\n",
> > > > +			priv->ep.bus_type);
> > > > +		goto error_clk_put;
> > > > +	}
> > > > +
> > > >  	ret = ov772x_video_probe(priv);
> > > >  	if (ret < 0)
> > > >  		goto error_gpio_put;

-- 
Regards,

Laurent Pinchart
