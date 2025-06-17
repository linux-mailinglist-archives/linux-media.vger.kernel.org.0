Return-Path: <linux-media+bounces-35048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A951ADC7D7
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 12:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D38D16E904
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 10:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789502C0322;
	Tue, 17 Jun 2025 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/1uzIR6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19821DD9AC;
	Tue, 17 Jun 2025 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155295; cv=none; b=fSzkeZFz2yyHXneFMRzaPxm3+KaXKBKop2KZr447BW7UWlqKt7GecVaKqRLxd+BJga+677RvV2KUGcVuq5M5bvV6tce3NDhVE41+V8g+dQaDEVP+V1FqHw8K5IhoqrxW3tQJwfTMstP8zIsvVI/hg3WQ7O1D3uV6OCNMt3wejLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155295; c=relaxed/simple;
	bh=TGiJ78OP12uHdMJQ3lJsjwAsNWLdhU7ATUP+OpaDnTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjdzFYypV/dQnOG9U8muxe5WRnRBU/JnXHCOw2Ym9UYXzSOF7WcEF6DlK78bCPgMvi3Pd39vOQY9oxgxeXo9wOnYddoTd6eDq8kjqgGyVEjKBKvwtZGxtD8Mkvqovc37brVYjAZUXwxQ2OJv7GhTwFJx7A1Auz6ztdiRfChwe4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/1uzIR6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E694C4CEEE;
	Tue, 17 Jun 2025 10:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750155295;
	bh=TGiJ78OP12uHdMJQ3lJsjwAsNWLdhU7ATUP+OpaDnTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/1uzIR6BMhnlc2FAlYqUdmXvvuDtF8wPGOeNwLChQTgBUbfOFenjr3VK/V41Gvh9
	 Jg5EIm+eukoiDcygWJPerWvg8K/Cl8DES8H+DLZCh0cCI7gGKklAVtLqfdl2wTGkPe
	 DALKiNyxhk5j/1mBAnw+60bPHI/gS/amHDBeMwgEh3kU63Zi9JvteyDGx13Swwp8pv
	 dWAEOIjVr/6vLeeB6RjIH5XrAdrKk0O6vO1ChEwwxpVZYCsjcCLM5uyROvgvzsjKRd
	 5yd+RoYXU7iK8SpnT+BoBNJFGDv1K8JHAH/Z1+bq8ENUyHEYRPNs0FAY1N7KkAX6wL
	 tV3Y6e4JkfMDQ==
Date: Tue, 17 Jun 2025 15:44:45 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com
Subject: Re: [PATCH v10 2/9] dma-buf: dma-heap: export declared functions
Message-ID: <aFFAFcSNtMM7d38w@sumit-X1>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-3-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610131600.2972232-3-jens.wiklander@linaro.org>

On Tue, Jun 10, 2025 at 03:13:46PM +0200, Jens Wiklander wrote:
> Export the dma-buf heap functions to allow them to be used by the OP-TEE
> driver. The OP-TEE driver wants to register and manage specific secure
> DMA heaps with it.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/dma-buf/dma-heap.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
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

