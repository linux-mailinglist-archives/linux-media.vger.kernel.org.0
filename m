Return-Path: <linux-media+bounces-20042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 332529AA269
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 14:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E915728345A
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 12:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84A719D89E;
	Tue, 22 Oct 2024 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CZYms94K"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6027B17BB3F;
	Tue, 22 Oct 2024 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729601193; cv=none; b=B7W61opG5zBSiihO41ZURGl1TXvo7ypmFRivA3X34ligHup02BV00hnmcJMXxVckwRzY57boY6N+AB9awpYgVQhPFN5J2ARd3lodI0urtUo5oSgwuw+iLWwx/tKQ9J6n0VwALlGfee3kypro/9BszEtry8Nuqj4/XG1S2Ln6uQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729601193; c=relaxed/simple;
	bh=LpFd92aF5ztU1uSojFRtPX+WnRyuXfcyz49zc5zGDaE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S8ictqRmlCnCjcx7EtIhANL9m1Cv+vhepVaTTq3Ouc4fWgCbiCF6MwXtN2bWrIZuHtxNWGPMdH/i2rpRHs2Q7A3uJ5eQuLQY9XQzsSRdxaORmZOJZR7RX0GvdtJgADhE34a+EOvWhoWwokwrykXTH1qN3Hz+hkrpLkNuLAd97EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CZYms94K; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729601189;
	bh=LpFd92aF5ztU1uSojFRtPX+WnRyuXfcyz49zc5zGDaE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CZYms94Ko90sb+opvE6Cr0HHDHwV6NV7EW3T4GlohAkSAmCF/amd2n7DtB8BiH1jV
	 IkiM+VwVFQzk5Y5t5M0roOE+vdIiKuBOZ04/lCHE4/RQwqQhFreFTlmWu5ZBnYdEmA
	 OpIfSutlrz+trhx5hPbG1+aoDJ1sVP2dLmj/dibKf1XPATAfnlHBHwqUhdtgf5BXuD
	 fBpbKfVVmWruQG2M2b2LITufnnl7MZqTXCy2hJHsu9ThxW07c9XmsAaxdN4DnPPUam
	 mnK6FS+iWj4hbOD4BtpAorwR7Yw2SJ5SRJhemtmqXfFQtS2MGL/0aKMuq347HhYv9H
	 M108qH0Ubqlyw==
Received: from nicolas-tpx395.lan (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E27FD17E3607;
	Tue, 22 Oct 2024 14:46:27 +0200 (CEST)
Message-ID: <26e78427fdd3699e237a20d803c02202c868c2ff.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: av1: Store chroma and mv offsets
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org, 
	heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Tue, 22 Oct 2024 08:46:26 -0400
In-Reply-To: <01020192afc4f87b-fd9b4515-9e30-41e7-8cf9-029cf5c0c7b6-000000@eu-west-1.amazonses.com>
References: 
	<01020192afc4f87b-fd9b4515-9e30-41e7-8cf9-029cf5c0c7b6-000000@eu-west-1.amazonses.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Le lundi 21 octobre 2024 à 15:49 +0000, Benjamin Gaignard a écrit :
> Store chroma and motion vectors offsets for each frame so
> they can be used later when resolution change.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

This is nicer then recalculating it from width/height of the ref frame like we
do in RK VP9 driver. I think this patch could have a Fixes tag. As we discuss, I
believe AOM test suite does not cover this case ? and thus the fluster score is
unchanged ?

I still think this patch is correct, so:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/verisilicon/hantro.h              | 7 +++++++
>  .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c    | 9 +++++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
> index 811260dc3c77..6d36371c1d13 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -332,12 +332,19 @@ struct hantro_vp9_decoded_buffer_info {
>  	u32 bit_depth : 4;
>  };
>  
> +struct hantro_av1_decoded_buffer_info {
> +	/* Info needed when the decoded frame serves as a reference frame. */
> +	size_t chroma_offset;
> +	size_t mv_offset;
> +};
> +
>  struct hantro_decoded_buffer {
>  	/* Must be the first field in this struct. */
>  	struct v4l2_m2m_buffer base;
>  
>  	union {
>  		struct hantro_vp9_decoded_buffer_info vp9;
> +		struct hantro_av1_decoded_buffer_info av1;
>  	};
>  };
>  
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e54f5fac325b..69b5d9e12926 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -686,8 +686,6 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
>  	struct hantro_dev *vpu = ctx->dev;
>  	struct hantro_decoded_buffer *dst;
>  	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
> -	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
> -	size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
>  	int cur_width = frame->frame_width_minus_1 + 1;
>  	int cur_height = frame->frame_height_minus_1 + 1;
>  	int scale_width =
> @@ -744,8 +742,8 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
>  
>  	dst = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
>  	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
> -	chroma_addr = luma_addr + cr_offset;
> -	mv_addr = luma_addr + mv_offset;
> +	chroma_addr = luma_addr + dst->av1.chroma_offset;
> +	mv_addr = luma_addr + dst->av1.mv_offset;
>  
>  	hantro_write_addr(vpu, AV1_REFERENCE_Y(ref), luma_addr);
>  	hantro_write_addr(vpu, AV1_REFERENCE_CB(ref), chroma_addr);
> @@ -2089,6 +2087,9 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
>  	chroma_addr = luma_addr + cr_offset;
>  	mv_addr = luma_addr + mv_offset;
>  
> +	dst->av1.chroma_offset = cr_offset;
> +	dst->av1.mv_offset = mv_offset;
> +
>  	hantro_write_addr(vpu, AV1_TILE_OUT_LU, luma_addr);
>  	hantro_write_addr(vpu, AV1_TILE_OUT_CH, chroma_addr);
>  	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);


