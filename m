Return-Path: <linux-media+bounces-11597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3F8C8587
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 13:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F18361F21EF7
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 11:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007DD3D56D;
	Fri, 17 May 2024 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SkTNjJkP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6CF3F8EA
	for <linux-media@vger.kernel.org>; Fri, 17 May 2024 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715945027; cv=none; b=hAOYnQbShTE88SZdCYTEQTc0ap+7t9o+ugVFHhevkoH37z4DeANYvPxTwbPz0gDAMoVht31fisQkXCgoBByt732niUQd6vww4DZfs4NQ0h2/Pl+U54IEkgu0mXvWSOwqjNgPk5Vmbj3RHtXin8G0cC9IHefd29ddMnKxejxI1mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715945027; c=relaxed/simple;
	bh=8WeCfwsbny1zyH7IrhtYr7/o6BJdwPX5eHEx0h9spqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOPoc1rc7IrGWX1wG5jETuvd8U7ftCpKaTdw6OITe0ZlH5n0aYLPcKtYg3iB/nLTfeveHuHlqsV8twpC7nbjCx/NecyFUg0R/FbHQ/qgdAMOEpUMl0gYzleBftAu6BVWPyMP0fZQyKuuWKgFMDGwub8tSllcgHRxgiRcA6sAW1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SkTNjJkP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ee954e0aa6so5361575ad.3
        for <linux-media@vger.kernel.org>; Fri, 17 May 2024 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715945025; x=1716549825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lATvbuXWUExfCrpXLk5seZU0Y8hA2YnPv/0SdWsqNWs=;
        b=SkTNjJkPtWarOBEcEzAIjRcMXqP+MidAmx6VA3of+1SnD631JRormsEJOvZINrHuEy
         xa/B3g/EXJn0TSWdK2nAbvRQhKdZFnySMt74wBIY6n+rx7sdQPlhzdSXDJBsxnGlGBs2
         nvB9YXJGWsw8wandJAWJQOEcDBbmnhQ9v7EhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715945025; x=1716549825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lATvbuXWUExfCrpXLk5seZU0Y8hA2YnPv/0SdWsqNWs=;
        b=u4/8dLFIeQ+gIhq0qDion2Thv3QLbBnH8b153SRPrhO7eOZNoOj5J5rAcAx8G3WSqe
         yoS5Ir7VhqiZwRVvbm6v65dpEqpWGlRaBbemzRdHQFiF9cJM4sHe44MemhWzqkJKuFkx
         pocVIhucBIglHnOcTT32siPrBP3ti5938yxwEE5wg8BDKm+GFYHK88+ZYsoRe7rPsQMJ
         NWO0VNSf4q0SIOoF0wNWk1tXqkt8DfZWRxTVaIHsLEWKB75NShkXCHeqJiNe+BEqGrTu
         M7S+XKmSdGrpmISTe+VnhrfM9HJ/KiMjEMasqebUXz82EBiA+iUhX7iRC3ptUh6dd1lJ
         QCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlHLnXh5NdJKlS0eevAS/6A/d6MlBa12r4WtuIOOPPine4M0j5StwPngyWdV1A6ko0E2+AWMEKIq4nfS7sCkq+GlNr8F6YmMWqKeQ=
X-Gm-Message-State: AOJu0Yy7Ep2usRL7L3Uv380t06CXAUna6v1zHm0TwqLxzn5XXj5wvzLc
	S2pbJqbX76K8Lm412k9bEu2FDUdI4c82U9mUAXtYAl8kxcHYfuoqHIYcZf2Wcw==
X-Google-Smtp-Source: AGHT+IHV3zt7obrRZXnpNEsrLed8LGRX9/TCU1CKenYI0M6p5An/qUm7qn0HY4ZvA9cJ4rjV+wwiYA==
X-Received: by 2002:a17:903:1250:b0:1ea:26bf:928 with SMTP id d9443c01a7336-1ef44161501mr260333975ad.50.1715945025207;
        Fri, 17 May 2024 04:23:45 -0700 (PDT)
