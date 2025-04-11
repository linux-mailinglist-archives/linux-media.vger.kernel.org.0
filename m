Return-Path: <linux-media+bounces-30007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2CA85648
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 10:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 877378C5065
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 08:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F62293B6E;
	Fri, 11 Apr 2025 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YmyTnQxC"
X-Original-To: linux-media@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916211F0982;
	Fri, 11 Apr 2025 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359263; cv=none; b=Ox8U0NwXs/kY1SxYLOnIgN9vn2aHlyZZm6a842BpJfNkkvDQSg2cISwpiaYGZSRjUKJiN9vSyTCHWOns8fOEHdJ8fUrQ0ZsTb3O1w3qVUDYF1eEUxAV6GjSZnMkCtOCDEdLjWwfu56g1E0NttZl4adzOYXVTEY2+CrNfj4QOHs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359263; c=relaxed/simple;
	bh=nLPhOzKf5J1D0ZjOk2I4+vvVxOm3rCKvUhG1XJpGOv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQpmLgAqw/R7Lejc0lw2ndui5huDzge/ZifqH4Q5N4Rzmmcl9wVVOaPh1F/KOqZQfQqVcAJ0f+5Y2LZpaz2r8U9/VKo8C8Zd/r/1WjKnw91SSjlwSz6ZgXeYq4ilfHz2gHZwmec7GCKZcJUpkjQlxtnogU5LfwElhAfSvsvrFmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YmyTnQxC; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34A0643137;
	Fri, 11 Apr 2025 08:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744359258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afHRpr9hNgOZHrTlQnPrI03bZg/5yASgV0Nawh6heQc=;
	b=YmyTnQxClkeT7De9n44GnKxNoLkwFEDh5p45ANDmyAHffwCLFlcg2OyaktuDMLzYA/S1Fp
	q21g1poX5kc5uUl9BSUEgQN0kqnKtm8i3/sMSMYMgR2Do8L6ZvnHyOzaYMIhN8YHB+dxb6
	ZDT5fNrMI01U26DTyL+UUTzmK4ag2nMdRnRlrQifOToA24lNb0W2gXV9DtR3/W5zpjGqrR
	31m2cc+ayXe6CoVgyllDN8TIzP+rPN3C+qCiJeNeETKGXQDyXBGJdhQBQNmF8F7aFhd09E
	K9fl0cPQPjmOJrWI59BEqkjwIa7Vx2hN2yxqu2wamSwkGk8JNNlG6B5wQJCWFQ==
Message-ID: <60e2d844-418a-4bde-b6ef-76d10448d5ec@bootlin.com>
Date: Fri, 11 Apr 2025 10:14:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <09a5beeb-bae3-4a00-9aff-66adf68064e6@amd.com>
 <20250410214307.361e373f@windsurf>
 <b596c9af-c0e3-4557-b45a-462a33179235@amd.com>
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Language: en-US
In-Reply-To: <b596c9af-c0e3-4557-b45a-462a33179235@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepuegrshhtihgvnhcuvehurhhuthgthhgvthcuoegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefffeufeektdeugffgteeiffevgfdvieegueelieekteegfeelkeelheetfeevueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrudegngdpmhgrihhlfhhrohhmpegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopehgrhgvghhkhhesl
 hhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhmqdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi Christian,

On 4/11/25 9:30 AM, Christian König wrote:
> Hi Thomas,
> 
> Am 10.04.25 um 21:43 schrieb Thomas Petazzoni:
>> Hello Christian,
>>
>> Thanks for your feedback!
>>
>> On Thu, 10 Apr 2025 18:29:12 +0200
>> Christian König<christian.koenig@amd.com> wrote:
>>
>>>> Many UIO users performing DMA from their UIO device need to access the
>>>> DMA addresses of the allocated buffers. There are out-of-tree drivers
>>>> that allow to do it but nothing in the mainline.
>>> Well that basically disqualifies this patch set in the first paragraph.
>>>
>>> To justify some kernel change we always need an in kernel user of the
>>> interface, since this is purely for out-of-tree drivers this is a
>>> no-go to begin with.
>> I'm not sure to understand your comment here. This patch series is
>> about extending the UIO interface... which is a user-space interface.
>> So obviously it has no "in-kernel user" because it's meant to be used
>> from user-space. Could you clarify what you meant here?
> 
> Bastien wrote about "out-of-tree drivers" which is something the 
> upstream kernel explicitly does not support.
> 

Sorry maybe it wasn't clear, but what I meant is that the goal of this 
series is to replace 'out-of-tree drivers' with something upstream.

> When you make that UIO API and have an open source userspace driver then 
> that is probably a good justification to do this.
> 
> What the kernel community tries to prevent here is that people start 
> using the UAPI to write closed source drivers in userspace.
> 

>>> What you could potentially do is to create an UIO driver which
>>> imports DMA-bufs, pins them and then provide the DMA addresses to
>>> userspace.
>>>
>>> But please be aware that DMA-fences are fundamentally incompatible
>>> with UIO. So you won't be able to do any form of synchronization
>>> which probably makes the implementation pretty limited.
>> Could you clarify why DMA-fences would be needed here, and for what
>> synchronization?
> 
> In general DMA-buf is an interface which enables you do share device 
> specific buffers between different drivers as well as between userspace 
> processes.
> 
> For this to work with for example cameras, GPUs or RDMA NICs you need to 
> some kind of synchronization primitive, e.g. device A can only starts 
> it's DMA transaction when device B has completed his.
> 
> The problem is that this synchronization approach is fundamentally 
> incompatible with UIO. See here for more details: https:// 
> www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences
>
>> The DMA buffers allocated here are DMA coherent buffers. So the
>> user-space application that uses UIO will allocate such buffers once at
>> application start, retrieve their DMA address, and then program DMA
>> transfers as it sees fit using the memory-mapped registers accessible
>> through UIO. I'm not sure which synchronization you are referring to.
>> We are not "chaining" DMA transfers, with for example a camera
>> interface feeding its DMA buffers to an ISP or something like that. The
>> typical use case here is some IP block in an FPGA that does DMA
>> transfers to transfer data to/from some sort of specialized I/O
>> interface. We get an interrupt when the transfer is done, and we can
>> re-use the buffer for the next transfer.
> 
> Well why do you then want to use DMA-buf in the first place? As far as I 
> know what you describe can perfectly be done with the normal UIO memory 
> management interfaces.
> 
> DMA-buf is only interesting when you actually want to share something in 
> between devices or between applications.
>

I wanted to use DMA-buf because it allows to dynamically 
allocate/release coherent buffers from userspace. UIO doesn't provide 
such interface.
I'm aware that exposing DMA addresses to userspace isn't a good 
practice. That's why this series create a new heap specific to UIO that 
will be the only one implementing the new ioctl.


Best regards,
Bastien




