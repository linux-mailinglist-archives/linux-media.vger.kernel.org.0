Return-Path: <linux-media+bounces-15237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C9938C25
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 11:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FCFE1C20C34
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 09:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EDE16C6BE;
	Mon, 22 Jul 2024 09:35:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0FA168497;
	Mon, 22 Jul 2024 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721640928; cv=none; b=TcBE6RhIoL7puipEIMPgQ0LVEOPWgSjcN8RelLMfKuwo/TY+K8CewPJreaZkDllMFGhUjevtKcsxsNe4i4rRmX7iTdg3uXRG+S4lDHt/rxfEa5BqRClTSvVWGPI/5+xSctIT+T3YHvUjgVcbJBGNgiQkqQkfRqctmliT9M0O5sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721640928; c=relaxed/simple;
	bh=E/62SLz/WTCR+Y3xo1p8tvDT7lXpaoTHmTq4RnYUdPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tG6TsfndkseFMkrtlKQMzRhZz4NWEdiOch77Z/nJSpAPJ7rk8Gb2FDd9TiS+Y4ZaBVVt4MwInaJk2popOyhutWcbfqQnyoEBmrdFyyx6vEeIHy8174Oy1AUv9RCCT+f/gqCut9XY0AkZ27bP6xWK4+3h3M8Ca4nlqoLlfCbrhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.53] (ip5f5ae9a6.dynamic.kabel-deutschland.de [95.90.233.166])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3EA4A61E5FE05;
	Mon, 22 Jul 2024 11:35:03 +0200 (CEST)
Message-ID: <c5ce1fd3-9d6a-45c9-aba9-a6a6e06d8b4f@molgen.mpg.de>
Date: Mon, 22 Jul 2024 11:35:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Fix custom control mapping probing
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240722-fix-filter-mapping-v1-1-07cc9c6bf4e3@chromium.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240722-fix-filter-mapping-v1-1-07cc9c6bf4e3@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Ricardo,


Thank you very much for your patch.

Am 22.07.24 um 09:59 schrieb Ricardo Ribalda:
> Custom control mapping introduced a bug, where the filter function was
> applied to every single control.

I’d paste the error messages, so the commit can be easily found.

> Fix it so it is only applied to the matching controls.
> 
> Reported-by: Paul Menzen <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/linux-media/518cd6b4-68a8-4895-b8fc-97d4dae1ddc4@molgen.mpg.de/T/#t
> Cc: stable@vger.kernel.org
> Fixes: 8f4362a8d42b ("media: uvcvideo: Allow custom control mapping")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Paul, could you check if this fixes your issue, thanks!

     $ b4 shazam 
https://lore.kernel.org/linux-media/20240722-fix-filter-mapping-v1-1-07cc9c6bf4e3@chromium.org/T/#u
     $ git log --oneline -2
     1391c45f04fb (HEAD -> master) media: uvcvideo: Fix custom control 
mapping probing
     933069701c1b (origin/master, origin/HEAD) Merge tag 
'6.11-rc-smb3-server-fixes' of git://git.samba.org/ksmbd

Yes, it does fix it on the Dell XPS 13 9360:

     $ sudo dmesg --level alert,crit,err,warn
     [    0.293264] hpet_acpi_add: no address or irqs in _CRS
     [    0.340614] i8042: Warning: Keylock active
     [    0.352146] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
     [    1.680610] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is 
disabled. Duplicate IMA measurements will not be recorded in the IMA log.
     [    9.012306] wmi_bus wmi_bus-PNP0C14:01: [Firmware Bug]: WQBC 
data block query control method not found
     [    9.955744] Bluetooth: hci0: HCI Enhanced Setup Synchronous 
Connection command is advertised, but not supported.

> ---
>   drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 0136df5732ba..06fede57bf36 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2680,6 +2680,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>   	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
>   		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
>   
> +		if (!(uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> +		    ctrl->info.selector == mapping->selector))
> +			continue;
> +
>   		/* Let the device provide a custom mapping. */
>   		if (mapping->filter_mapping) {
>   			mapping = mapping->filter_mapping(chain, ctrl);
> @@ -2687,9 +2691,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>   				continue;
>   		}
>   
> -		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> -		    ctrl->info.selector == mapping->selector)
> -			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
> +		__uvc_ctrl_add_mapping(chain, ctrl, mapping);
>   	}
>   }

So the check was just too late. Thank you for fixing it.

Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

