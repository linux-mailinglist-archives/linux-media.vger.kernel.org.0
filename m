Return-Path: <linux-media+bounces-11699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FDE8CAD5C
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 13:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48D69282981
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 11:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8B2757EF;
	Tue, 21 May 2024 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d31k/vWT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6A555E43;
	Tue, 21 May 2024 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716290912; cv=none; b=Ba3VUc6zRmhxFN04hDos5qJRQ7sv0rwV9BzjURO56xYWvtafS7bObG/4ZXImuRQr65t6EwvjA1Um/SqLIYdJOVt3kWTJBJsATN+3aor2AKNmzRo6UMNNeUUFCfwHqGmK+cbVc67rFDJEkyal0V/AhLCyFKFu10bVaU0Nst175zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716290912; c=relaxed/simple;
	bh=bu9mG/J79Ff9Zu/2l4MGoCMW5kuONCzPTI1mTCBFbqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bHc+RR2peYAsViSWZ1vJ1WwE4CpbeSIwocRqe7umRluDjgGJH1Rc1fSbN8reM4NjuigqVn67lkeB/DqneepqaLXB6q0h/19BOoKpyFvJPvogVxYtxtrQYjNeOShGhaVmL9g85nG7yrMyZj1f4TlPr8hUFhUAP2KlJqpOfJ9mwwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d31k/vWT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42011507a54so19585405e9.0;
        Tue, 21 May 2024 04:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716290908; x=1716895708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCvn53QZqHKbd8wXZQruum5PyX2Xyujq+z5EaypRXU8=;
        b=d31k/vWTuGTKp+v/JaFUWgrKmCkctIxs6h/sY9q83k387DfLGbX9GuFWjQa6+Fms3+
         Jjo2SKFxYaYIYKUj1BKkcHdY9tN8uT9vNYivXnJLiBEymwHVxGcpq9SZjfjP64kwR6Sr
         I19Akgs2BAduj+jnpIHcaYO8KDQmklnIo3ELrqCIRfoPBlljFtDFCdaR2u4KdmaADETg
         t75Wzs/etb1R5Udr1ZE5+Ofx3odZqWylLhsa71UwVfnm9I59gqp5KDsavNmiKBKF4QLE
         QrcuyoZEuNaxRf93y0BzgKa4ZMP/DI8Nk/16a3wVnW1ca/p7x/osLT7TZ6fFOJdcbku4
         Utzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290908; x=1716895708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCvn53QZqHKbd8wXZQruum5PyX2Xyujq+z5EaypRXU8=;
        b=YpYaMKtEk3A0aMWlWHzpcXi1kLBtw7cOUVajzWHylnOGhqdtQWYoBqe2ZaQi3+c92V
         NdLAVaZIDXvTos4Dh5JO+tCkaVG5HMmJNP3el1ZSyxrDENFDMYCBiBAhp4O1a+3wOAoH
         2pSoEwL25Auun4Xd14rCcTZPOAtN6iEDbmOaSzZi2U8xhPmkBMld31ENRT9fuVZe4l0D
         TeinizP9dkVVzSACZOh6Bod91uFsesvukY9pG2EovEn3HkMniHJCSIFltmKeqbm18uWy
         ri16RemBK6HxqNaDkvi4kxEnvHaiwNg9LbzGvxzK31XfuIzk1HmLrzpsu33NA04T7mg3
         BAbg==
X-Forwarded-Encrypted: i=1; AJvYcCVcUp6OQQutS/qT/K6J1wQFtM1/LDqP9VRIFN1YPV1s9B8o4UL3hZmSIXNITPECLC+X/DmYVx+sS4bv1aC6AWYAEfbIGkpVZSUtS2VHJhdkD8UG0lQxIfWmpFXixxEZDRCFIgN7cjsZBUbb+W/yygFrq09XYZ0z4q9juyFOpYyPoB/nZ5OQMMlTIswmtIs=
X-Gm-Message-State: AOJu0YxePyTEK/UBMMfRJgzD5vjuIG3gi7kgvoVOkBkfOttq+fwtOOXH
	RtfwySIOlTpaXIrJlH/kwQvMaE7OYjRyE/RzXtpkdafmWT8I1wb0
X-Google-Smtp-Source: AGHT+IFpeGZ9iCxLuTlFb+Vd1m76hVZ2lgoagmtHznB8dVhlERYFGSRgpPrkzrTynhee6VbDMgb7Rw==
X-Received: by 2002:a05:600c:4f49:b0:420:12df:1f7e with SMTP id 5b1f17b1804b1-420e19e46d4mr76021715e9.9.1716290908433;
        Tue, 21 May 2024 04:28:28 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8f8asm460922885e9.10.2024.05.21.04.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 04:28:27 -0700 (PDT)
Message-ID: <473b5f9b-da6d-425b-93c0-5bb6bb49a9bc@gmail.com>
Date: Tue, 21 May 2024 13:28:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/fence-array: Add flex array to
 struct dma_fence_array
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org
References: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 18.05.24 um 19:47 schrieb Christophe JAILLET:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1][2].
>
> The "struct dma_fence_array" can be refactored to add a flex array in order
> to have the "callback structures allocated behind the array" be more
> explicit.
>
> Do so:
>     - makes the code more readable and safer.
>     - allows using __counted_by() for additional checks
>     - avoids some pointer arithmetic in dma_fence_array_enable_signaling()
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
>
> Also, I don't think that 'cb' is a great name and the associated kernel-doc
> description could certainly be improved.
> Any proposal welcomed :)

Ah, yes. That was also on my TODO list for a very long time.

> ---
>   drivers/dma-buf/dma-fence-array.c | 10 ++++------
>   include/linux/dma-fence-array.h   |  3 +++
>   2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 9b3ce8948351..9c55afaca607 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -70,7 +70,7 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
>   static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>   {
>   	struct dma_fence_array *array = to_dma_fence_array(fence);
> -	struct dma_fence_array_cb *cb = (void *)(&array[1]);
> +	struct dma_fence_array_cb *cb = array->cb;
>   	unsigned i;
>   
>   	for (i = 0; i < array->num_fences; ++i) {
> @@ -168,22 +168,20 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   					       bool signal_on_any)
>   {
>   	struct dma_fence_array *array;
> -	size_t size = sizeof(*array);
>   
>   	WARN_ON(!num_fences || !fences);
>   
> -	/* Allocate the callback structures behind the array. */
> -	size += num_fences * sizeof(struct dma_fence_array_cb);
> -	array = kzalloc(size, GFP_KERNEL);
> +	array = kzalloc(struct_size(array, cb, num_fences), GFP_KERNEL);
>   	if (!array)
>   		return NULL;
>   
> +	array->num_fences = num_fences;
> +
>   	spin_lock_init(&array->lock);
>   	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
>   		       context, seqno);
>   	init_irq_work(&array->work, irq_dma_fence_array_work);
>   
> -	array->num_fences = num_fences;
>   	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>   	array->fences = fences;
>   
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index ec7f25def392..a793f9d5c73b 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -33,6 +33,7 @@ struct dma_fence_array_cb {
>    * @num_pending: fences in the array still pending
>    * @fences: array of the fences
>    * @work: internal irq_work function
> + * @cb: array of callback helpers
>    */
>   struct dma_fence_array {
>   	struct dma_fence base;
> @@ -43,6 +44,8 @@ struct dma_fence_array {
>   	struct dma_fence **fences;
>   
>   	struct irq_work work;
> +
> +	struct dma_fence_array_cb cb[] __counted_by(num_fences);

Please name that callbacks, apart from that looks good to me.

Regards,
Christian.


>   };
>   
>   /**


