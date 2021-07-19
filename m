Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE7E3CD61F
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 15:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240988AbhGSNMr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 09:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240693AbhGSNKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 09:10:21 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00B3C061762
        for <linux-media@vger.kernel.org>; Mon, 19 Jul 2021 06:13:45 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f30so30342371lfj.1
        for <linux-media@vger.kernel.org>; Mon, 19 Jul 2021 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zf+WSmXTCjVZqpUE8MeU/OdeERPZCVgPkWOf9dRsI0Q=;
        b=x5NVWerdCP31z/OdQpUFdokrYLda8sAehGAY0j+cl1eu2pSPaCLFLkStL96qilEetR
         9jhiDxo0jePWdMklYXnwLSBm9VDoUoLful0YKmSZDE3HV0GgfABlV9LjpEjPFKO37ATC
         aHPRXluUKfoQ5vb0PtF3yb4CMQTnmgcZFRw7zZFADTfQbCDo6a+5+FVO40VFcP+CIYUt
         4xf5/BPDlPUyNRu40YsOtWb7/dPtJKtl1sqlqf8AsUuiMoxbzpMg4mUtNlN/0gEEI4TS
         +wn95gxVfgPJiy6QRFP64x7ntN+zIgIR/MQw0HHYbl07oVGtVFTQg3ptBdW4NqyeDG/t
         bwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zf+WSmXTCjVZqpUE8MeU/OdeERPZCVgPkWOf9dRsI0Q=;
        b=XdbdYUOJbX1zBmyjF3e94nh1k1pflWYfK3I3+/1CD7cKWrNGXOx5QBSwEf9sS+lK6j
         LjD+PgXUO08D1scSouoRVhJicg8d+U5GY4LS1TRmaaxsnYq+OGe6iIrNZzs3MbMvaoeR
         l3rF0Mriya9+McVJx9wv2gaQBDtHmCOEmBOUfcjnfvPyfCHa90zBjmFn6iLu7VjyzNbn
         NwOrGNRj47gj6DbIepF/YJK4yAK99rA2xiItl03v44HVJbCP829KPMF2cwBPEMeHhck8
         RnY/9Aj0O1lKjat97wooL4ZzRRm2Fh2aAdLf7iiYFp6OCO+1MRls15bU3tXcewMmfcz/
         nXBw==
X-Gm-Message-State: AOAM5338yqWDKTL0CjAWBhicd4/7Tvefc3nOOSbK5ajZpiO5g8SxeZn8
        NMfjMSOgAXJFLhTfxo/RnADWOA==
X-Google-Smtp-Source: ABdhPJydMLPdU9JUIpdHmL160Zwcw+rwVzNzO5/wJNPri6U/ou4qisSDLwrs+uVwsvFbEUS+S3qynw==
X-Received: by 2002:a05:6512:3053:: with SMTP id b19mr18697977lfb.167.1626702635506;
        Mon, 19 Jul 2021 06:50:35 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id f25sm1654606ljo.126.2021.07.19.06.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 06:50:34 -0700 (PDT)
Date:   Mon, 19 Jul 2021 15:50:34 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: Remove unneeded mutex for get_fmt
 and set_fmt
Message-ID: <YPWDKicqozwRW1MF@oden.dyn.berto.se>
References: <20210708095550.682465-1-niklas.soderlund+renesas@ragnatech.se>
 <20210719121039.gj6nc26nyk3lnmw3@uno.localdomain>
 <YPVvfEd/HH6cpO1Q@oden.dyn.berto.se>
 <YPV7AfCLUqRaIp+c@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YPV7AfCLUqRaIp+c@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 2021-07-19 16:15:45 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Mon, Jul 19, 2021 at 02:26:36PM +0200, Niklas Söderlund wrote:
