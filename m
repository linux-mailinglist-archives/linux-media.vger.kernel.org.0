Return-Path: <linux-media+bounces-46186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7782C2AAD5
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 10:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E657A18900A9
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 09:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F742E7180;
	Mon,  3 Nov 2025 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilxhQtZG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854CBEEB3;
	Mon,  3 Nov 2025 09:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762160731; cv=none; b=CbSb3O++Ws8K6z2+b2HQahCYkyTfjPvww0djLwsna3B+MiW8LIVAQaZ33KNkat30aZTFDoEF2D8gu0W60L8irRL8mQGmG6JjNjHNN+n4Z/+B0dxaD7HAnxKFz1ezTgQYk5iJKq9v2w8S+Zw/oK5tZgQquVYlT/OSc6v4RUwNuEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762160731; c=relaxed/simple;
	bh=UUbEsOe4Q4pwT5mEOpKxll+kgknMkwcSq5AQt9/VDPA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KnLvB/uo2c/RvgxTOeGiVEokZq2r2km9PJ0/O5LWdt01ao3cGFovCsRnVu/H2zYHHIYIx5TPwCbIzgY0ToUd3cg7RP3nSXV3iJ7s6ZlSuooM1x2yvCElx7OTx1xwGFOkvq5A8PENcFJ7TOXh5JTVHJMw0nYqlJ9Db0QuaWaK644=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilxhQtZG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD7BC4CEE7;
	Mon,  3 Nov 2025 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762160731;
	bh=UUbEsOe4Q4pwT5mEOpKxll+kgknMkwcSq5AQt9/VDPA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=ilxhQtZG2ZzCMz3K1Q7Asn/X9i0LQy6+ZkYWRA1Iv5jJXF8MqToYiHv5O9qTAO/1h
	 PfHWmJlj2KA8IKwNvbXFuvIZXbJbbsQhDpeBCChU3M0h9x17VVYyweG/va0G+yPA3F
	 xYa64zXIFeUmVEM+fo16wFH+Nf61X9TPNuywIBHXR0V5Ti0+cgranDoP5zgbl6FzUV
	 3ZZCMCHtyZbO8k9giJvz7ASwR7jdX58EKpgsqDYsLBRHlJ0cC23pJU1rBcZrbwMER5
	 Tww096h5svR+/UAVhc/fqEmtg7GIHTYKFSAXegQzrdvH8EBwbS5wOq6+onldiRCCZP
	 MKWHGlG24hpFw==
Message-ID: <14a57def-b2da-491b-ad97-19b784d0d594@kernel.org>
Date: Mon, 3 Nov 2025 10:05:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 3/3] module: Add compile-time check for embedded NUL
 characters
To: Daniel Gomez <da.gomez@kernel.org>, Kees Cook <kees@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org,
 Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251010030348.it.784-kees@kernel.org>
 <20251010030610.3032147-3-kees@kernel.org>
 <91866583-037f-4607-b148-4ddf38ffaf51@kernel.org>
 <1c3e9bc8-0d25-46b2-98a3-643157f78b21@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <1c3e9bc8-0d25-46b2-98a3-643157f78b21@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2025 09:58, Daniel Gomez wrote:
> On 03/11/2025 09.54, Hans Verkuil wrote:
>> On 10/10/2025 05:06, Kees Cook wrote:
>>> Long ago, the kernel module license checks were bypassed by embedding a
>>> NUL character in the MODULE_LICENSE() string[1]. By using a string like
>>> "GPL\0proprietary text", the kernel would only read "GPL" due to C string
>>> termination at the NUL byte, allowing proprietary modules to avoid kernel
>>> tainting and access GPL-only symbols.
>>>
>>> The MODULE_INFO() macro stores these strings in the .modinfo ELF
>>> section, and get_next_modinfo() uses strcmp()-family functions
>>> which stop at the first NUL. This split the embedded string into two
>>> separate .modinfo entries, with only the first part being processed by
>>> license_is_gpl_compatible().
>>>
>>> Add a compile-time check using static_assert that compares the full
>>> string length (sizeof - 1) against __builtin_strlen(), which stops at
>>> the first NUL. If they differ, compilation fails with a clear error
>>> message.
>>>
>>> While this check can still be circumvented by modifying the ELF binary
>>> post-compilation, it prevents accidental embedded NULs and forces
>>> intentional abuse to require deliberate binary manipulation rather than
>>> simple source-level tricks.
>>>
>>> Build tested with test modules containing both valid and invalid license
>>> strings. The check correctly rejects:
>>>
>>>     MODULE_LICENSE("GPL\0proprietary")
>>>
>>> while accepting normal declarations:
>>>
>>>     MODULE_LICENSE("GPL")
>>
>> Who will take this series? I can take the first two media patches and
>> someone else can take this last patch, or I can take all, or someone
>> else can take all patches. The media patches already have my 'Reviewed-by'.
>>
>> Any preferences?
> 
> I will take patch 3 in modules' tree.

OK, then I'll take patches 1 and 2 in the media tree.

Regards,

	Hans

> 
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Link: https://lwn.net/Articles/82305/ [1]
>>> Suggested-by: Rusty Russell <rusty@rustcorp.com.au>
>>> Signed-off-by: Kees Cook <kees@kernel.org>
> 
> Reviewed-by: Daniel Gomez <da.gomez@samsung.com>


