Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010597996BE
	for <lists+linux-media@lfdr.de>; Sat,  9 Sep 2023 09:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245662AbjIIHaw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Sep 2023 03:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbjIIHaw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Sep 2023 03:30:52 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACF3E6B
        for <linux-media@vger.kernel.org>; Sat,  9 Sep 2023 00:30:47 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RjPjc5c9xz1M96m;
        Sat,  9 Sep 2023 15:28:52 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 9 Sep 2023 15:30:43 +0800
Message-ID: <d0ea4639-cabf-466a-784f-164040c19faa@huawei.com>
Date:   Sat, 9 Sep 2023 15:30:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v3 2/2] media: cx231xx: Add EP5_BUF_SIZE and
 EP5_TIMEOUT_MS macros
Content-Language: en-US
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        <mchehab@kernel.org>, <linux-media@vger.kernel.org>
References: <20230903081440.1564633-1-ruanjinjie@huawei.com>
 <20230903081440.1564633-3-ruanjinjie@huawei.com>
 <ede17d5c-a727-5308-1cff-8adf2eb090e9@collabora.com>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <ede17d5c-a727-5308-1cff-8adf2eb090e9@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2023/9/8 20:26, Andrzej Pietrasiewicz wrote:
> Hi,
> 
> W dniu 3.09.2023 o 10:14, Jinjie Ruan pisze:
>> Define EP5_BUF_SIZE and EP5_TIMEOUT_MS macros to make the code
>> more readable.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Suggested-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> ---
>> v2:
>> - Adjust the patch to be the second.
>> - Adjust the macro name.
>> ---
>>   drivers/media/usb/cx231xx/cx231xx-core.c | 4 ++--
>>   drivers/media/usb/cx231xx/cx231xx.h      | 3 +++
>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/usb/cx231xx/cx231xx-core.c
>> b/drivers/media/usb/cx231xx/cx231xx-core.c
>> index 746727ea1a4c..57a8b4780a7d 100644
>> --- a/drivers/media/usb/cx231xx/cx231xx-core.c
>> +++ b/drivers/media/usb/cx231xx/cx231xx-core.c
>> @@ -751,12 +751,12 @@ int cx231xx_ep5_bulkout(struct cx231xx *dev, u8
>> *firmware, u16 size)
>>       int ret = -ENOMEM;
>>       u32 *buffer;
>>   -    buffer = kmemdup(firmware, 4096, GFP_KERNEL);
>> +    buffer = kmemdup(firmware, EP5_BUF_SIZE, GFP_KERNEL);
>>       if (buffer == NULL)
>>           return -ENOMEM;
>>         ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, 5),
>> -            buffer, 4096, &actlen, 2000);
>> +            buffer, EP5_BUF_SIZE, &actlen, EP5_TIMEOUT_MS);
>>   
> 
> $ git grep 4096 drivers/media/usb/cx231xx | sort | wc -l
> 6
> 
> 4096 is a pretty popular constant in this driver. What about the other 4
> places?

Thank you! I'll replace them together.

> 
> Andrzej
> 
>>       if (ret)
>>           dev_err(dev->dev,
>> diff --git a/drivers/media/usb/cx231xx/cx231xx.h
>> b/drivers/media/usb/cx231xx/cx231xx.h
>> index 6929e4d97067..74339a6a2f71 100644
>> --- a/drivers/media/usb/cx231xx/cx231xx.h
>> +++ b/drivers/media/usb/cx231xx/cx231xx.h
>> @@ -120,6 +120,9 @@
>>   #define CX23417_OSC_EN   8
>>   #define CX23417_RESET    9
>>   +#define EP5_BUF_SIZE     4096
>> +#define EP5_TIMEOUT_MS   2000
>> +
>>   struct cx23417_fmt {
>>       u32   fourcc;          /* v4l2 format id */
>>       int   depth;
> 
