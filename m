Return-Path: <linux-media+bounces-37788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB40B05C9A
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 15:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E5EF4A2DCF
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481002E8DE9;
	Tue, 15 Jul 2025 13:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Vs8wfvEc"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18D02E2F10;
	Tue, 15 Jul 2025 13:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585987; cv=none; b=KLyiLbW6zVi2Gk2bk4OFvUodoyDUyXnIATJV/7Xukio6A66GzNHmxir+m3ouxmz0xFm3Ylufa1x0b+ULDbg77uiY8jx0WGSK55a84QM1rhpPjJz51zw8FTaLLbCxtJjDG3DhGNWZUWWMU36j+ba01u1Q57jboUEe2CSJDSiDX38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585987; c=relaxed/simple;
	bh=oBnBaCSoump3r4cmxRJ8JBgYq96nOv/9jO9G/aWKWd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnQ1f4NpREasJGfsLG3wWSd/+gxI4guNDjP2KoDxSH6UzvBAiDAVnclFX1R1cKMNrOiEefbNM+HGejW7icyesm4lnYlF+LtkHyPhrq0y5z6NQ/PY6zVz3NbwvGI1mRt3xY4CBS01gnltYtXnzcYYcBWeuaVeXC+dhcurjN0C7Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Vs8wfvEc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752585984;
	bh=oBnBaCSoump3r4cmxRJ8JBgYq96nOv/9jO9G/aWKWd4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vs8wfvEcwsAZjh6BZBE0xPpCIvhDjpVsglg1U/95trO5CNT4MgQHkZyI27XzcIlFT
	 AdgKbzFh4n6QM/4dGLvfM5G37VqH+MkLncGLfJ3dELlTsbZnpwti0rChV4xUM6Q7nR
	 WJsKkYK/8RLXDWQCY93t3ZRUbLL3FoOJDzJLL24v+TJPXFYGMAMZOe1KccWBuhcYyt
	 lQM2E/uTDBLXvjAQQn3x/ZxjXKqgLLkEKv1mDP6zj8Wh3rXDCLFga66H47UhxraKJ0
	 qu4YBxw+VhbGoxyFCeNL1VJ456GdBRRvzru+n2GkpEPdkchFoUcQl2FgqWqG7u3bt9
	 ovP9jugFCxq7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7000B17E097F;
	Tue, 15 Jul 2025 15:26:23 +0200 (CEST)
Message-ID: <ddcd26ad-1bf1-4d14-b341-3c0e1e56cbf3@collabora.com>
Date: Tue, 15 Jul 2025 15:26:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mediatek: encoder: memset encoder structure data
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nicolas.dufresne@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>
References: <20250715081547.18076-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250715081547.18076-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/07/25 10:15, Irui Wang ha scritto:
> Utilized memset to set all bytes of encoder structure to zero,
> this prevents any undefined behavior due to uninitialized use.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

This commit needs a Fixes tag, as you're fixing something important here.

Also, please clarify what is this undefined behavior that you've seen and
what problem are you trying to resolve by zeroing all those mem locations.

There's also more feedback, check below...

> ---
>   .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c  | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index a01dc25a7699..ecac1aec7215 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -886,6 +886,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>   			return 0;
>   	}
>   
> +	memset(&param, 0, sizeof(param));

Have you considered doing, instead...

	struct venc_enc_param param = { 0 }; ?

>   	mtk_venc_set_param(ctx, &param);
>   	ret = venc_if_set_param(ctx, VENC_SET_PARAM_ENC, &param);
>   	if (ret) {
> @@ -1021,12 +1022,14 @@ static int mtk_venc_encode_header(void *priv)
>   	struct mtk_vcodec_mem bs_buf;
>   	struct venc_done_result enc_result;

  	struct venc_done_result enc_result = { 0 };

>   
> +	memset(&enc_result, 0, sizeof(enc_result));
>   	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
>   	if (!dst_buf) {
>   		mtk_v4l2_venc_dbg(1, ctx, "No dst buffer");
>   		return -EINVAL;
>   	}
>   
> +	memset(&bs_buf, 0, sizeof(bs_buf));
>   	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
>   	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
>   	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;
> @@ -1143,6 +1146,7 @@ static void mtk_venc_worker(struct work_struct *work)
>   	struct venc_done_result enc_result;
>   	int ret, i;
>   
> +	memset(&enc_result, 0, sizeof(enc_result));

You should probably move this to before the first usage, instead.

>   	/* check dst_buf, dst_buf may be removed in device_run
>   	 * to stored encdoe header so we need check dst_buf and
>   	 * call job_finish here to prevent recursion
> @@ -1175,6 +1179,7 @@ static void mtk_venc_worker(struct work_struct *work)
>   		frm_buf.fb_addr[i].size =
>   				(size_t)src_buf->vb2_buf.planes[i].length;
>   	}
> +	memset(&bs_buf, 0, sizeof(bs_buf));

here it's fine to use memset, as there are multiple ways out before actually using
bs_buf.

Cheers,
Angelo

>   	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
>   	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
>   	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;



