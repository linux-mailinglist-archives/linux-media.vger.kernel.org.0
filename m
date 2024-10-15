Return-Path: <linux-media+bounces-19658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F4099E3B9
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 12:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E98EAB22C5B
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213A91E3799;
	Tue, 15 Oct 2024 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LewW1oD/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520EB1E202D;
	Tue, 15 Oct 2024 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728987767; cv=none; b=FlkNsdKfyDWhBjMdvxkgaYUT8S2pDqouQBoSNVWBj4gkM+ld7/4Hnr/s9UpzHaj80xXZmIU2hPzRdUNaZ1Vs4fPwSB97eyHJvmcPQtRroQWHlZsh8CW3CV03yq6QJAXQyGXRhfSnssKR3NV4mCtWW5VDayiOGHG8iqENj+pThYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728987767; c=relaxed/simple;
	bh=JazC3VZ30CY2aGkwYDQQKBaW4GtoR4P22Fn0jIYrD5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fe+in3kqH4hWLsjm9GgQoQj/8moE5fXle5DEMcTyJotjUXZ2hnSjoFbHlVlaqj8uFfZ9LdPx/QKvTT038z6n0RSTsHZLUwBNqByVJ6MtnKZChgix1f7KsLevt6Fi/ciF3cytaz/fP1Alx4jM+ver4F6BdaFJN0bFDpshVP1t12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LewW1oD/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.143.39.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EA9A9CE;
	Tue, 15 Oct 2024 12:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728987656;
	bh=JazC3VZ30CY2aGkwYDQQKBaW4GtoR4P22Fn0jIYrD5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LewW1oD/z6GnyXA6YeoMroI8Ox3o8agpkOsCFfYkYJ9amgKD4vdGKs+LG7otsXtri
	 o/dc3nXcqs+S1Gw2MwrYs2RdUhjUwefN7hA9iCmpkJ0mhpFaxIwrNesPPQaQ1Ncmmj
	 fc2Ggpsuq9fd9giyVRlijVLAc9QDdxwF+BmXe3Rg=
Date: Tue, 15 Oct 2024 13:22:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 10/22] media: rzg2l-cru: Remove unnecessary WARN_ON
 check in format func
Message-ID: <20241015102235.GF5682@pendragon.ideasonboard.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011173052.1088341-11-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Oct 11, 2024 at 06:30:40PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> `WARN_ON(!fmt)` check in `rzg2l_cru_format_bytesperline()` is unnecessary
> because the `rzg2l_cru_format_align()` function ensures that a valid
> `pixelformat` is set before calling `rzg2l_cru_format_bytesperline()`. As
> a result, `rzg2l_cru_format_from_pixel()` is guaranteed to return a
> non-NULL value, making the check redundant.
> 
> Additionally, the return type of `rzg2l_cru_format_bytesperline()` is
> `u32`, but the code returned `-EINVAL`, a negative value. This mismatch is
> now  resolved by removing the invalid error return path.

s/now  /now /

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index de88c0fab961..401ef7be58ec 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -835,9 +835,6 @@ static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
>  
>  	fmt = rzg2l_cru_format_from_pixel(pix->pixelformat);
>  
> -	if (WARN_ON(!fmt))
> -		return -EINVAL;
> -
>  	return pix->width * fmt->bpp[0];
>  }
>  

-- 
Regards,

Laurent Pinchart

