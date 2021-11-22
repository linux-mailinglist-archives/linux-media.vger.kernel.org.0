Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76644590F4
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 16:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239496AbhKVPMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 10:12:06 -0500
Received: from www381.your-server.de ([78.46.137.84]:57628 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237918AbhKVPMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 10:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=etu9YMUmHzasU+XwW6nQHDIBMOGhRRs59fj7iJUc9rc=; b=BaYq3aYuoIk4qqZ+qqsEQI9UhP
        yNAe+Ow0sjoJju5JZCniJxYrzgjWpDxiKUuZTsyi7sDf2jebsnClCedL5TwZiVvzKn+XZid0LNGgd
        6It9is0Knf5c1ICKsmTFY+0a5SzKCa9Rt8J59YmtnS6lf4DxVU/ic2P/kMydblHHB+ObL+tL0xS5T
        ksJdPeYH0S/foXcRZLFW2CkZnjISf4pOduWchnORKLDJfswYAumHZKcdQHtTzTATu33FyfLtSE8cz
        pua3iqlKCZJ5tvqQJpyUShFcu9z7G2kzpomyyiYu+NRq7XfVWa8UfOHb6wDzSHyFkWdtQL6aVN0bj
        +zCeVV5g==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <lars@metafoo.de>)
        id 1mpAw8-000Bss-C6; Mon, 22 Nov 2021 16:08:52 +0100
Received: from [82.135.83.112] (helo=[192.168.178.20])
        by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1mpAw8-000Btg-2M; Mon, 22 Nov 2021 16:08:52 +0100
Subject: Re: [PATCH 01/15] iio: buffer-dma: Get rid of incoming/outgoing
 queues
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <ardeleanalex@gmail.com>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-2-paul@crapouillou.net>
 <e2689f0d-dc16-2519-57df-d98caadb07b0@metafoo.de>
 <0COX2R.BSNX3NW8N48T@crapouillou.net>
 <332d001d-8b5a-bba2-c490-ed2e5efd0b1d@metafoo.de>
 <AMUX2R.XLGW1EZOMU9B2@crapouillou.net>
From:   Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <d542865e-2a0b-089f-e63c-b24d16c58ec6@metafoo.de>
Date:   Mon, 22 Nov 2021 16:08:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <AMUX2R.XLGW1EZOMU9B2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26361/Mon Nov 22 10:19:53 2021)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/21/21 9:08 PM, Paul Cercueil wrote:
>
>
> Le dim., nov. 21 2021 at 19:49:03 +0100, Lars-Peter Clausen 
> <lars@metafoo.de> a écrit :
>> On 11/21/21 6:52 PM, Paul Cercueil wrote:
>>> Hi Lars,
>>>
>>> Le dim., nov. 21 2021 at 17:23:35 +0100, Lars-Peter Clausen 
>>> <lars@metafoo.de> a écrit :
>>>> On 11/15/21 3:19 PM, Paul Cercueil wrote:
>>>>> The buffer-dma code was using two queues, incoming and outgoing, to
>>>>> manage the state of the blocks in use.
>>>>>
>>>>> While this totally works, it adds some complexity to the code,
>>>>> especially since the code only manages 2 blocks. It is much easier to
>>>>> just check each block's state manually, and keep a counter for the 
>>>>> next
>>>>> block to dequeue.
>>>>>
>>>>> Since the new DMABUF based API wouldn't use these incoming and 
>>>>> outgoing
>>>>> queues anyway, getting rid of them now makes the upcoming changes
>>>>> simpler.
>>>>>
>>>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>> The outgoing queue is going to be replaced by fences, but I think 
>>>> we need to keep the incoming queue.
>>>
>>> Blocks are always accessed in sequential order, so we now have a 
>>> "queue->next_dequeue" that cycles between the buffers allocated for 
>>> fileio.
>>>
>>>>> [...]
>>>>> @@ -442,28 +435,33 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_disable);
>>>>>   static void iio_dma_buffer_enqueue(struct iio_dma_buffer_queue 
>>>>> *queue,
>>>>>       struct iio_dma_buffer_block *block)
>>>>>   {
>>>>> -    if (block->state == IIO_BLOCK_STATE_DEAD) {
>>>>> +    if (block->state == IIO_BLOCK_STATE_DEAD)
>>>>>           iio_buffer_block_put(block);
>>>>> -    } else if (queue->active) {
>>>>> +    else if (queue->active)
>>>>>           iio_dma_buffer_submit_block(queue, block);
>>>>> -    } else {
>>>>> +    else
>>>>>           block->state = IIO_BLOCK_STATE_QUEUED;
>>>>> -        list_add_tail(&block->head, &queue->incoming);
>>>> If iio_dma_buffer_enqueue() is called with a dmabuf and the buffer 
>>>> is not active, it will be marked as queued, but we don't actually 
>>>> keep a reference to it anywhere. It will never be submitted to 
>>>> the DMA, and it will never be signaled as completed.
>>>
>>> We do keep a reference to the buffers, in the queue->fileio.blocks 
>>> array. When the buffer is enabled, all the blocks in that array 
>>> that are in the "queued" state will be submitted to the DMA.
>>>
>> But not when used in combination with the DMA buf changes later in 
>> this series.
>>
>
> That's still the case after the DMABUF changes of the series. Or can 
> you point me exactly what you think is broken?
>
When you allocate a DMABUF with the allocate IOCTL and then submit it 
with the enqueue IOCTL before the buffer is enabled it will end up 
marked as queued, but not actually be queued anywhere.


