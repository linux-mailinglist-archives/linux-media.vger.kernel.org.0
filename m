Return-Path: <linux-media+bounces-36994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 801C3AFB375
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F2471AA3C3C
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 12:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEE029B229;
	Mon,  7 Jul 2025 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRTK8kCE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD4229B201;
	Mon,  7 Jul 2025 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892193; cv=none; b=YOYseMIk6f4E21Gjr6x/5kCc8VKAUPLZn5SKQDSDkkk+oUojIFKnSADWPpnGIDQNuBS3W4ZQrGBoJfqW+AI+KkDXP0RF4C+X12HnKOD8BiprbzHDJm7gKqzKQCILRKuZZeA8712Ny/VuvLBvmXWnjQ9xz96XvSwNO6yM74jqU2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892193; c=relaxed/simple;
	bh=xrRnIx9QpUIyAN1PO+JteAVR0eYKq/l6fSp6iyFVuO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCQjMLHurpwyBFWCWZoV9ekFnXRYv/ZCLyiSgwJIdnlG3/XNMZT9HDdctHXPSqLHOYEhngz06oOfHbFVVKbs2+xYNz/s6VEDgJfyi5UP2L0k8CxQ5C9GUpQG6cZtiCjRUwS3PnDC42t4ikcqHQAABXc8bprPq2lxseFy1bQ/Y9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vRTK8kCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C21C4CEE3;
	Mon,  7 Jul 2025 12:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751892192;
	bh=xrRnIx9QpUIyAN1PO+JteAVR0eYKq/l6fSp6iyFVuO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vRTK8kCE04woMUA7dPr0UBnKPKTote9Sf7GXxIoG/uOFcb4TUj5oK8NKfc+VO8fja
	 MxHRA3CLUjWGq3+TzMYrP3WW/btL5PZZh8X7fD4mT8+U2r798iPUbAZhv8trTihgbm
	 mXF52KiUQJOUK+ZXAmvtxGLP5krkBk0eQRPNy/1vFaKNlFzs8tZJTurxqIcf9Fj/qz
	 16wgtm7D3SKjYEtppr2ItqvSGFWfAiPk2srkrvVWJngaPn44le3YNz13QZ944W3ikL
	 SC6PZ+8quzTtv6stQButSSzlL0d1P18nNXHxBZYiiMzhAfvfIFY1L0ZsV0nnsX7FhY
	 Lz5T5SpIjfXFw==
Message-ID: <45b69c6c-e8d5-4b71-9759-cd76eb1a7258@kernel.org>
Date: Mon, 7 Jul 2025 14:43:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uvcvideo: avoid variable shadowing in
 uvc_ctrl_cleanup_fh
To: Desnes Nunes <desnesn@redhat.com>, laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20250701172556.117872-1-desnesn@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250701172556.117872-1-desnesn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1-Jul-25 19:25, Desnes Nunes wrote:
> This avoids a variable loop shadowing occurring between the local loop
> iterating through the uvc_entity's controls and the global one going
> through the pending async controls of the file handle
> 
> Cc: stable@kernel.org
> Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>

Thank you for the new version.

I've pushed this to uvc/for-next now:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/

Note I had to manually apply the patch because of it conflicting with:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commit/2b1e8e9f7bb30204ddb42887c4e554c131f003c9

So if you want this backported to stable you will need to send
the original version to stable your self.

I plan to send a pull-request with the changes from for-next this Thursday.

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 44b6513c5264..532615d8484b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>  	struct uvc_entity *entity;
> -	int i;
> +	unsigned int i;
>  
>  	guard(mutex)(&handle->chain->ctrl_mutex);
>  
> @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  		return;
>  
>  	list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> -		for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> +		for (i = 0; i < entity->ncontrols; ++i) {
>  			if (entity->controls[i].handle != handle)
>  				continue;
>  			uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);


