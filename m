Return-Path: <linux-media+bounces-60233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKpODHI++GkxrwIAu9opvQ
	(envelope-from <linux-media+bounces-60233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:36:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF64B8F3B
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4236C300FC61
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 06:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E122BE630;
	Mon,  4 May 2026 06:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDKhqPRy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE35528136F;
	Mon,  4 May 2026 06:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777876579; cv=none; b=OP4RakxRKFCCPNL7WAKQiONND+87LZBGhaAXKCaBHipK1TQUpVBsg4+PXq5PsAjdsKFwJyz0OsYe8mZqxtkb8LSKpiPzwuxtqD3KbWJ1KZjo4qPev/RxmCLvXaanj6t7YJ8wSeeDSFnOeoyhTs3+Nzu9VZSebJBX+zJuHMN/Y38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777876579; c=relaxed/simple;
	bh=GFgX/Wg49vZfosbiduYMFUeC9jw7Eiaj3gNxzrGDQ8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+0SrBgnPkRJhY8rZ2FKtKZ0DoIcVa7CqJ16PaTNxCepT2M9pVpnXROd2RsqupumoZY+L1AUj6Gub70/A8vT4y9OuMuWfGrF3aTI2vXVFWo+V9yENj4HRK/fu87x8ME6R7AGXEz7PSzCsWr+QrDpKnrDsVlth9tGIYIEF+tk6fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDKhqPRy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777876578; x=1809412578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GFgX/Wg49vZfosbiduYMFUeC9jw7Eiaj3gNxzrGDQ8A=;
  b=fDKhqPRyGTEN5BzUaVB5rfxJX+pI/xpzJkvNO01f4diPVG2YcPK9bkyY
   9mUFZ/QAS+ImiGD0PePKShvoVpu8e5jY8esxseOP5c4orBFmcyCxS1Q2R
   3Zic5HAeDAKRNRYAVdc1kyqK7uW3PHNPxnA9lJJZPVFY7AXYUuhfnkeF7
   Lj9yuLDNaW35cZ9KET5NFGNUW0fY/VxjfjuV+eqMgLNGi3DTDqoPr0djj
   eoQCoTW/L9IICUdMx9aWf/ky8zMUqTKmepsZ/eu5GRd4fy5kV3V0S0XqN
   iiAh/kFIYRDkNfxSulS5vcWmawu9HuRUn+52wxwMPBv1r297Gz7/iCulv
   g==;
X-CSE-ConnectionGUID: ebJfvFYeTXKCw7Orb0uwTw==
X-CSE-MsgGUID: CMjf0L7BRmiAdhLNLttgGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89037099"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="89037099"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:36:18 -0700
X-CSE-ConnectionGUID: BMAJN2W0TjOmaHgSlC3eeA==
X-CSE-MsgGUID: IKotcpRySsuEnSOi87IL2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="273545445"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:36:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1B0D7121CC4;
	Mon, 04 May 2026 09:36:14 +0300 (EEST)
Date: Mon, 4 May 2026 09:36:14 +0300
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
Subject: Re: [PATCH v5 4/6] media: i2c: lm3560: Convert to use OF bindings
Message-ID: <afg-Xl7A7E0qowHR@kekkonen.localdomain>
References: <20260503164445.215540-1-clamor95@gmail.com>
 <20260503164445.215540-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503164445.215540-5-clamor95@gmail.com>
X-Rspamd-Queue-Id: 7AEF64B8F3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60233-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

On Sun, May 03, 2026 at 07:44:43PM +0300, Svyatoslav Ryhel wrote:
> Since there are no users of this driver via platform data, remove the
> platform data support and switch to using Device Tree bindings.
> 
> Converting to Device Tree assumes dynamic and independent registration of
> LEDs. To monitor the configured LEDs, a bitmap has been added. This makes
> LED cleanup more robust and less context dependent.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/i2c/lm3560.c | 143 ++++++++++++++++++++++++++-----------
>  include/media/i2c/lm3560.h |  15 ----
>  2 files changed, 102 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> index 5b568ed9536b..ce4b09d1f208 100644
> --- a/drivers/media/i2c/lm3560.c
> +++ b/drivers/media/i2c/lm3560.c
> @@ -9,11 +9,15 @@
>   *			Ldd-Mlp <ldd-mlp@list.ti.com>
>   */
>  
> +#include <linux/bitmap.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
>  #include <linux/i2c.h>
>  #include <linux/slab.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/videodev2.h>
>  #include <media/i2c/lm3560.h>
> @@ -43,22 +47,33 @@ enum led_enable {
>   * struct lm3560_flash
>   *
>   * @dev: pointer to &struct device
> - * @pdata: platform data
>   * @regmap: reg. map for i2c
>   * @lock: muxtex for serial access.
>   * @led_mode: V4L2 LED mode
>   * @ctrls_led: V4L2 controls
>   * @subdev_led: V4L2 subdev
> + * @led_id: LED status holder
> + * @peak: peak current
> + * @max_flash_timeout: flash timeout
> + * @max_flash_brt: flash mode led brightness
> + * @max_torch_brt: torch mode led brightness
>   */
>  struct lm3560_flash {
>  	struct device *dev;
> -	struct lm3560_platform_data *pdata;
>  	struct regmap *regmap;
>  	struct mutex lock;
>  
>  	enum v4l2_flash_led_mode led_mode;
>  	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
>  	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
> +
> +	DECLARE_BITMAP(led_id, LM3560_LED_MAX);
> +
> +	enum lm3560_peak_current peak;
> +	u32 max_flash_timeout;
> +
> +	u32 max_flash_brt[LM3560_LED_MAX];
> +	u32 max_torch_brt[LM3560_LED_MAX];
>  };
>  
>  #define to_lm3560_flash(_ctrl, _no)	\
> @@ -269,8 +284,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
>  				enum lm3560_led_id led_no)
>  {
>  	struct v4l2_ctrl *fault;
> -	u32 max_flash_brt = flash->pdata->max_flash_brt[led_no];
> -	u32 max_torch_brt = flash->pdata->max_torch_brt[led_no];
> +	u32 max_flash_brt = flash->max_flash_brt[led_no];
> +	u32 max_torch_brt = flash->max_torch_brt[led_no];
>  	struct v4l2_ctrl_handler *hdl = &flash->ctrls_led[led_no];
>  	const struct v4l2_ctrl_ops *ops = &lm3560_led_ctrl_ops[led_no];
>  
> @@ -295,9 +310,9 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
>  	/* flash strobe timeout */
>  	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_TIMEOUT,
>  			  LM3560_FLASH_TOUT_MIN,
> -			  flash->pdata->max_flash_timeout,
> +			  flash->max_flash_timeout,
>  			  LM3560_FLASH_TOUT_STEP,
> -			  flash->pdata->max_flash_timeout);
> +			  flash->max_flash_timeout);
>  
>  	/* flash brt */
>  	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_INTENSITY,
> @@ -339,15 +354,18 @@ static const struct regmap_config lm3560_regmap = {
>  };
>  
>  static int lm3560_subdev_init(struct lm3560_flash *flash,
> -			      enum lm3560_led_id led_no, char *led_name)
> +			      enum lm3560_led_id led_no,
> +			      struct device_node *np)
>  {
>  	struct i2c_client *client = to_i2c_client(flash->dev);
>  	int rval;
>  
>  	v4l2_i2c_subdev_init(&flash->subdev_led[led_no], client, &lm3560_ops);
>  	flash->subdev_led[led_no].flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> -	strscpy(flash->subdev_led[led_no].name, led_name,
> -		sizeof(flash->subdev_led[led_no].name));
> +	snprintf(flash->subdev_led[led_no].name,
> +		 sizeof(flash->subdev_led[led_no].name),
> +		 "lm3560-led%d", led_no);
> +	flash->subdev_led[led_no].fwnode = of_fwnode_handle(np);
>  	rval = lm3560_init_controls(flash, led_no);
>  	if (rval)
>  		goto err_out;
> @@ -378,7 +396,7 @@ static int lm3560_init_device(struct lm3560_flash *flash)
>  
>  	/* set peak current */
>  	rval = regmap_update_bits(flash->regmap,
> -				  REG_FLASH_TOUT, 0x60, flash->pdata->peak);
> +				  REG_FLASH_TOUT, 0x60, flash->peak);
>  	if (rval < 0)
>  		return rval;
>  	/* output disable */
> @@ -391,18 +409,22 @@ static int lm3560_init_device(struct lm3560_flash *flash)
>  	return rval;
>  }
>  
> -static void lm3560_subdev_cleanup(struct lm3560_flash *flash,
> -				  enum lm3560_led_id led_no)
> +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
>  {
> -	v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
> -	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
> -	media_entity_cleanup(&flash->subdev_led[led_no].entity);
> +	int led_no;
> +
> +	for_each_set_bit(led_no, flash->led_id, LM3560_LED_MAX) {
> +		v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
> +		v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
> +		media_entity_cleanup(&flash->subdev_led[led_no].entity);
> +	}
>  }
>  
>  static int lm3560_probe(struct i2c_client *client)
>  {
>  	struct lm3560_flash *flash;
> -	struct lm3560_platform_data *pdata = dev_get_platdata(&client->dev);
> +	struct device_node *node;
> +	u32 peak_ua;
>  	int rval;
>  
>  	flash = devm_kzalloc(&client->dev, sizeof(*flash), GFP_KERNEL);
> @@ -415,36 +437,69 @@ static int lm3560_probe(struct i2c_client *client)
>  		return rval;
>  	}
>  
> -	/* if there is no platform data, use chip default value */
> -	if (pdata == NULL) {
> -		pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
> -		if (pdata == NULL)
> -			return -ENODEV;
> -		pdata->peak = LM3560_PEAK_3600mA;
> -		pdata->max_flash_timeout = LM3560_FLASH_TOUT_MAX;
> -		/* led 1 */
> -		pdata->max_flash_brt[LM3560_LED0] = LM3560_FLASH_BRT_MAX;
> -		pdata->max_torch_brt[LM3560_LED0] = LM3560_TORCH_BRT_MAX;
> -		/* led 2 */
> -		pdata->max_flash_brt[LM3560_LED1] = LM3560_FLASH_BRT_MAX;
> -		pdata->max_torch_brt[LM3560_LED1] = LM3560_TORCH_BRT_MAX;
> -	}
> -	flash->pdata = pdata;
>  	flash->dev = &client->dev;
>  	mutex_init(&flash->lock);
>  
> +	bitmap_zero(flash->led_id, LM3560_LED_MAX);
> +
> +	flash->peak = LM3560_PEAK_1600mA;
> +	rval = device_property_read_u32(flash->dev,
> +					"ti,peak-current-microamp", &peak_ua);
> +	if (!rval) {
> +		switch (peak_ua) {
> +		case 1600000:
> +			flash->peak = LM3560_PEAK_1600mA;
> +			break;
> +		case 2300000:
> +			flash->peak = LM3560_PEAK_2300mA;
> +			break;
> +		case 3000000:
> +			flash->peak = LM3560_PEAK_3000mA;
> +			break;
> +		case 3600000:
> +			flash->peak = LM3560_PEAK_3600mA;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	flash->max_flash_timeout = LM3560_FLASH_TOUT_MIN * 1000;
> +	device_property_read_u32(flash->dev, "flash-max-timeout-us",
> +				 &flash->max_flash_timeout);
> +	flash->max_flash_timeout /= 1000;
> +
>  	rval = lm3560_init_device(flash);
>  	if (rval < 0)
>  		return rval;
>  
> -	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
> -	if (rval < 0)
> -		return rval;
> +	for_each_available_child_of_node(dev_of_node(flash->dev), node) {

device_for_each_child_node(), please.

> +		u32 reg;
>  
> -	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
> -	if (rval < 0) {
> -		lm3560_subdev_cleanup(flash, LM3560_LED0);
> -		return rval;
> +		rval = of_property_read_u32(node, "reg", &reg);

device_property_read_u32() here and elsewhere.

> +		if (rval < 0)
> +			/* We care only about nodes with reg property */
> +			continue;
> +
> +		if (reg == LM3560_LED0 || reg == LM3560_LED1) {
> +			flash->max_flash_brt[reg] = LM3560_FLASH_BRT_MIN;
> +			of_property_read_u32(node, "flash-max-microamp",
> +					     &flash->max_flash_brt[reg]);
> +
> +			flash->max_torch_brt[reg] = LM3560_TORCH_BRT_MIN;
> +			of_property_read_u32(node, "led-max-microamp",
> +					     &flash->max_torch_brt[reg]);
> +
> +			rval = lm3560_subdev_init(flash, reg, node);
> +			if (rval < 0) {
> +				lm3560_subdev_cleanup(flash);
> +				return dev_err_probe(flash->dev, rval,
> +						    "failed to register led%d\n",
> +						    reg);
> +			}
> +
> +			set_bit(reg, flash->led_id);
> +		}
>  	}
>  
>  	i2c_set_clientdata(client, flash);
> @@ -455,12 +510,17 @@ static int lm3560_probe(struct i2c_client *client)
>  static void lm3560_remove(struct i2c_client *client)
>  {
>  	struct lm3560_flash *flash = i2c_get_clientdata(client);
> -	unsigned int i;
>  
> -	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++)
> -		lm3560_subdev_cleanup(flash, i);
> +	lm3560_subdev_cleanup(flash);
>  }
>  
> +static const struct of_device_id lm3560_of_match[] = {
> +	{ .compatible = "ti,lm3559" },
> +	{ .compatible = "ti,lm3560" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lm3560_of_match);
> +
>  static const struct i2c_device_id lm3560_id_table[] = {
>  	{ LM3559_NAME },
>  	{ LM3560_NAME },
> @@ -473,6 +533,7 @@ static struct i2c_driver lm3560_i2c_driver = {
>  	.driver = {
>  		   .name = LM3560_NAME,
>  		   .pm = NULL,
> +		   .of_match_table = lm3560_of_match,
>  		   },
>  	.probe = lm3560_probe,
>  	.remove = lm3560_remove,
> diff --git a/include/media/i2c/lm3560.h b/include/media/i2c/lm3560.h
> index 770d8c72c94a..b56c1ff8fd49 100644
> --- a/include/media/i2c/lm3560.h
> +++ b/include/media/i2c/lm3560.h
> @@ -66,19 +66,4 @@ enum lm3560_peak_current {
>  	LM3560_PEAK_3600mA = 0x60
>  };
>  
> -/* struct lm3560_platform_data
> - *
> - * @peak :  peak current
> - * @max_flash_timeout: flash timeout
> - * @max_flash_brt: flash mode led brightness
> - * @max_torch_brt: torch mode led brightness
> - */
> -struct lm3560_platform_data {
> -	enum lm3560_peak_current peak;
> -
> -	u32 max_flash_timeout;
> -	u32 max_flash_brt[LM3560_LED_MAX];
> -	u32 max_torch_brt[LM3560_LED_MAX];
> -};
> -
>  #endif /* __LM3560_H__ */

-- 
Kind regards,

Sakari Ailus

