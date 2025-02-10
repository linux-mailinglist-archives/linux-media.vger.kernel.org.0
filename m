Return-Path: <linux-media+bounces-25898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CFCA2E9DD
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7B41166BE6
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0391CF5C0;
	Mon, 10 Feb 2025 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFSBGAWf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A1192D7E;
	Mon, 10 Feb 2025 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184471; cv=none; b=N6K+6zOudZWv95ZT4Z+TBASze08BzhvfV9e5OHgwECXQsbGTzyOQSC7jbYRp3gobfX0rEcYpOR+7/dmpKfaB1Xupkybps7qyL7dA8YFrirHmKe9CS0+uEseCp+fIZ+yT3B+vC2LIpi3AjOs9ilRnty1Jf7JmrRC3RlV6x7mPtTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184471; c=relaxed/simple;
	bh=pVYWBC61p7vHD1QFuCq4fIXgGjxAGKZtinPLLa3k3to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1MZ8Rt4Nxt51aSXNW1vn16ZBUBddUbp1YJnBf9V2TjEG6z8l3pWUB139+1rZXet+WOe7KWExsdiIwZ3VeowwAoDKnlDqRiemyuX/uw+EMONcePywhdWhxphAOabTiPliLmQjVqpOODVU6HgpBGf36/A++M57ZGnb4gC5v80IV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFSBGAWf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739184470; x=1770720470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pVYWBC61p7vHD1QFuCq4fIXgGjxAGKZtinPLLa3k3to=;
  b=EFSBGAWfp5nJwDEKcY7l3eEKYxQLcgtH38C1vnZAwfWgEPuheOO1qZjO
   gae52PwswltsCjFSyS82SqGcnOqYAXVF+5YRjty9UeApgfPDYWRPO4w9l
   pZSlmP/w+br+TFWpikMRZziKR85sFkX93pm6/78DqXGyAkoIPnKSTxiB3
   1XHu6bb4BKMGEnIqiRnY/mMhuTxVNzBiJBsWHfodjVQjp93bAyOiO0f37
   vILzBeaMPMFIPyk5T8ejyiMCMy3qKrZv0/eC0Rt5ZDjv5PldNjc/cZDPF
   epNhIXrWOMX4/sQvlzfqUKcZnk3WO7WVQS6FDEgq9y9n/y2gJZflo/98X
   g==;
X-CSE-ConnectionGUID: vZYNP3+TQ12X3QBBSC+wfg==
X-CSE-MsgGUID: lLJonXNJSwKw7gD3V79znQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43520248"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="43520248"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:47:49 -0800
X-CSE-ConnectionGUID: FaH/nSBQR1GuoaGTnYHoIw==
X-CSE-MsgGUID: 0fAO4hbZT6uwop4vkN/sYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112107349"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:47:46 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9E97C120433;
	Mon, 10 Feb 2025 12:47:43 +0200 (EET)
Date: Mon, 10 Feb 2025 10:47:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Val Packett <val@packett.cool>
Cc: Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Subject: Re: [PATCH 5/5] media: i2c: dw9719: add support for dw9718s
Message-ID: <Z6nZT3bmzl3DjX32@kekkonen.localdomain>
References: <20250210082035.8670-1-val@packett.cool>
 <20250210082035.8670-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210082035.8670-6-val@packett.cool>

Hi Val,

Thanks for the set!

I've cc'd André who's adding support for dw9761 in the same driver. Please
work together to get both changes in.

