Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C1B2C772D
	for <lists+linux-media@lfdr.de>; Sun, 29 Nov 2020 02:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgK2B1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 20:27:06 -0500
Received: from iodev.co.uk ([46.30.189.100]:44832 "EHLO iodev.co.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgK2B1G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 20:27:06 -0500
Received: from abuya (118.130.77.188.dynamic.jazztel.es [188.77.130.118])
        by iodev.co.uk (Postfix) with ESMTPSA id EAC0F15800;
        Sun, 29 Nov 2020 02:26:20 +0100 (CET)
Date:   Sun, 29 Nov 2020 02:26:53 +0100
From:   Ismael Luceno <ismael@iodev.co.uk>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     maintainers@bluecherrydvr.com, anton@corp.bluecherry.net,
        andrey_utkin@fastmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: solo6x10: switch from 'pci_' to 'dma_' API
Message-ID: <20201129012653.GA27872@abuya>
References: <20201127203440.1381359-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127203440.1381359-1-christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/Nov/2020 21:34, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'snd_solo_pcm_open()' (solo6x10-g723.c)
> GFP_KERNEL can be used because this flag is already used jew a few lines
> above.
> 
> When memory is allocated in 'solo_enc_alloc()' (solo6x10-v4l2-enc.c)
> GFP_KERNEL can be used because this flag is already used jew a few lines
> above.
> 
> When memory is allocated in 'solo_enc_v4l2_init()' (solo6x10-v4l2-enc.c)
> GFP_KERNEL can be used because calls 'solo_enc_alloc()' which already uses
> this flag.
> 
> @@
> @@
> -    PCI_DMA_BIDIRECTIONAL
> +    DMA_BIDIRECTIONAL
> 
> @@
> @@
> -    PCI_DMA_TODEVICE
> +    DMA_TO_DEVICE
> 
> @@
> @@
> -    PCI_DMA_FROMDEVICE
> +    DMA_FROM_DEVICE
> 
> @@
> @@
> -    PCI_DMA_NONE
> +    DMA_NONE
> 
> @@
> expression e1, e2, e3;
> @@
> -    pci_alloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> 
> @@
> expression e1, e2, e3;
> @@
> -    pci_zalloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_free_consistent(e1, e2, e3, e4)
> +    dma_free_coherent(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_single(e1, e2, e3, e4)
> +    dma_map_single(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_single(e1, e2, e3, e4)
> +    dma_unmap_single(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4, e5;
> @@
> -    pci_map_page(e1, e2, e3, e4, e5)
> +    dma_map_page(&e1->dev, e2, e3, e4, e5)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_page(e1, e2, e3, e4)
> +    dma_unmap_page(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_sg(e1, e2, e3, e4)
> +    dma_map_sg(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_sg(e1, e2, e3, e4)
> +    dma_unmap_sg(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
> +    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_device(e1, e2, e3, e4)
> +    dma_sync_single_for_device(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
> +    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
> +    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2;
> @@
> -    pci_dma_mapping_error(e1, e2)
> +    dma_mapping_error(&e1->dev, e2)
> 
> @@
> expression e1, e2;
> @@
> -    pci_set_dma_mask(e1, e2)
> +    dma_set_mask(&e1->dev, e2)
> 
> @@
> expression e1, e2;
> @@
> -    pci_set_consistent_dma_mask(e1, e2)
> +    dma_set_coherent_mask(&e1->dev, e2)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>    https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
> ---
>  drivers/media/pci/solo6x10/solo6x10-g723.c    | 11 +++---
>  drivers/media/pci/solo6x10/solo6x10-p2m.c     | 10 +++---
>  .../media/pci/solo6x10/solo6x10-v4l2-enc.c    | 35 ++++++++++---------
>  3 files changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
> index d137b94869d8..6cebad665565 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-g723.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
> @@ -124,9 +124,10 @@ static int snd_solo_pcm_open(struct snd_pcm_substream *ss)
>  	if (solo_pcm == NULL)
>  		goto oom;
>  
> -	solo_pcm->g723_buf = pci_alloc_consistent(solo_dev->pdev,
> -						  G723_PERIOD_BYTES,
> -						  &solo_pcm->g723_dma);
> +	solo_pcm->g723_buf = dma_alloc_coherent(&solo_dev->pdev->dev,
> +						G723_PERIOD_BYTES,
> +						&solo_pcm->g723_dma,
> +						GFP_KERNEL);
>  	if (solo_pcm->g723_buf == NULL)
>  		goto oom;
>  
> @@ -148,8 +149,8 @@ static int snd_solo_pcm_close(struct snd_pcm_substream *ss)
>  	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
>  
>  	snd_pcm_substream_chip(ss) = solo_pcm->solo_dev;
> -	pci_free_consistent(solo_pcm->solo_dev->pdev, G723_PERIOD_BYTES,
> -			    solo_pcm->g723_buf, solo_pcm->g723_dma);
> +	dma_free_coherent(&solo_pcm->solo_dev->pdev->dev, G723_PERIOD_BYTES,
> +			  solo_pcm->g723_buf, solo_pcm->g723_dma);
>  	kfree(solo_pcm);
>  
>  	return 0;
> diff --git a/drivers/media/pci/solo6x10/solo6x10-p2m.c b/drivers/media/pci/solo6x10/solo6x10-p2m.c
> index db2afc6a5fcb..ca70a864a3ef 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-p2m.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-p2m.c
> @@ -37,16 +37,16 @@ int solo_p2m_dma(struct solo_dev *solo_dev, int wr,
>  	if (WARN_ON_ONCE(!size))
>  		return -EINVAL;
>  
> -	dma_addr = pci_map_single(solo_dev->pdev, sys_addr, size,
> -				  wr ? PCI_DMA_TODEVICE : PCI_DMA_FROMDEVICE);
> -	if (pci_dma_mapping_error(solo_dev->pdev, dma_addr))
> +	dma_addr = dma_map_single(&solo_dev->pdev->dev, sys_addr, size,
> +				  wr ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
> +	if (dma_mapping_error(&solo_dev->pdev->dev, dma_addr))
>  		return -ENOMEM;
>  
>  	ret = solo_p2m_dma_t(solo_dev, wr, dma_addr, ext_addr, size,
>  			     repeat, ext_size);
>  
> -	pci_unmap_single(solo_dev->pdev, dma_addr, size,
> -			 wr ? PCI_DMA_TODEVICE : PCI_DMA_FROMDEVICE);
> +	dma_unmap_single(&solo_dev->pdev->dev, dma_addr, size,
> +			 wr ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
>  
>  	return ret;
>  }
> diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> index 3cf7bd6186aa..0abcad4e84fa 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> @@ -1286,10 +1286,11 @@ static struct solo_enc_dev *solo_enc_alloc(struct solo_dev *solo_dev,
>  	memcpy(solo_enc->jpeg_header, jpeg_header, solo_enc->jpeg_len);
>  
>  	solo_enc->desc_nelts = 32;
> -	solo_enc->desc_items = pci_alloc_consistent(solo_dev->pdev,
> -				      sizeof(struct solo_p2m_desc) *
> -				      solo_enc->desc_nelts,
> -				      &solo_enc->desc_dma);
> +	solo_enc->desc_items = dma_alloc_coherent(&solo_dev->pdev->dev,
> +						  sizeof(struct solo_p2m_desc) *
> +						  solo_enc->desc_nelts,
> +						  &solo_enc->desc_dma,
> +						  GFP_KERNEL);
>  	ret = -ENOMEM;
>  	if (solo_enc->desc_items == NULL)
>  		goto hdl_free;
> @@ -1317,9 +1318,9 @@ static struct solo_enc_dev *solo_enc_alloc(struct solo_dev *solo_dev,
>  vdev_release:
>  	video_device_release(solo_enc->vfd);
>  pci_free:
> -	pci_free_consistent(solo_enc->solo_dev->pdev,
> -			sizeof(struct solo_p2m_desc) * solo_enc->desc_nelts,
> -			solo_enc->desc_items, solo_enc->desc_dma);
> +	dma_free_coherent(&solo_enc->solo_dev->pdev->dev,
> +			  sizeof(struct solo_p2m_desc) * solo_enc->desc_nelts,
> +			  solo_enc->desc_items, solo_enc->desc_dma);
>  hdl_free:
>  	v4l2_ctrl_handler_free(hdl);
>  	kfree(solo_enc);
> @@ -1331,9 +1332,9 @@ static void solo_enc_free(struct solo_enc_dev *solo_enc)
>  	if (solo_enc == NULL)
>  		return;
>  
> -	pci_free_consistent(solo_enc->solo_dev->pdev,
> -			sizeof(struct solo_p2m_desc) * solo_enc->desc_nelts,
> -			solo_enc->desc_items, solo_enc->desc_dma);
> +	dma_free_coherent(&solo_enc->solo_dev->pdev->dev,
> +			  sizeof(struct solo_p2m_desc) * solo_enc->desc_nelts,
> +			  solo_enc->desc_items, solo_enc->desc_dma);
>  	video_unregister_device(solo_enc->vfd);
>  	v4l2_ctrl_handler_free(&solo_enc->hdl);
>  	kfree(solo_enc);
> @@ -1346,9 +1347,9 @@ int solo_enc_v4l2_init(struct solo_dev *solo_dev, unsigned nr)
>  	init_waitqueue_head(&solo_dev->ring_thread_wait);
>  
>  	solo_dev->vh_size = sizeof(vop_header);
> -	solo_dev->vh_buf = pci_alloc_consistent(solo_dev->pdev,
> -						solo_dev->vh_size,
> -						&solo_dev->vh_dma);
> +	solo_dev->vh_buf = dma_alloc_coherent(&solo_dev->pdev->dev,
> +					      solo_dev->vh_size,
> +					      &solo_dev->vh_dma, GFP_KERNEL);
>  	if (solo_dev->vh_buf == NULL)
>  		return -ENOMEM;
>  
> @@ -1363,8 +1364,8 @@ int solo_enc_v4l2_init(struct solo_dev *solo_dev, unsigned nr)
>  
>  		while (i--)
>  			solo_enc_free(solo_dev->v4l2_enc[i]);
> -		pci_free_consistent(solo_dev->pdev, solo_dev->vh_size,
> -				    solo_dev->vh_buf, solo_dev->vh_dma);
> +		dma_free_coherent(&solo_dev->pdev->dev, solo_dev->vh_size,
> +				  solo_dev->vh_buf, solo_dev->vh_dma);
>  		solo_dev->vh_buf = NULL;
>  		return ret;
>  	}
> @@ -1391,6 +1392,6 @@ void solo_enc_v4l2_exit(struct solo_dev *solo_dev)
>  		solo_enc_free(solo_dev->v4l2_enc[i]);
>  
>  	if (solo_dev->vh_buf)
> -		pci_free_consistent(solo_dev->pdev, solo_dev->vh_size,
> -			    solo_dev->vh_buf, solo_dev->vh_dma);
> +		dma_free_coherent(&solo_dev->pdev->dev, solo_dev->vh_size,
> +				  solo_dev->vh_buf, solo_dev->vh_dma);
>  }
> -- 
> 2.27.0
> 

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
