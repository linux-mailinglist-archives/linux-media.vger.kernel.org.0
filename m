Return-Path: <linux-media+bounces-12992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A981A904BBA
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 08:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D91828238F
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 06:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4009C16939E;
	Wed, 12 Jun 2024 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zj/TAUta"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C69625
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 06:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718174203; cv=none; b=co8YHgTy8/pIpz5miuwEoKTveYl+V39q1mGSxuFHVff2NhuxA/5PMkIbgMV4U4pc7rsl5OLnLTd0t0FS76RLKLbqdS8WOJfVlv/wGAwWRAplD1/jU6gomeRNup5CueOXxJ73jQeKA5R19udYpOgnpciiISR/EJRYT8eC5PotKCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718174203; c=relaxed/simple;
	bh=CbVuAlqFtu5s8sX42WgRGu1pnjAi5F0q4OOeX61FVRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jj93lZtO/eKU58rhtkDpCd6m12PRrqAgH5milKdatKoTpnllA2/pT3tjKUQtBM1XeMqN8H1xAeOgrAZgsVvsuQMqAIwJFL2hGPP8Dc1N+TjYviChaafouVl1DqVBJUINnWTzXj0zf0iAQJmxWvipURVBDRj5Hl7sBNaPoNurr0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zj/TAUta; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f717608231so21021735ad.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718174201; x=1718779001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iJVtLXJ/DNDFyqrP29dihvS4NPXxMqWCudlldWYz8sU=;
        b=Zj/TAUtafdPA2C//E60W5mjggygAlRjgrIGySkPL0ejb2M+YNQzYvHNCjoMjMagZzI
         sYxhMRj/+L44LpeTFoI6OoqYaM/SbVkBU1avLq9hdYQEvmAxC68bphXae7vAnis9B5UK
         jwOLfAyP5UPl5TDKkUtKmRoyoMgRzo3MWvJ28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718174201; x=1718779001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJVtLXJ/DNDFyqrP29dihvS4NPXxMqWCudlldWYz8sU=;
        b=vbb6HR/evx1gWBptSVfo/pvquV62OCNs3FVIC+haL4kZ1pmjdNdnuI7V1u/P6sTRYd
         UafcVLaBdQ9LoSo3UYtY6QiPhRE7y1hbXUzPL371hrlaMphmvy4S60mJ5IfN6goCO+/A
         GY5c5Xnt+m5h7QEPSORNYfSzc7mdQjqNCmeSjaR6axaGfuiojcSVH6EbAGdPdMauq3Xj
         F240UaWdOnW8/exJddKwVpPexLBSgeQlH1hre53xkuTaSKnoHF4j07yIDMef1DfxOkma
         k/0ZUDFM94Ox1xQck0r7B/s7o6zE3TciiLYE13QFkPhrFakorwSaSKqglnPukOkFZlBE
         fQ3A==
X-Forwarded-Encrypted: i=1; AJvYcCWncAXVPgpJHThAwxuMcHgq10K39gcQOV6Wl1UsMvpvSWu42oNpHoOR6vmE3K3rLef+ORfU2c6jo2cJT9N8ocf+hNxuG788Q1lDik8=
X-Gm-Message-State: AOJu0YwUaIkeuLRVwmHf6i6DD3GKwJ29FQKYiJD2HJGmcsuEzsyVWdvE
	jXT1E8M1hBVLiCA3X7lxmCEEqJdVimx5TiBjgl8VUMjx9W5yXsPaXt+JRMVVxw==
X-Google-Smtp-Source: AGHT+IEXArJ3p2omm3oSGmPQnzu7DEbHLW4NyPpmEXC7W9LpHnuOqzQ6xdCBt09opQtawfuIr+D8UA==
X-Received: by 2002:a17:902:c401:b0:1f6:fbc2:526f with SMTP id d9443c01a7336-1f83b613b81mr11200005ad.32.1718174201370;
        Tue, 11 Jun 2024 23:36:41 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f7327bd397sm25941375ad.278.2024.06.11.23.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 23:36:40 -0700 (PDT)
Date: Wed, 12 Jun 2024 15:36:38 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yunke Cao <yunkec@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: videobuf2-core: attach once if multiple
 planes share the same dbuf
Message-ID: <uvha4aeqwjo4q6pfkifxiu22i46rjlft5tob3j5lywiekfwyjn@zijbzqjxx76d>
References: <20240605074035.2620140-1-yunkec@chromium.org>
 <20240605074035.2620140-5-yunkec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605074035.2620140-5-yunkec@chromium.org>

On Wed, Jun 05, 2024 at 04:40:35PM +0900, Yunke Cao wrote:
> When multiple planes use the same dma buf, each plane will have its own dma
> buf attachment and mapping. It is a waste of IOVA space.
> 
> This patch adds a dbuf_duplicated boolean in vb2_plane. If a plane's dbuf
> is the same as an existing plane, do not create another attachment and
> mapping.
> 
> Signed-off-by: Yunke Cao <yunkec@chromium.org>
> ---
> v3
> - Adjust the patch according to the previous patches to resolve conflicts.
> - Add comment to explain the purpose of the change.
> 
> v2
> - Separate out the refactor changes out to previous patches.
> - Fix mem_priv check.
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 29 ++++++++++++++++---
>  include/media/videobuf2-core.h                |  3 ++
>  2 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index cbc8928f0418..90b65bf6c463 100644
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
> @@ -1427,6 +1431,23 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  		}
>  
>  		for (plane = 0; plane < vb->num_planes; ++plane) {
> +			/*
> +			 * This is an optimization to reduce dma_buf attachment/mapping.
> +			 * When the same dma_buf is used for multiple planes, there is no need
> +			 * to create duplicated attachments.
> +			 */
> +			for (i = 0; i < plane; ++i) {
> +				if (planes[plane].dbuf == vb->planes[i].dbuf) {

Oops, I just realized that we forgot about one thing. vb_queue has
alloc_devs[] array with per-plane struct device used for DMA mapping
API. If those are different, we can't reuse the attachment, so we need
to check them here too...

Best regards,
Tomasz

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
> -- 
> 2.45.1.288.g0e0cd299f1-goog
> 