Received: from chromium.org (237.198.80.34.bc.googleusercontent.com. [34.80.198.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136b2fsm155045995ad.241.2024.05.17.04.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 04:23:44 -0700 (PDT)
Date: Fri, 17 May 2024 20:23:42 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yunke Cao <yunkec@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: videobuf2-core: attach once if multiple
 planes share the same dbuf
Message-ID: <pz7etaaqk2sxuchbnrcj3efc57pmprbi4amjkx3ltrsqaz4jpo@rws6xfkyoq7j>
References: <20240403091306.1308878-1-yunkec@chromium.org>
 <20240403091306.1308878-4-yunkec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403091306.1308878-4-yunkec@chromium.org>

On Wed, Apr 03, 2024 at 06:13:06PM +0900, Yunke Cao wrote:
> When multiple planes use the same dma buf, each plane will have its own dma
> buf attachment and mapping. It is a waste of IOVA space.
> 
> This patch adds a dbuf_duplicated boolean in vb2_plane. If a plane's dbuf
> is the same as an existing plane, do not create another attachment and
> mapping.
> 
> Signed-off-by: Yunke Cao <yunkec@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 27 +++++++++++++++----
>  include/media/videobuf2-core.h                |  3 +++
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index a5368cef73bb..64fe3801b802 100644
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

Side note: Now when I'm reading this code I'm starting to wonder if
dbuf_mapped really add any value here. Can we even have a situation when we
have p->dbuf != NULL, but p->dbuf_mapped == false?

> +			call_void_memop(vb, unmap_dmabuf, p->mem_priv);
> +
> +		call_void_memop(vb, detach_dmabuf, p->mem_priv);
> +	}
>  
> -	call_void_memop(vb, detach_dmabuf, p->mem_priv);
>  	dma_buf_put(p->dbuf);
>  	p->mem_priv = NULL;
>  	p->dbuf = NULL;
> @@ -1327,7 +1330,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  	struct vb2_plane planes[VB2_MAX_PLANES];
>  	struct vb2_queue *q = vb->vb2_queue;
>  	void *mem_priv;
> -	unsigned int plane;
> +	unsigned int plane, i;
>  	int ret = 0;
>  	bool reacquired = vb->planes[0].mem_priv == NULL;
>  
> @@ -1380,6 +1383,19 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  		__vb2_buf_dmabuf_put(vb);
>  
>  		for (plane = 0; plane < vb->num_planes; ++plane) {

Can we add a short comment here explaining that this is an optimization for
using the same DMA-buf for many planes?

Best regards,
Tomasz

> +			for (i = 0; i < plane; ++i) {
> +				if (planes[plane].dbuf == vb->planes[i].dbuf) {
> +					vb->planes[plane].dbuf_duplicated = true;
> +					vb->planes[plane].dbuf = vb->planes[i].dbuf;
> +					vb->planes[plane].mem_priv = vb->planes[i].mem_priv;
> +					break;
> +				}
> +			}
> +
> +			/* There's no need to attach a duplicated dbuf. */
> +			if (vb->planes[plane].dbuf_duplicated)
> +				continue;
> +
>  			/* Acquire each plane's memory */
>  			mem_priv = call_ptr_memop(attach_dmabuf,
>  						  vb,
> @@ -1392,6 +1408,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  				goto err_put_dbuf;
>  			}
>  
> +			vb->planes[plane].dbuf_duplicated = false;
>  			vb->planes[plane].dbuf = planes[plane].dbuf;
>  			vb->planes[plane].mem_priv = mem_priv;
>  		}
> @@ -1406,7 +1423,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  	 * userspace knows sooner rather than later if the dma-buf map fails.
>  	 */
>  	for (plane = 0; plane < vb->num_planes; ++plane) {
> -		if (vb->planes[plane].dbuf_mapped)
> +		if (vb->planes[plane].dbuf_mapped || vb->planes[plane].dbuf_duplicated)
>  			continue;
>  
>  		ret = call_memop(vb, map_dmabuf, vb->planes[plane].mem_priv);
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 8b86996b2719..2484e7d2881d 100644
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
> -- 
> 2.44.0.478.gd926399ef9-goog
> 

