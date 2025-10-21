Return-Path: <linux-media+bounces-45151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A51DABF81A8
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 20:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70AC319A5F28
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 18:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E812234D92E;
	Tue, 21 Oct 2025 18:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="qZrqNO/I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7DC34D929
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 18:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761071810; cv=none; b=ZM6Eq1qtIGCU1WPtCq4GwHoweIgrupsbwyJkpNQS/N7CsbSV/5iIT2LM0FTfXLNpku3BP8wpobJRLJJPh/lsQDDgwcyRNGZwABJzeounCOiDuTd8V90tUI+oBQW04xX+LIEsuQiurcXoWgD2REKwtUxKuYwpvh5dDpqVzJL0+Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761071810; c=relaxed/simple;
	bh=+P4ANvuSavfcnKH62tr+Cug3Rf+Z+UGRmWABjDVFotA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoZf+/7X6QLyavUWwC0hJyXMPUWNiNw0w/sIBdvuALW58sq5+IArgsjb5j3HmJD3IBzHx4lbYFXWqUMrH6KIcROtFBnoiPyn8mA5mLDH+S57ZozepVdYadzct0GL+E18+bX3K2/KInOehn1XnZN5EvnK284se/WFHH1Op3FE+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=qZrqNO/I; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-471193a9d9eso53789435e9.2
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 11:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761071806; x=1761676606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/31NMDpjYxX79hD0m9CWPcEz0sXm9H/7kszN6l94dI=;
        b=qZrqNO/Id9RifjTaQmi64699CqsnWL5aNkrIB2GhnYzKq/eYuNLbuap6xnkWnCafVs
         oDWZVpmg+7QLw7q8v1Hd+250HDb0LcxLtGuhi7UqzRJHRRzMbmaT+MnOB9kzsxHu5gcp
         Crgs9iBXLr6Io/kZE7LY8sOVkiK3ed7+z0dM24GA8X14Ny1x2JZfZtJNAE5IjfjglrFk
         /0BdXgNFapMM2Ve2ze9fzPr5acDC63z8a/NT93HLxXGTHUnx5OUpFIAWKDwjMLE7B7UG
         XyX+MC7BCq91v6+NwweVXLNioQII1KpwKaQin5Er3r5wz1G1yGs2C2neT9BOt1HevCIV
         9ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761071806; x=1761676606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/31NMDpjYxX79hD0m9CWPcEz0sXm9H/7kszN6l94dI=;
        b=UywvmsCz5M66STer+C7yxcn4l69dEE18S4/n7uRNFzdvDhkh+ugH1iyuncS4bui39y
         j884qCUXBowc/+8jGDxf6t6gt7T9rXys5AvSVoN0DX3EvviVy4H6+Dv41eN+SI97msZk
         eBP759kNfBnXdMMNAQbaD6f5EZBmReXAHElKbrdALz32dPBVoBootd4v+UuyIkiz4Ujq
         XH20HWTaF6aGZLnj2wyVCmxKuwBC3L+5OcA4FMj/CDSRRrK0amZHa3uN67O/SCNKRp3g
         W8VQ8nUoV1k1o6UpdGLJ08tlQKh5PF4FRNwdlgIfWC/K5/B7e+QiZommrqYAfRgOjuwn
         W00A==
X-Gm-Message-State: AOJu0Yzla7ytKnrQ4Rjh4rbofTRwU1JOT7xULJ2gouaxwIPVMkT3GdEt
	1pxQUuCIsmltWprIzNZ/uzQBIYXod3MQe7wVe7T7QgRSNRYcxwRBmicxUHpLhiiSpuc=
X-Gm-Gg: ASbGncuBHXzgU0ZuE7NpaiW3PEMjR6nL5U3mY50Wc0AQaYOEIXdX2h6Pjb+7AOOdJAm
	pr4VumS2DvrVmT02lvZSoeLjd4XG14jxtIP3t7v9m+36cJV7jSdaMDQdvDYpp6ALnUpTqKHqXlV
	Xdh5YJbesrwmd2cjC8dV8uxde2QpGa/IDtzMClCb+IehEv7Kd/ZFbRWqUJjTBFHt1e+LmoaE7Hu
	XAr19tRWnR14t6JsbbIhAuvrvpr09O6xiIr8F2Pw+rhMQWyxtZtPEHusu7h4AIuSoawxRwaepN+
	ZRVjouIGUbQxK8gmEHdyc3AwVtjGsTizqqbgRl8IbYS6q/0BdUejFmaExQ5rJQkSlHle+egb/fQ
	a5dcu+/0y+uEueMSloOsMdheEf2n9GCgiSZU1hxHOA3LMUna0Cw7IewGS+WbNuJF1oIHHlw8glS
	teRmIHPsWnZ38vdj0=
X-Google-Smtp-Source: AGHT+IHuD5mgeD886pEcOy41CAh/C4EmnxTay38r/3oLMR6ZOooN7HM0ZxHB9uqLJmXa6KYTzdPWRw==
X-Received: by 2002:a05:600c:811b:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-4711787c803mr131576495e9.12.1761071805713;
        Tue, 21 Oct 2025 11:36:45 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427ed3fsm6714205e9.1.2025.10.21.11.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 11:36:45 -0700 (PDT)
Message-ID: <d9c16e9e-8321-41fe-9112-e754445d8bb0@ursulin.net>
Date: Tue, 21 Oct 2025 19:36:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Fix safe access wrapper to call timeline name
 method
To: Akash Goel <akash.goel@arm.com>, sumit.semwal@linaro.org,
 gustavo@padovan.org, christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, nd@arm.com,
 stable@vger.kernel.org
References: <20251021160951.1415603-1-akash.goel@arm.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251021160951.1415603-1-akash.goel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 21/10/2025 17:09, Akash Goel wrote:
> This commit fixes the wrapper function dma_fence_timeline_name(), that
> was added for safe access, to actually call the timeline name method of
> dma_fence_ops.
> 
> Cc: <stable@vger.kernel.org> # v6.17+
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document 
the rules")

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Apologies for the copy and paste snafu.

Regards,

Tvrtko

> ---
>   drivers/dma-buf/dma-fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3f78c56b58dc..39e6f93dc310 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1141,7 +1141,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>   			 "RCU protection is required for safe access to returned string");
>   
>   	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return fence->ops->get_driver_name(fence);
> +		return fence->ops->get_timeline_name(fence);
>   	else
>   		return "signaled-timeline";
>   }


