Return-Path: <linux-media+bounces-27259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5E1A4A745
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 02:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D1B83ABD00
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 01:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF0F1F61C;
	Sat,  1 Mar 2025 01:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Uc9F/QBI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A618BF8;
	Sat,  1 Mar 2025 01:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740790995; cv=none; b=LnCEziRyKiPKoP6VcaYQontxZoDewrxnpDEYqmNXqtMLwxdcbUhlmHkpWynrpWtqkGjEQhwnscouMxgL9tk+QPPYNoGvmtfv1PKITbJlfo8eGeORjZJnFE/bJ4hI21ZisXHWEc0OlqLOoykNAPD9ouPeTk95xkz69Xudcc3YZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740790995; c=relaxed/simple;
	bh=E4CFDdWpLRuR6cWZBhtXLShaSWGwBIT3NTPSNKAfUWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sx3bj8+X3idKk6T5cDsiRPSs1naoHyUhGKRJSIYL726tvlLYJl0Mk22Ur20KAPBjbFnrd7ahoVYRmetzEclwrqgTqUKBCbo5dCNLTExOnFwVtFdMgWbooa0217QbkcIRcyiGlrbnpQNiKS7133eUpQYK3Y6WVdUUqBprDyzJbLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Uc9F/QBI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 834BF8BE;
	Sat,  1 Mar 2025 02:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740790902;
	bh=E4CFDdWpLRuR6cWZBhtXLShaSWGwBIT3NTPSNKAfUWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uc9F/QBIBnzEY8mfv0uRYcjyLx1ko30GlR6UK9oG6Mg+09RDBQuv4YBoid0CDNW2v
	 ClYEYPokYcreyrwHOzssSlYCW7T63hzqvhor+H0Pnlo0UBpr4jU26EL2mvEczEG8YN
	 i1BqUzwfl53p9s+Mei8kwCD4gBCZQdigbbpa7BTc=
Date: Sat, 1 Mar 2025 03:02:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rkisp1: Set format defaults based on
 requested color space
Message-ID: <20250301010252.GI7342@pendragon.ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
 <20250227114558.3097101-2-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227114558.3097101-2-stefan.klug@ideasonboard.com>

Hi Stefan,

Thank you for the patch.

On Thu, Feb 27, 2025 at 12:44:59PM +0100, Stefan Klug wrote:
> When color space JPEG is requested, the ISP sets the quantization
> incorrectly to limited range. To fix that, set the xfer_func, ycbcr_enc
> and quantization to the defaults for the requested color space if they
> are not specified explicitly.

The commit message fails to explain why you're addressing xfer_func and
ycbcr_enc to fix the quantization issue.

> Do this only in case we are converting
> from RAW to YUV.

And this should explain why.

> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c   | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index d94917211828..468f5a7d03c7 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -680,10 +680,23 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,

Adding a bit more context:

	set_csc = format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC;

	if (set_csc && src_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {

If V4L2_MBUS_FRAMEFMT_SET_CSC isn't set, the colorspace fields on the
source pad will be copied from the sink pad, which doesn't seem right.
It's a separate issue, but fixing both together may lead to better code.

>  		if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
>  			if (format->colorspace != V4L2_COLORSPACE_DEFAULT)
>  				src_fmt->colorspace = format->colorspace;
> -			if (format->xfer_func != V4L2_XFER_FUNC_DEFAULT)
> +
> +			if (format->xfer_func == V4L2_XFER_FUNC_DEFAULT)

Are you sure the condition should be inverted ?

>  				src_fmt->xfer_func = format->xfer_func;
> +			else
> +				src_fmt->xfer_func =
> +					V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
> +
>  			if (format->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT)
>  				src_fmt->ycbcr_enc = format->ycbcr_enc;
> +			else
> +				src_fmt->ycbcr_enc =
> +					V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
> +
> +			if (format->quantization == V4L2_QUANTIZATION_DEFAULT)
> +				src_fmt->quantization =
> +					V4L2_MAP_QUANTIZATION_DEFAULT(false,
> +						format->colorspace, format->ycbcr_enc);

Shouldn't this use src_fmt instead of format ?

I think quantization handling could be moved below.

>  		}
>  
>  		if (format->quantization != V4L2_QUANTIZATION_DEFAULT)

-- 
Regards,

Laurent Pinchart

