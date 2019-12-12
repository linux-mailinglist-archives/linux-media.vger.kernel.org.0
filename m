Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D485D11C9A3
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 10:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbfLLJlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 04:41:04 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:59634 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728502AbfLLJlD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 04:41:03 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5C00F7BB62F978194D44;
        Thu, 12 Dec 2019 17:41:02 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.183) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Thu, 12 Dec 2019
 17:40:55 +0800
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
 <adcdd513-0d94-be6c-96e3-7f8e30174b76@huawei.com>
 <20191212074723.GC1368279@kroah.com>
From:   Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <bba0386d-fb55-ecde-6bd9-8a75ea29d5fb@huawei.com>
Date:   Thu, 12 Dec 2019 17:40:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212074723.GC1368279@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.220.183]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2019/12/12 15:47, Greg KH wrote:
> On Thu, Dec 12, 2019 at 09:48:44AM +0800, Zhiqiang Liu wrote:
>> Omer Shalev have given a example which can trigger the CVE.
>> Example link: https://deshal3v.github.io/blog/kernel-research/mmap_exploitation
> 
> That "example" was run on a kernel without the above mentioned commit to
> fix all of this.
> 
> Have you tried this on the latest kernel release and succeeded?
> 
> thanks,
> 
> greg k-h
> 

Thanks for patiently answering my question.
Actually, I have missed the Omer's commit.
> .
> 

