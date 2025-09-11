Return-Path: <linux-media+bounces-42263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 482DBB52B69
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CAF75867ED
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EDF2E5B05;
	Thu, 11 Sep 2025 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWF4PwSs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE82E03F9;
	Thu, 11 Sep 2025 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578548; cv=none; b=mo/1L5QguIJgofkbTZ7D+tIZZm0qGoGL2guY7qhcZ+Rr7s8B8FzCh9Pogu/dLmsmzEPSeTztS9bQtv0vvh47Hdt1y7ApM+k6wiKnlnFtyJ/ulDw7kvbaVXXTNFESGuYbbDSYaffAjvNlj591R6u+M+3IOFNPOHJARUTTDzD2Lfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578548; c=relaxed/simple;
	bh=MZkSNF729QqNTQj4q9PWDrOZg6xdXAe10HC4k5HQhA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cY7uGiqc9t19ck2u4GVtFlI6b/i76bFtvPCtJMqsVNFha+Gv2PyQP+mBJmobHz5eBYBsHILHt7Q3japa16Z+pWSV5+OD3aaopPcV/+6dQ8gvfG4JcUTlbqLiftZ9uuhYXaAqYftWbsbvfyqQOh28iNbfVmQ3eFo/Hs7gf8+sYpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWF4PwSs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EAAC4CEF1;
	Thu, 11 Sep 2025 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757578547;
	bh=MZkSNF729QqNTQj4q9PWDrOZg6xdXAe10HC4k5HQhA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWF4PwSs+H43I/a5ob6RMVM1e7DIddUYISGAQpdHdB80rrbiLOVmgcwYPDbdQnUnx
	 omtvKRdXL9kTjEdlT/mA6jcklq7qN05N6uV9vCrQDL9vwf2XykyhKIe/72SVOdrx+A
	 M7Ofe21pJ8uU3amFLq3Ax6U/b4wc38Lpy+nDSEAKq7mJut1cuyhKuyB4hcSPvxVZZc
	 1iLX3srlsJ8AQTUL/+NQxW3+c4rSxYQDXBo0De6JI1YAEML44dP19+ZdA4PsVnYCWq
	 SjViXlstokf3/Zj7+xaABT+0BnWcftX8znP6k27TosFQZFbWHmbojTAEUbEpqV+iWR
	 BqXbC2lhEsZpA==
Date: Thu, 11 Sep 2025 09:15:40 +0100
From: Lee Jones <lee@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, threeway@gmail.com,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
Message-ID: <20250911081540.GD9224@google.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>

On Wed, 10 Sep 2025, Aleksandrs Vinarskis wrote:

> From: Hans de Goede <hansg@kernel.org>
> 
> Add 'name' argument to of_led_get() such that it can lookup LEDs in
> devicetree by either name or index.
> 
> And use this modified function to add devicetree support to the generic
> (non devicetree specific) [devm_]led_get() function.
> 
> This uses the standard devicetree pattern of adding a -names string array
> to map names to the indexes for an array of resources.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Lee Jones <lee@kernel.org>

Remind me why this can't go in through LED again?

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  drivers/leds/led-class.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 15633fbf3c166aa4f521774d245f6399a642bced..f3faf37f9a08ac762ed87b91cb3cab5faa8eacb0 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -252,15 +252,23 @@ static const struct class leds_class = {
>   * of_led_get() - request a LED device via the LED framework
>   * @np: device node to get the LED device from
>   * @index: the index of the LED
> + * @name: the name of the LED used to map it to its function, if present
>   *
>   * Returns the LED device parsed from the phandle specified in the "leds"
>   * property of a device tree node or a negative error-code on failure.
>   */
> -static struct led_classdev *of_led_get(struct device_node *np, int index)
> +static struct led_classdev *of_led_get(struct device_node *np, int index,
> +				       const char *name)
>  {
>  	struct device *led_dev;
>  	struct device_node *led_node;
>  
> +	/*
> +	 * For named LEDs, first look up the name in the "led-names" property.
> +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
> +	 */
> +	if (name)
> +		index = of_property_match_string(np, "led-names", name);
>  	led_node = of_parse_phandle(np, "leds", index);
>  	if (!led_node)
>  		return ERR_PTR(-ENOENT);
> @@ -324,7 +332,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
>  	if (!dev)
>  		return ERR_PTR(-EINVAL);
>  
> -	led = of_led_get(dev->of_node, index);
> +	led = of_led_get(dev->of_node, index, NULL);
>  	if (IS_ERR(led))
>  		return led;
>  
> @@ -342,9 +350,14 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
>  struct led_classdev *led_get(struct device *dev, char *con_id)
>  {
>  	struct led_lookup_data *lookup;
> +	struct led_classdev *led_cdev;
>  	const char *provider = NULL;
>  	struct device *led_dev;
>  
> +	led_cdev = of_led_get(dev->of_node, -1, con_id);
> +	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
> +		return led_cdev;
> +
>  	mutex_lock(&leds_lookup_lock);
>  	list_for_each_entry(lookup, &leds_lookup_list, list) {
>  		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
> 
> -- 
> 2.48.1
> 
> 

-- 
Lee Jones [李琼斯]

