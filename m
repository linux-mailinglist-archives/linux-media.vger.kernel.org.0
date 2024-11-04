Return-Path: <linux-media+bounces-20788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 285589BB2F0
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 106C328257A
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584CE1C304B;
	Mon,  4 Nov 2024 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SYtdIS4H"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081FA1B3951
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718532; cv=none; b=ITwi8i5T9Y4Z0q86NasbKEpQRl2dGpDKT7THRrp3Bvi2SjUPTWUHvSw80M1cHULeSd7SyaYudKpAbejrkSZSeeg6+iqHoKYy+LjVkzE1KHh7EJJPo/5dYMg793mV1Wv9xDfBABHzAH6iYZTy3dQAvaNV6Zx0pBsZOdls78C8w5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718532; c=relaxed/simple;
	bh=s5P19hNeuAnGUdrMJ/5Mqch/0JAtnNtGyau8mT1WKzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUVxlVFhU1l5xSAApgcZ+TAqLu+SP1IoXDYJfVYqJ3KJEPTnR7F+a8G2HumWDRp1UNJRSqCL/tuQIb/ds8eOhcYAA2OU3Di1PMRvgxxMvNLYm3HsW2bfbkzWw8kYzeF9HkvV66xWO6zFOuKqKmvBmcs0qWo5wN6OsU70A7A02ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SYtdIS4H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730718529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eiPSsBINkhUGJeoO3ADfkXjMLznBBsiB9KM89Hnjm4M=;
	b=SYtdIS4HmEVDpNMzJwcCo2o89llRwJj+EmYfXDFQoGHEGKgs4b82MbLkOu8vI6oXwYB80p
	Sc7Dc26EFINvg0mF03p5WpyxXBf5zYMS/zy00j6Z3KmbTxGi8OAak/dNW0M06FwqvjQduL
	9tpF2PNKVJ6wFaMKkWhANjzYW6B88Xw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-XWtuOZTHPqeQpXybSeOZIQ-1; Mon, 04 Nov 2024 06:08:47 -0500
X-MC-Unique: XWtuOZTHPqeQpXybSeOZIQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c934ceea1fso3203601a12.2
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 03:08:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718526; x=1731323326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiPSsBINkhUGJeoO3ADfkXjMLznBBsiB9KM89Hnjm4M=;
        b=UoEKdyAxPEqs3MbuON0X//Cw58Z9ut3NzO8EUhRjkXlslRfli2mOn3zwfJ3M05MSkl
         GnSoVkPW5bRbpxHB5ddhuSfFDnpCoUovs6D6YpwQIzUU7eBZ5fnO2p+2s2QZ0NexZkBV
         amkAmPFbloEMvokQtO46o/yiEg9TX4/zB+3gps4o2B7S58kZmz4fPn1roLdi5HWdvmlH
         xend2VC8drpgzG6BGifmJNdtPy958E82W9i9AvoVm9J7vHvjfUTxWPs0c6HVLMLgr9ib
         rSgqXU1E8QCplbaz4mRqSn7pDewSXDky/dsnnN4iikNMfR6DGnR8Xw2i9Xft0gnxDWy0
         oBig==
X-Gm-Message-State: AOJu0YwGQ1StVnKETQlTvdW7HLcRjzDEkkNkUsuMw+v2+w2hmr79HS43
	jM446/D2h2WpRl+f/Rjfq4snEcKqB8NjqS4ZoWB8YqbRcajtEEqpRbQp7QngmRDrzfoneKRvGiy
	WyH+PzQ2MJ61Sh9aVMqG4bqUPUmxr/VYE5i78McOaReoa+grUL7Gm55SMfpyX
X-Received: by 2002:a05:6402:1d4c:b0:5ce:de14:65d0 with SMTP id 4fb4d7f45d1cf-5cede146642mr966710a12.0.1730718526156;
        Mon, 04 Nov 2024 03:08:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpuDyO8D1nRRXTlTJuNJPSHeW3WHC0+/HSstAONVJrZSkZK8THp6jyRFyHZaAKg2FAXzHvYw==
X-Received: by 2002:a05:6402:1d4c:b0:5ce:de14:65d0 with SMTP id 4fb4d7f45d1cf-5cede146642mr966691a12.0.1730718525615;
        Mon, 04 Nov 2024 03:08:45 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8c91sm4128304a12.75.2024.11.04.03.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:08:44 -0800 (PST)
Message-ID: <e25fb120-965d-42e3-9f0a-7aa9bc1c9dee@redhat.com>
Date: Mon, 4 Nov 2024 12:08:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: hmm_bo: Fix spelling errors in hmm_bo.h
To: "Everest K.C." <everestkc@everestkc.com.np>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240918082203.4941-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240918082203.4941-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Sep-24 10:21 AM, Everest K.C. wrote:
> Fixed spelling errors reported by codespell in
> drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> as follows:
>         increse --> increase
> 	decrese --> decrease
> 
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> index b4c03e0ca9c0..6d3c74156345 100644
> --- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> +++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> @@ -159,12 +159,12 @@ void hmm_bo_device_exit(struct hmm_bo_device *bdev);
>  int hmm_bo_device_inited(struct hmm_bo_device *bdev);
>  
>  /*
> - * increse buffer object reference.
> + * increase buffer object reference.
>   */
>  void hmm_bo_ref(struct hmm_buffer_object *bo);
>  
>  /*
> - * decrese buffer object reference. if reference reaches 0,
> + * decrease buffer object reference. if reference reaches 0,
>   * release function of the buffer object will be called.
>   *
>   * this call is also used to release hmm_buffer_object or its


