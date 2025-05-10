Return-Path: <linux-media+bounces-32223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 925BCAB241B
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 16:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F3A73BEA1C
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 14:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4292229B18;
	Sat, 10 May 2025 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HuVJujhL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA6C229B13
	for <linux-media@vger.kernel.org>; Sat, 10 May 2025 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746885726; cv=none; b=oQRkVQ/R3PjTN/SmxkB7W5R0jT6TMdck9dJukggB8O9Em/T8mXYqnoWyWggr/6F5iiN2k8XoMsoT4wftX1lxBZ75si4wnhzWTY20ispvfXWbEerIHkDR9ODpygnHxgJ6XN2WLAdos2sxnmhXcGcGwlu/wd2CiGl5B73EnH2IYvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746885726; c=relaxed/simple;
	bh=d4Ub70OFlqHqvUlsg3KKXEncnFjhszyL9GtoI89817A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e52wJ4tsMYpdr0YHji+ASgMfkxXg9jNt37AYNiyvEsni28HWkwRPSowdAhn2R9N7VxkWS7HQa3eE6ilLc0tRSUaWZPpVbLX02zPnk3fbu0sTnuLjg/Wg0VJSEjMaIHNU9unniJwsChDRvwGicJplRcJ4tFJpNOu9k0OFCwalBKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HuVJujhL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746885722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQbyaQkX6PpNkqLOzCNp2QjvJqppJQaY2k5wLR21NbY=;
	b=HuVJujhL0sDSkw6/9TZnBpA1ReXYLFa+JLhybSGfMd+/OexyBPyjJUH7W8kvrAU2KizIOW
	KZe2DgDfUvSAm7uvwcNOqgSQeX70U2wRqmgXqcJDLJdIJHQVTl0TShkciBz84y+j9UbI7z
	V2I+Fj8ib0JS6WFwRj7wa2ATNe4Cd0o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-pP1KAYdpPW66jYnDCdOC4A-1; Sat, 10 May 2025 10:02:01 -0400
X-MC-Unique: pP1KAYdpPW66jYnDCdOC4A-1
X-Mimecast-MFC-AGG-ID: pP1KAYdpPW66jYnDCdOC4A_1746885720
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5f92fc82c4cso2503552a12.1
        for <linux-media@vger.kernel.org>; Sat, 10 May 2025 07:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746885720; x=1747490520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQbyaQkX6PpNkqLOzCNp2QjvJqppJQaY2k5wLR21NbY=;
        b=CDqte01CawW8FUwNR7H0jpYkKTqNn5nEloiEJVlprGtK3J9XIyQHuknOvzCjvhyUHq
         apN+eYnvC7QqN3DQRtrhprVIw2XZY5E6L7lI/R8o80Bvce1k8QYD4WXXS/Z4GRbRK8Jd
         hbh7F52TA3y1s2oCT5IqezEETxflmhhQI52RtvUnZkBZHz3s6BnMS3t60cKi2oPSeLTW
         LXAsR5FYCXoK2hCKX4qsDwvmkFKJDOGpsG0iy3PJaUxOZXWYuVSjRMYdHA17xxNx8xr6
         ME8XgKr6kf4GGkwnNEuqR+aL2kxlV4lccG48IVb9zowW81A7YqKWQXi9k/rTkj3xehCx
         t/2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1bgOjuX55g61zC8sdKZY/JjMOgaNBNYve5//FKBcn2Tq4QNi6T1ZPiRCbLV4ICKV0Qa94KOLjB5f3/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJNerMyiO0OXrhp8AHBkJKlMQqK1gYXsxsO48qU0yTmTIl944S
	6NUlVfc9ulzr206G4/cNlk9Rj+fzKSKl7GQaszf1ndB9LS06b5dTSWLI7d9mINzoXnbgionRV5m
	5/geskzxrNxNbHa8aRL4ssnl7/y3yI6wS4DJ9b4FCbuxpi3qNXr1rbzB7eIA9
X-Gm-Gg: ASbGncslyozKQdoR4h6Gz5yvRoQPbVtZqmN5RVkS2pL4cl0oArv3euwA/6bUwh+IiJv
	PcKdif6yDt4D0Sm/fI6x2nRAhFEbib6RF9oWPiyF1ypc8TFtWInm6s6tEeaeuLRuUXtvNUFsm1i
	q+S+l/rToREgOybMnefpSXUPpGtw7u+faKTCimrGS7wUt/yD3cZF4YSSJmpSeZ+kyZnHqqcY37E
	hf/I8FSuXTSp1qcub5sg4NNG8ZnTXgYGqop8q4ZxeDr3lanMZ4jVOszfm5PoaxW/N1Bcc3nPCrV
	jY+IIhZLqryY8VgMaob8LHhjifGlZZHBBSCAchHVUEiWPnijZK/26tSe3ISMaYbGqSSYKan1i5v
	Iok8qaFK2+6sC9npaFfgZer+FsAL+Fu7ki0UXu/AvU7b2ubwKHqx4hPJviVBC9g==
