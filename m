Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833465BA3C6
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 03:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiIPBNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 21:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiIPBNU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 21:13:20 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB18187094
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 18:13:17 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MTGDq5rL4zlVwV;
        Fri, 16 Sep 2022 09:09:15 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 16 Sep 2022 09:13:15 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 16 Sep 2022 09:13:15 +0800
Subject: Re: [PATCH -next 10/13] media: rc: gpio-ir-recv: Switch to use
 dev_err_probe() helper
To:     Sean Young <sean@mess.org>
CC:     <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <pavel@ucw.cz>,
        <sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-11-yangyingliang@huawei.com>
 <YyNVG1EZ0anbDf0R@gofer.mess.org>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <a56a9638-5a1f-4cbe-cf30-baae03b104c3@huawei.com>
Date:   Fri, 16 Sep 2022 09:13:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YyNVG1EZ0anbDf0R@gofer.mess.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2022/9/16 0:38, Sean Young wrote:
> On Thu, Sep 15, 2022 at 11:03:21PM +0800, Yang Yingliang wrote:
>> In the probe path, dev_err() can be replace with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER.
>>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/media/rc/gpio-ir-recv.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
>> index 22e524b69806..8f1fff7af6c9 100644
>> --- a/drivers/media/rc/gpio-ir-recv.c
>> +++ b/drivers/media/rc/gpio-ir-recv.c
>> @@ -74,13 +74,9 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
>>   		return -ENOMEM;
>>   
>>   	gpio_dev->gpiod = devm_gpiod_get(dev, NULL, GPIOD_IN);
>> -	if (IS_ERR(gpio_dev->gpiod)) {
>> -		rc = PTR_ERR(gpio_dev->gpiod);
>> -		/* Just try again if this happens */
>> -		if (rc != -EPROBE_DEFER)
>> -			dev_err(dev, "error getting gpio (%d)\n", rc);
>> -		return rc;
>> -	}
>> +	if (IS_ERR(gpio_dev->gpiod))
>> +		return dev_err_probe(dev, PTR_ERR(gpio_dev->gpiod),
>> +				     "error getting gpio\n");
> Now the error number is no longer logged. That can't be good?
Instead of error number, the error name is printed in dev_err_probe(), 
and  it's better for read.

Thanks,
Yang
>
>
> Sean
>
>>   	gpio_dev->irq = gpiod_to_irq(gpio_dev->gpiod);
>>   	if (gpio_dev->irq < 0)
>>   		return gpio_dev->irq;
>> -- 
>> 2.25.1
> .
