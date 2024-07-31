Return-Path: <linux-media+bounces-15661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFD2943525
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 19:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A6C21F23A8A
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 17:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8989339FC5;
	Wed, 31 Jul 2024 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dvTxmvOJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B907617543;
	Wed, 31 Jul 2024 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722447994; cv=none; b=I9HTZUgYrIxBrIbjJ0Dr8zSQf0TNn1tf7NHa1UOeOlacAtLvISOZdYn6B2T3A99whln7pkV29MZgfAg+Mhr5aesymIuonzIz+VyOFVWbF9tbVOQPhYzwr4TYizYBGSv/ld+QdCYIObEhKUZhXaPMtIwL8C0R3A8G8Py5YD03AW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722447994; c=relaxed/simple;
	bh=VYynSQlkqfKPdPrpqBX9BNsxQD2Rk2GmDS0e1sRFgFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=id6TSi7bHjkICxR1ZbYJIJHCeZxqfTHPgj+RUFFfg1ROMO9N0jkCOh9AYS+sWIx6a2n3AYsIBS0aMOMXcRgSbuFLl2sbDtvwvEUwSZu91fCw5YoJXpqowzEEumaJalW+2xxayMS8i8ls4BD9Qp01BC/9drf1OUgnqRRA2W5n9ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dvTxmvOJ; arc=none smtp.client-ip=80.12.242.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id ZCrRsJemgWPKVZCrRsG3Ul; Wed, 31 Jul 2024 19:11:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722445898;
	bh=l/N7BL6uXIDoiEcTV0sQ9X+6QKDbvzDQWB0h4bM+lFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dvTxmvOJZbGhRxoANl70qmf7S2ZSEKLOcNeA9hLaqEFBvPQUcsA6f9iuxkqiSgiAu
	 MJOoqNaHkAis3+RugHTH6u2kXY+UKzaEFLzfPZwMxF3sTZAm+DeHEmp8yjO3uU9F4/
	 HSwpkttWi+aUh05ALFIE3fLkL1l2S7CFYAmCcXxBYnZ6RRTnafAawtCfja3mIbTWEZ
	 6A2+ULcm7D39ArVc/5GdclhHK+BrJw5SBb9cp1nSTKfIHbxlA3sxI7pVOwjp+D37d2
	 mKUR4ccBalvZNLsOncet2VLSiWwX5OYVyTA1j2PZVVbsSrR8/EMAhCmdjzjd2Nq9wr
	 Xqk1uLNDRGQzA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 31 Jul 2024 19:11:38 +0200
X-ME-IP: 90.11.132.44
Message-ID: <0fbca32a-d0e9-4884-9839-be1714543398@wanadoo.fr>
Date: Wed, 31 Jul 2024 19:11:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] udmabuf: use kmem_cache to alloc udmabuf folio
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240731073752.1225177-1-link@vivo.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240731073752.1225177-1-link@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 31/07/2024 à 09:37, Huan Yang a écrit :
> The current udmabuf_folio contains a list_head and the corresponding
> folio pointer, with a size of 24 bytes. udmabuf_folio uses kmalloc to
> allocate memory.
> 
> However, kmalloc is a public pool, starting from 8,16,32 bytes.
> Additionally, if the size is not aligned with the kmalloc size, it will
> be rounded up to the corresponding size.
> This means that each udmabuf_folio allocation will get 32 bytes, and
> waste 8 bytes.
> 
> Considering that each udmabuf creates a folio corresponding to a
> udmabuf_folio, the wasted memory can be significant in the case of
> memory fragmentation.
> 
> Furthermore, if udmabuf is frequently used, the allocation and
> deallocation of udmabuf_folio will also be frequent.
> 
> Therefore, this patch adds a kmem_cache dedicated to the allocation and
> deallocation of udmabuf_folio.This is expected to improve the
> performance of allocation and deallocation within the expected range,
> while also avoiding memory waste.
> 
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
> v3 -> v2: fix error description.
> v2 -> v1: fix double unregister, remove unlikely.
>   drivers/dma-buf/udmabuf.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 047c3cd2ceff..c112c58ef09a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -24,6 +24,8 @@ static int size_limit_mb = 64;
>   module_param(size_limit_mb, int, 0644);
>   MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
>   
> +static struct kmem_cache *udmabuf_folio_cachep;
> +
>   struct udmabuf {
>   	pgoff_t pagecount;
>   	struct folio **folios;
> @@ -169,7 +171,7 @@ static void unpin_all_folios(struct list_head *unpin_list)
>   		unpin_folio(ubuf_folio->folio);
>   
>   		list_del(&ubuf_folio->list);
> -		kfree(ubuf_folio);
> +		kmem_cache_free(udmabuf_folio_cachep, ubuf_folio);
>   	}
>   }
>   
> @@ -178,7 +180,7 @@ static int add_to_unpin_list(struct list_head *unpin_list,
>   {
>   	struct udmabuf_folio *ubuf_folio;
>   
> -	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
> +	ubuf_folio = kmem_cache_alloc(udmabuf_folio_cachep, GFP_KERNEL);
>   	if (!ubuf_folio)
>   		return -ENOMEM;
>   
> @@ -491,11 +493,20 @@ static int __init udmabuf_dev_init(void)
>   					   DMA_BIT_MASK(64));
>   	if (ret < 0) {
>   		pr_err("Could not setup DMA mask for udmabuf device\n");
> -		misc_deregister(&udmabuf_misc);
> -		return ret;
> +		goto err;
> +	}
> +
> +	udmabuf_folio_cachep = KMEM_CACHE(udmabuf_folio, 0);
> +	if (!udmabuf_folio_cachep) {
> +		ret = -ENOMEM;
> +		goto err;
>   	}
>   
>   	return 0;
> +
> +err:
> +	misc_deregister(&udmabuf_misc);
> +	return ret;
>   }
>   
>   static void __exit udmabuf_dev_exit(void)

Hi,

should a kmem_cache_destroy() be also added in udmabuf_dev_exit()?

CJ

> 
> base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed


