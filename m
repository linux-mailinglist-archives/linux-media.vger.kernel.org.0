Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBC5250830
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 20:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgHXSmy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 14:42:54 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4254 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgHXSmw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 14:42:52 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f440a1e0002>; Mon, 24 Aug 2020 11:42:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 24 Aug 2020 11:42:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 24 Aug 2020 11:42:52 -0700
Received: from [10.2.58.8] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Aug
 2020 18:42:52 +0000
Subject: Re: [PATCH v2] tee: convert convert get_user_pages() -->
 pin_user_pages()
To:     <jens.wiklander@linaro.org>
CC:     <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <olof@lixom.net>, <soc@kernel.org>,
        <tee-dev@lists.linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
 <20200824183641.632126-1-jhubbard@nvidia.com>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <d6d397a8-93dd-54be-7186-580733a1ae8d@nvidia.com>
Date:   Mon, 24 Aug 2020 11:42:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824183641.632126-1-jhubbard@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598294558; bh=klGkO69RyKV41kWO8RX/ZqxuPo1xSyXNnZlFSqLUpC0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=dpQhgZn9rMKgRclkpFkX4O2GVTZdqhj5ePqwQZlzSUp1dsosdVJZLa4kPLRP2sPzU
         Pw0b/lMHaPUUYRNnZPKOWo3nbGZFeAPPRb/OK78DbPlMyMGBrRL3NjJi/Q1J5GXUep
         kMpl0WrwaJUcg2OvIUFu5M4f/xg92hzRHyZc3GZlzo2+XKc0Hj4MZjaDgmvocd/6P8
         gNdX1yMcJiD0ucJnY3iIjlG9jbplBOX6XxfZEu+cAgrNfR6iNzWfKdRL0jnAYcIvMW
         RLppo6O8+ft+A6g3PxUZs290J6BKnoV4sYxwMi83F6YwANTWqY5aZQgyGfIki7Ewa3
         SRVlGPfHQFiZA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/24/20 11:36 AM, John Hubbard wrote:
> This code was using get_user_pages*(), in a "Case 2" scenario
> (DMA/RDMA), using the categorization from [1]. That means that it's
> time to convert the get_user_pages*() + put_page() calls to
> pin_user_pages*() + unpin_user_pages() calls.
> 
> There is some helpful background in [2]: basically, this is a small
> part of fixing a long-standing disconnect between pinning pages, and
> file systems' use of those pages.
> 
> [1] Documentation/core-api/pin_user_pages.rst
> 
> [2] "Explicit pinning of user-space pages":
>      https://lwn.net/Articles/807108/
> 
> Cc: Jens Wiklander <jens.wiklander@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: tee-dev@lists.linaro.org
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> 
> OK, this should be indentical to v1 [1], but now rebased against
> Linux 5.9-rc2.
> 

...ohhh, wait, I should have read the earlier message from Jens more
carefully:

"The conflict isn't trivial, I guess we need to handle the different
types of pages differently when releasing them."

So it's not good to have a logically identical patch. argghhh. Let me see
how hard it is to track these memory types separately and handle the release
accordingly, just a sec.

Sorry about the false move here.

thanks,
-- 
John Hubbard
NVIDIA

> As before, I've compile-tested it again with a cross compiler, but that's
> the only testing I'm set up for with CONFIG_TEE.
> 
> [1] https://lore.kernel.org/r/20200519051850.2845561-1-jhubbard@nvidia.com
> 
> thanks,
> John Hubbard
> NVIDIA
> 
>   drivers/tee/tee_shm.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 827ac3d0fea9..3c29e6c3ebe8 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -32,16 +32,13 @@ static void tee_shm_release(struct tee_shm *shm)
>   
>   		poolm->ops->free(poolm, shm);
>   	} else if (shm->flags & TEE_SHM_REGISTER) {
> -		size_t n;
>   		int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
>   
>   		if (rc)
>   			dev_err(teedev->dev.parent,
>   				"unregister shm %p failed: %d", shm, rc);
>   
> -		for (n = 0; n < shm->num_pages; n++)
> -			put_page(shm->pages[n]);
> -
> +		unpin_user_pages(shm->pages, shm->num_pages);
>   		kfree(shm->pages);
>   	}
>   
> @@ -228,7 +225,7 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
>   	}
>   
>   	if (flags & TEE_SHM_USER_MAPPED) {
> -		rc = get_user_pages_fast(start, num_pages, FOLL_WRITE,
> +		rc = pin_user_pages_fast(start, num_pages, FOLL_WRITE,
>   					 shm->pages);
>   	} else {
>   		struct kvec *kiov;
> @@ -292,16 +289,13 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
>   	return shm;
>   err:
>   	if (shm) {
> -		size_t n;
> -
>   		if (shm->id >= 0) {
>   			mutex_lock(&teedev->mutex);
>   			idr_remove(&teedev->idr, shm->id);
>   			mutex_unlock(&teedev->mutex);
>   		}
>   		if (shm->pages) {
> -			for (n = 0; n < shm->num_pages; n++)
> -				put_page(shm->pages[n]);
> +			unpin_user_pages(shm->pages, shm->num_pages);
>   			kfree(shm->pages);
>   		}
>   	}
> 

v
