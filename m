Return-Path: <linux-media+bounces-44635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24158BE0C75
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 23:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A7023AF4E9
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 21:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BD42BE7A1;
	Wed, 15 Oct 2025 21:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RnkZIvLL"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FDA24EAB1;
	Wed, 15 Oct 2025 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760562958; cv=none; b=EBlCEBMxZTG0Gnb5sotOf35RBacxQH6BafMhaeBMbdc4IlEID8WY8rMi9paxwG6R40ZFhZQRPj3rUCCDNwo00OMFIsb4MaKB41l5V2w2cPLTGfpO9qAFXlNonphc6hm1IHRHGSp6GycnodHkQaD4FWzNhk0KHpt/1cUGcdTmuC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760562958; c=relaxed/simple;
	bh=GWTkK+g893u2Bo9C1ZcK/xtqM0IlFsO6FTCH4d9igYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtHVisDBo9S6MhazjYkVZLk7i6ppPuLlq4II1jmA2gfe3IvpmIhbC/aj0s4E7hUAIh8G5DQEW4eWaoGrHtuvHwi06iD3J7pPB6UNWivH7wMKjtuzBpDucCO091KmVIMB2BUI1ZeowwS217e2FFVFDEajoJMY/1hdZN5NGEJIpGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RnkZIvLL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OsIzzSgIyHHVfEtzgbmUMNVpppKlYHA6ALdxJJpPxbY=; b=RnkZIvLLV4lmf3DXRCNoXIhmjP
	a+VRgIg4zXKorvo7Li9rE3AVOS5LFIroAKhqNo1zTZKIcy0gBfXC2qGHsf8QPgTi23EbPWzqCmbim
	zxbvgmYhjHkYtKz5EIWJpHf9HrdhTSIF8Fh4nw1EaNkW3rYNDnYZFsA75kfNvdqN+yB+XK//X6Qy/
	ZkZ7y67qSa99p4mBf3CFAXJAP2HxA4f0I+axsl7azxkzJWbl3xVIMn0DpXYtnfCa1BFdKD5dZS1L9
	9NZhipo7ZVdvyf8ClkucidLNjbW78l295FdmRpwO8J/cSZlLefBlLkMhyZSnXsw4TNKHR8wWnxyJK
	KGgurUqA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98qg-00000002vdI-3oTQ;
	Wed, 15 Oct 2025 21:15:54 +0000
Message-ID: <0389eec6-a2f3-44f2-9101-c4794c898f96@infradead.org>
Date: Wed, 15 Oct 2025 14:15:54 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] htmldocs: userspace-api/dma-buf-heaps.rst: fix block
 quote warning
To: Kriish Sharma <kriish.sharma2006@gmail.com>, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com, corbet@lwn.net
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/15/25 11:34 AM, Kriish Sharma wrote:
> Fix the following warning encountered when running `make htmldocs`:
> 
>   Documentation/userspace-api/dma-buf-heaps.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent
> 
> Added a blank line before the "Naming Convention" heading to comply with reST
> 
> Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")
> Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
> index a0979440d2a4..c0035dc257e0 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -26,6 +26,7 @@ following heaps:
>     ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
>     created following legacy naming conventions; the legacy name might be
>     ``reserved``, ``linux,cma``, or ``default-pool``.
> +
>  Naming Convention
>  =================
>  

-- 
~Randy

