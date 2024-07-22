Return-Path: <linux-media+bounces-15246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5186F938F0A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 14:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 003991F217A2
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 12:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9A616D4E0;
	Mon, 22 Jul 2024 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W8yvu5kb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A787C1754B;
	Mon, 22 Jul 2024 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721650952; cv=none; b=DvjSyOafDlsOCHKLVEOJBg/cy4iq0am4uXz6kPG1oTANjSm2ueEe8nyl8qyrkeLD0YVEJVx3yYcO6RydPHEIm0+9RYpTRrj60vIwLByirIAdD2ekCQxVzhtNGqxpDtWlMOoTKQsjtv5eaq+VtJieXk35k3K3cbcw13D2ldfKl4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721650952; c=relaxed/simple;
	bh=5LRjXVaCr7Wfv1efvtW7uWzJ8ELYgMW0BFlDilFr7LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDL8LBryHDM9wJ4tpX/Hsf4XTzYX3yrnd7wfHz3IFeaSqx86fIbWSxjDWlnRLRBeTzZPNNMYjv9CmjWbmOsUdrmaey77XsaUwSpd4iJhKol+QRvR/At/FL3UnQGEjOgU+kzgswYxS+cCeNkRJ84/3d1ulV2yItnG0k7wUM4BB28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W8yvu5kb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 889C345B;
	Mon, 22 Jul 2024 14:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721650907;
	bh=5LRjXVaCr7Wfv1efvtW7uWzJ8ELYgMW0BFlDilFr7LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8yvu5kbYh+vPm3Hmn0YXJqSg803WP9sdU3lrswy/eqzjGKvAn+kTrOzz9T8Uppid
	 X+0l79Idb5s0RAjqIbgpA3E4wmyEDyzwdQoJkLzpkOBezf6fL3c8Ye5K0+nCI5UQ08
	 MC+AcOqnAPdvwQCPi3TNECbPHluFgdChIRWXJMN4=
Date: Mon, 22 Jul 2024 15:22:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pmenzel@molgen.mpg.de, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Fix custom control mapping probing
Message-ID: <20240722122211.GF5732@pendragon.ideasonboard.com>
References: <20240722-fix-filter-mapping-v2-1-7ed5bb6c1185@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240722-fix-filter-mapping-v2-1-7ed5bb6c1185@chromium.org>

On Mon, Jul 22, 2024 at 11:52:26AM +0000, Ricardo Ribalda wrote:
> Custom control mapping introduced a bug, where the filter function was
> applied to every single control.
> 
> Fix it so it is only applied to the matching controls.
> 
> The following dmesg errors during probe are now fixed:
> 
> usb 1-5: Found UVC 1.00 device Integrated_Webcam_HD (0c45:670c)
> usb 1-5: Failed to query (GET_CUR) UVC control 2 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 3 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 6 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 7 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 8 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 9 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 10 on unit 2: -75 (exp. 1).
> 
> Reported-by: Paul Menzen <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/linux-media/518cd6b4-68a8-4895-b8fc-97d4dae1ddc4@molgen.mpg.de/T/#t
> Cc: stable@vger.kernel.org
> Fixes: 8f4362a8d42b ("media: uvcvideo: Allow custom control mapping")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I'll add

Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>

from v1 and fix the reported-by tag.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Paul, could you check if this fixes your issue, thanks!
> ---
> Changes in v2:
> - Replace !(A && B) with (!A || !B)
> - Add error message to commit message
> - Link to v1: https://lore.kernel.org/r/20240722-fix-filter-mapping-v1-1-07cc9c6bf4e3@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 0136df5732ba..4fe26e82e3d1 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2680,6 +2680,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
>  		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
>  
> +		if (!uvc_entity_match_guid(ctrl->entity, mapping->entity) ||
> +		    ctrl->info.selector != mapping->selector)
> +			continue;
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

