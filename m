Return-Path: <linux-media+bounces-23913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6379F9389
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44E8C18896D1
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A3D2156E2;
	Fri, 20 Dec 2024 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jB4FK/rP"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9702419DF99
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702468; cv=none; b=dF8XxNnpIrQLeTIBuJXfxS4laFwC2pBPNzHsZE2LdiYK1iplOWAsx2C0nFkDZg4+V54D8rp1KYX5A581nMMxXyAsqEeH8MeYZCgFrQd4+uSni85cSvf0Cw/RsrCOo1kp7WkGEWH/f5wYcOtgL3PAJkKULn9G2NGjby7wf3xVInw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702468; c=relaxed/simple;
	bh=mRbwuyvNkilVyNTLrDgx/IioK686L2UNVGxljrCStB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpMEswNcfHgf313+YDMMBef0krNoOq+r+6sR0KDjhgdaYpNcLYGZ12TPm3yViPk1Udk0FjnBnnucfs6pmLu6nw8nQdzn2ppsVQor41GWFGXCmYgPawBtEa+M5lBET+WR8p9Uoy5jS05CS6cXW0bwfLxgeG4bXMU0a5S8z/Z6zQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jB4FK/rP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734702465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qSIN7YlEAWjWDErbIlvvyFosJ70ZGWQZteXhY6qeZJo=;
	b=jB4FK/rPce3+VIgBNqHXfvQFweJsT5a8wn/ADLy886YX+aorXTn5YOVHtvF7zuzX5FlbgU
	hJvsZMR24o223IXNv9kipHSKfZBdTUi1SYDtn46JzE+1fL60YtwQfgNwUTTwGki38qwpaJ
	8O0sdBMupzdxXIV9FJN1c6sLbvaynTg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-WoiYji1CN2KGEBFzSto6Aw-1; Fri, 20 Dec 2024 08:47:44 -0500
X-MC-Unique: WoiYji1CN2KGEBFzSto6Aw-1
X-Mimecast-MFC-AGG-ID: WoiYji1CN2KGEBFzSto6Aw
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa6a831f93cso193295866b.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 05:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702462; x=1735307262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSIN7YlEAWjWDErbIlvvyFosJ70ZGWQZteXhY6qeZJo=;
        b=u3f2zTa9m3zUOJcytQmtLxOXIIwvImdmFJQeUOSSD+BbAYevd4Wf8ml1bsYcMPbLoQ
         ihJ94aQvTYxwdbR7C4GNJop1UCMqIJcyX3PxEQqiM/wiAaXLNE6xFJ1FBRB0Jrsib2TV
         nmdshhqi9mZnPhL5xfvsZr09nChgNv4tHMhygE1INfdBhgotMaeN8klrL51CsYGZDphD
         OYuzi5ZxW9rgWsEOGCG0e2do8zGEbXodf02jfitzWn5n9aDKNEdfBoMCJldPzrMXkgTl
         lDwpX0outUZj/ret1euGWZxl68xgWEmfHPM0ZRedKh7wTCzIqKndUHB4QjDrqlJT5n4+
         g6+w==
X-Forwarded-Encrypted: i=1; AJvYcCWXfiJuA7Sx+OGYGZe34N/JcYWba7AR+rFJjl3gkRqEE3/Fb4BLNgHoJ1S5yYMrdz1AthJwOwTyUeZ5Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPKv3MBTOzxl+yoITrl94QTcTPYQQVeHHL3lgOnsY7Xct4FBqS
	iaZbsU6dkrp08AZejBSclycHwyocfsMwekl8VNXv4mGjRt72Rca9L7tjPdifV7H8fAoCGWnCemL
	M5DpFDChfj+kb5+CuIBUaRhTNEwwENfsZiUXTbANB1phQydAIzSyYA+cxiB43
X-Gm-Gg: ASbGncsIKUCUOWx4M4Ma3stl4kd1xBZlp9Ts1HaPx/zPQyW/y+J2LqtKYqqBmzmcdR2
	PYZv6WHbnws7sRmkVwVuJDEs37KT+YsSLOAoOGD0HjX42+o0s1/Lyi9RU7wCWZwTq+uht51mumz
	TfvNFrDWh4nQ9M3COyog6tHbmLkIrWj03swA5VLHDWgQkHL8ULsheiqkMb6BGxcVnPuzUi4FWfd
	tykPno4oNT57+E+sIWTQIyzVGGGCBdV3yyu628vvBgIIWrSpON6OerT3mlqEQQqUztIzDbB9+N6
	hMjc4QbHkYFFRRKtaJOqOLFc/e9HTZr/IQTXWulRSXvwwk1pJTxQvdw+s39JSwXDyAqSUF8fbBY
	yVHHBh1kSzL3wMmzZ85PL+55GFZu+McM=
X-Received: by 2002:a17:906:4795:b0:aa6:ab70:4a78 with SMTP id a640c23a62f3a-aac3355ea10mr206389066b.37.1734702461853;
        Fri, 20 Dec 2024 05:47:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtcrjovfagQUUaKGRC8NZbdRs7SJigrxCJ+w7zSBtARba9mryTAgVG4OnJ/eKWCyRwiMU/Mw==
X-Received: by 2002:a17:906:4795:b0:aa6:ab70:4a78 with SMTP id a640c23a62f3a-aac3355ea10mr206386866b.37.1734702461499;
        Fri, 20 Dec 2024 05:47:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f5c4sm178149966b.30.2024.12.20.05.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 05:47:41 -0800 (PST)
