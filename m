Return-Path: <linux-media+bounces-45530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E403BC06B24
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 16:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EF9F3AFA13
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229A42D8DB9;
	Fri, 24 Oct 2025 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="iFzPX1lq"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDB11A262D;
	Fri, 24 Oct 2025 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761316114; cv=none; b=WueYd3wpn+Fxn6PIeGKyWF9sbEFcG0I7xJ5/OkFDW17NiwmVSyIH1ukhbyCHtHdNpcX9Qn8q1QFlpqbwMGq+3X+Kow2EvTJwDI09+F1j1i5MPdYWI7v+K5vLO5LNAW9l75YupIMlD94cKorwi2UuwxpCfyaBAIMdPrMluinTD/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761316114; c=relaxed/simple;
	bh=u91kRig4NF8pln2GdERHy1cGr6kV6WEWYHTSAf76HPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvbeV9vzKLsof4thMdA9JqRi9sUn7Z5vc1fTAcGNQdo5wVxJQhvdE+GLUKOFUeYD07kAv5P1JtxKXxGyUk2NlJHLCq3IyR0yeJOOW6CpYsWLJTGLD7a0ASbh/xiQdJmP6fvYJ0g5iilmAJW87f+X9spiam1nJgN1ZRNUgNHSnw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=iFzPX1lq; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oQ4VK/tpAvrUPGOHlmYrPcl/3ujH6B0GAyEH1p51Y2c=; b=iFzPX1lqGhiTrTZ36r5hqbodzv
	bwg6xT3vIAcDQeDEbs8io1MYDdQchD1tjPzu+dAHsLjLyfcUwpyaRVDsiLHyYi8sEvUHLq+3wha87
	ZxZi/EKZMOEv007rLRy/hivfHHDUPkYq0X8YI5UFb3dsV3vZ10RrkUOWM9MYEAH5bcEB70fCH2CeL
	nTmQMySGYJktRHdCSkL5yuiNnjcwAHCGh3nI2YlPJWpqscr6YYz0RNYztZ1TY1LQ9p51r2y4/n9r/
	7FTy7h3VOTSLch616xGkti3Xqvpz6PRq1bhSllaF+LuknEveaVKjuhwxs5Jkgb2JSDzJ7yDjrzdXZ
	dBOCh+iA==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vCImB-00EnK4-So; Fri, 24 Oct 2025 16:28:19 +0200
Message-ID: <66f066b0-a8bb-40b2-bdd8-7cbcf114cde1@igalia.com>
Date: Fri, 24 Oct 2025 15:28:19 +0100
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
 <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
 <b21ba8b4-a31f-44e5-a2da-ba585a93d3a6@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <b21ba8b4-a31f-44e5-a2da-ba585a93d3a6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24/10/2025 15:17, Danilo Krummrich wrote:
> On 10/24/25 3:37 PM, Tvrtko Ursulin wrote:
>> Good to know. I am coming from the angle that netiquette, at least in the olden
>> days, used to be that when you join an established thread you don't trim too
>> much of the context. For the benefit of people joining the thread at that very
>> point, especially when re-raising an argument which has already been discussed.
> 
> I see it the opposite way, leaving too much context wastes people's time
> searching for the actual reply, see also [1].
> 
> If someone wants the full context, previously sent mails are always available.
> 
> [1] https://subspace.kernel.org/etiquette.html#trim-your-quotes-when-replying
> 
>>> Now, you can argue that you mean "driver has been detached from the fence",
>>> which means something along the lines of "the driver has no business with the
>>> fence anymore", but this is not what people think of when they read
>>> "detached-driver".Okay people. :)
> 
> Not a big deal, but for you to note: Quite some of your replies I've received
> recently add text to the quoted parts, in this case the "Okay people. :)".

Oh dear.. I can see it in the sent folder but it definitely wasn't 
composed like that. Thank you for pointing it out.

There has been something seriously wrong with Thunderbird's compose 
window for a few weeks now. First it would be inserting random newlines 
while editing, and then now after an update it jumps to the end of the 
whole message and add newlines there when pressing backspace on an empty 
line. Its infuriating. I see there is another update so I will try that.

>> How about "unknown-driver", would that satisfy you?
> 
> Honestly, the most accurate thing to say would be "fence-signaled", because
> that's the actual condition which causes the change.
Hm, ->get_driver_name() returning "fence-signaled" is not great, and 
debugfs output in the form of "kernel fence: fence-signaled 
timeline-signaled seq 1234 signaled" feels a bit redundant. :shrug:

Regards,

Tvrtko


