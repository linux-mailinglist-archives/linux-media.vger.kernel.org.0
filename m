Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A931D24B9
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 03:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgENBcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 21:32:45 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:47036 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725925AbgENBcp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 21:32:45 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 8766BF7CB335548C3F05;
        Thu, 14 May 2020 09:32:43 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.101) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 14 May 2020
 09:32:40 +0800
Subject: Re: [PATCH] [media] tw686x: add a missing newline when printing
 parameter 'dma_mode'
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1589186626-17243-1-git-send-email-wangxiongfeng2@huawei.com>
 <CAAEAJfAzcRTLE3HWHJqWvuENYnPCU-E6TdaDWXc+WNHOaUqdyA@mail.gmail.com>
From:   Xiongfeng Wang <wangxiongfeng2@huawei.com>
Message-ID: <c8b781aa-da2b-5aa7-aadc-a1980c84bd0d@huawei.com>
Date:   Thu, 14 May 2020 09:32:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAAEAJfAzcRTLE3HWHJqWvuENYnPCU-E6TdaDWXc+WNHOaUqdyA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.166.215.101]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thanks for your reply !

On 2020/5/14 3:32, Ezequiel Garcia wrote:
> On Mon, 11 May 2020 at 05:49, Xiongfeng Wang <wangxiongfeng2@huawei.com> wrote:
>>
>> When I cat module parameter 'dma_mode' by sysfs, it displays as follows.
>> It is better to add a newline for easy reading.
>>
>> [root@hulk-202 ~]# cat /sys/module/tw686x/parameters/dma_mode
>> memcpy[root@hulk-202 ~]#
>>
>> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> 
> I don't mind this change, but I don't think this is standard.
> The lack of newline follows what other drivers are doing.
> 
> # hexdump -c /sys/module/acpi/parameters/ec_event_clearing
> 0000000   q   u   e   r   y
> 0000005
> 
> Is it really an issue for you?

It's not an issue for me. It's just that if the result is in a separate line, it
reads more easily. I am also planning to fix the parameters below
'/sys/module/acpi/parameters'.

Thanks,
Xiongfeng

> 
> Thanks,
> Ezequiel
> 
>> ---
>>  drivers/media/pci/tw686x/tw686x-core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
>> index 74ae4f0..bfc61da 100644
>> --- a/drivers/media/pci/tw686x/tw686x-core.c
>> +++ b/drivers/media/pci/tw686x/tw686x-core.c
>> @@ -71,7 +71,7 @@ static const char *dma_mode_name(unsigned int mode)
>>
>>  static int tw686x_dma_mode_get(char *buffer, const struct kernel_param *kp)
>>  {
>> -       return sprintf(buffer, "%s", dma_mode_name(dma_mode));
>> +       return sprintf(buffer, "%s\n", dma_mode_name(dma_mode));
>>  }
>>
>>  static int tw686x_dma_mode_set(const char *val, const struct kernel_param *kp)
>> --
>> 1.7.12.4
>>
> 

