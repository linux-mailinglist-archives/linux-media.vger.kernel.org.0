Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CBA3BDB3A
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 18:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhGFQSr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 12:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhGFQSr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 12:18:47 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF0DC061574
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 09:16:07 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u18so8223442lff.9
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 09:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wyGLdLzfNkC0tdb93/0iRuzoUsgRVq8ctaAPP7qne8Q=;
        b=ZrY0BXJR11lGH3Kv3k1kv+i4qVh29BHlqp0Pfe+lbjeIZmbx/kJuWCjP1FMXo1tjIT
         epPDx0u8vXbsUvGQhrCYdre0tWfm+tVEUEPzwm6x/Tng/5rVG++rbGm7WA2RcwTo/yYL
         8AGrGupICilHGqhAp3E6/9OL97M8+M/I9nhlrfUgtmZCdLeKOswrNOHb4m+kMl40zEkp
         jrtPyer+NhzxU+jFeddAzd4HHbKWfYou0BD4S9BQUlEot38eqmPfcfEoI5YLB1ClnUQc
         4hXFA0BUnmYdbCQxzpH4HXpRGTLbfYgTwYYPKznnuNAbH473H1ikngViN65X8zPNjPa2
         jFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wyGLdLzfNkC0tdb93/0iRuzoUsgRVq8ctaAPP7qne8Q=;
        b=Hlm3aNDKOXzcgvrHyD0M/a4sQSFrj4ffAKW+45NQg5B5ifgPPP8IuwSIWqbJv04nES
         8dKR0srCcy+leLGz5alBWny6ESQkEA+GKhzX1K2BMJ8w/LTsbDOZjFu+7lQpWuStRt4f
         c4c5ZkFfX1ukmSdv4zNZ+RKTqy1gjcvpuAos559nNfi65zOJz+4nZoiE0Xc8PRuCqobz
         /1Z6A8eR22kTrwPFzK+OJD0VnNGQ86xsjjTRx577kCQ4x3ImT+66Ri/fYS8UlriPBhmZ
         X+y/Zc53F0fmbqXoSG9dpVRxrCEooWxXmWt+v/tIkkdfuR0HJmgVRQxO2YiNL2RmsgjK
         46Tw==
X-Gm-Message-State: AOAM5300zV/IUYpks2GZjJBhdRs7Gxq4WgpKqRIC1HEDEZKpjNAtzl6X
        1uMjRwE8p924f4E7H0tvVtx4Aw==
X-Google-Smtp-Source: ABdhPJzKmWQ7FEAsXgizd/y74ZCtRuOaURk32Tay7aLUqpUQMqayeA/P/im5njlQgC3SYE3mui1Iuw==
X-Received: by 2002:a05:6512:2343:: with SMTP id p3mr15170364lfu.83.1625588165666;
        Tue, 06 Jul 2021 09:16:05 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id s17sm1107306ljg.28.2021.07.06.09.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 09:16:04 -0700 (PDT)
Date:   Tue, 6 Jul 2021 18:16:04 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] rcar-vin: Refactor controls creation for video
 device
Message-ID: <YOSBxLV86PX63AWm@oden.dyn.berto.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-2-niklas.soderlund+renesas@ragnatech.se>
 <20210706160401.xssshab7nkxroxnp@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210706160401.xssshab7nkxroxnp@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 2021-07-06 18:04:01 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Tue, Apr 13, 2021 at 08:02:43PM +0200, Niklas Söderlund wrote:
> > The controls for the video device are created in different code paths
> > depending on if the driver is using the media graph centric model (Gen3)
> > or the device centric model (Gen2 and earlier). This have lead to code
> > duplication that can be consolidated.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 82 +++++++++++----------
> >  1 file changed, 45 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index cb3025992817d625..c798dc9409e4cdcd 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -405,6 +405,45 @@ static const struct v4l2_ctrl_ops rvin_ctrl_ops = {
> >  	.s_ctrl = rvin_s_ctrl,
> >  };
> >
> > +static void rvin_free_controls(struct rvin_dev *vin)
> > +{
> > +	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > +	vin->vdev.ctrl_handler = NULL;
> > +}
> > +
> > +static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
> > +{
> > +	int ret;
> > +
> > +	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* The VIN directly deals with alpha component. */
> > +	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > +			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > +
> > +	if (vin->ctrl_handler.error) {
> > +		ret = vin->ctrl_handler.error;
> > +		rvin_free_controls(vin);
> > +		return ret;
> > +	}
> > +
> > +	/* For the non-MC mode add controls from the subdevice. */
> > +	if (subdev) {
> > +		ret = v4l2_ctrl_add_handler(&vin->ctrl_handler,
> > +					    subdev->ctrl_handler, NULL, true);
> > +		if (ret < 0) {
> > +			rvin_free_controls(vin);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> > +
> > +	return 0;
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Async notifier
> >   */
> > @@ -490,28 +529,10 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
> >  		return ret;
> >
> >  	/* Add the controls */
> > -	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
> > +	ret = rvin_create_controls(vin, subdev);
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > -			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > -
> > -	if (vin->ctrl_handler.error) {
> > -		ret = vin->ctrl_handler.error;
> > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > -		return ret;
> > -	}
> > -
> > -	ret = v4l2_ctrl_add_handler(&vin->ctrl_handler, subdev->ctrl_handler,
> > -				    NULL, true);
> > -	if (ret < 0) {
> > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > -		return ret;
> > -	}
> > -
> > -	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> > -
> >  	vin->parallel.subdev = subdev;
> >
> >  	return 0;
> > @@ -522,10 +543,8 @@ static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
> >  	rvin_v4l2_unregister(vin);
> >  	vin->parallel.subdev = NULL;
> >
> > -	if (!vin->info->use_mc) {
> > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > -		vin->vdev.ctrl_handler = NULL;
> > -	}
> > +	if (!vin->info->use_mc)
> 
> I know it was there already, but give that rvin_parallel_notify_unbind()
> is only registered for parallel, can this happen ?

Yes, on Gen2 where we don't use a media-graph.

> 
> Apart this small nit:
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Thanks
>   j
> 
> > +		rvin_free_controls(vin);
> >  }
> >
> >  static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
> > @@ -935,21 +954,10 @@ static int rvin_mc_init(struct rvin_dev *vin)
> >  	if (ret)
> >  		rvin_group_put(vin);
> >
> > -	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);
> > +	ret = rvin_create_controls(vin, NULL);
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > -			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > -
> > -	if (vin->ctrl_handler.error) {
> > -		ret = vin->ctrl_handler.error;
> > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > -		return ret;
> > -	}
> > -
> > -	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> > -
> >  	return ret;
> >  }
> >
> > @@ -1446,7 +1454,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
> >  	return 0;
> >
> >  error_group_unregister:
> > -	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > +	rvin_free_controls(vin);
> >
> >  	if (vin->info->use_mc) {
> >  		mutex_lock(&vin->group->lock);
> > @@ -1481,7 +1489,7 @@ static int rcar_vin_remove(struct platform_device *pdev)
> >  		rvin_group_put(vin);
> >  	}
> >
> > -	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > +	rvin_free_controls(vin);
> >
> >  	rvin_dma_unregister(vin);
> >
> > --
> > 2.31.1
> >

-- 
Regards,
Niklas Söderlund
