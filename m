Return-Path: <linux-media+bounces-10862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B988BCD2A
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 039E0B20B08
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 11:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E81514386B;
	Mon,  6 May 2024 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="du7BYsxk"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B70142E87
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714996164; cv=none; b=aEFZsTL0v1dcRfOLTlqAqPFOGltteoynfBi6ZUvZVRyulA3irOc+HCXpgfFide0Yf5oLLUaxpgtiGzlQ6/zNUEf2XbfXaT5X09SAO1d4GXQyJrU2FQkfJhhEHGUNA/xXaScOWFX8xPCQQxNsN7jt+BgQ2qhp91VHz3qiqHKcdJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714996164; c=relaxed/simple;
	bh=dMc0/sjIPX+UuUh0qQzR0/ivpU5f1U0fp43I0bJLaik=;
	h=Message-ID:Date:MIME-Version:Cc:From:Subject:To:Content-Type; b=QRyxHXKJz29BOMk9wI7CpCUu9GJeQ5RygoNfZLAzKcrtFc5m0h38HUbA/Y19pgdES3HxzZf40+zw5OyfWOlSEXRnBYLMfosSr1pJ4dfZH0LujdGoYUKC8D+jpVDV3v2e/nwGVqo4TG/ZWT1swBYzG9baTBnuPBPm7Paa84KnQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=du7BYsxk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714996162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UVOjuGHnijX2tGdsGbh2K5EBK8PBebK05w8A7S2lTKk=;
	b=du7BYsxkpiNgHIwIJBDVSKypIGOSDF8zUmSYd1e2DMu4O/JJHX6inkJ0AlsE+kanagNNTe
	TtAGxeNzl3c89lKHwH92fZKf06DR9qtHHlWZ1pZlKt86L+I4CZM8Q4o5ZckrfGY5DYwcg2
	ILMrY4HgnEYXv2yw3YvKwgPY4wQOP7U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-yFB6pgdGPDmwDPTJ-9s-bA-1; Mon, 06 May 2024 07:49:20 -0400
X-MC-Unique: yFB6pgdGPDmwDPTJ-9s-bA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a524b774e39so177199266b.1
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 04:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714996159; x=1715600959;
        h=content-transfer-encoding:to:subject:from:cc:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UVOjuGHnijX2tGdsGbh2K5EBK8PBebK05w8A7S2lTKk=;
        b=Kf7eMm1dmk7EdqzCXeeiUV2Afj8nRPrtyxLHOdoKdUGyeK1IrqkLuvY0vXpAxRKZ4d
         BO2l4HdIexFZvT9qoRG0/y/rB0auotskkOeAE0Y9ka6Lp+GZH9htNOmn1WJktqzWNlX6
         e+0SpSPVAOLtTXLYIo3NEg8fs33q5ayxZ7VNfKpTZxPAgVkPlI35M0n/4c+2wK7j6f9C
         ocublFyrRnH7vQG3Qt1/Ghlfg2yrDVTwoLyt9WW9L6i/lMV7fMEIGiXleGOKWZmXbMxi
         F9H+LTSymxsBsLE1dhcTld+WGzKn4JoQtTyTMotDpfcb2UkK+TagNT2tg4erZxIzDxUV
         XsQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCRASUV2bQjxuV4x/cjAG0dbzy4EXiWeA4CC1rwGuUssrGy0OIuWO900V5N5W+FXG608KrXT6yCk13DhiWWXZA8EZOw8dqC6RLgKk=
X-Gm-Message-State: AOJu0YxXGjnnXYh/9JLqX2iAHBbn9i9N5SYb3H4Alcf2tVbL7hdUpBeA
	NrmZuug7AzoH72jBwpt631SUy/LZ9amwNja2/d5yxTMwDJKv6gDIBZTMH0Gi4L551m0GdXkswa9
	fdEAyKmEVolPI5eBBqbDeJ5KAatwetuD1iKRrFHJ9nSKEHA14TIkKpi5i4CYa
X-Received: by 2002:a17:906:f59d:b0:a59:aa7a:3b16 with SMTP id cm29-20020a170906f59d00b00a59aa7a3b16mr5438591ejd.4.1714996159601;
        Mon, 06 May 2024 04:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/BF449P6oYtXTLNlNFAmroU8YxK+dtUwmZhtwQBPNCYWIPRiuWpV7/MJdB0SdzgHMSrhNTw==
X-Received: by 2002:a17:906:f59d:b0:a59:aa7a:3b16 with SMTP id cm29-20020a170906f59d00b00a59aa7a3b16mr5438572ejd.4.1714996159209;
        Mon, 06 May 2024 04:49:19 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ze15-20020a170906ef8f00b00a59ae3efb03sm2667510ejb.3.2024.05.06.04.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 04:49:18 -0700 (PDT)
Message-ID: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
Date: Mon, 6 May 2024 13:49:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi dma-buf maintainers, et.al.,

Various people have been working on making complex/MIPI cameras work OOTB
with mainline Linux kernels and an opensource userspace stack.

The generic solution adds a software ISP (for Debayering and 3A) to
libcamera. Libcamera's API guarantees that buffers handed to applications
using it are dma-bufs so that these can be passed to e.g. a video encoder.

In order to meet this API guarantee the libcamera software ISP allocates
dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
the Fedora COPR repo for the PoC of this:
https://hansdegoede.dreamwidth.org/28153.html

I have added a simple udev rule to give physically present users access
to the dma_heap-s:

KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"

(and on Rasperry Pi devices any users in the video group get access)

This was just a quick fix for the PoC. Now that we are ready to move out
of the PoC phase and start actually integrating this into distributions
the question becomes if this is an acceptable solution; or if we need some
other way to deal with this ?

Specifically the question is if this will have any negative security
implications? I can certainly see this being used to do some sort of
denial of service attack on the system (1). This is especially true for
the cma heap which generally speaking is a limited resource.

But devices tagged for uaccess are only opened up to users who are 
physcially present behind the machine and those can just hit
the powerbutton, so I don't believe that any *on purpose* DOS is part of
the thread model. Any accidental DOS would be a userspace stack bug.

Do you foresee any other negative security implications from allowing
physically present non root users to create (u)dma-bufs ?

Regards,

Hans


1) There are some limits in drivers/dma-buf/udmabuf.c and distributions
could narrow these.