X-Received: by 2002:a05:6402:2389:b0:5fc:aa26:a12 with SMTP id 4fb4d7f45d1cf-5fcaa260db7mr3205966a12.23.1746885719916;
        Sat, 10 May 2025 07:01:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFdi6bV+5wK0pIoKPBwkc8M9fjGwp45eXF12XJvzh6wRUDGi6iWzddz3a3olIT7XT6Q6x+qg==
X-Received: by 2002:a05:6402:2389:b0:5fc:aa26:a12 with SMTP id 4fb4d7f45d1cf-5fcaa260db7mr3205934a12.23.1746885719419;
        Sat, 10 May 2025 07:01:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d700e56sm2914173a12.57.2025.05.10.07.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 07:01:58 -0700 (PDT)
Message-ID: <b157ec36-09d7-4faf-a2ae-f39c0633d4ff@redhat.com>
Date: Sat, 10 May 2025 16:01:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] media: mt9m114: Add support for clock-frequency
 property
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-3-hdegoede@redhat.com>
 <20250509185147.GB19001@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250509185147.GB19001@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9-May-25 8:51 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Sun, May 04, 2025 at 12:13:23PM +0200, Hans de Goede wrote:
>> Add support for platforms that do not have a clock provider, but instead
>> specify the clock frequency by using the "clock-frequency" property.
>>
>> E.g. ACPI platforms turn the clock on/off through ACPI power-resources
>> depending on the runtime-pm state, so there is no clock provider.
> 
> https://lore.kernel.org/r/20250321130329.342236-1-mehdi.djait@linux.intel.com
> is a solution to this problem that will scale better.

I agree. Depending on how the timing wrt upstreaming works out,
we may still need this patch before merging 13/13 (adding of
the actual ACPI hw-id table). I'll move this to be patch 12/13
for v2. So that we can at least merge 1-11 of v2 (assuming there
will be no more review comments on v2).

Laurent, if the patch you linked to is not ready yet would you
then be ok with temporarily taking this patch? I'm happy to commit
to moving this driver over to the new helper once the helper is
upstream.

Regards,

Hans



> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/mt9m114.c | 20 ++++++++++++++++----
>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
>> index 5f0b0ad8f885..be1d2ec64b89 100644
>> --- a/drivers/media/i2c/mt9m114.c
>> +++ b/drivers/media/i2c/mt9m114.c
>> @@ -377,6 +377,7 @@ struct mt9m114 {
>>  	struct gpio_desc *reset;
>>  	struct regulator_bulk_data supplies[3];
>>  	struct v4l2_fwnode_endpoint bus_cfg;
>> +	u32 clk_freq;
>>  
>>  	struct {
>>  		unsigned int m;
>> @@ -2122,14 +2123,13 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
>>  
>>  	/* Perform a hard reset if available, or a soft reset otherwise. */
>>  	if (sensor->reset) {
>> -		long freq = clk_get_rate(sensor->clk);
>>  		unsigned int duration;
>>  
>>  		/*
>>  		 * The minimum duration is 50 clock cycles, thus typically
>>  		 * around 2µs. Double it to be safe.
>>  		 */
>> -		duration = DIV_ROUND_UP(2 * 50 * 1000000, freq);
>> +		duration = DIV_ROUND_UP(2 * 50 * 1000000, sensor->clk_freq);
>>  
>>  		gpiod_set_value(sensor->reset, 1);
>>  		fsleep(duration);
>> @@ -2249,7 +2249,7 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
>>  	 * for 16-bit per pixel, transmitted in DDR over a single lane. For
>>  	 * parallel mode, the sensor ouputs one pixel in two PIXCLK cycles.
>>  	 */
>> -	sensor->pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
>> +	sensor->pixrate = sensor->clk_freq * sensor->pll.m
>>  			/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
>>  
>>  	link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
>> @@ -2360,13 +2360,25 @@ static int mt9m114_probe(struct i2c_client *client)
>>  		return ret;
>>  
>>  	/* Acquire clocks, GPIOs and regulators. */
>> -	sensor->clk = devm_clk_get(dev, NULL);
>> +	sensor->clk = devm_clk_get_optional(dev, NULL);
>>  	if (IS_ERR(sensor->clk)) {
>>  		ret = PTR_ERR(sensor->clk);
>>  		dev_err_probe(dev, ret, "Failed to get clock\n");
>>  		goto error_ep_free;
>>  	}
>>  
>> +	if (sensor->clk) {
>> +		sensor->clk_freq = clk_get_rate(sensor->clk);
>> +	} else {
>> +		ret = fwnode_property_read_u32(dev_fwnode(dev),
>> +					       "clock-frequency",
>> +					       &sensor->clk_freq);
>> +		if (ret) {
>> +			dev_err_probe(dev, ret, "Failed to read clock-freq\n");
>> +			goto error_ep_free;
>> +		}
>> +	}
>> +
>>  	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>>  	if (IS_ERR(sensor->reset)) {
>>  		ret = PTR_ERR(sensor->reset);
> 


