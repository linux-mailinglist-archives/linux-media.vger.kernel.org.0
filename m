Return-Path: <linux-media+bounces-45146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE20BF7C29
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 18:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03B8419A7638
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 16:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363943570D6;
	Tue, 21 Oct 2025 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="evB/hcww"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064043570C4;
	Tue, 21 Oct 2025 16:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761065100; cv=none; b=a0JlzxSgU/0MYQoo+1WnyaiA4PgA28CkXXQgf+leuIMsWBcmsow15iep58qKSFLk7/xXzwY6GrsnbI1D9qMByvbtHXRImJ6eq+zM2qG23rCtOdA7YnFAWz0i9jmDcsm1PYojGXKk+dltUZfzeCgeue/2gaVSvZbSAS90uLMVQWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761065100; c=relaxed/simple;
	bh=oYTxmh4wtWgUQEG+DBhGEu0vK3czTdCkzUrhvM7RwJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQtu1rJjimcS+sgilM8Qq+DVRpxbNr3E7eeDzdw5MKbsUVnO1r3UaOatthPkzoUGwjLXGPjzWjzHuJHpwv88ieUfPRYEGIl1Fhmye/tdQYYqtudcm/FJD2H08kLElIBvG88fICuEye7cwF2Mw/Utdw/GuDLM2msUSynT4UGIEns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=evB/hcww; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4043CE01;
	Tue, 21 Oct 2025 18:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761064991;
	bh=oYTxmh4wtWgUQEG+DBhGEu0vK3czTdCkzUrhvM7RwJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evB/hcww7bKUpGxb0Wm0QOW8UnoHI3TTJn1cBBy3ALSUugHGpTFQ2mGGAb8Em+M0m
	 R7gQHORRE0mtR2Te9v1vvaMBmP3H32lf13ZFFz17Wfe7xGqsKukpIfsZKJ/kukclFd
	 AAYiqBH4hjzrkMx9++4nEVo1JVFLHSLZF16Y6V+Y=
Date: Tue, 21 Oct 2025 19:44:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	Angel4005 <ooara1337@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Use heuristic to find stream entity
Message-ID: <20251021164443.GA727@pendragon.ideasonboard.com>
References: <20251021-uvc-grandstream-v2-1-6a74a44f4419@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251021-uvc-grandstream-v2-1-6a74a44f4419@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Oct 21, 2025 at 10:36:17AM +0000, Ricardo Ribalda wrote:
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

As far as I understand, the reason why we can't find the streaming
interface here is because we have set the streaming output terminal ID
to UVC_INVALID_ENTITY_ID, due to the extension unit being previously
registered with the same ID. We're therefore adding a workaround on top
of another workaround.

Looking at the UVC descriptors for this camera, ID 4 is shared between
an extension unit with GUID ffe52d21-8030-4e2c-82d9-f587d00540bd and the
streaming output terminal. That GUID is apparently a Logitech GUID
(according to https://github.com/soyersoyer/cameractrls/blob/c920e/cameractrls.py).
I don't know if the XU actually works in that camera, but it could be
useful to keep it functional.

I think we could make the handling of non-unique IDs more clever. If an
output streaming terminal and a unit share the same ID, we could
allocate an unused ID for the output streaming terminal, and patch the
bTerminalLink of the stream headers accordingly. The ID remapping should
not cause other issues, as

- streaming output terminals have no controls, so the ID isn't used to
  reference controls

- the units graph is build from sink to source, with UVC descriptors
  containing the IDs of source units, so streaming output terminals are
  never referenced by ID from descriptors except for the bTerminalLink.

This would produce a valid graph without duplicated IDs in this case.

> +
>  	return NULL;
>  }
>  
> 
> ---
> base-commit: ea299a2164262ff787c9d33f46049acccd120672
> change-id: 20251021-uvc-grandstream-05ecf0288f62

-- 
Regards,

Laurent Pinchart

