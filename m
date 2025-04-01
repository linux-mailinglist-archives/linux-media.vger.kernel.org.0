Return-Path: <linux-media+bounces-29106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B445CA775F7
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 10:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 767173A9A2F
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 08:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAB51E9B09;
	Tue,  1 Apr 2025 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdOHWxd/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839551E9B00
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495084; cv=none; b=ZRAPIFKMtt+njd+e4c9BPQ0jD2qOADmLSE15k9Rc5KFZ2UIWjGQctsBMzksKnxoEpADU7/IJhq4csqCERcxx41QjhyFoK/40znbAKQBdskQrjm0M1JeDdJ9DDkiboPzjVITTH3QxulR5y08UBI6mMoXdTaB0HDeEzZKmA/O+V8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495084; c=relaxed/simple;
	bh=n2ClBnHTZtWO5lfvvSeHkkzpcz663Gs46olTJ4XhAlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3dOhdyBKI+gSID2uIKIWfWVyoq8Y7JYTMdhbDxkflX+PufMGtv81EJI5PhNYTMZKhfdUj0vv3Xl1Ahj6RLevFD6YeKgY8IVe1SUteWTUEFhwxVtz5UJS9L66048AZMTAB+iMyQlxj6gbfywjwsZTuQ+PsX7MHt0mGHeBbRoGX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wdOHWxd/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1efc4577so665020f8f.0
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743495081; x=1744099881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rsD3TWqv5lI3YT3cV7nlJbulMfpLE7fhwvZxG5FW/Qw=;
        b=wdOHWxd/z2MUxbaFciRvaXt1jHFRSJ3R3NopgOzLOmPbt0hXJq/PHobW9haaTfJDTY
         xmXAtp1XAnwR3wDSOMwJm+JXLLC4m1SkCNdgbX7b7Bh2b6syaD48BT979Dq6Skr2R0am
         MaTtC2iVPK/GlSTCrmiP1aKJKqD0hmpVUo/G7ePgcr1GvS2uH1btUcEi72HGMDaITH+P
         mEJ3r+ozVE/0RgHsW4MX8FYT8ndOuh+MI3ckBx2pOkjbCDQWHbhuYc4z+wDgU/2bnSJT
         QZw7bKhJuyU67ATRJ8co9y9Sdk1t43otxZiwwmmvAM4M4qOCeqEn1vU6xQL9Omipz92z
         H0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495081; x=1744099881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rsD3TWqv5lI3YT3cV7nlJbulMfpLE7fhwvZxG5FW/Qw=;
        b=FSDP72bi4JrjcnRMOJVR0rA5S9WbEcqCuDmp1+ErY09LDR+trotNjmAAdAFTsQ5lw8
         a3JjZ18VCsH7O/11dSmbbFBlofrUa1SM0ZMuIfLFgOxHwXd3/ZA/vBqmKMjglalcUTLQ
         1NR5oA6iTtsVkN+HtVfUTnICxejSN6ELE9fdyVYIMrnXq/iyxAk7v+WavXhHsF5ENiwQ
         OhrC+7vkVGQu2xoJc+WWERYGuDCReJ+7HlMdCbtBhoMBcu0FWQkS5arLsoCR6C/FJHuA
         H42zhDgvPtlrCPo0Zm0oSNP0z7Z1g+u2EaBRGMeWXK7/Ipr+dnGGw9kTWgCU/t4vc3c0
         gAVw==
X-Forwarded-Encrypted: i=1; AJvYcCXURgh8U1yAj7j0GoXe8PbeBKK0cu3nip6mXl4STvj/SDQmoIp7p0orL8hComS2sFML51UpF+3sS1ytFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv1O7gaIlmEBdgM0m1onIyt2qaML70r88r4a+ChlLxUlkgIBIE
	WVP9kTiPI9RFBWJRdAz0CYuqk1itboat8iK3BC9ETCN61zrL5wYWaP/d5UXNBL8=
