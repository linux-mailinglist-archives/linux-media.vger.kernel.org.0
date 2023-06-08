Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 988CF728055
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 14:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235563AbjFHMo6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 08:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234793AbjFHMo5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 08:44:57 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5229826B0
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686228296; x=1717764296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hH3/RT7gqhUuWXS1IddJqKFXa4E/qiVedEi5LKOFvlw=;
  b=YRmCLSusfC0SxFsvIkOILu1DWmkLT1aoAT+rqqnYf9KTAxcVWEGwHpUM
   1MRppBj+xahsG4rJca1N7wQEWDNDNaKfCPETnOQKb350uIfmMtLfi2HNT
   c7K3VplxT/3BqiogpYuKbjWAQ/VZ/1Bra4NlL3Oijd2cEOXEuRv8JdLJ6
   +OlGeCWecr4oj8bW4CnbySsxne86yYFa82OrErDGtVro3Kc2YHUGP5wAv
   5e+pdOQNgdeaLZnwYUUurbAoMkR7lVRfHcU+KENDoNVi+XWt6sqUn7Zdp
   r3iQlKqhz8GCrzaAOMCiZdhWYlc83gir1XLvszT9ir8HiNQ+Asi1KDAeg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360627860"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="360627860"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 05:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="779852905"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="779852905"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 05:44:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 48180120BE1;
        Thu,  8 Jun 2023 15:44:51 +0300 (EEST)
Date:   Thu, 8 Jun 2023 12:44:51 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 05/28] media: ov2680: Don't take the lock for try_fmt
 calls
Message-ID: <ZIHNQ4JngKVJKMYu@kekkonen.localdomain>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-6-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 07, 2023 at 06:46:49PM +0200, Hans de Goede wrote:
> On ov2680_set_fmt() calls with format->which == V4L2_SUBDEV_FORMAT_TRY,
> ov2680_set_fmt() does not talk to the sensor.
> 
> So in this case there is no need to lock the sensor->lock mutex or
> to check that the sensor is streaming.
> 
> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index d90bbca6e913..a26a6f18f4f1 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -592,24 +592,22 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  	if (format->pad != 0)
>  		return -EINVAL;
>  
> -	mutex_lock(&sensor->lock);
> -
> -	if (sensor->is_streaming) {
> -		ret = -EBUSY;
> -		goto unlock;
> -	}
> -
>  	mode = v4l2_find_nearest_size(ov2680_mode_data,
>  				      ARRAY_SIZE(ov2680_mode_data), width,
>  				      height, fmt->width, fmt->height);
> -	if (!mode) {
> -		ret = -EINVAL;
> -		goto unlock;
> -	}
> +	if (!mode)
> +		return -EINVAL;
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
>  		format->format = *try_fmt;

Access to sd_state needs to be serialised, so mutex should be held here.

> +		return 0;
> +	}
> +
> +	mutex_lock(&sensor->lock);
> +
> +	if (sensor->is_streaming) {
> +		ret = -EBUSY;
>  		goto unlock;
>  	}
>  

-- 
Kind regards,

Sakari Ailus
