Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A988B42D8DA
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 14:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhJNMJx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 08:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbhJNMJw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 08:09:52 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60D4C061570;
        Thu, 14 Oct 2021 05:07:47 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id r18so18762223wrg.6;
        Thu, 14 Oct 2021 05:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=W6Zxty0TdB/OI+A6DValHoo/NHUzxQVCkM9LpOB6jTE=;
        b=AWM5ojfdJ9sHreUVwWUja7YsYkONDJSccm4eo/0iNIXY6ZqXb0RkUaDCtHMU+st0pr
         l45Pk9+pHAgoLt97koch9BRFeBaS/mYCHKh7ChgGdekkB/15mJgtkV1MFKdYYVPxeRhu
         q41qH9OqOUGNKJJhsioahcPnV1mIAqBD+CDAFcarJpqHwKUCiwvAXDXHMsj0Nt1/VWPU
         Hntebp2Li6GYaIe6mKwa/ettq3NON8/qk2XTl5uEd9fr+judc9o7aMe/fe4zj7bdQo8e
         e6b3eLilAXyIvlLIILaZ53NJ1WChar7ycO7Knm3cvUUfTaThthFRzsHot0Mnhxjn71gT
         afKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W6Zxty0TdB/OI+A6DValHoo/NHUzxQVCkM9LpOB6jTE=;
        b=HMsOTfdW4f2GeCkcZ+Ddp4bCL6nGZLDK7L8giM0Nfp3Trz9K56Oo4XSXiugbfRXAEQ
         RdfrJd+bGlfOqloYrVNeRmHvSZhdq5Ig6cxBBMMFFoj5FI07ivo1qBiHFmeuZO5K6Xog
         gPBwuSJq2ex89gA4kUi+QUNqp0E6eKvcdIvRDYU0/8AggVbCvskqxFAqKRsg8SEd2Zqy
         tv8X4gv/JqA5Gn2qAIFw5BZw+c6W7H5URRd/1voeCir09yOVSAh+IJchnsISLaXWLmnW
         DMO0uI6/kIN8LlLlmtdbMWLbwATV0b9L9g/65tkDoHugrMob+o2rvszRm/P1n3rCwPUW
         y/3g==
X-Gm-Message-State: AOAM533wf7raLleC4DtrHcxvp+n9HI2I3O0qlto1wjTxmndq3VkUvUnv
        D0aOjfXHYhFCxnAkEywEcFE=
X-Google-Smtp-Source: ABdhPJxS6QV//EaWMcgERrbOt7AbVRlil7E05IFdqAJDF21juWnUFUIiz9j65Si1sNqGaBU5Y2SPKg==
X-Received: by 2002:adf:dc85:: with SMTP id r5mr1934455wrj.164.1634213266365;
        Thu, 14 Oct 2021 05:07:46 -0700 (PDT)
Received: from [192.168.19.53] ([78.32.143.231])
        by smtp.googlemail.com with ESMTPSA id s14sm2207795wro.76.2021.10.14.05.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 05:07:45 -0700 (PDT)
Message-ID: <8d18cba6-1eb0-ae82-a8e2-1c39d694a77f@gmail.com>
Date:   Thu, 14 Oct 2021 13:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v5 3/3] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Content-Language: en-GB
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
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
 <d7e61a3b-f56e-d6b1-cef9-b58aaf694862@gmail.com>
 <20211014110459.GD31981@pengutronix.de>
From:   Ian Arkver <ian.arkver.dev@gmail.com>
In-Reply-To: <20211014110459.GD31981@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/10/2021 12:04, Michael Tretter wrote:
> On Thu, 14 Oct 2021 11:45:25 +0100, Ian Arkver wrote:
>> On 14/10/2021 11:17, Philipp Zabel wrote:
>>> On Thu, 2021-10-14 at 11:34 +0200, Michael Tretter wrote:
>>>> On Wed, 13 Oct 2021 10:05:30 +0200, Michael Tretter wrote:
>>>>> On Tue, 12 Oct 2021 15:27:11 +0200, Philipp Zabel wrote:
>>> [...]
>>>>>>> +static int isl7998x_wait_power_on(struct isl7998x *isl7998x)
>>>>>>> +{
>>>>>>> +	struct device *dev = isl7998x->subdev.dev;
>>>>>>> +	unsigned int retry;
>>>>>>> +	u32 chip_id;
>>>>>>> +	int ret = -ETIMEDOUT;
>>>>>>> +
>>>>>>> +	for (retry = 10; ret && retry > 0; retry--) {
>>>>>>> +		ret = regmap_read(isl7998x->regmap,
>>>>>>> +				  ISL7998x_REG_P0_PRODUCT_ID_CODE, &chip_id);
>>>>>>> +		usleep_range(1000, 2000);
>>>>>>> +	}
>>>>>>
>>>>>> Consider using regmap_read_poll_timeout() here.
>>>>>
>>>>> Ack. I forgot about this function.
>>>>
>>>> regmap_read_poll_timeout() cannot be used here, because it returns if
>>>> regmap_read() returns an error. The driver uses the return value of
>>>> regmap_read() to detect, if the chip is available, and should continue polling
>>>> if regmap_read() failed. I can implement the necessary behavior with
>>>> read_poll_timeout(), but am not sure if it is really worth it.
>>>
>>> Oh, right. I still think so, but your call.
>>>
>> This wait_power_on function seems odd to me. Wouldn't it be better to just
>> wait for the power-on delay specified in the datasheet and then
>> unconditionally go into isl7998x_init? If the device has failed to come up,
>> that init will fail in its regmap accesses. If you're trying to do the init
>> earlier than the datasheet specified time then being able to read the
>> product id code doesn't guarantee the rest of the chip is ready. If there's
>> no datasheet specification maybe just wait 10ms to 20ms?
> 
> The datasheet does not specify the power-on delay. The wait_power_on() enables
> the driver to at least tell the user that the chip was not detected and print
> the exact chip variant if it was detected. I think this is still better than
> waiting some arbitrary time and hoping for the best.

Thanks Michael, I can see how the prints could be useful and I'd 
neglected them before. I see now this is the only place the device ID is 
read and reported.

Regards,
Ian
