Return-Path: <linux-media+bounces-15241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC73938E22
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 13:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FFD2B2147A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 11:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697FC16D304;
	Mon, 22 Jul 2024 11:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qs71tyzI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482F417597;
	Mon, 22 Jul 2024 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721648337; cv=none; b=Xq9qtBN84NyYDp4FbRBlCm2MDkARSlIWtIlRDrsrkj8TJxanITPlswvmN99ka7TalJ1CCrZhnoW8xAe3P3y7xLODjtAjkLkz+MZJq4cmcIVIpoSA9+hWb1btdYEtdBNP9fxsRQMkX/IZJtMj2ybE3tkHzgKaJTOxXX+ExlpYbc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721648337; c=relaxed/simple;
	bh=jqvt1UZujBOSQlmzz6u3uitNMmyKRMTXZzq8cCC6zVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAOFaiWhB/OOnfXUgMuQcwxavsSWhJPbPtF3dgyPF7saawJQ+MKdP340xOLUtCB033sPMcRNahHxtpswMzmFBu8mYD6uOiAGBnsPOWLtNX7P3ZPrbYMkOKLzMcCZL6bxW0a4tkL8ms11Qjii82+KDMZksgyLF7a668v9U3gTQt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qs71tyzI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 156EB2B3;
	Mon, 22 Jul 2024 13:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721648293;
	bh=jqvt1UZujBOSQlmzz6u3uitNMmyKRMTXZzq8cCC6zVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qs71tyzI/qICBaAcl7lLC+7GQ4Zabt6XokeWi1RhQBFfQO30KWEPrtohPNFI03UOZ
	 QmwDdZONMeZqLq4/1NtfZ51WLFPrRPUrAhqaOWMsUze+QeWLzfpT5ie6ocNEyRZiSR
	 zVLVoUXMhcSgboWmtuSfiqznnDnkvS5dta9J06UQ=
Date: Mon, 22 Jul 2024 14:38:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pmenzel@molgen.mpg.de, stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix custom control mapping probing
Message-ID: <20240722113836.GE13497@pendragon.ideasonboard.com>
References: <20240722-fix-filter-mapping-v1-1-07cc9c6bf4e3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240722-fix-filter-mapping-v1-1-07cc9c6bf4e3@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Jul 22, 2024 at 07:59:43AM +0000, Ricardo Ribalda wrote:
> Custom control mapping introduced a bug, where the filter function was
> applied to every single control.
> 
> Fix it so it is only applied to the matching controls.
> 
> Reported-by: Paul Menzen <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/linux-media/518cd6b4-68a8-4895-b8fc-97d4dae1ddc4@molgen.mpg.de/T/#t
> Cc: stable@vger.kernel.org
> Fixes: 8f4362a8d42b ("media: uvcvideo: Allow custom control mapping")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Paul, could you check if this fixes your issue, thanks!
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 0136df5732ba..06fede57bf36 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2680,6 +2680,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
>  		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
>  
> +		if (!(uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> +		    ctrl->info.selector == mapping->selector))
> +			continue;

I have a slight preference for

		if (!uvc_entity_match_guid(ctrl->entity, mapping->entity) ||
		    ctrl->info.selector != mapping->selector)
			continue;

If that's fine with you, I can handle that when applying the patch.

This change means that the entity and selector test will use the
original mapping, not the mapping returned by the filtering function. I
think that's fine, both mappings should have the same entity and
selector, only the menu mask is meant to change.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  		/* Let the device provide a custom mapping. */
>  		if (mapping->filter_mapping) {
>  			mapping = mapping->filter_mapping(chain, ctrl);
> @@ -2687,9 +2691,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  				continue;
>  		}
>  
> -		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> -		    ctrl->info.selector == mapping->selector)
> -			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
> +		__uvc_ctrl_add_mapping(chain, ctrl, mapping);
>  	}
>  }
>  
> 
> ---
> base-commit: 68a72104cbcf38ad16500216e213fa4eb21c4be2
> change-id: 20240722-fix-filter-mapping-18477dc69048

-- 
Regards,

Laurent Pinchart

