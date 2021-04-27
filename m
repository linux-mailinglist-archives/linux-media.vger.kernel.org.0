Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2363036BF9A
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 09:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbhD0HDq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 03:03:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:56916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhD0HDp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 03:03:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 537C961159;
        Tue, 27 Apr 2021 07:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619506982;
        bh=izivrDlVuNDG8rAEjfPQuF8j4WWF/Bepl7fmbRGNam0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LGqhJt0z5L3oHbMeWvaKxbgfcdzXj7KkduWLqyLKZTfWxvFNrQstpI1U5/d+Ca92L
         iyBuqEw1ZNfqiHsq6FtMILwOYxQgJCS7gPec4roam2rOI4P1RzZv+RLshy+eMKXK2P
         qBsYmLOEqiUetSKv9IFm7Wma6C3GRprkP3LBIINQzY1SivoCzsr9TXPYC1jh4XIA4Q
         PUq8Tqya6Kg1YjL+l9ZE4snc93muiruccuhd9OUWeg8gMSXdhk0p8OBxt4BQPY2LTF
         fcF09pT/C7wJRyt9jLtmKpYnYOAjJsW1PDYjaeDu4Y/cb2XGXi+L2CahdjNyIRcKas
         uL7dqPSeSbkPg==
Date:   Tue, 27 Apr 2021 09:02:58 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 25/78] media: i2c: ccs-core: use
 pm_runtime_resume_and_get()
Message-ID: <20210427090258.35627539@coco.lan>
In-Reply-To: <20210426193223.78bd06f3@coco.lan>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <34da940f76da6c1d61a193409164070f47243b64.1619191723.git.mchehab+huawei@kernel.org>
        <20210425185525.GS3@paasikivi.fi.intel.com>
        <20210426160151.61ac6ef2@coco.lan>
        <20210426140900.GW3@paasikivi.fi.intel.com>
        <20210426161659.7b979c44@coco.lan>
        <20210426142901.GX3@paasikivi.fi.intel.com>
        <20210426193223.78bd06f3@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Em Mon, 26 Apr 2021 19:32:23 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Mon, 26 Apr 2021 17:29:02 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > On Mon, Apr 26, 2021 at 04:16:59PM +0200, Mauro Carvalho Chehab wrote:  
> > > Em Mon, 26 Apr 2021 17:09:00 +0300
> > > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> > >     
> > > > Hi Mauro,
> > > > 
> > > > On Mon, Apr 26, 2021 at 04:01:51PM +0200, Mauro Carvalho Chehab wrote:    
> > > > > Em Sun, 25 Apr 2021 21:55:25 +0300
> > > > > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> > > > >       
... 
> > > > > On a non-related issue at the same code, after the change, the
> > > > > suspend function will be:
> > > > > 
> > > > >   static int __maybe_unused ccs_suspend(struct device *dev)
> > > > >   {
> > > > >         struct i2c_client *client = to_i2c_client(dev);
> > > > >         struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> > > > >         struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> > > > >         bool streaming = sensor->streaming;
> > > > >         int rval;
> > > > > 
> > > > >         rval = pm_runtime_resume_and_get(dev);
> > > > >         if (rval < 0) 
> > > > >                 return -EAGAIN;
> > > > > 
> > > > >         if (sensor->streaming)
> > > > >                 ccs_stop_streaming(sensor);
> > > > > 
> > > > >         /* save state for resume */
> > > > >         sensor->streaming = streaming;
> > > > > 
> > > > >         return 0;
> > > > >   }
> > > > > 
> > > > > Not sure if "return -EAGAIN" is the right thing here. I mean,
> > > > > the PM runtime core has two error conditions that are independent
> > > > > on whatever the PM callback would be doing[1]:
> > > > > 
> > > > > 	        if (dev->power.runtime_error)
> > > > >                 retval = -EINVAL;
> > > > >         else if (dev->power.disable_depth > 0)
> > > > >                 retval = -EACCES;
> > > > > 
> > > > > It would be very unlikely that trying to suspend again would solve
> > > > > those conditions.
> > > > > 
> > > > > So, I guess that the right thing to do is to change the code
> > > > > to do, instead:
> > > > > 
> > > > >   static int __maybe_unused ccs_suspend(struct device *dev)
> > > > >   {
> > > > >         struct i2c_client *client = to_i2c_client(dev);
> > > > >         struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> > > > >         struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> > > > >         bool streaming = sensor->streaming;
> > > > >         int rval;
> > > > > 
> > > > >         rval = pm_runtime_resume_and_get(dev);
> > > > >         if (rval < 0) 
> > > > >                 return rval;
> > > > > 	...
> > > > >   }
> > > > > 
> > > > > 
> > > > > [1] see rpm_resume() code at drivers/base/power/runtime.c.      
> > > > 
> > > > Yeah, I agree. This code is one of the older parts the driver.
> > > > 
> > > > Please add:
> > > > 
> > > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > 
> > > > The same goes for the other sensor driver patches in the set you cc'd me,
> > > > i.e. patches 12, 15, 26, 28,32, 40, 45, 51, 53 and 55.    
> > > 
> > > It probably makes sense to address the suspend/resume -EAGAIN
> > > return code on a separate patch series, before this one, as:
> > > 
> > > 1. this is unrelated to this change;
> > > 2. it is something that should be c/c to fixes. So, having it
> > >    before this series makes easier to apply there.    
> > 
> > Sounds good to me. If you can submit a patch, please add my ack. :-)  
> 
> Sure. I'll work on such patch series.

I checked the files affected by those patches:
12, 15, 26, 28,32, 40, 45, 51, 53 and 55, e.g.:


	drivers/staging/media/atomisp/pci/atomisp_fops.c
	drivers/staging/media/ipu3/ipu3.c
	drivers/media/i2c/dw9714.c
	drivers/media/i2c/dw9807-vcm.c
	drivers/media/i2c/imx258.c
	drivers/media/i2c/ov13858.c
	drivers/media/i2c/ov8865.c
	drivers/media/i2c/tvp5150.c
	drivers/media/pci/intel/ipu3/ipu3-cio2-main.c

I also double-checked the I2C drivers that use SET_SYSTEM_SLEEP_PM_OPS().
None of them are calling pm_runtime_* at suspend time, except for the
ccs-core.

So, I ended writing just a patch for ccs-core, to be applied
before this /78 series.

Thanks,
Mauro
