Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A324F67852D
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 19:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbjAWSnd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 13:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjAWSnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 13:43:32 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB747A9C
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 10:43:12 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305778880"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="305778880"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:42:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663775268"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="663775268"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 10:42:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK1le-00DsTl-0I;
        Mon, 23 Jan 2023 20:42:06 +0200
Date:   Mon, 23 Jan 2023 20:42:05 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 54/57] media: atomisp: ov2722: Power on sensor from
 set_fmt() callback
Message-ID: <Y87U/UGWKyW4soys@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-55-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-55-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:52:02PM +0100, Hans de Goede wrote:
> Depending on which order userspace makes various v4l2 calls, the sensor
> might still be powered down when set_fmt is called.
> 
> What should really happen here is delay the writing of the mode-related
> registers till streaming is started, but for now use the same quick fix
> as the atomisp_ov2680 / atomisp_gc0310 code and call power_up() from
> set_fmt() in combination with keeping track of the power-state to avoid
> doing the power-up sequence twice.

OK.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

Is there a plan to drop this hack from all of the (AtomISP) sensor drivers?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 12 ++++++++++++
>  drivers/staging/media/atomisp/i2c/ov2722.h         |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index e09c80d1f9ec..5d2e6e2e72f0 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -528,6 +528,9 @@ static int power_up(struct v4l2_subdev *sd)
>  		return -ENODEV;
>  	}
>  
> +	if (dev->power_on == 1)
> +		return 0; /* Already on */
> +
>  	/* power control */
>  	ret = power_ctrl(sd, 1);
>  	if (ret)
> @@ -552,6 +555,7 @@ static int power_up(struct v4l2_subdev *sd)
>  	/* according to DS, 20ms is needed between PWDN and i2c access */
>  	msleep(20);
>  
> +	dev->power_on = 1;
>  	return 0;
>  
>  fail_clk:
> @@ -575,6 +579,9 @@ static int power_down(struct v4l2_subdev *sd)
>  		return -ENODEV;
>  	}
>  
> +	if (dev->power_on == 0)
> +		return 0; /* Already off */
> +
>  	ret = dev->platform_data->flisclk_ctrl(sd, 0);
>  	if (ret)
>  		dev_err(&client->dev, "flisclk failed\n");
> @@ -592,6 +599,7 @@ static int power_down(struct v4l2_subdev *sd)
>  	if (ret)
>  		dev_err(&client->dev, "vprog failed.\n");
>  
> +	dev->power_on = 0;
>  	return ret;
>  }
>  
> @@ -669,6 +677,9 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
>  
>  	mutex_lock(&dev->input_lock);
>  
> +	/* s_power has not been called yet for std v4l2 clients (camorama) */
> +	power_up(sd);
> +
>  	dev->pixels_per_line = dev->res->pixels_per_line;
>  	dev->lines_per_frame = dev->res->lines_per_frame;
>  
> @@ -959,6 +970,7 @@ static int ov2722_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	mutex_init(&dev->input_lock);
> +	dev->power_on = -1;
>  
>  	dev->res = &ov2722_res_preview[0];
>  	v4l2_i2c_subdev_init(&dev->sd, client, &ov2722_ops);
> diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
> index 020743a944c4..640d3ffcaa5c 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2722.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2722.h
> @@ -198,7 +198,7 @@ struct ov2722_device {
>  	struct ov2722_resolution *res;
>  
>  	struct camera_sensor_platform_data *platform_data;
> -	int run_mode;
> +	int power_on;
>  	u16 pixels_per_line;
>  	u16 lines_per_frame;
>  	u8 type;
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


