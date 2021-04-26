Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7510B36B820
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 19:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235628AbhDZRdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 13:33:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234754AbhDZRdK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 13:33:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 571DF6101D;
        Mon, 26 Apr 2021 17:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619458347;
        bh=3gcDGsqtYznY2J6G8/OOhG+6Er20sOKCcXAp/WwEQ6s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PtY5d00F/sxz6eMNhq+j3wKjLV4ARzIEUJjXrP+N+/B10O4jujT2Ed9Xh9lIC9yVl
         7K19B/KY7Ek59SrEs26OyA3x1MX6Q7VSr4nDup81VjPFz1Y02Vx/sfuuqyPkAc+WTP
         hJyRrKZO6amS9JXcY0Of5eJVpuljp2u4nNLZ57Pmr4tvD7ZHUt5wrmRihu0/69COYP
         pYYDLi2V9XIDSMVrLy3esFtu8cqx2mWl4/teZuE7021YPWXwrqoTyVc4X/0IEoCpAs
         AyuK78afSQCdVECBDKetEt0wVJlcmS+OM31fgWW5fSQUjW5rDorDk5w8VadPQB7IrX
         Al7rHUbMFrEYw==
Date:   Mon, 26 Apr 2021 19:32:23 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 25/78] media: i2c: ccs-core: use
 pm_runtime_resume_and_get()
Message-ID: <20210426193223.78bd06f3@coco.lan>
In-Reply-To: <20210426142901.GX3@paasikivi.fi.intel.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <34da940f76da6c1d61a193409164070f47243b64.1619191723.git.mchehab+huawei@kernel.org>
        <20210425185525.GS3@paasikivi.fi.intel.com>
        <20210426160151.61ac6ef2@coco.lan>
        <20210426140900.GW3@paasikivi.fi.intel.com>
        <20210426161659.7b979c44@coco.lan>
        <20210426142901.GX3@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 26 Apr 2021 17:29:02 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> On Mon, Apr 26, 2021 at 04:16:59PM +0200, Mauro Carvalho Chehab wrote:
> > Em Mon, 26 Apr 2021 17:09:00 +0300
> > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> >   
> > > Hi Mauro,
> > > 
> > > On Mon, Apr 26, 2021 at 04:01:51PM +0200, Mauro Carvalho Chehab wrote:  
> > > > Em Sun, 25 Apr 2021 21:55:25 +0300
> > > > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> > > >     
> > > > > Hi Mauro,
> > > > > 
> > > > > Thanks for the patch.
> > > > > 
> > > > > On Sat, Apr 24, 2021 at 08:44:35AM +0200, Mauro Carvalho Chehab wrote:    
> > > > > > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > > > > added pm_runtime_resume_and_get() in order to automatically handle
> > > > > > dev->power.usage_count decrement on errors.
> > > > > > 
> > > > > > Use the new API, in order to cleanup the error check logic.
> > > > > > 
> > > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > > > ---
> > > > > >  drivers/media/i2c/ccs/ccs-core.c | 11 +++++------
> > > > > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > > > > > index 9dc3f45da3dc..1441ddcc9b35 100644
> > > > > > --- a/drivers/media/i2c/ccs/ccs-core.c
> > > > > > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > > > > > @@ -1880,12 +1880,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
> > > > > >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> > > > > >  	int rval;
> > > > > >  
> > > > > > -	rval = pm_runtime_get_sync(&client->dev);
> > > > > > -	if (rval < 0) {
> > > > > > -		pm_runtime_put_noidle(&client->dev);
> > > > > > -
> > > > > > +	rval = pm_runtime_resume_and_get(&client->dev);
> > > > > > +	if (rval < 0)
> > > > > >  		return rval;
> > > > > > -	} else if (!rval) {
> > > > > > +
> > > > > > +	if (!rval) {
> > > > > >  		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
> > > > > >  					       ctrl_handler);
> > > > > >  		if (rval)
> > > > > > @@ -3089,7 +3088,7 @@ static int __maybe_unused ccs_suspend(struct device *dev)
> > > > > >  	bool streaming = sensor->streaming;
> > > > > >  	int rval;
> > > > > >  
> > > > > > -	rval = pm_runtime_get_sync(dev);
> > > > > > +	rval = pm_runtime_resume_and_get(dev);
> > > > > >  	if (rval < 0) {
> > > > > >  		pm_runtime_put_noidle(dev);      
> > > > > 
> > > > > You'll need to drop pm_runtime_put_noidle() here.    
> > > > 
> > > > OK!
> > > > 
> > > > ---
> > > > 
> > > > On a non-related issue at the same code, after the change, the
> > > > suspend function will be:
> > > > 
> > > >   static int __maybe_unused ccs_suspend(struct device *dev)
> > > >   {
> > > >         struct i2c_client *client = to_i2c_client(dev);
> > > >         struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> > > >         struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> > > >         bool streaming = sensor->streaming;
> > > >         int rval;
> > > > 
> > > >         rval = pm_runtime_resume_and_get(dev);
> > > >         if (rval < 0) 
> > > >                 return -EAGAIN;
> > > > 
> > > >         if (sensor->streaming)
> > > >                 ccs_stop_streaming(sensor);
> > > > 
> > > >         /* save state for resume */
> > > >         sensor->streaming = streaming;
> > > > 
> > > >         return 0;
> > > >   }
> > > > 
> > > > Not sure if "return -EAGAIN" is the right thing here. I mean,
> > > > the PM runtime core has two error conditions that are independent
> > > > on whatever the PM callback would be doing[1]:
> > > > 
> > > > 	        if (dev->power.runtime_error)
> > > >                 retval = -EINVAL;
> > > >         else if (dev->power.disable_depth > 0)
> > > >                 retval = -EACCES;
> > > > 
> > > > It would be very unlikely that trying to suspend again would solve
> > > > those conditions.
> > > > 
> > > > So, I guess that the right thing to do is to change the code
> > > > to do, instead:
> > > > 
> > > >   static int __maybe_unused ccs_suspend(struct device *dev)
> > > >   {
> > > >         struct i2c_client *client = to_i2c_client(dev);
> > > >         struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> > > >         struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> > > >         bool streaming = sensor->streaming;
> > > >         int rval;
> > > > 
> > > >         rval = pm_runtime_resume_and_get(dev);
> > > >         if (rval < 0) 
> > > >                 return rval;
> > > > 	...
> > > >   }
> > > > 
> > > > 
> > > > [1] see rpm_resume() code at drivers/base/power/runtime.c.    
> > > 
> > > Yeah, I agree. This code is one of the older parts the driver.
> > > 
> > > Please add:
> > > 
> > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > 
> > > The same goes for the other sensor driver patches in the set you cc'd me,
> > > i.e. patches 12, 15, 26, 28,32, 40, 45, 51, 53 and 55.  
> > 
> > It probably makes sense to address the suspend/resume -EAGAIN
> > return code on a separate patch series, before this one, as:
> > 
> > 1. this is unrelated to this change;
> > 2. it is something that should be c/c to fixes. So, having it
> >    before this series makes easier to apply there.  
> 
> Sounds good to me. If you can submit a patch, please add my ack. :-)

Sure. I'll work on such patch series.

Thanks!
Mauro
