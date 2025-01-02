Return-Path: <linux-media+bounces-24211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A779FF9B0
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 14:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED60B3A36BD
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 13:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DCC1B0F18;
	Thu,  2 Jan 2025 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fC6KNRqj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71C526ACB;
	Thu,  2 Jan 2025 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735823424; cv=none; b=Sxe64SyJIMKrDF6/kSh5HSQMlmzgYWgoxYyksusQXzWDOobFnbSPxurCXIXrTtCkTb8smR8t6Ra7+gsosEu/u6IS0LNFYyL4ronzoV/nGhXiamKGkICyBxSpNaVD0JENKLPBxdNqr47p77q+IS1zrc9YhA/anD+xsAyveeLktUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735823424; c=relaxed/simple;
	bh=/FIt1NbZBTAME3ryH8QiDZaLShzMnq6sDLI30re8kdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPGMR/I49rJoN97uw5K1MDMyCuf1FBLY4dwQWkSITO7GlqAKE2p0bUh7/eUT/kCbwMw5qVQ3H4h0YUMIGD5AlFJ3jB4WvW13UB3B8ubBV6M/JG45NhodSzm/XKZh0GCyCO/y9wEf0acWzPSbdoWSRKMAfyaHEa678CB03eXUf/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fC6KNRqj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EE2022F;
	Thu,  2 Jan 2025 14:09:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735823372;
	bh=/FIt1NbZBTAME3ryH8QiDZaLShzMnq6sDLI30re8kdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fC6KNRqjuxULBxkKbxWyDhFK+DU5FUTO+mt1pqEgSpWCDL3miaT/8seSVj3okp/1I
	 P7sBwbVYgKvgIMc6PCZExstfD4/pvssy7Qurk/5JLUDThEDeVLNi+t5tLO6GoOwIQT
	 YHf8kP8zXiwgW1Zk/tEHY+fA3/Z3rbcypoJUChQU=
Date: Thu, 2 Jan 2025 15:10:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v12 3/8] media: uapi: add visconti viif meta buffer format
Message-ID: <20250102131021.GG554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-4-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125092146.1561901-4-yuji2.ishikawa@toshiba.co.jp>

Hi Ishikawa-san,

Thank you for the patch.


On Mon, Nov 25, 2024 at 06:21:41PM +0900, Yuji Ishikawa wrote:
> Adds the Toshiba Visconti VIIF specific metadata format

s/Adds/Add/
s/format/formats./

> 
> - V4L2_META_FMT_VISCONTI_VIIF_PARAMS for ISP parameters
> - V4L2_META_FMT_VISCONTI_VIIF_STATS for ISP statistics
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>

Assuming the documentation of the formats in subsequent patches is fine,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changelog v10:
> - add entry for V4L2_META_FMT_VISCONTI_VIIF_PARAMS
> - add entry for V4L2_META_FMT_VISCONTI_VIIF_STATS
> 
> Changelog v11:
> - no change
> 
> Changelog v12:
> - add description for meta formats at v4l2-ioctl.c
> 
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0304daa8471d..f7facb63b8ea 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1470,6 +1470,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
>  	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
>  	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
> +	case V4L2_META_FMT_VISCONTI_VIIF_PARAMS: descr = "Visconti ISP Parameters"; break;
> +	case V4L2_META_FMT_VISCONTI_VIIF_STATS: descr = "Visconti ISP Statistics"; break;
>  	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index a5418759e2ba..9e1f66fdf038 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -863,6 +863,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
>  #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
>  
> +/* Vendor specific - used for Visconti VIIF sub-system */
> +#define V4L2_META_FMT_VISCONTI_VIIF_PARAMS	v4l2_fourcc('V', 'I', 'F', 'P') /* ISP Params */
> +#define V4L2_META_FMT_VISCONTI_VIIF_STATS	v4l2_fourcc('V', 'I', 'F', 'S') /* ISP Stats */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
Regards,

Laurent Pinchart

