Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E9536B484
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 16:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbhDZOJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 10:09:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:1518 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230250AbhDZOJp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 10:09:45 -0400
IronPort-SDR: A40B67Z/BRDGJxldXgb3rrLwOp0RyoXjFB2UyexJ2sDFy5psG5I6xfUiMu00dZL/UiWgYyJyjV
 KnaRRej3RJTQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="257643897"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="257643897"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 07:09:03 -0700
IronPort-SDR: F8yl2V3nfTHNNGhj1ljAmRMkkyjfXcv3fcAFa8dnqQDMUodPkAeAvq8rWL79Q42HIVJetJYqJf
 RGjyEkyIelEQ==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="392774488"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 07:09:02 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 38B1A20207;
        Mon, 26 Apr 2021 17:09:00 +0300 (EEST)
Date:   Mon, 26 Apr 2021 17:09:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 25/78] media: i2c: ccs-core: use
 pm_runtime_resume_and_get()
Message-ID: <20210426140900.GW3@paasikivi.fi.intel.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <34da940f76da6c1d61a193409164070f47243b64.1619191723.git.mchehab+huawei@kernel.org>
 <20210425185525.GS3@paasikivi.fi.intel.com>
 <20210426160151.61ac6ef2@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426160151.61ac6ef2@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, Apr 26, 2021 at 04:01:51PM +0200, Mauro Carvalho Chehab wrote:
> Em Sun, 25 Apr 2021 21:55:25 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > Hi Mauro,
> > 
> > Thanks for the patch.
> > 
> > On Sat, Apr 24, 2021 at 08:44:35AM +0200, Mauro Carvalho Chehab wrote:
> > > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > added pm_runtime_resume_and_get() in order to automatically handle
> > > dev->power.usage_count decrement on errors.
> > > 
> > > Use the new API, in order to cleanup the error check logic.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  drivers/media/i2c/ccs/ccs-core.c | 11 +++++------
> > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > > index 9dc3f45da3dc..1441ddcc9b35 100644
> > > --- a/drivers/media/i2c/ccs/ccs-core.c
> > > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > > @@ -1880,12 +1880,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
> > >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> > >  	int rval;
> > >  
> > > -	rval = pm_runtime_get_sync(&client->dev);
> > > -	if (rval < 0) {
> > > -		pm_runtime_put_noidle(&client->dev);
> > > -
> > > +	rval = pm_runtime_resume_and_get(&client->dev);
> > > +	if (rval < 0)
> > >  		return rval;
> > > -	} else if (!rval) {
> > > +
> > > +	if (!rval) {
> > >  		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
> > >  					       ctrl_handler);
> > >  		if (rval)
> > > @@ -3089,7 +3088,7 @@ static int __maybe_unused ccs_suspend(struct device *dev)
> > >  	bool streaming = sensor->streaming;
> > >  	int rval;
> > >  
> > > -	rval = pm_runtime_get_sync(dev);
> > > +	rval = pm_runtime_resume_and_get(dev);
> > >  	if (rval < 0) {
> > >  		pm_runtime_put_noidle(dev);  
> > 
> > You'll need to drop pm_runtime_put_noidle() here.
> 
> OK!
> 
> ---
> 
> On a non-related issue at the same code, after the change, the
> suspend function will be:
> 
>   static int __maybe_unused ccs_suspend(struct device *dev)
>   {
>         struct i2c_client *client = to_i2c_client(dev);
>         struct v4l2_subdev *subdev = i2c_get_clientdata(client);
>         struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>         bool streaming = sensor->streaming;
>         int rval;
> 
>         rval = pm_runtime_resume_and_get(dev);
>         if (rval < 0) 
>                 return -EAGAIN;
> 
>         if (sensor->streaming)
>                 ccs_stop_streaming(sensor);
> 
>         /* save state for resume */
>         sensor->streaming = streaming;
> 
>         return 0;
>   }
> 
> Not sure if "return -EAGAIN" is the right thing here. I mean,
> the PM runtime core has two error conditions that are independent
> on whatever the PM callback would be doing[1]:
> 
> 	        if (dev->power.runtime_error)
>                 retval = -EINVAL;
>         else if (dev->power.disable_depth > 0)
>                 retval = -EACCES;
> 
> It would be very unlikely that trying to suspend again would solve
> those conditions.
> 
> So, I guess that the right thing to do is to change the code
> to do, instead:
> 
>   static int __maybe_unused ccs_suspend(struct device *dev)
>   {
>         struct i2c_client *client = to_i2c_client(dev);
>         struct v4l2_subdev *subdev = i2c_get_clientdata(client);
>         struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>         bool streaming = sensor->streaming;
>         int rval;
> 
>         rval = pm_runtime_resume_and_get(dev);
>         if (rval < 0) 
>                 return rval;
> 	...
>   }
> 
> 
> [1] see rpm_resume() code at drivers/base/power/runtime.c.

Yeah, I agree. This code is one of the older parts the driver.

Please add:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

The same goes for the other sensor driver patches in the set you cc'd me,
i.e. patches 12, 15, 26, 28,32, 40, 45, 51, 53 and 55.

-- 
Kind regards,

Sakari Ailus
