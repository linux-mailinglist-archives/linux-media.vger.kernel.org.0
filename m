Return-Path: <linux-media+bounces-11728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D31E8CC132
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 14:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CFD81F2387B
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 12:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AED13D62C;
	Wed, 22 May 2024 12:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DVDEsDWj"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C9A8287C;
	Wed, 22 May 2024 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716380744; cv=none; b=W00tBbIJPOk1Ed61xocDKfgmEJFR/mG+tRfZ1VnsFLEIJkUHSQm73jSmxjMRB0bOzQx7edHPaJ6W+7CiVTbaWKt6FcF4hR0ESarGxpY2uWRscfWulzeCODWi54+0Hxlx9xPKgQ174N7ciMVx+m7e7QNvZ0q72xoBzyXS7xHm/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716380744; c=relaxed/simple;
	bh=KY1Jjtx90WFXJYI6JqxM7uBt+i92nKmYdqocJqbLDe8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LYvXrw1jF+l1nnLenlvl3HSxyYkfMb8zkiY0HloP2/oD8Y3us1ogE5aQ52wMFyI1m1iPmYiLnQgONTYvTDMT8WefUfyxu+wMz3xzZnhOrzTcOu1MphcXz87+x2TXtTUxe9aBkcaXdJ18C3mfVBnZh2GklqFonyAXFDfKcIdn+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DVDEsDWj; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716380741;
	bh=KY1Jjtx90WFXJYI6JqxM7uBt+i92nKmYdqocJqbLDe8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=DVDEsDWjuk7cnGRKzcU8HYgYN8jt+kEho5AHLuta0oero0v1ba8azGBVRKchGv8bD
	 ssgusXJkI5oE7CMq6U68MOJRZM+4f0WNveqtX4bsH0M45PdHFZEo2a/KYQrJTtcBog
	 fd1LEzaQeZ1J/9WbaZ4IGA955W7SYmQncCAemY+F/KU7ApDf4dgyeDi55HTEDWg7aT
	 hIlJP8aTZxR/mJ6nVLbMbcaLdmfRupb8DuuV7qacSPA1uM96W0mzahgsmc/bUjIZRp
	 aq1NIMKsK7fuOePtC6Cn7EvGQyg2XFydL59YTlQU6HbVboDctJ+YrSKeQg5yg21wmA
	 v6oVQPXyqukIw==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3F35437821A0;
	Wed, 22 May 2024 12:25:40 +0000 (UTC)
Message-ID: <b6ef4188-e5da-487c-b4af-ebe5b2fcdfae@collabora.com>
Date: Wed, 22 May 2024 14:25:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v6,12/24] media: mediatek: vcodec: add interface to
 allocate/free secure memory
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-13-yunfei.dong@mediatek.com>
Content-Language: en-US
In-Reply-To: <20240516122102.16379-13-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yunfei,

