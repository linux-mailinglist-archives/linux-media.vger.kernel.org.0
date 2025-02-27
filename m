Return-Path: <linux-media+bounces-27176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3702A48A25
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 21:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75ED3188A706
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 20:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B476E270EBE;
	Thu, 27 Feb 2025 20:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iH/rmYF+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B89E1AF0C9;
	Thu, 27 Feb 2025 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740689542; cv=none; b=QxHxPghbSuJa5BkkGBEC/OgIcCvh3Npjf13oYsleY/ezowxJJvdQgmYZGULmh9RTl21yI+5ySbj8zSy6ra4NgvJaTFCO6hj6Ru265y9OPMILi8/QEdIQ7ikElk9Fw5pvHhGyM2QsJ4+1KohOLnVDTaS1KlV+pvPWyQPSb2rJbpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740689542; c=relaxed/simple;
	bh=ORq9jkRCIXj2zv20dBQ5aH6mM2s+q06FC9H+4PepyX8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=o/6doeCbIlZDLjU7IA1+QtXSrP7ENCmC4KACIcqmuoYLG+UKQppv+xc/i2CzryFMfZ3fMEHcHUGcbXz24XVVN2vT3OxMzuTObsVSZDN20dzEZMHcwF5Ba8IiSRTgc4HhOWjxchrYtbgtJV4P+zMuFHeUGhSEylAAjxOmmTr5KaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iH/rmYF+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5462ea9691cso1463773e87.2;
        Thu, 27 Feb 2025 12:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740689538; x=1741294338; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ORq9jkRCIXj2zv20dBQ5aH6mM2s+q06FC9H+4PepyX8=;
        b=iH/rmYF+N1Ce40sC3cTx+/BTIxYtlDCXWfCnPxpykQTeYRtOMju8QzRKDJv7eW6acQ
         sCUm/i9up3s21QBtlfSRmwJ3dGUitnsFH0KcpJbcWTopYb5rl4Cg7g70YDmFt9Mi1tsu
         iEEcvyRiXTluvIfmBXcadc4sAI8ScBXPxBWQJLVMC+nBsDTJ2Fa7Ny/g0mfM3PScsrIc
         lIoDa1NdJho2QZyHMhQC43omg/p0J0vpmcxuXqby/nuOM94vTxg4x2S/M5ZNQDD5pR3P
         8eCpcRpBbwzsebP7Ac9zRwHgtcOzBxvBlJNG1c0RCHiHlrXc/W0Cfk2ExLF+FirXITv1
         lkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740689538; x=1741294338;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORq9jkRCIXj2zv20dBQ5aH6mM2s+q06FC9H+4PepyX8=;
        b=BJNPapwot9In/aMiwNbQBddC9FxVtfew/1CeRAFTwJe4lncjfHNo8+5kUTQ6ZGIq0v
         gy/FSXvU7CMxbWDqLmTz9a0/83UM8Is2HOKOlvVHw0dBn81OveKvLiY9Wnfe5RtmwOao
         0RF6VTY/c8iqnsAUQf3468QWt++d+cdD6bzlAxcSw7AGZzlvSc9K2NEb35+bUmbL+58e
         uyImH5tBzQPk3iQ9jKaiVQpi3X3fQqJLLCVkiq0I2/ZrxqiicOmqw0+2IMv57X/Nmuhu
         bikvY3o3MEKNiKOXsoUWSxAAMdZnNg3H8SHIiNpTka9OzhOVEwB1Tg5f7dtukEpw9LE1
         6xvg==
X-Forwarded-Encrypted: i=1; AJvYcCUmWly6/i0s90jAeT88ocY3St1GMIixwEStysGu7X9QR8QyaaOeadw7wfxitsNiEzZVM7H7m4oLy86CQYo=@vger.kernel.org, AJvYcCWnlHcT4Oexa3lmgn4L2BsseJ7LtTCAyHj08kRv3kIugJ4reOG4p4mqJOMmB/ufUCtmWsc/o9hNWFFReV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw15KGDCB+T+YVioY8K87I25t3eYOSPGw0638qNGdk6489gOcF6
	LVVpe4oSLdTIT41/n8zU6lEDvZiVDlsDqRNXl8fNdqP+hqXNq/iGsidga51a
X-Gm-Gg: ASbGncuzwIeATVOUvChGvcIiYqgX42qAsM4pkNBemOtcsirBr4SCKkMr/A9SNHcQSEg
	s4Elq9LVyJ/U0T32JxYeqfV0nvcEwvLbemzr6hF+vWGmMxC3haFwEOEhMbZZt0ynd6/5+sEnlEG
	J9ubJZPUQ+70C7+RGubPNeKOmmAoSrFGkGf+CLgY88pPu+BbDA76ZzAGeZQMt/+fYg56X4r56Ng
	zAK9RrwfEpInFQNjm1tsLhhdpahlG88XYzNgVwsQx0BbszwWZeMTVZMA8PfGsRh+bzal92/Mcg5
	PRHCAUwesMGd
X-Google-Smtp-Source: AGHT+IGihLlnXop/m8uLi6YA+JiEFOKQNSYL2eLkoXrXYoArVJ7ew7FmuX17wQiiXQfECok7M8pYyw==
X-Received: by 2002:ac2:411a:0:b0:549:4e7f:24af with SMTP id 2adb3069b0e04-5494e7f274cmr57045e87.0.1740689537881;
        Thu, 27 Feb 2025 12:52:17 -0800 (PST)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494a149b07sm105767e87.157.2025.02.27.12.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 12:52:17 -0800 (PST)
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
 <87bjw9s4s3.fsf@gmail.com>
 <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld
 <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Date: Thu, 27 Feb 2025 23:46:44 +0300
In-reply-to: <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
Message-ID: <87ldtraz5v.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Jacopo,

On 2025-02-27 at 18:05 +01, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:

> Hi Mikhail
>
> On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
>>
>> Hi Laurent,
>>
>> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
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
>> When capturing using Yavta with MMAP buffers under the conditions mentioned
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
>>
>> So it looks like to make this change really useful, the above issue of
>> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
>> solved. I'm not an expert in this area, so any advice is kindly welcome. :)
>
> It would be shame if we let this discussion drop dead.. cache
> management policies are relevant for performances, specifically for
> cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.
>
>>
>> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
>
> I would like to know from Hans if the decision to disallow cache-hints
> for dmabuf importers is a design choice or is deeply rooted in other
> reasons I might be missing.
>
> I'm asking because the idea is for libcamera to act solely as dma-buf
> importer, the current alloc-export-then-import trick is an helper for
> applications to work around the absence of a system allocator.
>
> If the requirement to disable cache-hints for importers cannot be
> lifted, for libcamera it means we would not be able to use it.

Meanwhile, I have posted a patch, which re-enables cache management ops
for non-coherent dmabufs exported from dma-contig allocator [1]. It is
currently waiting for review.

[1] https://lore.kernel.org/all/20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com/

>
>> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
>> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>>
>> --
>> Best regards,
>> Mikhail Rudenko
>>


--
Best regards,
Mikhail Rudenko

