Return-Path: <linux-media+bounces-45143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D3BF7958
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 18:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 33ECB4E4D7F
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 16:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B189C345CB2;
	Tue, 21 Oct 2025 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEB55zFM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177533431F5;
	Tue, 21 Oct 2025 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761062874; cv=none; b=EvoUaUPAeNaFlzzbhsNptRD3LYQigwfUiO2t5aK8g74SssaiPFvr9h9zRMlAnrsxOmrzs4G4ETMYbtQtL6iJ5snPNNQi2p0IMQ25RXlMaOuOgK+ws5+ZnZIh8DYZBaIr0RsAROX9UVnNzC8x6TIe03tWZNVnDT0PvGTejcDCqrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761062874; c=relaxed/simple;
	bh=phzVeN8JZqKv0wjezRAZHMETLGOABIP7cx5lHSdF9jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8/bD/d5OIPgVK8ZHpn0cBb7L6uXlVJuXjhe4k5Ng6hQp68/E6u20SvqbzUI/0YdKi/Sct+7abkvHv2xT8IDvUJUBjImLasVTbVFZRNuyGnT0QQ5kMU/Ml56nm35iBGpmngAF0VBd1Z72uMY3QxMl/HdGR3YTUFDone1Mx4nUhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEB55zFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD869C4CEF1;
	Tue, 21 Oct 2025 16:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761062873;
	bh=phzVeN8JZqKv0wjezRAZHMETLGOABIP7cx5lHSdF9jE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VEB55zFMSCjNcVaK9OxeWda6dja3YhGL+XA9903YnU4kVpR8iZPJgZ3d62g4tsgF2
	 VSEH+sY0UMtf+kuVrxnlTHvzpBN2a1c2XUIPJyeGl6FbELZy0tXfqMimEKlf4RcZaW
	 a2r+LT4NltF6WeSjY10SNO/SadKVGs+0vk8xAqs1z3H4EZ9yQoYsK7UtG4knK39y6t
	 HIfXfAJP/zMwRnn0LbpeJxCKGdiI7NQEEPYZmZWk9wyZjMHaQ/mEfdm5B8N7JXu5ZK
	 4USlm+D488xU21y4zUuojJdKWNzBdg4SOpK+Q30kn12jJqGHIJsgZW5XaZ403OLEOQ
	 00H2DqPGgVGNg==
Message-ID: <b282f6ef-fd91-44ea-bf51-187cf2c56fc6@kernel.org>
Date: Tue, 21 Oct 2025 18:07:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uvcvideo: Use heuristic to find stream entity
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Angel4005 <ooara1337@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021-uvc-grandstream-v2-1-6a74a44f4419@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251021-uvc-grandstream-v2-1-6a74a44f4419@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Oct-25 12:36, Ricardo Ribalda wrote:
> Some devices, like the Grandstream GUV3100 webcam, have an invalid UVC
> descriptor where multiple entities share the same ID, this is invalid
> and makes it impossible to make a proper entity tree without heuristics.
> 
> We have recently introduced a change in the way that we handle invalid
> entities that has caused a regression on broken devices.
> 
> Implement a new heuristic to handle these devices properly.
> 
> Reported-by: Angel4005 <ooara1337@gmail.com>
> Closes: https://lore.kernel.org/linux-media/CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com/
> Fixes: 0e2ee70291e6 ("media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
> I have managed to get my hands into a Grandstream GUV3100 and
> implemented a new heuristics. (Thanks Yunke and Hidenori!).
> 
> With this heuristics we can use this camera again (see the /dev/video0
> in the topology).
> 
> I have tested this change in a 6.6 kernel. Because the notebook that I
> used for testing has some issues running master. But for the purpose of
> this change this test should work.
> 
> ~ # media-ctl --print-topology
> Media controller API version 6.6.99
> 
> Media device information
> ------------------------
> driver          uvcvideo
> model           GRANDSTREAM GUV3100: GRANDSTREA
> serial
> bus info        usb-0000:00:14.0-9
> hw revision     0x409
> driver version  6.6.99
> 
> Device topology
> - entity 1: GRANDSTREAM GUV3100: GRANDSTREA (1 pad, 1 link)
>             type Node subtype V4L flags 1
>             device node name /dev/video0
>         pad0: SINK
>                 <- "Extension 3":1 [ENABLED,IMMUTABLE]
> 
> - entity 4: GRANDSTREAM GUV3100: GRANDSTREA (0 pad, 0 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video1
> 
> - entity 8: Extension 3 (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>         pad0: SINK
>                 <- "Processing 2":1 [ENABLED,IMMUTABLE]
>         pad1: SOURCE
>                 -> "GRANDSTREAM GUV3100: GRANDSTREA":0 [ENABLED,IMMUTABLE]
> 
> - entity 11: Processing 2 (2 pads, 3 links, 0 routes)
>              type V4L2 subdev subtype Unknown flags 0
>         pad0: SINK
>                 <- "Camera 1":0 [ENABLED,IMMUTABLE]
>         pad1: SOURCE
>                 -> "Extension 3":0 [ENABLED,IMMUTABLE]
>                 -> "Extension 4":0 [ENABLED,IMMUTABLE]
> 
> - entity 14: Extension 4 (2 pads, 1 link, 0 routes)
>              type V4L2 subdev subtype Unknown flags 0
>         pad0: SINK
>                 <- "Processing 2":1 [ENABLED,IMMUTABLE]
>         pad1: SOURCE
> 
> - entity 17: Camera 1 (1 pad, 1 link, 0 routes)
>              type V4L2 subdev subtype Sensor flags 0
>         pad0: SOURCE
>                 -> "Processing 2":0 [ENABLED,IMMUTABLE]
> ---
> Changes in v2:
> - Fix : invalid reference to the index variable of the iterator.
> - Link to v1: https://lore.kernel.org/r/20251021-uvc-grandstream-v1-1-801e3d08b271@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..ee4f54d6834962414979a046afc59c5036455124 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -167,13 +167,26 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
>  
>  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
>  {
> -	struct uvc_streaming *stream;
> +	struct uvc_streaming *stream, *last_stream;
> +	unsigned int count = 0;
>  
>  	list_for_each_entry(stream, &dev->streams, list) {
> +		count += 1;
> +		last_stream = stream;
>  		if (stream->header.bTerminalLink == id)
>  			return stream;
>  	}
>  
> +	/*
> +	 * If the streaming entity is referenced by an invalid ID, notify the
> +	 * user and use heuristics to guess the correct entity.
> +	 */
> +	if (count == 1 && id == UVC_INVALID_ENTITY_ID) {
> +		dev_warn(&dev->intf->dev,
> +			 "UVC non compliance: Invalid USB header. The streaming entity has an invalid ID, guessing the correct one.");
> +		return last_stream;
> +	}
> +
>  	return NULL;
>  }
>  
> 
> ---
> base-commit: ea299a2164262ff787c9d33f46049acccd120672
> change-id: 20251021-uvc-grandstream-05ecf0288f62
> 
> Best regards,


