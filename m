Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85A8677E12
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 15:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbjAWOb5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 09:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbjAWOb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 09:31:56 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F89C64C
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 06:31:53 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="306403993"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="306403993"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="661653233"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="661653233"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 23 Jan 2023 06:31:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pJxrQ-00DmPm-1F;
        Mon, 23 Jan 2023 16:31:48 +0200
Date:   Mon, 23 Jan 2023 16:31:48 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 09/57] media: atomisp: Remove custom
 ATOMISP_IOC_G_SENSOR_MODE_DATA ioctl
Message-ID: <Y86aVBy4XtYf5JBs@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-10-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-10-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:17PM +0100, Hans de Goede wrote:
> This ioctl returns a number of fixed sensor parameters +
> a number of mode-specific parameters.
> 
> With libcamera these fixed parameters are instead stored in a table
> with sensor-name to parameters mappings (camera_sensor_properties.cpp);
> and the variable parameters can be derived from the set fmt.
> 
> So this custom ioctl is not necessary; and it currently has no users.
> 
> Remove the ioctl and all the sensor drivers xxxx_get_intg_factor()
> helpers which return this info.
> 
> This is part of a patch-series which tries to remove atomisp specific /
> custom code from the sensor drivers, with as end goal to make the atomisp
> drivers regular camera sensor drivers.

