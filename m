Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7506736B06E
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 11:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbhDZJWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 05:22:12 -0400
Received: from mga07.intel.com ([134.134.136.100]:46859 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232080AbhDZJWL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 05:22:11 -0400
IronPort-SDR: M/X21t4Ebd5m/BkXUHqaeYNX+2YMWBE71Fi/p+gdUzK4/6PAfX0RCcVALCcIOFO3MwDY3TUaJt
 BHNXPs+R0HGw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="260258419"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="260258419"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 02:21:29 -0700
IronPort-SDR: V36vqNipvCb4hLh8Agj1I/onW7FoBa41BGbkDhZJYgKIMsa7LyJqlCgaVCY1H8xd0AmRMNrKX7
 OXd4qxOQBHHQ==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="424858152"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 02:21:28 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1B2AF203BC;
        Mon, 26 Apr 2021 12:21:26 +0300 (EEST)
Date:   Mon, 26 Apr 2021 12:21:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH] staging: media: atomisp: replace pr_info() by dev_info()
Message-ID: <20210426092125.GU3@paasikivi.fi.intel.com>
References: <20210422103037.GA239298@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422103037.GA239298@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deepak,

Thanks for the patch.

On Thu, Apr 22, 2021 at 04:00:37PM +0530, Deepak R Varma wrote:
> It is recommended to use driver model diagnostic macros dev_*() instead
> of pr_*() since the former ensures that the log messages are always
> associated with the corresponding device and driver.
> 
> Suggested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Note: There are few more pr_into() calls that I have not replaced since
> they are very basic (entry and exit) and temporary. They can be removed 
> if the APIs are fully tested. See this example:
> 	pr_info("%s S\n", __func__);
> 
> Let me know if I should remove them and resubmit this patch.

Most probably leftovers from development time. I think these could be
removed but perhaps by a separate patch.

> 
> 
>  .../media/atomisp/i2c/atomisp-gc0310.c        | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 7e4e123fdb52..27153ec6f65e 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -300,7 +300,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
>  	/* pixel clock calculattion */
>  	dev->vt_pix_clk_freq_mhz = 14400000; // 16.8MHz
>  	buf->vt_pix_clk_freq_mhz = dev->vt_pix_clk_freq_mhz;
> -	pr_info("vt_pix_clk_freq_mhz=%d\n", buf->vt_pix_clk_freq_mhz);
> +	dev_info(&client->dev, "vt_pix_clk_freq_mhz=%d\n", buf->vt_pix_clk_freq_mhz);

Over 80; please wrap. The same for the rest of such lines.

