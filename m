Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06F466795CE
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 11:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233482AbjAXKzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 05:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbjAXKzJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 05:55:09 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0603FE394
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 02:55:09 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306622727"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="306622727"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804545387"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="804545387"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2023 02:55:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKGxE-00EIht-1Y;
        Tue, 24 Jan 2023 12:55:04 +0200
Date:   Tue, 24 Jan 2023 12:55:04 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 49/57] media: atomisp: ov2680: Use devm_kzalloc() for
 sensor data struct
Message-ID: <Y8+5CLxInbO+9NQJ@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-50-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-50-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:57PM +0100, Hans de Goede wrote:
> Use devm_kzalloc() to allocate the sensor data struct. It is always free-ed
> as the last step of probe-error-exit or remove, so it can be devm-managed.
> 
> This will make unwinding things easier when support is added to the ov2680
> code to use standard GPIO APIs instead of the custom atomisp_gmin code.
> 
> This also allows dropping the out_free label and use direct return
> on errors.
> 
> This may seem like a functional change since the out_free label also
> did a v4l2_device_unregister_subdev() but at the 2 changed returns
> the device is not registered yet, so that always is a no-op and can
> be dropped.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/i2c/atomisp-ov2680.c   | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 5f26508a1e5a..2b4673092b6a 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -780,7 +780,6 @@ static void ov2680_remove(struct i2c_client *client)
>  	media_entity_cleanup(&sensor->sd.entity);
>  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>  	pm_runtime_disable(&client->dev);
> -	kfree(sensor);
>  }
>  
>  static int ov2680_probe(struct i2c_client *client)
> @@ -789,7 +788,7 @@ static int ov2680_probe(struct i2c_client *client)
>  	int ret;
>  	void *pdata;
>  
> -	sensor = kzalloc(sizeof(*sensor), GFP_KERNEL);
> +	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
>  	if (!sensor)
>  		return -ENOMEM;
>  
> @@ -801,10 +800,8 @@ static int ov2680_probe(struct i2c_client *client)
>  	pdata = gmin_camera_platform_data(&sensor->sd,
>  					  ATOMISP_INPUT_FORMAT_RAW_10,
>  					  atomisp_bayer_order_bggr);
> -	if (!pdata) {
> -		ret = -EINVAL;
> -		goto out_free;
> -	}
> +	if (!pdata)
> +		return -EINVAL;
>  
>  	pm_runtime_set_suspended(&client->dev);
>  	pm_runtime_enable(&client->dev);
> @@ -813,7 +810,7 @@ static int ov2680_probe(struct i2c_client *client)
>  
>  	ret = ov2680_s_config(&sensor->sd, client->irq, pdata);
>  	if (ret)
> -		goto out_free;
> +		return ret;
>  
>  	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> @@ -840,11 +837,6 @@ static int ov2680_probe(struct i2c_client *client)
>  	}
>  
>  	return 0;
> -out_free:
> -	dev_dbg(&client->dev, "+++ out free\n");
> -	v4l2_device_unregister_subdev(&sensor->sd);
> -	kfree(sensor);
> -	return ret;
>  }
>  
>  static int ov2680_suspend(struct device *dev)
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


