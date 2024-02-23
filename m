Return-Path: <linux-media+bounces-5740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C17860C45
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 09:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4F26B2584A
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 08:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B81317571;
	Fri, 23 Feb 2024 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bihS54MY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CDD175AB;
	Fri, 23 Feb 2024 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708676822; cv=none; b=sBBld276CEdkw7Q5ET1u6Ww1PZt63ZvGh49Z4U79VmzSw19yDp/H6z7JThXtyZ9+cDpoclBCYzjYu0xPQLJBrq6zjPXh7sUynw57vHc7DtVuwkswQkizutdV7J6oYJcTXvga51novSwEcn02n+M5qKrUPy+y2TLVsoMSmvyxXMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708676822; c=relaxed/simple;
	bh=irdeSfmFPKa8gsvyFoyZEAT/OgWl2zTzic/hx8oANEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kT1NvWTQuHoi2MwpnaiudOT++kaRJQl3n4ayffQrdymMkIu7xXldAatT2R1dNicTc46d5+GfYefS65wJh135HZlmrzjaxGDxkBCtcMgCa+kmaL8vfLRki9NZ9Y3doLi7uQT/pqXMj1wD8PpdvPKvlBgkuQ5dQyh90SCblkWXgDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bihS54MY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708676820; x=1740212820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=irdeSfmFPKa8gsvyFoyZEAT/OgWl2zTzic/hx8oANEM=;
  b=bihS54MYL8UYwC0KsV57kykIEqqfbNE/JvU2D9b5SNp+MfWROEpJPwxA
   cqD5KeG2CbYIZBaeAN9COV3dhVQMk8VKq4oJQbzecO24+EJELpQkhs1JM
   IuGI2D7iMiVrd0yX/ggNbOR9baUC5MPH3yCVn31I6UNOBYvuwV/5zq6p5
   uYMMRttx1YgmGFxvJl3W1AxLg094qcTJ+l8to/Wy8Gz7mvtCFiIr/4Ise
   U60/HSu6YEfCyzAqoNMfHtsbIk30V1uzovc8JNy42lG/DnpqsItRlXU/x
   NdwW7dQVZ6tmLgRWbwK2cKGkG6Lo15mxKNAlxttrWebw5rEM8cmpLij5p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20518340"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20518340"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 00:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="29002225"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 00:26:55 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 725B811F81D;
	Fri, 23 Feb 2024 10:26:52 +0200 (EET)
Date: Fri, 23 Feb 2024 08:26:52 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 12/20] media: i2c: ov4689: Implement vflip/hflip
 controls
Message-ID: <ZdhWzCNalXnScMQy@kekkonen.localdomain>
References: <20231218174042.794012-1-mike.rudenko@gmail.com>
 <20231218174042.794012-13-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218174042.794012-13-mike.rudenko@gmail.com>

Hi Mikhail,

On Mon, Dec 18, 2023 at 08:40:33PM +0300, Mikhail Rudenko wrote:
> The OV4689 sensor supports horizontal and vertical flipping. Add
> appropriate controls to the driver. Toggling both array flip and
> digital flip bits allows to achieve flipping while maintaining output
> Bayer order. Note that the default value of hflip control corresponds
> to both bits set, as it was before this patch.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/i2c/ov4689.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index 06ed9d22b2c8..6cf986bf305d 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -42,6 +42,14 @@
>  #define OV4689_REG_VTS			CCI_REG16(0x380e)
>  #define OV4689_VTS_MAX			0x7fff
>  
> +#define OV4689_REG_TIMING_FORMAT1	CCI_REG8(0x3820)
> +#define OV4689_REG_TIMING_FORMAT2	CCI_REG8(0x3821)
> +#define OV4689_TIMING_FLIP_MASK		GENMASK(2, 1)
> +#define OV4689_TIMING_FLIP_ARRAY	BIT(1)
> +#define OV4689_TIMING_FLIP_DIGITAL	BIT(2)
> +#define OV4689_TIMING_FLIP_BOTH		(OV4689_TIMING_FLIP_ARRAY |\
> +					 OV4689_TIMING_FLIP_DIGITAL)
> +
>  #define OV4689_REG_TEST_PATTERN		CCI_REG8(0x5040)
>  #define OV4689_TEST_PATTERN_ENABLE	0x80
>  #define OV4689_TEST_PATTERN_DISABLE	0x0
> @@ -183,7 +191,6 @@ static const struct cci_reg_sequence ov4689_2688x1520_regs[] = {
>  	{CCI_REG8(0x3811), 0x08}, /* H_WIN_OFF_L h_win_off[7:0] = 0x08*/
>  	{CCI_REG8(0x3813), 0x04}, /* V_WIN_OFF_L v_win_off[7:0] = 0x04 */
>  	{CCI_REG8(0x3819), 0x01}, /* VSYNC_END_L vsync_end_point[7:0] = 0x01 */
> -	{CCI_REG8(0x3821), 0x06}, /* TIMING_FORMAT2 array_h_mirror = 1, digital_h_mirror = 1 */
>  
>  	/* OTP control */
>  	{CCI_REG8(0x3d85), 0x36}, /* OTP_REG85 OTP_power_up_load_setting_enable = 1,
> @@ -607,6 +614,16 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
>  			  (ctrl->val + ov4689->cur_mode->width) /
>  			  OV4689_HTS_DIVIDER, &ret);
>  		break;
> +	case V4L2_CID_VFLIP:
> +		cci_update_bits(regmap, OV4689_REG_TIMING_FORMAT1,
> +				OV4689_TIMING_FLIP_MASK,
> +				ctrl->val ? OV4689_TIMING_FLIP_BOTH : 0, &ret);
> +		break;
> +	case V4L2_CID_HFLIP:
> +		cci_update_bits(regmap, OV4689_REG_TIMING_FORMAT2,
> +				OV4689_TIMING_FLIP_MASK,
> +				ctrl->val ? 0 : OV4689_TIMING_FLIP_BOTH, &ret);
> +		break;
>  	default:
>  		dev_warn(dev, "%s Unhandled id:0x%x, val:0x%x\n",
>  			 __func__, ctrl->id, ctrl->val);
> @@ -637,7 +654,7 @@ static int ov4689_initialize_controls(struct ov4689 *ov4689)
>  
>  	handler = &ov4689->ctrl_handler;
>  	mode = ov4689->cur_mode;
> -	ret = v4l2_ctrl_handler_init(handler, 10);
> +	ret = v4l2_ctrl_handler_init(handler, 12);
>  	if (ret)
>  		return ret;
>  
> @@ -677,6 +694,9 @@ static int ov4689_initialize_controls(struct ov4689 *ov4689)
>  				     ARRAY_SIZE(ov4689_test_pattern_menu) - 1,
>  				     0, 0, ov4689_test_pattern_menu);
>  
> +	v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);

Could you take the default value from the mounting rotation?

The default should be upside-up, but this is an existing driver and
changing the flipping now could affect existing users.
<URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/drivers/camera-sensor.html#rotation-orientation-and-flipping>

> +
>  	if (handler->error) {
>  		ret = handler->error;
>  		dev_err(ov4689->dev, "Failed to init controls(%d)\n", ret);

-- 
Regards,

Sakari Ailus

