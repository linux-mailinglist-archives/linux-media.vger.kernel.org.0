Return-Path: <linux-media+bounces-52500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH/1F+/2imkePAAAu9opvQ
	(envelope-from <linux-media+bounces-52500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:14:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EF1118B91
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1D283028EFA
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A9333DEDD;
	Tue, 10 Feb 2026 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="otPM3OWb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D8433CE9D
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714854; cv=none; b=Gl1GBRhWy8PWkPJtHttJ7vkmg2ThfQL2lSFHV6L3oEotQbSIiZBfN9IJEPcPw6Sb9eGNwfDseTUp4X9skDS5MC06N3tRd8oeCleZgSvlLzy1QOtvvkhlWgnaXdBFvsGabaPKm+SjFkdjzrs2z0Gg8a2wz8OY4RQmaG2xfW9hIAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714854; c=relaxed/simple;
	bh=Im/jU7RCioSZNbpD02PdmSL3wnBPuIkU8iFeJeFE1d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2H+JVD2VMUVhEYJQoH2BLCvjnnITI75YVCeLiJjoiKhFAVpQTp5ZL0iFb+aTYv34rmcgLPfa5GjBQhKT0HMXvlIwdZyuzfEIMHEIDCOruzkrRzFDKtMtGrx8pw7nrWscotqpgfEthL0X4fD3gBc/t8RF+gU+biBWzRUvzeRfV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=otPM3OWb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so40929695e9.3
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 01:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770714851; x=1771319651; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1n+Dri69ZtsJrD5f7LTNPULLrK+Vi4bS2T/sVYZliNI=;
        b=otPM3OWbv5A2kIPd8SjMDIKhMpzlyclR2DC9kMTC7KHiolZs5xRObt0T8zvfaUa2kF
         Gqcsint6Nz6cnm+AZzgDh7d52EsCCqmRINknFDYswDUkpiSR/TnhbQNmkRgrtMI7YAnp
         /xVTl7Uh0dXGYBO2FE9YEd6LuGgFTadL86SZ5E7HZtz+sXV2BpeWQAOY75WAW33yf03Q
         5fPA40nazAQp6xY9RblVeUg6d4zLVhccRkoS0FNuGz+T8KaJJOfu8nVfB+zQWoTdkb8G
         SdF+dc0G+WW0qlrW58r4FShNuzP55c1+tqaDHtPHtyI9H6o2hqFlYoXXtc3IhEAn0Xi3
         nesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714851; x=1771319651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1n+Dri69ZtsJrD5f7LTNPULLrK+Vi4bS2T/sVYZliNI=;
        b=V8NXbiBWO4DTrcoSCdn0MfOO+c/I+u8VRXe3YXYRxD5KlKONM2GBCP7e7Gvd1bhaJK
         RWMKj6N63o7l/S94eUIMOwTpziepahpYVb2PqVaUzCnn7K76C41pv4W9O8O4T0JJhU9P
         FOK0+ycBTLZKd/jpD7iPTE80L80D0g2AllHmgA1BRLnYd92plRqVQznXLlPCeX65yk7O
         m0TB3GqSRiOVJUt7It5N4VNaE4ik3B2PzlplMVuWshfZoO33mZpSCOYBYfw7fLAALwuF
         TnS2zUQbCuY375rZ/7tsOpZLrGrcZwereWMG1thpQWJmX8irYjj6/WsZDcwQ9GPFLzgT
         RFQA==
X-Forwarded-Encrypted: i=1; AJvYcCUoJTiF35F9bUtxYqo9J7j/fWhz17KETsFl5BASOOvLXqaItMg4D0ju52Bg0QQDfBZ7flLQD27q9ai7cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV9oH7cSn0dUwY//BxH/R0074blOVQ0VTR41nrRhFfTvR5n5T3
	pnwFoNwWi0B7Y4HatGg0oh+KO0NJQE7j8tpuhLZn139lSt9Kp58oHze0ZLu5B54JY3Y=
X-Gm-Gg: AZuq6aJg9YqdSrF2lCJps74qj5Wx+F7cYqsd2tiZyP2OCtgXvmKrDzf36n/mXNajIQJ
	dU6S9Mvsh+TDLcieECO0RMtE1//02bnOVcG8E/unq/xispCDaus4UCht8Zyhf1VJffRWARwfsCh
	JBhAmmRZYwZMH2p+0WNYRAEiz0ImQmacZbQrchOp8aUJOozasdxbAPEg1nGK9e8Hogs3g0QdwSl
	v9NiYJ09r+b3CVGc0UYQVU8iOMiR9SilSsbq5aCpf0y6EfIcD2mV4wOAhejlU0mPxBInGah0vhP
	XjLPfNBzUgm8CT6EH03qg6rOlDgEVRdxv3++vglRx6E5G02w4dt2GmHRjw5tQBZ1D0dsc0udD6C
	66b+6pzukFutUvZ2cxA3S++ul9n35AyPpUNxnUK42EFL+GrBoKTz3CRSWtNW3lT2uMoT7nG67gc
	HKklDcm9Bg2jKYrDxMP7rGL/222utNtfJLhE4=
X-Received: by 2002:a05:600c:1daa:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-483507f08c6mr21095375e9.14.1770714851014;
        Tue, 10 Feb 2026 01:14:11 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7f1e4fsm61726245e9.15.2026.02.10.01.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:14:10 -0800 (PST)
Date: Tue, 10 Feb 2026 10:14:08 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap
 flags
Message-ID: <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <20260210002927.GC943673@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260210002927.GC943673@ziepe.ca>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52500-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:email,nvidia.com:email,resnulli-us.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1EF1118B91
X-Rspamd-Action: no action

Tue, Feb 10, 2026 at 01:29:27AM +0100, jgg@ziepe.ca wrote:
>On Mon, Feb 09, 2026 at 12:08:03PM -0800, John Stultz wrote:
>> On Mon, Feb 9, 2026 at 7:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
>> >
>> > From: Jiri Pirko <jiri@nvidia.com>
>> >
>> > Currently the flags, which are unused, are validated for all heaps.
>> > Since the follow-up patch introduces a flag valid for only one of the
>> > heaps, allow to specify the valid flags per-heap.
>> 
>> I'm not really in this space anymore, so take my feedback with a grain of salt.
>> 
>> While the heap allocate flags argument is unused, it was intended to
>> be used for generic allocation flags that would apply to all or at
>> least a wide majority of heaps.
>> 
>> It was definitely not added to allow for per-heap or heap specific
>> flags (as this patch tries to utilize it). That was the mess we had
>> with ION driver that we were trying to avoid.
>
>I don't know alot about DMA heaps..
>
>On a CC VM system the shared/private property is universal and applies
>to every physical address. Not every address can dynamically change
>between shared and private, but every address does have a
>shared/private state.
>
>By default userspace process generally run exclusively in private
>memory and there are very few ways for userspace to even access shared
>memory.
>
>From a heaps perspective the API would be very strange, and perhaps
>even security dangerous, if it is returning shared memory to userspace
>without userspace knowing this is happening.
>
>I'd advocate that the right design is for userspace to positively
>signal via this flag that it wants/accepts shared memory and without
>the flag shared memory should never be returned.

We can have the same behaviour with the separate heap, can't we?
Userpace positively signals it wants/accepts the shared memory by
choosing "system_cc_decrypted" heap name.

[...]

