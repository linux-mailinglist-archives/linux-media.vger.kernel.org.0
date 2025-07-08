Return-Path: <linux-media+bounces-37076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3853BAFC757
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 11:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4957D561F47
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 09:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9A126657D;
	Tue,  8 Jul 2025 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bg/UJWQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD02135D7;
	Tue,  8 Jul 2025 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751968058; cv=none; b=nUEj+914nxY2bv4aNSoWSZ51dPXHdUA56/63N3q3VQlnLlMcm2oVViU2RKkRODCqmqQodt6EzMinXVFm94PIFJCJcwKrIrj8ybeImf0mQliY02OT8yfWtHZwofMTPZOsmKMdTV0mUZ84yJ9MYMAZ003DJYvw4dWU8lZ507hfFxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751968058; c=relaxed/simple;
	bh=Uzh++2mcwItG4R3XCrfiOSzDs3Ip5EJP1xQKASAX1k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwpCCi8E07UsnbgTQ40omfLHmQTRnoWTtCPnHXLKbi5QG5LFvo13wRNSG2+pUgf5Lw3T+qYaiBEHWtslGUw8dcm178gcNAEbz0ybB246bkxBe95+hKAC3qVO9wp4BAQzenGK5v6Pt7HVa7YVkINL3S8HbXlpE/OEdZuZWPbJAYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bg/UJWQ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E350C4CEED;
	Tue,  8 Jul 2025 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751968056;
	bh=Uzh++2mcwItG4R3XCrfiOSzDs3Ip5EJP1xQKASAX1k4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bg/UJWQ2S2kqZDEIloKkaHWa/NgLKoy7SSBnVcOynJwIKyRgoOa5goFnBT2LjmfHY
	 tGe7/2ifHKvqdaG6P2xwHpAimF3JZf2b12yL/VW2Th3rbl5pTBhwGdTPDFhx/XhAzD
	 ZerO7RO6dJJiwGipZbN0CPJsg+EtyMg9h2u7/fVyhSfvVDQKjM/y40ciwCrgYoT2Xs
	 JpAG4VE8pErn2/7yHHPhLPe9CW/6QMoiY2RBkXOdsXRnbNKMfAHn3YmlmBl4hX/YH5
	 mkcMKPmEe+3BZs1c6aQ+gHB8xn9oxN+raAj3+3UNqu93gfeyzyko+VvIXjlc+n6uIT
	 OBU7jKWgFiSMQ==
Message-ID: <8beab69f-888b-4dbf-956a-2c6aa925e83f@kernel.org>
Date: Tue, 8 Jul 2025 11:47:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/23] media: atomisp: gc0310: Add link-frequency and
 pixelrate controls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-8-hdegoede@redhat.com>
 <aCsWY1ICUoHTq07L@smile.fi.intel.com>
 <3bb4690c-eedf-4cb6-8779-2ea1004510e2@kernel.org>
 <aGzQ8vAZ6x9IOIiw@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aGzQ8vAZ6x9IOIiw@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 8-Jul-25 10:04 AM, Sakari Ailus wrote:
> On Sun, Jul 06, 2025 at 11:57:17AM +0200, Hans de Goede wrote:
>> Hi Andy,
>>
>> On 19-May-25 1:30 PM, Andy Shevchenko wrote:
>>> On Sat, May 17, 2025 at 01:40:50PM +0200, Hans de Goede wrote:
>>>> Add support for the pixelrate control as expected by libcamera,
>>>> while at it also add the link-frequency control.
>>>
>>> ...
>>>
>>>> +/*
>>>> + * The actual PLL output rate is unknown, the datasheet
>>>> + * says that the formula for the frame-time in pixels is:
>>>> + * rowtime = win-width + hblank + sh-delay + 4
>>>> + * frametime = rowtime * (win-height + vblank)
>>>> + * Filling this in and multiplying by 30 fps gives:
>>>> + * pixelrate = (660 + 178 + 42 + 4) * (498 + 27) * 30 = 13923000
>>>> + */
>>>> +#define GC0310_PIXELRATE			13923000
>>>
>>> Why not utilise the preprocessor to calculate the above?
>>> I mean we can define an arithmetic expression instead of the result
>>> (which is mentioned in the comments anyway).
>>
>> I don't really see any added value in using the pre-processor
>> for this, it just makes the #define line unnecessarily long.
> 
> My suggestion would be the same as Andy's. If you think the calculated
> value should appear there as well, then I'd put it in a comment.

I've already send out an atomisp pull-request for 6.17 keeping this
as is.

But we can fix this up with a follow-up patch I guess.

Regards,

Hans



