Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06822304E0
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 10:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgG1IFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 04:05:12 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:38392 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727797AbgG1IFL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 04:05:11 -0400
Received: from [192.168.43.110] ([93.23.107.187])
        by mwinf5d84 with ME
        id 8Y582300g42dCi503Y5916; Tue, 28 Jul 2020 10:05:09 +0200
X-ME-Helo: [192.168.43.110]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 28 Jul 2020 10:05:09 +0200
X-ME-IP: 93.23.107.187
Subject: Re: [PATCH 2/2] media: bt8xx: avoid a useless memset
To:     Joe Perches <joe@perches.com>, mchehab@kernel.org,
        akpm@linux-foundation.org, rppt@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
 <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
 <30618c986727e5f8a9806f663b4e6f4aa80065ae.camel@perches.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <d5759bd3-5e8a-a557-cd3e-0a2ae4d124e9@wanadoo.fr>
Date:   Tue, 28 Jul 2020 10:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <30618c986727e5f8a9806f663b4e6f4aa80065ae.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 27/07/2020 à 18:16, Joe Perches a écrit :
> On Mon, 2020-07-27 at 09:09 -0700, Joe Perches wrote:
>> On Mon, 2020-07-27 at 15:51 +0200, Christophe JAILLET wrote:
>>> Avoid a memset after a call to 'dma_alloc_coherent()'.
>>> This is useless since
>>> commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
>> []
>>> diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
>> []
>>> @@ -73,7 +73,6 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
>>>   		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
>>>   			memcnt, (unsigned long)dma, cpu, size);
>>>   	}
>>> -	memset(risc->cpu,0,risc->size);
>>>   	return 0;
>>>   }
>>
>> Likely NAK.
>>
>> This is not useless as risc->cpu may be reused
>> and the alloc may not have been done.
> 
> Perhaps a little rewrite for clarity:
> ---
>   drivers/media/pci/bt8xx/btcx-risc.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
> index 51257980f539..311f4ca2a108 100644
> --- a/drivers/media/pci/bt8xx/btcx-risc.c
> +++ b/drivers/media/pci/bt8xx/btcx-risc.c
> @@ -56,24 +56,26 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
>   		       struct btcx_riscmem *risc,
>   		       unsigned int size)
>   {
> -	__le32 *cpu;
> -	dma_addr_t dma = 0;
> -
> -	if (NULL != risc->cpu && risc->size < size)
> -		btcx_riscmem_free(pci,risc);
> -	if (NULL == risc->cpu) {
> -		cpu = pci_alloc_consistent(pci, size, &dma);
> -		if (NULL == cpu)
> +	if (risc->cpu && risc->size < size)
> +		btcx_riscmem_free(pci, risc);
> +
> +	if (risc->cpu) {
> +		memset(risc->cpu, 0, risc->size);
> +	} else {
> +		dma_addr_t dma = 0;
> +
> +		risc->cpu = pci_alloc_consistent(pci, size, &dma);
> +		if (!risc->cpu)
>   			return -ENOMEM;
> -		risc->cpu  = cpu;
> +
>   		risc->dma  = dma;
>   		risc->size = size;
>   
>   		memcnt++;
>   		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
> -			memcnt, (unsigned long)dma, cpu, size);
> +			memcnt, (unsigned long)dma, risc->cpu, size);
>   	}
> -	memset(risc->cpu,0,risc->size);
> +
>   	return 0;
>   }
>   
> 
> 
Looks good to me.

Just note, that this will not apply after patch 1/2 is applied, because 
it turns pci_alloc_consistent() into dma_alloc_coherent().

CJ