Git history will keep this anyway (in case it will be needed for anything),
so

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-gc0310.c        | 140 ------------------
>  .../media/atomisp/i2c/atomisp-gc2235.c        | 113 --------------
>  .../media/atomisp/i2c/atomisp-mt9m114.c       |  96 ------------
>  .../media/atomisp/i2c/atomisp-ov2680.c        |  82 ----------
>  .../media/atomisp/i2c/atomisp-ov2722.c        | 111 --------------
>  drivers/staging/media/atomisp/i2c/gc0310.h    |   1 -
>  drivers/staging/media/atomisp/i2c/gc2235.h    |   1 -
>  drivers/staging/media/atomisp/i2c/ov2722.h    |   1 -
>  .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |  86 -----------
>  .../staging/media/atomisp/i2c/ov5693/ov5693.h |   1 -
>  .../media/atomisp/include/linux/atomisp.h     |  26 ----
>  .../atomisp/include/linux/atomisp_platform.h  |   1 -
>  drivers/staging/media/atomisp/notes.txt       |   6 -
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  19 ---
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   3 -
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |   4 -
>  16 files changed, 691 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index a9c4724a9358..4968ec51ff1b 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -259,140 +259,6 @@ static int gc0310_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
>  	return 0;
>  }
>  
> -static int gc0310_get_intg_factor(struct i2c_client *client,
> -				  struct camera_mipi_info *info,
> -				  const struct gc0310_resolution *res)
> -{
> -	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> -	struct gc0310_device *dev = to_gc0310_sensor(sd);
> -	struct atomisp_sensor_mode_data *buf = &info->data;
> -	u16 val;
> -	u8 reg_val;
> -	int ret;
> -	unsigned int hori_blanking;
> -	unsigned int vert_blanking;
> -	unsigned int sh_delay;
> -
> -	if (!info)
> -		return -EINVAL;
> -
> -	/* pixel clock calculattion */
> -	dev->vt_pix_clk_freq_mhz = 14400000; // 16.8MHz
> -	buf->vt_pix_clk_freq_mhz = dev->vt_pix_clk_freq_mhz;
> -	dev_dbg(&client->dev, "vt_pix_clk_freq_mhz=%d\n", buf->vt_pix_clk_freq_mhz);
> -
> -	/* get integration time */
> -	buf->coarse_integration_time_min = GC0310_COARSE_INTG_TIME_MIN;
> -	buf->coarse_integration_time_max_margin =
> -	    GC0310_COARSE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_min = GC0310_FINE_INTG_TIME_MIN;
> -	buf->fine_integration_time_max_margin =
> -	    GC0310_FINE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_def = GC0310_FINE_INTG_TIME_MIN;
> -	buf->read_mode = res->bin_mode;
> -
> -	/* get the cropping and output resolution to ISP for this mode. */
> -	/* Getting crop_horizontal_start */
> -	ret =  gc0310_read_reg(client, GC0310_8BIT,
> -			       GC0310_H_CROP_START_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	val = (reg_val & 0xFF) << 8;
> -	ret =  gc0310_read_reg(client, GC0310_8BIT,
> -			       GC0310_H_CROP_START_L, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_horizontal_start = val | (reg_val & 0xFF);
> -	dev_dbg(&client->dev, "crop_horizontal_start=%d\n", buf->crop_horizontal_start);
> -
> -	/* Getting crop_vertical_start */
> -	ret =  gc0310_read_reg(client, GC0310_8BIT,
> -			       GC0310_V_CROP_START_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	val = (reg_val & 0xFF) << 8;
> -	ret =  gc0310_read_reg(client, GC0310_8BIT,
> -			       GC0310_V_CROP_START_L, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_vertical_start = val | (reg_val & 0xFF);
> -	dev_dbg(&client->dev, "crop_vertical_start=%d\n", buf->crop_vertical_start);
> -
> -	/* Getting output_width */
> -	ret = gc0310_read_reg(client, GC0310_8BIT,
> -			      GC0310_H_OUTSIZE_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	val = (reg_val & 0xFF) << 8;
> -	ret = gc0310_read_reg(client, GC0310_8BIT,
> -			      GC0310_H_OUTSIZE_L, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_width = val | (reg_val & 0xFF);
> -	dev_dbg(&client->dev, "output_width=%d\n", buf->output_width);
> -
> -	/* Getting output_height */
> -	ret = gc0310_read_reg(client, GC0310_8BIT,
> -			      GC0310_V_OUTSIZE_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	val = (reg_val & 0xFF) << 8;
> -	ret = gc0310_read_reg(client, GC0310_8BIT,
> -			      GC0310_V_OUTSIZE_L, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_height = val | (reg_val & 0xFF);
> -	dev_dbg(&client->dev, "output_height=%d\n", buf->output_height);
> -
> -	buf->crop_horizontal_end = buf->crop_horizontal_start + buf->output_width - 1;
> -	buf->crop_vertical_end = buf->crop_vertical_start + buf->output_height - 1;
> -	dev_dbg(&client->dev, "crop_horizontal_end=%d\n", buf->crop_horizontal_end);
> -	dev_dbg(&client->dev, "crop_vertical_end=%d\n", buf->crop_vertical_end);
> -
> -	/* Getting line_length_pck */
> -	ret = gc0310_read_reg(client, GC0310_8BIT,
> -			      GC0310_H_BLANKING_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	val = (reg_val & 0xFF) << 8;
> -	ret = gc0310_read_reg(client, GC0310_8BIT,
> -			      GC0310_H_BLANKING_L, &reg_val);
> -	if (ret)
> -		return ret;
> -	hori_blanking = val | (reg_val & 0xFF);
> -	ret = gc0310_read_reg(client, GC0310_8BIT,
> -			      GC0310_SH_DELAY, &reg_val);
> -	if (ret)
> -		return ret;
> -	sh_delay = reg_val;
> -	buf->line_length_pck = buf->output_width + hori_blanking + sh_delay + 4;
> -	dev_dbg(&client->dev, "hori_blanking=%d sh_delay=%d line_length_pck=%d\n", hori_blanking,
> -		sh_delay, buf->line_length_pck);
> -
> -	/* Getting frame_length_lines */
> -	ret = gc0310_read_reg(client, GC0310_8BIT,
> -			      GC0310_V_BLANKING_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	val = (reg_val & 0xFF) << 8;
> -	ret = gc0310_read_reg(client, GC0310_8BIT,
> -			      GC0310_V_BLANKING_L, &reg_val);
> -	if (ret)
> -		return ret;
> -	vert_blanking = val | (reg_val & 0xFF);
> -	buf->frame_length_lines = buf->output_height + vert_blanking;
> -	dev_dbg(&client->dev, "vert_blanking=%d frame_length_lines=%d\n", vert_blanking,
> -		buf->frame_length_lines);
> -
> -	buf->binning_factor_x = res->bin_factor_x ?
> -				res->bin_factor_x : 1;
> -	buf->binning_factor_y = res->bin_factor_y ?
> -				res->bin_factor_y : 1;
> -	return 0;
> -}
> -
>  static int gc0310_set_gain(struct v4l2_subdev *sd, int gain)
>  
>  {
> @@ -889,12 +755,6 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
>  		goto err;
>  	}
>  
> -	ret = gc0310_get_intg_factor(client, gc0310_info, dev->res);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to get integration_factor\n");
> -		goto err;
> -	}
> -
>  err:
>  	mutex_unlock(&dev->input_lock);
>  	return ret;
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index e6df10bcab8c..cb4c79b483ca 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -220,114 +220,6 @@ static int gc2235_write_reg_array(struct i2c_client *client,
>  	return __gc2235_flush_reg_array(client, &ctrl);
>  }
>  
> -static int gc2235_get_intg_factor(struct i2c_client *client,
> -				  struct camera_mipi_info *info,
> -				  const struct gc2235_resolution *res)
> -{
> -	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> -	struct gc2235_device *dev = to_gc2235_sensor(sd);
> -	struct atomisp_sensor_mode_data *buf = &info->data;
> -	u16 reg_val, reg_val_h;
> -	int ret;
> -
> -	if (!info)
> -		return -EINVAL;
> -
> -	/* pixel clock calculattion */
> -	buf->vt_pix_clk_freq_mhz = dev->vt_pix_clk_freq_mhz = 30000000;
> -
> -	/* get integration time */
> -	buf->coarse_integration_time_min = GC2235_COARSE_INTG_TIME_MIN;
> -	buf->coarse_integration_time_max_margin =
> -	    GC2235_COARSE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_min = GC2235_FINE_INTG_TIME_MIN;
> -	buf->fine_integration_time_max_margin =
> -	    GC2235_FINE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_def = GC2235_FINE_INTG_TIME_MIN;
> -	buf->frame_length_lines = res->lines_per_frame;
> -	buf->line_length_pck = res->pixels_per_line;
> -	buf->read_mode = res->bin_mode;
> -
> -	/* get the cropping and output resolution to ISP for this mode. */
> -	ret =  gc2235_read_reg(client, GC2235_8BIT,
> -			       GC2235_H_CROP_START_H, &reg_val_h);
> -	ret =  gc2235_read_reg(client, GC2235_8BIT,
> -			       GC2235_H_CROP_START_L, &reg_val);
> -	if (ret)
> -		return ret;
> -
> -	buf->crop_horizontal_start = (reg_val_h << 8) | reg_val;
> -
> -	ret =  gc2235_read_reg(client, GC2235_8BIT,
> -			       GC2235_V_CROP_START_H, &reg_val_h);
> -	ret =  gc2235_read_reg(client, GC2235_8BIT,
> -			       GC2235_V_CROP_START_L, &reg_val);
> -	if (ret)
> -		return ret;
> -
> -	buf->crop_vertical_start = (reg_val_h << 8) | reg_val;
> -
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_H_OUTSIZE_H, &reg_val_h);
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_H_OUTSIZE_L, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_width = (reg_val_h << 8) | reg_val;
> -
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_V_OUTSIZE_H, &reg_val_h);
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_V_OUTSIZE_L, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_height = (reg_val_h << 8) | reg_val;
> -
> -	buf->crop_horizontal_end = buf->crop_horizontal_start +
> -				   buf->output_width - 1;
> -	buf->crop_vertical_end = buf->crop_vertical_start +
> -				 buf->output_height - 1;
> -
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_HB_H, &reg_val_h);
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_HB_L, &reg_val);
> -	if (ret)
> -		return ret;
> -
> -#if 0
> -	u16 dummy = (reg_val_h << 8) | reg_val;
> -#endif
> -
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_SH_DELAY_H, &reg_val_h);
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_SH_DELAY_L, &reg_val);
> -
> -#if 0
> -	buf->line_length_pck = buf->output_width + 16 + dummy +
> -			       (((u16)reg_val_h << 8) | (u16)reg_val) + 4;
> -#endif
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_VB_H, &reg_val_h);
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_VB_L, &reg_val);
> -	if (ret)
> -		return ret;
> -
> -#if 0
> -	buf->frame_length_lines = buf->output_height + 32 +
> -				  (((u16)reg_val_h << 8) | (u16)reg_val);
> -#endif
> -	buf->binning_factor_x = res->bin_factor_x ?
> -				res->bin_factor_x : 1;
> -	buf->binning_factor_y = res->bin_factor_y ?
> -				res->bin_factor_y : 1;
> -	return 0;
> -}
> -
>  static long __gc2235_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
>  				  int gain, int digitgain)
>  
> @@ -680,11 +572,6 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
>  		goto err;
>  	}
>  
> -	ret = gc2235_get_intg_factor(client, gc2235_info,
> -				     dev->res);
> -	if (ret)
> -		dev_err(&client->dev, "failed to get integration_factor\n");
> -
>  err:
>  	mutex_unlock(&dev->input_lock);
>  	return ret;
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index eb34b5cadb33..1df38f5fe1f4 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -612,96 +612,6 @@ static int mt9m114_res2size(struct v4l2_subdev *sd, int *h_size, int *v_size)
>  	return 0;
>  }
>  
> -static int mt9m114_get_intg_factor(struct i2c_client *client,
> -				   struct camera_mipi_info *info,
> -				   const struct mt9m114_res_struct *res)
> -{
> -	struct atomisp_sensor_mode_data *buf;
> -	u32 reg_val;
> -	int ret;
> -
> -	if (!info)
> -		return -EINVAL;
> -
> -	buf = &info->data;
> -
> -	ret =  mt9m114_read_reg(client, MISENSOR_32BIT,
> -				REG_PIXEL_CLK, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->vt_pix_clk_freq_mhz = reg_val;
> -
> -	/* get integration time */
> -	buf->coarse_integration_time_min = MT9M114_COARSE_INTG_TIME_MIN;
> -	buf->coarse_integration_time_max_margin =
> -	    MT9M114_COARSE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_min = MT9M114_FINE_INTG_TIME_MIN;
> -	buf->fine_integration_time_max_margin =
> -	    MT9M114_FINE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_def = MT9M114_FINE_INTG_TIME_MIN;
> -
> -	buf->frame_length_lines = res->lines_per_frame;
> -	buf->line_length_pck = res->pixels_per_line;
> -	buf->read_mode = res->bin_mode;
> -
> -	/* get the cropping and output resolution to ISP for this mode. */
> -	ret =  mt9m114_read_reg(client, MISENSOR_16BIT,
> -				REG_H_START, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_horizontal_start = reg_val;
> -
> -	ret =  mt9m114_read_reg(client, MISENSOR_16BIT,
> -				REG_V_START, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_vertical_start = reg_val;
> -
> -	ret = mt9m114_read_reg(client, MISENSOR_16BIT,
> -			       REG_H_END, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_horizontal_end = reg_val;
> -
> -	ret = mt9m114_read_reg(client, MISENSOR_16BIT,
> -			       REG_V_END, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_vertical_end = reg_val;
> -
> -	ret = mt9m114_read_reg(client, MISENSOR_16BIT,
> -			       REG_WIDTH, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_width = reg_val;
> -
> -	ret = mt9m114_read_reg(client, MISENSOR_16BIT,
> -			       REG_HEIGHT, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_height = reg_val;
> -
> -	ret = mt9m114_read_reg(client, MISENSOR_16BIT,
> -			       REG_TIMING_HTS, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->line_length_pck = reg_val;
> -
> -	ret = mt9m114_read_reg(client, MISENSOR_16BIT,
> -			       REG_TIMING_VTS, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->frame_length_lines = reg_val;
> -
> -	buf->binning_factor_x = res->bin_factor_x ?
> -				res->bin_factor_x : 1;
> -	buf->binning_factor_y = res->bin_factor_y ?
> -				res->bin_factor_y : 1;
> -	return 0;
> -}
> -
>  static int mt9m114_get_fmt(struct v4l2_subdev *sd,
>  			   struct v4l2_subdev_state *sd_state,
>  			   struct v4l2_subdev_format *format)
> @@ -823,12 +733,6 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
>  			mt9m114_res[index].used = false;
>  		}
>  	}
> -	ret = mt9m114_get_intg_factor(c, mt9m114_info,
> -				      &mt9m114_res[res->res]);
> -	if (ret) {
> -		dev_err(&c->dev, "failed to get integration_factor\n");
> -		return -EINVAL;
> -	}
>  	/*
>  	 * mt9m114 - we don't poll for context switch
>  	 * because it does not happen with streaming disabled.
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 39f86c7fd12e..9379c25205b4 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -140,82 +140,6 @@ static int ov2680_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
>  	return 0;
>  }
>  
> -static int ov2680_get_intg_factor(struct i2c_client *client,
> -				  struct camera_mipi_info *info,
> -				  const struct ov2680_resolution *res)
> -{
> -	struct atomisp_sensor_mode_data *buf = &info->data;
> -	unsigned int pix_clk_freq_hz;
> -	u32 reg_val;
> -	int ret;
> -
> -	dev_dbg(&client->dev,  "++++ov2680_get_intg_factor\n");
> -	if (!info)
> -		return -EINVAL;
> -
> -	/* pixel clock */
> -	pix_clk_freq_hz = res->pix_clk_freq * 1000000;
> -
> -	buf->vt_pix_clk_freq_mhz = pix_clk_freq_hz;
> -
> -	/* get integration time */
> -	buf->coarse_integration_time_min = OV2680_COARSE_INTG_TIME_MIN;
> -	buf->coarse_integration_time_max_margin =
> -	    OV2680_COARSE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_min = OV2680_FINE_INTG_TIME_MIN;
> -	buf->fine_integration_time_max_margin =
> -	    OV2680_FINE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_def = OV2680_FINE_INTG_TIME_MIN;
> -	buf->frame_length_lines = res->lines_per_frame;
> -	buf->line_length_pck = res->pixels_per_line;
> -	buf->read_mode = res->bin_mode;
> -
> -	/* get the cropping and output resolution to ISP for this mode. */
> -	ret =  ov2680_read_reg(client, 2,
> -			       OV2680_HORIZONTAL_START_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_horizontal_start = reg_val;
> -
> -	ret =  ov2680_read_reg(client, 2,
> -			       OV2680_VERTICAL_START_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_vertical_start = reg_val;
> -
> -	ret = ov2680_read_reg(client, 2,
> -			      OV2680_HORIZONTAL_END_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_horizontal_end = reg_val;
> -
> -	ret = ov2680_read_reg(client, 2,
> -			      OV2680_VERTICAL_END_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_vertical_end = reg_val;
> -
> -	ret = ov2680_read_reg(client, 2,
> -			      OV2680_HORIZONTAL_OUTPUT_SIZE_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_width = reg_val;
> -
> -	ret = ov2680_read_reg(client, 2,
> -			      OV2680_VERTICAL_OUTPUT_SIZE_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_height = reg_val;
> -
> -	buf->binning_factor_x = res->bin_factor_x ?
> -				(res->bin_factor_x * 2) : 1;
> -	buf->binning_factor_y = res->bin_factor_y ?
> -				(res->bin_factor_y * 2) : 1;
> -	return 0;
> -}
> -
>  static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
>  				  int gain, int digitgain)
>  
> @@ -818,12 +742,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  		goto err;
>  	}
>  
> -	ret = ov2680_get_intg_factor(client, ov2680_info, res);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to get integration factor\n");
> -		goto err;
> -	}
> -
>  	/*
>  	 * recall flip functions to avoid flip registers
>  	 * were overridden by default setting
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index 47eefaccbe0b..d819ab5de28a 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -261,113 +261,6 @@ static int ov2722_write_reg_array(struct i2c_client *client,
>  	return __ov2722_flush_reg_array(client, &ctrl);
>  }
>  
> -static int ov2722_get_intg_factor(struct i2c_client *client,
> -				  struct camera_mipi_info *info,
> -				  const struct ov2722_resolution *res)
> -{
> -	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> -	struct ov2722_device *dev = NULL;
> -	struct atomisp_sensor_mode_data *buf = &info->data;
> -	const unsigned int ext_clk_freq_hz = 19200000;
> -	const unsigned int pll_invariant_div = 10;
> -	unsigned int pix_clk_freq_hz;
> -	u16 pre_pll_clk_div;
> -	u16 pll_multiplier;
> -	u16 op_pix_clk_div;
> -	u16 reg_val;
> -	int ret;
> -
> -	if (!info)
> -		return -EINVAL;
> -
> -	dev = to_ov2722_sensor(sd);
> -
> -	/* pixel clock calculattion */
> -	ret =  ov2722_read_reg(client, OV2722_8BIT,
> -			       OV2722_SC_CMMN_PLL_CTRL3, &pre_pll_clk_div);
> -	if (ret)
> -		return ret;
> -
> -	ret =  ov2722_read_reg(client, OV2722_8BIT,
> -			       OV2722_SC_CMMN_PLL_MULTIPLIER, &pll_multiplier);
> -	if (ret)
> -		return ret;
> -
> -	ret =  ov2722_read_reg(client, OV2722_8BIT,
> -			       OV2722_SC_CMMN_PLL_DEBUG_OPT, &op_pix_clk_div);
> -	if (ret)
> -		return ret;
> -
> -	pre_pll_clk_div = (pre_pll_clk_div & 0x70) >> 4;
> -	if (!pre_pll_clk_div)
> -		return -EINVAL;
> -
> -	pll_multiplier = pll_multiplier & 0x7f;
> -	op_pix_clk_div = op_pix_clk_div & 0x03;
> -	pix_clk_freq_hz = ext_clk_freq_hz / pre_pll_clk_div * pll_multiplier
> -			  * op_pix_clk_div / pll_invariant_div;
> -
> -	dev->vt_pix_clk_freq_mhz = pix_clk_freq_hz;
> -	buf->vt_pix_clk_freq_mhz = pix_clk_freq_hz;
> -
> -	/* get integration time */
> -	buf->coarse_integration_time_min = OV2722_COARSE_INTG_TIME_MIN;
> -	buf->coarse_integration_time_max_margin =
> -	    OV2722_COARSE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_min = OV2722_FINE_INTG_TIME_MIN;
> -	buf->fine_integration_time_max_margin =
> -	    OV2722_FINE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_def = OV2722_FINE_INTG_TIME_MIN;
> -	buf->frame_length_lines = res->lines_per_frame;
> -	buf->line_length_pck = res->pixels_per_line;
> -	buf->read_mode = res->bin_mode;
> -
> -	/* get the cropping and output resolution to ISP for this mode. */
> -	ret =  ov2722_read_reg(client, OV2722_16BIT,
> -			       OV2722_H_CROP_START_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_horizontal_start = reg_val;
> -
> -	ret =  ov2722_read_reg(client, OV2722_16BIT,
> -			       OV2722_V_CROP_START_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_vertical_start = reg_val;
> -
> -	ret = ov2722_read_reg(client, OV2722_16BIT,
> -			      OV2722_H_CROP_END_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_horizontal_end = reg_val;
> -
> -	ret = ov2722_read_reg(client, OV2722_16BIT,
> -			      OV2722_V_CROP_END_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_vertical_end = reg_val;
> -
> -	ret = ov2722_read_reg(client, OV2722_16BIT,
> -			      OV2722_H_OUTSIZE_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_width = reg_val;
> -
> -	ret = ov2722_read_reg(client, OV2722_16BIT,
> -			      OV2722_V_OUTSIZE_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_height = reg_val;
> -
> -	buf->binning_factor_x = res->bin_factor_x ?
> -				res->bin_factor_x : 1;
> -	buf->binning_factor_y = res->bin_factor_y ?
> -				res->bin_factor_y : 1;
> -	return 0;
> -}
> -
>  static long __ov2722_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
>  				  int gain, int digitgain)
>  
> @@ -812,10 +705,6 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
>  		}
>  	}
>  
> -	ret = ov2722_get_intg_factor(client, ov2722_info, dev->res);
> -	if (ret)
> -		dev_err(&client->dev, "failed to get integration_factor\n");
> -
>  err:
>  	mutex_unlock(&dev->input_lock);
>  	return ret;
> diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
> index 52b4c07e5cf0..2a559b0d474d 100644
> --- a/drivers/staging/media/atomisp/i2c/gc0310.h
> +++ b/drivers/staging/media/atomisp/i2c/gc0310.h
> @@ -146,7 +146,6 @@ struct gc0310_device {
>  	struct v4l2_ctrl_handler ctrl_handler;
>  
>  	struct camera_sensor_platform_data *platform_data;
> -	int vt_pix_clk_freq_mhz;
>  	struct gc0310_resolution *res;
>  	u8 type;
>  	bool power_on;
> diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
> index dd2d44b40e22..8e33eb166bed 100644
> --- a/drivers/staging/media/atomisp/i2c/gc2235.h
> +++ b/drivers/staging/media/atomisp/i2c/gc2235.h
> @@ -158,7 +158,6 @@ struct gc2235_device {
>  	struct gc2235_resolution *res;
>  
>  	struct camera_sensor_platform_data *platform_data;
> -	int vt_pix_clk_freq_mhz;
>  	u8 type;
>  };
>  
> diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
> index d4cd6f27ee8d..5802cdb0e90c 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2722.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2722.h
> @@ -201,7 +201,6 @@ struct ov2722_device {
>  	struct ov2722_resolution *res;
>  
>  	struct camera_sensor_platform_data *platform_data;
> -	int vt_pix_clk_freq_mhz;
>  	int run_mode;
>  	u16 pixels_per_line;
>  	u16 lines_per_frame;
> diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> index 9adaf2fc940a..e65759499d81 100644
> --- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> +++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> @@ -433,84 +433,6 @@ static int ov5693_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
>  	return 0;
>  }
>  
> -static int ov5693_get_intg_factor(struct i2c_client *client,
> -				  struct camera_mipi_info *info,
> -				  const struct ov5693_resolution *res)
> -{
> -	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> -	struct ov5693_device *dev = to_ov5693_sensor(sd);
> -	struct atomisp_sensor_mode_data *buf = &info->data;
> -	unsigned int pix_clk_freq_hz;
> -	u16 reg_val;
> -	int ret;
> -
> -	if (!info)
> -		return -EINVAL;
> -
> -	/* pixel clock */
> -	pix_clk_freq_hz = res->pix_clk_freq * 1000000;
> -
> -	dev->vt_pix_clk_freq_mhz = pix_clk_freq_hz;
> -	buf->vt_pix_clk_freq_mhz = pix_clk_freq_hz;
> -
> -	/* get integration time */
> -	buf->coarse_integration_time_min = OV5693_COARSE_INTG_TIME_MIN;
> -	buf->coarse_integration_time_max_margin =
> -	    OV5693_COARSE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_min = OV5693_FINE_INTG_TIME_MIN;
> -	buf->fine_integration_time_max_margin =
> -	    OV5693_FINE_INTG_TIME_MAX_MARGIN;
> -
> -	buf->fine_integration_time_def = OV5693_FINE_INTG_TIME_MIN;
> -	buf->frame_length_lines = res->lines_per_frame;
> -	buf->line_length_pck = res->pixels_per_line;
> -	buf->read_mode = res->bin_mode;
> -
> -	/* get the cropping and output resolution to ISP for this mode. */
> -	ret =  ov5693_read_reg(client, OV5693_16BIT,
> -			       OV5693_HORIZONTAL_START_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_horizontal_start = reg_val;
> -
> -	ret =  ov5693_read_reg(client, OV5693_16BIT,
> -			       OV5693_VERTICAL_START_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_vertical_start = reg_val;
> -
> -	ret = ov5693_read_reg(client, OV5693_16BIT,
> -			      OV5693_HORIZONTAL_END_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_horizontal_end = reg_val;
> -
> -	ret = ov5693_read_reg(client, OV5693_16BIT,
> -			      OV5693_VERTICAL_END_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->crop_vertical_end = reg_val;
> -
> -	ret = ov5693_read_reg(client, OV5693_16BIT,
> -			      OV5693_HORIZONTAL_OUTPUT_SIZE_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_width = reg_val;
> -
> -	ret = ov5693_read_reg(client, OV5693_16BIT,
> -			      OV5693_VERTICAL_OUTPUT_SIZE_H, &reg_val);
> -	if (ret)
> -		return ret;
> -	buf->output_height = reg_val;
> -
> -	buf->binning_factor_x = res->bin_factor_x ?
> -				res->bin_factor_x : 1;
> -	buf->binning_factor_y = res->bin_factor_y ?
> -				res->bin_factor_y : 1;
> -	return 0;
> -}
> -
>  static long __ov5693_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
>  				  int gain, int digitgain)
>  
> @@ -1596,18 +1518,10 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
>  	if (ret)
>  		dev_warn(&client->dev, "ov5693 stream off err\n");
>  
> -	ret = ov5693_get_intg_factor(client, ov5693_info,
> -				     &ov5693_res[dev->fmt_idx]);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to get integration_factor\n");
> -		goto err;
> -	}
> -
>  	ov5693_info->metadata_width = fmt->width * 10 / 8;
>  	ov5693_info->metadata_height = 1;
>  	ov5693_info->metadata_effective_width = &ov5693_embedded_effective_size;
>  
> -err:
>  	mutex_unlock(&dev->input_lock);
>  	return ret;
>  }
> diff --git a/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h b/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
> index a1366666f49c..c9b9dc780f96 100644
> --- a/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
> +++ b/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
> @@ -228,7 +228,6 @@ struct ov5693_device {
>  
>  	struct camera_sensor_platform_data *platform_data;
>  	ktime_t timestamp_t_focus_abs;
> -	int vt_pix_clk_freq_mhz;
>  	int fmt_idx;
>  	int run_mode;
>  	int otp_size;
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
> index e70e57695300..d6da776e9bf4 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
> @@ -636,28 +636,6 @@ struct atomisp_overlay {
>  	unsigned int overlay_start_y;
>  };
>  
> -/* Sensor resolution specific data for AE calculation.*/
> -struct atomisp_sensor_mode_data {
> -	unsigned int coarse_integration_time_min;
> -	unsigned int coarse_integration_time_max_margin;
> -	unsigned int fine_integration_time_min;
> -	unsigned int fine_integration_time_max_margin;
> -	unsigned int fine_integration_time_def;
> -	unsigned int frame_length_lines;
> -	unsigned int line_length_pck;
> -	unsigned int read_mode;
> -	unsigned int vt_pix_clk_freq_mhz;
> -	unsigned int crop_horizontal_start; /* Sensor crop start cord. (x0,y0)*/
> -	unsigned int crop_vertical_start;
> -	unsigned int crop_horizontal_end; /* Sensor crop end cord. (x1,y1)*/
> -	unsigned int crop_vertical_end;
> -	unsigned int output_width; /* input size to ISP after binning/scaling */
> -	unsigned int output_height;
> -	u8 binning_factor_x; /* horizontal binning factor used */
> -	u8 binning_factor_y; /* vertical binning factor used */
> -	u16 hts;
> -};
> -
>  struct atomisp_exposure {
>  	unsigned int integration_time[8];
>  	unsigned int shutter_speed[8];
> @@ -945,10 +923,6 @@ struct atomisp_sensor_ae_bracketing_lut {
>  #define ATOMISP_IOC_CAMERA_BRIDGE \
>  	_IOWR('v', BASE_VIDIOC_PRIVATE + 19, struct atomisp_bc_video_package)
>  
> -/* Sensor resolution specific info for AE */
> -#define ATOMISP_IOC_G_SENSOR_MODE_DATA \
> -	_IOR('v', BASE_VIDIOC_PRIVATE + 20, struct atomisp_sensor_mode_data)
> -
>  #define ATOMISP_IOC_S_EXPOSURE \
>  	_IOW('v', BASE_VIDIOC_PRIVATE + 21, struct atomisp_exposure)
>  
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> index 0253661d4332..559a497975c5 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> @@ -210,7 +210,6 @@ struct camera_mipi_info {
>  	unsigned int                    num_lanes;
>  	enum atomisp_input_format       input_format;
>  	enum atomisp_bayer_order        raw_bayer_order;
> -	struct atomisp_sensor_mode_data data;
>  	enum atomisp_input_format       metadata_format;
>  	u32                             metadata_width;
>  	u32                             metadata_height;
> diff --git a/drivers/staging/media/atomisp/notes.txt b/drivers/staging/media/atomisp/notes.txt
> index d3cf6ed547ae..c04c283ff438 100644
> --- a/drivers/staging/media/atomisp/notes.txt
> +++ b/drivers/staging/media/atomisp/notes.txt
> @@ -36,12 +36,6 @@ a camera_mipi_info struct. This struct is allocated/managed by
>  the core atomisp code. The most important parts of the struct
>  are filled by the atomisp core itself, like e.g. the port number.
>  
> -The sensor drivers on a set_fmt call do fill in camera_mipi_info.data
> -which is a atomisp_sensor_mode_data struct. This gets filled from
> -a function called <sensor_name>_get_intg_factor(). This struct is not
> -used by the atomisp code at all. It is returned to userspace by
> -a ATOMISP_IOC_G_SENSOR_MODE_DATA and the Android userspace does use this.
> -
>  Other members of camera_mipi_info which are set by some drivers are:
>  -metadata_width, metadata_height, metadata_effective_width, set by
>   the ov5693 driver (and used by the atomisp core)
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index b167ee32a952..01c9845b9f28 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -4211,25 +4211,6 @@ int atomisp_digital_zoom(struct atomisp_sub_device *asd, int flag,
>  	return 0;
>  }
>  
> -/*
> - * Function to get sensor specific info for current resolution,
> - * which will be used for auto exposure conversion.
> - */
> -int atomisp_get_sensor_mode_data(struct atomisp_sub_device *asd,
> -				 struct atomisp_sensor_mode_data *config)
> -{
> -	struct camera_mipi_info *mipi_info;
> -	struct atomisp_device *isp = asd->isp;
> -
> -	mipi_info = atomisp_to_sensor_mipi_info(
> -			isp->inputs[asd->input_curr].camera);
> -	if (!mipi_info)
> -		return -EINVAL;
> -
> -	memcpy(config, &mipi_info->data, sizeof(*config));
> -	return 0;
> -}
> -
>  static void __atomisp_update_stream_env(struct atomisp_sub_device *asd,
>  					u16 stream_index, struct atomisp_input_stream_info *stream_info)
>  {
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> index 99bbab402c9c..a10577df10cb 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> @@ -258,9 +258,6 @@ int atomisp_makeup_css_parameters(struct atomisp_sub_device *asd,
>  int atomisp_compare_grid(struct atomisp_sub_device *asd,
>  			 struct atomisp_grid_info *atomgrid);
>  
> -int atomisp_get_sensor_mode_data(struct atomisp_sub_device *asd,
> -				 struct atomisp_sensor_mode_data *config);
> -
>  /* This function looks up the closest available resolution. */
>  int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
>  		    bool *res_overflow);
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index faf65387df56..d202b2b9ae18 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -2273,10 +2273,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
>  		err = atomisp_fixed_pattern_table(asd, arg);
>  		break;
>  
> -	case ATOMISP_IOC_G_SENSOR_MODE_DATA:
> -		err = atomisp_get_sensor_mode_data(asd, arg);
> -		break;
> -
>  	case ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA:
>  		if (motor)
>  			err = v4l2_subdev_call(motor, core, ioctl, cmd, arg);
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


