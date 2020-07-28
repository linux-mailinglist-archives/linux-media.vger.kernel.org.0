Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01A52304D8
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 10:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgG1IBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 04:01:34 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:55715 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgG1IBe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 04:01:34 -0400
Received: from [192.168.43.110] ([93.23.107.187])
        by mwinf5d84 with ME
        id 8Y1M2300G42dCi503Y1PRA; Tue, 28 Jul 2020 10:01:31 +0200
X-ME-Helo: [192.168.43.110]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 28 Jul 2020 10:01:31 +0200
X-ME-IP: 93.23.107.187
Subject: Re: [PATCH 2/2] media: bt8xx: avoid a useless memset
To:     Joe Perches <joe@perches.com>, mchehab@kernel.org,
        akpm@linux-foundation.org, rppt@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
 <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <b883b856-af1e-a017-6af2-2aca575c24d5@wanadoo.fr>
Date:   Tue, 28 Jul 2020 10:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 27/07/2020 à 18:09, Joe Perches a écrit :
> On Mon, 2020-07-27 at 15:51 +0200, Christophe JAILLET wrote:
>> Avoid a memset after a call to 'dma_alloc_coherent()'.
>> This is useless since
>> commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
> []
>> diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
> []
>> @@ -73,7 +73,6 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
>>   		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
>>   			memcnt, (unsigned long)dma, cpu, size);
>>   	}
>> -	memset(risc->cpu,0,risc->size);
>>   	return 0;
>>   }
> 
> Likely NAK.
> 
> This is not useless as risc->cpu may be reused
> and the alloc may not have been done.
> 
> 
> 
Agreed.
This 2/2 patch should be NAK'ed.

I've been a bit too fast on this one.
Thanks for the review Joe.

CJ
