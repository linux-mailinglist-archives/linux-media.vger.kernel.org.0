Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C41D1120746
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbfLPNgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:36:17 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7252 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727834AbfLPNgR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:36:17 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 64F7A3C6DE9BC06E0313;
        Mon, 16 Dec 2019 21:36:15 +0800 (CST)
Received: from [127.0.0.1] (10.133.219.218) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Mon, 16 Dec 2019
 21:36:13 +0800
Message-ID: <5DF7884C.1040108@huawei.com>
Date:   Mon, 16 Dec 2019 21:36:12 +0800
From:   zhong jiang <zhongjiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To:     "Andrew F. Davis" <afd@ti.com>
CC:     <sumit.semwal@linaro.org>, <benjamin.gaignard@linaro.org>,
        <lmark@codeaurora.org>, <labbott@redhat.com>,
        <Brian.Starkey@arm.com>, <john.stultz@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dma-heap: Make the symbol 'dma_heap_ioctl_cmds' static
References: <1576490904-18069-1-git-send-email-zhongjiang@huawei.com> <c1244a5f-b82a-baee-262a-7241531036ad@ti.com>
In-Reply-To: <c1244a5f-b82a-baee-262a-7241531036ad@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.219.218]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019/12/16 21:01, Andrew F. Davis wrote:
> On 12/16/19 5:08 AM, zhong jiang wrote:
>> Fix the following sparse warning.
>>
>> drivers/gpu/drm/ast/ast_main.c:391:22: warning: symbol 'ast_mode_config_mode_valid' was not declared. Should it be static?
>>
>
> The patch looks valid, but this commit message does not seem to match..
Sorry for stupid mistake. Will repost it in v2.

Thanks,
zhong jiang
>
> Andrew
>
>
>> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
>> ---
>>  drivers/dma-buf/dma-heap.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
>> index 4f04d10..da2090e 100644
>> --- a/drivers/dma-buf/dma-heap.c
>> +++ b/drivers/dma-buf/dma-heap.c
>> @@ -106,7 +106,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
>>  	return 0;
>>  }
>>  
>> -unsigned int dma_heap_ioctl_cmds[] = {
>> +static unsigned int dma_heap_ioctl_cmds[] = {
>>  	DMA_HEAP_IOC_ALLOC,
>>  };
>>  
>>
> .
>


