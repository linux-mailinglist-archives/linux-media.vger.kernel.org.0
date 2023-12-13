Return-Path: <linux-media+bounces-2170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0D180DE0E
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 23:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688D0281E8F
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 22:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C16A5578F;
	Mon, 11 Dec 2023 22:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZnwJeb83"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74585B5;
	Mon, 11 Dec 2023 14:15:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7559B922;
	Mon, 11 Dec 2023 23:14:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702332882;
	bh=GL+uqkZRlZtM9CqFWDpU/O4mleiVeJYVJuE+4HaNbzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnwJeb83+6Ilj6joGWv51eFMSpMn62AY9aSTlBqg7ZxxfjJ0mILeTUdaKPN9NQ9kK
	 wd+toMzn1IDUSbI+VH0gWvsf0twsOZpV50GxOm7SyvZjYc2ufw6lTvgUPDbdKdPv0r
	 pueVyHqiUSJZs/2uKwsk47KX0mSwsgWD7MdB4HgY=
Date: Tue, 12 Dec 2023 00:15:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 12/19] media: i2c: ov4689: Implement digital gain control
Message-ID: <20231211221533.GK27535@pendragon.ideasonboard.com>
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
 <20231211175023.1680247-13-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231211175023.1680247-13-mike.rudenko@gmail.com>

Hi Mikhail,

Thank you for the patch.

On Mon, Dec 11, 2023 at 08:50:15PM +0300, Mikhail Rudenko wrote:
> The OV4689 sensor supports digital gain up to 16x. Implement
> corresponding control in the driver. Default digital gain value is not
> modified by this patch.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/i2c/ov4689.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index 62aeae43d749..ed0ce1b9e55b 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -35,6 +35,12 @@
>  #define OV4689_GAIN_STEP		1
>  #define OV4689_GAIN_DEFAULT		0x80
>  
> +#define OV4689_REG_DIG_GAIN		CCI_REG16(0x352A)

Lowercase for hex constatns please.

> +#define OV4689_DIG_GAIN_MIN		1
> +#define OV4689_DIG_GAIN_MAX		0x7fff
> +#define OV4689_DIG_GAIN_STEP		1
> +#define OV4689_DIG_GAIN_DEFAULT		0x800
> +
>  #define OV4689_REG_TEST_PATTERN		CCI_REG8(0x5040)
>  #define OV4689_TEST_PATTERN_ENABLE	0x80
>  #define OV4689_TEST_PATTERN_DISABLE	0x0
> @@ -131,7 +137,6 @@ static const struct cci_reg_sequence ov4689_2688x1520_regs[] = {
>  
>  	/* AEC PK */
>  	{CCI_REG8(0x3503), 0x04}, /* AEC_MANUAL gain_input_as_sensor_gain_format = 1 */
> -	{CCI_REG8(0x352a), 0x08}, /* DIG_GAIN_FRAC_LONG dig_gain_long[14:8] = 0x08 (2x) */

Is the default value really x2 ? That's not very nice :-S

It would be much nicer if the default value of the control mapped to x1,
otherwise it's impossible for userspace to interpret the scale of the
digital gain value in a generic way. I suppose that could break existing
applications though, which isn't great.

Out of curiosity, can you tell what SoC(s) you're using this sensor with
?

>  
>  	/* ADC and analog control*/
>  	{CCI_REG8(0x3603), 0x40},
> @@ -622,6 +627,9 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
>  				OV4689_TIMING_FLIP_MASK,
>  				val ? 0 : OV4689_TIMING_FLIP_BOTH, &ret);
>  		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		cci_write(regmap, OV4689_REG_DIG_GAIN, val, &ret);
> +		break;
>  	default:
>  		dev_warn(dev, "%s Unhandled id:0x%x, val:0x%x\n",
>  			 __func__, ctrl->id, val);
> @@ -650,7 +658,7 @@ static int ov4689_initialize_controls(struct ov4689 *ov4689)
>  
>  	handler = &ov4689->ctrl_handler;
>  	mode = ov4689->cur_mode;
> -	ret = v4l2_ctrl_handler_init(handler, 13);
> +	ret = v4l2_ctrl_handler_init(handler, 14);
>  	if (ret)
>  		return ret;
>  
> @@ -693,6 +701,10 @@ static int ov4689_initialize_controls(struct ov4689 *ov4689)
>  	v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
>  	v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
>  
> +	v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  OV4689_DIG_GAIN_MIN, OV4689_DIG_GAIN_MAX,
> +			  OV4689_DIG_GAIN_STEP, OV4689_DIG_GAIN_DEFAULT);
> +
>  	if (handler->error) {
>  		ret = handler->error;
>  		dev_err(ov4689->dev, "Failed to init controls(%d)\n", ret);

-- 
Regards,

Laurent Pinchart

