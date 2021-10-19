Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B72D43365A
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 14:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhJSMyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 08:54:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:18456 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhJSMyF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 08:54:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="215663213"
X-IronPort-AV: E=Sophos;i="5.87,163,1631602800"; 
   d="scan'208";a="215663213"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 05:51:52 -0700
X-IronPort-AV: E=Sophos;i="5.87,163,1631602800"; 
   d="scan'208";a="566937986"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 05:51:50 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id B2C8920316;
        Tue, 19 Oct 2021 15:51:48 +0300 (EEST)
Date:   Tue, 19 Oct 2021 15:51:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, tfiga@chromium.org,
        kieran.bingham@ideasonboard.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH v3] media: imx258: add vblank control to support more
 frame rate range
Message-ID: <YW6/ZGI5/j4UDaBQ@paasikivi.fi.intel.com>
References: <1634527576-2928-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634527576-2928-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Mon, Oct 18, 2021 at 11:26:16AM +0800, Bingbu Cao wrote:
> Current imx258 driver enable the automatic frame length tracking control
> by default and did not support VBLANK change, it's always working at 30fps.
> However, in reality we need a wider frame rate range from 15 to 30.
> This patch disable the automatic frame length tracking control and enable
> the v4l2 VBLANK control to allow user changing frame rate per requirement.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/imx258.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 81cdf37216ca..2c787af7074d 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -29,6 +29,7 @@
>  #define IMX258_VTS_MAX			0xffff
>  
>  /*Frame Length Line*/
> +#define IMX258_REG_FLL			0x0340
>  #define IMX258_FLL_MIN			0x08a6
>  #define IMX258_FLL_MAX			0xffff
>  #define IMX258_FLL_STEP			1
> @@ -241,7 +242,7 @@ static const struct imx258_reg mode_4208x3118_regs[] = {
>  	{ 0x034D, 0x70 },
>  	{ 0x034E, 0x0C },
>  	{ 0x034F, 0x30 },
> -	{ 0x0350, 0x01 },
> +	{ 0x0350, 0x00 }, /* no frame length automatic tracking control */
>  	{ 0x0202, 0x0C },
>  	{ 0x0203, 0x46 },
>  	{ 0x0204, 0x00 },
> @@ -360,7 +361,7 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
>  	{ 0x034D, 0x38 },
>  	{ 0x034E, 0x06 },
>  	{ 0x034F, 0x18 },
> -	{ 0x0350, 0x01 },
> +	{ 0x0350, 0x00 }, /* no frame length automatic tracking control */
>  	{ 0x0202, 0x06 },
>  	{ 0x0203, 0x2E },
>  	{ 0x0204, 0x00 },
> @@ -479,7 +480,7 @@ static const struct imx258_reg mode_1048_780_regs[] = {
>  	{ 0x034D, 0x18 },
>  	{ 0x034E, 0x03 },
>  	{ 0x034F, 0x0C },
> -	{ 0x0350, 0x01 },
> +	{ 0x0350, 0x00 }, /* no frame length automatic tracking control */

Why is automatic frame length control disabled?

>  	{ 0x0202, 0x03 },
>  	{ 0x0203, 0x42 },
>  	{ 0x0204, 0x00 },
> @@ -753,8 +754,17 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  	struct imx258 *imx258 =
>  		container_of(ctrl->handler, struct imx258, ctrl_handler);
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
> +	s64 max;
>  	int ret = 0;
>  
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Update max exposure to meet expected vblanking */
> +		max = imx258->cur_mode->height + ctrl->val - 10;
> +		__v4l2_ctrl_modify_range(imx258->exposure,
> +					 imx258->exposure->minimum,
> +					 max, imx258->exposure->step, max);
> +	}
> +
>  	/*
>  	 * Applying V4L2 control value only happens
>  	 * when power is up for streaming
> @@ -773,6 +783,10 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  				IMX258_REG_VALUE_16BIT,
>  				ctrl->val);
>  		break;
> +	case V4L2_CID_VBLANK:
> +		ret = imx258_write_reg(imx258, IMX258_REG_FLL, 2,
> +				       imx258->cur_mode->height + ctrl->val);
> +		break;
>  	case V4L2_CID_DIGITAL_GAIN:
>  		ret = imx258_update_digital_gain(imx258, IMX258_REG_VALUE_16BIT,
>  				ctrl->val);
> @@ -1189,9 +1203,6 @@ static int imx258_init_controls(struct imx258 *imx258)
>  				IMX258_VTS_MAX - imx258->cur_mode->height, 1,
>  				vblank_def);
>  
> -	if (imx258->vblank)
> -		imx258->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
>  	imx258->hblank = v4l2_ctrl_new_std(
>  				ctrl_hdlr, &imx258_ctrl_ops, V4L2_CID_HBLANK,
>  				IMX258_PPL_DEFAULT - imx258->cur_mode->width,

-- 
Kind regards,

Sakari Ailus
