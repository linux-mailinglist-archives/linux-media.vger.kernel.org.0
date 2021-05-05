Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6920373B73
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233227AbhEEMi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:38:29 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3032 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbhEEMiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:38:25 -0400
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZx0W1q8Bz72f3Z;
        Wed,  5 May 2021 20:31:39 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 14:37:27 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:37:27 +0100
Date:   Wed, 5 May 2021 13:35:48 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>, <linuxarm@huawei.com>,
        <mauro.chehab@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 25/25] media: i2c: ccs-core: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210505133548.00005c1a@Huawei.com>
In-Reply-To: <20210505125857.7f30d8fa@coco.lan>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <83ec24acb15f17e2ce589575c2f5eb7bdd1daf28.1620207353.git.mchehab+huawei@kernel.org>
        <20210505103409.GN3@paasikivi.fi.intel.com>
        <20210505125700.4a7584ca@coco.lan>
        <20210505125857.7f30d8fa@coco.lan>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.120.138]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 May 2021 12:58:57 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Wed, 5 May 2021 12:57:00 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > Em Wed, 5 May 2021 13:34:09 +0300
> > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> >   
> > > Hi Mauro,
> > > 
> > > Thanks for the patch.
> > > 
> > > On Wed, May 05, 2021 at 11:42:15AM +0200, Mauro Carvalho Chehab wrote:  
> > > > The pm_runtime_get_sync() internally increments the
> > > > dev->power.usage_count without decrementing it, even on errors.
> > > > 
> > > > There is a bug at ccs_pm_get_init(): when this function returns
> > > > an error, the stream is not started, and RPM usage_count
> > > > should not be incremented. However, if the calls to
> > > > v4l2_ctrl_handler_setup() return errors, it will be kept
> > > > incremented.
> > > > 
> > > > At ccs_suspend() the best is to replace it by the new
> > > > pm_runtime_resume_and_get(), introduced by:
> > > > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > > in order to properly decrement the usage counter automatically,
> > > > in the case of errors.
> > > > 
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>    
> > > 
> > > Could you add Fixes: line and Cc: stable?  
> > 
> > Sure. See the fixes one enclosed.
> >   
> > > The patch that breaks this is 96e3a6b92f23a .
> > > 
> > > It would be better to fix the bug first so the patch to the stable trees
> > > doesn't need special handling.
> > >   
> > > > ---
> > > >  drivers/media/i2c/ccs/ccs-core.c | 39 ++++++++++++++++++++------------
> > > >  1 file changed, 24 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > > > index b05f409014b2..04c3ab9e37b4 100644
> > > > --- a/drivers/media/i2c/ccs/ccs-core.c
> > > > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > > > @@ -1880,21 +1880,33 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
> > > >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> > > >  	int rval;
> > > >  
> > > > +	/*
> > > > +	 * It can't use pm_runtime_resume_and_get() here, as the driver
> > > > +	 * relies at the returned value to detect if the device was already
> > > > +	 * active or not.
> > > > +	 */
> > > >  	rval = pm_runtime_get_sync(&client->dev);
> > > > -	if (rval < 0) {
> > > > -		pm_runtime_put_noidle(&client->dev);
> > > > +	if (rval < 0)
> > > > +		goto error;
> > > >  
> > > > -		return rval;
> > > > -	} else if (!rval) {
> > > > -		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
> > > > -					       ctrl_handler);
> > > > -		if (rval)
> > > > -			return rval;
> > > > +	/* Device was already active, so don't set controls */
> > > > +	if (rval == 1)
> > > > +		return 0;
> > > >  
> > > > -		return v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> > > > -	}
> > > > +	/* Restore V4L2 controls to the suspended device */
> > > > +	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
> > > > +	if (rval)
> > > > +		goto error;
> > > >  
> > > > +	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> > > > +	if (rval)
> > > > +		goto error;
> > > > +
> > > > +	/* Keep PM runtime usage_count incremented on success */
> > > >  	return 0;
> > > > +error:
> > > > +	pm_runtime_put_noidle(&client->dev);    
> > > 
> > > This needs to be pm_runtime_put() as the device has been successfully.  
> > 
> > Ok.
> >   
> > >   
> > > > +	return rval;
> > > >  }
> > > >  
> > > >  static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
> > > > @@ -3089,12 +3101,9 @@ static int __maybe_unused ccs_suspend(struct device *dev)
> > > >  	bool streaming = sensor->streaming;
> > > >  	int rval;
> > > >  
> > > > -	rval = pm_runtime_get_sync(dev);
> > > > -	if (rval < 0) {
> > > > -		pm_runtime_put_noidle(dev);
> > > > -
> > > > +	rval = pm_runtime_resume_and_get(dev);
> > > > +	if (rval < 0)
> > > >  		return rval;
> > > > -	}
> > > >  
> > > >  	if (sensor->streaming)
> > > >  		ccs_stop_streaming(sensor);    
> > >   
> > 
> > Thanks,
> > Mauro
> > 
> > ---
> > 
> > [PATCH] media: i2c: ccs-core: fix pm_runtime_get_sync() usage count
> > 
> > The pm_runtime_get_sync() internally increments the
> > dev->power.usage_count without decrementing it, even on errors.
> > 
> > There is a bug at ccs_pm_get_init(): when this function returns
> > an error, the stream is not started, and RPM usage_count
> > should not be incremented. However, if the calls to
> > v4l2_ctrl_handler_setup() return errors, it will be kept
> > incremented.
> > 
> > At ccs_suspend() the best is to replace it by the new
> > pm_runtime_resume_and_get(), introduced by:
> > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > in order to properly decrement the usage counter automatically,
> > in the case of errors.
> > 
> > Fixes: 96e3a6b92f23 ("media: smiapp: Avoid maintaining power state information")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index b05f409014b2..5ea471fefa3a 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -1880,21 +1880,33 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
> >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> >  	int rval;
> >  
> > +	/*
> > +	 * It can't use pm_runtime_resume_and_get() here, as the driver
> > +	 * relies at the returned value to detect if the device was already
> > +	 * active or not.
> > +	 */
> >  	rval = pm_runtime_get_sync(&client->dev);
> > -	if (rval < 0) {
> > -		pm_runtime_put_noidle(&client->dev);
> > +	if (rval < 0)
> > +		goto error;
> >  
> > -		return rval;
> > -	} else if (!rval) {
> > -		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
> > -					       ctrl_handler);
> > -		if (rval)
> > -			return rval;
> > +	/* Device was already active, so don't set controls */
> > +	if (rval == 1)
> > +		return 0;
> >  
> > -		return v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> > -	}
> > +	/* Restore V4L2 controls to the suspended device */  
> 
> In time: I'll fold this at the patch:
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 5ea471fefa3a..4a848ac2d2cd 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1896 +1896 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
> -       /* Restore V4L2 controls to the suspended device */
> +       /* Restore V4L2 controls to the previously suspended device */
> 
> Regards,
> Mauro