X-Gm-Gg: ASbGncuWP05ErZErop45KXRMlJ5lswioP9u+l/T4Z0h73Ip20IlEI2XSC+ZvF91Xs8T
	OFRA6Ucg+/lyDCCpQBL50SqpgVF2GT2d6y8MqL0kvklYd03KMPPTJN35rw9GsRu/sjNJyf9WoNH
	5VYJYle0dX/D0Dqiqx4qG2N2xw/MriEUWcrzIF9SbrIcUCWPfPfvZDsfJLYWcjeckxL7sUEiYrP
	msmdLIwRxXt0Zbch3N45I7XGJ+K8BYqXzvK3HzVPhL6P2AL1lO9k+cVXIR3pNVKKgRjg9bk4GG6
	EnU8SgCK6zCx3LtXaJ31+YLDZB45gb7GL7q2kmLzz/AGzLLySsK90OHmDV4E/DOhyVs2h3oj2jE
	3YWdZ8b6RrQ==
X-Google-Smtp-Source: AGHT+IGZ7cTHQ8x8ZuxM2ffz5Nu6C1BTyLJiaCQ9NlcrCrWqipxpYhALfq475aDDaDXk0ghC5/1j7Q==
X-Received: by 2002:a05:6000:400d:b0:39c:dfa:e1bb with SMTP id ffacd0b85a97d-39c2366a843mr1573087f8f.42.1743495080620;
        Tue, 01 Apr 2025 01:11:20 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0dcc66a4sm12395938f8f.42.2025.04.01.01.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:11:20 -0700 (PDT)
Message-ID: <55e070e6-4f01-4db1-bbe8-f8ebc6abd6c1@linaro.org>
Date: Tue, 1 Apr 2025 09:11:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ov02e10: add OV02E10 image sensor
 driver
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Jingjing Xiong <jingjing.xiong@intel.com>,
 Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
 You-Sheng Yang <vicamo.yang@canonical.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
 <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>
 <Z-UAFkshOgeytfB4@kekkonen.localdomain>
 <47dd7daa-cce4-4ad0-ab57-4c76304b0aa6@linaro.org>
 <9c6cb27d-dd9c-4cb5-bd84-5b11ae099778@rowland.harvard.edu>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9c6cb27d-dd9c-4cb5-bd84-5b11ae099778@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 03:35, Alan Stern wrote:
> On Tue, Apr 01, 2025 at 01:34:29AM +0100, Bryan O'Donoghue wrote:
>> On 27/03/2025 07:36, Sakari Ailus wrote:
>>>> +static u64 to_pixel_rate(u32 f_index)
>>>> +{
>>>> +	u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OV02E10_DATA_LANES;
>>>> +
>>>> +	do_div(pixel_rate, OV02E10_RGB_DEPTH);
>>> The pixel rate control is for the pixel rate on the pixel array, not on the
>>> CSI-2 interface. Without binning or sub-sampling these may the same still,
>>> but this only works in special cases really.
>>
>> Hmm computer says no, I don't think I have understood this comment..
>>
>> Looking at other drivers, I'd say the above pattern is pretty common -
>> taking ov8856 as an example that's pretty much equivalent logic to the
>> above, ov08x40 does something similar.
>>
>> =>
>>
>> pixel_rate == link_freq * 2 * #oflanes / RGB_DEPTH
>>             => 360MHz * 2 * 2 / 10
>>             => 360000000 * 2 * 2 / 10
>>             => 144000000
>>
>> If I'm understanding you though you mean the pixel rate for the control
>> V4L2_CID_PIXEL_RATE expressed here should be the resolution * the FPS /
>> bits_per_pixel
>>
>> pixel_rate = wdith x height x fps / bpp
>>             => 1928 * 1088 * 30 / 10
>>             => 6292992
>>
>> i.e. the pixel rate not related to the CSI2 link frequency ?
> 
> I know practically nothing about this stuff, but even I can see that this
> suggestion doesn't make sense:
> 
> 	width x height = pixels per frame;
> 	pixels per frame x fps = pixels per second;
> 	pixels per second / bits per pixel = pixels^2 / (bits x seconds)
> 
> which is meaningless.  If the division were replaced with a
> multiplication this would become:
> 
> 	pixels per second x bits per pixel = bits per second
> 
> which at least is reasonable.
> 
> Alan

TBH Perplexity.ai gave me that answer, my question is still are we 
saying the upstream examples are wrong here or have I just not 
understood the original comment ?

---
bod


