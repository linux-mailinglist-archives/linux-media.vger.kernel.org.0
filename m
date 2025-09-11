Return-Path: <linux-media+bounces-42273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C88B52C79
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 11:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 733F316943E
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 09:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B128C2E88AF;
	Thu, 11 Sep 2025 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDeasZne"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098042E6CA8;
	Thu, 11 Sep 2025 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757581268; cv=none; b=XoKMMo/XXSdvP2JXAlrb21QFnDW6iAjtnBe27zjOBS3r9GLD26pXjNu/HJtI1bcf05sxU9kEfQhhHGmLDzJTyjtJmCHBWgvNir+GkJ2VNXtyiu8Jjj8klOwNKQTEUKgJr4ELrH+3yePLUd/JFeZOcagn/Li2yU3NjjXTZAhlYMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757581268; c=relaxed/simple;
	bh=pNuKdyLfyUYn/bu1we4l5xlt7uUHJk0oo7gXbZsMMNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aViUzZliWVUgwzW7+7PdGiRrgz9cfKdZdkqEbHtGXEJ6JZPJ1fyoioVPKY7dyFYrKgiz+HCyJS12a1Z0nPgvIGXCD+UbOq0Pgcr7j5WFCPufjNXtJWWnxnnE43cL0EyUeA8BP8wk7kpo1kd/lYkNJ9VYU2/xLadrgixTWhC4WGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDeasZne; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E701EC4CEF1;
	Thu, 11 Sep 2025 09:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757581267;
	bh=pNuKdyLfyUYn/bu1we4l5xlt7uUHJk0oo7gXbZsMMNI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rDeasZneKS1p3vaalewyHV/LvlnRzBuGKLoBgRN2ZKMYsHggGpTBAsTC3zH8PZuen
	 Qb4ct0SLpt1K+TTsLlUZJBC5RGCBJO8VEfnDDw/3reXrpPcESrNKNudsTKEw5ymZ0t
	 myJwztJA3bU/mhyWhagGzXGrJux53hMaEOex9zSawJExxT9fvmJ/aZFvyCncTmha+4
	 Dv6wWBb/UctP/RjjZYI/rWYJXv7KtFzo8TigwS5YvZZfdAEBcoMB7lDdLKVujgVP6b
	 k6+bXrmIW4kQflN05eB0dCFofMs3ZyKhdicfCnfcU6WBL/Np6i6z0YAlz7lrAyK6vp
	 aRmj75i/dd3sQ==
Message-ID: <b875f811-6371-4ff4-9cc2-a0a2c82a569c@kernel.org>
Date: Thu, 11 Sep 2025 11:01:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
To: Lee Jones <lee@kernel.org>, Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Daniel Thompson
 <danielt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, threeway@gmail.com,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
 <20250911081540.GD9224@google.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250911081540.GD9224@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Lee,

On 11-Sep-25 10:15 AM, Lee Jones wrote:
> On Wed, 10 Sep 2025, Aleksandrs Vinarskis wrote:
> 
>> From: Hans de Goede <hansg@kernel.org>
>>
>> Add 'name' argument to of_led_get() such that it can lookup LEDs in
>> devicetree by either name or index.
>>
>> And use this modified function to add devicetree support to the generic
>> (non devicetree specific) [devm_]led_get() function.
>>
>> This uses the standard devicetree pattern of adding a -names string array
>> to map names to the indexes for an array of resources.
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Reviewed-by: Lee Jones <lee@kernel.org>
> 
> Remind me why this can't go in through LED again?

I don't think anyone has discussed how to merge this yet.

I believe that the LED tree is the correct tree to merge this
entire series through, once the DT bits have been reviewed.

Regards,

Hans




>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>> ---
>>  drivers/leds/led-class.c | 17 +++++++++++++++--
>>  1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index 15633fbf3c166aa4f521774d245f6399a642bced..f3faf37f9a08ac762ed87b91cb3cab5faa8eacb0 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -252,15 +252,23 @@ static const struct class leds_class = {
>>   * of_led_get() - request a LED device via the LED framework
>>   * @np: device node to get the LED device from
>>   * @index: the index of the LED
>> + * @name: the name of the LED used to map it to its function, if present
>>   *
>>   * Returns the LED device parsed from the phandle specified in the "leds"
>>   * property of a device tree node or a negative error-code on failure.
>>   */
>> -static struct led_classdev *of_led_get(struct device_node *np, int index)
>> +static struct led_classdev *of_led_get(struct device_node *np, int index,
>> +				       const char *name)
>>  {
>>  	struct device *led_dev;
>>  	struct device_node *led_node;
>>  
>> +	/*
>> +	 * For named LEDs, first look up the name in the "led-names" property.
>> +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
>> +	 */
>> +	if (name)
>> +		index = of_property_match_string(np, "led-names", name);
>>  	led_node = of_parse_phandle(np, "leds", index);
>>  	if (!led_node)
>>  		return ERR_PTR(-ENOENT);
>> @@ -324,7 +332,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
>>  	if (!dev)
>>  		return ERR_PTR(-EINVAL);
>>  
>> -	led = of_led_get(dev->of_node, index);
>> +	led = of_led_get(dev->of_node, index, NULL);
>>  	if (IS_ERR(led))
>>  		return led;
>>  
>> @@ -342,9 +350,14 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
>>  struct led_classdev *led_get(struct device *dev, char *con_id)
>>  {
>>  	struct led_lookup_data *lookup;
>> +	struct led_classdev *led_cdev;
>>  	const char *provider = NULL;
>>  	struct device *led_dev;
>>  
>> +	led_cdev = of_led_get(dev->of_node, -1, con_id);
>> +	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
>> +		return led_cdev;
>> +
>>  	mutex_lock(&leds_lookup_lock);
>>  	list_for_each_entry(lookup, &leds_lookup_list, list) {
>>  		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
>>
>> -- 
>> 2.48.1
>>
>>
> 


