Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72D62C49ED
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 22:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732274AbgKYVau (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 16:30:50 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38219 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732204AbgKYVat (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 16:30:49 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201125213037euoutp011e5612b241622c08b96dec1f45261a81~K3ZI0avDB1430814308euoutp01r
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 21:30:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201125213037euoutp011e5612b241622c08b96dec1f45261a81~K3ZI0avDB1430814308euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606339837;
        bh=0SyuEg94uJUCVmkxRXgGOa5Agz30lkFn7guBPvROnjk=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=NvYbEA13W77JmGzrriVgynC+kwEr8tgvnxPlFlhywY1TfDcDa2dDd+nJHKuB4cSos
         Bm+XdTX/R865D7WOREW22bTj0AAoFy+2+wIiHmyGIDHBCFBHPOfF7CK4+5qg3+65nm
         tw7nnrth90Vfy3BZH4mhyf6Hs9elrSPc7uSPz0g8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201125213026eucas1p133e92809597e3c51e2a1a84a92723446~K3Y_6D5841182311823eucas1p1q;
        Wed, 25 Nov 2020 21:30:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 98.D2.27958.2FCCEBF5; Wed, 25
        Nov 2020 21:30:26 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201125213025eucas1p24fd0cb6e4383297f8527b2075ce3e4ea~K3Y99-Bl20787307873eucas1p2B;
        Wed, 25 Nov 2020 21:30:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201125213025eusmtrp25f4ce38c22ce80760d9d31f6992b350b~K3Y95d6Gn2067820678eusmtrp2c;
        Wed, 25 Nov 2020 21:30:25 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-42-5fbeccf2c82c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 08.CC.16282.1FCCEBF5; Wed, 25
        Nov 2020 21:30:25 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201125213024eusmtip1ffc51ff185ac47173f20b7f93f931937~K3Y9Ny24w3264332643eusmtip1D;
        Wed, 25 Nov 2020 21:30:24 +0000 (GMT)
Subject: Re: [PATCH v2 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        auro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <527e4b4e-e631-adfa-e4fa-c777af82ae17@samsung.com>
Date:   Wed, 25 Nov 2020 22:30:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125203114.130967-1-ribalda@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIKsWRmVeSWpSXmKPExsWy7djPc7qfzuyLN9hxSthi5eqjTBYL9ltb
        dM7ewG6xsG0Ji8XlXXPYLHo2bGW1WLbpD5NF0/SDbBYHPzxhtVjwdRWjxefWf2wO3B5PDs5j
        8lgzbw2jx+yGiyweCzaVemxa1cnmMfnGckaP3Tcb2Dw+b5IL4IjisklJzcksSy3St0vgyljU
        +JulYJ5+xarzcxkbGPepdjFyckgImEjsXDaPpYuRi0NIYAWjxOYjc1ghnC+MEnPmdTJBOJ8Z
        JQ7fO8wO03Jl2lM2iMRyRokrk39A9b9nlGicvYUNpEpYwFvixbaFYLNEBN4zS3S0ngVrZxMw
        lOh62wVWxCtgJ/H+9xkwm0VAVeLj6cfMILaoQJLEwY8PoGoEJU7OfMICYnMKWEucWf2TEcRm
        FpCX2P52DjOELS5x68l8sFslBP5zSKxse8QEcauLRPPOo6wQtrDEq+NboH6Qkfi/E6ahmVHi
        4bm17BBOD6PE5aYZjBBV1hJ3zv0COoMDaIWmxPpd+hBhR4lV95Yyg4QlBPgkbrwVhDiCT2LS
        tulQYV6JjjYhiGo1iVnH18GtPXjhEjOE7SHRu20W2wRGxVlI3pyF5LVZSF6bhXDDAkaWVYzi
        qaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIGp7PS/4592MM599VHvECMTB+MhRgkOZiURXnfh
        vfFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeVfNXhMvJJCeWJKanZpakFoEk2Xi4JRqYJK401Rb
        treRq0LmXOF+3oAH3/epG77rDWeu+HSP/9+uyT8i/gTssGM7HjFjcV+/vFiBipTiJIHq8Pzp
        azQlVcwN5RtP63BemGWcVvip8OU+jmufJaL6v7I/eHqe8djK1Hyuqexrr75U1XvgUKD4/e7/
        b4mMs9z+avCtf3dT426Erac6+7q2zjP8Kz0sl2fdMlf6PJfhz6QAywVn/jZs6Kqa++/VrDDW
        NOeZojsa5z5ev2y3xudpfox3vjkeUfWuyT9pvd+5MOPHLQOHqh69vYmXq5Zz/Niv/ODmfl2O
        dSKLDx6/5t7xVmHyj6B10Rl/GSJ4FhWy5X++0hp9/uF7NiHBu1GFd3azN31L/+EY2KnEUpyR
        aKjFXFScCABr1rVW1AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xu7ofz+yLNzhyhd9i5eqjTBYL9ltb
        dM7ewG6xsG0Ji8XlXXPYLHo2bGW1WLbpD5NF0/SDbBYHPzxhtVjwdRWjxefWf2wO3B5PDs5j
        8lgzbw2jx+yGiyweCzaVemxa1cnmMfnGckaP3Tcb2Dw+b5IL4IjSsynKLy1JVcjILy6xVYo2
        tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy1jU+JulYJ5+xarzcxkbGPepdjFy
        ckgImEhcmfaUrYuRi0NIYCmjREfbamaIhIzEyWkNrBC2sMSfa11QRW8ZJc41NTOBJIQFvCVe
        bFvICpIQEfjILPHj8yuwbiGBPkaJxz88QGw2AUOJrrcg3ZwcvAJ2Eu9/nwGzWQRUJT6efgxW
        LyqQJPF76VqoGkGJkzOfsIDYnALWEmdW/2QEsZkFzCTmbX7IDGHLS2x/OwfKFpe49WQ+0wRG
        wVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAiN027GfW3Ywrnz1
        Ue8QIxMH4yFGCQ5mJRFed+G98UK8KYmVValF+fFFpTmpxYcYTYH+mcgsJZqcD0wReSXxhmYG
        poYmZpYGppZmxkrivCZH1sQLCaQnlqRmp6YWpBbB9DFxcEo1MO2NNwvpVTzfHaYqeDN7ZYjF
        k9KI6z6vj7Qsm22SGxUpZKlwoN81+J8f67QJVbe7RHy4dmdo2d0KMVrz2uxsZcXBXfvvTitZ
        u1Bs78bU9RVZr7kj7R1Cmb8Hej8WuLLefg+Dj95Sq86MTpHj22pDe+d/MtAVv/Cnj/kUw7cc
        u7LJqpLNf2U650x6uPLulrm3LBNfMEdes9jlMEltt3wJy1d29tj04kmhlvFlt+y/7paSWHBA
        7MCqepn01mvhe93avVoXrj/MXbpps0LuyRmH+mzP7OlRvvX2FZfvskPbD0cvXi6/O2+zrvLS
        yVorbBieLtYMuXY80FEp1jzt+US9YOnSK4KnlErvb9oQlGThpsRSnJFoqMVcVJwIADxDY4ZZ
        AwAA
X-CMS-MailID: 20201125213025eucas1p24fd0cb6e4383297f8527b2075ce3e4ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201125203125eucas1p1456f09a6d130e2f015707b4e5f9dbfc1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201125203125eucas1p1456f09a6d130e2f015707b4e5f9dbfc1
References: <CGME20201125203125eucas1p1456f09a6d130e2f015707b4e5f9dbfc1@eucas1p1.samsung.com>
        <20201125203114.130967-1-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On 25.11.2020 21:31, Ricardo Ribalda wrote:
> On architectures where the is no coherent caching such as ARM use the
> dma_alloc_noncontiguos API and handle manually the cache flushing using
> dma_sync_sg().
>
> With this patch on the affected architectures we can measure up to 20x
> performance improvement in uvc_video_copy_data_work().
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>
> v2: Thanks to Robin!
>
> Use dma_sync_sg instead of dma_sync_single
>
>
>   drivers/media/usb/uvc/uvc_video.c | 83 ++++++++++++++++++++++++++-----
>   drivers/media/usb/uvc/uvcvideo.h  |  2 +
>   2 files changed, 73 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a6a441d92b94..b2e6a9522999 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1490,6 +1490,11 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
>   	urb->transfer_buffer_length = stream->urb_size - len;
>   }
>   
> +static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
> +{
> +	return stream->dev->udev->bus->controller->parent;
> +}
> +
>   static void uvc_video_complete(struct urb *urb)
>   {
>   	struct uvc_urb *uvc_urb = urb->context;
> @@ -1539,6 +1544,10 @@ static void uvc_video_complete(struct urb *urb)
>   	 * Process the URB headers, and optionally queue expensive memcpy tasks
>   	 * to be deferred to a work queue.
>   	 */
> +	if (uvc_urb->pages) {
> +		dma_sync_sg_for_cpu(stream_to_dmadev(stream), uvc_urb->sgt.sgl,
> +				    uvc_urb->sgt.nents,	DMA_FROM_DEVICE);

Please use dma_sync_sgtable_for_cpu(stream_to_dmadev(stream), 
&uvc_urb->sgt, DMA_FROM_DEVICE);

I also think that there should be a call to 
dma_sync_sgtable_for_device() before starting the potential DMA 
transfer. Just to make sure that CPU wont trash the newly captured data 
and for the API completeness.

> +	}
>   	stream->decode(uvc_urb, buf, buf_meta);
>   
>   	/* If no async work is needed, resubmit the URB immediately. */
> @@ -1566,8 +1575,16 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>   			continue;
>   
>   #ifndef CONFIG_DMA_NONCOHERENT
> -		usb_free_coherent(stream->dev->udev, stream->urb_size,
> -				  uvc_urb->buffer, uvc_urb->dma);
> +		if (uvc_urb->pages) {
> +			sg_free_table(&uvc_urb->sgt);
> +			vunmap(uvc_urb->buffer);
> +			dma_free_noncontiguous(stream_to_dmadev(stream),
> +					       stream->urb_size,
> +					       uvc_urb->pages, uvc_urb->dma);
> +		} else {
> +			usb_free_coherent(stream->dev->udev, stream->urb_size,
> +					  uvc_urb->buffer, uvc_urb->dma);
> +		}
>   #else
>   		kfree(uvc_urb->buffer);
>   #endif
> @@ -1577,6 +1594,56 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>   	stream->urb_size = 0;
>   }
>   
> +#ifndef CONFIG_DMA_NONCOHERENT
> +static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> +				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> +{
> +	struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
> +
> +	if (!dma_can_alloc_noncontiguous(dma_dev)) {
> +		uvc_urb->buffer = usb_alloc_coherent(stream->dev->udev,
> +						     stream->urb_size,
> +						     gfp_flags | __GFP_NOWARN,
> +						     &uvc_urb->dma);
> +		return uvc_urb->buffer != NULL;
> +	}
> +
> +	uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> +						 &uvc_urb->dma,
> +						 gfp_flags | __GFP_NOWARN, 0);
> +	if (!uvc_urb->pages)
> +		return false;
> +
> +	uvc_urb->buffer = vmap(uvc_urb->pages,
> +			       PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
> +			       VM_DMA_COHERENT, PAGE_KERNEL);
> +	if (!uvc_urb->buffer) {
> +		dma_free_noncontiguous(dma_dev, stream->urb_size,
> +				       uvc_urb->pages, uvc_urb->dma);
> +		return false;
> +	}
> +
> +	if (sg_alloc_table_from_pages(&uvc_urb->sgt, uvc_urb->pages,
> +				PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT, 0,
> +				stream->urb_size, GFP_KERNEL)) {
> +		vunmap(uvc_urb->buffer);
> +		dma_free_noncontiguous(dma_dev, stream->urb_size,
> +				       uvc_urb->pages, uvc_urb->dma);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +#else
> +static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> +				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> +{
> +	uvc_urb->buffer = kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
> +
> +	return uvc_urb->buffer != NULL;
> +}
> +#endif
> +
>   /*
>    * Allocate transfer buffers. This function can be called with buffers
>    * already allocated when resuming from suspend, in which case it will
> @@ -1607,19 +1674,11 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>   
>   	/* Retry allocations until one succeed. */
>   	for (; npackets > 1; npackets /= 2) {
> +		stream->urb_size = psize * npackets;
>   		for (i = 0; i < UVC_URBS; ++i) {
>   			struct uvc_urb *uvc_urb = &stream->uvc_urb[i];
>   
> -			stream->urb_size = psize * npackets;
> -#ifndef CONFIG_DMA_NONCOHERENT
> -			uvc_urb->buffer = usb_alloc_coherent(
> -				stream->dev->udev, stream->urb_size,
> -				gfp_flags | __GFP_NOWARN, &uvc_urb->dma);
> -#else
> -			uvc_urb->buffer =
> -			    kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
> -#endif
> -			if (!uvc_urb->buffer) {
> +			if (!uvc_alloc_urb_buffer(stream, uvc_urb, gfp_flags)) {
>   				uvc_free_urb_buffers(stream);
>   				break;
>   			}
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a3dfacf069c4..3e6618a2ac82 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -532,6 +532,8 @@ struct uvc_urb {
>   
>   	char *buffer;
>   	dma_addr_t dma;
> +	struct page **pages;
> +	struct sg_table sgt;
>   
>   	unsigned int async_operations;
>   	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

