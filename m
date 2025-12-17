Return-Path: <linux-media+bounces-48975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C81CC6FDF
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 11:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CB6E3064530
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 10:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7DD33B972;
	Wed, 17 Dec 2025 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFMrcey0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B3F29993F;
	Wed, 17 Dec 2025 10:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965748; cv=none; b=s9TwJDeCBOY7tUR+usiRBVyNDlv9AX7YOGuSJK2arKsAN7EZyPmJMtxZi4arD2FQy7taTIf/PpFKJZWAVTYhgDmvOiLQfHww4iNmYyIT7gKn+Z3u+8z8eDO2rnHySdzXz0xPdBZfcWsQA9p5sk8Y0sAm7wj/6840SxQboaEybIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965748; c=relaxed/simple;
	bh=GksqRs+EV2oxVYACwteTBnh53I9GEbtIMXaSqpU0MbE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bdUzCNjNRx7piGhGN++DGQhmAsTjllU2TZ/5mMfP1rFm36OFhyDm7RgT7ReBSXSNVMmXvGX9vKJItNf10ZguxHrwg/NHuU5+b+89b8RaSGohORiasLntQFtzYWvy5T/pFlYjDmN6B/Q3+UoJjjIOnYqVfTkYFFEEGDDAa/d6x9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFMrcey0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA3CC4CEF5;
	Wed, 17 Dec 2025 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765965748;
	bh=GksqRs+EV2oxVYACwteTBnh53I9GEbtIMXaSqpU0MbE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=sFMrcey05coKGhegXKDQqlvNcx20HZHkotczfTrGUBjB9IyyjaC7yjCEuB9+TpEzI
	 wwhsmU4D5umHmWUqKXU+wqAUwg1Yo+5wljNYRhlodBflxBeTPOXxEFDVrcdRCB7yD2
	 wtSBXvglqJRpPVmN6QeW3lVo5kaFsSRRZ5e9kSFC8Bv2LZfsZ8fiYbYgzHh9ueYITx
	 Kxtq1lMFUwMVf9l6EKXZadbkXKQuiqPvN00qvDK6kzgT2uFZv9rNKFwTsKgpR0x/HX
	 gvH7ABSxaMoMe8PtuGhfNY/lpfHILvAPrhpl8s7R2VxbxuN0B81c1KnEqBN9hGuCY9
	 KFTxXIwE7fAbg==
Message-ID: <221d3f70-b418-4f89-b352-773c544ed428@kernel.org>
Date: Wed, 17 Dec 2025 11:02:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v1] media: videobuf2: Allow applications customize data
 offsets of capture buffers
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hirokazu Honda <hiroh@chromium.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
 <dd22c40e-1200-42f7-8c48-63534f759045@chromium.org>
 <5d367bbb-551f-4164-8473-a6c4b68793c0@kernel.org>
 <CAO5uPHPKLxySgwWUi6w0Nm-PbDSPkN=OySbLK8wNKwXdp3p1Rg@mail.gmail.com>
 <e265d412260226be67df3bfb0dd05bb74e36d551.camel@ndufresne.ca>
Content-Language: en-US, nl
In-Reply-To: <e265d412260226be67df3bfb0dd05bb74e36d551.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/12/2025 21:56, Nicolas Dufresne wrote:
> Hi Hirokazu, Hans,
> 
> Le vendredi 12 décembre 2025 à 15:15 -0800, Hirokazu Honda a écrit :
>> Thanks Hans for your quick response.
>> And I apologize for my late reply.
>>
>>> So that's were I am: I'm not opposed to supporting this feature, but I
>>> feel that struct v4l2_buffer has reached end-of-life, and that it is
>>> time for a modern replacement.
>>
>> I got it.
>> I will discuss in my team if I can contribute to v4l2_buffer_ext work
>> or sponsor that work next year or in 2027.
> 
> I share Hans feeling in regard to trying to force partial support for
> data_offset into some space left of v4l2_buffer. This brought me thinking that
> doing that, or even v4l2_buffer_ext as last proposed was not the right solution
> to modernize the old V4L2 framework. In fact, I believe that v4l2_buffer_ext
> would simply replicate the MPLANE disaster, leaving another permanent scar in
> the API. Just to state simply, MPLANE have lead to duplication of every multi-
> plane pixel formats, solving some plane alignment issue in multi-allocation
> cases, but leaving behind the common single allocation case.
> 
> For me, the most central issue in V4L2 is that the memory allocation/importation
> is bound to the operation queues. That brings all sort of issues such 
> 
> - We can't queue twice the same frame
> - We can't mix external buffer with device allocated buffer
> - All buffers must have the exact same stride

The three limitations above are all technically possible to implement with the
current vb2 framework/streaming uAPI, it's just that nobody was ever motivated
enough to add support for it.

> - Application is responsible for caching which memory goes to which v4l2_buffer

True, but is this really a big deal?

> - Attempting to import a buffer requires a free spot in the queue

True.

> 
> This adds on top of the v4l2_buffer structure limitation we have been targeting
> so far. With the growth of modern standard API (think Vulkan Video notably), it
> becomes apparent that the model is too inflexible. This inability to separate
> memory allocation and importation from operations creates a lot of complexity in
> user-space, leading to complicated bugs.
> 
> I've been quite about it, since until now I didn't have a solution in mind, but
> I recently come with some ideas. I'll will try develop these ideas, at least in
> prose for now and come up with an RFC, hopefully somewhere beginning of January
> 2026. That my proposal is accepted or not isn't quite relevant. But hopefully it
> will be a starter to go go beyond just fixing what we see. In fact, this next
> step is for me doing to be quite decisive if I continue doing codecs in V4L2 or
> not in the long run. But I'm sure this is not just about video codecs.

I'm looking forward to your RFC!

What is important for me is that whatever we come up with, it is something that
existing drivers can easily support. A new streaming/buffer allocation uAPI that
can only be supported by new drivers will need very, very good reasons for it to
be accepted.

The nice thing about the v4l2_buffer_ext proposal was that it can easily be
supported by all drivers.

From a technical perspective both struct v4l2_buffer and struct v4l2_format have
reached end-of-life: they are full of historical cruft, they are inefficient, the
32-bit/time32 compatibility code is awful and hard to maintain.

Regards,

	Hans

> 
> regards,
> Nicolas


