Return-Path: <linux-media+bounces-38172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7C9B0C3E9
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 14:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4157116FC83
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 12:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E8F2D3744;
	Mon, 21 Jul 2025 12:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqOzdWnr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45C1290D98;
	Mon, 21 Jul 2025 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753100084; cv=none; b=MoXV7jk3emUEHcnDKtEJxvb1LbOHjbEFWZgwj7ZHtgFxNZDEOYtAtitvYXYx+l1KjO2MuCmdRake+dDSw69jVwBr4g9FM7x0xG1qtEEjNPYUHWjTUhlFxaeAhpJd1+QyMvTgHW/z27lAcuFy6y5OCMJNn9s4kelIghDSKstqbgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753100084; c=relaxed/simple;
	bh=r6Prt77FFmpAD0A9YLjazJMHos7FFZVR+/J6D3g9Sag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYHqxb+Gy5RrPm1K0aYt7qSSVtxkPEH39B1wPtkNtHjlcHV0cQWWqEU7Ob+XKW8yYXN9LtYaf8QaRPc0tgx993Z2kNLbM1Q5WSCwFQa4mq9eeQDR+88WyWHmZnk4Ofn2+stPHb4KrCG16WJinJHczWbjSQpP04kWWf4lClfFmMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqOzdWnr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268E3C4CEED;
	Mon, 21 Jul 2025 12:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753100084;
	bh=r6Prt77FFmpAD0A9YLjazJMHos7FFZVR+/J6D3g9Sag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FqOzdWnrJvNWvwCTpNVMlSzLtNZ77ajcQ3XQLobE4hFIkEtcCQKXWxAJ1lkoN53E7
	 2iN4jsXIrZzdSL9z9fu42FH5Pstv/8Oz+51jt/NeC84IPV7hq+CSR5i1cUF5L6MK6U
	 RdGwA1i4ipByYpatc5dBGb6UeHctS3J9j9hMy6wgIk+J4CYwBXVmkcaoMBDeF72wBi
	 WS1vNeS8NYY1xAK/bdo5vFLETKTFxczcc6oyfyn2asg+avZMqNeWKOAwCpdzciKKFo
	 lM7EbPPxUDOd6PfSXVnkQbjb/xlMgmdIkgrhZiW9luovI7+zrySmisjzLcGenNO5DO
	 CixON+Spu94Ag==
Message-ID: <577b3ed7-3f99-4fe3-ab97-a7f8fa6fd3a9@kernel.org>
Date: Mon, 21 Jul 2025 14:14:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uvcvideo: Fix comments in uvc_meta_detect_msxu
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716-uvc-meta-followup-v2-1-d3c2b995af3d@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250716-uvc-meta-followup-v2-1-d3c2b995af3d@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Jul-25 12:43 PM, Ricardo Ribalda wrote:
> The comments can be more precise. Let's fix them.
> 
> Fixes: 6cb786f040ad ("media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META")
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> This series fixes the uvc metadata series landed in:
> https://patchwork.linuxtv.org/project/linux-media/patch/998c5fb0-8d32-496c-a1e2-cc9c1a73ede0@kernel.org/
> 
> There is no need to Cc: stable, because the series have not landed in
> any stable kernel.
> ---
> Changes in v2:
> - Improve comment even more... Thanks Laurent
> - Link to v1: https://lore.kernel.org/r/20250714-uvc-meta-followup-v1-1-67bd2dc05ef2@chromium.org

Thank you for your patch.

I have merged this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 229e08ff323eed9129d835b24ea2e8085bb713b8..2eea543b0575598279d7537ea767ca521b6431c0 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -196,7 +196,10 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>  	if (!data)
>  		return -ENOMEM;
>  
> -	/* Check if the metadata is already enabled. */
> +	/*
> +	 * Check if the metadata is already enabled, or if the device always
> +	 * returns metadata.
> +	 */
>  	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
>  			     MSXU_CONTROL_METADATA, data, sizeof(*data));
>  	if (ret)
> @@ -208,9 +211,11 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>  	}
>  
>  	/*
> -	 * We have seen devices that require 1 to enable the metadata, others
> -	 * requiring a value != 1 and others requiring a value >1. Luckily for
> -	 * us, the value from GET_MAX seems to work all the time.
> +	 * Set the value of MSXU_CONTROL_METADATA to the value reported by
> +	 * GET_MAX to enable production of MSXU metadata. The GET_MAX request
> +	 * reports the maximum size of the metadata, if its value is 0 then MSXU
> +	 * metadata is not supported. For more information, see
> +	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#2229-metadata-control
>  	 */
>  	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
>  			     MSXU_CONTROL_METADATA, data, sizeof(*data));
> 
> ---
> base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> change-id: 20250714-uvc-meta-followup-1ccb6e8efc2b
> 
> Best regards,


