Return-Path: <linux-media+bounces-12303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0C8D54D8
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 23:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 860481F23F61
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985EF18412B;
	Thu, 30 May 2024 21:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T9vJFdKm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42617183994;
	Thu, 30 May 2024 21:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717105759; cv=none; b=Y02GPpDldwrt7wSynSFcIyvEmdz4CXvfLQ7TMLCGM9RgyKYIBhB6p7iqA1IvRg02z21uuHV87Ss/7IL7f9vLduyDkqdXb6CEvm+BE9pELJqaFpF6F5KEfvZxhgTGo0DQypuRRKzWRpll2jqlo8xBMrgB7WW9UhiKjp0UXad7qLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717105759; c=relaxed/simple;
	bh=YS7EYTLX3k28IDRcMUxXQpIaSrOXFDVX6q44UQ/C2Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuwZUN2vZGp3oo5wifpGxruEByB/bDPgyRTHCp7NBJXE/Jj4OHAXANRbNU5NqQ5c80QgObs14kaZPtuh3QumqAs6ty5cALJGjYJsywOxOuJTmX1AwZUrD/lpJ5uDFXDwMuXDeYqN0jFJ9nqqP+Q2xaW+SPUsZThzf8WbxESZHhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T9vJFdKm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82CD22DCE;
	Thu, 30 May 2024 23:49:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717105750;
	bh=YS7EYTLX3k28IDRcMUxXQpIaSrOXFDVX6q44UQ/C2Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9vJFdKmXPqXARiUWx3XwZcHWxr6tkMADJ2Yh/vPrk5We7rpwDGvv54xrCYZth5C6
	 wMKEfzY69lEMD02tw26+IsxyZOGjXCf19y4iuN+4Uxw7Z3zSCwzUU89flgyS6WDo7C
	 AwI5g6imjE3T0bcgmlMcukda88ICoIkdvBdorvLI=
Date: Fri, 31 May 2024 00:49:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v5 08/16] media: Add MALI_C55_3A_STATS meta format
Message-ID: <20240530214902.GB5213@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-9-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240529152858.183799-9-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, May 29, 2024 at 04:28:50PM +0100, Daniel Scally wrote:
> Add a new meta format for the Mali-C55 ISP's 3A Statistics along
> with a new descriptor entry.
> 
> Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v5:
> 
> 	- New patch
> 
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 4c76d17b4629..0d00b0476762 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1456,6 +1456,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>  	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
>  	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
> +	case V4L2_META_FMT_MALI_C55_3A_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index fe6b67e83751..021424fdaf68 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -841,6 +841,8 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  
> +#define V4L2_META_FMT_MALI_C55_3A_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
Regards,

Laurent Pinchart

