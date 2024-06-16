Return-Path: <linux-media+bounces-13339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1764690A0B3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A631628276C
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE467345C;
	Sun, 16 Jun 2024 23:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wj5sNoCF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53B17344E;
	Sun, 16 Jun 2024 23:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579182; cv=none; b=WmOvaRbg1tcYkrVg65/0ALx7V7nweIbB4reU18XNS+7Nl4I0ZQgg5Yg1yYkNydDzI1ISQdFVsNMp0Vbo2GImjsh1dldsGAJIUfpgPlysXC1lnzCmh84hRkbxF6bvso+xj1pyUj0zA7ssCWpgA2SyIhQ6C6m4nRnvpM7yCj0cpxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579182; c=relaxed/simple;
	bh=Gv5Nes/BJZzWNPBeGWNbo9/xnyioW/kAKCr9stAgfDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eliNA3na9l9Tn6ICK5XLB7MJtRbaFhPHhVr3C0/LOjaU/NS33qgJpPWAWiCBxiVjS+11lyzG9qCHyrD+R/OR2YAQqtyRu0m23avEZAfUEZUr/OBGbmAAmSULroz8szl1nYmb7CLjhU9mVa+sqN+vZHl/XTPgxFnU/45YXX7zglc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wj5sNoCF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F0439C1;
	Mon, 17 Jun 2024 01:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579162;
	bh=Gv5Nes/BJZzWNPBeGWNbo9/xnyioW/kAKCr9stAgfDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wj5sNoCFqtM3UY4ECYDojSFLqr11gciOFt2j11OxV8q4JFERLD5lmfifYTOn7qA4h
	 S+Mf4Y0nIUX8ebw4UIsI28ezPHDOyRVAx7utQoKV0rjB7KWoijoYrTVahDENVhEvwa
	 e91dQlorOq4TO8QbQoL2H/H9/0ckg7dG02Zzbd5Q=
Date: Mon, 17 Jun 2024 02:05:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] media: uvcvideo: Remove mappings form
 uvc_device_info
Message-ID: <20240616230557.GD4782@pendragon.ideasonboard.com>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
 <20240610-billion-v2-6-38e861475f85@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610-billion-v2-6-38e861475f85@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Jun 10, 2024 at 11:09:57PM +0000, Ricardo Ribalda wrote:
> We do not have any quirk device making us of this. Remove from now. It
> can be easily reverted later if needed.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 27 +--------------------------
>  drivers/media/usb/uvc/uvcvideo.h |  1 -
>  2 files changed, 1 insertion(+), 27 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index d74019cb27fe..1c1710e3c486 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2679,32 +2679,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  	if (!ctrl->initialized)
>  		return;
>  
> -	/*
> -	 * First check if the device provides a custom mapping for this control,
> -	 * used to override standard mappings for non-conformant devices. Don't
> -	 * process standard mappings if a custom mapping is found. This
> -	 * mechanism doesn't support combining standard and custom mappings for
> -	 * a single control.
> -	 */
> -	if (chain->dev->info->mappings) {
> -		bool custom = false;
> -
> -		for (i = 0; chain->dev->info->mappings[i]; ++i) {
> -			const struct uvc_control_mapping *mapping =
> -				chain->dev->info->mappings[i];
> -
> -			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> -			    ctrl->info.selector == mapping->selector) {
> -				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
> -				custom = true;
> -			}
> -		}
> -
> -		if (custom)
> -			return;
> -	}
> -
> -	/* Process common mappings next. */
> +	/* Process common mappings. */
>  	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
>  		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 4df02a40c74f..ff9545dcf716 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -527,7 +527,6 @@ struct uvc_device_info {
>  	u32	quirks;
>  	u32	meta_format;
>  	u16	uvc_version;
> -	const struct uvc_control_mapping **mappings;
>  };
>  
>  struct uvc_status_streaming {

-- 
Regards,

Laurent Pinchart

