Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68BD33BDBC0
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 18:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhGFQ7z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 12:59:55 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:56707 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhGFQ7z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 12:59:55 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0858C60006;
        Tue,  6 Jul 2021 16:57:14 +0000 (UTC)
Date:   Tue, 6 Jul 2021 18:58:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] rcar-vin: Refactor controls creation for video
 device
Message-ID: <20210706165803.jepqksw4slo3xkyc@uno.localdomain>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-2-niklas.soderlund+renesas@ragnatech.se>
 <20210706160401.xssshab7nkxroxnp@uno.localdomain>
 <YOSBxLV86PX63AWm@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOSBxLV86PX63AWm@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Jul 06, 2021 at 06:16:04PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> On 2021-07-06 18:04:01 +0200, Jacopo Mondi wrote:
> > Hi Niklas,
> >
> > On Tue, Apr 13, 2021 at 08:02:43PM +0200, Niklas Söderlund wrote:
> > > The controls for the video device are created in different code paths
> > > depending on if the driver is using the media graph centric model (Gen3)
> > > or the device centric model (Gen2 and earlier). This have lead to code
> > > duplication that can be consolidated.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-core.c | 82 +++++++++++----------
> > >  1 file changed, 45 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > > index cb3025992817d625..c798dc9409e4cdcd 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > @@ -405,6 +405,45 @@ static const struct v4l2_ctrl_ops rvin_ctrl_ops = {
> > >  	.s_ctrl = rvin_s_ctrl,
> > >  };
> > >
> > > +static void rvin_free_controls(struct rvin_dev *vin)
> > > +{
> > > +	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > +	vin->vdev.ctrl_handler = NULL;
> > > +}
> > > +
> > > +static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	/* The VIN directly deals with alpha component. */
> > > +	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > > +			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > > +
> > > +	if (vin->ctrl_handler.error) {
> > > +		ret = vin->ctrl_handler.error;
> > > +		rvin_free_controls(vin);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* For the non-MC mode add controls from the subdevice. */
> > > +	if (subdev) {
> > > +		ret = v4l2_ctrl_add_handler(&vin->ctrl_handler,
> > > +					    subdev->ctrl_handler, NULL, true);
> > > +		if (ret < 0) {
> > > +			rvin_free_controls(vin);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /* -----------------------------------------------------------------------------
> > >   * Async notifier
> > >   */
> > > @@ -490,28 +529,10 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
> > >  		return ret;
> > >
> > >  	/* Add the controls */
> > > -	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
> > > +	ret = rvin_create_controls(vin, subdev);
> > >  	if (ret < 0)
> > >  		return ret;
> > >
> > > -	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > > -			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > > -
> > > -	if (vin->ctrl_handler.error) {
> > > -		ret = vin->ctrl_handler.error;
> > > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > -		return ret;
> > > -	}
> > > -
> > > -	ret = v4l2_ctrl_add_handler(&vin->ctrl_handler, subdev->ctrl_handler,
> > > -				    NULL, true);
> > > -	if (ret < 0) {
> > > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > -		return ret;
> > > -	}
> > > -
> > > -	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> > > -
> > >  	vin->parallel.subdev = subdev;
> > >
> > >  	return 0;
> > > @@ -522,10 +543,8 @@ static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
> > >  	rvin_v4l2_unregister(vin);
> > >  	vin->parallel.subdev = NULL;
> > >
> > > -	if (!vin->info->use_mc) {
> > > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > -		vin->vdev.ctrl_handler = NULL;
> > > -	}
> > > +	if (!vin->info->use_mc)
> >
> > I know it was there already, but give that rvin_parallel_notify_unbind()
> > is only registered for parallel, can this happen ?
>
> Yes, on Gen2 where we don't use a media-graph.
>

Ah correct, for gen3 the controls are freed elsewhere, right!

Thanks for the clarification

> >
> > Apart this small nit:
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > Thanks
> >   j
> >
> > > +		rvin_free_controls(vin);
> > >  }
> > >
> > >  static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
> > > @@ -935,21 +954,10 @@ static int rvin_mc_init(struct rvin_dev *vin)
> > >  	if (ret)
> > >  		rvin_group_put(vin);
> > >
> > > -	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);
> > > +	ret = rvin_create_controls(vin, NULL);
> > >  	if (ret < 0)
> > >  		return ret;
> > >
> > > -	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > > -			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > > -
> > > -	if (vin->ctrl_handler.error) {
> > > -		ret = vin->ctrl_handler.error;
> > > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > -		return ret;
> > > -	}
> > > -
> > > -	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> > > -
> > >  	return ret;
> > >  }
> > >
> > > @@ -1446,7 +1454,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
> > >  	return 0;
> > >
> > >  error_group_unregister:
> > > -	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > +	rvin_free_controls(vin);
> > >
> > >  	if (vin->info->use_mc) {
> > >  		mutex_lock(&vin->group->lock);
> > > @@ -1481,7 +1489,7 @@ static int rcar_vin_remove(struct platform_device *pdev)
> > >  		rvin_group_put(vin);
> > >  	}
> > >
> > > -	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > +	rvin_free_controls(vin);
> > >
> > >  	rvin_dma_unregister(vin);
> > >
> > > --
> > > 2.31.1
> > >
>
> --
> Regards,
> Niklas Söderlund
