Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83077373898
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 12:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbhEEKfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 06:35:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:25715 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232592AbhEEKfK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 06:35:10 -0400
IronPort-SDR: Mrbw7bKl0jZCRk2S42ZfaHrNhNMxeS+JPZZW57wXWqVZXwo78y1yg4tlg3C2yOxLViUQDbRx4V
 3PTpCDQh/iFQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="262126027"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="262126027"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 03:34:13 -0700
IronPort-SDR: R1kdD5N6rI4GcRSIFwHFN2uV/W+kaNoDOedItu6YgM22Y6qsSLujSbBLDDQiHVSa4HCeRTQkyv
 kkpXKXnEqRXQ==
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="429791988"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 03:34:11 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9223D203BC;
        Wed,  5 May 2021 13:34:09 +0300 (EEST)
Date:   Wed, 5 May 2021 13:34:09 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 25/25] media: i2c: ccs-core: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210505103409.GN3@paasikivi.fi.intel.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <83ec24acb15f17e2ce589575c2f5eb7bdd1daf28.1620207353.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83ec24acb15f17e2ce589575c2f5eb7bdd1daf28.1620207353.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the patch.

On Wed, May 05, 2021 at 11:42:15AM +0200, Mauro Carvalho Chehab wrote:
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
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Could you add Fixes: line and Cc: stable?

The patch that breaks this is 96e3a6b92f23a .

It would be better to fix the bug first so the patch to the stable trees
doesn't need special handling.

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 39 ++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index b05f409014b2..04c3ab9e37b4 100644
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
> +	pm_runtime_put_noidle(&client->dev);

This needs to be pm_runtime_put() as the device has been successfully.

> +	return rval;
>  }
>  
>  static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
> @@ -3089,12 +3101,9 @@ static int __maybe_unused ccs_suspend(struct device *dev)
>  	bool streaming = sensor->streaming;
>  	int rval;
>  
> -	rval = pm_runtime_get_sync(dev);
> -	if (rval < 0) {
> -		pm_runtime_put_noidle(dev);
> -
> +	rval = pm_runtime_resume_and_get(dev);
> +	if (rval < 0)
>  		return rval;
> -	}
>  
>  	if (sensor->streaming)
>  		ccs_stop_streaming(sensor);

-- 
Kind regards,

Sakari Ailus
