Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6D343170F
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 13:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhJRLXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 07:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhJRLXM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 07:23:12 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507C0C06161C
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 04:21:01 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id o20so40783769wro.3
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 04:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QbH/Fqw/UOsr06hrqcKDzrGD6snva7obhtkW4dGOEG0=;
        b=gEP6Zsv4iTEQfqQhQ6PSUkK5LmnQxup7arS8BiN/NhzvZ3EM5wwC/BXjBTgT1mGrYS
         uyrhjnhoBhJILyXAIrNza/EY3Tyeirz4iCE6PzeePdAj8V0HiRUqTCDNGcLnpJfsGCJ2
         rqI2kUOdtMX2EmHHupUodvJ2Mrr8Mg27IXWzRj2yMRsHXniEjSVNB5t3MVyDl3YLIKh0
         197iOLVWVf3rpC8CkXmk9V79Rw3ArnA7ZGS5hBJNdRZrxCHkZDB5lkSibX/+XdpNiy0b
         U2kGFQIreHLKiUkBLpv+bzXCr6HNbEhF1DR69HWoIWxaXHFIiJWFr4fe3rFxzw0vQH/B
         AEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QbH/Fqw/UOsr06hrqcKDzrGD6snva7obhtkW4dGOEG0=;
        b=7sY+uxzSJ4jiq8koF72H031cOjyFhUFy/A1LBmT22r4YkNTxLFvwmaEIRD87kJmrJz
         23xwY0Fayt1hBF+muzEWseiEGe/mTs9hJSI8jUvqoXSpqlHo918W8bK7DHBUr0LcrIPt
         rAFvkHS/nFMIAWHoM/Fvfzqc8rwoZ3WD/oHdBiif4XpXqeZ6dUIZcw/08gGerhjKtTti
         z51BCkfe/6KUKStzJbb9qDi1iZP5DOUtI1ZQcRXdmkRnPziT7zHMefvhfHT/uIR9WaGK
         OUpu/2HgpuTVK2VUintDxFvUCIEh13C2OJ2A4cdiiP2QAxmbfNqwB3WVOAsO+pDsxAza
         hg/A==
X-Gm-Message-State: AOAM533uVW/i4mTbveixbXxUuPagsGU9/tyqfto9SU1we0FarBp9K3yC
        aGzpTGLiVe1tddTsczkMDNEGqSDDQpU=
X-Google-Smtp-Source: ABdhPJzst1hKKHknD8c8eC2/0lOgPCnCZXcKGJyLN1b2VHU1SOjdDLkI1QP4E3tOvy7v8o6mXSZZGQ==
X-Received: by 2002:adf:a48f:: with SMTP id g15mr33539327wrb.259.1634556059919;
        Mon, 18 Oct 2021 04:20:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c473:1c84:fac2:c272? ([2a02:908:1252:fb60:c473:1c84:fac2:c272])
        by smtp.gmail.com with ESMTPSA id p12sm9449645wrr.67.2021.10.18.04.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 04:20:59 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Fix dma_resv_wait_timeout
 handling of timeout = 0.
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org
References: <20211015115720.79958-1-maarten.lankhorst@linux.intel.com>
 <20211015115720.79958-2-maarten.lankhorst@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ff661be5-3a7a-3868-a67f-c3c80d91f385@gmail.com>
Date:   Mon, 18 Oct 2021 13:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015115720.79958-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.10.21 um 13:57 schrieb Maarten Lankhorst:
> Commit ada5c48b11a3 ("dma-buf: use new iterator in dma_resv_wait_timeout")
> accidentally started mishandling timeout = 0, by forcing a blocking wait
> with timeout = 1 passed to fences. This is not intended, as timeout = 0
> may be used for peeking, similar to test_signaled.
>
> Fixes: ada5c48b11a3 ("dma-buf: use new iterator in dma_resv_wait_timeout")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Sorry for the delay, back from sick leave just today.

Good catch, but when I read the old code correctly that was also broken 
before by passing in 1 to dma_fence_wait_timeout() for a timeout of 0.

> ---
>   drivers/dma-buf/dma-resv.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 9eb2baa387d4..70a8082660c5 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -617,18 +617,18 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>   long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>   			   unsigned long timeout)
>   {
> -	long ret = timeout ? timeout : 1;
> +	long ret = timeout ?: 1;

Please don't change the coding style here.

Apart from that looks good to me.

Christian.

>   	struct dma_resv_iter cursor;
>   	struct dma_fence *fence;
>   
>   	dma_resv_iter_begin(&cursor, obj, wait_all);
>   	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		ret = dma_fence_wait_timeout(fence, intr, timeout);
> +		if (ret <= 0)
> +			break;
>   
> -		ret = dma_fence_wait_timeout(fence, intr, ret);
> -		if (ret <= 0) {
> -			dma_resv_iter_end(&cursor);
> -			return ret;
> -		}
> +		if (timeout)
> +			timeout = ret;
>   	}
>   	dma_resv_iter_end(&cursor);
>   