On Mon, Feb 10, 2025 at 05:19:20AM -0300, Val Packett wrote:
> The DW9718S is a similar part that uses a different register set but
> follows the same method of operation otherwise. Add support for it
> to the existing dw9719 driver. While here, ensure suspend-resume works.
> 
> Tested on the Moto E5 (motorola-nora) smartphone.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/media/i2c/dw9719.c | 104 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 97 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 74a57c2f59ae..4a07684af52e 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c
> @@ -23,6 +23,22 @@
>  /* 100 us is not enough on resume */
>  #define DW9719_T_OPR_US				200
>  
> +#define DW9718_CONTROL			CCI_REG8(1)
> +#define DW9718_CONTROL_SW_LINEAR	BIT(0)
> +#define DW9718_CONTROL_SAC_SHIFT		1
> +#define DW9718_CONTROL_SAC_MASK		0x7
> +#define DW9718_CONTROL_OCP_DISABLE	BIT(4)
> +#define DW9718_CONTROL_UVLO_DISABLE	BIT(5)
> +
> +#define DW9718_VCM_CURRENT		CCI_REG16(2)
> +
> +#define DW9718_SW			CCI_REG8(4)
> +#define DW9718_SW_VCM_FREQ_MASK	0xF
> +#define DW9718_DEFAULT_VCM_FREQ	0
> +
> +#define DW9718_SACT			CCI_REG8(5)
> +#define DW9718_SACT_PERIOD_8_8MS	0x19
> +
>  #define DW9719_INFO			CCI_REG8(0)
>  #define DW9719_ID			0xF1
>  
> @@ -48,12 +64,25 @@ struct dw9719_device {
>  	u32 sac_mode;
>  	u32 vcm_freq;
>  
> +	const struct dw9719_cfg {
> +		int reg_current;
> +		int default_vcm_freq;
> +		int (*power_up)(struct dw9719_device *dw9719);
> +		int (*detect)(struct dw9719_device *dw9719);

Could you instead use a pointer to the match data struct directly?

> +	} *cfg;
> +
>  	struct dw9719_v4l2_ctrls {
>  		struct v4l2_ctrl_handler handler;
>  		struct v4l2_ctrl *focus;
>  	} ctrls;
>  };
>  
> +static int dw9718_detect(struct dw9719_device *dw9719)
> +{
> +	/* Unfortunately, there is no ID register */
> +	return 0;
> +}
> +
>  static int dw9719_detect(struct dw9719_device *dw9719)
>  {
>  	int ret;
> @@ -73,9 +102,50 @@ static int dw9719_detect(struct dw9719_device *dw9719)
>  
>  static int dw9719_power_down(struct dw9719_device *dw9719)
>  {
> +	int ret;
> +
> +	cci_write(dw9719->regmap, DW9718_CONTROL, 1, &ret);
> +	if (ret)

Please just proceed and return 0 if power down fails. There's nothing the
caller can reasonably do about this. Feel free to complain though (e.g.
dev_err()).

> +		return ret;
> +
> +	/* Need tOPR to transition from STANDBY to SHUTDOWN */
> +	usleep_range(DW9719_T_OPR_US, DW9719_T_OPR_US + 10);
> +
>  	return regulator_disable(dw9719->regulator);
>  }
>  
> +static int dw9718_power_up(struct dw9719_device *dw9719)
> +{
> +	int ret;
> +
> +	ret = regulator_enable(dw9719->regulator);
> +	if (ret)
> +		return ret;
> +
> +	/* Need tOPR to transition from SHUTDOWN to STANDBY */
> +	usleep_range(DW9719_T_OPR_US, DW9719_T_OPR_US + 10);
> +
> +	/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */
> +	cci_write(dw9719->regmap, DW9718_CONTROL,
> +			     DW9718_CONTROL_SW_LINEAR |
> +			     ((dw9719->sac_mode & DW9718_CONTROL_SAC_MASK)
> +			      << DW9718_CONTROL_SAC_SHIFT) |
> +			     DW9718_CONTROL_OCP_DISABLE |
> +			     DW9718_CONTROL_UVLO_DISABLE,
> +			     &ret);
> +	cci_write(dw9719->regmap, DW9718_SACT,
> +			     DW9718_SACT_PERIOD_8_8MS,
> +			     &ret);
> +	cci_write(dw9719->regmap, DW9718_SW,
> +			     dw9719->vcm_freq & DW9718_SW_VCM_FREQ_MASK,
> +			     &ret);
> +
> +	if (ret)
> +		dw9719_power_down(dw9719);
> +
> +	return ret;
> +}
> +
>  static int dw9719_power_up(struct dw9719_device *dw9719)
>  {
>  	int ret;
> @@ -103,7 +173,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719)
>  
>  static int dw9719_t_focus_abs(struct dw9719_device *dw9719, s32 value)
>  {
> -	return cci_write(dw9719->regmap, DW9719_VCM_CURRENT, value, NULL);
> +	return cci_write(dw9719->regmap, dw9719->cfg->reg_current, value, NULL);
>  }
>  
>  static int dw9719_set_ctrl(struct v4l2_ctrl *ctrl)
> @@ -161,7 +231,7 @@ static int dw9719_resume(struct device *dev)
>  	int ret;
>  	int val;
>  
> -	ret = dw9719_power_up(dw9719);
> +	ret = dw9719->cfg->power_up(dw9719);
>  	if (ret)
>  		return ret;
>  
> @@ -235,13 +305,17 @@ static int dw9719_probe(struct i2c_client *client)
>  	if (!dw9719)
>  		return -ENOMEM;
>  
> +	dw9719->cfg = i2c_get_match_data(client);
> +	if (!dw9719->cfg)
> +		return -ENODEV;
> +
>  	dw9719->regmap = devm_cci_regmap_init_i2c(client, 8);
>  	if (IS_ERR(dw9719->regmap))
>  		return PTR_ERR(dw9719->regmap);
>  
>  	dw9719->dev = &client->dev;
>  	dw9719->sac_mode = DW9719_MODE_SAC3;
> -	dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
> +	dw9719->vcm_freq = dw9719->cfg->default_vcm_freq;
>  
>  	/* Optional indication of SAC mode select */
>  	device_property_read_u32(&client->dev, "dongwoon,sac-mode",
> @@ -277,11 +351,11 @@ static int dw9719_probe(struct i2c_client *client)
>  	 * will work.
>  	 */
>  
> -	ret = dw9719_power_up(dw9719);
> +	ret = dw9719->cfg->power_up(dw9719);
>  	if (ret)
>  		goto err_cleanup_media;
>  
> -	ret = dw9719_detect(dw9719);
> +	ret = dw9719->cfg->detect(dw9719);
>  	if (ret)
>  		goto err_powerdown;
>  
> @@ -328,14 +402,30 @@ static void dw9719_remove(struct i2c_client *client)
>  	pm_runtime_set_suspended(&client->dev);
>  }
>  
> +static const struct dw9719_cfg dw9718_cfg = {
> +	.reg_current = DW9718_VCM_CURRENT,
> +	.default_vcm_freq = DW9718_DEFAULT_VCM_FREQ,
> +	.power_up = dw9718_power_up,
> +	.detect = dw9718_detect,
> +};
> +
> +static const struct dw9719_cfg dw9719_cfg = {
> +	.reg_current = DW9719_VCM_CURRENT,
> +	.default_vcm_freq = DW9719_DEFAULT_VCM_FREQ,
> +	.power_up = dw9719_power_up,
> +	.detect = dw9719_detect,
> +};
> +
>  static const struct i2c_device_id dw9719_id_table[] = {
> -	{ "dw9719" },
> +	{ "dw9718s", .driver_data = (kernel_ulong_t)&dw9718_cfg, },
> +	{ "dw9719",  .driver_data = (kernel_ulong_t)&dw9719_cfg, },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
>  
>  static const struct of_device_id dw9719_of_table[] = {
> -	{ .compatible = "dongwoon,dw9719" },
> +	{ .compatible = "dongwoon,dw9718s", .data = &dw9718_cfg },
> +	{ .compatible = "dongwoon,dw9719",  .data = &dw9719_cfg },
>  	{ { 0 } }
>  };
>  MODULE_DEVICE_TABLE(of, dw9719_of_table);

-- 
Kind regards,

Sakari Ailus

