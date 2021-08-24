Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03B93F5C08
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 12:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236315AbhHXKZm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 06:25:42 -0400
Received: from foss.arm.com ([217.140.110.172]:33562 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236139AbhHXKZl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 06:25:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF647101E;
        Tue, 24 Aug 2021 03:24:57 -0700 (PDT)
Received: from [10.57.15.112] (unknown [10.57.15.112])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1DC63F66F;
        Tue, 24 Aug 2021 03:24:55 -0700 (PDT)
Subject: Re: [PATCH] parisc/parport_gsc: switch from 'pci_' to 'dma_' API
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        sudipm.mukherjee@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc:     linux-parisc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <93b21629db55629ec3d384e8184c4a9dd0270c11.1629754126.git.christophe.jaillet@wanadoo.fr>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <1a6f5b12-7cf2-cdb8-7a60-20c2d2ee38f3@arm.com>
Date:   Tue, 24 Aug 2021 11:24:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <93b21629db55629ec3d384e8184c4a9dd0270c11.1629754126.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-08-23 22:30, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below.
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_free_consistent(e1, e2, e3, e4)
> +    dma_free_coherent(&e1->dev, e2, e3, e4)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>     https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
> 
> This has *NOT* been compile tested because I don't have the needed
> configuration.
> ssdfs
> ---
>   drivers/parport/parport_gsc.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
> index 1e43b3f399a8..db912fa6b6df 100644
> --- a/drivers/parport/parport_gsc.c
> +++ b/drivers/parport/parport_gsc.c
> @@ -390,9 +390,8 @@ static int __exit parport_remove_chip(struct parisc_device *dev)
>   		if (p->irq != PARPORT_IRQ_NONE)
>   			free_irq(p->irq, p);
>   		if (priv->dma_buf)
> -			pci_free_consistent(priv->dev, PAGE_SIZE,
> -					    priv->dma_buf,
> -					    priv->dma_handle);
> +			dma_free_coherent(&priv->dev->dev, PAGE_SIZE,
> +					  priv->dma_buf, priv->dma_handle);

Hmm, seeing a free on its own made me wonder where the corresponding 
alloc was, but on closer inspection it seems there isn't one. AFAICS 
priv->dma_buf is only ever assigned with NULL (and priv->dev doesn't 
seem to be assigned at all), so this could likely just be removed. In 
fact it looks like all the references to DMA in this driver are just 
copy-paste from parport_pc and unused.

Robin.

>   		kfree (p->private_data);
>   		parport_put_port(p);
>   		kfree (ops); /* hope no-one cached it */
> 
