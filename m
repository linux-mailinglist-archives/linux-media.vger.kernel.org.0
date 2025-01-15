Return-Path: <linux-media+bounces-24780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7F4A124B8
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 14:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 423B73A2858
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 13:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B562419F8;
	Wed, 15 Jan 2025 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfjngdLv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32859241A11;
	Wed, 15 Jan 2025 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736947817; cv=none; b=cFPeoOyeWvWt13YQsjY7Dt6uJKjOyArRE6t1HiNbbuRBMCRPvM3LSHN7eJHD/OK/lKfMPbX4VMXjzfq2MO1Sm/U7m/8e2XLev4gc+fvmoQ2ul7fGsQWKJt8uVamI2VOZdFek5cWEhbFcuUOMv4vlZ0Tj4gLrx+Ly7cgIDr6DrVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736947817; c=relaxed/simple;
	bh=7Se+wWjKIJoaEi2lwJRboAVHWUDI/GKAKI+okl83Jtg=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=Hkdd8EckPYwDmkcEo5ChxyOeG0F0mjVnmddce8/DhyyOS1v/FN7Q8Xh77hye/QmaOGFUbFJfaHor6xj1LIrwWkwRPsUHct7ugAQIjeYsKC9ALIpmp0/h8obWXuZW2FMKvlY8igCBiL0gEYOpCZfgNDr4WYHTT2RnfSBjAz7AodE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfjngdLv; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-540215984f0so7395745e87.1;
        Wed, 15 Jan 2025 05:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736947812; x=1737552612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Se+wWjKIJoaEi2lwJRboAVHWUDI/GKAKI+okl83Jtg=;
        b=NfjngdLv2XJTSKg6T9oay+xB7++sZ3GTuEuTzgKI8C0/4lOFQ6uBqpLZUYKj1ZAwXt
         Kefm2+pXzRvN2JJHoWPOPzq+1S60Jyk5392g+kScqkPsqomay+XO6fDlk7USHinnuz5K
         /tYr1p51wm4Ch0rRJ702YQwCWmuSsL7vV//9+KwwnXiSwy/25bKnYiaIGoKv5RKXCUW8
         bwZnQJkjXqOggqpB95MBr+SenVmDjjsoEk3vW800U58j9BwejnD17MxfbTq49UipvTkt
         4bEji0l2vjzxfm2hItcIo3PJpf8jqvGo7BNkk+XRkI+myZYZN2lllmRTIjBwFAv6Z1hA
         Ei3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736947812; x=1737552612;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Se+wWjKIJoaEi2lwJRboAVHWUDI/GKAKI+okl83Jtg=;
        b=WFyFyRfr2o6aOwAfQ//rQNVBMvL4ZDX4q2JMbVRlf10yf5/1zOZZtBl7uJK+mL5cil
         2+3sR6jQyhyWDfmiFA3+DFXuNd+Jc8fBv5XdcTAiDjiXnXf/ILVP3X5In41DDuK7f/e3
         5tRTQKyxNhvne5Sucl2iwnbQY7l8H2mvOURPE97vMueKf5IOrt92NrS+tlGPyflYvDpd
         1ZFZfneg/7R8wjc1yM1gRKpQv8fgEvfdudJME/8KdAIUg97aCarxTwnN1w8l7O3bwU9R
         iaC2xmFVUEPgv01GFNZatMliqgc7TRZfDe2Md9s/BYfK4sDtP4qWBVyTu0pZf2ZtUHq8
         XZYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAzevrfumb72s1gwmJJ0zDPFdlDQjwjq77j9+m5SRgiJctIOJRYFUz/asFv0oFb3wR7Jm+Ngrw0tg/LmM=@vger.kernel.org, AJvYcCVmrCLOy92dranXIt6jS4I1Xe0xQ+qwZFTsLA5PxB7XqS7Mcw4UXPVb4HSsOlBtAgR+w0bj0co9HoXzv60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrk7luuDBZ4jhyNro5cgNXxzlFqGgW+IQH3hLO4TUcbidn9uxU
	ow0k+ZLBx8aPYBiRXYuSB4kxGnE81zuw9E+0TE7IDr4k1izIc1T9pg97jMSe
X-Gm-Gg: ASbGncvezWWkiPKbr936RbNmTX4aui0PtsIk9LK2ZB0lcv0bhNUjO5PRRpMmiATyjpu
	2Mvs/UvVzud5lUndqUvx+4DT4qo6YO+6nph8xuRIRdxlKOwKXkC2hKQrvcMiYRnlAfxqQlWKTt6
	tqH1HZwGlzpCxZQ1LclWSZb46vTf/vj3RfEI7vcKFpMWEx40+JucXMn+Aok4s/rjLbBHNLJGdP/
	4Nhi34Z5mewVs/0/zlN44F5+5OVw4UGsdZEvQlmruMynQYyx6wREo1atndguwd6oaxvMq2MYr0R
	Qf4kjPzg8qLQkVhDgm8ZkhXeaYS3yOUMVc0WoPRd19o8
X-Google-Smtp-Source: AGHT+IE9z+a9dcE8SStrZJMI4+H/Sxq/mNyV61u5lE4XZzuS1iMzAADr7X2mm8/UuZWGBbfmqP84Bg==
X-Received: by 2002:a05:6512:3da9:b0:53f:f074:801c with SMTP id 2adb3069b0e04-54284815c7dmr10284744e87.41.1736947811750;
        Wed, 15 Jan 2025 05:30:11 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49df1sm1994330e87.57.2025.01.15.05.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:30:11 -0800 (PST)
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
 <87bjw9s4s3.fsf@gmail.com>
 <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld
 <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Date: Wed, 15 Jan 2025 16:24:36 +0300
In-reply-to: <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com>
Message-ID: <877c6wryqn.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Tomasz,

On 2025-01-15 at 17:31 +09, Tomasz Figa <tfiga@chromium.org> wrote:

> Hi Mikhail and Laurent,
>
> On Wed, Jan 15, 2025 at 2:07=E2=80=AFAM Mikhail Rudenko <mike.rudenko@gma=
il.com> wrote:
>>
>>
>> Hi Laurent,
>>
>> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonbo=
ard.com> wrote:
>>
>> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
>> >> Currently, the rkisp1 driver always uses coherent DMA allocations for
>> >> video capture buffers. However, on some platforms, using non-coherent
>> >> buffers can improve performance, especially when CPU processing of
>> >> MMAP'ed video buffers is required.
>> >>
>> >> For example, on the Rockchip RK3399 running at maximum CPU frequency,
>> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
>> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
>> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
>> >
>> > What's the time taken by the cache management operations ?
>>
>> Sorry for the late reply, your question turned out a little more
>> interesting than I expected initially. :)
>>
>> When capturing using Yavta with MMAP buffers under the conditions mentio=
ned
>> in the commit message, ftrace gives 437.6 +- 1.1 us for
>> dma_sync_sgtable_for_cpu and 409 +- 14 us for
>> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
>> buffers in this case is more CPU-efficient even when considering cache
>> management overhead.
>>
>> When trying to do the same measurements with libcamera, I failed. In a
>> typical libcamera use case when MMAP buffers are allocated from a
>> device, exported as dmabufs and then used for capture on the same device
>> with DMABUF memory type, cache management in kernel is skipped [1]
>> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
>> DMA_BUF_IOCTL_SYNC from userspace does not work either.
>
> Oops, so I believe this is a bug. When an MMAP buffer is allocated in
> the non-coherent mode, those ops should perform proper cache
> maintenance.

Thanks for pointing this out!

> Let me send a patch to fix this in a couple of days unless someone
> does it earlier.

Now that we know that this is a bug, not an API misuse from my side, I
can fix this myself and send a v2. Would this be okay for you?

> Best regards,
> Tomasz
>
>>
>> So it looks like to make this change really useful, the above issue of
>> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
>> solved. I'm not an expert in this area, so any advice is kindly welcome.=
 :)
>>
>> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf=
2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
>> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf=
2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
>> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf=
2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>>
>> --
>> Best regards,
>> Mikhail Rudenko
>>


--
Best regards,
Mikhail Rudenko

