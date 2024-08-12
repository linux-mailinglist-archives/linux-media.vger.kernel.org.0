Return-Path: <linux-media+bounces-16122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424D94E83A
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 10:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04D03B2434E
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 08:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA89166F3C;
	Mon, 12 Aug 2024 08:06:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BF755896
	for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 08:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723449975; cv=none; b=RTv0qdSrSPM5qKVsboF3on5tanajWhDiq5bxe6F9P6eXkhHpM2XSMjzp4IJHP+elJ7FSf1IBCP3VTJxDjcw1WOTCg2xeiNq0dBdM5UNAduA5tyeOI5dkmqSabF6z1oSXut9jsdoxO3mMA+JLzQn+v4X0P7qbjb62oYf+LK6J9HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723449975; c=relaxed/simple;
	bh=NUW6FIkCq2fxsdfXSVZZgXoBUFd6xR6RL275TqGpYJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJZjipkOFqEanv/obkcL6OtaupmF+aBu28w3VVeHBs3m6OA3FfgsT+A9bCzRkGyJXVVG7VTd6iKxsebclUmG5ErWsqKcya86ovO7Vj/SaF0dwtLcKLPgBGP1gViqjh7V21OmyMbAdVoMk63WYN91Gv85GpZb1/Usqzo2ctsrxCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB63C32782;
	Mon, 12 Aug 2024 08:06:13 +0000 (UTC)
Message-ID: <9e48ebe4-d062-49b8-8b6c-6427f483e559@xs4all.nl>
Date: Mon, 12 Aug 2024 10:06:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] media: videobuf2-core: attach once if multiple
 planes share the same dbuf
To: Yunke Cao <yunkec@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
References: <20240614073702.316810-1-yunkec@chromium.org>
 <20240614073702.316810-5-yunkec@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240614073702.316810-5-yunkec@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/06/2024 09:37, Yunke Cao wrote:
> When multiple planes use the same dma buf, each plane will have its own dma
> buf attachment and mapping. It is a waste of IOVA space.
> 
> This patch adds a dbuf_duplicated boolean in vb2_plane. If a plane's dbuf
> is the same as an existing plane, do not create another attachment and
> mapping.

I'm getting two documentation warnings:

include/media/videobuf2-core.h:194: warning: Function parameter or struct member 'dbuf_duplicated' not described in 'vb2_plane'
include/media/videobuf2-core.h:194: warning: Excess struct member 'duplicated_dbuf' description in 'vb2_plane'
2 warnings as Errors

Clearly a typo.

So please post a v5 to fix this issue as well.

Regards,

	Hans

> 
> Signed-off-by: Yunke Cao <yunkec@chromium.org>
> ---
> v4
> - Only set dbuf_duplicated when alloc_devs are equal.
> 
> v3
> - Adjust the patch according to the previous patches to resolve conflicts.
> - Add comment to explain the purpose of the change.
> 
> v2
> - Separate out the refactor changes out to previous patches.
> - Fix mem_priv check.
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 30 ++++++++++++++++---
>  include/media/videobuf2-core.h                |  3 ++
>  2 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index cbc8928f0418..c19f1df3a4d2 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -304,10 +304,13 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
>  	if (!p->mem_priv)
>  		return;
>  
> -	if (p->dbuf_mapped)
> -		call_void_memop(vb, unmap_dmabuf, p->mem_priv);
> +	if (!p->dbuf_duplicated) {
> +		if (p->dbuf_mapped)
> +			call_void_memop(vb, unmap_dmabuf, p->mem_priv);
> +
> +		call_void_memop(vb, detach_dmabuf, p->mem_priv);
> +	}
>  
> -	call_void_memop(vb, detach_dmabuf, p->mem_priv);
>  	dma_buf_put(p->dbuf);
>  	p->mem_priv = NULL;
>  	p->dbuf = NULL;
> @@ -316,6 +319,7 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
>  	p->length = 0;
>  	p->m.fd = 0;
>  	p->data_offset = 0;
> +	p->dbuf_duplicated = false;
>  }
>  
>  /*
> @@ -1374,7 +1378,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  	struct vb2_plane planes[VB2_MAX_PLANES];
>  	struct vb2_queue *q = vb->vb2_queue;
>  	void *mem_priv;
> -	unsigned int plane;
> +	unsigned int plane, i;
>  	int ret = 0;
>  	bool reacquired = vb->planes[0].mem_priv == NULL;
>  
> @@ -1427,6 +1431,24 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  		}
>  
>  		for (plane = 0; plane < vb->num_planes; ++plane) {
> +			/*
> +			 * This is an optimization to reduce dma_buf attachment/mapping.
> +			 * When the same dma_buf is used for multiple planes, there is no need
> +			 * to create duplicated attachments.
> +			 */
> +			for (i = 0; i < plane; ++i) {
> +				if (planes[plane].dbuf == vb->planes[i].dbuf &&
> +				    q->alloc_devs[plane] == q->alloc_devs[i]) {
> +					vb->planes[plane].dbuf_duplicated = true;
> +					vb->planes[plane].dbuf = vb->planes[i].dbuf;
> +					vb->planes[plane].mem_priv = vb->planes[i].mem_priv;
> +					break;
> +				}
> +			}
> +
> +			if (vb->planes[plane].dbuf_duplicated)
> +				continue;
> +
>  			/* Acquire each plane's memory */
>  			mem_priv = call_ptr_memop(attach_dmabuf,
>  						  vb,
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 955237ac503d..053ced60595f 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -154,6 +154,8 @@ struct vb2_mem_ops {
>   * @mem_priv:	private data with this plane.
>   * @dbuf:	dma_buf - shared buffer object.
>   * @dbuf_mapped:	flag to show whether dbuf is mapped or not
> + * @duplicated_dbuf:	boolean to show whether dbuf is duplicated with a
> + *		previous plane of the buffer.
>   * @bytesused:	number of bytes occupied by data in the plane (payload).
>   * @length:	size of this plane (NOT the payload) in bytes. The maximum
>   *		valid size is MAX_UINT - PAGE_SIZE.
> @@ -179,6 +181,7 @@ struct vb2_plane {
>  	void			*mem_priv;
>  	struct dma_buf		*dbuf;
>  	unsigned int		dbuf_mapped;
> +	bool			dbuf_duplicated;
>  	unsigned int		bytesused;
>  	unsigned int		length;
>  	unsigned int		min_length;


