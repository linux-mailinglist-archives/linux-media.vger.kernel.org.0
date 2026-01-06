Return-Path: <linux-media+bounces-49960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE7ACF69F1
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 04:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FCF5304323E
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 03:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CAF26C3BE;
	Tue,  6 Jan 2026 03:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EugbMClo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333BD200C2;
	Tue,  6 Jan 2026 03:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767671235; cv=none; b=MoMOTasCqg5/KgDC7J4WkItPd94XZfCqQ12y6dt9C8b+m31U16PnVo6gVMWfvARETGi6tfbmZ257mlv6YTz1budt+Jdd8jlypUKb9HLDnVipn1N9fI3IP8EfysbGQVjvHjihqIYrw4lilQZwJZdWbvLssaFxZFnbYeWxl6+dCF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767671235; c=relaxed/simple;
	bh=snbqLaFm8FhVXUw6zgrDeasE3x5iP27hlHA3uqy8cWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2o1sp6SLClWHpUMA0jYC4lOmqgUuc8Ujm3oLAp8tH7mD5PCj8AzYGAx521tXoF79nNmtUyNBn9/tUpAKCVVE+goRZV0nyDzOTvhp64K0sMw9f8HGrDfTd25MgcCAbg05lkETzcaXKiQfddURFlijSRVwpU7dpcEkjodSu1E/r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EugbMClo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4C14DC7A;
	Tue,  6 Jan 2026 04:46:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767671207;
	bh=snbqLaFm8FhVXUw6zgrDeasE3x5iP27hlHA3uqy8cWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EugbMClo1V+5CAMWBXh4JSExPI9ja7XmJZyLL6YlnoaNW3yDTXTa3wPZG2GRhImIw
	 i9SWEBDsK+XoX1f6g56qnPYN1DXLfsFxfDZYjEx5XbYP+L0lfP2fTLqlkwV/hKYq0L
	 b4fsQX3uhprm2LTTecm8FkHy+eDJSZFLpMi/OrWw=
Date: Tue, 6 Jan 2026 05:46:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rui Wang <rui.wang@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH v4 1/1] media: rkisp1: Fix filter mode register
 configuration
Message-ID: <20260106034648.GP10026@pendragon.ideasonboard.com>
References: <20260105171142.147792-1-rui.wang@ideasonboard.com>
 <20260105171142.147792-2-rui.wang@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105171142.147792-2-rui.wang@ideasonboard.com>

Hi Rui,

Thank you for the patch.

On Mon, Jan 05, 2026 at 12:11:42PM -0500, Rui Wang wrote:
> The rkisp1_flt_config() function performs an initial direct write to
> RKISP1_CIF_ISP_FILT_MODE without including the RKISP1_CIF_ISP_FLT_ENA
> bit, which clears the filter enable bit in the hardware.
> 
> The subsequent read/modify/write sequence then reads back the register
> with the enable bit already cleared and cannot restore it, resulting in
> the filter being inadvertently disabled.
> 
> Remove the redundant direct write. The read/modify/write sequence alone
> correctly preserves the existing enable bit state while updating the
> DNR mode and filter configuration bits.
> 
> Signed-off-by: Rui Wang <rui.wang@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and pushed to CI in
https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1578184.
If the pipeline succeeds I'll queue the patch for v6.20. Otherwise I'll
report the failure here.

> ---
>  
> Changelog since v1:
>  1. Update version number from v1 to v4 to clarify the confusing
> 
> Reviewed-by Stefan Klug and Kieran Bingham
>  from v1 are carried over (no function code changes).
> 
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index c9f88635224c..6442436a5e42 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -411,12 +411,6 @@ static void rkisp1_flt_config(struct rkisp1_params *params,
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_LUM_WEIGHT,
>  		     arg->lum_weight);
>  
> -	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE,
> -		     (arg->mode ? RKISP1_CIF_ISP_FLT_MODE_DNR : 0) |
> -		     RKISP1_CIF_ISP_FLT_CHROMA_V_MODE(arg->chr_v_mode) |
> -		     RKISP1_CIF_ISP_FLT_CHROMA_H_MODE(arg->chr_h_mode) |
> -		     RKISP1_CIF_ISP_FLT_GREEN_STAGE1(arg->grn_stage1));
> -
>  	/* avoid to override the old enable value */
>  	filt_mode = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE);
>  	filt_mode &= RKISP1_CIF_ISP_FLT_ENA;

-- 
Regards,

Laurent Pinchart

