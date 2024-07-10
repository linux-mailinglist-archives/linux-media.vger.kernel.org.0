Return-Path: <linux-media+bounces-14822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144A492CD81
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 10:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3748C1C212E2
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 08:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9D216F0D1;
	Wed, 10 Jul 2024 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3eCAnjz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFA284A32;
	Wed, 10 Jul 2024 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720601477; cv=none; b=eZ2rbHxn0KbydspH4VjlIGHCGWwx74gr9JwzZMT5uHD/gYo8QW20VWkApKrJ6rBkcwQ+IgcLcSzm1pC5ph9IaqKYucUUz+uKu7EMT1gDD8PweKN2Iepop0hZGr6jE5UU8bgzyXJnTaR2z/9quOBSNV0Sm4akX0RgweN/2YD48e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720601477; c=relaxed/simple;
	bh=k1di7eE6iyOCbrJ0NNxim1Vsvi0SGbj6aHDjcWAUwUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2VeXpPaT6N/dagrSEOLP7jQYA6veWucJYsG5bv93KdUZoOfZ7I5jhcRK0i7eWV+ziaiLhdghs1Z4JPErz9+nsjpqnEbyPwLUHYjn1OfJBeZC/P6QJ73YTCS9Jtvvp1Qx8GVDCQ7BNF8X7jf/L8FRsFJ+C8oSm/p/9hUQ1rEIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3eCAnjz; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a797c62565aso43864466b.2;
        Wed, 10 Jul 2024 01:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720601474; x=1721206274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r3i2DC8f+stmUekDQHQ9DmW3w1oyom/tsI0fkuIxzbA=;
        b=Q3eCAnjzgnvkZC6f9hQie24tittHM5EuETlAgkFPRfAWMFDt2MwPKovzdZo16uf+qV
         UAFHoQ5n9YXbQbcSKN1z5PkHvSvcHLsEw165Zd6iLEI7MdlFuT10dVQfKjQwnBNHnzYz
         B1roufTKPlGkRYUZswWH0aqlcDC4KLxBSihe03ux1K5tsMIbvX3gf1puPWEY8bElZo+Z
         sScWL763eaEdEB4WkJ+qXi6ba4ekqPGpkMsRqFgJ3/8+NqD0NHLQI6c+5kzgJ/PKgffH
         ryuwuvTll5KQA1BLjqyOgZ7koK2UQS3l7IBh6OqmkmR55vItnbpLE6FcsHQD/uBki2yu
         vg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720601474; x=1721206274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3i2DC8f+stmUekDQHQ9DmW3w1oyom/tsI0fkuIxzbA=;
        b=FM3E2n/IiUwfCn7PNfZX4WMBNkN7aZ0ismuYVWHfrcHteqWOI8xaLZOr7mQc0ZSW6u
         DkoAOnzP/L6RJEmMIX73bsdZMyCLDnLrrIoDIHGdPEDoUOvApVZFl7M6Hj8jP+V0ArN2
         z/DkqudcugApBV2nKr5n36/AFLVidyogNi5moST98FWLARwjcr9RJf1Ind+rLUNvSD4H
         SSCfibjK0BHsSStchmkYv9ECCIZ6xzBDXthEJIf5YB8Y0/knJAZ7jdNxjIm3fo/jfq+/
         n+q+aqGO3K9/I+WfF6tfTw/FocPIlVuuYWyDqRMAOPxh2JN/n5l8bPHY8NmH8/cLfwfm
         Q3+g==
X-Forwarded-Encrypted: i=1; AJvYcCXtENSVYY/x9wdbJRX0sqT0Gqx8DRPrZnUaWJr25t55tZlU257GMxF3vlTfvLIYl23gWogvO8TXrYMwZExyzZC2GiDJIKqGmlJkPL3t
X-Gm-Message-State: AOJu0YykOS9KH/pkJBHlTeEe9w4iuW16hvMZyNCmqtYQ2LNm4dgJU3wU
	UataDzWnl8Mw1E+Ma+lQkiNuKtGsBUtV/wfHWAzzOL1wP/0oY0Oh
