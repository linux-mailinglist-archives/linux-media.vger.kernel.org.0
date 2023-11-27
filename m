Return-Path: <linux-media+bounces-1095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D507FA0F8
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 14:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C13E28159C
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 13:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7816C2E41D;
	Mon, 27 Nov 2023 13:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfisF3sG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A41D4B
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 05:24:25 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40b473d3debso5335085e9.2
        for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 05:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701091464; x=1701696264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FH0s3pNKOJxZQ6z+iEoKI4AAtRx5ZhF+IIxrjC4hS7Y=;
        b=XfisF3sG2wjGjthMn7jHwVYSzVX/3ZwAQR1epmNIkMccCi3Aojisj6n2kZ3r82YsDF
         hIW+z/SRQINW3Y6h5qs9rLjvARwKGEm/2A1FI+x+ji4VEBGJGTLM4BSQgA/Wux4roxcB
         67chnQm8zNzjdSmDnuRxKa5B4czPp4wX6Ok4yE2ocOXQJ9PUAOTBLjfjItMy3rqaG9dd
         MUj6Q3wjftf7DwhFUgVnjXN9pKaXQ6fAgK41kI74klOwDa6urpznH8igD7hA6Yv6dT8c
         FA6Xg3owQfy8Zc0GjFdHzBhiyJ0oEzPlT0PmDPTlb9tkNVTeZzUA/791x+r2D3XnHM6/
         RXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701091464; x=1701696264;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FH0s3pNKOJxZQ6z+iEoKI4AAtRx5ZhF+IIxrjC4hS7Y=;
        b=Es7l5vNN40BY3s1zi0OFTD7EdZmtoZUlnUsARg/XJjJtqKURoF8cIjTr7HtVUS1LRV
         dTFoPEShqgqw6rlT8TR/S2FjfknLQgw9ZpfvjzqiPFk+FQyP5SzblNdtpC2O1lDjyY2G
         9hxQ90lAAuvAh6jfBtkxc2eNuR4cuo/O5K59B65T0l3PHTAj3AKpJzeJ6LJJ1Xyif//M
         oaHSKg5oc6IW1dpNzgOPMSSlEdASfVM+GBiXzB8hbqL93oHGWfBcwLuXY9dXr1vC0TZ8
         ur0B3E3I+wbe9w2yJfdCq9OM+95H9ZkjyZuDmvh95k19cuke6GT5Q0Fyqk29C0ptGWkY
         tpiA==
X-Gm-Message-State: AOJu0YwRB5hw88sHEujj2xvH7vV0JS3fnpmrMlCYLts5G7GJmTa71n2G
	37Y6zwa4fj61MBlDRxLPUT+a8QZuTE0=
X-Google-Smtp-Source: AGHT+IEkgZi6dHQenViMLORQ+BGP+Cu5JcNbxI8Ky4tY3ox+8USr6NjXaEho/GBtYPZe71+Kc5fs3g==
X-Received: by 2002:a05:600c:3106:b0:40b:3df2:c5f8 with SMTP id g6-20020a05600c310600b0040b3df2c5f8mr5896949wmo.36.1701091463940;
        Mon, 27 Nov 2023 05:24:23 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id e25-20020a5d5959000000b00332eb96cb73sm8652933wri.73.2023.11.27.05.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 05:24:19 -0800 (PST)
Message-ID: <e35e67dd-fd96-4ac5-a6ba-f351f12a146c@gmail.com>
Date: Mon, 27 Nov 2023 14:24:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix check in dma_resv_add_fence
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
To: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alex Deucher <Alexander.Deucher@amd.com>
References: <20231115093035.1889-1-christian.koenig@amd.com>
In-Reply-To: <20231115093035.1889-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Ping? Can I get an rb or acked-by for that?

Thanks,
Christian.

Am 15.11.23 um 10:30 schrieb Christian König:
> It's valid to add the same fence multiple times to a dma-resv object and
> we shouldn't need one extra slot for each.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: a3f7c10a269d5 ("dma-buf/dma-resv: check if the new fence is really later")
> Cc: stable@vger.kernel.org # v5.19+
> ---
>   drivers/dma-buf/dma-resv.c |  2 +-
>   include/linux/dma-fence.h  | 15 +++++++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 38b4110378de..eb8b733065b2 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -301,7 +301,7 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
>   
>   		dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
>   		if ((old->context == fence->context && old_usage >= usage &&
> -		     dma_fence_is_later(fence, old)) ||
> +		     dma_fence_is_later_or_same(fence, old)) ||
>   		    dma_fence_is_signaled(old)) {
>   			dma_resv_list_set(fobj, i, fence, usage);
>   			dma_fence_put(old);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index ebe78bd3d121..b3772edca2e6 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -498,6 +498,21 @@ static inline bool dma_fence_is_later(struct dma_fence *f1,
>   	return __dma_fence_is_later(f1->seqno, f2->seqno, f1->ops);
>   }
>   
> +/**
> + * dma_fence_is_later_or_same - return true if f1 is later or same as f2
> + * @f1: the first fence from the same context
> + * @f2: the second fence from the same context
> + *
> + * Returns true if f1 is chronologically later than f2 or the same fence. Both
> + * fences must be from the same context, since a seqno is not re-used across
> + * contexts.
> + */
> +static inline bool dma_fence_is_later_or_same(struct dma_fence *f1,
> +					      struct dma_fence *f2)
> +{
> +	return f1 == f2 || dma_fence_is_later(f1, f2);
> +}
> +
>   /**
>    * dma_fence_later - return the chronologically later fence
>    * @f1:	the first fence from the same context


