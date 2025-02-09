Return-Path: <linux-media+bounces-25845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC55A2DD32
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 12:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29364163300
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 11:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C181D61B5;
	Sun,  9 Feb 2025 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDUUplSm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF3243399;
	Sun,  9 Feb 2025 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739102191; cv=none; b=h8Z6uh5MxlDJi7oMW+csYV/ltxs42xYza2TsNksirwiuhVR713DCjeavT7UUFb1NaTLW5pfYmD1zleptZYlAw2ZpUibdbOukU2MjjqMg9C+BiCmR4a8wsGyuICE7jTA/PQ/PXQz0Wb8/5bIHZWH25BOeSZoGEIDjwd0sZadXl0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739102191; c=relaxed/simple;
	bh=Lz2w10qZ/7qf0GBvDV0ucsndxbEDejIrSm5OdLohrlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/RQc84DWNA6Eo9Q5k0p/g9cupXwNMVDzfbqijwvQ9nnZrkqiB7syLPZI6Bp5/sr5jm8sYJRFEEqaVypNTM8Av6zcBSktnI22TKq2Z5ng7O4MUmnpdUD5Wt8mp+ENF/qF/woHiChJt4h4IL3NbmtgjOzDibMwJdL0fareND0ZdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDUUplSm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBB8C4CEDD;
	Sun,  9 Feb 2025 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739102191;
	bh=Lz2w10qZ/7qf0GBvDV0ucsndxbEDejIrSm5OdLohrlc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FDUUplSm71iSeiNoCP8kgKWfH/FV7hnL/Pb6Ql0ehJB7KzeA4JJiYvqfe+AbgZyRO
	 p1NSbOUnNhOyiI81Qel+HotJUgFLt99w4fXpRJv+Fr4PO1AKn5ZdwfXVGWg5IIh/eS
	 jVUXvVzqiQdO1T/qSpllafTpUzMny3do/xNGzlFwlBsDOthdimAXo6YI8f48wODIdL
	 UgGufOquMx/cMto6ke6VChFxg1TQhJXUsdGPoW+iyxblOcl3HoGZkw2Cao6YYpE5/A
	 0oppnFn6xYT4HbhZ3HVjkmb1wqK3zBtlAzcbSBrxVVb8DHKghT7nXEaBVm/5kC829x
	 fVAfOPTKwQVgw==
Message-ID: <922691a1-10d0-4ff1-a174-a456235e6487@kernel.org>
Date: Sun, 9 Feb 2025 12:56:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] dt-bindings: gpu: Add protected heap name to Mali
 Valhall CSF binding
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Florent Tomasin <florent.tomasin@arm.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nd@arm.com, Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <36b57dcf20860398ba83985e1c5b6f6958d08ba7.1738228114.git.florent.tomasin@arm.com>
 <7234f25c-a2aa-4834-931b-aeeb7a49dfa7@kernel.org>
 <4b9deab1-e330-4c93-8260-75276c2bc9ff@arm.com>
 <c0aad911-ecc4-4b04-a453-6da226f76ed2@kernel.org>
 <5e0e2fbb22c2ffb0c5281727cd95d70f5f5ba696.camel@ndufresne.ca>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5e0e2fbb22c2ffb0c5281727cd95d70f5f5ba696.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/02/2025 22:21, Nicolas Dufresne wrote:
> Le mercredi 05 février 2025 à 10:13 +0100, Krzysztof Kozlowski a écrit :
>> On 03/02/2025 16:31, Florent Tomasin wrote:
>>> Hi Krzysztof
>>>
>>> On 30/01/2025 13:25, Krzysztof Kozlowski wrote:
>>>> On 30/01/2025 14:08, Florent Tomasin wrote:
>>>>> Allow mali-valhall-csf driver to retrieve a protected
>>>>> heap at probe time by passing the name of the heap
>>>>> as attribute to the device tree GPU node.
>>>>
>>>> Please wrap commit message according to Linux coding style / submission
>>>> process (neither too early nor over the limit):
>>>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>> Apologies, I think I made quite few other mistakes in the style of the
>>> patches I sent. I will work on improving this aspect, appreciated
>>>
>>>> Why this cannot be passed by phandle, just like all reserved regions?
>>>>
>>>> From where do you take these protected heaps? Firmware? This would
>>>> explain why no relation is here (no probe ordering, no device links,
>>>> nothing connecting separate devices).
>>>
>>> The protected heap is generaly obtained from a firmware (TEE) and could
>>> sometimes be a carved-out memory with restricted access.
>>
>> Which is a reserved memory, isn't it?
>>
>>>
>>> The Panthor CSF kernel driver does not own or manage the protected heap
>>> and is instead a consumer of it (assuming the heap is made available by
>>> the system integrator).
>>>
>>> I initially used a phandle, but then I realised it would introduce a new
>>> API to share the heap across kernel driver. In addition I found this
>>> patch series:
>>> -
>>> https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t
>>>
>>> which introduces a DMA Heap API to the rest of the kernel to find a
>>> heap by name:
>>> - dma_heap_find()
>>>
>>> I then decided to follow that approach to help isolate the heap
>>> management from the GPU driver code. In the Panthor driver, if the
>>> heap is not found at probe time, the driver will defer the probe until
>>> the exporter made it available.
>>
>>
>> I don't talk here really about the driver but even above mediatek
>> patchset uses reserved memory bindings.
>>
>> You explained some things about driver yet you did not answer the
>> question. This looks like reserved memory. If it does not, bring
>> arguments why this binding cannot be a reserved memory, why hardware is
>> not a carve out memory.
> 
> I think the point is that from the Mali GPU view, the memory does not need to be
> within the range the Linux Kernel actually see, even though current integration


Do I get it right:
Memory can be outside of kernel address range but you put it to the
bindings as reserved memory? If yes, then I still do not understand why
DT should keep that information. Basically, you can choose whatever
memory is there, because it anyway won't interfere with Linux, right?
Linux does not have any reasonable way to access it.

It might interfere with firmware or other processors, but then it's the
job of firmware which has discoverable interfaces for this.

The binding says it is about protected heap name, but it explains
nothing what is that protected heap. You pass it to some firmware as
string? Does not look like, rather looks like Linux thingy, but this
again is neither explained in commit msg nor actually correct: Linux
thingies do not belong to DT.

> have that. From Mali GPU driver stand point (or codec drivers and what's not),
> the memory range is not useful to allocate protected/restricted memory. On top
> of which, its not reserved specifically for the Mali GPU.
> 
> What's your practical suggestion here ? Introduce dma_heap_find_by_region() ?

I did not comment about driver and I do not judge how you access
whatever you need to access. This is discussion purely about binding
thus about hardware.


Best regards,
Krzysztof

