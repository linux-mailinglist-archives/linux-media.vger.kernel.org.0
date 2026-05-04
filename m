Return-Path: <linux-media+bounces-60234-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CWJKaA++GkxrwIAu9opvQ
	(envelope-from <linux-media+bounces-60234-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:37:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 921904B8F59
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2FD030010F7
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 06:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E8F2C0294;
	Mon,  4 May 2026 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsbHWmRp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BACA27380A;
	Mon,  4 May 2026 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777876634; cv=none; b=Yvh8lwQJz8ajG26QNfDWaJ/jhvzIZ62vCV3JHCyYGuhSygygOitdC6sj02JbKUhzq+9/8AC/E4eOWUeF3KvU5M8NEA+tuQ+t50Z82XqSwGHpt2UBaFhbih3enYZ9//7tGz1u0ceH5GUIscRStpKnAJetj8h2RjAEjRPbdgTdOng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777876634; c=relaxed/simple;
	bh=VtoRALB7sC9UgeWTtrvjstB79Q/ifbeHt78WAQUTn8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsMAHrC+p/rSYH7F8RG8n2igh+R9WlNfaOS9hZi3UHq+9nSrIgPhaBOXnttB/t6WNDI0pejvGbAGufJoyLJ8LbAy4CCtTVWckgdZCKs7v6DS7a+4klgiZ7nQ+Wg8CyKpQMjkBQFHyxv6FVIvL/HyMcji29mmX6PbHlRLnc3/TOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsbHWmRp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777876634; x=1809412634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VtoRALB7sC9UgeWTtrvjstB79Q/ifbeHt78WAQUTn8k=;
  b=VsbHWmRpuw4KgB/rISmacdXY3I9+OEXObwIEIk9UCeorngJDmhHe0ZIF
   i5qWl7nqcNu0q02E2/YvlAgmXeT59kYb0BTNpvRT9VmlRFmD5y2w6x2ov
   CsTO6VkzhXfhuQcViFZTZwEqN1rYUKLf55/MGZS0i3PD+XQ5j+C0p6rUo
   ssNFThGtrx0w7LEUOwvSsujewOsIIEO68soAZYFRewQX1tXa6N7KxA+dE
   2sgaVRTbwtVYFfFM4U1VLmgKv36HWLbEtkY4JhVqyqHt6nA7L2RM6SP5C
   H3Pc9GAU8V7LIhxny2r7YgD0Aaw2iBah0ofiaJBdiCzKjoNO37QaZdyFI
   g==;
X-CSE-ConnectionGUID: GjHeBl/uTTu4diwu3wQaOw==
X-CSE-MsgGUID: tgQnKXjLRCahGEu+LGrcWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89037125"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="89037125"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:37:13 -0700
X-CSE-ConnectionGUID: 5mCGxOw4Q8SjdVIBV20oqg==
X-CSE-MsgGUID: 6bZPOJqrSaSBuYhPeCuVNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="265778467"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.114])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:37:10 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3F69B121CC4;
	Mon, 04 May 2026 09:37:09 +0300 (EEST)
Date: Mon, 4 May 2026 09:37:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 5/6] media: i2c: lm3560: Add support for PM features
Message-ID: <afg-ldFd7hockYn-@kekkonen.localdomain>
References: <20260503164445.215540-1-clamor95@gmail.com>
 <20260503164445.215540-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503164445.215540-6-clamor95@gmail.com>
X-Rspamd-Queue-Id: 921904B8F59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60234-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_SENDER_MAILLIST(0.00)[]

Hi Svyatoslav,

