Return-Path: <linux-media+bounces-23220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBD9ED0BF
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 17:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 505DC16B1D1
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 16:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6301DAC8D;
	Wed, 11 Dec 2024 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jq4owwYm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3A015CD74;
	Wed, 11 Dec 2024 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733933091; cv=none; b=pJKpLL8z/u2UBltW2bY2MvkRM9RHpwnY2QZRu+D5PSW25p8jumPv7kNqcfFzaOkJo1C4enDqwEdcKpZM8d/9zr3FMzGNmSxrfiY1Hjl8gtkLhgL6A/T6RChVM1Kxp1AcW7db9ITRvMVvR9K8pHzUm72IlJm+deNFgKuPnY/3i9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733933091; c=relaxed/simple;
	bh=iyyii2WdrTSdhD9GW0lqQShar6Q26yCBEEXXmmtlegc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meMhTFRnRl6EPW6nt921HAhxHW/7QF1M9yRBhuaJGiU9WbRiyBX6VvyY+XI7Ivv4cuSnMZriXD6L62jh+xh1EhKmMS6ZPNOoCM5BxJ8HrUQXoS0He5EizawoLEo4BnzZDEaz1adQ6KLthxQUF7k43dXLMH+2Maf7MFu3p6s8FOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jq4owwYm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C821E13C;
	Wed, 11 Dec 2024 17:04:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733933053;
	bh=iyyii2WdrTSdhD9GW0lqQShar6Q26yCBEEXXmmtlegc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jq4owwYmIXPgO9G4CUxnM+C/3UV7w4RDbJKsn7m0dSLCRaCqjxWvW5KLSVtKfnAje
	 UEKZ7g5kl8O9IuVNMb0ebncg49W36qFjkKR9Ds7bfCCSyWjIPAYVIxmMu3rz+NpIFQ
	 dK8RA8ebBNysVYuP6FNHRjpdel8W9GVl0uA+b1W4=
Date: Wed, 11 Dec 2024 17:04:44 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: keke.li@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v4 06/10] media: Add C3ISP_PARAMS and C3ISP_STATS meta
 formats
Message-ID: <6h2epavsgxonytbar2wv7qv6ojuzryst6gqjcceuccoxubwh64@5wqchwktrivu>
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
 <20241205-c3isp-v4-6-cb1868be0105@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-c3isp-v4-6-cb1868be0105@amlogic.com>

Hi Keke

On Thu, Dec 05, 2024 at 05:04:32PM +0800, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
>
> C3ISP_PARAMS is the C3 ISP Parameters format.
> C3ISP_STATS is the C3 ISP Statistics format.
>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0304daa8471d..dae34b1170d7 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1460,6 +1460,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
>  	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
>  	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
> +	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
> +	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index e7c4dce39007..eda30640a7a3 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -858,6 +858,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
>
> +/* Vendor specific - used for C3_ISP */
> +#define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', 'P', 'R', 'M') /* Amlogic C3 ISP Parameters */
> +#define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', 'S', 'T', 'S') /* Amlogic C3 ISP Statistics */

I would have used ('C', '3', 'P', 'M') and ('C', '3', 'S', 'T').
Matter of tastes I guess, but if you will happen to have a different
format for, say, C7, this would help keeping them separate.

Up to you
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> +
>  /* Vendor specific - used for RaspberryPi PiSP */
>  #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
>  #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
>
> --
> 2.47.0
>
>
>

