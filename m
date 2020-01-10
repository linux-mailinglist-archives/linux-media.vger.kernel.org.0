Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F263136E2C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 14:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgAJNhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 08:37:46 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:51811 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727715AbgAJNhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 08:37:46 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id puTqinEsIpLtbpuTuiQpZ7; Fri, 10 Jan 2020 14:37:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578663462; bh=IUVa07B55oqAhGNlJcd89meb1lAdb4ccyYb1HPNlY+c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WPyoBqmcBXXdf1ZN5DdbI8D7JeHz75AhpHbgxY4eFYzwRdMAPTSjbEEFF7A9W5OMM
         xnxUU7BIV7P+NCzHr01rrFst3woPVwFaqqKzZJ78FFquuGiAB5t5eXeFqdoxf7ZcBy
         IiV1/rjSCMBu82/duQFni/xfk87Gwd1hqlEy5JniYIKGNzMgy3ng75X3leBdtwVSDV
         ZVY7r2rdxOshosKiCAJA+xNShsrLKQZBUkkYojJRWGJXxDrhZ8chQIWDFhqL6HQR02
         gxiIO2KVS94X619jUImHJ/cKweVXQcXRZ/xYWYuZ+DQrvWjx4f/sR1dre3M9M+1sIr
         /yPn3wTrSsz/A==
Subject: Re: [PATCH v3 1/2] media: atmel: atmel-isc-base: expose white balance
 as v4l2 controls
To:     Eugen.Hristev@microchip.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1576229557-27001-1-git-send-email-eugen.hristev@microchip.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <39204b39-7537-7f0b-1c44-303690c40ad7@xs4all.nl>
Date:   Fri, 10 Jan 2020 14:37:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576229557-27001-1-git-send-email-eugen.hristev@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD3axOI2kKsDVr6FomWqkQvHa2VVUdKSAgHV/3gCOmT7BFyF/WIOZE5L9SMLihwz/JyS5D8ZedSG667xEsaqtqRgsfgsEC9Y8cJYhw2kgZ7Q1RTvtzKT
 gSKbXUtnZNLdpvosHs14JfMGqZUnAb7EAAbgJgsgip3pMbqkzzyNFg9hmfQVPDqH/uCkzVvsZJo0k0CFvaqUF7nr5J6JUKJIBFzyLJjtYPWiudv28uWW4BLl
 s9cqSZslAPVhda+BJVAmo0gVAHK+GzW+kcnEz4XB0sJAN6EQDML2rPekher5vFnxBy3jM4EULRKiX6sv72PP1b8DLeS5M+nMDjwUSRn1d5fmyBLQNUalpdup
 h0tftIn1sGn8RGYQHrgXudmmzVsU7VDBnQfbw4PIATZens2Ym3hYO9qnwOxbN2MI7dXeyaQT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/13/19 10:33 AM, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> This exposes the white balance configuration of the ISC as v4l2 controls
> into userspace.
> There are 8 controls available:
> 4 gain controls , sliders, for each of the BAYER components: R, B, GR, GB.
> These gains are multipliers for each component, in format unsigned 0:4:9 with
> a default value of 512 (1.0 multiplier).
> 4 offset controls, sliders, for each of the BAYER components: R, B, GR, GB.
> These offsets are added/substracted from each component, in format signed
> 1:12:0 with a default value of 0 (+/- 0)

This needs to be documented in include/linux/atmel-isc-media.h.

> 
> To expose this to userspace, added 8 custom controls, in an auto cluster.
> 
> To summarize the functionality:
> The auto cluster switch is the auto white balance control, and it works
> like this:
> AWB ==1 : autowhitebalance is on, the do_white_balance button is inactive,
> the gains/offsets are inactive, but volatile and readable.
> Thus, the results of the whitebalance algorithm are available to userspace to
> read at any time.
> AWB ==0: autowhitebalance is off, cluster is in manual mode, user can configure
> the gain/offsets directly. More than that, if the do_white_balance button is
> pressed, the driver will perform one-time-adjustment, (preferably with color
> checker card) and the userspace can read again the new values.

This would be useful to have in atmel-isc-media.h as well.

Remember that that header is what users see, they can't be expected to
dig through the kernel log just to find this information.

