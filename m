Return-Path: <linux-media+bounces-36369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19109AEEAC2
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 01:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65CBE189EB5F
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 23:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D392E62AF;
	Mon, 30 Jun 2025 23:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rl+RTzOx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D9320103A;
	Mon, 30 Jun 2025 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324615; cv=none; b=YaAbxK3IbsR9pSUX0proXvbI2i+TP0j6kgh0FuLDd8rpCQiHv0OgrOq5fPIj8f+cAav1NsZerKfVqozK413eYYLoJJg2TTSyvPXa8SHpDn9pkImuW5RkEps0nOW1vFe9rm4DlOXiocqXDApUm92MaN92HGi/FJKIbaxXpAl2SIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324615; c=relaxed/simple;
	bh=sWv863fyXuCrnXTBpsU+O9opYOp2wtSbPC8lgNg6dbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNwGbAZOt4yk+YxoXg2b7yc+tE6//tnT39qfVz10bJqtEchwQsioUHoUbR1MArbDdrYA71YIEmnJKr1TurYsha5H+NqvhuKS3ra/vYs45BK3ZQDCv7GTwBhOfG+9BTOyeJoQFdw92R+JV0rjwQYf9OZDk3iKNQU+UWSdmYwwlHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rl+RTzOx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 19694838;
	Tue,  1 Jul 2025 01:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751324590;
	bh=sWv863fyXuCrnXTBpsU+O9opYOp2wtSbPC8lgNg6dbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rl+RTzOxv+c6CaBMiG4nfFqUhF2iKYmXe98VcGiQWiLz5mUFxi48OCiX4syKITPCh
	 C4CiSNVute4XMfdZu14IMWcSaCEPckPaBOkKeU5NylRPgV5zB93WgCQqEIBVk+1A9M
	 Q5TbYzSnThwSnOXjRF7qijiNoM8D3+7DsCur8T5c=
Date: Tue, 1 Jul 2025 02:03:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH 1/5] media: nxp: isi: add support for UYVY8_2X8 and
 YUYV8_2X8 bus codes
Message-ID: <20250630230306.GF15184@pendragon.ideasonboard.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
 <20250630-imx8qxp_pcam-v1-1-eccd38d99201@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630-imx8qxp_pcam-v1-1-eccd38d99201@nxp.com>

On Mon, Jun 30, 2025 at 06:28:17PM -0400, Frank Li wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> Add support for media bus codes UYVY8_2X8 and YUYV8_2X8 in the ISI pipe.
> These formats are commonly used by sensors like ov5640, which typically
> uses MEDIA_BUS_FMT_YUYV8_2X8.
> 
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index d76eb58deb096..1a4bf1ac02641 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -39,6 +39,16 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
>  		.output		= MEDIA_BUS_FMT_YUV8_1X24,
>  		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
>  		.encoding	= MXC_ISI_ENC_YUV,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
> +		.output		= MEDIA_BUS_FMT_YUV8_1X24,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
> +		.encoding	= MXC_ISI_ENC_YUV,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
> +		.output		= MEDIA_BUS_FMT_YUV8_1X24,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
> +		.encoding	= MXC_ISI_ENC_YUV,

This doesn't seem quite right. The format here corresponds to the pixel
link interface between the ISI and its source. There's no difference in
this patch in in register values between MEDIA_BUS_FMT_UYVY8_2X8 and
MEDIA_BUS_FMT_UYVY8_1X16. I don't think the ISI would be able to
automatically differentiate between receiving UYVY on a 16-bit bus with
one clock per pixel, and receiving it on a 8-bit bus with two clocks per
pixel. I believe you should translate MEDIA_BUS_FMT_UYVY8_2X8 to
MEDIA_BUS_FMT_UYVY8_1X16 in the source subdev driver.

>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
>  		.output		= MEDIA_BUS_FMT_YUV8_1X24,

-- 
Regards,

Laurent Pinchart

