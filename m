Return-Path: <linux-media+bounces-15197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 908D193804D
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 11:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ECF8282191
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 09:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C035CDE9;
	Sat, 20 Jul 2024 09:29:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCFE8F5D;
	Sat, 20 Jul 2024 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721467765; cv=none; b=Y6CBAmrW5U4BCG52bx2OAbRRPHpERzsksieGlXSC2Jf/yyhphcIaCNN+YJCceK4IslGYT37Os+TW5uqGL2/5LkCs+WyXuulBXQ+RhODwT3UdDrQtmTAVY/OYcgznSWXVl2d/Ou1sDbHg6+2kHqolMR1XeU09D5LQEB/4AazyHsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721467765; c=relaxed/simple;
	bh=LCQFZJACImzxdUqGT6cSbcKO9BbsQwoMX/8zYH4DSHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heAcG6xusTctD9JBNKuD+SnVwdTbESHAHs7NkHJJB7Owbw7d9p0TjkL8lDLPhR1Frrnc5NGraRxS8BTF9Li7cSplS9YKaCjDs9cRIVzR2e9De1yqW9R/IomsGWNWVVWL6fmYgzF/fdCxVNEtkuukbLWNnudWgkn6EfOePWn/RgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FD1C2BD10;
	Sat, 20 Jul 2024 09:29:18 +0000 (UTC)
Message-ID: <8c76b9da-bcc2-4316-b372-ea5f0c632d26@xs4all.nl>
Date: Sat, 20 Jul 2024 11:29:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/28] media: videobuf2: calculate restricted memory
 size
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
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
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
 <20240720071606.27930-4-yunfei.dong@mediatek.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240720071606.27930-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2024 09:15, Yunfei Dong wrote:
> Getting the physical address with sg_dma_address for restricted memory,
> only return the first physical address size since sg may not be physical
> continuous, then leading to the dmabuf size is small than buf size. Need
> to bypass continuous checking for restricted memory.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../common/videobuf2/videobuf2-dma-contig.c   | 34 +++++++++++++++----
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 3d4fd4ef5310..f0e4652b615f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -66,6 +66,22 @@ static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
>  	return size;
>  }
>  
> +/**************************************************/
> +/*   restricted mem scatterlist table functions   */
> +/**************************************************/
> +
> +static unsigned long vb2_dc_get_res_mem_contiguous_size(struct sg_table *sgt)
> +{
> +	struct scatterlist *s;
> +	unsigned int i;
> +	unsigned long size = 0;
> +
> +	for_each_sgtable_dma_sg(sgt, s, i)
> +		size += sg_dma_len(s);
> +
> +	return size;
> +}

I think it is better to add a 'bool restricted' argument to vb2_dc_get_contiguous_size.
If true, then skip the 'expected' check there.

> +
>  /*********************************************/
>  /*         callbacks for all buffers         */
>  /*********************************************/
> @@ -648,10 +664,13 @@ static void *vb2_dc_get_userptr(struct vb2_buffer *vb, struct device *dev,
>  		goto fail_sgt_init;
>  	}
>  
> -	contig_size = vb2_dc_get_contiguous_size(sgt);
> +	if (buf->vb->vb2_queue->restricted_mem)

I think it is better to do the same as with buf->non_coherent_mem,
so add a 'bool restricted_mem' to struct vb2_dc_buf and set it in
vb2_dc_alloc(). It makes this code easier to read.

> +		contig_size = vb2_dc_get_res_mem_contiguous_size(sgt);
> +	else
> +		contig_size = vb2_dc_get_contiguous_size(sgt);
>  	if (contig_size < size) {
> -		pr_err("contiguous mapping is too small %lu/%lu\n",
> -			contig_size, size);
> +		pr_err("contiguous mapping is too small %lu/%lu/%u\n",
> +		       contig_size, size, buf->vb->vb2_queue->restricted_mem);

Rather than add a "/%u", which is not easy to understand, perhaps do this:

		pr_err("%scontiguous mapping is too small %lu/%lu\n",
		       buf->vb->vb2_queue->restricted_mem ? "restricted " : "",
		       contig_size, size);

>  		ret = -EFAULT;
>  		goto fail_map_sg;
>  	}
> @@ -711,10 +730,13 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>  	}
>  
>  	/* checking if dmabuf is big enough to store contiguous chunk */
> -	contig_size = vb2_dc_get_contiguous_size(sgt);
> +	if (buf->vb->vb2_queue->restricted_mem)
> +		contig_size = vb2_dc_get_res_mem_contiguous_size(sgt);
> +	else
> +		contig_size = vb2_dc_get_contiguous_size(sgt);
>  	if (contig_size < buf->size) {
> -		pr_err("contiguous chunk is too small %lu/%lu\n",
> -		       contig_size, buf->size);
> +		pr_err("contiguous chunk is too small %lu/%lu/%u\n",
> +		       contig_size, buf->size, buf->vb->vb2_queue->restricted_mem);

Ditto.

>  		dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt,
>  						  buf->dma_dir);
>  		return -EFAULT;

Regards,

	Hans

