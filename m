Return-Path: <linux-media+bounces-30196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B884A88CE8
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 22:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7F317A8F17
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 20:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD6D1D79A0;
	Mon, 14 Apr 2025 20:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rdxPbLcW"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C702DFA22;
	Mon, 14 Apr 2025 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744661648; cv=none; b=IDkddC2HADkSRHfBarOhCOURcQTMPJS/F+9pIPeRNk/J+MuDKLaTfdUg8019E1jNgQVeKoq1chB0wGZ2Q5MZZdsjJgJ5rT0bOT69T60lwbRWYsOHx2T41uGg0aNhdmzbSJPXhm6V+Y01MezyPlkMkTKVmhbU8d1gQHeM5zUSLcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744661648; c=relaxed/simple;
	bh=noaVMCDz4lZ4IZqYld8mmTRprEHBuk+qqeU/R2k7iHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FesTnI9CNDhX9ub25nzxHXiFNyumjAi3F/CdnaPWpjQcbR6Ll5jZXzzRJhDATYR/x6n9gymgQoM5L373ctMBF+ROaOk/GMx2XP9QH9J4sPG6xYX+T97d6v1cn0aJ1hY7CH7gAi3/ClV5o494wjmZBNUiLqjD7JDUrr5t3TFR43g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rdxPbLcW; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EKDr7M2255205
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 15:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744661633;
	bh=u4s325uvuTrWBpavXWq6UQUmHw42JVkD/r2Zx8Uy0G4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rdxPbLcWyTDIJ9phfExl7sbHI2mZmInXxPpoGj/wFsJkGVlvtRGloTMdtZxIBXrED
	 7TELmyo9rNl8zsOJZBDwZhvqEeu0SIJRVV9jNqOvbbk9PLU9jZeuGLrJIyw5ATrZyM
	 KOFq5+UyrUBsVdrOplbysZE/EGNZ9W6GdmLbrMMQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EKDrWo107347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 15:13:53 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 15:13:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 15:13:53 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EKDqaS030321;
	Mon, 14 Apr 2025 15:13:52 -0500
Message-ID: <4c77a566-d231-43f2-ada6-a81ec6b58237@ti.com>
Date: Mon, 14 Apr 2025 15:13:52 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Christoph Hellwig <hch@infradead.org>,
        Bastien Curutchet
	<bastien.curutchet@bootlin.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <Z_yjNgY3dVnA5OVz@infradead.org> <20250414102455.03331c0f@windsurf>
 <Z_zwZYBO5Txz6lDF@infradead.org> <20250414134831.20b04c77@windsurf>
 <8f55367e-45c0-4280-b1ed-7ce9160c1fad@ti.com>
 <20250414212125.4b3e6f33@windsurf>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250414212125.4b3e6f33@windsurf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/14/25 2:21 PM, Thomas Petazzoni wrote:
> Hello Andrew,
> 
> On Mon, 14 Apr 2025 12:08:44 -0500
> Andrew Davis <afd@ti.com> wrote:
> 
>> "UIO is a broken legacy mess, so let's add more broken things
>> to it as broken + broken => still broken, so no harm done", am I
>> getting that right?
> 
> Who says UIO is a "broken legacy mess"? Only you says so. I don't see
> any indication anywhere in the kernel tree suggesting that UIO is
> considered a broken legacy mess.
> 

I'm not saying that*, I'm pointing out your argument is that even
though what you are trying to do is broken and unsafe, it is okay to
do because it isn't any "more "broken and unsafe" than UIO already is."

*It is, but that is an argument to have outside of this thread :)

> Keep in mind that when you're running code as root, you can load a
> kernel module, which can do anything on the system security-wise. So
> letting UIO expose MMIO registers of devices to userspace applications
> running as root is not any worse than that.
> 

You can take your computer out back and shoot it too, but we shouldn't
encourage that either :) According to the original docs, UIO was created
to support "industrial I/O cards", think old one-off custom ISA cards by
vendors that had no intention of ever writing a proper driver and just
wanted to poke registers and wait on an IRQ.

IMHO we shouldn't be encouraging that, and trying to modernize UIO does just
that. It gives the impression that is how drivers should still be written.
If you setup your FPGA card to go blink an LED, sure UIO driver it is,
anything more complex, then writing a proper driver is the way to go.

>> If your FPGA IP can do DMA then you should not be using UIO in
>> the first place, see UIO docs:
>>
>>> Please note that UIO is not an universal driver interface. Devices that
>>> are already handled well by other kernel subsystems (like networking or
>>> serial or USB) are no candidates for an UIO driver.
>>
>> The DMA subsystem already handles DMA devices, so write a DMA driver.
> 
> My FPGA IP block is not a DMA controller that would fit the dmaengine
> kernel subsystem. It's a weird custom device that doesn't fit in any
> existing subsystem, and that happens to do "peripheral DMA" (i.e the IP
> block is DMA-capable itself, without relying on a separate DMA
> controller). So this (very valid) recommendation from the UIO
> documentation doesn't apply to my device.

Peripheral DMA is the much more common case, nothing new here. Could
you give a hint as to what this device does that doesn't fit *any*
current subsystem? Or are we talking a hypothetical device (which
for the sake of argument is a valid thing to say, I'm sure with an
FPGA card I could make something that doesn't fit any current
framework too). Just want to know if you are trying to solve a
specific issue or a generic issue here.

Andrew

> 
> Best regards,
> 
> Thomas

