Return-Path: <linux-media+bounces-5650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C9285FC72
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 16:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D60C4285E3E
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 15:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39B614D45C;
	Thu, 22 Feb 2024 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ByBLIms7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D314F9C5
	for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708615946; cv=none; b=WNYqQFT3cC3ZH87XNqMD5iKDz1NBjc19euovLBM1o/aXut0N9OGv4w3GxUd1PwHqlZwmZnYaOOnUYWlopa80Svr+85cyYSeqQb3sFmtGqeMRUzOfYA1rshP4do5YdtgD2wAuOMdr2zkVrEdTQiaEwpGFi1HUG3Fsr8Tn/fivhJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708615946; c=relaxed/simple;
	bh=ILZ+ytHMYKacBLXIoRoUpJ+AFIhaDE8jQlHaknZBlaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j11r2+8Xe4x4e3viDzhaa+fXsVz+xkP6BM36ZjTfs1KIhPzO8L4X69frJtJ/9XSk1x0MQ4G0mW9d9RT0cpICYTgqs/RQRS8LzAkgyQYarCXc3/jW6SFOBcGFf+qvqeIEhXpkl3CK7+SyskMQ2v9LJJ6C4DIuxZ5wUY5aK0Ao2uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ByBLIms7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708615943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COOOv66KH1+SApkaaFo0J6m3wbUnEio+qyBcuJNmFkI=;
	b=ByBLIms7xWM8fjEl18qip7O+dLLonrz7jMYMf/IwXnocwRXXDfYkbXdkXcx+zLMrbh8dwt
	s1jEcAzF4rQObfT5iSt6gejLieSUWSlfS9bKtPQnKx5lXhV7TzrK39uJ10uDVUsFJYRmme
	vSMy8eCrtqk9urfXqAbDNBhQlL959Os=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-2VtNNb5fPRSexbYm41VpaQ-1; Thu, 22 Feb 2024 10:32:16 -0500
X-MC-Unique: 2VtNNb5fPRSexbYm41VpaQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-512a820c444so4886026e87.3
        for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 07:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708615932; x=1709220732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COOOv66KH1+SApkaaFo0J6m3wbUnEio+qyBcuJNmFkI=;
        b=NqHKRVMrWBeUEBZCUquWdekHtM551WuGaS86Y27CLmnS5gouqi3rI5WQictAH2e/eW
         xuA7QJSMLZU97dwGZZJt6shnidTkXGI8EqWsC86WS+QgeVeqzA9r942ulqtOI8ziXWkh
         5lGzRNmJqyudeVxDKahG44OTCINewvwGkR3P1pAu5RuSfpB7o01EPQXQATYYbOy+gf/H
         Yf8bas9rNJsT0F+NNzy0kargY5/uDtrIowkqvWlGycJKHVxEmOyQLAsAjJVb+OK0petR
         6vWac6M6Xojt61W8GbU7wE0d+OicYDKP+0ocDQhNQ1Z1TOlhi8UTMsME7wj4lXHlwgy+
         gMow==
X-Forwarded-Encrypted: i=1; AJvYcCXwDnNjLVHMOKB+VFyNRCAxGrd+/T4OXWcJYl5ef6pTCOJ/pSECFj8JBzW0nwenLGP455MFUY7HS1j8HE9xU4u9vcPhuZfSrSil7Kw=
X-Gm-Message-State: AOJu0YxYhp0MJM6ttAMzGheOMeHxMDe+epyiyumW4REVU7E/t61DhTeg
	PqVHvt0V+ozPOuwvPPR49M1ijoUV1OwgykVyCoFyd1oDdsXzHWzh972DfWQ5sS5xnwAHNnQjLwG
	XTE27whD9CNSRu/87OlFDYvsJLhRcoiTky56F97DqJcBK/F0440Ek8RH3J00=
X-Received: by 2002:a05:6512:242:b0:511:75a7:1513 with SMTP id b2-20020a056512024200b0051175a71513mr12875617lfo.67.1708615932305;
        Thu, 22 Feb 2024 07:32:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYzUCJ58Rq0YBrFgbCy6cdgYwzft9rG3rl8YAo9DDi+bclXTMokpgpGlzD+Y2Qn6bNjH/hxA==
X-Received: by 2002:a05:6512:242:b0:511:75a7:1513 with SMTP id b2-20020a056512024200b0051175a71513mr12875601lfo.67.1708615931943;
        Thu, 22 Feb 2024 07:32:11 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-30-118.cust.vodafonedsl.it. [2.34.30.118])
        by smtp.gmail.com with ESMTPSA id e2-20020a056000120200b0033cf80ad6f5sm20582039wrx.60.2024.02.22.07.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 07:32:11 -0800 (PST)
Message-ID: <045bfb84-9833-442c-ac54-ed7a26451afa@redhat.com>
Date: Thu, 22 Feb 2024 16:32:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/test: add a test suite for GEM objects backed by
 shmem
To: Guenter Roeck <linux@roeck-us.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20231130171417.74162-1-marpagan@redhat.com>
 <a45b796d-5e04-4eac-b5ba-ea6bb3b6131b@roeck-us.net>
Content-Language: en-US
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <a45b796d-5e04-4eac-b5ba-ea6bb3b6131b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024-02-18 16:49, Guenter Roeck wrote:
> Hi,
> 
> On Thu, Nov 30, 2023 at 06:14:16PM +0100, Marco Pagani wrote:
>> This patch introduces an initial KUnit test suite for GEM objects
>> backed by shmem buffers.
>>
>> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>> Signed-off-by: Marco Pagani <marpagan@redhat.com>
> 
> When running this in qemu, I get lots of warnings backtraces in the drm
> core.
> 
> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:327
> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:173
> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:385
> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:211
> WARNING: CPU: 0 PID: 1345 at kernel/dma/mapping.c:194
> WARNING: CPU: 0 PID: 1347 at drivers/gpu/drm/drm_gem_shmem_helper.c:429
> WARNING: CPU: 0 PID: 1349 at drivers/gpu/drm/drm_gem_shmem_helper.c:445 
> 
> It looks like dma_resv_assert_held() asserts each time it is executed.
> The backtrace in kernel/dma/mapping.c is triggered by
> 	if (WARN_ON_ONCE(!dev->dma_mask))
> 		return 0;
> in __dma_map_sg_attrs().
> 
> Is this a possible problem in the test code, or can it be caused by
> some limitations or bugs in the qemu emulation ? If so, do you have any
> thoughts or ideas what those limitations / bugs might be ? 

Hi Guenter,

Thanks for reporting this issue. As you correctly noted, the warnings appear to
be caused by the dma_mask in the mock device being uninitialized. I'll send a
patch to fix it soon.

Marco


