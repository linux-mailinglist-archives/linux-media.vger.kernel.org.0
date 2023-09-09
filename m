Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 579897996BD
	for <lists+linux-media@lfdr.de>; Sat,  9 Sep 2023 09:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245641AbjIIH3o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Sep 2023 03:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbjIIH3o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Sep 2023 03:29:44 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BB0E6B
        for <linux-media@vger.kernel.org>; Sat,  9 Sep 2023 00:29:39 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RjPhL1ZNyz1M8ZZ;
        Sat,  9 Sep 2023 15:27:46 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 9 Sep 2023 15:29:37 +0800
Message-ID: <c6fa8dc4-6af5-6bb9-bf60-8240adb3dd88@huawei.com>
Date:   Sat, 9 Sep 2023 15:29:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v3 1/2] media: cx231xx: Switch to use kmemdup()
 helper
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        <mchehab@kernel.org>, <linux-media@vger.kernel.org>
References: <20230903081440.1564633-1-ruanjinjie@huawei.com>
 <20230903081440.1564633-2-ruanjinjie@huawei.com>
 <fe386ce3-c1ee-2940-059a-a8705d200d01@collabora.com>
Content-Language: en-US
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <fe386ce3-c1ee-2940-059a-a8705d200d01@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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



On 2023/9/8 20:19, Andrzej Pietrasiewicz wrote:
> Hi,
> 
> W dniu 3.09.2023 o 10:14, Jinjie Ruan pisze:
>> Use kmemdup() helper instead of open-coding to
>> simplify the code.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> I have already reviewed this before, you can add my
> 
> Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Thank you very much!

> 
>> ---
>> v2:
>> - Adjust use kmemdup() helper to be the first patch as suggested.
>> ---
>>   drivers/media/usb/cx231xx/cx231xx-core.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/usb/cx231xx/cx231xx-core.c
>> b/drivers/media/usb/cx231xx/cx231xx-core.c
>> index 727e6268567f..746727ea1a4c 100644
>> --- a/drivers/media/usb/cx231xx/cx231xx-core.c
>> +++ b/drivers/media/usb/cx231xx/cx231xx-core.c
>> @@ -751,10 +751,9 @@ int cx231xx_ep5_bulkout(struct cx231xx *dev, u8
>> *firmware, u16 size)
>>       int ret = -ENOMEM;
>>       u32 *buffer;
>>   -    buffer = kzalloc(4096, GFP_KERNEL);
>> +    buffer = kmemdup(firmware, 4096, GFP_KERNEL);
>>       if (buffer == NULL)
>>           return -ENOMEM;
>> -    memcpy(&buffer[0], firmware, 4096);
>>         ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, 5),
>>               buffer, 4096, &actlen, 2000);
> 
