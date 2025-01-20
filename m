Return-Path: <linux-media+bounces-24978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F809A16DCF
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 056261888F3C
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74271E25FC;
	Mon, 20 Jan 2025 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U2VOSQ/O"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB8E1E1A3B;
	Mon, 20 Jan 2025 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381153; cv=none; b=MZOEzlFYob14bK4WteL3MAnSYlABekcMJoqD3ENFdjFn2Jt7p2Vsx5GHP4M5LDgCJSZ9zb8m/zXTjTAA1IZAqBW8JWZ7MSqjGMczghUQTNlXepG3uQTb93e+K9M4DGHHXngf7hvmQhiGej/pPvn2SnEKvGVambKGuodySKL3uTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381153; c=relaxed/simple;
	bh=5Td+YxxxuV+xbfq0ImDCCVLnUVvWM9MDAy5tsXq0CtQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M7csybNPTTE2PlpmlkPHtkeNdM0y46uNca2yjsY+eVXSUzS0vu/ZtrvgoL+okrDrifZzXWaRyK3G+lOdIR157QOFnlxHp51MrxR/6XDJn0FD7gkoyi587ZRKzgRDSP0j6a/5B9qa5jnpKGv1n1TzcX//ozpx7LCqH8tK146SfMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U2VOSQ/O; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737381149;
	bh=5Td+YxxxuV+xbfq0ImDCCVLnUVvWM9MDAy5tsXq0CtQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=U2VOSQ/OaJhBNek0Qp3/V6keabtO5z13XATTH09F0U31Fy4g0V076TX6tq1gFnvMF
	 wpUzHS5XegZr3CuVo4pdcntfzIArKwzM2lMU88KteyJrxKXNwXt6PthkECBMKUqdSX
	 IXpgfN0iSlOv4cZk9XMX+p1nOxvG1zYjmiUsm5zyzKc+pAH7mwMcoFqH3ikWMqg2Ow
	 IQEW3tyQBWs+PKAm05yCqoDXyh5ZBzh0SN+/ZYcUzlitpGSNw6YT85n92lxYc3hyKd
	 Y0/FMxC4fyWllga5g5o2OywixZIjFeh/qWj3YlSbcCRF+nxXCvfHw+BhOVDizExm0D
	 D5dKMG7cIqsOg==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:11:e976::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3510B17E0CD5;
	Mon, 20 Jan 2025 14:52:28 +0100 (CET)
Message-ID: <809cbfa09953bd3031a58c91d8c978ea2d7ff276.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: VP9: Fix typo
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 20 Jan 2025 08:52:26 -0500
In-Reply-To: <20250120081342.66853-1-benjamin.gaignard@collabora.com>
References: <20250120081342.66853-1-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks,

Le lundi 20 janvier 2025 à 09:13 +0100, Benjamin Gaignard a écrit :
> Change headres_size to headers_size.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> index 342e543dee4c..82a478ac645e 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> @@ -776,15 +776,15 @@ config_source(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_para
>  	      struct vb2_v4l2_buffer *vb2_src)
>  {
>  	dma_addr_t stream_base, tmp_addr;
> -	unsigned int headres_size;
> +	unsigned int headers_size;
>  	u32 src_len, start_bit, src_buf_len;
>  
> -	headres_size = dec_params->uncompressed_header_size
> +	headers_size = dec_params->uncompressed_header_size
>  		     + dec_params->compressed_header_size;
>  
>  	stream_base = vb2_dma_contig_plane_dma_addr(&vb2_src->vb2_buf, 0);
>  
> -	tmp_addr = stream_base + headres_size;
> +	tmp_addr = stream_base + headers_size;
>  	if (ctx->dev->variant->legacy_regs)
>  		hantro_write_addr(ctx->dev, G2_STREAM_ADDR, (tmp_addr & ~0xf));
>  	else
> @@ -794,7 +794,7 @@ config_source(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_para
>  	hantro_reg_write(ctx->dev, &g2_start_bit, start_bit);
>  
>  	src_len = vb2_get_plane_payload(&vb2_src->vb2_buf, 0);
> -	src_len += start_bit / 8 - headres_size;
> +	src_len += start_bit / 8 - headers_size;
>  	hantro_reg_write(ctx->dev, &g2_stream_len, src_len);
>  
>  	if (!ctx->dev->variant->legacy_regs) {


