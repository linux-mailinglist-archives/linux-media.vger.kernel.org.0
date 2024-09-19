Return-Path: <linux-media+bounces-18403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E708E97CF3B
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 00:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1174284541
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 22:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A277181B8F;
	Thu, 19 Sep 2024 22:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sMTTQgV5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F41CD15
	for <linux-media@vger.kernel.org>; Thu, 19 Sep 2024 22:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726785043; cv=none; b=SbrS0PX4X5P5/pLa84BqnZ0b8/ZfithNzPTAArk9oBe4U64pFCF7IQ4Jk2e5GJqUr0+gJWNgr+eSHCufdwuaKtTKrMQVsYvVTKgR8ApT0j7f4uczndSOGJLrNUv1+3eOGusICmlRdLroG0INXw2CEEzgqRqxt5uLwxaOUN96e+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726785043; c=relaxed/simple;
	bh=sfSuuXCJR/KGH/Tz6HJDejcVYa69aKPJu+25FI971Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daOL6puCumvJ/7Sgl1sD3gFUIlA4GWVKcLUR1osY8rvblVEwji+vfJrTibUQP9M8aV1ZKppu5oufeBokj6ZYVi0/QxOnKB8z2PbqW6/dDjnDvyqFjbGdJ67INMwfGJax/jFHVqLfFqvAyPhA2IkM8DEMXpk+exKOE9g5LBanvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sMTTQgV5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213142096159.public.telering.at [213.142.96.159])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2C4C226;
	Fri, 20 Sep 2024 00:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726784951;
	bh=sfSuuXCJR/KGH/Tz6HJDejcVYa69aKPJu+25FI971Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMTTQgV5JbBrEA7c3gT5TlVMZDwJn53S1IbS3NFkOoBfyubvIfe2xJu4+aNsBhxwr
	 d+0/VeG77hELhgjk9KDbSyFx15ob5phM8b2cdMv8yulGnXPBI1RPrrMWTMSIWoB+PI
	 t/xyrMXf8OAGyE0rqc9nhXHBNIlZSUmIM9UJT96o=
Date: Fri, 20 Sep 2024 01:30:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Given <dg@cowlark.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: add support for the D3DFMT_R5G6B5 pixmap
 type
Message-ID: <20240919223001.GD29185@pendragon.ideasonboard.com>
References: <20240918180540.10830-1-dg@cowlark.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240918180540.10830-1-dg@cowlark.com>

Hi David,

Thank you for the patch.

On Wed, Sep 18, 2024 at 08:05:39PM +0200, David Given wrote:
> This media format is used by the NXP Semiconductors 1fc9:009b chipset,
> used by the Kaiweets KTI-W02 infrared camera.
> 
> Signed-off-by: David Given <dg@cowlark.com>

The subject line should start with "media: uvcvideo: ". I'll change then
when applying the patch to my tree. No further action is needed from
you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/common/uvc.c | 4 ++++
>  include/linux/usb/uvc.h    | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> index c54c2268f..c12d58932 100644
> --- a/drivers/media/common/uvc.c
> +++ b/drivers/media/common/uvc.c
> @@ -96,6 +96,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
>  		.guid		= UVC_GUID_FORMAT_RGBP,
>  		.fcc		= V4L2_PIX_FMT_RGB565,
>  	},
> +	{
> +		.guid		= UVC_GUID_FORMAT_D3DFMT_R5G6B5,
> +		.fcc		= V4L2_PIX_FMT_RGB565,
> +	},
>  	{
>  		.guid		= UVC_GUID_FORMAT_BGR3,
>  		.fcc		= V4L2_PIX_FMT_BGR24,
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index 88d96095b..01c3b2f45 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -140,6 +140,9 @@
>  #define UVC_GUID_FORMAT_D3DFMT_L8 \
>  	{0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_D3DFMT_R5G6B5 \
> +	{0x7b, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> +	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
>  #define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
>  	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

-- 
Regards,

Laurent Pinchart