Message-ID: <e3573352-f73e-43f5-8e21-6c313dc54057@redhat.com>
Date: Fri, 20 Dec 2024 14:47:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: ov08x40: Properly turn sensor on/off when
 runtime-suspended
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-2-hdegoede@redhat.com>
 <a2efc7e7-6e73-41b0-b8df-ae28175d7dda@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a2efc7e7-6e73-41b0-b8df-ae28175d7dda@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 20-Dec-24 1:32 PM, Bryan O'Donoghue wrote:
> On 19/12/2024 13:49, Hans de Goede wrote:
>> Commit df1ae2251a50 ("media: ov08x40: Add OF probe support") added support
>> for a reset GPIO, regulators and a clk provider controlled through new
>> ov08x40_power_off() and ov08x40_power_on() functions.
>>
>> But it missed adding a pm ops structure to call these functions on
>> runtime suspend/resume. Add the missing pm ops and only call
>> ov08x40_power_off() on remove() when not already runtime-suspended
>> to avoid unbalanced regulator / clock disable calls.
>>
>> Fixes: df1ae2251a50 ("media: ov08x40: Add OF probe support")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/media/i2c/ov08x40.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
>> index b9682264e2f5..aae923da1e86 100644
>> --- a/drivers/media/i2c/ov08x40.c
>> +++ b/drivers/media/i2c/ov08x40.c
>> @@ -2324,11 +2324,14 @@ static void ov08x40_remove(struct i2c_client *client)
>>       ov08x40_free_controls(ov08x);
>>         pm_runtime_disable(&client->dev);
>> +    if (!pm_runtime_status_suspended(&client->dev))
>> +        ov08x40_power_off(&client->dev);
>>       pm_runtime_set_suspended(&client->dev);
>> -
>> -    ov08x40_power_off(&client->dev);
>>   }
>>   +static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_on,
>> +                 ov08x40_power_off, NULL);
>> +

Ugh I have on/off swapped here, second argument of the macro is the suspend
function so that should be ov08x40_power_off. IOW this should be:

static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_off,
				 ov08x40_power_on, NULL);

Can you give this a try with that change?

Regards,

Hans





>>   #ifdef CONFIG_ACPI
>>   static const struct acpi_device_id ov08x40_acpi_ids[] = {
>>       {"OVTI08F4"},
>> @@ -2349,6 +2352,7 @@ static struct i2c_driver ov08x40_i2c_driver = {
>>           .name = "ov08x40",
>>           .acpi_match_table = ACPI_PTR(ov08x40_acpi_ids),
>>           .of_match_table = ov08x40_of_match,
>> +        .pm = pm_sleep_ptr(&ov08x40_pm_ops),
>>       },
>>       .probe = ov08x40_probe,
>>       .remove = ov08x40_remove,
> 
> Here's a trace of what I'm finding on the qcom crd with this patch.
> 
> [    4.383434] ov08x40 1-0036: ov08x40_power_on
> [    4.393299] ov08x40 1-0036: ov08x40_power_on
> [   10.119144] ov08x40 1-0036: ov08x40_set_stream
> [   10.127842] ov08x40 1-0036: ov08x40_set_stream do pm_runtime_resume_and_get
> [   10.135067] ov08x40 1-0036: ov08x40_power_off
> [   10.139608] ov08x40 1-0036: ov08x40_start_streaming
> [   10.150832] ov08x40 1-0036: ov08x40_start_streaming failed to set powerup registers
> [   10.165625] ov08x40 1-0036: ov08x40_power_on
> 
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index 579b4aa5f041d..c1dead0ca0756 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -1321,7 +1321,7 @@ static int ov08x40_power_on(struct device *dev)
>         struct v4l2_subdev *sd = dev_get_drvdata(dev);
>         struct ov08x40 *ov08x = to_ov08x40(sd);
>         int ret;
> -
> +dev_info(dev, "%s\n", __func__);
>         ret = clk_prepare_enable(ov08x->xvclk);
>         if (ret < 0) {
>                 dev_err(dev, "failed to enable xvclk\n");
> @@ -1356,6 +1356,8 @@ static int ov08x40_power_off(struct device *dev)
>         struct v4l2_subdev *sd = dev_get_drvdata(dev);
>         struct ov08x40 *ov08x = to_ov08x40(sd);
> 
> +dev_info(dev, "%s\n", __func__);
> +
>         if (ov08x->reset_gpio)
>                 gpiod_set_value_cansleep(ov08x->reset_gpio, 1);
> 
> @@ -1874,6 +1876,8 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
>         const struct ov08x40_reg_list *reg_list;
>         int ret, link_freq_index;
> 
> +dev_info(&client->dev, "%s\n", __func__);
> +
>         /* Get out of from software reset */
>         ret = ov08x40_write_reg(ov08x, OV08X40_REG_SOFTWARE_RST,
>                                 OV08X40_REG_VALUE_08BIT, OV08X40_SOFTWARE_RST);
> @@ -1967,9 +1971,11 @@ static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
>         struct i2c_client *client = v4l2_get_subdevdata(sd);
>         int ret = 0;
> 
> +dev_info(&client->dev, "%s\n", __func__);
>         mutex_lock(&ov08x->mutex);
> 
>         if (enable) {
> +               dev_info(&client->dev, "%s do pm_runtime_resume_and_get\n", __func__);
>                 ret = pm_runtime_resume_and_get(&client->dev);
>                 if (ret < 0)
>                         goto err_unlock;
> 


