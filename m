Return-Path: <linux-media+bounces-36979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B3AFB099
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 12:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 606C816DEA6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 10:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA1E290BCD;
	Mon,  7 Jul 2025 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqwQUCoH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CCB16DEB1;
	Mon,  7 Jul 2025 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882441; cv=none; b=u3Gr60GKdleJZJHjizbanyeVxWe2+jdJfeTXor7Kt70z3ZR9MbBsVz9TvrEwRQkdHpqilYfWESYlLz9mRa8gsJSCJ9j5+f0K0PmnEVX3VfhupbsAynBN4XVgQshE+Oi6imv8Sh3GMBduIZYnmvppL8BOmYVpuqqUL48K4/s9wmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882441; c=relaxed/simple;
	bh=BlBD4CEIwIa0l/ZBHCnwTrIa4rAYovnkqlgWjQOi2VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqs4qXDk0+AY3pm3nPY2CCr5GBBykODcwsY9ivhzXSU+YOcgT3qdDZKh+Mv2HykM327FnaMjcfDN4ezQBlsbIH5SxX4cZXalgVg89jefftWJCgClth1fRQDG5k8TnbLQDccC/aSlnVUuAUF5KhzjQJmJ0Nvn0ofkYmdwlM4FGe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqwQUCoH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FEEC4CEEF;
	Mon,  7 Jul 2025 10:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751882440;
	bh=BlBD4CEIwIa0l/ZBHCnwTrIa4rAYovnkqlgWjQOi2VE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rqwQUCoHPdjiVgwMDgRtdwiJrd/O5Un5aNrzQs2VKgeZy9I2ujov5xihUM92ZTS5w
	 FZwBmZn8AYv5jVr1PpBx4hqrt65zyjUwcwEAgEfKmktZJhFunz/OhC7YFejOadZvEI
	 GDtyAVzcpOFEe6ugncojtXJefKTZ9Zxi5mad/Ez4WwgGTURhFv501pCTno0h11GXlY
	 VEntLYT3pw4MKDUJh0yb/Ic6EBInpztqZq+0q2LioHs+3ODR6LP2pPLFakq8FIWeAG
	 Kh4vznfoyqN1XinRMXv9VIfW8GeBBQXBoprXhyQVEQ+QzTLLaTHwbh96tZQOQwCZ0g
	 ogEzgDS9ajrSQ==
Message-ID: <c9824a36-7070-4600-9259-54b10b355790@kernel.org>
Date: Mon, 7 Jul 2025 12:00:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] media: stk1160: use
 usb_alloc_noncoherent/usb_free_noncoherent()
To: Xu Yang <xu.yang_2@nxp.com>, ezequiel@vanguardiasur.com.ar,
 mchehab@kernel.org, laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
 thomas.weissschuh@linutronix.de
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
 <20250704095751.73765-4-xu.yang_2@nxp.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250704095751.73765-4-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Jul-25 11:57, Xu Yang wrote:
> This will use USB noncoherent API to alloc/free urb buffers, then
> stk1160 driver needn't to do dma sync operations by itself.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
> Changes in v5:
>  - no changes
> Changes in v4:
>  - no changes
> Changes in v3:
>  - no changes
> ---
>  drivers/media/usb/stk1160/stk1160-v4l.c   |  4 ---
>  drivers/media/usb/stk1160/stk1160-video.c | 43 ++++++-----------------
>  drivers/media/usb/stk1160/stk1160.h       |  7 ----
>  3 files changed, 11 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
> index 5ba3d9c4b3fb..715ce1dcb304 100644
> --- a/drivers/media/usb/stk1160/stk1160-v4l.c
> +++ b/drivers/media/usb/stk1160/stk1160-v4l.c
> @@ -232,10 +232,6 @@ static int stk1160_start_streaming(struct stk1160 *dev)
>  
>  	/* submit urbs and enables IRQ */
>  	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
> -		struct stk1160_urb *stk_urb = &dev->isoc_ctl.urb_ctl[i];
> -
> -		dma_sync_sgtable_for_device(stk1160_get_dmadev(dev), stk_urb->sgt,
> -					    DMA_FROM_DEVICE);
>  		rc = usb_submit_urb(dev->isoc_ctl.urb_ctl[i].urb, GFP_KERNEL);
>  		if (rc) {
>  			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index 9cbd957ecc90..416cb74377eb 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -298,9 +298,7 @@ static void stk1160_process_isoc(struct stk1160 *dev, struct urb *urb)
>  static void stk1160_isoc_irq(struct urb *urb)
>  {
>  	int i, rc;
> -	struct stk1160_urb *stk_urb = urb->context;
> -	struct stk1160 *dev = stk_urb->dev;
> -	struct device *dma_dev = stk1160_get_dmadev(dev);
> +	struct stk1160 *dev = urb->context;
>  
>  	switch (urb->status) {
>  	case 0:
> @@ -315,10 +313,6 @@ static void stk1160_isoc_irq(struct urb *urb)
>  		return;
>  	}
>  
> -	invalidate_kernel_vmap_range(stk_urb->transfer_buffer,
> -				     urb->transfer_buffer_length);
> -	dma_sync_sgtable_for_cpu(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
> -
>  	stk1160_process_isoc(dev, urb);
>  
>  	/* Reset urb buffers */
> @@ -327,7 +321,6 @@ static void stk1160_isoc_irq(struct urb *urb)
>  		urb->iso_frame_desc[i].actual_length = 0;
>  	}
>  
> -	dma_sync_sgtable_for_device(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
>  	rc = usb_submit_urb(urb, GFP_ATOMIC);
>  	if (rc)
>  		stk1160_err("urb re-submit failed (%d)\n", rc);
> @@ -365,11 +358,9 @@ void stk1160_cancel_isoc(struct stk1160 *dev)
>  
>  static void stk_free_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb)
>  {
> -	struct device *dma_dev = stk1160_get_dmadev(dev);
> -
> -	dma_vunmap_noncontiguous(dma_dev, stk_urb->transfer_buffer);
> -	dma_free_noncontiguous(dma_dev, stk_urb->urb->transfer_buffer_length,
> -			       stk_urb->sgt, DMA_FROM_DEVICE);
> +	usb_free_noncoherent(dev->udev, stk_urb->urb->transfer_buffer_length,
> +			     stk_urb->transfer_buffer, DMA_FROM_DEVICE,
> +			     stk_urb->sgt);
>  	usb_free_urb(stk_urb->urb);
>  
>  	stk_urb->transfer_buffer = NULL;
> @@ -410,32 +401,19 @@ void stk1160_uninit_isoc(struct stk1160 *dev)
>  static int stk1160_fill_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb,
>  			    int sb_size, int max_packets)
>  {
> -	struct device *dma_dev = stk1160_get_dmadev(dev);
> -
>  	stk_urb->urb = usb_alloc_urb(max_packets, GFP_KERNEL);
>  	if (!stk_urb->urb)
>  		return -ENOMEM;
> -	stk_urb->sgt = dma_alloc_noncontiguous(dma_dev, sb_size,
> -					       DMA_FROM_DEVICE, GFP_KERNEL, 0);
> -
> -	/*
> -	 * If the buffer allocation failed, we exit but return 0 since
> -	 * we allow the driver working with less buffers
> -	 */
> -	if (!stk_urb->sgt)
> -		goto free_urb;
>  
> -	stk_urb->transfer_buffer = dma_vmap_noncontiguous(dma_dev, sb_size,
> -							  stk_urb->sgt);
> +	stk_urb->transfer_buffer = usb_alloc_noncoherent(dev->udev, sb_size,
> +							 GFP_KERNEL, &stk_urb->dma,
> +							 DMA_FROM_DEVICE, &stk_urb->sgt);
>  	if (!stk_urb->transfer_buffer)
> -		goto free_sgt;
> +		goto free_urb;
>  
> -	stk_urb->dma = stk_urb->sgt->sgl->dma_address;
>  	stk_urb->dev = dev;
>  	return 0;
> -free_sgt:
> -	dma_free_noncontiguous(dma_dev, sb_size, stk_urb->sgt, DMA_FROM_DEVICE);
> -	stk_urb->sgt = NULL;
> +
>  free_urb:
>  	usb_free_urb(stk_urb->urb);
>  	stk_urb->urb = NULL;
> @@ -494,12 +472,13 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
>  		urb->transfer_buffer = dev->isoc_ctl.urb_ctl[i].transfer_buffer;
>  		urb->transfer_buffer_length = sb_size;
>  		urb->complete = stk1160_isoc_irq;
> -		urb->context = &dev->isoc_ctl.urb_ctl[i];
> +		urb->context = dev;
>  		urb->interval = 1;
>  		urb->start_frame = 0;
>  		urb->number_of_packets = max_packets;
>  		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
>  		urb->transfer_dma = dev->isoc_ctl.urb_ctl[i].dma;
> +		urb->sgt = dev->isoc_ctl.urb_ctl[i].sgt;
>  
>  		k = 0;
>  		for (j = 0; j < max_packets; j++) {
> diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
> index 7b498d14ed7a..4cbcb0a03bab 100644
> --- a/drivers/media/usb/stk1160/stk1160.h
> +++ b/drivers/media/usb/stk1160/stk1160.h
> @@ -16,8 +16,6 @@
>  #include <media/videobuf2-v4l2.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ctrls.h>
> -#include <linux/usb.h>
> -#include <linux/usb/hcd.h>
>  
>  #define STK1160_VERSION		"0.9.5"
>  #define STK1160_VERSION_NUM	0x000905
> @@ -195,8 +193,3 @@ void stk1160_select_input(struct stk1160 *dev);
>  
>  /* Provided by stk1160-ac97.c */
>  void stk1160_ac97_setup(struct stk1160 *dev);
> -
> -static inline struct device *stk1160_get_dmadev(struct stk1160 *dev)
> -{
> -	return bus_to_hcd(dev->udev->bus)->self.sysdev;
> -}