On Sun, May 03, 2026 at 07:44:44PM +0300, Svyatoslav Ryhel wrote:
> Add support for power management features to better control the LM3560
> within the media framework. To achieve the desired PM support, the HWEN
> GPIO and VIN power supply were added and configured into power on/off
> sequences. Added PM operations along with the PM configuration setup.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/i2c/lm3560.c | 117 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 110 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> index ce4b09d1f208..15741ea5684f 100644
> --- a/drivers/media/i2c/lm3560.c
> +++ b/drivers/media/i2c/lm3560.c
> @@ -12,13 +12,16 @@
>  #include <linux/bitmap.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/slab.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/property.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/videodev2.h>
>  #include <media/i2c/lm3560.h>
>  #include <media/v4l2-ctrls.h>
> @@ -49,6 +52,8 @@ enum led_enable {
>   * @dev: pointer to &struct device
>   * @regmap: reg. map for i2c
>   * @lock: muxtex for serial access.
> + * @hwen_gpio: line connected to HWEN pin
> + * @vin_supply: line connected to IN supply (2.5V - 5.5V)
>   * @led_mode: V4L2 LED mode
>   * @ctrls_led: V4L2 controls
>   * @subdev_led: V4L2 subdev
> @@ -63,6 +68,9 @@ struct lm3560_flash {
>  	struct regmap *regmap;
>  	struct mutex lock;
>  
> +	struct gpio_desc *hwen_gpio;
> +	struct regulator *vin_supply;
> +
>  	enum v4l2_flash_led_mode led_mode;
>  	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
>  	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
> @@ -177,12 +185,17 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
>  	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
>  	int rval = -EINVAL;
>  
> +	if (!pm_runtime_get_if_in_use(flash->dev))
> +		return 0;
> +
>  	if (ctrl->id == V4L2_CID_FLASH_FAULT) {
>  		s32 fault = 0;
>  		unsigned int reg_val;
>  		rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
> -		if (rval < 0)
> +		if (rval < 0) {
> +			pm_runtime_put(flash->dev);
>  			return rval;
> +		}
>  		if (reg_val & FAULT_SHORT_CIRCUIT)
>  			fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
>  		if (reg_val & FAULT_OVERTEMP)
> @@ -192,6 +205,8 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
>  		ctrl->cur.val = fault;
>  	}
>  
> +	pm_runtime_put(flash->dev);
> +
>  	return rval;
>  }
>  
> @@ -201,6 +216,9 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
>  	u8 tout_bits;
>  	int rval = -EINVAL;
>  
> +	if (!pm_runtime_get_if_in_use(flash->dev))

This should be pm_runtime_get_if_active().

> +		return 0;
> +
>  	switch (ctrl->id) {
>  	case V4L2_CID_FLASH_LED_MODE:
>  		flash->led_mode = ctrl->val;
> @@ -246,6 +264,8 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
>  		break;
>  	}
>  
> +	pm_runtime_put(flash->dev);
> +
>  	return rval;
>  }
>  
> @@ -409,6 +429,38 @@ static int lm3560_init_device(struct lm3560_flash *flash)
>  	return rval;
>  }
>  
> +static int __maybe_unused lm3560_power_off(struct device *dev)
> +{
> +	struct lm3560_flash *flash = dev_get_drvdata(dev);
> +
> +	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> +	regulator_disable(flash->vin_supply);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused lm3560_power_on(struct device *dev)
> +{
> +	struct lm3560_flash *flash = dev_get_drvdata(dev);
> +	int rval;
> +
> +	rval = regulator_enable(flash->vin_supply);
> +	if (rval < 0) {
> +		dev_err(flash->dev, "failed to enable vin power supply\n");
> +		return rval;
> +	}
> +
> +	gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> +
> +	rval = lm3560_init_device(flash);
> +	if (rval < 0) {
> +		lm3560_power_off(dev);
> +		return rval;
> +	}
> +
> +	return 0;
> +}
> +
>  static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
>  {
>  	int led_no;
> @@ -442,6 +494,17 @@ static int lm3560_probe(struct i2c_client *client)
>  
>  	bitmap_zero(flash->led_id, LM3560_LED_MAX);
>  
> +	flash->hwen_gpio = devm_gpiod_get_optional(flash->dev, "enable",
> +						   GPIOD_OUT_LOW);
> +	if (IS_ERR(flash->hwen_gpio))
> +		return dev_err_probe(flash->dev, PTR_ERR(flash->hwen_gpio),
> +				     "failed to get hwen gpio\n");
> +
> +	flash->vin_supply = devm_regulator_get(flash->dev, "vin");
> +	if (IS_ERR(flash->vin_supply))
> +		return dev_err_probe(flash->dev, PTR_ERR(flash->vin_supply),
> +				     "failed to get vin-supply\n");
> +
>  	flash->peak = LM3560_PEAK_1600mA;
>  	rval = device_property_read_u32(flash->dev,
>  					"ti,peak-current-microamp", &peak_ua);
> @@ -469,9 +532,19 @@ static int lm3560_probe(struct i2c_client *client)
>  				 &flash->max_flash_timeout);
>  	flash->max_flash_timeout /= 1000;
>  
> +	rval = regulator_enable(flash->vin_supply);
> +	if (rval < 0)
> +		return dev_err_probe(flash->dev, rval,
> +				     "failed to enable vin power supply\n");
> +
> +	gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> +
>  	rval = lm3560_init_device(flash);
>  	if (rval < 0)
> -		return rval;
> +		goto error_disable;
> +
> +	pm_runtime_set_active(flash->dev);
> +	pm_runtime_enable(flash->dev);
>  
>  	for_each_available_child_of_node(dev_of_node(flash->dev), node) {
>  		u32 reg;
> @@ -492,10 +565,10 @@ static int lm3560_probe(struct i2c_client *client)
>  
>  			rval = lm3560_subdev_init(flash, reg, node);
>  			if (rval < 0) {
> -				lm3560_subdev_cleanup(flash);
> -				return dev_err_probe(flash->dev, rval,
> -						    "failed to register led%d\n",
> -						    reg);
> +				dev_err(flash->dev,
> +					"failed to register led%d: %d\n",
> +					reg, rval);
> +				goto error_clean;
>  			}
>  
>  			set_bit(reg, flash->led_id);
> @@ -504,7 +577,23 @@ static int lm3560_probe(struct i2c_client *client)
>  
>  	i2c_set_clientdata(client, flash);
>  
> +	pm_runtime_set_autosuspend_delay(flash->dev, 1000);
> +	pm_runtime_use_autosuspend(flash->dev);
> +	pm_runtime_idle(flash->dev);
> +
>  	return 0;
> +
> +error_clean:
> +	pm_runtime_disable(flash->dev);
> +	pm_runtime_set_suspended(flash->dev);
> +
> +	lm3560_subdev_cleanup(flash);
> +
> +error_disable:
> +	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> +	regulator_disable(flash->vin_supply);
> +
> +	return rval;
>  }
>  
>  static void lm3560_remove(struct i2c_client *client)
> @@ -512,8 +601,22 @@ static void lm3560_remove(struct i2c_client *client)
>  	struct lm3560_flash *flash = i2c_get_clientdata(client);
>  
>  	lm3560_subdev_cleanup(flash);
> +
> +	/*
> +	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
> +	 * make sure to turn power off manually.
> +	 */
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev)) {
> +		lm3560_power_off(&client->dev);
> +		pm_runtime_set_suspended(&client->dev);
> +	}
>  }
>  
> +static const struct dev_pm_ops lm3560_pm_ops = {
> +	SET_RUNTIME_PM_OPS(lm3560_power_off, lm3560_power_on, NULL)
> +};
> +
>  static const struct of_device_id lm3560_of_match[] = {
>  	{ .compatible = "ti,lm3559" },
>  	{ .compatible = "ti,lm3560" },
> @@ -532,7 +635,7 @@ MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
>  static struct i2c_driver lm3560_i2c_driver = {
>  	.driver = {
>  		   .name = LM3560_NAME,
> -		   .pm = NULL,
> +		   .pm = pm_ptr(&lm3560_pm_ops),
>  		   .of_match_table = lm3560_of_match,
>  		   },
>  	.probe = lm3560_probe,

-- 
Kind regards,

Sakari Ailus

