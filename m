Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9116A3E5DEA
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 16:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236686AbhHJOay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 10:30:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:12616 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229663AbhHJOav (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 10:30:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="202094871"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="202094871"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 07:30:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="638816888"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 07:30:26 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 4E23B20364;
        Tue, 10 Aug 2021 17:30:24 +0300 (EEST)
Date:   Tue, 10 Aug 2021 17:30:24 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 09/12] media: i2c: cap exposure at height + vblank in
 ov8865
Message-ID: <20210810143024.GF3@paasikivi.fi.intel.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-10-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809225845.916430-10-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Aug 09, 2021 at 11:58:42PM +0100, Daniel Scally wrote:
> Exposure limits depend on the total height; when vblank is altered (and
> thus the total height is altered), change the exposure limits to reflect
> the new cap.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v2:
> 
> 	- None
> 
>  drivers/media/i2c/ov8865.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index db84294b7a03..70747552e32a 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -675,6 +675,7 @@ struct ov8865_ctrls {
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *exposure;
>  
>  	struct v4l2_ctrl_handler handler;
>  };
> @@ -2461,6 +2462,18 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
>  	unsigned int index;
>  	int ret;
>  
> +	/* If VBLANK is altered we need to update exposure to compensate */
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		int exposure_max;
> +
> +		exposure_max = sensor->state.mode->output_size_y + ctrl->val;
> +		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +					 sensor->ctrls.exposure->minimum,
> +					 exposure_max,
> +					 sensor->ctrls.exposure->step,
> +					 min(sensor->ctrls.exposure->val, exposure_max));
> +	}
> +
>  	/* Wait for the sensor to be on before setting controls. */
>  	if (pm_runtime_suspended(sensor->dev))
>  		return 0;
> @@ -2517,8 +2530,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>  
>  	/* Exposure */
>  
> -	v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16, 1048575, 16,
> -			  512);
> +	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
> +					    1048575, 16, 512);
>  
>  	/* Gain */
>  
> @@ -2699,6 +2712,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
>  	u32 mbus_code = 0;
>  	unsigned int hblank;
>  	unsigned int index;
> +	int exposure_max;
>  	int ret = 0;
>  
>  	mutex_lock(&sensor->mutex);
> @@ -2746,6 +2760,12 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
>  	__v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank, 1,
>  				 hblank);
>  
> +	exposure_max = mode->vts;
> +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +				 sensor->ctrls.exposure->minimum, exposure_max,
> +				 sensor->ctrls.exposure->step,
> +				 min(sensor->ctrls.exposure->val, exposure_max));

Please wrap lines over 80 (unless there's a sound reason not to).

> +
>  complete:
>  	mutex_unlock(&sensor->mutex);
>  

-- 
Sakari Ailus
