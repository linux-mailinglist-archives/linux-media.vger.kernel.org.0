Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B29AE9F6E
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 16:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfJ3Ppk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 11:45:40 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34108 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfJ3Ppk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 11:45:40 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UFjUGI041498;
        Wed, 30 Oct 2019 10:45:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572450330;
        bh=AHoLJ8adzPwxHX1a589zAeFTY5yfqdJKods3HIWHw1s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IRqwZzfeVWHkrLE7mi338boJPe+azr5q5rDUMCQMkGXou6X4e9scZyROk/0ifhXzU
         Kk/6NvmtF+8+zwpb86SZaXvNILtOH0oklzh+5KKq2VIwz900c/w9WEdI5I1iwRUkV0
         ADbIVQu84r9nzwK31Jec9Tu1qu/T404pTE1aiknc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UFjUZE052981
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 10:45:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 10:45:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 10:45:17 -0500
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UFjTAV053464;
        Wed, 30 Oct 2019 10:45:29 -0500
Subject: Re: [PATCH][next] dma-buf: heaps: remove redundant assignment to
 variable ret
To:     Colin King <colin.king@canonical.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <brian.starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
CC:     <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191030150253.10596-1-colin.king@canonical.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <673b3e8f-9211-2fa2-c408-4560b03b4700@ti.com>
Date:   Wed, 30 Oct 2019 11:45:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030150253.10596-1-colin.king@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/30/19 11:02 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being assigned with a value that is never
> read, it is being re-assigned the same value on the err0 exit
> path. The assignment is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 47a32f9c1226 ("dma-buf: heaps: Add system heap to dmabuf heaps")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---


The root of the issue is that ret is not used in the error path, it
should be, I suggest this fix:

> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -98,7 +98,7 @@ static int system_heap_allocate(struct dma_heap *heap,
>  err0:
>         kfree(helper_buffer);
>  
> -       return -ENOMEM;
> +       return ret;
>  }
>  
>  static const struct dma_heap_ops system_heap_ops = {

Andrew


>  drivers/dma-buf/heaps/system_heap.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 455782efbb32..817a1667bd57 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -55,10 +55,8 @@ static int system_heap_allocate(struct dma_heap *heap,
>  	helper_buffer->pages = kmalloc_array(helper_buffer->pagecount,
>  					     sizeof(*helper_buffer->pages),
>  					     GFP_KERNEL);
> -	if (!helper_buffer->pages) {
> -		ret = -ENOMEM;
> +	if (!helper_buffer->pages)
>  		goto err0;
> -	}
>  
>  	for (pg = 0; pg < helper_buffer->pagecount; pg++) {
>  		/*
> 
