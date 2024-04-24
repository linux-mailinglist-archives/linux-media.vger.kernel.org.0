Return-Path: <linux-media+bounces-10044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B9C8B0E18
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F0AA1C24FAD
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA9C15F41B;
	Wed, 24 Apr 2024 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ALHsVN/r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71E15ECFA
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972393; cv=none; b=CSHElzHUeEKDb7niLBXRt9YxRCR8jcB+W0a90G1YFdbPbvcMn42qohkVBlQ1spAeLTHc8TE4HGX9Gmcomzn8sIcdctjhXb6sHG4qvBqKOTwfWXMURoA1k03/hugVetqB1A5bbapqWcpJeughRmCfnT+6Op1OTc6H00sBDViAwJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972393; c=relaxed/simple;
	bh=htAsa3HZL9qjRq9FAR1cLwdPyaFm2n3DFyPr3dNkKuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FT6V38OXqVCM5Wyz2VUpt41e1XyPt1sUY3R9fQvo5TlVHRao5wRYP2MLihQo+qHL6ZKS9X0TJYlt0iKoQemJaEaeAEpmNtn4KSHe0VbNZj6Ax1QhrjujddOq3y0KUpvb0eaRL29hDNwjVkdn6KnrGn7ofPgGlml5GGvpi9jzJbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ALHsVN/r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 844ED674;
	Wed, 24 Apr 2024 17:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972338;
	bh=htAsa3HZL9qjRq9FAR1cLwdPyaFm2n3DFyPr3dNkKuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALHsVN/r8txPlO/dcvZMY1opg3vmUqtqn0WV09CioTb7YMfydCAo0F7V/a5eC/uSq
	 orpzYYosrxxE2rL8m3YavLsCmvkzSM83u+s0mnyEKyHpysiems2LJ9hksSwy10ORGg
	 k6w49raBUF/QNFJqdf5hsWIvBiKnllbf1/vW22lA=
Date: Wed, 24 Apr 2024 18:26:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 07/14] media: v4l: Set line based metadata flag in V4L2
 core
Message-ID: <20240424152623.GA32190@pendragon.ideasonboard.com>
References: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
 <20240424122237.875000-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240424122237.875000-8-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Apr 24, 2024 at 03:22:30PM +0300, Sakari Ailus wrote:
> Set (and unset) the V4L2_FMT_FLAG_META_LINE_BASED flag in struct
> v4l2_fmtdesc based on the format after returning the driver callback for
> enumerating formats. This way the drivers don't need to care about the
> flag.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 16 ++++++++++++++++
>  include/uapi/linux/videodev2.h       |  4 ++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 2cfc9106857a..5e928e2a2beb 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1538,6 +1538,22 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		}
>  	}
>  
> +	if (fmt->type == V4L2_BUF_TYPE_META_CAPTURE) {
> +		switch (fmt->pixelformat) {
> +		case V4L2_META_FMT_GENERIC_8:
> +		case V4L2_META_FMT_GENERIC_CSI2_10:
> +		case V4L2_META_FMT_GENERIC_CSI2_12:
> +		case V4L2_META_FMT_GENERIC_CSI2_14:
> +		case V4L2_META_FMT_GENERIC_CSI2_16:
> +		case V4L2_META_FMT_GENERIC_CSI2_20:
> +		case V4L2_META_FMT_GENERIC_CSI2_24:
> +			fmt->flags |= V4L2_FMT_FLAG_META_LINE_BASED;
> +			break;
> +		default:
> +			fmt->flags &= ~V4L2_FMT_FLAG_META_LINE_BASED;
> +		}
> +	}
> +
>  	if (descr)
>  		WARN_ON(strscpy(fmt->description, descr, sz) < 0);
>  	fmt->flags |= flags;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 647ce3419bd8..d944db7ae1ed 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -839,6 +839,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  
> +/*
> + * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> + * adding new ones!
> + */
>  #define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
>  #define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
>  #define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */

-- 
Regards,

Laurent Pinchart

