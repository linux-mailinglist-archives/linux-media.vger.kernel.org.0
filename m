Return-Path: <linux-media+bounces-45524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E8C0689C
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 15:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD0263A9A4F
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E18D31D743;
	Fri, 24 Oct 2025 13:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UYP0YRo3"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F6F305E1F;
	Fri, 24 Oct 2025 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761313086; cv=none; b=tkvDRLc+RP0KAu7WFaYRAYFVr+ZGXNaqd+6/suayzxL7Nnyt0Z4YdAsl3Og1fS3qMnzkujIMvuDnlmTsnZAJEbaohmjV8NgdKjcZmJRCgKr/O9fdoud08pByhcNrP8ouBZ2Bu7kkZOyLCrtNxQNFGI0Fyq+hj/ufPQwtUyGo1Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761313086; c=relaxed/simple;
	bh=dSsQ7ln9dom7tvC+7zYZts53Uj7ycsE8znu+2l5q+Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdfnpdQIzTPGCpADHsyLHJMHMzyF2NJEkEyS5cKMhuIy/xj4mZlHOZAiI7sP1PujvcXQpH3U7alLb7qBp3CQHBI5Or31j27TZEuEio6YFTixhp5LjT2SxkixeKIjUHpllGUWkSPCTk18SXWVrKmuSoIlkKSIYKjf1W0kl50bL9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UYP0YRo3; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=STvdtGwrlbRDAy5cjPU3q5DnAKLJycqH59lsV64gJ40=; b=UYP0YRo3qGyIl1x85VdifTZnfi
	xH3/nNPo9Xn9nSwlU1d9Vrs2FTfTQD7Hy+U1ZmaLC4LFLxeEDUHTEwowC3CKzpVeC9jtowU8wlqHt
	9oX0QL7VHNKgZefAJbIKOClgRvUF5+c1jq4aljw/Sgn2UkcoQSVHG7kAQGFPfL22kY75jRHf9xijI
	L2OMg2R391QegKQxzQdtP3QevbiamtW48cfGlwfiftDjR3tlHXpr6t4KTvg7M5etU2ZrWkuaGW/EW
	fn7L94pqm8s1tRvKt1YWdvZ1nXeC5Bnwd9hAHSXQ+CeJv1jQI6xxC+ptd4h2FiLcOy5HSAHai2Xx7
	GszFH9bw==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vCHzL-00EmDz-G4; Fri, 24 Oct 2025 15:37:51 +0200
Message-ID: <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
Date: Fri, 24 Oct 2025 14:37:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Danilo Krummrich <dakr@kernel.org>
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
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <8cba66d2-9608-4a5c-a2af-6cc91f46a49f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24/10/2025 14:13, Danilo Krummrich wrote:
> On 10/24/25 2:40 PM, Tvrtko Ursulin wrote:
>> You trim too much of the quote making it unclear if you read the whole story.
> 
> I'm well aware of the context.

Good to know. I am coming from the angle that netiquette, at least in 
the olden days, used to be that when you join an established thread you 
don't trim too much of the context. For the benefit of people joining 
the thread at that very point, especially when re-raising an argument 
which has already been discussed.

>> If the driver isn't detached from the signalled fence then it is vulnerable to
>> use after free.
> When someone just reads "detached-driver" is creates the impression that the
> driver is unbound from its device, since this is what this term is usually used for.
> 
> (And this is even the case you want to protect against, i.e. the string behind
> the pointer returned by get_driver_name() has been freed.)

One of the cases just to be clear. The driver getting unbound from the 
device is not *the* case.

In fact with xe the bug was exploitable by just closing the render node 
fd and then querying the fence. Hence detached in this context is more 
than unbound or unloaded.
> However, the condition that has changed when you print "driver-detached" is that
> the fence has been signaled, independent of whether the driver has been detached
> from the device.
> 
> Now, you can argue that you mean "driver has been detached from the fence",
> which means something along the lines of "the driver has no business with the
> fence anymore", but this is not what people think of when they read
> "detached-driver".Okay people. :)

How about "unknown-driver", would that satisfy you?

Regards,

Tvrtko