X-Google-Smtp-Source: AGHT+IG0SUHUE0sHpBRo0UPS675LR5wn0XNQLd0Qc+xSb7Lo9X4aeOudEWKZuSApzI3c1Dz5EPYkJA==
X-Received: by 2002:a17:906:5650:b0:a72:8d2f:8594 with SMTP id a640c23a62f3a-a780b6b2f20mr312112966b.27.1720601474003;
        Wed, 10 Jul 2024 01:51:14 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-142-11.cust.vodafonedsl.it. [2.39.142.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc80asm139917366b.7.2024.07.10.01.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:51:13 -0700 (PDT)
Date: Wed, 10 Jul 2024 10:51:11 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: imx335: Support vertical flip
Message-ID: <Zo5Lf6c6HKlPm6Rs@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240710044633.81372-1-umang.jain@ideasonboard.com>
 <20240710044633.81372-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710044633.81372-3-umang.jain@ideasonboard.com>

Hi Umang,

On Wed, Jul 10, 2024 at 10:16:32AM +0530, Umang Jain wrote:
> Support vertical flip by setting REG_VREVERSE.
> Additional registers also needs to be set per mode, according
> to the readout direction (normal/inverted) as mentioned in the
> data sheet.
> 
> Since the register IMX335_REG_AREA3_ST_ADR_1 is based on the
> flip (and is set via vflip related registers), it has been
> moved out of the 2592x1944 mode regs.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 71 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 6c1e61b6696b..cd150606a8a9 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -56,6 +56,9 @@
>  #define IMX335_AGAIN_STEP		1
>  #define IMX335_AGAIN_DEFAULT		0
>  
> +/* Vertical flip */
> +#define IMX335_REG_VREVERSE		CCI_REG8(0x304f)
> +
>  #define IMX335_REG_TPG_TESTCLKEN	CCI_REG8(0x3148)
>  
>  #define IMX335_REG_INCLKSEL1		CCI_REG16_LE(0x314c)
> @@ -155,6 +158,8 @@ static const char * const imx335_supply_name[] = {
>   * @vblank_max: Maximum vertical blanking in lines
>   * @pclk: Sensor pixel clock
>   * @reg_list: Register list for sensor mode
> + * @vflip_normal: Register list vflip (normal readout)
> + * @vflip_inverted: Register list vflip (inverted readout)
>   */
>  struct imx335_mode {
>  	u32 width;
> @@ -166,6 +171,8 @@ struct imx335_mode {
>  	u32 vblank_max;
>  	u64 pclk;
>  	struct imx335_reg_list reg_list;
> +	struct imx335_reg_list vflip_normal;
> +	struct imx335_reg_list vflip_inverted;
>  };
>  
>  /**
> @@ -183,6 +190,7 @@ struct imx335_mode {
>   * @pclk_ctrl: Pointer to pixel clock control
>   * @hblank_ctrl: Pointer to horizontal blanking control
>   * @vblank_ctrl: Pointer to vertical blanking control
> + * @vflip: Pointer to vertical flip control
>   * @exp_ctrl: Pointer to exposure control
>   * @again_ctrl: Pointer to analog gain control
>   * @vblank: Vertical blanking in lines
> @@ -207,6 +215,7 @@ struct imx335 {
>  	struct v4l2_ctrl *pclk_ctrl;
>  	struct v4l2_ctrl *hblank_ctrl;
>  	struct v4l2_ctrl *vblank_ctrl;
> +	struct v4l2_ctrl *vflip;
>  	struct {
>  		struct v4l2_ctrl *exp_ctrl;
>  		struct v4l2_ctrl *again_ctrl;
> @@ -259,7 +268,6 @@ static const struct cci_reg_sequence mode_2592x1944_regs[] = {
>  	{ IMX335_REG_HTRIMMING_START, 48 },
>  	{ IMX335_REG_HNUM, 2592 },
>  	{ IMX335_REG_Y_OUT_SIZE, 1944 },
> -	{ IMX335_REG_AREA3_ST_ADR_1, 176 },
>  	{ IMX335_REG_AREA3_WIDTH_1, 3928 },
>  	{ IMX335_REG_OPB_SIZE_V, 0 },
>  	{ IMX335_REG_XVS_XHS_DRV, 0x00 },
> @@ -333,6 +341,26 @@ static const struct cci_reg_sequence mode_2592x1944_regs[] = {
>  	{ CCI_REG8(0x3a00), 0x00 },
>  };
>  
> +static const struct cci_reg_sequence mode_2592x1944_vflip_normal[] = {
> +	{ IMX335_REG_AREA3_ST_ADR_1, 176 },
> +
> +	/* Undocumented V-Flip related registers on Page 55 of datasheet. */
> +	{ CCI_REG8(0x3081), 0x02, },
> +	{ CCI_REG8(0x3083), 0x02, },
> +	{ CCI_REG16_LE(0x30b6), 0x00 },
> +	{ CCI_REG16_LE(0x3116), 0x08 },
> +};
> +
> +static const struct cci_reg_sequence mode_2592x1944_vflip_inverted[] = {
> +	{ IMX335_REG_AREA3_ST_ADR_1, 4112 },
> +
> +	/* Undocumented V-Flip related registers on Page 55 of datasheet. */
> +	{ CCI_REG8(0x3081), 0xfe, },
> +	{ CCI_REG8(0x3083), 0xfe, },
> +	{ CCI_REG16_LE(0x30b6), 0x1fa },
> +	{ CCI_REG16_LE(0x3116), 0x002 },
> +};
> +
>  static const struct cci_reg_sequence raw10_framefmt_regs[] = {
>  	{ IMX335_REG_ADBIT, 0x00 },
>  	{ IMX335_REG_MDBIT, 0x00 },
> @@ -419,6 +447,14 @@ static const struct imx335_mode supported_mode = {
>  		.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
>  		.regs = mode_2592x1944_regs,
>  	},
> +	.vflip_normal = {
> +		.num_of_regs = ARRAY_SIZE(mode_2592x1944_vflip_normal),
> +		.regs = mode_2592x1944_vflip_normal,
> +	},
> +	.vflip_inverted = {
> +		.num_of_regs = ARRAY_SIZE(mode_2592x1944_vflip_inverted),
> +		.regs = mode_2592x1944_vflip_inverted,
> +	},
>  };
>  
>  /**
> @@ -492,6 +528,26 @@ static int imx335_update_exp_gain(struct imx335 *imx335, u32 exposure, u32 gain)
>  	return ret;
>  }
>  
> +static int imx335_update_vertical_flip(struct imx335 *imx335, u32 vflip)
> +{
> +	int ret = 0;
> +
> +	if (vflip)
> +		cci_multi_reg_write(imx335->cci,
> +				    imx335->cur_mode->vflip_inverted.regs,
> +				    imx335->cur_mode->vflip_inverted.num_of_regs,
> +				    &ret);
> +	else
> +		cci_multi_reg_write(imx335->cci,
> +				    imx335->cur_mode->vflip_normal.regs,
> +				    imx335->cur_mode->vflip_normal.num_of_regs,
> +				    &ret);
> +	if (ret)
> +		return ret;
> +
> +	return cci_write(imx335->cci, IMX335_REG_VREVERSE, vflip, NULL);
> +}
> +
>  static int imx335_update_test_pattern(struct imx335 *imx335, u32 pattern_index)
>  {
>  	int ret = 0;
> @@ -584,6 +640,10 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
>  
>  		ret = imx335_update_exp_gain(imx335, exposure, analog_gain);
>  
> +		break;
> +	case V4L2_CID_VFLIP:
> +		ret = imx335_update_vertical_flip(imx335, ctrl->val);
> +
>  		break;
>  	case V4L2_CID_TEST_PATTERN:
>  		ret = imx335_update_test_pattern(imx335, ctrl->val);
> @@ -1167,7 +1227,7 @@ static int imx335_init_controls(struct imx335 *imx335)
>  		return ret;
>  
>  	/* v4l2_fwnode_device_properties can add two more controls */
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>  	if (ret)
>  		return ret;
>  
> @@ -1202,6 +1262,13 @@ static int imx335_init_controls(struct imx335 *imx335)
>  
>  	v4l2_ctrl_cluster(2, &imx335->exp_ctrl);
>  
> +	imx335->vflip = v4l2_ctrl_new_std(ctrl_hdlr,
> +					  &imx335_ctrl_ops,
> +					  V4L2_CID_VFLIP,
> +					  0, 1, 1, 0);
> +	if (imx335->vflip)
> +		imx335->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
>  	imx335->vblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
>  						&imx335_ctrl_ops,
>  						V4L2_CID_VBLANK,
> -- 
> 2.45.0
> 

This patch looks good to me.
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks & Regards,
Tommaso


