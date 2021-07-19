Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6B43CD4B8
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 14:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236664AbhGSLqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 07:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236571AbhGSLqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 07:46:00 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D99FC061574
        for <linux-media@vger.kernel.org>; Mon, 19 Jul 2021 04:42:48 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q16so29893561lfa.5
        for <linux-media@vger.kernel.org>; Mon, 19 Jul 2021 05:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CNURmdT0kwdoSpQUjTxOkECJDdUvVG6SU4wzaPu43gk=;
        b=r4EqQWs2gLXmfzbd9W9gtoBLzGsMCx2BG6QWHtzwRolQzxQUH93fna3MWsjneK3RjK
         WJX+4WPL1S83uaj6LAFdfUMd1msGY261LxIDO969jNQFw+6PoOI+y5oTvK4PxYOIIpm/
         CM3pkOXmxPvi4DpzO09DFbUw7n03iE8fZlrJqqzabT8/kD83a1LuveqUeg26jxhsOrEq
         bmBmC55yvVJLRWbHTbYxiaeklSqCVpXAvZNpVbmhhAz0KCmDXeDS1Q7US1RvMMfWJQ1m
         rHGOMCJ35sQKOEkG167hLxhT0yUaTaf5bXMjim5y+JD45rU6KNPhd2upWMuz7/tuTJc2
         UKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CNURmdT0kwdoSpQUjTxOkECJDdUvVG6SU4wzaPu43gk=;
        b=AGKM//jscXdKm3NbmfzPBdxo2WY1DqOdQdqgOeZZPuVlzxlzSVMjOM7xlHCXXmc0NF
         2oDAw6Lytt/blKz3mhnyZqYKg+/ejGL0hRmGEvprXCFNGosMc8mJejFR894yDHM0NT/1
         GewVdH6RqzvaMVbHUoY24bP+GdWAyiy0u+wyoU5Bm/Z/av9VZWJ6iwdf3rSOVGdwd4kO
         p5TWkrfgvknQzSqvYUHcMqPcPhfsUrh4assKrKSwJtD7BfQsmZroezruIkXKyEPVhrkD
         w+E7aLDs5GEEhPnMkFLf48ZBSLwsoQq1ZEG4Tz71uhWtWG7Xpho0LrYIig7RBLSWeRSV
         xWOQ==
X-Gm-Message-State: AOAM530OyQ1v4SIiF1lG61xhTQxcJUufBM0YqKN72eNpi3S2Wf2aYFfW
        Xbfb+53BxkYkSA7Yi/sUa9Mo3P4B3Kfqpg==
X-Google-Smtp-Source: ABdhPJxeved6PJdcBYx+1b8SV2hdcBGeNTwSrKD1eVzAz5ddvXHesM0jOhORBU2DrMdR4I2mmAuY0g==
X-Received: by 2002:ac2:4281:: with SMTP id m1mr17497015lfh.164.1626697597900;
        Mon, 19 Jul 2021 05:26:37 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id v19sm793003lfe.31.2021.07.19.05.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 05:26:37 -0700 (PDT)
Date:   Mon, 19 Jul 2021 14:26:36 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: Remove unneeded mutex for get_fmt
 and set_fmt
Message-ID: <YPVvfEd/HH6cpO1Q@oden.dyn.berto.se>
References: <20210708095550.682465-1-niklas.soderlund+renesas@ragnatech.se>
 <20210719121039.gj6nc26nyk3lnmw3@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210719121039.gj6nc26nyk3lnmw3@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 2021-07-19 14:10:39 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Thu, Jul 08, 2021 at 11:55:50AM +0200, Niklas Söderlund wrote:
> > There is no need to protect 'cfg_fmt' in get_fmt() and set_fmt() as the
> > core protects these callbacks. As this is the only usage of the mutex it
> > can be removed.
> 
> You know, I tried chasing where the vdev->lock used to protect the
> subdev's ioctl is set for mex9286 and I wasn't able to find it.
> 
> Please validate my understanding:
> 
> - The lock used by the core to protect the set/get format subdev ioctl
>   is the one in subdev_do_ioctl_lock()
> 
>   static long subdev_do_ioctl_lock(struct file *file, unsigned int cmd, void *arg)
>   {
>           struct video_device *vdev = video_devdata(file);
>           struct mutex *lock = vdev->lock;
> 
> - the max9286 video subdevice node is registered (on R-Car) by
>   __v4l2_device_register_subdev_nodes() called by the root notifier
>   complete() callback
> 
> - The video_device created by __v4l2_device_register_subdev_nodes()
>   doesn't initialize any lock
> 
> What am I missing ?

One of the fun idiosyncrasies of V4L2 :-)

The lock comes from and are initialized by the video device used to 
register the V4L2 async notifier. Every subdevice created is bound to a 
vdev this way, and for example this is the vdev that events get routed 
to.

I assume this dates back pre the media-graph where every subdevice could 
be associated with a single vdev at probe time. With the media graph 
this makes little sens and IMHO should really be reworked. I tried once 
but it turned out to be a lot of work that I did not have time for at 
the time.

> 
> Thanks
>    j
> 
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/i2c/max9286.c | 10 ----------
> >  1 file changed, 10 deletions(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 1aa2c58fd38c5d2b..b1d11a50d6e53ecc 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -18,7 +18,6 @@
> >  #include <linux/i2c.h>
> >  #include <linux/i2c-mux.h>
> >  #include <linux/module.h>
> > -#include <linux/mutex.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> > @@ -173,9 +172,6 @@ struct max9286_priv {
> >
> >  	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> >
> > -	/* Protects controls and fmt structures */
> > -	struct mutex mutex;
> > -
> >  	unsigned int nsources;
> >  	unsigned int source_mask;
> >  	unsigned int route_mask;
> > @@ -768,9 +764,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> >  	if (!cfg_fmt)
> >  		return -EINVAL;
> >
> > -	mutex_lock(&priv->mutex);
> >  	*cfg_fmt = format->format;
> > -	mutex_unlock(&priv->mutex);
> >
> >  	return 0;
> >  }
> > @@ -796,9 +790,7 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
> >  	if (!cfg_fmt)
> >  		return -EINVAL;
> >
> > -	mutex_lock(&priv->mutex);
> >  	format->format = *cfg_fmt;
> > -	mutex_unlock(&priv->mutex);
> >
> >  	return 0;
> >  }
> > @@ -1259,8 +1251,6 @@ static int max9286_probe(struct i2c_client *client)
> >  	if (!priv)
> >  		return -ENOMEM;
> >
> > -	mutex_init(&priv->mutex);
> > -
> >  	priv->client = client;
> >  	i2c_set_clientdata(client, priv);
> >
> > --
> > 2.32.0
> >

-- 
Regards,
Niklas Söderlund
