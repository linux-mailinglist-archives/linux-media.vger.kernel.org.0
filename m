Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8308F678512
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 19:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbjAWSkA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 13:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbjAWSj7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 13:39:59 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C26265B1
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 10:39:58 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305778419"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="305778419"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663774391"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="663774391"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 10:39:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK1jW-00DsQw-0r;
        Mon, 23 Jan 2023 20:39:54 +0200
Date:   Mon, 23 Jan 2023 20:39:54 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 53/57] media: atomisp: ov2722: Don't take the input_lock
 for try_fmt calls.
Message-ID: <Y87UevD1sSS36cP7@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-54-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-54-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:52:01PM +0100, Hans de Goede wrote:
> On ov2722_set_fmt() calls with format->which == V4L2_SUBDEV_FORMAT_TRY,
> ov2722_set_fmt() does not talk to the sensor, so there is no need to
> lock the dev->input_lock mutex in this case.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index 83d036b5d772..e09c80d1f9ec 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -651,7 +651,6 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
>  	if (!ov2722_info)
>  		return -EINVAL;
>  
> -	mutex_lock(&dev->input_lock);
>  	res = v4l2_find_nearest_size(ov2722_res_preview,
>  				     ARRAY_SIZE(ov2722_res_preview), width,
>  				     height, fmt->width, fmt->height);
> @@ -665,10 +664,10 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
>  	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		sd_state->pads->try_fmt = *fmt;
> -		mutex_unlock(&dev->input_lock);
>  		return 0;
>  	}
>  
> +	mutex_lock(&dev->input_lock);
>  
>  	dev->pixels_per_line = dev->res->pixels_per_line;
>  	dev->lines_per_frame = dev->res->lines_per_frame;
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