> > On 2021-07-19 14:10:39 +0200, Jacopo Mondi wrote:
> > > On Thu, Jul 08, 2021 at 11:55:50AM +0200, Niklas Söderlund wrote:
> > > > There is no need to protect 'cfg_fmt' in get_fmt() and set_fmt() as the
> > > > core protects these callbacks. As this is the only usage of the mutex it
> > > > can be removed.
> > > 
> > > You know, I tried chasing where the vdev->lock used to protect the
> > > subdev's ioctl is set for mex9286 and I wasn't able to find it.
> > > 
> > > Please validate my understanding:
> > > 
> > > - The lock used by the core to protect the set/get format subdev ioctl
> > >   is the one in subdev_do_ioctl_lock()
> > > 
> > >   static long subdev_do_ioctl_lock(struct file *file, unsigned int cmd, void *arg)
> > >   {
> > >           struct video_device *vdev = video_devdata(file);
> > >           struct mutex *lock = vdev->lock;
> 
> Let's also note that subdev operations can also be called directly
> within the kernel, in video node-centric setups for instance. There are
> little changes the max9286 driver would be used in such a setup, but the
> .get_fmt() operation can be called during pipeline validation too.
> That's why subdev drivers are supposed to use locks internally.

This is a good point which disregarding of the ioctl lock issue pointed 
out by Jacopo makes this patch bad.

> 
> > > - the max9286 video subdevice node is registered (on R-Car) by
> > >   __v4l2_device_register_subdev_nodes() called by the root notifier
> > >   complete() callback
> > > 
> > > - The video_device created by __v4l2_device_register_subdev_nodes()
> > >   doesn't initialize any lock
> > > 
> > > What am I missing ?
> > 
> > One of the fun idiosyncrasies of V4L2 :-)
> > 
> > The lock comes from and are initialized by the video device used to 
> > register the V4L2 async notifier. Every subdevice created is bound to a 
> > vdev this way, and for example this is the vdev that events get routed 
> > to.
> 
> That doesn't seem right to me, could you point to the corresponding code

I was wrong it's the v4l2_device and not the vdev that is used for 
events. When an sd generates an event with the call chain,

v4l2_subdev_notify_event(priv->sd, ..)
    v4l2_subdev_notify(priv->sd)
        priv->sd->v4l2_dev->notify()


And v4l2_dev is the one passed to v4l2_async_notifier_register() and set 
in the async logic by

v4l2_async_register_subdev() OR v4l2_async_notifier_try_all_subdevs()
    v4l2_async_match_notify()
        v4l2_device_register_subdev()
            sd->v4l2_dev = v4l2_dev


> ?
> 
> > I assume this dates back pre the media-graph where every subdevice could 
> > be associated with a single vdev at probe time. With the media graph 
> > this makes little sens and IMHO should really be reworked. I tried once 
> > but it turned out to be a lot of work that I did not have time for at 
> > the time.
> 
> The video_device above is the one corresponding to the V4L2 subdev
> device node (when the MC API was developed, I attempted to split the
> device node handling out of video_device, to avoid embedding a full
> video_device in v4l2_subdev, but that was rejected).

I'm sorry that got rejected. If you had gotten your way I wound not have 
made the mistake and looked the fool by mixing between vdev and v4l2_dev 
in this mail :-)

> 
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > >  drivers/media/i2c/max9286.c | 10 ----------
> > > >  1 file changed, 10 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > > index 1aa2c58fd38c5d2b..b1d11a50d6e53ecc 100644
> > > > --- a/drivers/media/i2c/max9286.c
> > > > +++ b/drivers/media/i2c/max9286.c
> > > > @@ -18,7 +18,6 @@
> > > >  #include <linux/i2c.h>
> > > >  #include <linux/i2c-mux.h>
> > > >  #include <linux/module.h>
> > > > -#include <linux/mutex.h>
> > > >  #include <linux/of_graph.h>
> > > >  #include <linux/regulator/consumer.h>
> > > >  #include <linux/slab.h>
> > > > @@ -173,9 +172,6 @@ struct max9286_priv {
> > > >
> > > >  	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> > > >
> > > > -	/* Protects controls and fmt structures */
> > > > -	struct mutex mutex;
> > > > -
> > > >  	unsigned int nsources;
> > > >  	unsigned int source_mask;
> > > >  	unsigned int route_mask;
> > > > @@ -768,9 +764,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> > > >  	if (!cfg_fmt)
> > > >  		return -EINVAL;
> > > >
> > > > -	mutex_lock(&priv->mutex);
> > > >  	*cfg_fmt = format->format;
> > > > -	mutex_unlock(&priv->mutex);
> 
> On a side note, the usual practice is to use the same lock to prevent
> the active format from being changed during streaming.
> 
> > > >
> > > >  	return 0;
> > > >  }
> > > > @@ -796,9 +790,7 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
> > > >  	if (!cfg_fmt)
> > > >  		return -EINVAL;
> > > >
> > > > -	mutex_lock(&priv->mutex);
> > > >  	format->format = *cfg_fmt;
> > > > -	mutex_unlock(&priv->mutex);
> > > >
> > > >  	return 0;
> > > >  }
> > > > @@ -1259,8 +1251,6 @@ static int max9286_probe(struct i2c_client *client)
> > > >  	if (!priv)
> > > >  		return -ENOMEM;
> > > >
> > > > -	mutex_init(&priv->mutex);
> > > > -
> > > >  	priv->client = client;
> > > >  	i2c_set_clientdata(client, priv);
> > > >
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
