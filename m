Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502413738F2
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 13:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhEELD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 07:03:26 -0400
Received: from mga07.intel.com ([134.134.136.100]:27393 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229559AbhEELDZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 07:03:25 -0400
IronPort-SDR: h6HsIwd+3fJsRPvF/Uf2DBxREbUG6qPODSlvE+Ubp4lx1FzpoN8k5s5ZcgPYDtg5FDDZT5CB5V
 pXAdVcElUyyA==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="262129174"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="262129174"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 04:02:28 -0700
IronPort-SDR: FZf52xL00zCjeufPwcx1WYqmxeoVKWEsYFHIECR/kRGMZRZZHfnHf08C7W8s/919Hej07/rHBr
 eTCFLYMg7zhA==
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="539515219"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 04:02:26 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id CE665203BC;
        Wed,  5 May 2021 14:02:24 +0300 (EEST)
Date:   Wed, 5 May 2021 14:02:24 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 25/25] media: i2c: ccs-core: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210505110224.GP3@paasikivi.fi.intel.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <83ec24acb15f17e2ce589575c2f5eb7bdd1daf28.1620207353.git.mchehab+huawei@kernel.org>
 <20210505103409.GN3@paasikivi.fi.intel.com>
 <20210505125700.4a7584ca@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505125700.4a7584ca@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, May 05, 2021 at 12:57:00PM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 5 May 2021 13:34:09 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > Hi Mauro,
> > 
> > Thanks for the patch.
> > 
> > On Wed, May 05, 2021 at 11:42:15AM +0200, Mauro Carvalho Chehab wrote:
> > > The pm_runtime_get_sync() internally increments the
> > > dev->power.usage_count without decrementing it, even on errors.
> > > 
> > > There is a bug at ccs_pm_get_init(): when this function returns
> > > an error, the stream is not started, and RPM usage_count
> > > should not be incremented. However, if the calls to
> > > v4l2_ctrl_handler_setup() return errors, it will be kept
> > > incremented.
> > > 
> > > At ccs_suspend() the best is to replace it by the new
> > > pm_runtime_resume_and_get(), introduced by:
> > > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > in order to properly decrement the usage counter automatically,
> > > in the case of errors.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> > 
> > Could you add Fixes: line and Cc: stable?
> 
> Sure. See the fixes one enclosed.
> 
> > The patch that breaks this is 96e3a6b92f23a .
> > 
> > It would be better to fix the bug first so the patch to the stable trees
> > doesn't need special handling.

Please ignore this comment.

> > 
> > > ---
> > >  drivers/media/i2c/ccs/ccs-core.c | 39 ++++++++++++++++++++------------
> > >  1 file changed, 24 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > > index b05f409014b2..04c3ab9e37b4 100644
> > > --- a/drivers/media/i2c/ccs/ccs-core.c
> > > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > > @@ -1880,21 +1880,33 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
> > >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> > >  	int rval;
> > >  
> > > +	/*
> > > +	 * It can't use pm_runtime_resume_and_get() here, as the driver
> > > +	 * relies at the returned value to detect if the device was already
> > > +	 * active or not.
> > > +	 */
> > >  	rval = pm_runtime_get_sync(&client->dev);
> > > -	if (rval < 0) {
> > > -		pm_runtime_put_noidle(&client->dev);
> > > +	if (rval < 0)
> > > +		goto error;
> > >  
> > > -		return rval;
> > > -	} else if (!rval) {
> > > -		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
> > > -					       ctrl_handler);
> > > -		if (rval)
> > > -			return rval;
> > > +	/* Device was already active, so don't set controls */
> > > +	if (rval == 1)
> > > +		return 0;
> > >  
> > > -		return v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> > > -	}
> > > +	/* Restore V4L2 controls to the suspended device */
> > > +	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
> > > +	if (rval)
> > > +		goto error;
> > >  
> > > +	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> > > +	if (rval)
> > > +		goto error;
> > > +
> > > +	/* Keep PM runtime usage_count incremented on success */
> > >  	return 0;
> > > +error:
> > > +	pm_runtime_put_noidle(&client->dev);  
> > 
> > This needs to be pm_runtime_put() as the device has been successfully.
> 
> Ok.
> 
> > 
> > > +	return rval;
> > >  }
> > >  
> > >  static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
> > > @@ -3089,12 +3101,9 @@ static int __maybe_unused ccs_suspend(struct device *dev)
> > >  	bool streaming = sensor->streaming;
> > >  	int rval;
> > >  
> > > -	rval = pm_runtime_get_sync(dev);
> > > -	if (rval < 0) {
> > > -		pm_runtime_put_noidle(dev);
> > > -
> > > +	rval = pm_runtime_resume_and_get(dev);
> > > +	if (rval < 0)
> > >  		return rval;
> > > -	}
> > >  
> > >  	if (sensor->streaming)
> > >  		ccs_stop_streaming(sensor);  
> > 
> 
> Thanks,
> Mauro
> 
> ---
> 
> [PATCH] media: i2c: ccs-core: fix pm_runtime_get_sync() usage count
> 
> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> 
> There is a bug at ccs_pm_get_init(): when this function returns
> an error, the stream is not started, and RPM usage_count
> should not be incremented. However, if the calls to
> v4l2_ctrl_handler_setup() return errors, it will be kept
> incremented.
> 
> At ccs_suspend() the best is to replace it by the new
> pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter automatically,
> in the case of errors.
> 
> Fixes: 96e3a6b92f23 ("media: smiapp: Avoid maintaining power state information")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index b05f409014b2..5ea471fefa3a 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1880,21 +1880,33 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
>  	int rval;
>  
> +	/*
> +	 * It can't use pm_runtime_resume_and_get() here, as the driver
> +	 * relies at the returned value to detect if the device was already
> +	 * active or not.
> +	 */
>  	rval = pm_runtime_get_sync(&client->dev);
> -	if (rval < 0) {
> -		pm_runtime_put_noidle(&client->dev);
> +	if (rval < 0)
> +		goto error;
>  
> -		return rval;
> -	} else if (!rval) {
> -		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
> -					       ctrl_handler);
> -		if (rval)
> -			return rval;
> +	/* Device was already active, so don't set controls */
> +	if (rval == 1)
> +		return 0;
>  
> -		return v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> -	}
> +	/* Restore V4L2 controls to the suspended device */
> +	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
> +	if (rval)
> +		goto error;
>  
> +	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> +	if (rval)
> +		goto error;
> +
> +	/* Keep PM runtime usage_count incremented on success */
>  	return 0;
> +error:
> +	pm_runtime_put(&client->dev);
> +	return rval;
>  }
>  
>  static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
> 
> 
> 
> 

-- 
Kind regards,

Sakari Ailus
