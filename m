Return-Path: <linux-media+bounces-36980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5FFAFB0A4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 12:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23B031AA3A99
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 10:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF57291C32;
	Mon,  7 Jul 2025 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gb7q9y2c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AD021D00A;
	Mon,  7 Jul 2025 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882567; cv=none; b=ZT97D1xU67XXxyF5ZILI4IdtUyTedvEPAu3Mbb3TYhCf1Av8s62roQJbprhCz9bYlIMuaF3xpS17AeQhlYsHyCqRNYLIzmAn5gp43fZAznytXua2Qb/PwXTmeCp8omrmTW1QuLFNV7AJnryPv0sEixO2VjLg17jNzp/tMqOaBZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882567; c=relaxed/simple;
	bh=mEIOfUY2JXpet4vxLmM/SsHUpRzcFXQhLNeexbXH6J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qmg7GK4qlar29sazG1cSvcpa1QuCJoYBz1KgjOZkojSX9hKrt2CR/SzLHCmXlWCmP7Vc75pttOiBpYDHdOjXWoU1/m4oCYfPJi6MXkwJg5E5iVTi74Z/ueg1+9l72vLwRKGa2hRNqWpHML2R5eJ3gj3qm3oo4FF/24f+Jxkw5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gb7q9y2c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAB1C4CEE3;
	Mon,  7 Jul 2025 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751882566;
	bh=mEIOfUY2JXpet4vxLmM/SsHUpRzcFXQhLNeexbXH6J0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gb7q9y2cTRPJvEoQ/IL+VO9uBApPN9RNkIRh1LzZdLrMCjjdQdCHV9HYqp6C8fsTc
	 DVEn1dpjwneSpw113egooLKHojkHEMFUx0+34VRTQIiaca8TUulrVJUAvIotpIVKG6
	 2M+UFRXZCL7ksNCCc/KEXibyp+6zAL9hh6t2+gIH9Y5WpGRUQxWtDJLQE/T+io3l/m
	 EN8LCsOaCGEbxOk1zMcPtF/u3QWaWsMV2jHV9mwNSPEFQAZkITIln16yjM67Vs/ZRn
	 AmbY9iwi0Y0TdWW6vUFoMLr3/iJoLd4Iczu3Mwkg1h5u1f+NK1RzDCo0E7QOOWeBu5
	 0SDI9lv3uA6jQ==
Message-ID: <78b86f34-6477-436a-b59c-b0ae5371f581@kernel.org>
Date: Mon, 7 Jul 2025 12:02:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] add dma noncoherent API
To: Xu Yang <xu.yang_2@nxp.com>, ezequiel@vanguardiasur.com.ar,
 mchehab@kernel.org, laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
 thomas.weissschuh@linutronix.de
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250704095751.73765-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 4-Jul-25 11:57, Xu Yang wrote:
> On architectures where there is no coherent caching such as ARM it's
> proved that using dma_alloc_noncontiguous API and handling manually
> the cache flushing will significantly improve performance.
> 
> Refer to:
> commit 20e1dbf2bbe2 ("media: uvcvideo: Use dma_alloc_noncontiguous API")
> commit 68d0c3311ec1 ("media: stk1160: use dma_alloc_noncontiguous API")
> 
> However, it's obvious that there is significant code duplication between
> these two commits. Besides, a potential user USB Monitor may read outdated
> data before the driver do DMA sync for CPU which will make the data
> unreliable.
> 
> To reduce code duplication and avoid USB Monitor result unreliable, this
> series will introduce DMA noncoherent API to USB core. And the USB core
> layer will manage synchronization itself.
> 
> Then the last 2 patches have used the API.
> 
> I have tested uvcvideo driver. But I haven't tested stk1160 driver as I
> don't have such boards. @Ezequiel Garcia, @Dafna Hirschfeld do you have
> time to test it? Your support on this would be greatly appreciated.

It seems that patches 1 + 2 are ready for merging now
(for patch 3 we should probably wait for testing).

I think that it would be best for both patches 1 + 2 to
be merged through the USB tree. The changed code in the UVC
driver is not touched that often so I do not expect any
conflicts.

Regards,

Hans




> Changes in v5:
>  - improve if-else logic as suggested by Andy and Alan.
>  - add Reviewed-by tag
> 
> Changes in v4:
>  - https://lore.kernel.org/all/20250703103811.4048542-1-xu.yang_2@nxp.com/
>  - improve if-else logic
>  - remove uvc_stream_to_dmadev()
> 
> Changes in v3:
>  - https://lore.kernel.org/all/20250702110222.3926355-1-xu.yang_2@nxp.com/
>  - put Return section at the end of description
>  - correct some abbreviations
>  - remove usb_dma_noncoherent_sync_for_cpu() and
>    usb_dma_noncoherent_sync_for_device()
>  - do DMA sync in usb_hcd_map_urb_for_dma() and
>    usb_hcd_unmap_urb_for_dma()
>  - call flush_kernel_vmap_range() for OUT transfers
>    and invalidate_kernel_vmap_range() for IN transfers 
> 
> Changes in v2:
>  - https://lore.kernel.org/all/20250627101939.3649295-1-xu.yang_2@nxp.com/
>  - handle it in USB core
> 
> v1:
>  - https://lore.kernel.org/linux-usb/20250614132446.251218-1-xu.yang_2@nxp.com/
> 
> Xu Yang (3):
>   usb: core: add dma-noncoherent buffer alloc and free API
>   media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
>   media: stk1160: use usb_alloc_noncoherent/usb_free_noncoherent()
> 
>  drivers/media/usb/stk1160/stk1160-v4l.c   |  4 --
>  drivers/media/usb/stk1160/stk1160-video.c | 43 ++++--------
>  drivers/media/usb/stk1160/stk1160.h       |  7 --
>  drivers/media/usb/uvc/uvc_video.c         | 61 ++++-------------
>  drivers/usb/core/hcd.c                    | 29 +++++---
>  drivers/usb/core/usb.c                    | 80 +++++++++++++++++++++++
>  include/linux/usb.h                       | 11 ++++
>  7 files changed, 137 insertions(+), 98 deletions(-)
> 


