Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398CE67958A
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 11:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbjAXKnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 05:43:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbjAXKng (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 05:43:36 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B81613DC5
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 02:43:35 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323961366"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="323961366"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694291106"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="694291106"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2023 02:43:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKGm2-00EIQz-0e;
        Tue, 24 Jan 2023 12:43:30 +0200
Date:   Tue, 24 Jan 2023 12:43:29 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 39/57] media: atomisp: ov2680: Drop
 v4l2_find_nearest_size() call from set_fmt()
Message-ID: <Y8+2Uc246MDX8g5l@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-40-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-40-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:47PM +0100, Hans de Goede wrote:
> Since we now calculate timings baded on the desired width and height,
> any width and height are valid as long as they don't exceed the sensor's
> dimensions.
> 
> Drop the v4l2_find_nearest_size() call and instead clamp the requested
> width and height.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 75d09c44202c..3d5e18fb45ee 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -512,7 +512,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  	struct ov2680_device *dev = to_ov2680_sensor(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	struct v4l2_mbus_framefmt *fmt;
> -	struct ov2680_resolution *res;
> +	unsigned int width, height;
>  	int ret = 0;
>  
>  	dev_dbg(&client->dev, "%s: %s: pad: %d, fmt: %p\n",
> @@ -520,14 +520,11 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  		(format->which == V4L2_SUBDEV_FORMAT_TRY) ? "try" : "set",
>  		format->pad, fmt);
>  
> -	res = v4l2_find_nearest_size(ov2680_res_preview, ARRAY_SIZE(ov2680_res_preview),
> -				     width, height,
> -				     format->format.width, format->format.height);
> -	if (!res)
> -		res = &ov2680_res_preview[N_RES_PREVIEW - 1];
> +	width = min_t(unsigned int, ALIGN(format->format.width, 2), OV2680_NATIVE_WIDTH);
> +	height = min_t(unsigned int, ALIGN(format->format.height, 2), OV2680_NATIVE_HEIGHT);
>  
>  	fmt = __ov2680_get_pad_format(dev, sd_state, format->pad, format->which);
> -	ov2680_fill_format(dev, fmt, res->width, res->height);
> +	ov2680_fill_format(dev, fmt, width, height);
>  
>  	format->format = *fmt;
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


