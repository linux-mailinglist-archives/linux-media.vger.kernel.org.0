Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05ED441CE9
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 15:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhKAO4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 10:56:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:61489 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232066AbhKAO4v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 10:56:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="230883041"
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="230883041"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 07:54:17 -0700
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="488679982"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 07:54:14 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id DCF872015E;
        Mon,  1 Nov 2021 16:54:12 +0200 (EET)
Date:   Mon, 1 Nov 2021 16:54:12 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 07/16] media: i2c: Add vblank control to ov8865
Message-ID: <YX//lBBlskOv+37i@paasikivi.fi.intel.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-8-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101001119.46056-8-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Nov 01, 2021 at 12:11:10AM +0000, Daniel Scally wrote:
> Add a V4L2_CID_VBLANK control to the ov8865 driver.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov8865.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index a832938c33b6..f741c0713ca4 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -183,6 +183,8 @@
>  #define OV8865_VTS_H(v)				(((v) & GENMASK(11, 8)) >> 8)
>  #define OV8865_VTS_L_REG			0x380f
>  #define OV8865_VTS_L(v)				((v) & GENMASK(7, 0))
> +#define OV8865_TIMING_MAX_VTS			0xffff
> +#define OV8865_TIMING_MIN_VTS			0x04
>  #define OV8865_OFFSET_X_H_REG			0x3810
>  #define OV8865_OFFSET_X_H(v)			(((v) & GENMASK(15, 8)) >> 8)
>  #define OV8865_OFFSET_X_L_REG			0x3811
> @@ -675,6 +677,7 @@ struct ov8865_state {
>  struct ov8865_ctrls {
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *vblank;
>  
>  	struct v4l2_ctrl_handler handler;
>  };
> @@ -2225,6 +2228,20 @@ static int ov8865_test_pattern_configure(struct ov8865_sensor *sensor,
>  			    ov8865_test_pattern_bits[index]);
>  }
>  
> +/* Blanking */
> +
> +static int ov8865_vts_configure(struct ov8865_sensor *sensor, u32 vblank)
> +{
> +	u16 vts = sensor->state.mode->output_size_y + vblank;
> +	int ret;
> +
> +	ret = ov8865_write(sensor, OV8865_VTS_H_REG, OV8865_VTS_H(vts));
> +	if (ret)
> +		return ret;
> +
> +	return ov8865_write(sensor, OV8865_VTS_L_REG, OV8865_VTS_L(vts));
> +}
> +
>  /* State */
>  
>  static int ov8865_state_mipi_configure(struct ov8865_sensor *sensor,
> @@ -2476,6 +2493,8 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_TEST_PATTERN:
>  		index = (unsigned int)ctrl->val;
>  		return ov8865_test_pattern_configure(sensor, index);
> +	case V4L2_CID_VBLANK:
> +		return ov8865_vts_configure(sensor, ctrl->val);
>  	default:
>  		return -EINVAL;
>  	}
> @@ -2492,6 +2511,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>  	struct ov8865_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *handler = &ctrls->handler;
>  	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
> +	const struct ov8865_mode *mode = sensor->state.mode;
> +	unsigned int vblank_max, vblank_def;
>  	int ret;
>  
>  	v4l2_ctrl_handler_init(handler, 32);
> @@ -2528,6 +2549,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>  				     ARRAY_SIZE(ov8865_test_pattern_menu) - 1,
>  				     0, 0, ov8865_test_pattern_menu);
>  
> +	/* Blanking */
> +	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
> +	vblank_def = mode->vts - mode->output_size_y;
> +	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,
> +					  OV8865_TIMING_MIN_VTS, vblank_max, 1,
> +					  vblank_def);
> +
>  	/* MIPI CSI-2 */
>  
>  	ctrls->link_freq =
> @@ -2708,6 +2736,10 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
>  		 sensor->state.mbus_code != mbus_code)
>  		ret = ov8865_state_configure(sensor, mode, mbus_code);
>  
> +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV8865_TIMING_MIN_VTS,
> +				 OV8865_TIMING_MAX_VTS - mode->output_size_y,
> +				 1, mode->vts - mode->output_size_y);
> +
>  complete:
>  	mutex_unlock(&sensor->mutex);
>  
> @@ -3035,6 +3067,8 @@ static int ov8865_probe(struct i2c_client *client)
>  
>  	/* Sensor */
>  
> +	sensor->state.mode =  &ov8865_modes[0];

This seems to be an unrelated change. Does it belong here?

> +
>  	ret = ov8865_ctrls_init(sensor);
>  	if (ret)
>  		goto error_mutex;

-- 
Regards,

Sakari Ailus
