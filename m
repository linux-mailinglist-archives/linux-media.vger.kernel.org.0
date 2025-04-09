Return-Path: <linux-media+bounces-29800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02981A831D5
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 22:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ADC619E6B92
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 20:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F09211491;
	Wed,  9 Apr 2025 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ga74MhCa"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEC5101C8;
	Wed,  9 Apr 2025 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230138; cv=none; b=K8s2L/UEh7j9uW2GibHFjs79kDofi1I1vy2FUmRBr1NG0f3LJ3sVjBo45K50akp9y6AvZbp5GNokvy8zZQxz8SqwQi2qF8WOOY6vGib8xrqTk0oYm/XoCuOdUbAdysOQ+ssw0c8Tlf1eAMaEpBZa6UHVdvTL2vsisVlASj0Rg7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230138; c=relaxed/simple;
	bh=+yKQ8UlWyCG9yhdOevh4lapX94fj1l+SYopE3UtUQ8s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hCLx3d+utDzvvRQrwtGqyxWYb0wn7AOaoDIR//P94xcZdV/23xM1YyeYH5zX4mC17FrC5aEfIJtUqnc/ofIza28hm2gu53AwpEdRQAxLV90eNR+v3btr5j+McFtWiT/Er9tLZ77fv8+bPFUBnbU/dvytLAaPrODpCIM8VDRqXzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ga74MhCa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744230134;
	bh=+yKQ8UlWyCG9yhdOevh4lapX94fj1l+SYopE3UtUQ8s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ga74MhCaIE6ib2x9g1zR5Fl0gLsaifzlTXgru3XbGtrVQFaXa5sRMCdYul2QQP5UL
	 1XLuRJhg4r3Mha3/KJclqmR4FHABbed0jX0AU/ttyi3qDI5nhtlfoKbK0UhAPkq80+
	 O7MZrDgysaDeaFpAxYA51sBy+TJnl1pa+KncOMbsqlglzYM/JBnNtgbOH3ALUGZTun
	 /wFWYkLiwG/EPKXzXnt3/cHCKLjd0/XxZotla2/qWlcEXX20O++ZwqczscJYEuk9S8
	 jrnFrZrK/e6BlqHPYQHUGtiuqBrhXXxzEJimmK7gSTtPRt83n5f6d6jlfuFA4LcgC/
	 1i4WLzF3rwA0w==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38EB017E00FC;
	Wed,  9 Apr 2025 22:22:12 +0200 (CEST)
Message-ID: <f6e16d37ba85d6d99c250163a80db9b5591d8c81.camel@collabora.com>
Subject: Re: [PATCH v3 1/4] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Wed, 09 Apr 2025 16:22:10 -0400
In-Reply-To: <20250408025725.1244-2-ming.qian@oss.nxp.com>
References: <20250408025725.1244-1-ming.qian@oss.nxp.com>
	 <20250408025725.1244-2-ming.qian@oss.nxp.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Le mardi 08 avril 2025 à 10:57 +0800, ming.qian@oss.nxp.com a écrit :
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> Move function mxc_jpeg_free_slot_data() ahead of
> mxc_jpeg_alloc_slot_data(). Then when allocation fails,
> can call it to clean up erros accordingly.

Its nice to be explicit when there is no functional changes. Perhaps
this rephrase could work for you ?


   Move function mxc_jpeg_free_slot_data() above
   mxc_jpeg_alloc_slot_data() allowing to call that function during
   allocation failures. No functional changes are made.

> 
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> v3
> - Split the moving of code into a separate patch
> 
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 46 +++++++++++------
> --
>  1 file changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..b2f7e9ad1885 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct
> mxc_jpeg_slot_data *slot_data)
>  	return -1;
>  }
>  
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.desc,
> +			  jpeg->slot_data.desc_handle);
> +	jpeg->slot_data.desc = NULL;
> +	jpeg->slot_data.desc_handle = 0;
> +
> +	/* free descriptor for encoder configuration phase / decoder
> DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.cfg_desc,
> +			  jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle = 0;
> +	jpeg->slot_data.cfg_desc = NULL;
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			  jpeg->slot_data.cfg_stream_vaddr,
> +			  jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr = NULL;
> +	jpeg->slot_data.cfg_stream_handle = 0;
> +
> +	jpeg->slot_data.used = false;
> +}
> +
>  static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  {
>  	struct mxc_jpeg_desc *desc;
> @@ -798,26 +824,6 @@ static bool mxc_jpeg_alloc_slot_data(struct
> mxc_jpeg_dev *jpeg)
>  	return false;
>  }
>  
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.desc,
> -			  jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder
> DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.cfg_desc,
> -			  jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			  jpeg->slot_data.cfg_stream_vaddr,
> -			  jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used = false;
> -}
> -
>  static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx
> *ctx,
>  					       struct
> vb2_v4l2_buffer *src_buf,
>  					       struct
> vb2_v4l2_buffer *dst_buf)