W dniu 16.05.2024 o 14:20, Yunfei Dong pisze:
> Need to call dma heap interface to allocate/free secure memory when playing
> secure video.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../media/platform/mediatek/vcodec/Kconfig    |   1 +
>   .../mediatek/vcodec/common/mtk_vcodec_util.c  | 122 +++++++++++++++++-
>   .../mediatek/vcodec/common/mtk_vcodec_util.h  |   3 +
>   3 files changed, 123 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
> index bc8292232530..707865703e61 100644
> --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
> @@ -17,6 +17,7 @@ config VIDEO_MEDIATEK_VCODEC
>   	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
>   	depends on MTK_SCP || !MTK_SCP
>   	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
> +	depends on DMABUF_HEAPS
>   	select VIDEOBUF2_DMA_CONTIG
>   	select V4L2_MEM2MEM_DEV
>   	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> index c60e4c193b25..5958dcd7965a 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> @@ -5,9 +5,11 @@
>   *	Tiffany Lin <tiffany.lin@mediatek.com>
>   */
>   
> +#include <linux/dma-heap.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/regmap.h>
> +#include <uapi/linux/dma-heap.h>
>   
>   #include "../decoder/mtk_vcodec_dec_drv.h"
>   #include "../encoder/mtk_vcodec_enc_drv.h"
> @@ -45,7 +47,7 @@ int mtk_vcodec_write_vdecsys(struct mtk_vcodec_dec_ctx *ctx, unsigned int reg,
>   }
>   EXPORT_SYMBOL(mtk_vcodec_write_vdecsys);
>   
> -int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
> +static int mtk_vcodec_mem_alloc_nor(void *priv, struct mtk_vcodec_mem *mem)
>   {
>   	enum mtk_instance_type inst_type = *((unsigned int *)priv);
>   	struct platform_device *plat_dev;
> @@ -75,9 +77,71 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
>   
> -void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
> +static int mtk_vcodec_mem_alloc_sec(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_mem *mem)
> +{
> +	struct device *dev = &ctx->dev->plat_dev->dev;
> +	struct dma_buf *dma_buffer;
> +	struct dma_heap *vdec_heap;
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	unsigned long size = mem->size;
> +	int ret = 0;
> +
> +	if (!size)
> +		return -EINVAL;
> +
> +	vdec_heap = dma_heap_find("restricted_mtk_cma");
> +	if (!vdec_heap) {
> +		mtk_v4l2_vdec_err(ctx, "dma heap find failed!");
> +		return -EPERM;
> +	}
> +
> +	dma_buffer = dma_heap_buffer_alloc(vdec_heap, size, DMA_HEAP_VALID_FD_FLAGS,
> +					   DMA_HEAP_VALID_HEAP_FLAGS);
> +	if (IS_ERR_OR_NULL(dma_buffer)) {
> +		mtk_v4l2_vdec_err(ctx, "dma heap alloc size=0x%lx failed!", size);
> +		return PTR_ERR(dma_buffer);
> +	}
> +
> +	attach = dma_buf_attach(dma_buffer, dev);
> +	if (IS_ERR_OR_NULL(attach)) {
> +		mtk_v4l2_vdec_err(ctx, "dma attach size=0x%lx failed!", size);
> +		ret = PTR_ERR(attach);
> +		goto err_attach;
> +	}
> +
> +	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR_OR_NULL(sgt)) {
> +		mtk_v4l2_vdec_err(ctx, "dma map attach size=0x%lx failed!", size);
> +		ret = PTR_ERR(sgt);
> +		goto err_sgt;
> +	}
> +
> +	mem->va = dma_buffer;
> +	mem->dma_addr = (dma_addr_t)sg_dma_address((sgt)->sgl);
> +
> +	if (!mem->va || !mem->dma_addr) {
> +		mtk_v4l2_vdec_err(ctx, "dma buffer size=0x%lx failed!", size);
> +		ret = -EPERM;
> +		goto err_addr;
> +	}
> +
> +	mem->attach = attach;
> +	mem->sgt = sgt;
> +
> +	return 0;
> +err_addr:
> +	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
> +err_sgt:
> +	dma_buf_detach(dma_buffer, attach);
> +err_attach:
> +	dma_buf_put(dma_buffer);
> +
> +	return ret;
> +}
> +
> +static void mtk_vcodec_mem_free_nor(void *priv, struct mtk_vcodec_mem *mem)
>   {
>   	enum mtk_instance_type inst_type = *((unsigned int *)priv);
>   	struct platform_device *plat_dev;
> @@ -110,6 +174,57 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
>   	mem->dma_addr = 0;
>   	mem->size = 0;
>   }
> +
> +static void mtk_vcodec_mem_free_sec(struct mtk_vcodec_mem *mem)
> +{
> +	if (mem->sgt)
> +		dma_buf_unmap_attachment(mem->attach, mem->sgt, DMA_BIDIRECTIONAL);

is (!mem->sgt) possible at all here?

In mtk_vcodec_mem_alloc_sec() "if (IS_ERR_OR_NULL(sgt))" triggers an
error recovery path and the allocation fails. Do you ever try to free_sec()
a failed allocation?

> +	dma_buf_detach((struct dma_buf *)mem->va, mem->attach);
> +	dma_buf_put((struct dma_buf *)mem->va);
> +
> +	mem->attach = NULL;
> +	mem->sgt = NULL;
> +	mem->va = NULL;
> +	mem->dma_addr = 0;
> +	mem->size = 0;
> +}
> +
> +int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
> +{
> +	enum mtk_instance_type inst_type = *((unsigned int *)priv);
> +	int ret;
> +
> +	if (inst_type == MTK_INST_DECODER) {
> +		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
> +
> +		if (dec_ctx->is_secure_playback) {
> +			ret = mtk_vcodec_mem_alloc_sec(dec_ctx, mem);
> +			goto alloc_end;
> +		}
> +	}
> +
> +	ret = mtk_vcodec_mem_alloc_nor(priv, mem);
> +alloc_end:
> +

again maybe it's just my personal preference, but I'd have no goto
(not because goto is prohibited, but because maybe it's not really
justified here), fewer curly braces and no label:

int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
{
	struct mtk_vcodec_dec_ctx *dec_ctx = priv;

	if (dec_ctx->inst_type == MTK_INST_DECODER && dec_ctx->is_secure_playback)
		return mtk_vcodec_mem_alloc_sec(dec_ctx, mem);

	return mtk_vcodec_mem_alloc_nor(priv, mem);
}

To me it makes no sense to cast priv to inst_type _and_ to dec_ctx
given that dec_ctx's first member _is_ inst_type.

> +	return ret;
> +}
> +EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
> +
> +void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
> +{
> +	enum mtk_instance_type inst_type = *((unsigned int *)priv);


ditto here.

Regards,

Andrzej

> +
> +	if (inst_type == MTK_INST_DECODER) {
> +		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
> +
> +		if (dec_ctx->is_secure_playback) {
> +			mtk_vcodec_mem_free_sec(mem);
> +			return;
> +		}
> +	}
> +
> +	mtk_vcodec_mem_free_nor(priv, mem);
> +}
>   EXPORT_SYMBOL(mtk_vcodec_mem_free);
>   
>   void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dec_dev *dev, int hw_idx)
> @@ -171,3 +286,4 @@ EXPORT_SYMBOL(mtk_vcodec_get_curr_ctx);
>   
>   MODULE_LICENSE("GPL v2");
>   MODULE_DESCRIPTION("Mediatek video codec driver");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
> index 85f615cdd4d3..22078e757ed0 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
> @@ -18,6 +18,9 @@ struct mtk_vcodec_mem {
>   	size_t size;
>   	void *va;
>   	dma_addr_t dma_addr;
> +
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
>   };
>   
>   struct mtk_vcodec_fb {


