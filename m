Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D076443E07
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 09:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhKCIK7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:10:59 -0400
Received: from mga05.intel.com ([192.55.52.43]:4718 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231512AbhKCIK6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Nov 2021 04:10:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="317654897"
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; 
   d="scan'208";a="317654897"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2021 01:08:22 -0700
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; 
   d="scan'208";a="599802531"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2021 01:08:18 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 09D522036B;
        Wed,  3 Nov 2021 10:08:16 +0200 (EET)
Date:   Wed, 3 Nov 2021 10:08:16 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     akinobu.mita@gmail.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov7740: implement get_mbus_config
Message-ID: <YYJDcIiBXo/XlKCX@paasikivi.fi.intel.com>
References: <20211102153008.1349895-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102153008.1349895-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

Thanks for the patch.

On Tue, Nov 02, 2021 at 05:30:08PM +0200, Eugen Hristev wrote:
> Implement the get_mbus_config callback.
> ov7740 is a parallel sensor, and according to datasheet, the register
> REG12 controls the CCIR656 mode. This register is written to 0 in yuyv mode.
> According to REG12[5] , CCIR656 mode, the behavior is:
> CCIR656: disabled
> REG28 controls the polarity of the signals. This register is unused.
> The default behavior is then:
> HSYNC polarity : positive
> VSYNC polarity : positive
> HREF polarity: positive
> 

Doesn't the receiver driver get this information from DT?

> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  drivers/media/i2c/ov7740.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
> index 2539cfee85c8..f8a717aecb6f 100644
> --- a/drivers/media/i2c/ov7740.c
> +++ b/drivers/media/i2c/ov7740.c
> @@ -873,12 +873,26 @@ static int ov7740_get_fmt(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int ov7740_get_mbus_config(struct v4l2_subdev *sd,
> +				  unsigned int pad,
> +				  struct v4l2_mbus_config *cfg)
> +{
> +	cfg->type = V4L2_MBUS_PARALLEL;
> +	cfg->flags = V4L2_MBUS_MASTER | V4L2_MBUS_HSYNC_ACTIVE_HIGH |
> +		     V4L2_MBUS_VSYNC_ACTIVE_HIGH |
> +		     V4L2_MBUS_PCLK_SAMPLE_RISING |
> +		     V4L2_MBUS_FIELD_EVEN_LOW | V4L2_MBUS_DATA_ACTIVE_HIGH;
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_pad_ops ov7740_subdev_pad_ops = {
>  	.enum_frame_interval = ov7740_enum_frame_interval,
>  	.enum_frame_size = ov7740_enum_frame_size,
>  	.enum_mbus_code = ov7740_enum_mbus_code,
>  	.get_fmt = ov7740_get_fmt,
>  	.set_fmt = ov7740_set_fmt,
> +	.get_mbus_config = ov7740_get_mbus_config,
>  };
>  
>  static const struct v4l2_subdev_ops ov7740_subdev_ops = {

-- 
Regards,

Sakari Ailus
