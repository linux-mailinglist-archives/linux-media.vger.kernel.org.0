Return-Path: <linux-media+bounces-11041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE52C8BE60C
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8274728BF43
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 14:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BEA15FD0E;
	Tue,  7 May 2024 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TnXk4B34"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E834715EFB1
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092474; cv=none; b=YmCtnubjx4M0ofbeb0PFLerUrKVMpbZ5GEmYGf4epep4sotETw1itkyJ0L0NgqLm2OYJPvLm3RX7QseJlqkIenGiDA1MQfUbS5XzECne4a78czssEOKlHt0rLmmj1Mlv9mug09/YS6hjlFcQrF6UoOsUBtGEx7cWN2EZ5fU9egk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092474; c=relaxed/simple;
	bh=HNtKzgl9HwI6J7a5I/qX+lgiBT0k9lV+t79iUHomqQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=la19cjrnnS/O0GchWZVubg5vuAHKU4mN0xXdiuBKVHai2nF8WEJ35iBLWjbR63EQiKHrZr9kVI5plz2SdFdvN4jhMR9YGasYkF6L3NP4/ng0R+A6iScJ4wZSsfHAGF2RUSxhftM4dyiPqlXkJnu45F+/Bs/xhFfsKvPqqCb9D90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TnXk4B34; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715092470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dxfYA0kT/oiCPR8P3ZGYKwq4gr+a/9ebQZcuGC0TkRM=;
	b=TnXk4B34dhbCSpeZR1BDKde4rBhXL2x+t+1G+2ZvVZHRwXDLVAjvjamllRohyYyyjkBOvH
	UFD60ZcLyD0IyRdXfS0OpFHfKpMEqFL4OjYgaJGBIhLpKvMDzFulY0XpHi5Lc96APthpWI
	vacJYmC6AYLk4GM6mcDXjZ15/uT7l80=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-rp-9J-GPN1yoolG3hTjB1A-1; Tue, 07 May 2024 10:34:27 -0400
X-MC-Unique: rp-9J-GPN1yoolG3hTjB1A-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52025c91485so2408759e87.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 07:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715092466; x=1715697266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxfYA0kT/oiCPR8P3ZGYKwq4gr+a/9ebQZcuGC0TkRM=;
        b=WMQh885ej08NjVZFnf9ovtEFsluCuC9xV0CuFSfoPwOIJ44hOv7AQw8pnICU1fVF8Q
         3M92h0/OWJcX+huQJvQqrFfncFxkzsJtaiWNMp3V5jzwrfBqtWS4lClGkjcJ2NMZLWaE
         H1+6r4THv7iBTOtSG7XXsvX/oqRlSOeRHuNJV5UDlq9wn1gebEzX4RNc0OC030lmbDxc
         oEWtLIGQPzZUxlgRVCVPEHZKuLhNPaldLO/Gy2LucwTa1UzmX9VsMioycZ8Wg4FHHEJC
         eo+EZsxl6YmtrpDnldTG4Yw3szpZfn8SOOdbxok2pvf/T6RkpYJ6GmrPYcNk4lKe2yk2
         jMpw==
X-Forwarded-Encrypted: i=1; AJvYcCWIJPnr/uusYe0xYcHcIXREpKpwPBwwHedRS/7YAH/PWKCTYvy9MQPSsedypADGspkL36pzLpvNzFQFEt+sYwJx9VdOnO6u7+TDYMY=
X-Gm-Message-State: AOJu0Yz9JMFqP8Q/hn3nXwcZOc2ddut+6e3VxueZMIaThgTW0gO6JRDu
	SSWpWG8csL3eOiGGAUa9xy8rtMvmhhhtlflEQploRrWjdRccr0EXfonzzSJ5VqdvuHRaEFMza65
	oK0BdpkYo/v2iZQNgM5lRIIQFkOU7KK0qM6IxMrYkeLSnjdkE9V9RnGTdzEZx
X-Received: by 2002:ac2:4214:0:b0:519:1e33:9d85 with SMTP id y20-20020ac24214000000b005191e339d85mr8206485lfh.36.1715092465998;
        Tue, 07 May 2024 07:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJf6M7/XK+2/GfqsOz3VPdKfvdQSS9fpgAz3ojdSlixZ5gK65wQW/LGj1l0TFGD5KOfhLbVw==
X-Received: by 2002:ac2:4214:0:b0:519:1e33:9d85 with SMTP id y20-20020ac24214000000b005191e339d85mr8206456lfh.36.1715092465580;
        Tue, 07 May 2024 07:34:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id b19-20020a1709062b5300b00a59a05a8030sm4709239ejg.25.2024.05.07.07.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 07:34:25 -0700 (PDT)
Message-ID: <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
Date: Tue, 7 May 2024 16:34:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 5/7/24 3:32 PM, Dmitry Baryshkov wrote:
> On Mon, May 06, 2024 at 01:49:17PM +0200, Hans de Goede wrote:
>> Hi dma-buf maintainers, et.al.,
>>
>> Various people have been working on making complex/MIPI cameras work OOTB
>> with mainline Linux kernels and an opensource userspace stack.
>>
>> The generic solution adds a software ISP (for Debayering and 3A) to
>> libcamera. Libcamera's API guarantees that buffers handed to applications
>> using it are dma-bufs so that these can be passed to e.g. a video encoder.
>>
>> In order to meet this API guarantee the libcamera software ISP allocates
>> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
>> the Fedora COPR repo for the PoC of this:
>> https://hansdegoede.dreamwidth.org/28153.html
> 
> Is there any reason for allocating DMA buffers for libcamera through
> /dev/dma_heap/ rather than allocating them via corresponding media
> device and then giving them away to DRM / VPU / etc?
> 
> At least this should solve the permission usecase: if the app can open
> camera device, it can allocate a buffer.

This is with a software ISP, the input buffers with raw bayer data
come from a v4l2 device, but the output buffers with the processed
data are purely userspace managed in this case.

Regards,

Hans


