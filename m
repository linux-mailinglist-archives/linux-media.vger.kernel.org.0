Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1373D2C7914
	for <lists+linux-media@lfdr.de>; Sun, 29 Nov 2020 13:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbgK2M3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Nov 2020 07:29:07 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:59386 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgK2M3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Nov 2020 07:29:07 -0500
Received: from [192.168.1.41] ([92.131.86.32])
        by mwinf5d20 with ME
        id yCTM230080hrljw03CTMce; Sun, 29 Nov 2020 13:27:22 +0100
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Nov 2020 13:27:22 +0100
X-ME-IP: 92.131.86.32
Subject: Re: [PATCH NACK] media: saa7146: switch from 'pci_' to 'dma_' API
To:     hverkuil@xs4all.nl, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Newsgroups: gmane.linux.kernel,gmane.linux.drivers.video-input-infrastructure,gmane.linux.kernel.janitors
References: <20201129073803.1443174-1-christophe.jaillet@wanadoo.fr>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <44336db8-2b17-1682-6c38-128ec7f8f7d1@wanadoo.fr>
Date:   Sun, 29 Nov 2020 13:27:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201129073803.1443174-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 29/11/2020 à 08:38, Christophe JAILLET a écrit :
> When memory is allocated in 'saa7146_vv_init()' GFP_KERNEL can be used
> because this function already uses GFP_KERNEL and no lock is taken in the
> between.
> 
> When memory is allocated in 'vbi_workaround()' GFP_KERNEL can be used
> because it is only called from a .open function.
> 
> 
> diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
> index e936c56b0378..7b1840cad278 100644
> --- a/drivers/media/common/saa7146/saa7146_fops.c
> +++ b/drivers/media/common/saa7146/saa7146_fops.c
> @@ -515,8 +515,8 @@ int saa7146_vv_init(struct saa7146_dev* dev, struct saa7146_ext_vv *ext_vv)
>   	dev->ext_vv_data = ext_vv;
>   
>   	vv->d_clipping.cpu_addr =
> -		pci_zalloc_consistent(dev->pci, SAA7146_CLIPPING_MEM,
> -				      &vv->d_clipping.dma_handle);
> +		dma_alloc_coherent(&dev->pci->dev, SAA7146_CLIPPING_MEM,
> +				   &vv->d_clipping.dma_handle, GFP_);
 >
> diff --git a/drivers/media/common/saa7146/saa7146_vbi.c b/drivers/media/common/saa7146/saa7146_vbi.c
> index e1d369b976ed..e140d4a5aeb2 100644
> --- a/drivers/media/common/saa7146/saa7146_vbi.c
> +++ b/drivers/media/common/saa7146/saa7146_vbi.c
> @@ -22,7 +22,7 @@ static int vbi_workaround(struct saa7146_dev *dev)
>   	   as specified. there is this workaround, but please
>   	   don't let me explain it. ;-) */
>   
> -	cpu = pci_alloc_consistent(dev->pci, 4096, &dma_addr);
> +	cpu = dma_alloc_coherent(&dev->pci->dev, 4096, &dma_addr, GFP_);

The patch don't have 2 needed commit that got stucked on my machine.
The analysis at the top of the patch description is fine, but the 
corresponding s/GFP_/GFP_KERNEL/ are not part of the patch itself.

I'll send a v2.

Sorry for the noise.

CJ

