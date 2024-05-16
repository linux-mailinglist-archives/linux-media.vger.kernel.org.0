Return-Path: <linux-media+bounces-11516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7768C7440
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 11:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E5C281CA4
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 09:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A992143886;
	Thu, 16 May 2024 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qdf7UJxl"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1AD14293;
	Thu, 16 May 2024 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715853578; cv=none; b=URhgKnDj7C6e+u6qIOSH9WYxC4ntPAB3zK+b/E9J7O7X1iePAzBW7rXY5vFsoecr/y79XN6lw2CAr5QKGbDIWfCz4CMuacoo8dLwpO6+tDo/fLqWIjKf/ZGNjpBWf0pA5kqMKTLN7a2EnoEUVas6tuIXNXwxKo00oIIhsn9tClw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715853578; c=relaxed/simple;
	bh=dK2WkFIc661KKKqOwvbtfh51Ajk+5fstyZfpRUmwN2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DB7zWJxUMACFXp/OostE/XDdixgx7qYzH8mzw15uwYFsqS2/1Rf8NYqsc05eN27RcXEkK4YzFvOxGn+ui+/m//puWZTKjxnw2reC5Se2psgnvBFJ4Dy2oCKEnoVJsAy1LysqL3XyFJA1t5xlk7RE3tmDqqRxfBNicM7x2mgyrrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qdf7UJxl; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715853574;
	bh=dK2WkFIc661KKKqOwvbtfh51Ajk+5fstyZfpRUmwN2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qdf7UJxluJK7VRWEKILOAxaP85bTBG6aWspLroV80yixGNmF+YeHh3KaaEQ54GWC6
	 MFF0PReIwv3Tb+NZgyCaVmHtAi2TIHYZT+rqfslChY2gL3EVI86K//FHPSmhH2y6Q+
	 vVFgRpybXddrl63bTWXm80tWUPOem0I2PZuPyeBTtzYPePWnE+OthXuCDER7SRS7Tq
	 ffehsgmYFMGtvzeASN5aAGEgVp4r1Xu3I4z+4NpQOMO61GgSYhxcUG6F4yXu5xOZfq
	 efT0kxjT8MMuw2KFQu9vUPez1MN58/reCdKydoel5SrNhGiBH9FoOzAIFmZcpraHFk
	 Qhs155mWVGxNA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BAD343780C13;
	Thu, 16 May 2024 09:59:32 +0000 (UTC)
Message-ID: <a1d91cee-e2e4-4310-a9b4-984626144ab2@collabora.com>
Date: Thu, 16 May 2024 11:59:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 tjmercier@google.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Joakim Bech <joakim.bech@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>, Pavel Machek <pavel@ucw.cz>,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 willy@infradead.org, Logan Gunthorpe <logang@deltatee.com>,
 Daniel Vetter <daniel@ffwll.ch>, jianjiao.zeng@mediatek.com,
 kuohong.wang@mediatek.com, youlin.pei@mediatek.com
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240515112308.10171-3-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/05/24 13:23, Yong Wu ha scritto:
> Introduce a FLAG for the restricted memory which means the memory is
> protected by TEE or hypervisor, then it's inaccessiable for kernel.
> 
> Currently we don't use sg_dma_unmark_restricted, thus this interface
> has not been added.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   include/linux/scatterlist.h | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
> index 77df3d7b18a6..a6ad9018eca0 100644
> --- a/include/linux/scatterlist.h
> +++ b/include/linux/scatterlist.h
> @@ -282,6 +282,7 @@ static inline void sg_unmark_end(struct scatterlist *sg)
>   
>   #define SG_DMA_BUS_ADDRESS	(1 << 0)
>   #define SG_DMA_SWIOTLB		(1 << 1)
> +#define SG_DMA_RESTRICTED	(2 << 1)

I think you wanted to write (1 << 2) here :-)

Cheers,
Angelo

>   
>   /**
>    * sg_dma_is_bus_address - Return whether a given segment was marked
> @@ -352,6 +353,31 @@ static inline void sg_dma_mark_swiotlb(struct scatterlist *sg)
>   	sg->dma_flags |= SG_DMA_SWIOTLB;
>   }
>   
> +/**
> + * sg_dma_mark_restricted - Mark the scatterlist for restricted buffer.
> + * @sg:		SG entry
> + *
> + * Description:
> + *   Marks a a scatterlist for the restricted buffer that may be inaccessiable
> + *   in kernel if it is protected.
> + */
> +static inline void sg_dma_mark_restricted(struct scatterlist *sg)
> +{
> +	sg->dma_flags |= SG_DMA_RESTRICTED;
> +}
> +
> +/**
> + * sg_dma_is_restricted - Return whether the scatterlist was marked as restricted
> + *                        buffer.
> + * @sg:		SG entry
> + *
> + * Description:
> + *   Returns true if the scatterlist was marked as restricted buffer.
> + */
> +static inline bool sg_dma_is_restricted(struct scatterlist *sg)
> +{
> +	return sg->dma_flags & SG_DMA_RESTRICTED;
> +}
>   #else
>   
>   static inline bool sg_dma_is_bus_address(struct scatterlist *sg)
> @@ -372,6 +398,14 @@ static inline void sg_dma_mark_swiotlb(struct scatterlist *sg)
>   {
>   }
>   
> +static inline bool sg_dma_is_restricted(struct scatterlist *sg)
> +{
> +	return false;
> +}
> +
> +static inline void sg_dma_mark_restrited(struct scatterlist *sg)
> +{
> +}
>   #endif	/* CONFIG_NEED_SG_DMA_FLAGS */
>   
>   /**



