Return-Path: <linux-media+bounces-5669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E385FE1F
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 17:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC60A1F25706
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 16:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B64215098C;
	Thu, 22 Feb 2024 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uq8xSbpv"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA3728370
	for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 16:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708619636; cv=none; b=otvMIiLG15cs1HgGeSrZJN+acs2xU7SW8LSL6/hc5bB9kPYnRQMCBGKulejXjsIBfzKTNRrzF1v7w8kFWMZzMchROmv8ryoaCyICckftu5EGrnXL2jmlB16AbFdLTgcekb+uM1GTUeqqMew4FS8KxllKpWzcWXvp3APcFvf80hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708619636; c=relaxed/simple;
	bh=Fdumt5nBczJiVUcm7uk4eAbxeHQ5Ilsn/VrJ4bxfqf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvGFcWWw8i3vb2VKfLGmBy8K1StfiU9lG64ZE2DtudlcyXuqo/a77Viaij401hRki7DDPeyf/aj7klvEAyc6whHbSKvI8pRiMWihvhS2E4d+N+4PCI2d5aASgBf4uOMLg0pkvrNx+m9FkSo1by1pv2/0U32OvINbkMiePlDN/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uq8xSbpv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708619633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njZCOqSfwyB80QbQtxM7mZ+GgiYBhl+JhpjZqiRCVAA=;
	b=Uq8xSbpvvJtT4xs+yBgcP54pUYqd/+Ev3F/pK+vB8HM7vwKDWcaFA7xkVTsOaZz4D3JZCC
	ZKnAfzqi1EdCAgVxuGS1b79bD67YHd5dCG6kJchsGhYvoYT4TY4Kc4MWkbie7hnjM5aqy5
	VVH86rdrqXViKGQbk7Gz4G1FGuQqN7k=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-Jtno1km2Pcy_ua8aVlx75Q-1; Thu, 22 Feb 2024 11:33:52 -0500
X-MC-Unique: Jtno1km2Pcy_ua8aVlx75Q-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2d243193975so34398261fa.2
        for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 08:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708619630; x=1709224430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njZCOqSfwyB80QbQtxM7mZ+GgiYBhl+JhpjZqiRCVAA=;
        b=AvvW4K6JFi//0e34kgx+md/4b8fBxbDgXfZuHhHZE5W4Lr+W/Rced+CiBzDiCwU9Rq
         XvZO2ZqiuOqoRLOS6p0m4+4NVK6qVSX5CzQgRr4YVNg7kS+qR4eLe1PnJk5wj5703pfT
         yYH4sl4Ya1m9FBLBM+zRvcOJgRhHjnlP2E1BjGzK1OOE5WJQYvTmL56uV27gMvifSkfy
         Y+fFNW/MXx6Dw9QE7YBTAKkpvUCLPLufKTfxXreHf98isQEUl10dbN1fMIUsFaHuiMyN
         1KCV5jU4jZFbdouBWf4va6HaN3V3gwG3WlwIQsY2l6pTplfnBfzb3Imzz4Azau9htpzF
         u2MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXeOwzgF3K7pXBdk9is9vGesYzQA/C5ncG/3F4zD0YujTXTk7yzGZdQFnH1HZGnSKYT/drA/Vp5ZfSqrwm/DhNO/vR63xSX0/64og=
X-Gm-Message-State: AOJu0YyKeQj1WxEiBsiCYff/I9Ey6xhN1A63AwfATVFWMhgtOyPbzWfp
	DsspJUWh84OBJJhpvHhbJrGJgEUjlxtT/qawEfzHvGFl/+OA0duuOKusi7S5U3wcYmFbkyO1Cw0
	xroSMdsCHbsafvXZ9ZWZIMoLxaUCxqHtPp6hnMZ1gUrwNgKgurlTFsb5vn0uV3X2q/6E=
X-Received: by 2002:a2e:3006:0:b0:2d2:3a0b:cafd with SMTP id w6-20020a2e3006000000b002d23a0bcafdmr10418090ljw.39.1708619630291;
        Thu, 22 Feb 2024 08:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI138h4lOSeCRjEurXIrOuTh8eLV27RylT4Rf4kQNmJ/ypogDBjDEPgj0+u2J83JlT0EPEWA==
X-Received: by 2002:a2e:3006:0:b0:2d2:3a0b:cafd with SMTP id w6-20020a2e3006000000b002d23a0bcafdmr10418075ljw.39.1708619629961;
        Thu, 22 Feb 2024 08:33:49 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-30-118.cust.vodafonedsl.it. [2.34.30.118])
        by smtp.gmail.com with ESMTPSA id g5-20020adffc85000000b0033d8aeb229csm3152570wrr.27.2024.02.22.08.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 08:33:49 -0800 (PST)
Message-ID: <ad03c582-28b9-40b2-9c7b-8372ed5a05c2@redhat.com>
Date: Thu, 22 Feb 2024 17:33:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/test: add a test suite for GEM objects backed by
 shmem
Content-Language: en-US
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
 <045bfb84-9833-442c-ac54-ed7a26451afa@redhat.com>
 <fb2ac929-6650-444e-8f24-c9b1562d2bb3@roeck-us.net>
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <fb2ac929-6650-444e-8f24-c9b1562d2bb3@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2024-02-22 16:52, Guenter Roeck wrote:
> Hi Marco,
> 
> On 2/22/24 07:32, Marco Pagani wrote:
>>
>>
>> On 2024-02-18 16:49, Guenter Roeck wrote:
>>> Hi,
>>>
>>> On Thu, Nov 30, 2023 at 06:14:16PM +0100, Marco Pagani wrote:
>>>> This patch introduces an initial KUnit test suite for GEM objects
>>>> backed by shmem buffers.
>>>>
>>>> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>>>> Signed-off-by: Marco Pagani <marpagan@redhat.com>
>>>
>>> When running this in qemu, I get lots of warnings backtraces in the drm
>>> core.
>>>
>>> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:327
>>> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:173
>>> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:385
>>> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:211
>>> WARNING: CPU: 0 PID: 1345 at kernel/dma/mapping.c:194
>>> WARNING: CPU: 0 PID: 1347 at drivers/gpu/drm/drm_gem_shmem_helper.c:429
>>> WARNING: CPU: 0 PID: 1349 at drivers/gpu/drm/drm_gem_shmem_helper.c:445
>>>
>>> It looks like dma_resv_assert_held() asserts each time it is executed.
>>> The backtrace in kernel/dma/mapping.c is triggered by
>>>     if (WARN_ON_ONCE(!dev->dma_mask))
>>>         return 0;
>>> in __dma_map_sg_attrs().
>>>
>>> Is this a possible problem in the test code, or can it be caused by
>>> some limitations or bugs in the qemu emulation ? If so, do you have any
>>> thoughts or ideas what those limitations / bugs might be ?
>>
>> Hi Guenter,
>>
>> Thanks for reporting this issue. As you correctly noted, the warnings appear to
>> be caused by the dma_mask in the mock device being uninitialized. I'll send a
>> patch to fix it soon.
>>
> 
> Thanks a lot for the update.
> 
> In this context, the TTM unit tests fail as well in qemu, with worse result:
> It seems there is some bad cleanup after a failed test case, causing list
> corruptions in the drm core and ultimately a crash. I don't know if this
> is also caused by the missing dma_mask initialization.
> 

That's interesting. Which --arch argument are you using to run the
tests with QEMU?
Thanks,
Marco