I also noticed that sometimes you talk about balance controls, and
sometimes about gain controls, that confusing.

I think that gain and offset controls together perform white balancing,
so referring to "balance controls" seems wrong to me.

Regards,

	Hans

> 
> With this feature, the userspace can save the coefficients and reinstall them
> for example after reboot or reprobing the driver.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v3:
> - Moved controls definition on separate header as done in imx driver
> - reserved range of user controls in v4l2-controls.h
> 
> Changes in v2:
> - Created some macros to make the code smaller, for declaring the bal/off
> controls, and to convert to 2's complements required values (0 to ZERO_VAL)
> 
> 
> Compliance test for atmel-isc device /devavideo0:tmel-isc f0008000.isc: =================  START STATUS  =================
> v4l2-ctrls: atmel-isc f0008000.isc: Brightness: 0
> v4l2-ctrls: atmel-isc f0008000.isc: Contrast: 256
> 
> v
>  Driver Info:
>         Driver name      : atmel-isc
>         Card type        : Atmel Image Sensor Controller
>         Bus info         : platform:atmel-isc f0008000.isc
>         Driver version   : 5.5.0
>         Capabilities     : 0x84200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 4l2-ctrls: atmel-isc f0008000.isc: Gamma: 2
> v4l2-ctrls: atmel-isc f0008000.isc: White Balance, Automatic: true
> v4l2-ctrls: atmel-isc f0008000.isc: Red Component Balance: 512 inactive volatile
> v4l2-ctrls: atmel-isc f0008000.isc: Blue Component Balance: 512 inactive volatile
> v4l2-ctrls: atmel-isc f0008000.isc: Green Red Component Balance: 512 inactive volatile
> v4l2-ctrls: atmel-isc f0008000.isc: Green Blue Component Balance: 512 inactive volatile
> v4l2-ctrls: atmel-isc f0008000.isc: Red Component Offset: 0 inactive volatile
> v4l2-ctrls: atmel-isc f0008000.isc: Blue Component Offset: 0 inactive volatile
> v4l2-ctrls: atmel-isc f0008000.isc: Green Red Component Offset: 0 inactive volatile
> v4l2-ctrls: atmel-isc f0008000.isc: Green Blue Component Offset: 0 inactive volatile
> atmel-isc f0008000.isc: ==================  END STATUS  ==================
>         test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 6 Private Controls: 8
> 
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for atmel-isc device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0
>  # v4l2-ctl -L
> 
> User Controls
> 
>                      brightness 0x00980900 (int)    : min=-1024 max=1023 step=1 default=0 value=0 flags=slider
>                        contrast 0x00980901 (int)    : min=-2048 max=2047 step=1 default=256 value=256 flags=slider
>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1 flags=update
>                do_white_balance 0x0098090d (button) : flags=inactive, write-only, volatile, execute-on-write
>                           gamma 0x00980910 (int)    : min=0 max=2 step=1 default=2 value=2 flags=slider
>           red_component_balance 0x009819c0 (int)    : min=0 max=8191 step=1 default=512 value=512 flags=inactive, slider, volatile
>          blue_component_balance 0x009819c1 (int)    : min=0 max=8191 step=1 default=512 value=512 flags=inactive, slider, volatile
>     green_red_component_balance 0x009819c2 (int)    : min=0 max=8191 step=1 default=512 value=512 flags=inactive, slider, volatile
>    green_blue_component_balance 0x009819c3 (int)    : min=0 max=8191 step=1 default=512 value=512 flags=inactive, slider, volatile
>            red_component_offset 0x009819c4 (int)    : min=-4095 max=4095 step=1 default=0 value=0 flags=inactive, slider, volatile
>           blue_component_offset 0x009819c5 (int)    : min=-4095 max=4095 step=1 default=0 value=0 flags=inactive, slider, volatile
>      green_red_component_offset 0x009819c6 (int)    : min=-4095 max=4095 step=1 default=0 value=0 flags=inactive, slider, volatile
>     green_blue_component_offset 0x009819c7 (int)    : min=-4095 max=4095 step=1 default=0 value=0 flags=inactive, slider, volatile
>  #
> 
> 
>  drivers/media/platform/atmel/atmel-isc-base.c | 222 ++++++++++++++++++++++----
>  drivers/media/platform/atmel/atmel-isc.h      |  23 ++-
>  include/linux/atmel-isc-media.h               |  30 ++++
>  include/uapi/linux/v4l2-controls.h            |   4 +
>  4 files changed, 251 insertions(+), 28 deletions(-)
>  create mode 100644 include/linux/atmel-isc-media.h
> 
> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> index c1c776b..814a425 100644
> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> @@ -22,6 +22,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/videodev2.h>
> +#include <linux/atmel-isc-media.h>
>  
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -211,10 +212,35 @@ const u32 isc_gamma_table[GAMMA_MAX + 1][GAMMA_ENTRIES] = {
>  #define ISC_IS_FORMAT_RAW(mbus_code) \
>  	(((mbus_code) & 0xf000) == 0x3000)
>  
> +#define ISC_CTRL_ISC_TO_V4L2(x) ((x) == ISC_WB_O_ZERO_VAL ? 0 : (x))
> +#define ISC_CTRL_V4L2_TO_ISC(x) ((x) ? (x) : ISC_WB_O_ZERO_VAL)
> +
> +static inline void isc_update_v4l2_ctrls(struct isc_device *isc)
> +{
> +	struct isc_ctrls *ctrls = &isc->ctrls;
> +
> +	/* In here we set the v4l2 controls w.r.t. our pipeline config */
> +	v4l2_ctrl_s_ctrl(isc->r_bal_ctrl, ctrls->gain[ISC_HIS_CFG_MODE_R]);
> +	v4l2_ctrl_s_ctrl(isc->b_bal_ctrl, ctrls->gain[ISC_HIS_CFG_MODE_B]);
> +	v4l2_ctrl_s_ctrl(isc->gr_bal_ctrl, ctrls->gain[ISC_HIS_CFG_MODE_GR]);
> +	v4l2_ctrl_s_ctrl(isc->gb_bal_ctrl, ctrls->gain[ISC_HIS_CFG_MODE_GB]);
> +
> +	v4l2_ctrl_s_ctrl(isc->r_off_ctrl,
> +			 ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_R]));
> +	v4l2_ctrl_s_ctrl(isc->b_off_ctrl,
> +			 ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_B]));
> +	v4l2_ctrl_s_ctrl(isc->gr_off_ctrl,
> +			 ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_GR]));
> +	v4l2_ctrl_s_ctrl(isc->gb_off_ctrl,
> +			 ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_GB]));
> +}
> +
>  static inline void isc_update_awb_ctrls(struct isc_device *isc)
>  {
>  	struct isc_ctrls *ctrls = &isc->ctrls;
>  
> +	/* In here we set our actual hw pipeline config */
> +
>  	regmap_write(isc->regmap, ISC_WB_O_RGR,
>  		     (ISC_WB_O_ZERO_VAL - (ctrls->offset[ISC_HIS_CFG_MODE_R])) |
>  		     ((ISC_WB_O_ZERO_VAL - ctrls->offset[ISC_HIS_CFG_MODE_GR]) << 16));
> @@ -649,11 +675,9 @@ static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
>  
>  	bay_cfg = isc->config.sd_format->cfa_baycfg;
>  
> -	if (ctrls->awb == ISC_WB_NONE)
> -		isc_reset_awb_ctrls(isc);
> -
>  	regmap_write(regmap, ISC_WB_CFG, bay_cfg);
>  	isc_update_awb_ctrls(isc);
> +	isc_update_v4l2_ctrls(isc);
>  
>  	regmap_write(regmap, ISC_CFA_CFG, bay_cfg | ISC_CFA_CFG_EITPOL);
>  
> @@ -1339,6 +1363,7 @@ static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
>  	    isc->try_config.sd_format != isc->config.sd_format) {
>  		isc->ctrls.hist_stat = HIST_INIT;
>  		isc_reset_awb_ctrls(isc);
> +		isc_update_v4l2_ctrls(isc);
>  	}
>  	/* make the try configuration active */
>  	isc->config = isc->try_config;
> @@ -1758,10 +1783,6 @@ static void isc_awb_work(struct work_struct *w)
>  	ctrls->hist_id = hist_id;
>  	baysel = isc->config.sd_format->cfa_baycfg << ISC_HIS_CFG_BAYSEL_SHIFT;
>  
> -	/* if no more auto white balance, reset controls. */
> -	if (ctrls->awb == ISC_WB_NONE)
> -		isc_reset_awb_ctrls(isc);
> -
>  	pm_runtime_get_sync(isc->dev);
>  
>  	/*
> @@ -1786,6 +1807,8 @@ static void isc_awb_work(struct work_struct *w)
>  		if (ctrls->awb == ISC_WB_ONETIME) {
>  			v4l2_info(&isc->v4l2_dev,
>  				  "Completed one time white-balance adjustment.\n");
> +			/* update the v4l2 controls values */
> +			isc_update_v4l2_ctrls(isc);
>  			ctrls->awb = ISC_WB_NONE;
>  		}
>  	}
> @@ -1817,6 +1840,27 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_GAMMA:
>  		ctrls->gamma_index = ctrl->val;
>  		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops isc_ctrl_ops = {
> +	.s_ctrl	= isc_s_ctrl,
> +};
> +
> +static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct isc_device *isc = container_of(ctrl->handler,
> +					     struct isc_device, ctrls.handler);
> +	struct isc_ctrls *ctrls = &isc->ctrls;
> +
> +	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
> +		return 0;
> +
> +	switch (ctrl->id) {
>  	case V4L2_CID_AUTO_WHITE_BALANCE:
>  		if (ctrl->val == 1)
>  			ctrls->awb = ISC_WB_AUTO;
> @@ -1827,36 +1871,142 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
>  		if (!isc->config.sd_format)
>  			break;
>  
> -		if (ctrls->hist_stat != HIST_ENABLED)
> -			isc_reset_awb_ctrls(isc);
> +		/* configure the controls with new values from v4l2 */
> +		if (ctrl->cluster[ISC_CTRL_R_BAL]->is_new)
> +			ctrls->gain[ISC_HIS_CFG_MODE_R] = isc->r_bal_ctrl->val;
> +		if (ctrl->cluster[ISC_CTRL_B_BAL]->is_new)
> +			ctrls->gain[ISC_HIS_CFG_MODE_B] = isc->b_bal_ctrl->val;
> +		if (ctrl->cluster[ISC_CTRL_GR_BAL]->is_new)
> +			ctrls->gain[ISC_HIS_CFG_MODE_GR] = isc->gr_bal_ctrl->val;
> +		if (ctrl->cluster[ISC_CTRL_GB_BAL]->is_new)
> +			ctrls->gain[ISC_HIS_CFG_MODE_GB] = isc->gb_bal_ctrl->val;
> +
> +		if (ctrl->cluster[ISC_CTRL_R_OFF]->is_new)
> +			ctrls->offset[ISC_HIS_CFG_MODE_R] =
> +				ISC_CTRL_V4L2_TO_ISC(isc->r_off_ctrl->val);
> +		if (ctrl->cluster[ISC_CTRL_B_OFF]->is_new)
> +			ctrls->offset[ISC_HIS_CFG_MODE_B] =
> +				ISC_CTRL_V4L2_TO_ISC(isc->b_off_ctrl->val);
> +		if (ctrl->cluster[ISC_CTRL_GR_OFF]->is_new)
> +			ctrls->offset[ISC_HIS_CFG_MODE_GR] =
> +				ISC_CTRL_V4L2_TO_ISC(isc->gr_off_ctrl->val);
> +		if (ctrl->cluster[ISC_CTRL_GB_OFF]->is_new)
> +			ctrls->offset[ISC_HIS_CFG_MODE_GB] =
> +				ISC_CTRL_V4L2_TO_ISC(isc->gb_off_ctrl->val);
>  
> -		if (isc->ctrls.awb == ISC_WB_AUTO &&
> +		isc_update_awb_ctrls(isc);
> +
> +		if (vb2_is_streaming(&isc->vb2_vidq)) {
> +			/*
> +			 * If we are streaming, we can update profile to
> +			 * have the new settings in place.
> +			 */
> +			isc_update_profile(isc);
> +		} else {
> +			/*
> +			 * The auto cluster will activate automatically this
> +			 * control. This has to be deactivated when not
> +			 * streaming.
> +			 */
> +			v4l2_ctrl_activate(isc->do_wb_ctrl, false);
> +		}
> +
> +		/* if we have autowhitebalance on, start histogram procedure */
> +		if (ctrls->awb == ISC_WB_AUTO &&
>  		    vb2_is_streaming(&isc->vb2_vidq) &&
>  		    ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
>  			isc_set_histogram(isc, true);
>  
> -		break;
> -	case V4L2_CID_DO_WHITE_BALANCE:
> -		/* if AWB is enabled, do nothing */
> -		if (ctrls->awb == ISC_WB_AUTO)
> -			return 0;
> +		/*
> +		 * for one time whitebalance adjustment, check the button,
> +		 * if it's pressed, perform the one time operation.
> +		 */
> +		if (ctrls->awb == ISC_WB_NONE &&
> +		    ctrl->cluster[ISC_CTRL_DO_WB]->is_new &&
> +		    !(ctrl->cluster[ISC_CTRL_DO_WB]->flags &
> +		    V4L2_CTRL_FLAG_INACTIVE)) {
> +			ctrls->awb = ISC_WB_ONETIME;
> +			isc_set_histogram(isc, true);
> +			v4l2_dbg(1, debug, &isc->v4l2_dev,
> +				 "One time white-balance started.\n");
> +		}
> +		return 0;
> +	}
> +	return 0;
> +}
>  
> -		ctrls->awb = ISC_WB_ONETIME;
> -		isc_set_histogram(isc, true);
> -		v4l2_dbg(1, debug, &isc->v4l2_dev,
> -			 "One time white-balance started.\n");
> +static int isc_g_volatile_awb_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct isc_device *isc = container_of(ctrl->handler,
> +					     struct isc_device, ctrls.handler);
> +	struct isc_ctrls *ctrls = &isc->ctrls;
> +
> +	switch (ctrl->id) {
> +	/* being a cluster, this id will be called for every control */
> +	case V4L2_CID_AUTO_WHITE_BALANCE:
> +		ctrl->cluster[ISC_CTRL_R_BAL]->val =
> +					ctrls->gain[ISC_HIS_CFG_MODE_R];
> +		ctrl->cluster[ISC_CTRL_B_BAL]->val =
> +					ctrls->gain[ISC_HIS_CFG_MODE_B];
> +		ctrl->cluster[ISC_CTRL_GR_BAL]->val =
> +					ctrls->gain[ISC_HIS_CFG_MODE_GR];
> +		ctrl->cluster[ISC_CTRL_GB_BAL]->val =
> +					ctrls->gain[ISC_HIS_CFG_MODE_GB];
> +
> +		ctrl->cluster[ISC_CTRL_R_OFF]->val =
> +			ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_R]);
> +		ctrl->cluster[ISC_CTRL_B_OFF]->val =
> +			ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_B]);
> +		ctrl->cluster[ISC_CTRL_GR_OFF]->val =
> +			ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_GR]);
> +		ctrl->cluster[ISC_CTRL_GB_OFF]->val =
> +			ISC_CTRL_ISC_TO_V4L2(ctrls->offset[ISC_HIS_CFG_MODE_GB]);
>  		break;
> -	default:
> -		return -EINVAL;
>  	}
> -
>  	return 0;
>  }
>  
> -static const struct v4l2_ctrl_ops isc_ctrl_ops = {
> -	.s_ctrl	= isc_s_ctrl,
> +static const struct v4l2_ctrl_ops isc_awb_ops = {
> +	.s_ctrl = isc_s_awb_ctrl,
> +	.g_volatile_ctrl = isc_g_volatile_awb_ctrl,
>  };
>  
> +#define ISC_CTRL_OFF(_name, _id, _name_str) \
> +	static const struct v4l2_ctrl_config _name = { \
> +		.ops = &isc_awb_ops, \
> +		.id = _id, \
> +		.name = _name_str, \
> +		.type = V4L2_CTRL_TYPE_INTEGER, \
> +		.flags = V4L2_CTRL_FLAG_SLIDER, \
> +		.min = -4095, \
> +		.max = 4095, \
> +		.step = 1, \
> +		.def = 0, \
> +	}
> +
> +ISC_CTRL_OFF(isc_r_off_ctrl, ISC_CID_R_OFFSET, "Red Component Offset");
> +ISC_CTRL_OFF(isc_b_off_ctrl, ISC_CID_B_OFFSET, "Blue Component Offset");
> +ISC_CTRL_OFF(isc_gr_off_ctrl, ISC_CID_GR_OFFSET, "Green Red Component Offset");
> +ISC_CTRL_OFF(isc_gb_off_ctrl, ISC_CID_GB_OFFSET, "Green Blue Component Offset");
> +
> +#define ISC_CTRL_BAL(_name, _id, _name_str) \
> +	static const struct v4l2_ctrl_config _name = { \
> +		.ops = &isc_awb_ops, \
> +		.id = _id, \
> +		.name = _name_str, \
> +		.type = V4L2_CTRL_TYPE_INTEGER, \
> +		.flags = V4L2_CTRL_FLAG_SLIDER, \
> +		.min = 0, \
> +		.max = 8191, \
> +		.step = 1, \
> +		.def = 512, \
> +	}
> +
> +ISC_CTRL_BAL(isc_r_bal_ctrl, ISC_CID_R_BAL, "Red Component Balance");
> +ISC_CTRL_BAL(isc_b_bal_ctrl, ISC_CID_B_BAL, "Blue Component Balance");
> +ISC_CTRL_BAL(isc_gr_bal_ctrl, ISC_CID_GR_BAL, "Green Red Component Balance");
> +ISC_CTRL_BAL(isc_gb_bal_ctrl, ISC_CID_GB_BAL, "Green Blue Component Balance");
> +
>  static int isc_ctrl_init(struct isc_device *isc)
>  {
>  	const struct v4l2_ctrl_ops *ops = &isc_ctrl_ops;
> @@ -1867,7 +2017,7 @@ static int isc_ctrl_init(struct isc_device *isc)
>  	ctrls->hist_stat = HIST_INIT;
>  	isc_reset_awb_ctrls(isc);
>  
> -	ret = v4l2_ctrl_handler_init(hdl, 5);
> +	ret = v4l2_ctrl_handler_init(hdl, 13);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1877,10 +2027,13 @@ static int isc_ctrl_init(struct isc_device *isc)
>  	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
>  	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_CONTRAST, -2048, 2047, 1, 256);
>  	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, GAMMA_MAX, 1, 2);
> -	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTO_WHITE_BALANCE, 0, 1, 1, 1);
> +	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
> +					  V4L2_CID_AUTO_WHITE_BALANCE,
> +					  0, 1, 1, 1);
>  
>  	/* do_white_balance is a button, so min,max,step,default are ignored */
> -	isc->do_wb_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DO_WHITE_BALANCE,
> +	isc->do_wb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
> +					    V4L2_CID_DO_WHITE_BALANCE,
>  					    0, 0, 0, 0);
>  
>  	if (!isc->do_wb_ctrl) {
> @@ -1891,6 +2044,21 @@ static int isc_ctrl_init(struct isc_device *isc)
>  
>  	v4l2_ctrl_activate(isc->do_wb_ctrl, false);
>  
> +	isc->r_bal_ctrl = v4l2_ctrl_new_custom(hdl, &isc_r_bal_ctrl, NULL);
> +	isc->b_bal_ctrl = v4l2_ctrl_new_custom(hdl, &isc_b_bal_ctrl, NULL);
> +	isc->gr_bal_ctrl = v4l2_ctrl_new_custom(hdl, &isc_gr_bal_ctrl, NULL);
> +	isc->gb_bal_ctrl = v4l2_ctrl_new_custom(hdl, &isc_gb_bal_ctrl, NULL);
> +	isc->r_off_ctrl = v4l2_ctrl_new_custom(hdl, &isc_r_off_ctrl, NULL);
> +	isc->b_off_ctrl = v4l2_ctrl_new_custom(hdl, &isc_b_off_ctrl, NULL);
> +	isc->gr_off_ctrl = v4l2_ctrl_new_custom(hdl, &isc_gr_off_ctrl, NULL);
> +	isc->gb_off_ctrl = v4l2_ctrl_new_custom(hdl, &isc_gb_off_ctrl, NULL);
> +
> +	/*
> +	 * The cluster is in auto mode with autowhitebalance enabled
> +	 * and manual mode otherwise.
> +	 */
> +	v4l2_ctrl_auto_cluster(10, &isc->awb_ctrl, 0, true);
> +
>  	v4l2_ctrl_handler_setup(hdl);
>  
>  	return 0;
> diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
> index bfaed2f..2cc6a33 100644
> --- a/drivers/media/platform/atmel/atmel-isc.h
> +++ b/drivers/media/platform/atmel/atmel-isc.h
> @@ -213,7 +213,6 @@ struct isc_device {
>  	struct fmt_config	try_config;
>  
>  	struct isc_ctrls	ctrls;
> -	struct v4l2_ctrl	*do_wb_ctrl;
>  	struct work_struct	awb_work;
>  
>  	struct mutex		lock; /* serialize access to file operations */
> @@ -223,6 +222,28 @@ struct isc_device {
>  
>  	struct isc_subdev_entity	*current_subdev;
>  	struct list_head		subdev_entities;
> +
> +	struct {
> +#define ISC_CTRL_DO_WB 1
> +#define ISC_CTRL_R_BAL 2
> +#define ISC_CTRL_B_BAL 3
> +#define ISC_CTRL_GR_BAL 4
> +#define ISC_CTRL_GB_BAL 5
> +#define ISC_CTRL_R_OFF 6
> +#define ISC_CTRL_B_OFF 7
> +#define ISC_CTRL_GR_OFF 8
> +#define ISC_CTRL_GB_OFF 9
> +		struct v4l2_ctrl	*awb_ctrl;
> +		struct v4l2_ctrl	*do_wb_ctrl;
> +		struct v4l2_ctrl	*r_bal_ctrl;
> +		struct v4l2_ctrl	*b_bal_ctrl;
> +		struct v4l2_ctrl	*gr_bal_ctrl;
> +		struct v4l2_ctrl	*gb_bal_ctrl;
> +		struct v4l2_ctrl	*r_off_ctrl;
> +		struct v4l2_ctrl	*b_off_ctrl;
> +		struct v4l2_ctrl	*gr_off_ctrl;
> +		struct v4l2_ctrl	*gb_off_ctrl;
> +	};
>  };
>  
>  #define GAMMA_MAX	2
> diff --git a/include/linux/atmel-isc-media.h b/include/linux/atmel-isc-media.h
> new file mode 100644
> index 0000000..ebb705b
> --- /dev/null
> +++ b/include/linux/atmel-isc-media.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2019 Microchip Technology Inc. and its subsidiaries
> + *
> + * Author: Eugen Hristev <eugen.hristev@microchip.com>
> + */
> +
> +#ifndef __LINUX_ATMEL_ISC_MEDIA_H__
> +#define __LINUX_ATMEL_ISC_MEDIA_H__
> +
> +enum atmel_isc_ctrl_id {
> +	/* Red component gain control */
> +	ISC_CID_R_BAL = (V4L2_CID_USER_ATMEL_ISC_BASE + 0),
> +	/* Blue component gain control */
> +	ISC_CID_B_BAL,
> +	/* Green Red component gain control */
> +	ISC_CID_GR_BAL,
> +	/* Green Blue gain control */
> +	ISC_CID_GB_BAL,
> +	/* Red component offset control */
> +	ISC_CID_R_OFFSET,
> +	/* Blue component offset control */
> +	ISC_CID_B_OFFSET,
> +	/* Green Red component offset control */
> +	ISC_CID_GR_OFFSET,
> +	/* Green Blue component offset control */
> +	ISC_CID_GB_OFFSET,
> +};
> +
> +#endif
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 5a7bede..95e0291 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -192,6 +192,10 @@ enum v4l2_colorfx {
>   * We reserve 16 controls for this driver. */
>  #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
>  
> +/* The base for the atmel isc driver controls.
> + * We reserve 32 controls for this driver. */
> +#define V4L2_CID_USER_ATMEL_ISC_BASE		(V4L2_CID_USER_BASE + 0x10c0)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
> 

