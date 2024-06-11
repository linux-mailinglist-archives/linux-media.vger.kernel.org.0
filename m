Return-Path: <linux-media+bounces-12963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD790415B
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 18:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33F5828A964
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 16:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3210B433D8;
	Tue, 11 Jun 2024 16:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIIKn4CC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD6040862;
	Tue, 11 Jun 2024 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718123380; cv=none; b=PDsQ6lSkFEN+4kPO1ivlP4tX0P3x9Mibi5BCm5Hibsoi9Z2/pNbm/CqS4W/TR1OXOKD09CIqaD0eRuK0NbcdramFsYFQ4ThBNGSKqnYHHNguSya7IEvwHxbHmyNoPInn29OMmkW0+L/fcrgHHoNoZWHL2fsyD7orVXS5KTGU7Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718123380; c=relaxed/simple;
	bh=hmGhqBlLYFKjIhkdShLu8DnQifC7QyeNbKPHY5y8jUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ri6vSJPoPAENHucUsCn9rEXpDGBDjNxEcE5yMjJZ0hiRp3EqsShTeA3Q6oD++LbnH/h98hot56R72k0p6Lg6cdRElcj2YSJODmzF0eYZkG60Zov+mQC/hyUYG0pPXz0A65LBBSFAlIKWU1B3Ec0AfHZ7+f2baNP16tFR+yBt0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIIKn4CC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1FAC2BD10;
	Tue, 11 Jun 2024 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718123379;
	bh=hmGhqBlLYFKjIhkdShLu8DnQifC7QyeNbKPHY5y8jUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIIKn4CCQGaVdHYyf4j/HaIkw2TwSecW2j/wp+EkhDZIy6PiDP3rvrF3fgKh8VwWu
	 +hTHZNGc3TA+9G8fu+PS13SMciC+8ZBDklx/GJhc0srsrK/9ubw49cd9i9easUiDih
	 9xKu+NkyyS9mq6YDF28OccQ32JdYD9702GmbX5JNAEzCLjn2QefsxANcToHDT/fTJa
	 YdYYeukCn5x3gON6FoSGjqt5PJ3RFRwnWP0PrOynCuXgcoGBmnvd+5VLeEI1HRcMX9
	 o21m1mBO3t9RDtfiooHphGJFN0d4eDmNbP5wOCsv3LS/ZuRigAB4E9CV63roVM6ZvR
	 kpTXgLXRlaraQ==
Date: Tue, 11 Jun 2024 21:59:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v10 1/6] dmaengine: Add API function
 dmaengine_prep_peripheral_dma_vec()
Message-ID: <Zmh7cFgKSamZmT4c@matsya>
References: <20240605110845.86740-1-paul@crapouillou.net>
 <20240605110845.86740-2-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605110845.86740-2-paul@crapouillou.net>

On 05-06-24, 13:08, Paul Cercueil wrote:
> This function can be used to initiate a scatter-gather DMA transfer,
> where the address and size of each segment is located in one entry of
> the dma_vec array.
> 
> The major difference with dmaengine_prep_slave_sg() is that it supports
> specifying the lengths of each DMA transfer; as trying to override the
> length of the transfer with dmaengine_prep_slave_sg() is a very tedious
> process. The introduction of a new API function is also justified by the
> fact that scatterlists are on their way out.
> 
> Note that dmaengine_prep_interleaved_dma() is not helpful either in that
> case, as it assumes that the address of each segment will be higher than
> the one of the previous segment, which we just cannot guarantee in case
> of a scatter-gather transfer.

This looks good to me, but is missing Documentation changes for this
API, pls add that

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> 
> ---
> v3: New patch
> 
> v5: Replace with function dmaengine_prep_slave_dma_vec(), and struct
>     'dma_vec'.
>     Note that at some point we will need to support cyclic transfers
>     using dmaengine_prep_slave_dma_vec(). Maybe with a new "flags"
>     parameter to the function?
> 
> v7:
>   - Renamed *device_prep_slave_dma_vec() -> device_prep_peripheral_dma_vec();
>   - Added a new flag parameter to the function as agreed between Paul
>     and Vinod. I renamed the first parameter to prep_flags as it's supposed to
>     be used (I think) with enum dma_ctrl_flags. I'm not really sure how that API
>     can grow but I was thinking in just having a bool cyclic parameter (as the
>     first intention of the flags is to support cyclic transfers) but ended up
>     "respecting" the previously agreed approach.
> 
> v10:
>   - Add kernel doc to dmaengine_prep_peripheral_dma_vec()
>   - Remove extra flags parameter
> ---
>  include/linux/dmaengine.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 752dbde4cec1..9fc03068cabc 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -160,6 +160,16 @@ struct dma_interleaved_template {
>  	struct data_chunk sgl[];
>  };
>  
> +/**
> + * struct dma_vec - DMA vector
> + * @addr: Bus address of the start of the vector
> + * @len: Length in bytes of the DMA vector
> + */
> +struct dma_vec {
> +	dma_addr_t addr;
> +	size_t len;
> +};
> +
>  /**
>   * enum dma_ctrl_flags - DMA flags to augment operation preparation,
>   *  control completion, and communicate status.
> @@ -910,6 +920,10 @@ struct dma_device {
>  	struct dma_async_tx_descriptor *(*device_prep_dma_interrupt)(
>  		struct dma_chan *chan, unsigned long flags);
>  
> +	struct dma_async_tx_descriptor *(*device_prep_peripheral_dma_vec)(
> +		struct dma_chan *chan, const struct dma_vec *vecs,
> +		size_t nents, enum dma_transfer_direction direction,
> +		unsigned long flags);
>  	struct dma_async_tx_descriptor *(*device_prep_slave_sg)(
>  		struct dma_chan *chan, struct scatterlist *sgl,
>  		unsigned int sg_len, enum dma_transfer_direction direction,
> @@ -973,6 +987,25 @@ static inline struct dma_async_tx_descriptor *dmaengine_prep_slave_single(
>  						  dir, flags, NULL);
>  }
>  
> +/**
> + * dmaengine_prep_peripheral_dma_vec() - Prepare a DMA scatter-gather descriptor
> + * @chan: The channel to be used for this descriptor
> + * @vecs: The array of DMA vectors that should be transferred
> + * @nents: The number of DMA vectors in the array
> + * @dir: Specifies the direction of the data transfer
> + * @flags: DMA engine flags
> + */
> +static inline struct dma_async_tx_descriptor *dmaengine_prep_peripheral_dma_vec(
> +	struct dma_chan *chan, const struct dma_vec *vecs, size_t nents,
> +	enum dma_transfer_direction dir, unsigned long flags)
> +{
> +	if (!chan || !chan->device || !chan->device->device_prep_peripheral_dma_vec)
> +		return NULL;
> +
> +	return chan->device->device_prep_peripheral_dma_vec(chan, vecs, nents,
> +							    dir, flags);
> +}
> +
>  static inline struct dma_async_tx_descriptor *dmaengine_prep_slave_sg(
>  	struct dma_chan *chan, struct scatterlist *sgl,	unsigned int sg_len,
>  	enum dma_transfer_direction dir, unsigned long flags)
> -- 
> 2.43.0

-- 
~Vinod