>  
>  	/* get integration time */
>  	buf->coarse_integration_time_min = GC0310_COARSE_INTG_TIME_MIN;
> @@ -326,7 +326,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  	buf->crop_horizontal_start = val | (reg_val & 0xFF);
> -	pr_info("crop_horizontal_start=%d\n", buf->crop_horizontal_start);
> +	dev_info(&client->dev, "crop_horizontal_start=%d\n", buf->crop_horizontal_start);
>  
>  	/* Getting crop_vertical_start */
>  	ret =  gc0310_read_reg(client, GC0310_8BIT,
> @@ -339,7 +339,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  	buf->crop_vertical_start = val | (reg_val & 0xFF);
> -	pr_info("crop_vertical_start=%d\n", buf->crop_vertical_start);
> +	dev_info(&client->dev, "crop_vertical_start=%d\n", buf->crop_vertical_start);
>  
>  	/* Getting output_width */
>  	ret = gc0310_read_reg(client, GC0310_8BIT,
> @@ -352,7 +352,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  	buf->output_width = val | (reg_val & 0xFF);
> -	pr_info("output_width=%d\n", buf->output_width);
> +	dev_info(&client->dev, "output_width=%d\n", buf->output_width);
>  
>  	/* Getting output_height */
>  	ret = gc0310_read_reg(client, GC0310_8BIT,
> @@ -365,12 +365,12 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  	buf->output_height = val | (reg_val & 0xFF);
> -	pr_info("output_height=%d\n", buf->output_height);
> +	dev_info(&client->dev, "output_height=%d\n", buf->output_height);
>  
>  	buf->crop_horizontal_end = buf->crop_horizontal_start + buf->output_width - 1;
>  	buf->crop_vertical_end = buf->crop_vertical_start + buf->output_height - 1;
> -	pr_info("crop_horizontal_end=%d\n", buf->crop_horizontal_end);
> -	pr_info("crop_vertical_end=%d\n", buf->crop_vertical_end);
> +	dev_info(&client->dev, "crop_horizontal_end=%d\n", buf->crop_horizontal_end);
> +	dev_info(&client->dev, "crop_vertical_end=%d\n", buf->crop_vertical_end);
>  
>  	/* Getting line_length_pck */
>  	ret = gc0310_read_reg(client, GC0310_8BIT,
> @@ -389,8 +389,8 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
>  		return ret;
>  	sh_delay = reg_val;
>  	buf->line_length_pck = buf->output_width + hori_blanking + sh_delay + 4;
> -	pr_info("hori_blanking=%d sh_delay=%d line_length_pck=%d\n", hori_blanking,
> -		sh_delay, buf->line_length_pck);
> +	dev_info(&client->dev, "hori_blanking=%d sh_delay=%d line_length_pck=%d\n", hori_blanking,
> +		 sh_delay, buf->line_length_pck);
>  
>  	/* Getting frame_length_lines */
>  	ret = gc0310_read_reg(client, GC0310_8BIT,
> @@ -404,8 +404,8 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
>  		return ret;
>  	vert_blanking = val | (reg_val & 0xFF);
>  	buf->frame_length_lines = buf->output_height + vert_blanking;
> -	pr_info("vert_blanking=%d frame_length_lines=%d\n", vert_blanking,
> -		buf->frame_length_lines);
> +	dev_info(&client->dev, "vert_blanking=%d frame_length_lines=%d\n", vert_blanking,
> +		 buf->frame_length_lines);
>  
>  	buf->binning_factor_x = res->bin_factor_x ?
>  				res->bin_factor_x : 1;
> @@ -434,7 +434,7 @@ static int gc0310_set_gain(struct v4l2_subdev *sd, int gain)
>  		dgain = gain / 2;
>  	}
>  
> -	pr_info("gain=0x%x again=0x%x dgain=0x%x\n", gain, again, dgain);
> +	dev_info(&client->dev, "gain=0x%x again=0x%x dgain=0x%x\n", gain, again, dgain);
>  
>  	/* set analog gain */
>  	ret = gc0310_write_reg(client, GC0310_8BIT,
> @@ -458,7 +458,7 @@ static int __gc0310_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	int ret;
>  
> -	pr_info("coarse_itg=%d gain=%d digitgain=%d\n", coarse_itg, gain, digitgain);
> +	dev_info(&client->dev, "coarse_itg=%d gain=%d digitgain=%d\n", coarse_itg, gain, digitgain);
>  
>  	/* set exposure */
>  	ret = gc0310_write_reg(client, GC0310_8BIT,
> @@ -1085,7 +1085,7 @@ static int gc0310_detect(struct i2c_client *client)
>  		return -ENODEV;
>  	}
>  	id = ((((u16)high) << 8) | (u16)low);
> -	pr_info("sensor ID = 0x%x\n", id);
> +	dev_info(&client->dev, "sensor ID = 0x%x\n", id);
>  
>  	if (id != GC0310_ID) {
>  		dev_err(&client->dev, "sensor ID error, read id = 0x%x, target id = 0x%x\n", id,
> @@ -1106,7 +1106,7 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	int ret;
>  
> -	pr_info("%s S enable=%d\n", __func__, enable);
> +	dev_info(&client->dev, "%s S enable=%d\n", __func__, enable);
>  	mutex_lock(&dev->input_lock);
>  
>  	if (enable) {

-- 
Kind regards,

Sakari Ailus
