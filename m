Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBF8397E2A
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 03:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhFBBlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 21:41:01 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2940 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhFBBlB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 21:41:01 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fvs7S1CN6z6917;
        Wed,  2 Jun 2021 09:36:20 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 09:39:17 +0800
Received: from [10.174.178.95] (10.174.178.95) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 09:39:17 +0800
Subject: Re: [PATCH -next] media: rc: Fix a typo in lirc_ioctl
To:     Sean Young <sean@mess.org>
References: <20210601100235.69935-1-tongtiangen@huawei.com>
 <20210601102506.GA13203@gofer.mess.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   tongtiangen <tongtiangen@huawei.com>
Message-ID: <8a18bc10-8e6d-3cb8-5551-899cc20d2b1f@huawei.com>
Date:   Wed, 2 Jun 2021 09:39:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210601102506.GA13203@gofer.mess.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.95]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2021/6/1 18:25, Sean Young wrote:
> On Tue, Jun 01, 2021 at 06:02:35PM +0800, Tong Tiangen wrote:
>> Fix a typo in lirc_ioctl, apparently min_timeout should be used
>> in this case.
>>
>> Fixes: e589333f346b ("V4L/DVB: IR: extend interfaces to support more device settings")
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> ---
>>   drivers/media/rc/lirc_dev.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
>> index 116daf90c858..abbeae2ccd4a 100644
>> --- a/drivers/media/rc/lirc_dev.c
>> +++ b/drivers/media/rc/lirc_dev.c
>> @@ -534,7 +534,7 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>>   
>>   	/* Generic timeout support */
>>   	case LIRC_GET_MIN_TIMEOUT:
>> -		if (!dev->max_timeout)
>> +		if (!dev->min_timeout)
> So maybe this isn't the clearest piece of code, but all rc drivers set
> either both of min_timeout & max_timeout, or neither. Having a max_timeout
> without a min_timeout does not make any sense.
>
> Changing this to min_timeout gives the impression min_timeout can be set
> without max_timeout, which is not the case. This should at least commented.
>
> Thanks
>
> Sean

I agree,  the necessary comments should be added here.

Thanks

>
>>   			ret = -ENOTTY;
>>   		else
>>   			val = dev->min_timeout;
>> -- 
>> 2.18.0.huawei.25
> .
>

