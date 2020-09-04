Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5369C25D36D
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 10:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgIDIVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 04:21:38 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57498 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726425AbgIDIVi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 04:21:38 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 1024C634C8C;
        Fri,  4 Sep 2020 11:21:05 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kE6y0-0001Zg-Vm; Fri, 04 Sep 2020 11:21:04 +0300
Date:   Fri, 4 Sep 2020 11:21:04 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 1/2] media: i2c: ov772x: Add support for BT656 mode
Message-ID: <20200904082104.GE4392@valkosipuli.retiisi.org.uk>
References: <20200824190406.27478-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824190406.27478-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200904012000.GA9369@pendragon.ideasonboard.com>
 <20200904075553.qjdyskcpext7fxcy@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904075553.qjdyskcpext7fxcy@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Jacopo,

On Fri, Sep 04, 2020 at 09:55:53AM +0200, Jacopo Mondi wrote:
> Hi Laurent,
> 
> On Fri, Sep 04, 2020 at 04:20:00AM +0300, Laurent Pinchart wrote:
> > Hi Prabhakar,
> >
> > Thank you for the patch.
> >
> > On Mon, Aug 24, 2020 at 08:04:05PM +0100, Lad Prabhakar wrote:
> > > Add support to read the bus-type and enable BT656 mode if needed.
> > >
> > > Also fail probe if unsupported bus_type is detected.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/media/i2c/ov772x.c | 32 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 32 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> > > index 2cc6a678069a..67764d647526 100644
> > > --- a/drivers/media/i2c/ov772x.c
> > > +++ b/drivers/media/i2c/ov772x.c
> > > @@ -31,6 +31,7 @@
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-event.h>
> > > +#include <media/v4l2-fwnode.h>
> > >  #include <media/v4l2-image-sizes.h>
> > >  #include <media/v4l2-subdev.h>
> > >
> > > @@ -434,6 +435,7 @@ struct ov772x_priv {
> > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > >  	struct media_pad pad;
> > >  #endif
> > > +	struct v4l2_fwnode_endpoint ep;
> > >  };
> > >
> > >  /*
> > > @@ -581,6 +583,13 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
> > >  	if (priv->streaming == enable)
> > >  		goto done;
> > >
> > > +	if (priv->ep.bus_type == V4L2_MBUS_BT656) {
> > > +		ret = regmap_update_bits(priv->regmap, COM7, ITU656_ON_OFF,
> > > +					 enable ? ITU656_ON_OFF : ~ITU656_ON_OFF);
> > > +		if (ret)
> > > +			goto done;
> > > +	}
> > > +
> > >  	ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
> > >  				 enable ? 0 : SOFT_SLEEP_MODE);
> > >  	if (ret)
> > > @@ -1354,6 +1363,7 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
> > >
> > >  static int ov772x_probe(struct i2c_client *client)
> > >  {
> > > +	struct fwnode_handle *endpoint;
> > >  	struct ov772x_priv	*priv;
> > >  	int			ret;
> > >  	static const struct regmap_config ov772x_regmap_config = {
> > > @@ -1415,6 +1425,28 @@ static int ov772x_probe(struct i2c_client *client)
> > >  		goto error_clk_put;
> > >  	}
> > >
> > > +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > > +						  NULL);
> > > +	if (!endpoint) {
> > > +		dev_err(&client->dev, "endpoint node not found\n");
> > > +		ret = -EINVAL;
> > > +		goto error_clk_put;
> > > +	}
> > > +
> > > +	ret = v4l2_fwnode_endpoint_parse(endpoint, &priv->ep);
> >
> > v4l2_fwnode_endpoint_parse() is deprecated for new drivers,
> > v4l2_fwnode_endpoint_alloc_parse() is recommended instead. Please note
> > that v4l2_fwnode_endpoint_free() then needs to be called in the error
> > path and in remove().
> 
> Doesn't alloc_parse() differ from just _parse() as it reserve space
> for the 'link-frequencies' array ? As this device does not support
> CSI-2 and the 'link-frequencies' property is not allows in bindings,
> isn't using endpoint_parse() better as it saves a call to _free() ?

Yeah. I think the documentation needs to be updated.

The thinking was there would be other variable size properties that drivers
would need but that didn't happen. So feel free to continue use
v4l2_fwnode_endpoint_parse() where it does the job.

> 
> Or are we deprecating that function unconditionally ? The
> documentation suggests "please use v4l2_fwnode_endpoint_alloc_parse()
> in new drivers" but here it doesn't seem required..
> 
> >
> > On the other hand, not setting .bus_type and letting the parse()
> > function determine the but type automatically is also deprecated, and I
> > don't think forcing drivers to call v4l2_fwnode_endpoint_alloc_parse()
> > once for each bus type until one succeeds is a good API. As change will
> > be needed in that API, you can ignore v4l2_fwnode_endpoint_alloc_parse()
> > for the time being if you want.
> 
> But indeed relying on auto-guessing of the bus type is deprecated since
> some time now (and the API could be improved, yes). Sorry I missed
> that yesterday.

There's one case where the bus type does not need to be set: when bindings
require it *and* at the same time you have no default configuration that
requires something to be set in the bus specific struct. Bindings where
bus-type is required were added later so I think the documentation should
be changed there, too.

I can send the patches.

> 
> As we support parallel and bt.656 only I must be honest I don't mind
> it here as otherwise the code would be more complex for no real gain,
> but I defer this to Sakari which has been fighting the battle against
> auto-guessing since a long time now  :)

I think you should require bus-type property in bindings in that case.

But as it's an existing driver, bus-type will be optional. You'll need to
default to what was supported earlier. This is actually an interesting case
as bindings do not document it.

> 
> 
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > +	fwnode_handle_put(endpoint);
> > > +	if (ret) {
> > > +		dev_err(&client->dev, "Could not parse endpoint\n");
> > > +		goto error_clk_put;
> > > +	}
> > > +
> > > +	if (priv->ep.bus_type != V4L2_MBUS_PARALLEL &&
> > > +	    priv->ep.bus_type != V4L2_MBUS_BT656) {
> > > +		dev_err(&client->dev, "Unsupported bus type %d\n",
> > > +			priv->ep.bus_type);
> > > +		goto error_clk_put;
> > > +	}
> > > +
> > >  	ret = ov772x_video_probe(priv);
> > >  	if (ret < 0)
> > >  		goto error_gpio_put;
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

-- 
Sakari Ailus
