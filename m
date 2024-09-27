Return-Path: <linux-media+bounces-18725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F19A988CFC
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 01:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39A5A1F22092
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8B81B81AB;
	Fri, 27 Sep 2024 23:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dkhEHmh+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276BE189513;
	Fri, 27 Sep 2024 23:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727479449; cv=none; b=ntSPMa4eHdnBQyqUxP8Zz1Kj0Q2w4wQmduuupYZEL5fIzF0kIYElvkBZ1PoP9upBLHcamtbNsUSJenc+an19x8dkyNgqOgM3zbLlhHITsj/yTRCQn2ZlTGAGGC4pbKwtbh/HgFbNGXu/LIYqQv+3GL9vvikm62z8HSv2UWHq9KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727479449; c=relaxed/simple;
	bh=uEckwRuZumhYbRsx5HcqVfwOPVifSbZosYszgEKLa+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=na+wxebTqgW4csiW7RW3fbnkTlzDVEknp8U6fEmmKl4oG8dt6ph4FURkmskUHXvkfLmN00WhBBJyZZCS95FifB7ruqTBlnD8CTS5xzEQXj78xtE/FbUuI2FRhC7oynJ3icdOupB8YHgUgPiVeleWvfi+/c8Aq35fRNKwNMIkq8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dkhEHmh+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 416B46DE;
	Sat, 28 Sep 2024 01:22:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727479357;
	bh=uEckwRuZumhYbRsx5HcqVfwOPVifSbZosYszgEKLa+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkhEHmh+nWWH3I2imOqXloFaxEzbNFbdfIHz1NRfaoeMkEX3ywMQdWHrsqX5Qt/MH
	 hA28uZGt9qE8bnSbcNtETQwjqswoaBqAEEtGRv+ioiYqH3hggYzgZSlxw4zzuR3Ytg
	 J3NT2IBktr+pqqZsAx+m3JcEl49bqTnDwe3rXtq0=
Date: Sat, 28 Sep 2024 02:24:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 16/16] media: platform: rzg2l-cru: Add support to
 capture 8bit raw sRGB
Message-ID: <20240927232403.GP12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-17-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:57PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support to capture 8bit Bayer formats.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  4 +++
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 28 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index e630283dd1f1..d46f0bd10cec 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -188,6 +188,10 @@ struct rzg2l_csi2_format {
>  
>  static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
>  	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
>  };
>  
>  static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 9b0563198b50..9bb192655f25 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -19,6 +19,34 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.bpp = 2,
>  		.icndmr = ICnDMR_YCMODE_UYVY,
>  	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.format = V4L2_PIX_FMT_SBGGR8,
> +		.datatype = MIPI_CSI2_DT_RAW8,
> +		.bpp = 1,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.format = V4L2_PIX_FMT_SGBRG8,
> +		.datatype = MIPI_CSI2_DT_RAW8,
> +		.bpp = 1,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.format = V4L2_PIX_FMT_SGRBG8,
> +		.datatype = MIPI_CSI2_DT_RAW8,
> +		.bpp = 1,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.format = V4L2_PIX_FMT_SRGGB8,
> +		.datatype = MIPI_CSI2_DT_RAW8,
> +		.bpp = 1,
> +		.icndmr = 0,
> +	},
>  };
>  
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)

-- 
Regards,

Laurent Pinchart

