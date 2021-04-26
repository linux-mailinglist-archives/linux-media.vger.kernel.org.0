Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC71636B46B
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 16:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbhDZOCk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 10:02:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:46522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhDZOCi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 10:02:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDA466101B;
        Mon, 26 Apr 2021 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619445716;
        bh=tzhLVdGbmmRdQPJ5eZRDCi1vw2kOOHnATu4ZWI3P46E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U/oz00GpNcaxeqC+/8QTj7nLXoBGaWVVTeWcomZxD6ZJLXid8iFrLemb8qzTGTMyE
         lbIUP5mHp2kzEK+tAsIVJNqiKUHzV/4wUfv5ndrFY+RW6Zm6HSREFQ7GSBSZtRXywT
         sh5gJbO1i1H4YeH/AvHWI9Z5wsDwbRZWfPh/L5OC/xM5EJK5Flh8Dxklhf4OMIkfPd
         rS/ENnmlx7LGM+DwXIA9aM/camcCsLPRbwi+9NoqgBbE8cPpNRpp8X/R3492T/RLT6
         PKUeEvnBhNc+jOdEZUe8KFMcDkUDLpYG0ZD2MmIIG0dkX2lOwCjXWs12IOXm/yQIg/
         8Rwc3v7kyelwQ==
Date:   Mon, 26 Apr 2021 16:01:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 25/78] media: i2c: ccs-core: use
 pm_runtime_resume_and_get()
Message-ID: <20210426160151.61ac6ef2@coco.lan>
In-Reply-To: <20210425185525.GS3@paasikivi.fi.intel.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <34da940f76da6c1d61a193409164070f47243b64.1619191723.git.mchehab+huawei@kernel.org>
        <20210425185525.GS3@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 25 Apr 2021 21:55:25 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Mauro,
> 
> Thanks for the patch.
> 
> On Sat, Apr 24, 2021 at 08:44:35AM +0200, Mauro Carvalho Chehab wrote:
> > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > added pm_runtime_resume_and_get() in order to automatically handle
> > dev->power.usage_count decrement on errors.
> > 
> > Use the new API, in order to cleanup the error check logic.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/i2c/ccs/ccs-core.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index 9dc3f45da3dc..1441ddcc9b35 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -1880,12 +1880,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
> >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> >  	int rval;
> >  
> > -	rval = pm_runtime_get_sync(&client->dev);
> > -	if (rval < 0) {
> > -		pm_runtime_put_noidle(&client->dev);
> > -
> > +	rval = pm_runtime_resume_and_get(&client->dev);
> > +	if (rval < 0)
> >  		return rval;
> > -	} else if (!rval) {
> > +
> > +	if (!rval) {
> >  		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
> >  					       ctrl_handler);
> >  		if (rval)
> > @@ -3089,7 +3088,7 @@ static int __maybe_unused ccs_suspend(struct device *dev)
> >  	bool streaming = sensor->streaming;
> >  	int rval;
> >  
> > -	rval = pm_runtime_get_sync(dev);
> > +	rval = pm_runtime_resume_and_get(dev);
> >  	if (rval < 0) {
> >  		pm_runtime_put_noidle(dev);  
> 
> You'll need to drop pm_runtime_put_noidle() here.

OK!

---

On a non-related issue at the same code, after the change, the
suspend function will be:

  static int __maybe_unused ccs_suspend(struct device *dev)
  {
        struct i2c_client *client = to_i2c_client(dev);
        struct v4l2_subdev *subdev = i2c_get_clientdata(client);
        struct ccs_sensor *sensor = to_ccs_sensor(subdev);
        bool streaming = sensor->streaming;
        int rval;

        rval = pm_runtime_resume_and_get(dev);
        if (rval < 0) 
                return -EAGAIN;

        if (sensor->streaming)
                ccs_stop_streaming(sensor);

        /* save state for resume */
        sensor->streaming = streaming;

        return 0;
  }

Not sure if "return -EAGAIN" is the right thing here. I mean,
the PM runtime core has two error conditions that are independent
on whatever the PM callback would be doing[1]:

	        if (dev->power.runtime_error)
                retval = -EINVAL;
        else if (dev->power.disable_depth > 0)
                retval = -EACCES;

It would be very unlikely that trying to suspend again would solve
those conditions.

So, I guess that the right thing to do is to change the code
to do, instead:

  static int __maybe_unused ccs_suspend(struct device *dev)
  {
        struct i2c_client *client = to_i2c_client(dev);
        struct v4l2_subdev *subdev = i2c_get_clientdata(client);
        struct ccs_sensor *sensor = to_ccs_sensor(subdev);
        bool streaming = sensor->streaming;
        int rval;

        rval = pm_runtime_resume_and_get(dev);
        if (rval < 0) 
                return rval;
	...
  }


[1] see rpm_resume() code at drivers/base/power/runtime.c.

Thanks,
Mauro
