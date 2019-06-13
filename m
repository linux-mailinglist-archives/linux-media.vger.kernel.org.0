Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFD2E44707
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732092AbfFMQ4g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:56:36 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:53446 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729963AbfFMB1I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 21:27:08 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 4BA17D24DE5DE46CF656;
        Thu, 13 Jun 2019 09:27:05 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Jun 2019
 09:27:01 +0800
Subject: Re: [PATCH] media: ttpci: Fix build error without RC_CORE
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20190612034310.4640-1-yuehaibing@huawei.com>
 <20190612074254.eky2xo7bajorkhfy@gofer.mess.org>
 <20190612063708.64498b44@coco.lan>
 <20190612175629.srfw7ybr256se5rt@gofer.mess.org>
CC:     <tglx@linutronix.de>, <corbet@lwn.net>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <78f4a71f-8311-7c1b-c1a4-69624a92add4@huawei.com>
Date:   Thu, 13 Jun 2019 09:27:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190612175629.srfw7ybr256se5rt@gofer.mess.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2019/6/13 1:56, Sean Young wrote:
> On Wed, Jun 12, 2019 at 06:37:08AM -0300, Mauro Carvalho Chehab wrote:
>> Em Wed, 12 Jun 2019 08:42:55 +0100
>> Sean Young <sean@mess.org> escreveu:
>>
>>> On Wed, Jun 12, 2019 at 11:43:10AM +0800, YueHaibing wrote:
>>>> If RC_CORE is not set, building fails:
>>>>
>>>> drivers/media/pci/ttpci/av7110_ir.o: In function `av7110_ir_init':
>>>> av7110_ir.c:(.text+0x1b0): undefined reference to `rc_allocate_device'
>>>> av7110_ir.c:(.text+0x2c1): undefined reference to `rc_register_device'
>>>> av7110_ir.c:(.text+0x2dc): undefined reference to `rc_free_device'
>>>>
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Fixes: 71f49a8bf5c5 ("media: ttpci: use rc-core for the IR receiver")
>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>  
>>>
>>> Thank you for spotting this and writing a patch.
>>>
>>>> ---
>>>>  drivers/media/pci/ttpci/Kconfig | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/pci/ttpci/Kconfig b/drivers/media/pci/ttpci/Kconfig
>>>> index d96d4fa..b705631 100644
>>>> --- a/drivers/media/pci/ttpci/Kconfig
>>>> +++ b/drivers/media/pci/ttpci/Kconfig
>>>> @@ -7,7 +7,7 @@ config DVB_AV7110
>>>>  	depends on DVB_CORE && PCI && I2C
>>>>  	select TTPCI_EEPROM
>>>>  	select VIDEO_SAA7146_VV
>>>> -	select DVB_AV7110_IR if INPUT_EVDEV=y || INPUT_EVDEV=DVB_AV7110  
>>>
>>> This says if
>>>  - select DVB_AV7110_IR if INPUT_EVDEV and DVB_AV7110 are both y or m
>>>  - select DVB_AV7110_IR if INPUT_EVDEV=y
>>>    This exists for the case when INPUT_EVDEV=y and DVB_AV7110=m, which is fine
>>>
>>>> +	select DVB_AV7110_IR if RC_CORE=DVB_AV7110 && (INPUT_EVDEV=y || INPUT_EVDEV=DVB_AV7110)  
>>>
>>> That's not exactly the same. For one thing it should not longer depend on
>>> INPUT_EVDEV=y.
>>>
>>> Now if DVB_AV7110=m and RC_CORE=y is not allowed which should be (this is
>>> the case in Fedora default kernel config for example).
>>
>> My suggestion here is to stop using select here, using, instead
>> a depends on for DVB_AV7110_IR, e. g. something like (untested):
>>
>> config DVB_AV7110_IR
>> 	bool
>> 	depends on RC_CORE && DVB_AV7110
>> 	default DVB_AV7110
> 
> Build will fail if RC_CORE=m && DVB_AV7110=y. So it should be
> 
>         depends on RC_CORE=y || RC_CORE = DVB_AV7110

Thanks, will test and send v2 as your suggestion.

> 
> 
> Thanks,
> 
> Sean
> 
> .
> 

