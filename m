Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A64A311C2B0
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 02:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbfLLBsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 20:48:54 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7220 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727473AbfLLBsy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 20:48:54 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 220015B5B57A50FEDC89;
        Thu, 12 Dec 2019 09:48:53 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.183) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 12 Dec 2019
 09:48:44 +0800
Subject: Re: [PATCH] media: usb/cpia2: fix start_offset+size Integer Overflow
 in, cpia2_remap_buffer
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <tglx@linutronix.de>, <crope@iki.fi>,
        <linux-media@vger.kernel.org>, <rfontana@redhat.com>,
        <erik.andren@gmail.com>, <hverkuil@xs4all.nl>, <brijohn@gmail.com>,
        <lcostantino@gmail.com>, <suweifeng1@huawei.com>,
        Mingfangsen <mingfangsen@huawei.com>, <guiyao@huawei.com>
References: <83ed0748-634d-4146-d216-53681bc3b553@huawei.com>
 <20191211075745.GA403571@kroah.com>
From:   Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <adcdd513-0d94-be6c-96e3-7f8e30174b76@huawei.com>
Date:   Thu, 12 Dec 2019 09:48:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191211075745.GA403571@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.220.183]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019/12/11 15:57, Greg KH wrote:
> On Wed, Dec 11, 2019 at 10:47:58AM +0800, Zhiqiang Liu wrote:
>> From: Weifeng Su <suweifeng1@huawei.com>
>>
>> CVE-2019-18675: The Linux kernel through 5.3.13 has a start_offset+size
>> IntegerOverflow in cpia2_remap_buffer in drivers/media/usb/cpia2/cpia2_core.c
>> because cpia2 has its own mmap implementation. This allows local users
>> (with /dev/video0 access) to obtain read and write permissions on kernel
>> physical pages, which can possibly result in a privilege escalation.
>>
>> Here, we fix it through proper start_offset value check.
>>
>> CVE Link: https://nvd.nist.gov/vuln/detail/CVE-2019-18675
>> Signed-off-by: Weifeng Su <suweifeng1@huawei.com>
>> Reviewed-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> ---
>>  drivers/media/usb/cpia2/cpia2_core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/usb/cpia2/cpia2_core.c b/drivers/media/usb/cpia2/cpia2_core.c
>> index 20c50c2d042e..26ae7a5e3783 100644
>> --- a/drivers/media/usb/cpia2/cpia2_core.c
>> +++ b/drivers/media/usb/cpia2/cpia2_core.c
>> @@ -2401,7 +2401,7 @@ int cpia2_remap_buffer(struct camera_data *cam, struct vm_area_struct *vma)
>>
>>  	if (size > cam->frame_size*cam->num_frames  ||
>>  	    (start_offset % cam->frame_size) != 0 ||
>> -	    (start_offset+size > cam->frame_size*cam->num_frames))
>> +	    (start_offset > cam->frame_size*cam->num_frames - size))
> 
> I thought we discussed this already, and the checks in the core kernel
> will prevent this from happening, right?
> What did I miss?
> 
Thanks for your reply.
It is me who missed the discussion. Could you sent me the mails or links about
the discussion?

> Or was that research not correct?  Can you really trigger this?  If so,
> we should fix the core kernel checks instead, and not rely on it being
> in every individual driver.
> 
> thanks,
> 
Omer Shalev have given a example which can trigger the CVE.
Example link: https://deshal3v.github.io/blog/kernel-research/mmap_exploitation

> greg k-h
> 
> .
> 

