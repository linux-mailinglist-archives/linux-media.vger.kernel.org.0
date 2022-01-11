Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2466148A9D7
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 09:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348982AbiAKIu4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 03:50:56 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46920 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348971AbiAKIuy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 03:50:54 -0500
Received: from [IPv6:2a00:c281:14a3:8100:a909:23ff:b834:d3b1] (unknown [IPv6:2a00:c281:14a3:8100:a909:23ff:b834:d3b1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AB4441F442AA;
        Tue, 11 Jan 2022 08:50:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1641891053;
        bh=gOnJMp/1jv890qEn9KKWEqyiwONnwV7+OWHplhc98lk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ps/aav/aO+H+DLE/8wSnwN5van9B2MHsGU4YzeZvyT21IwV01QOgvw26ue5DmuiKx
         yAFO6RvMJmL2cdFBEceA+BlL5XEoH3xw2bQziZP9tK9igGQkvTgOLR1HFVjrztSKY4
         b0SsZgDgkgFWFqeS7EyQyQw1LIZrCNo9XD8ylCkBYhcrkNbNiB/ve/DlRQgijwg0SV
         gZxqP2J3HpwzmaGsB/1WxLiUdbFwhG2EByd9+H8gucrTJmQbcy4FNCiNR7VP+OntKZ
         SOkFJIBaBmX9a/bMRhbfcv9NO//RzIze4+u2EGFxTwAH2ilGF0teqbJcyYsTqKMfIi
         amHH85V63PP3Q==
Subject: Re: [PATCH 3/3] media: stk1160: use dma_alloc_noncontiguous API
To:     Christoph Hellwig <hch@lst.de>
Cc:     ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        kernel@collabora.com
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
 <20220111065505.6323-4-dafna.hirschfeld@collabora.com>
 <20220111081331.GB21713@lst.de>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <65307131-533a-3de1-7877-ca3020743cbe@collabora.com>
Date:   Tue, 11 Jan 2022 10:50:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111081331.GB21713@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11.01.22 10:13, Christoph Hellwig wrote:
> On Tue, Jan 11, 2022 at 08:55:05AM +0200, Dafna Hirschfeld wrote:
>> Replace the urb buffers allocation to
>> use the noncontiguous API. This improve performance
>> on Arm.
>> The noncontiguous API require handling
>> synchronization.
>> This commit is similar to the one sent to
>> uvc: [1]
> 
> Strange formatting.  I'd flow this as:
> 
> Replace the urb buffers allocation to use the noncontiguous API.  This
> improve performance on ARM plattform (XXX: insert why here)
> The noncontiguous API requires the driver to handle synchronization.
> This commit is similar to this one for the uvc driver:
> 
>      https://lkml.org/lkml/2021/3/12/1506

I'll reformulate and explain.

> 
>> @@ -310,6 +311,9 @@ static void stk1160_isoc_irq(struct urb *urb)
>>   		return;
>>   	}
>>   
>> +	dma_sync_sgtable_for_cpu(stk1160_get_dmadev(dev), stk_urb->sgt, DMA_FROM_DEVICE);
>> +	invalidate_kernel_vmap_range(stk_urb->transfer_buffer, urb->transfer_buffer_length);
> 
> Besisdes the unreadably long lines, I'd invalidate the vmap range before
> the direct mapping range.

I'll send v2 with shorter lines. (the official limit is now 100 char which I still follow).
I can send v2 with limit of 80.

You mean you would call "invalidate_kernel_vmap_range" before "dma_sync_sgtable_for_cpu" ?

Thanks,
Dafna

> 
