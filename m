Return-Path: <linux-media+bounces-39861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C41B25BA8
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5D1A1C83AFE
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 06:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BAF23A9A0;
	Thu, 14 Aug 2025 06:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3lHu3ai"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7472523817D;
	Thu, 14 Aug 2025 06:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755151984; cv=none; b=mKFAQjhSuNpDJ1GoN80Fdcdvwzfww2Xme69u6pdS6N8niJVa5FT3fvEE5ybXE/0FaK4tzwx+hDxeYiAUGtr5uVOpUxKVkkP/VSTAoiRVfwJH0XbZdeca5SjDuQXWg8NOocDtwgNm+AjNp41F2znV5GfMnC5mj303eDICy7fuCZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755151984; c=relaxed/simple;
	bh=DAGhSWQHXEHySMtrjXTOpoAjZ6wAwaqNMvo6ON2OJxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Di0wluHloW+l5qmrSB4TpkUGfOaebPFhz57M1QOMMsHskV4JKkstz5IgfEJouvNHzkepiCgtu8u/6wWhyM+avg2SXfTrKihuArwaOaBRAioi391G4xsUSwZQXVTF1QaxmFP/V9rqfYMBSiG4C+cKg3SAoocmzX10K28n5neQ928=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3lHu3ai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4E7C4CEEF;
	Thu, 14 Aug 2025 06:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755151983;
	bh=DAGhSWQHXEHySMtrjXTOpoAjZ6wAwaqNMvo6ON2OJxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3lHu3aiobL0T0fk/o90/lR7crHSA/3wZHAC0YA3sLLGB4v52FV10x7lKyMsDM1sY
	 ReumTALeQkloTBu3I6tsjCabMWXzXx/TTYModh1h68VLWmUJuROoRfdM+XEQ9P+RzV
	 UB8/LkiK08WUB14CsUUycZrb4Cr17AsakkaM3DGiPsQ42MVJSWy0IDk3LMydTjy9mb
	 PsaDi8/RZptKDGWlrS1g3RQ4ZVHxtMj4ArPk5ZiGP8sf0UT4YOqTsb2xG9bcldG//j
	 1znx2Lggvw/UgNIQt2PoA9yjcHRwJrbTFO3+tCdsojX5ToVSmZWRUvumraX1h9VpFO
	 mkR2nWKX7robQ==
Date: Thu, 14 Aug 2025 11:42:50 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
Message-ID: <aJ1-YpgvGt4_6CFU@sumit-X1>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813060339.2977604-3-jens.wiklander@linaro.org>

On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> Export the dma-buf heap functions to allow them to be used by the OP-TEE
> driver. The OP-TEE driver wants to register and manage specific secure
> DMA heaps with it.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/dma-buf/dma-heap.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Can we get an ack from DMAbuf maintainers here? With that we should be
able to queue this patch-set for linux-next targetting the 6.18 merge
window.

-Sumit

> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 3cbe87d4a464..cdddf0e24dce 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>  {
>  	return heap->priv;
>  }
> +EXPORT_SYMBOL(dma_heap_get_drvdata);
>  
>  /**
>   * dma_heap_get_name - get heap name
> @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>  {
>  	return heap->name;
>  }
> +EXPORT_SYMBOL(dma_heap_get_name);
>  
>  /**
>   * dma_heap_add - adds a heap to dmabuf heaps
> @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	kfree(heap);
>  	return err_ret;
>  }
> +EXPORT_SYMBOL(dma_heap_add);
>  
>  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
>  {
> -- 
> 2.43.0
> 

