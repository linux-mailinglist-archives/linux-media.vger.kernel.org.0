Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4EA71AD75C
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbgDQH04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:26:56 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51721 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728419AbgDQH04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:26:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PLOjjhh2j7xncPLOmj9e23; Fri, 17 Apr 2020 09:26:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587108414; bh=0rQphqpUpEj6S8K6pkWWdM3OHkGA0bZKp8ci2MlaJ1w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ith6lgiR/EzmVT9mFt3PqenbD4g3b32WJGEOZYo0V2ril9lu9ycNDGfVwJYunjKQ7
         syGhnLV0tMngI1P5ocwueGj6B77A+ZEDT/Z/6CMzV7xqMfISgvStakfxog6KBfoV+h
         vaWFj6E3HLZDI6It+MfWNfXEplx2AyshkvWYTLe22kLNTA/ieIWTsQHlN6RVR33NMA
         WfLODl2LHW3MxLP70gZ5ts8P0z2vJZhP7rn8iL4yuTxT2Yy9bafUsc4xouvGQva8gs
         tJOqjQux73q2CSZuo2WM5dLyOcbBReKpo8H8E0IB5lEfnw+H+uGrimmUocOS47J0n8
         UnglowuSMNy0A==
Subject: Re: [PATCH] media: media/pci: prevent memory leak in bttv_probe
To:     Xiaolong Huang <butterflyhuangxx@gmail.com>, mchehab@kernel.org,
        tglx@linutronix.de, mpe@ellerman.id.au, allison@lohutok.net
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200325090122.9308-1-butterflyhuangxx@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4149a5b4-c3f3-2902-84e2-eedc9ecc54f8@xs4all.nl>
Date:   Fri, 17 Apr 2020 09:26:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200325090122.9308-1-butterflyhuangxx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHmFxzWw7R2b7uyOXMwz5IcZ9RzTNTP35T7uv3iZ11ES+RPFFQ4oCmwpffIVqjbP3GSpsahmReXNEqOCyOB01c8+GoIu5Qi0W0LNavCY/vBWNeMW7h7J
 ch5z0d0QPv0IGsOXwpU5NMcAoKXGA4bfjnZutB9sU+z9cbLkf3ZMGWwCJhlo36sp+J6zYELQL/E9P+xLLI7/mhM6vcpul7ksxhcZKEvX+f3dGIXETk6wK5yC
 dOVUfX0+kwED8ojAmsIebnPpEM8qH7UkL0dLtCHMaBAuIbxYWdbUnUCh/htDzyfYOMytakOLYgr00x8NSkeF7qhc9JkHTNzvyx+OQDQIuzo2eXDB96boxRs6
 GLWEsSWijiDjjhGdY2YKrGwywiF02Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/03/2020 10:01, Xiaolong Huang wrote:
> In bttv_probe if some functions such as pci_enable_device,
> pci_set_dma_mask and request_mem_region fails the allocated
>  memory for btv should be released.
> 
> Signed-off-by: Xiaolong Huang <butterflyhuangxx@gmail.com>
> ---
>  drivers/media/pci/bt8xx/bttv-driver.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
> index a359da7773a9..37ac59110383 100644
> --- a/drivers/media/pci/bt8xx/bttv-driver.c
> +++ b/drivers/media/pci/bt8xx/bttv-driver.c
> @@ -4013,10 +4013,14 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
>  	btv->id  = dev->device;
>  	if (pci_enable_device(dev)) {
>  		pr_warn("%d: Can't enable device\n", btv->c.nr);
> +		bttvs[btv->c.nr] = NULL;
> +		kfree(btv);
>  		return -EIO;

Let's change this...

>  	}
>  	if (pci_set_dma_mask(dev, DMA_BIT_MASK(32))) {
>  		pr_warn("%d: No suitable DMA available\n", btv->c.nr);
> +		bttvs[btv->c.nr] = NULL;
> +		kfree(btv);
>  		return -EIO;

this...

>  	}
>  	if (!request_mem_region(pci_resource_start(dev,0),
> @@ -4025,6 +4029,8 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
>  		pr_warn("%d: can't request iomem (0x%llx)\n",
>  			btv->c.nr,
>  			(unsigned long long)pci_resource_start(dev, 0));
> +		bttvs[btv->c.nr] = NULL;
> +		kfree(btv);
>  		return -EBUSY;

and this to a goto free_mem.

>  	}
>  	pci_set_master(dev);
> @@ -4211,6 +4217,8 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
>  	release_mem_region(pci_resource_start(btv->c.pci,0),
>  			   pci_resource_len(btv->c.pci,0));
>  	pci_disable_device(btv->c.pci);

And add the free_mem: label here.

> +	bttvs[btv->c.nr] = NULL;
> +	kfree(btv);
>  	return result;
>  }
>  
> 

Regards,

	Hans
