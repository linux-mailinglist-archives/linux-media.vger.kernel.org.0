Return-Path: <linux-media+bounces-42626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 011C5B59C5F
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 17:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A60AF1736D0
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 15:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B914C36298C;
	Tue, 16 Sep 2025 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HV6/UjgH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D043345722;
	Tue, 16 Sep 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758037435; cv=none; b=YXwfj8CnqNBfA137gRDjmEYdljxR2tBndjqjP1Ur1egexRWL0JSNPkE7DGeQ9tTnXh96Te5brB9dfonvzA9Ek/zMVFy5YfZO0oYOgK2c9zU0cJ+64v1t1H/YDPtMngJsD3s3coxZqfSMsR8BSicd1xyfEBt1rNjv9Am34l/uHaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758037435; c=relaxed/simple;
	bh=ThdyO2GOJ3OKtV1hGeLo+a6nDDHSjZTwlZ81sERWzQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P394UT0rtqEVt3wxgrWZUR2XwDQ2D9Gjzp/0XDkLf/4DkKL03EOf4PVeF9rhs9gDm9wMC/Axh9S/w2QibMEou4EzPt+xBWjXQ5DPzCTOLdunI/MS962Cf37Gyd2rObO/Uch68gDqMrpX3hUXBHbMLwoQSQe+DaYUUR0cAqcawDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HV6/UjgH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03401C4CEEB;
	Tue, 16 Sep 2025 15:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758037434;
	bh=ThdyO2GOJ3OKtV1hGeLo+a6nDDHSjZTwlZ81sERWzQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HV6/UjgH3GqFwdkHUIOAHTGRemyh7AcFzMMXNgI28WUDuLEIJ0ut7XJnX7+6Qe/Ii
	 L8RuCbebXPqPByYvvzvecHhb78flEcTWB8aoOYi6q0VNARrepfjD6tXLLHHxJKcNqI
	 CjlJynsT3tGdv8CLgWBrAAYaEsDP8QavKjduiLiUczDM4Pv5XyNZsKUhCrQCefzTCg
	 Rambd1no4dFQ3g4zahGnaOfRfjRi2veUnzP/tTXR1U/ied8GTmqdQzVgzoHxvTomyn
	 34/FsJPi1IVxs0LGiYWXmjPTTBgYwF1bRJIF2tz4aUt4wZria1drDgP54sH9y8eFJs
	 R7F/7Ix7/ocZw==
Date: Tue, 16 Sep 2025 10:43:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Aleksandrs Vinarskis <alex@vinarskis.com>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, threeway@gmail.com, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
Message-ID: <g7xkdervsknmcwjg4qgloj643b4itjlfeyiipvsrborszgrhlg@zrp65nvfueqk>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
 <20250911081540.GD9224@google.com>
 <b875f811-6371-4ff4-9cc2-a0a2c82a569c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b875f811-6371-4ff4-9cc2-a0a2c82a569c@kernel.org>

On Thu, Sep 11, 2025 at 11:01:00AM +0200, Hans de Goede wrote:
> Hi Lee,
> 
> On 11-Sep-25 10:15 AM, Lee Jones wrote:
> > On Wed, 10 Sep 2025, Aleksandrs Vinarskis wrote:
> > 
> >> From: Hans de Goede <hansg@kernel.org>
> >>
> >> Add 'name' argument to of_led_get() such that it can lookup LEDs in
> >> devicetree by either name or index.
> >>
> >> And use this modified function to add devicetree support to the generic
> >> (non devicetree specific) [devm_]led_get() function.
> >>
> >> This uses the standard devicetree pattern of adding a -names string array
> >> to map names to the indexes for an array of resources.
> >>
> >> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >> Reviewed-by: Lee Jones <lee@kernel.org>
> > 
> > Remind me why this can't go in through LED again?
> 
> I don't think anyone has discussed how to merge this yet.
> 
> I believe that the LED tree is the correct tree to merge this
> entire series through, once the DT bits have been reviewed.
> 

Unless there are some strong reasons (that I'm failing to spot), we
should merge the DeviceTree binding and implementation through the LED
tree. Then I merge the DTS change through the Qualcomm DT tree once the
bindings are available in linux-next.

Regards,
Bjorn

> Regards,
> 
> Hans
> 
> 
> 
> 
> >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >> Signed-off-by: Hans de Goede <hansg@kernel.org>
> >> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> >> ---
> >>  drivers/leds/led-class.c | 17 +++++++++++++++--
> >>  1 file changed, 15 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> >> index 15633fbf3c166aa4f521774d245f6399a642bced..f3faf37f9a08ac762ed87b91cb3cab5faa8eacb0 100644
> >> --- a/drivers/leds/led-class.c
> >> +++ b/drivers/leds/led-class.c
> >> @@ -252,15 +252,23 @@ static const struct class leds_class = {
> >>   * of_led_get() - request a LED device via the LED framework
> >>   * @np: device node to get the LED device from
> >>   * @index: the index of the LED
> >> + * @name: the name of the LED used to map it to its function, if present
> >>   *
> >>   * Returns the LED device parsed from the phandle specified in the "leds"
> >>   * property of a device tree node or a negative error-code on failure.
> >>   */
> >> -static struct led_classdev *of_led_get(struct device_node *np, int index)
> >> +static struct led_classdev *of_led_get(struct device_node *np, int index,
> >> +				       const char *name)
> >>  {
> >>  	struct device *led_dev;
> >>  	struct device_node *led_node;
> >>  
> >> +	/*
> >> +	 * For named LEDs, first look up the name in the "led-names" property.
> >> +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
> >> +	 */
> >> +	if (name)
> >> +		index = of_property_match_string(np, "led-names", name);
> >>  	led_node = of_parse_phandle(np, "leds", index);
> >>  	if (!led_node)
> >>  		return ERR_PTR(-ENOENT);
> >> @@ -324,7 +332,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
> >>  	if (!dev)
> >>  		return ERR_PTR(-EINVAL);
> >>  
> >> -	led = of_led_get(dev->of_node, index);
> >> +	led = of_led_get(dev->of_node, index, NULL);
> >>  	if (IS_ERR(led))
> >>  		return led;
> >>  
> >> @@ -342,9 +350,14 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
> >>  struct led_classdev *led_get(struct device *dev, char *con_id)
> >>  {
> >>  	struct led_lookup_data *lookup;
> >> +	struct led_classdev *led_cdev;
> >>  	const char *provider = NULL;
> >>  	struct device *led_dev;
> >>  
> >> +	led_cdev = of_led_get(dev->of_node, -1, con_id);
> >> +	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
> >> +		return led_cdev;
> >> +
> >>  	mutex_lock(&leds_lookup_lock);
> >>  	list_for_each_entry(lookup, &leds_lookup_list, list) {
> >>  		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
> >>
> >> -- 
> >> 2.48.1
> >>
> >>
> > 
> 

