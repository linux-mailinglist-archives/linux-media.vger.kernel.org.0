Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9743D42D75E
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhJNKsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhJNKsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:48:10 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B139BC061570;
        Thu, 14 Oct 2021 03:46:05 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r18so18057816wrg.6;
        Thu, 14 Oct 2021 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=N14NrMHqADVUoqhks9bmjBzfguJDwKWn7zOe76nLek8=;
        b=Otll5yWEdVwolOZXnNt8+1+eH+Zs2p52ma6pRRYdzhryXm3L6e9GbNStDZL98DpaOl
         fY5JodzCLyQCNUoDoMUdicmHO5DOF/KgK/4rfFgQl0fL14BFOCh0/TCuLiqr5PyxWb74
         hEfTfo/lQ92Vl9Di6TzGPuBdPRu0JzOUJtFiktWmgqYOJpKAbVRPZnHuN9r/kTpXnF+3
         7wo1RbRCxHkxgvLLJMn/3BhIt7Kaezy0uhNZmKuUsUm2wGlfVBXO/ZsPqMFj10Up9JD/
         CHTdzo2W0+t3T7DNC0XbITJ/Jz0XRDrHXzH8K/O+Zgc29LWh/DPouUeYk/npw1pnS/Wq
         9b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N14NrMHqADVUoqhks9bmjBzfguJDwKWn7zOe76nLek8=;
        b=vRuTzRuZ7pyOEn6/UuT96NLAlAUK/GO2i+poHhMrQzfRuB+A0gNMRUcU6XK3rbVQgT
         AtmPZkfoLIRvvSbHUs2zA2xbEiGzhpI3Q5Z+K62LKyNlAz2aMfNHMgA7x2eAn4zASTnG
         WxCwWrRFr62PLnB227l6naXUa5Dsozh7fj/91Hk1Fh+bIf4KA55j5JlrSObBLwKv+pfv
         Fl9FQeVN7rQmHXMTrsaGUbeFisLkb2DmY8wHDhwgR8BbNMIMyaVWhCZ9vo0XrWysLrdw
         RcsKXtR/6tuIGRKZIC8XapADUqsM9LFbdX0rVi5xB+IsvKpAxd0Z6P6mzUqJ2qn+IS8k
         CZLg==
X-Gm-Message-State: AOAM533OQfuJqKMVZYkxkf+3B0ZK3kXRp5UXqN8DPDANyi/ZIY3c9Dug
        DkEJOwo+57QBYWF2QoPU0LUycLow2wNCsg==
X-Google-Smtp-Source: ABdhPJyW/2iEM+XXOBqU42rcrYh+4vVQ7JdYgo4z+/hUc2ikE1ZHGo82taUdEj7FcosoAC1EiVUiNA==
X-Received: by 2002:a5d:5589:: with SMTP id i9mr5610098wrv.55.1634208364370;
        Thu, 14 Oct 2021 03:46:04 -0700 (PDT)
Received: from [192.168.19.53] ([78.32.143.231])
        by smtp.googlemail.com with ESMTPSA id p17sm2081987wrx.33.2021.10.14.03.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 03:46:03 -0700 (PDT)
Message-ID: <d7e61a3b-f56e-d6b1-cef9-b58aaf694862@gmail.com>
Date:   Thu, 14 Oct 2021 11:45:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v5 3/3] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Content-Language: en-GB
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@pengutronix.de
References: <20211012084150.755160-1-m.tretter@pengutronix.de>
 <20211012084150.755160-4-m.tretter@pengutronix.de>
 <f4fca151a04b1c30fca7b2f40dacb2a3b4b4f2c6.camel@pengutronix.de>
 <20211013080530.GB31981@pengutronix.de>
 <20211014093409.GC31981@pengutronix.de>
 <639592c9ca18232c3372ae33d6e561969b1f69e4.camel@pengutronix.de>
From:   Ian Arkver <ian.arkver.dev@gmail.com>
In-Reply-To: <639592c9ca18232c3372ae33d6e561969b1f69e4.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/10/2021 11:17, Philipp Zabel wrote:
> On Thu, 2021-10-14 at 11:34 +0200, Michael Tretter wrote:
>> On Wed, 13 Oct 2021 10:05:30 +0200, Michael Tretter wrote:
>>> On Tue, 12 Oct 2021 15:27:11 +0200, Philipp Zabel wrote:
> [...]
>>>>> +static int isl7998x_wait_power_on(struct isl7998x *isl7998x)
>>>>> +{
>>>>> +	struct device *dev = isl7998x->subdev.dev;
>>>>> +	unsigned int retry;
>>>>> +	u32 chip_id;
>>>>> +	int ret = -ETIMEDOUT;
>>>>> +
>>>>> +	for (retry = 10; ret && retry > 0; retry--) {
>>>>> +		ret = regmap_read(isl7998x->regmap,
>>>>> +				  ISL7998x_REG_P0_PRODUCT_ID_CODE, &chip_id);
>>>>> +		usleep_range(1000, 2000);
>>>>> +	}
>>>>
>>>> Consider using regmap_read_poll_timeout() here.
>>>
>>> Ack. I forgot about this function.
>>
>> regmap_read_poll_timeout() cannot be used here, because it returns if
>> regmap_read() returns an error. The driver uses the return value of
>> regmap_read() to detect, if the chip is available, and should continue polling
>> if regmap_read() failed. I can implement the necessary behavior with
>> read_poll_timeout(), but am not sure if it is really worth it.
> 
> Oh, right. I still think so, but your call.
> 
> regards
> Philipp
> 

This wait_power_on function seems odd to me. Wouldn't it be better to 
just wait for the power-on delay specified in the datasheet and then 
unconditionally go into isl7998x_init? If the device has failed to come 
up, that init will fail in its regmap accesses. If you're trying to do 
the init earlier than the datasheet specified time then being able to 
read the product id code doesn't guarantee the rest of the chip is 
ready. If there's no datasheet specification maybe just wait 10ms to 20ms?

Regards,
Ian
