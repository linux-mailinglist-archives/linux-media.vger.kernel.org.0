Return-Path: <linux-media+bounces-24724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2DEA10D03
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 18:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51FCF1888874
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 17:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159CF1F9AA5;
	Tue, 14 Jan 2025 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2XP9C/u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D021F943C;
	Tue, 14 Jan 2025 17:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736874451; cv=none; b=RdjsvJ10ErtmTGdHfypu9CpllkZ2xSn/k6kaMbav5VilZiVYHxn9/cUd16BZu1gJRwFMzAzMAlhZTGuHDWoRHzlkdK44mn5xInx+Pn4hSZf5RBRVPbfrun2adZDXoZe75eVckXoRAJgNIYNzhEIFIMwcgNvMZISZ8bXI7kUjjuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736874451; c=relaxed/simple;
	bh=Nnoh24Dz4UQuumTV0v3UEOHMNb0aqFjMMibU0zsSBlc=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=OOvfyflIer2rJPazmhR9vm2u2l43JGyvslmu1sZHP/lHgwdcG5F/EnaP9M6zVhHanL33YonKlEqrx6CecuWJ2XYi8soQa228H54DDGOx9YVMD7FsEz71yNldYASC8kBSHwd8ccBabUuHteIE2HZ0JPvNSL+TViySLlwMbIlQPmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2XP9C/u; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53f22fd6887so4890318e87.2;
        Tue, 14 Jan 2025 09:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736874447; x=1737479247; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Nnoh24Dz4UQuumTV0v3UEOHMNb0aqFjMMibU0zsSBlc=;
        b=W2XP9C/u4E934UASC8T0SAaDDHODm4FztKSFHdIy5J7xLmrKg0IoK78Un0xCa2cUQ2
         0ucUpdJtRRMd71v930w96m2Z0yTqjZlFUNjD8vBUdvPa47JRdH3L08IEOPbhUaXnw/jg
         akKPMyaWhecjIp4tGsjQnIPJaNVCkMoTzqtAqde/x181jwibstHeHz9hPdoixHwi8wYi
         ZLLMb1Rb5o38SKslnElx2gzB3cEMi7IO/PvPWYWe2R7Dw8VDkPa2eZNm7HZwT0guBOWD
         ISqw1eP//dr9CrXg2gS/CXZg9u7yIU726vJttHkaoKA7as89BOhWIlExO0lijoR2gjv2
         w1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736874447; x=1737479247;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nnoh24Dz4UQuumTV0v3UEOHMNb0aqFjMMibU0zsSBlc=;
        b=eJZ/AWlFKRWgx89a4f7Ar86b9OEbuZD+Ca+E4fKndloW6EYdjC58fv3R+7W+5N+v55
         F5T4eLMPa30uMm6vO+oO4aNn7Prh5heFB9zhnQ7x1ZzLTnC85hQqk5JnDOllibLLeO/W
         Ti9UHbaKaNHnFjzzLxHkcdlN/JF9uqXCQNEz7UNT5QLs4gxePKRdTPrQU/dMNsgPf87F
         IgtYT64I7vUbqpHVdEecKai6sMvvEab0edv8n/+dz6ESemSqrQVWHBDKAN47iw3jdiNd
         WgTwlM02WQpxPe/rWUMeE1odVwo5YaiHDHePVFa/ZWXHhKDsiQ7qbqtUz1KCwvph2/2N
         Y7Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV/SJyyJtEkp/PlJLdF8SPgv6YBTT65f/mp1ho3sqNyubSwgGUFnNPR908M/kcVsLnPogFRTJ0pPi1ZADk=@vger.kernel.org, AJvYcCXO8HNbh92OMKKAVpMn4lcgNsiEugPeDcmAqs6ds1VdpLHdQL69Hy6McmuPpSiwEmsArnD4a1fpzuNvbmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwbwUdtPlERxlQ/CivmkzJ4w0zymhJ1RLraggF/juzrz0JV7DD
	UNe1eP5Sq2vumOO0Ag0aKiiIxKeCHPOH5FKSyCJdzQscaQTYNuWnCgzpIR1ARS4=
X-Gm-Gg: ASbGnctHGpVtYaXDxNgPt0hz3eslxR3bGAZfpM9VV+8bgGL+YS9vYB2jaZ8wIKsBuip
	km2CEqpmCgCwPZwQhHhJYoixUVFPXwFS99GYpMxm85x4F0XVcLFDaNkhifhhs+DG2fWDuRYrqsX
	yCIhNl/Wkq9kBWklh+J0teFN6ZtkgigbCvMj4rDXu2hLbOZGruvhhCa5Yqw6eAkyOBc47864Lmm
	PeUmtYgB8eQ1dU39UhL0w77c/gMV/e/D5n2oj4dDwk5Q8DfYExtTGMFdy3tdfpr/l/ezc45rnHi
	LxnfbVSQ2QhDXF8etK4He+HC2uSUcfv5b+Qa8R7Sln6X
X-Google-Smtp-Source: AGHT+IHeaRN9PDguwxNaRUx8e7RlNc1zAJ+FhIwOOoRUyKrjzbduxhH7kD38+VAVbJRFlGbFeDbwlw==
X-Received: by 2002:a05:6512:3a83:b0:53e:362e:ed3 with SMTP id 2adb3069b0e04-542845aed9emr6667187e87.1.1736874447229;
        Tue, 14 Jan 2025 09:07:27 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec073esm1769027e87.194.2025.01.14.09.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 09:07:26 -0800 (PST)
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Date: Tue, 14 Jan 2025 19:00:39 +0300
In-reply-to: <20250103152326.GP554@pendragon.ideasonboard.com>
Message-ID: <87bjw9s4s3.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Laurent,

On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
>> Currently, the rkisp1 driver always uses coherent DMA allocations for
>> video capture buffers. However, on some platforms, using non-coherent
>> buffers can improve performance, especially when CPU processing of
>> MMAP'ed video buffers is required.
>>
>> For example, on the Rockchip RK3399 running at maximum CPU frequency,
>> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
>> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
>> non-coherent DMA allocation. CPU usage also decreases accordingly.
>
> What's the time taken by the cache management operations ?

Sorry for the late reply, your question turned out a little more
interesting than I expected initially. :)

When capturing using Yavta with MMAP buffers under the conditions mentioned
in the commit message, ftrace gives 437.6 +- 1.1 us for
dma_sync_sgtable_for_cpu and 409 +- 14 us for
dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
buffers in this case is more CPU-efficient even when considering cache
management overhead.

When trying to do the same measurements with libcamera, I failed. In a
typical libcamera use case when MMAP buffers are allocated from a
device, exported as dmabufs and then used for capture on the same device
with DMABUF memory type, cache management in kernel is skipped [1]
[2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
DMA_BUF_IOCTL_SYNC from userspace does not work either.

So it looks like to make this change really useful, the above issue of
cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
solved. I'm not an expert in this area, so any advice is kindly welcome. :)

[1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
[2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
[3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426

--
Best regards,
Mikhail Rudenko

