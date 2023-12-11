Return-Path: <linux-media+bounces-2141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7F980D501
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 19:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E051C1C208E1
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 18:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6604F4F5EE;
	Mon, 11 Dec 2023 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vaJ7Qdr6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69A493;
	Mon, 11 Dec 2023 10:11:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 708DF922;
	Mon, 11 Dec 2023 19:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702318215;
	bh=Hkw53CbAYCaVZwFD6iEyB0w0BwlSOvyQDw30dZMGkeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vaJ7Qdr6VFdkee/w1bOqs3IU/FcFR5GgyqCC8hF7BbQjf1JGAhASI6K5GRg4pMXde
	 vHOxKyUaDwvp2MroRVdD1sq0w3AIgIg7jMyFQUTVrIq938i5l3AcRbyzF0RXVwNyRk
	 CdS3M1LUZuyMsPHA86Jp3+Mdxjng5l+W3F0Wi5P4=
Date: Mon, 11 Dec 2023 20:11:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 05/19] media: i2c: ov4689: Refactor ov4689_set_ctrl
Message-ID: <20231211181106.GD27535@pendragon.ideasonboard.com>
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
 <20231211175023.1680247-6-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231211175023.1680247-6-mike.rudenko@gmail.com>

Hi Mikhail,

Thank you for the patch.

On Mon, Dec 11, 2023 at 08:50:08PM +0300, Mikhail Rudenko wrote:
> Introduces local variables for regmap and the control value within the
> ov4689_set_ctrl function. This adjustment eliminates repetition within
> the function.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/i2c/ov4689.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index 8c120d7f7830..42700ecfbe0e 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -584,7 +584,9 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov4689 *ov4689 =
>  		container_of(ctrl->handler, struct ov4689, ctrl_handler);
> +	struct regmap *regmap = ov4689->regmap;
>  	struct device *dev = ov4689->dev;
> +	s32 val = ctrl->val;

For ctrl->val, I think the code is clearer without this change. When
reading the function, seeing "val", I need to look up what it is, while
seeing "ctrl->val" gives me more context and makes (in my opinion) the
code more readable.

>  	int sensor_gain;
>  	s64 max_expo;
>  	int ret;
> @@ -593,7 +595,7 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
>  	switch (ctrl->id) {
>  	case V4L2_CID_VBLANK:
>  		/* Update max exposure while meeting expected vblanking */
> -		max_expo = ov4689->cur_mode->height + ctrl->val - 4;
> +		max_expo = ov4689->cur_mode->height + val - 4;
>  		__v4l2_ctrl_modify_range(ov4689->exposure,
>  					 ov4689->exposure->minimum, max_expo,
>  					 ov4689->exposure->step,
> @@ -607,36 +609,34 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
>  	switch (ctrl->id) {
>  	case V4L2_CID_EXPOSURE:
>  		/* 4 least significant bits of exposure are fractional part */
> -		ret = cci_write(ov4689->regmap, OV4689_REG_EXPOSURE,
> -				ctrl->val << 4, NULL);
> +		cci_write(regmap, OV4689_REG_EXPOSURE, val << 4, &ret);
>  		break;
>  	case V4L2_CID_ANALOGUE_GAIN:
> -		ret = ov4689_map_gain(ov4689, ctrl->val, &sensor_gain);
> +		ret = ov4689_map_gain(ov4689, val, &sensor_gain);
>  
> -		cci_write(ov4689->regmap, OV4689_REG_GAIN_H,
> +		cci_write(regmap, OV4689_REG_GAIN_H,
>  			  (sensor_gain >> OV4689_GAIN_H_SHIFT) &
>  			  OV4689_GAIN_H_MASK, &ret);
>  
> -		cci_write(ov4689->regmap, OV4689_REG_GAIN_L,
> +		cci_write(regmap, OV4689_REG_GAIN_L,
>  			  sensor_gain & OV4689_GAIN_L_MASK,
>  			  &ret);
>  		break;
>  	case V4L2_CID_VBLANK:
> -		ret = cci_write(ov4689->regmap, OV4689_REG_VTS,
> -				ctrl->val + ov4689->cur_mode->height, NULL);
> +		cci_write(regmap, OV4689_REG_VTS,
> +			  val + ov4689->cur_mode->height, &ret);
>  		break;
>  	case V4L2_CID_TEST_PATTERN:
> -		ret = ov4689_enable_test_pattern(ov4689, ctrl->val);
> +		ret = ov4689_enable_test_pattern(ov4689, val);
>  		break;
>  	default:
>  		dev_warn(dev, "%s Unhandled id:0x%x, val:0x%x\n",
> -			 __func__, ctrl->id, ctrl->val);
> +			 __func__, ctrl->id, val);
>  		ret = -EINVAL;
>  		break;
>  	}
>  
>  	pm_runtime_put(dev);
> -
>  	return ret;
>  }
>  
> -- 
> 2.43.0
> 

-- 
Regards,

Laurent Pinchart

