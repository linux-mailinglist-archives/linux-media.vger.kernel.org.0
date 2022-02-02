Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51D3A4A7A8C
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 22:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347658AbiBBVf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 16:35:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235880AbiBBVf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 16:35:56 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C3A7D88;
        Wed,  2 Feb 2022 22:35:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643837754;
        bh=tyoAC0kF55EgEW02omiC/CrYfRP3l2w/WOe9BLF9GtY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YDov88FcyvqJEkeHNA8CSh0GruEr41FlFndN43kWz8UnDUqanpIMjePWRg9TP/uHz
         eVB4c3dOPi74eww0DO1q5dtimyopDASWo7V3NnKc0GbSrFlDGfjJTiwgRo/6QkoF6U
         c5DGIn2uKepISq0csIH1qfhiREHOOca6Z3hFZm7w=
Date:   Wed, 2 Feb 2022 23:35:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 11/21] media: ov5640: Add VBLANK control
Message-ID: <Yfr5I16pxs84Vcx2@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-12-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131143245.128089-12-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:32:35PM +0100, Jacopo Mondi wrote:
> Add the VBLANK control which allows to select the duration of the
> frame vertical blankings and allows to control the framerate.
> 
> The VBLANK control also modifies the exposure time range, which cannot
> exceed the maximum frame length.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 50 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index b2961e8e07c3..6eeb50724195 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -31,6 +31,10 @@
>  
>  #define OV5640_LINK_RATE_MAX	490000000U
>  
> +/* FIXME: not documented. */
> +#define OV5640_MIN_VBLANK	24
> +#define OV5640_MAX_VTS		1968
> +
>  #define OV5640_DEFAULT_SLAVE_ID 0x3c
>  
>  #define OV5640_REG_SYS_RESET02		0x3002
> @@ -267,6 +271,7 @@ struct ov5640_ctrls {
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vblank;
>  	struct {
>  		struct v4l2_ctrl *auto_exp;
>  		struct v4l2_ctrl *exposure;
> @@ -2531,6 +2536,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>  	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
>  	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
>  	u32 num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
> +	s64 exposure_val, exposure_max;
>  	unsigned int hblank;
>  	unsigned int i = 0;
>  	u32 pixel_rate;
> @@ -2586,6 +2592,20 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>  	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
>  				 hblank, hblank, 1, hblank);
>  
> +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> +				 OV5640_MIN_VBLANK,
> +				 OV5640_MAX_VTS - mode->crop.height, 1,
> +				 mode->vblank_def);
> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, mode->vblank_def);
> +
> +	exposure_max = mode->crop.height + mode->vblank_def - OV5640_MIN_VBLANK;

There's typically a fixed margin of a few lines between the maximum
exposure and the total vertical size, but that's usually smaller than
the minimum vblank value. Are you sure OV5640_MIN_VBLANK is right here ?

> +	exposure_val = clamp((s64)sensor->ctrls.exposure->val,
> +			     (s64)sensor->ctrls.exposure->minimum,
> +			     (s64)exposure_max);
> +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +				 sensor->ctrls.exposure->minimum,
> +				 exposure_max, 1, exposure_val);
> +
>  	return 0;
>  }
>  
> @@ -2958,6 +2978,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
>  			      (BIT(2) | BIT(1)) : 0);
>  }
>  
> +static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
> +{
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
> +
> +	/* Update the VTOT timing register value. */
> +	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
> +				  mode->crop.height + value);
> +}
> +
>  static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> @@ -2988,10 +3017,22 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
>  	int ret;
>  
>  	/* v4l2_ctrl_lock() locks our own mutex */
>  
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		/* Update the exposure range to the newly programmed vblank. */
> +		unsigned int max = mode->crop.height + ctrl->val - OV5640_MIN_VBLANK;
> +
> +		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +					 sensor->ctrls.exposure->minimum,
> +					 max, sensor->ctrls.exposure->step, max);

Should the default be set to mode->vblank_def ?

> +		break;
> +	}
> +
>  	/*
>  	 * If the device is not powered up by the host driver do
>  	 * not apply any controls to H/W at this time. Instead
> @@ -3031,6 +3072,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_VFLIP:
>  		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
>  		break;
> +	case V4L2_CID_VBLANK:
> +		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -3050,6 +3094,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
>  	struct ov5640_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> +	unsigned int max_vblank;
>  	unsigned int hblank;
>  	int ret;
>  
> @@ -3073,6 +3118,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
>  					  hblank, 1, hblank);
>  
> +	max_vblank = OV5640_MAX_VTS - mode->crop.height;
> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> +					  OV5640_MIN_VBLANK, max_vblank,
> +					  1, mode->vblank_def);
> +
>  	/* Auto/manual white balance */
>  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>  					   V4L2_CID_AUTO_WHITE_BALANCE,

-- 
Regards,

Laurent Pinchart
