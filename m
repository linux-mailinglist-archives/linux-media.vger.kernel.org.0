Return-Path: <linux-media+bounces-34931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC01ADB25E
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40C23169F57
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F387C292B30;
	Mon, 16 Jun 2025 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVOWMnbB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497272877F4;
	Mon, 16 Jun 2025 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081423; cv=none; b=tHhZv8+KpQ1FRXz013wVg/GXYh/RcwrBtPdRpU6U0d4Ozl4ymFnhk4xpcX1CPX0aoQezMFb3abwKivN9xYRtMajQmOOmhUs2NDHnDj2Do0DS2h2LCL8gh3In1Nxb+nBxzF5NSiVQJESQbXPG8qCGyjzB77f/uEo2hZe4uwki5VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081423; c=relaxed/simple;
	bh=k7LiXmpneGGZlKOZqJATN5n77gx0tL5sRJlWmRS/GVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/oUJ6alN11geMoP1s3Q8+6/CDJ25LP3eXoQ/e4OltgjePI3Db/S01tgyP68qp4UsF+2sTl4KTxozlwMrcMCt0l4tV+Y++aXwb7gUHWDdaSmY/Sv8yS3tCDtXFTTeEO8EebScTR1EVIlajXUt2oufXLGYam6t+WoQLNh6pOpZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVOWMnbB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F13C4CEED;
	Mon, 16 Jun 2025 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750081422;
	bh=k7LiXmpneGGZlKOZqJATN5n77gx0tL5sRJlWmRS/GVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kVOWMnbBQoMPe8SvitQMN7FT5af8R2dLwfFhrJnhKNg90ZNk9w6nYrswggObowW9b
	 /G9SLzGPT9C2kDEw1P5U/Vowp2ELFxQMffaKoA199d/tVDOUjimfC2P3o9oX9tpN/l
	 juUiSJoBYpqRhtQbnuRMzCN/rsktvkgAJ9rYDk/BUHUb0IPNF5cVo2wlLB/eIC+HNM
	 kFx4TEZreikiDnjGugENNwmpquggC1yozLmliPDfEgNujCX+G++VsXm7YSNKPmeW5P
	 X5tvtypzLS4TAbGM2WU2SM1Cy7Y9u4K994xENnZyXwismWtslqp+b1ASJ1EQBT08dw
	 JmG7+uahAKJNg==
Message-ID: <6c414772-6bff-4509-b7ec-4aef2982e758@kernel.org>
Date: Mon, 16 Jun 2025 15:43:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: uvcvideo: add URB_USBMON_NEED_SYNC urb flag
To: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, jeff.johnson@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-usb@vger.kernel.org, jun.li@nxp.com,
 imx@lists.linux.dev
References: <20250614132446.251218-1-xu.yang_2@nxp.com>
 <20250614132446.251218-2-xu.yang_2@nxp.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250614132446.251218-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Jun-25 15:24, Xu Yang wrote:
> Since commit "20e1dbf2bbe2 media: uvcvideo: Use dma_alloc_noncontiguous
> API", the driver is allocating non-coherent buffer for urb. This will
> add URB_USBMON_NEED_SYNC flag to inform usb monitor needs do dma sync
> when record data.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..446b3f16545d 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1946,7 +1946,8 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>  		urb->context = uvc_urb;
>  		urb->pipe = usb_rcvisocpipe(stream->dev->udev,
>  				ep->desc.bEndpointAddress);
> -		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
> +		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP |
> +				      URB_USBMON_NEED_SYNC;
>  		urb->transfer_dma = uvc_urb->dma;
>  		urb->interval = ep->desc.bInterval;
>  		urb->transfer_buffer = uvc_urb->buffer;


