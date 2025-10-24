Return-Path: <linux-media+bounces-45531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3989DC06B9F
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 16:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2BD564EE7E2
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54240315D31;
	Fri, 24 Oct 2025 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQPRiweH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB294246793;
	Fri, 24 Oct 2025 14:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761316600; cv=none; b=B7/PsPZQ8Ojqx/ectXbO30+i8M+QgeR90v6CFpWsbyMJ/UD4PYmuwqPJk1BJWZ8YdFiFSEvQ8hD6NjeCv48C/VlUkC6wYUxqbLSVQS06aoTWlysiL0eAbRw/w273inqcFf5VCraiq6eUJd+30UkZFB/U3ukOLw58PshihVH5inM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761316600; c=relaxed/simple;
	bh=dAwvJ61kT4ula3oy4h+pw30yXKe3R4m8XcTn2QIYR2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWjQBtxQOXUGVImmcE/b1SV7O5kZCVmNN4MInHmTDnwwJmBYSSTYG0Sz6J+BvW+lsUppR6LdjBZ2dYq3BUoMUSNaw51Ag/fiySmEQfdXIYHoBnJGgXUgnoJsvGU2PB3Yi2D4iC+KqMRgeawaC2r+PX4macq5dWZHKFngYMp/ay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQPRiweH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824E8C4CEF1;
	Fri, 24 Oct 2025 14:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761316600;
	bh=dAwvJ61kT4ula3oy4h+pw30yXKe3R4m8XcTn2QIYR2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oQPRiweHpKRyJbHzsmtAwsmNfIaHfkRpKJtEXZz+CXgwOLVOtSqEyPTBV/3VoUNIe
	 FsiKBDyhc9M3WcN6ee4V3Mpolo0Svns4Uh5n+ExMZesdvcYiFpcK3MrtQYTHMGzJXw
	 ZbK7LgT96X6duFHadhaDh2UPlhNML0H3xIaOZDuSLAPPVRmfxF6yxeLzoQ95T5fN3n
	 l4pvZO5qFfMXgiI66yUg/A7vJzIvMvaWy7i3RijjpVBvf4OP/ukanhCHqyzQEe9mxe
	 HAlDXOEgKB4thbP5M/wSGYBLbqD5z8NEbXhml/8GbRWujB6I3I1MUYsS0vQzElZFcg
	 mmu3zNuRkYyBQ==
Message-ID: <02b7cdce-95fe-475f-a346-b41fd5615695@kernel.org>
Date: Fri, 24 Oct 2025 16:36:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
 <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
 <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
 <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
 <8cba66d2-9608-4a5c-a2af-6cc91f46a49f@kernel.org>
 <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
 <b21ba8b4-a31f-44e5-a2da-ba585a93d3a6@kernel.org>
 <66f066b0-a8bb-40b2-bdd8-7cbcf114cde1@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <66f066b0-a8bb-40b2-bdd8-7cbcf114cde1@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/25 4:28 PM, Tvrtko Ursulin wrote:
> On 24/10/2025 15:17, Danilo Krummrich wrote:
>> On 10/24/25 3:37 PM, Tvrtko Ursulin wrote:
>>> How about "unknown-driver", would that satisfy you?
>>
>> Honestly, the most accurate thing to say would be "fence-signaled", because
>> that's the actual condition which causes the change.
> Hm, ->get_driver_name() returning "fence-signaled" is not great, and debugfs
> output in the form of "kernel fence: fence-signaled timeline-signaled seq 1234
> signaled" feels a bit redundant. :shrug:

Indeed, what about "retired-driver"? Still implying that it's not just unknown,
but that some process has finished. But without the ambiguity of "detached-driver".

