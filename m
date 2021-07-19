Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25013CD597
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 15:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237211AbhGSMfW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 08:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237200AbhGSMfQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 08:35:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F68EC061574;
        Mon, 19 Jul 2021 05:36:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 201D5465;
        Mon, 19 Jul 2021 15:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626700550;
        bh=fzVtU+GmfIFvH5ACXeSJFQUVkN5/hoqf7WBxdj37LFA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fuwF8dnpyIQbvGCeiII10sw63OFpCyFLIAL5NdsGaKxoGchqm3pNsvniRw0hP8/hf
         TmWvPnIDImuPu9HG0uoV4md2qbwsMiVA9IvuNSnupJLzAAnnECIBqHe/a0BMf31ELP
         FHzCYXUI09Wg1jEftSYedwgZzwnIvZgb7noE4b1A=
Date:   Mon, 19 Jul 2021 16:15:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: Remove unneeded mutex for get_fmt
 and set_fmt
Message-ID: <YPV7AfCLUqRaIp+c@pendragon.ideasonboard.com>
References: <20210708095550.682465-1-niklas.soderlund+renesas@ragnatech.se>
 <20210719121039.gj6nc26nyk3lnmw3@uno.localdomain>
 <YPVvfEd/HH6cpO1Q@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YPVvfEd/HH6cpO1Q@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Jul 19, 2021 at 02:26:36PM +0200, Niklas Söderlund wrote:
> On 2021-07-19 14:10:39 +0200, Jacopo Mondi wrote:
> > On Thu, Jul 08, 2021 at 11:55:50AM +0200, Niklas Söderlund wrote:
> > > There is no need to protect 'cfg_fmt' in get_fmt() and set_fmt() as the
> > > core protects these callbacks. As this is the only usage of the mutex it
> > > can be removed.
> > 
> > You know, I tried chasing where the vdev->lock used to protect the
> > subdev's ioctl is set for mex9286 and I wasn't able to find it.
> > 
> > Please validate my understanding:
> > 
> > - The lock used by the core to protect the set/get format subdev ioctl
> >   is the one in subdev_do_ioctl_lock()
> > 
> >   static long subdev_do_ioctl_lock(struct file *file, unsigned int cmd, void *arg)
> >   {
> >           struct video_device *vdev = video_devdata(file);
> >           struct mutex *lock = vdev->lock;

Let's also note that subdev operations can also be called directly
within the kernel, in video node-centric setups for instance. There are
little changes the max9286 driver would be used in such a setup, but the
.get_fmt() operation can be called during pipeline validation too.
That's why subdev drivers are supposed to use locks internally.

> > - the max9286 video subdevice node is registered (on R-Car) by
> >   __v4l2_device_register_subdev_nodes() called by the root notifier
> >   complete() callback
> > 
> > - The video_device created by __v4l2_device_register_subdev_nodes()
> >   doesn't initialize any lock
> > 
> > What am I missing ?
> 
> One of the fun idiosyncrasies of V4L2 :-)
> 
> The lock comes from and are initialized by the video device used to 
> register the V4L2 async notifier. Every subdevice created is bound to a 
> vdev this way, and for example this is the vdev that events get routed 
> to.

That doesn't seem right to me, could you point to the corresponding code
?

> I assume this dates back pre the media-graph where every subdevice could 
> be associated with a single vdev at probe time. With the media graph 
> this makes little sens and IMHO should really be reworked. I tried once 
> but it turned out to be a lot of work that I did not have time for at 
> the time.

The video_device above is the one corresponding to the V4L2 subdev
device node (when the MC API was developed, I attempted to split the
device node handling out of video_device, to avoid embedding a full
video_device in v4l2_subdev, but that was rejected).

> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/media/i2c/max9286.c | 10 ----------
> > >  1 file changed, 10 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > index 1aa2c58fd38c5d2b..b1d11a50d6e53ecc 100644
> > > --- a/drivers/media/i2c/max9286.c
> > > +++ b/drivers/media/i2c/max9286.c
> > > @@ -18,7 +18,6 @@
> > >  #include <linux/i2c.h>
> > >  #include <linux/i2c-mux.h>
> > >  #include <linux/module.h>
> > > -#include <linux/mutex.h>
> > >  #include <linux/of_graph.h>
> > >  #include <linux/regulator/consumer.h>
> > >  #include <linux/slab.h>
> > > @@ -173,9 +172,6 @@ struct max9286_priv {
> > >
> > >  	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> > >
> > > -	/* Protects controls and fmt structures */
> > > -	struct mutex mutex;
> > > -
> > >  	unsigned int nsources;
> > >  	unsigned int source_mask;
> > >  	unsigned int route_mask;
> > > @@ -768,9 +764,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> > >  	if (!cfg_fmt)
> > >  		return -EINVAL;
> > >
> > > -	mutex_lock(&priv->mutex);
> > >  	*cfg_fmt = format->format;
> > > -	mutex_unlock(&priv->mutex);

On a side note, the usual practice is to use the same lock to prevent
the active format from being changed during streaming.

> > >
> > >  	return 0;
> > >  }
> > > @@ -796,9 +790,7 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
> > >  	if (!cfg_fmt)
> > >  		return -EINVAL;
> > >
> > > -	mutex_lock(&priv->mutex);
> > >  	format->format = *cfg_fmt;
> > > -	mutex_unlock(&priv->mutex);
> > >
> > >  	return 0;
> > >  }
> > > @@ -1259,8 +1251,6 @@ static int max9286_probe(struct i2c_client *client)
> > >  	if (!priv)
> > >  		return -ENOMEM;
> > >
> > > -	mutex_init(&priv->mutex);
> > > -
> > >  	priv->client = client;
> > >  	i2c_set_clientdata(client, priv);
> > >

-- 
Regards,

Laurent Pinchart
