Return-Path: <linux-media+bounces-47699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FA3C85260
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 14:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B6544E7FC7
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 13:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B302248B0;
	Tue, 25 Nov 2025 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="JaBuEQvS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F322B1EB1A4
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076810; cv=none; b=sYAq0u5uJ/C5npzLNoX5k81RtN2nX0Ygxf2DvnBkIU9onSdJOgRP6P+RI2XFgRjxcxvTqSdxOQppU0E12k2Mnlds+cWO9MUVNqBa4hTX34DsPEPGoYR3CEeSDJLg6qoEGUCO7mtFEKPhZ8Z2+7MJGc/Wt/OpHsdhmjPGRe0NN+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076810; c=relaxed/simple;
	bh=GIAJQymOEiw7oQ9NIRxAqQCBFkIfZg8pmCcS8xtayzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GO1VxCDh//74aa7K9S0mUp/2Jmx9aHW7yf3bK/MhbQSjs9t3N7DfzDWwWlbKv/dRGBSBB20VBx9bSVmQbcu4ypU2CHRODlHAYw7/yMOfV52MEFzcoXNpjTYGc/pfm6y1YQ1L6j9ZSDlrqMqwwd0V1+J55WDZKcnbzxgGtQAZTMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=JaBuEQvS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477563e28a3so37583855e9.1
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 05:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1764076807; x=1764681607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aprKDYKlrTiFqlYRX/ECW07g4Q7VGo6Tvic7fnoqVWQ=;
        b=JaBuEQvSOmZdZDV18SN7wjd45K+deXUciAphhpnIUieuxtiurlK6PecaL2tUB8dCk8
         ZjG7fhFZgUyIYzW1OOQjMSnKetozzdqaN4OiTQ7sGxKs+ptZqO/ij1an269tLN7ZycPf
         jw7d2JGbNOMBioOoenIzr0xgwdCyd0BfGzWixTa5nmsdaGIlsBgk99odMjuk6DU5lt0m
         mnRLa4S82Bqux8qqXnwNe6sqBGROrvpb0MNUsXbUk9p+HMsyei4Ss4bNmHO03qB74YCj
         1bJiM/N2aKs7PaGvEriWwQ1DWhXSCS/Xxx5+fbsavmn0VDypLrgiptcOSiGXGmNpmDz/
         Rg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764076807; x=1764681607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aprKDYKlrTiFqlYRX/ECW07g4Q7VGo6Tvic7fnoqVWQ=;
        b=la8uVYtH+4HJcMpXrVKJaPlh54gwjP9yza2AhLa3hxVQ1LIUw/Bff4Tf83L6MMIVFH
         UGRZYww0bmh+CoU5x9PnCwTWqkeVbI59v3zdTOTCF/PyAtHi6SfPtQ7nkpIgOkcRNR1y
         WEBS3F+RV1fOfxENYh+Hw9rEK+ltzMRVvPL7HW0dtB6ku1G8lkka8XzTzwRD4W/o8Bsu
         bHTbGgjTLObs1ovCrhV8njGJQx5fcQE6R0Y2lTdI/YHx1I6E3eM3b5o0pd/6E2eS/1K7
         LrwEvQ+8YpN6pr4QGjmDQx3/lqZBH5zRT65c+MkO+yLhavO8/wmRJJ+ggoE8zashux8y
         ztcw==
X-Gm-Message-State: AOJu0YwR18YslaRo7E+MR5Bd/WjDkc5AcLd00Tt34LLl69farwG07NzC
	QNCM8fEWNvg8VM6omctCiFf1JGMAZ/zswSwI43YCKZ4n/xQ6uz4Uwt9dnahzv8jafSg=
X-Gm-Gg: ASbGncuIUBWZ1ATvJhGl8UCTA8AsJ9PKUP5LhF6YGfPmj5jZzxKZDOTUQHy8Kr/EpNb
	72UcOJq33PaIR+bAWlLB2bardE6vOPAI0aCjBnpaOXVWuSdkSy7rPiRdywteRqKywH6X+Cgt4md
	EvscQZF/bHP2xCul1jhfcgHd/njQtV0LJICTJF1cZZmGd8Kmhdj1iGLG78VlJzFrrFd6/C0Od17
	0gLpaasNlHPnBaNl9OoBsLvCT/7tN3ElmLJ+7S+2GV3imDUKlbg7lj46/gGhBRJlbmip3v2womq
	13Xk7v5uqXfTYfKuMihfxYCIMREticDRG/DOIjx1zW8AeCwa5X/kgnqgnbECikintWCokWYkenF
	YyM6Jdn87y9G+KgKkcq+yUy7AJ4l2zKZFaZ8om5axFrBQmh1M6YwcDBzPQPKN/EVDdCEM73X3yZ
	FoFuE/Fskha7QgzT7R9RhMr46Kn37eWUms
X-Google-Smtp-Source: AGHT+IHQEznJBdhJdN1tPju1HTTqm2y8/XXE3XsJpkME6k/iECmmqiOWumbCD4N2hJu6XfqgUDRWEA==
X-Received: by 2002:a05:600c:c0c3:20b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-477b9ee4fdbmr151348115e9.11.1764076807041;
        Tue, 25 Nov 2025 05:20:07 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf198a67sm264938725e9.0.2025.11.25.05.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 05:20:06 -0800 (PST)
Message-ID: <44d30056-612f-4563-ad9f-92696c5a803a@ursulin.net>
Date: Tue, 25 Nov 2025 13:20:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf/dma-fence: Unify return codes for signalled
 fences
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251125104443.82974-2-phasta@kernel.org>
 <20251125104443.82974-3-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251125104443.82974-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 25/11/2025 10:44, Philipp Stanner wrote:
> Almost all users of dma_fence_signal() ignore the return code which
> would indicate that the fence was already signaled. The same return code
> by dma_fence_add_callback() cannot be ignored, however, because it's
> needed to detect races.
> 
> For an already signaled fence, dma_fence_signal() returns -EINVAL,
> whereas dma_fence_add_callback() returns -ENOENT.
> 
> Unify the error codes by having dma_fence_signal() return -ENOENT, too.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/dma-buf/dma-fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3a48896ded62..09d97624e647 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -373,7 +373,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>   	lockdep_assert_held(fence->lock);
>   
>   	if (unlikely(__dma_fence_is_signaled(fence)))
> -		return -EINVAL;
> +		return -ENOENT;
>   
>   	/* Stash the cb_list before replacing it with the timestamp */
>   	list_replace(&fence->cb_list, &cb_list);

Story checks out AFAICT - only two callers fetch the error, xe and kfd, 
and neither does anything with it. So I'd say it makes sense to unify 
the errno.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

P.S. Just not sure of the 1/2 on which this one ends depending on. I 
*think* I suggested the helper in the context of some discussion long 
long time ago but what it was? And what about all the drivers which look 
at the signaled bit directly?

