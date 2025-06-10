Return-Path: <linux-media+bounces-34458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5245AD3AF5
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 16:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4938E3A406C
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 14:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DDA29ACED;
	Tue, 10 Jun 2025 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="2Xl6TRSM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5370299928
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565061; cv=none; b=iNjxBT6WIRHmsATSc6mZjJocn0SERRNc8UNVWWEaiI/XmRsH5HtKRRnpkNBN/Zk+WKPSk0ZkWKYYpvKTOwwGjTCMNLPuf+4D83GK3boGPenRdxCitFmzDiXyfUMfPajhVGk8XvwA6XF1pJkQ3rIvYgNKpNtsQWlrr3FzwXIm7CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565061; c=relaxed/simple;
	bh=wqaWO5IVRFoLrZelbXO0s4+Rk/mCSHXMmRjf/MOveG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmFLdl0jT0x4sTgyWF7CAx0qC7MH4RJ9E8UK1hpoCOlwl7dtirmmVxuD9QEBelIjABjux3JjAd/MyFT2GmUX7sTUTq7wZ8hC7wsVOXv4R+lGvToTI5h19cBG39H1krusecsDSLuoXTYFXGZBLmW5DOalNMzUzHO05D/w6zT8LJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=2Xl6TRSM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45305c280a3so10194125e9.3
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 07:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1749565058; x=1750169858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7FQPUI2t4fKh9B8qtLSyYwsxdJre2h+7ztMs/P0P7U=;
        b=2Xl6TRSMoOTh0kqAR/Q5zfxAgIHwWHNJYSBLSBm6J0BotTux3SOqm/rsw9wWWYeoia
         37vjCvvpd2lu2x1TPXl0tiDme66BvaAESN305if4SakXYvamjosXD32gJ33BzdAyIywM
         FvvV5F3Ul8M77cX2rpMEjuWS+eEbHlPaHAy3uLEEa8bAaixTNnryy9vcok7edFLzg4yx
         92yyRcU/uKd4I20p0iZrinZSb2oFZ3jNhnqLyogdx5nUCqVJd/SpDafz2lSlTcoyACn3
         YFhXl7pbTHNt2Z31IY5AAKb86yXRlcGUjqJ8+8GBpvti+MKsMG9eyoMa3SzYnUC1w88Q
         q74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749565058; x=1750169858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7FQPUI2t4fKh9B8qtLSyYwsxdJre2h+7ztMs/P0P7U=;
        b=AFr0VX0AtWR9FfBQ3tiWLrfd9PqGi3WwCjV0fByXPSknwO/ODnc9/3DZWS35XOxPbV
         sac1fbe9I32LJEczN4QW8dOCsdJzKCyGfFgdquc2twxEZvKczBwcrhbqCMW0iLzIHbr9
         JCQQtgCi0+tdIMdu2QUBc3uiGVsrRXLAB20DbRG71gTJiW7QmrUl5N1lZSKxsLzkD5g8
         HejCfSNCahrcm+G+JFQNpiN+KyemdExPxgz7ReQWiwdxtYKnL6k4SGd/+4lAVpy4iL3Q
         1A8qxZwgwlP1kkYwVn0I3JuYpGzVMYIuQe8XZFIiru3mOlZbOfr+eyZcu9VLnt4TwDC2
         Q2jg==
X-Forwarded-Encrypted: i=1; AJvYcCXY2B752SLmq48IU/BDfB3VdnqElYY0pn6SGAUbIgncXEpwXEUkHkU6mPCy0UWX2BVDtNPTGF76CLhJLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYwIg4mDh63S03JaX3p4f1ppYbjSXwTn3JEtxY60u06EIkGyjR
	lmX+BHqnbTkBVR0hmgnS+S8nUjP31nzp8VMxWOcCWukrHOP3zv8NMchC8fKjlaVZN2I=
X-Gm-Gg: ASbGncvsGL8jg3pbC7jhL7VgaQjE6+aSe2qER1WAvAxMd7Fc+ewc6ZUmLzm9UuBmea6
	YkndSC/LPcpd4fo95zQibutNEJTRxGTx97d9oioZz/rY+/kWRFW1EUk19i4GKZ4xRfWe45AiI9H
	XmdaxKSL34X6Vkl20+Ydne+Xv87QxLNkVUOKLUQbj1Lj+rDNbuP82L6eilBApXME/4f32Sf79V9
	oALn4OWFW8+qczX9qZ1e16VbmxGEinA5iHr6FT+f0Gr2fxpyzGuHO99VH0jVkwHnigVc0EIzEYq
	3joZfXD1KzwxHDdN+fRRp0CrA7Ui6j6as8aAlh/Ermn234fjHSPcNc6lo7sMOytu1QjdHXUTYhM
	A
X-Google-Smtp-Source: AGHT+IEomsRBijSCauKahXmuN9DoALYK71K7BXkR2JKtgSOuJFyLBUMw3W56VvXiuEzOAN9bZpH/tQ==
X-Received: by 2002:a05:6000:2503:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3a5319b17c0mr15062186f8f.5.1749565057467;
        Tue, 10 Jun 2025 07:17:37 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de17sm12762433f8f.18.2025.06.10.07.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:17:37 -0700 (PDT)
Message-ID: <349a1cea-3377-4022-bebc-6b67f18077bb@ursulin.net>
Date: Tue, 10 Jun 2025 15:17:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix compare in WARN_ON_ONCE
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dan.carpenter@linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250605085336.62156-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250605085336.62156-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 05/06/2025 09:53, Christian König wrote:
> Smatch pointed out this trivial typo:
> 	drivers/dma-buf/dma-buf.c:1123 dma_buf_map_attachment()
> 	warn: passing positive error code '16' to 'ERR_PTR'
> 
> drivers/dma-buf/dma-buf.c
>      1113         dma_resv_assert_held(attach->dmabuf->resv);
>      1114
>      1115         if (dma_buf_pin_on_map(attach)) {
>      1116                 ret = attach->dmabuf->ops->pin(attach);
>      1117                 /*
>      1118                  * Catch exporters making buffers inaccessible even when
>      1119                  * attachments preventing that exist.
>      1120                  */
>      1121                 WARN_ON_ONCE(ret == EBUSY);
>                                               ^^^^^
> This was probably intended to be -EBUSY?
> 
>      1122                 if (ret)
> --> 1123                         return ERR_PTR(ret);
>                                                  ^^^
> Otherwise we will eventually crash.
> 
>      1124         }
>      1125
>      1126         sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>      1127         if (!sg_table)
>      1128                 sg_table = ERR_PTR(-ENOMEM);
>      1129         if (IS_ERR(sg_table))
>      1130                 goto error_unpin;
>      1131
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-buf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 0c48d41dd5eb..451714008e8a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1060,7 +1060,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   		 * Catch exporters making buffers inaccessible even when
>   		 * attachments preventing that exist.
>   		 */
> -		WARN_ON_ONCE(ret == EBUSY);
> +		WARN_ON_ONCE(ret == -EBUSY);
>   		if (ret)
>   			return ERR_PTR(ret);
>   	}

Thread bump FTW ;)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko


