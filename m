Return-Path: <linux-media+bounces-12554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A4F8FC338
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 08:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 052F31F231EE
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 06:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3AD21C17E;
	Wed,  5 Jun 2024 06:00:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86954EB55
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 06:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717567248; cv=none; b=Q6zsiaE2YkQ/kazQrVKSGHVpjmE7DiSnhBn/6uLsad4AygYHb2qngnn1QnY9DyCQbVuom4McNNNEut9NZxPiFXWf5liAxMUVZSLhycCRGX+0lcIWSKNVwXTx8FXqvQnu7AjpEqdBOLkD3PQQAA2/ky3wXy8xbVZhysCMny0RZ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717567248; c=relaxed/simple;
	bh=5OQSyxnPfpiFXsL6zpttwAUotkZ4eCEeNyHzVat5Jz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fk/rMWEJQ+KFMI1hkGjVOAlXVGhuzleT+ea53MbGG9SbAUcY897PqsIS5YOMOs1dqqM3n5gwUDtN9L7JPcT+M1sHCy2HTw8tl+dAdD8YipTjiZMFEubzW7hKEjzqyS0cLigqdZaetQ1NciDpTILf5wBnA4EVALJ8UBLAwM10rCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4ECC32781;
	Wed,  5 Jun 2024 06:00:47 +0000 (UTC)
Message-ID: <1e8f0155-1b8b-4bb4-8358-5854e991910d@xs4all.nl>
Date: Wed, 5 Jun 2024 08:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] edid-decode: Cannot support NonMixed MS without MS
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: linux-media@vger.kernel.org
References: <20240529100301.127652-1-sebastian.wick@redhat.com>
 <b7097390-1609-4faa-8e88-9bfe5a00641d@xs4all.nl>
 <CA+hFU4yNeQmJRNZT2eSKtdX6pSv-oixNRRj-O5--8R-gK5oo6w@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CA+hFU4yNeQmJRNZT2eSKtdX6pSv-oixNRRj-O5--8R-gK5oo6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/06/2024 18:57, Sebastian Wick wrote:
> On Wed, May 29, 2024 at 4:16 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Hi Sebastian,
>>
>> On 29/05/2024 12:02, Sebastian Wick wrote:
>>> When `Max Stream Count` is zero, the sink does not support multistream
>>> and thus cannot support NonMixed MS.
>>>
>>> An EDID with Max Stream Count = 0 and Non Mixed MS = 1 can be found in
>>> linuxhw/EDID ./Digital/TCL/TCL5655/1723FF2DC6D1 at commit cff7fe4d44.
>>>
>>> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
>>> ---
>>>  parse-cta-block.cpp | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git ./parse-cta-block.cpp ../parse-cta-block.cpp
>>> index 4d2afc6..7cd7a3a 100644
>>> --- ./parse-cta-block.cpp
>>> +++ ../parse-cta-block.cpp
>>> @@ -2498,10 +2498,11 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
>>>               fail("Empty Data Block with length %u.\n", length);
>>>               return;
>>>       }
>>> -     if (x[0] & 3)
>>> +     if (x[0] & 3) {
>>>               printf("    Max Stream Count: %u\n", (x[0] & 3) + 1);
>>> -     if (x[0] & 4)
>>> -             printf("    Supports MS NonMixed\n");
>>> +         if (x[0] & 4)
>>> +                 printf("    Supports MS NonMixed\n");
>>> +     }
>>
>> I would actually leave this as-is, but instead add a fail() message
>> if MS NonMixed is set, but Max Stream Count == 0.
>>
>> It's really an EDID conformity failure, and it should be reported as such.
> 
> I'm all for adding a fail() message but I'm afraid our implementation
> which tries to be compatible with the output here won't have access to
> the MS NonMixed bit when Max Stream Count == 0.
> 
> Would this work for you?
> 
>     if (x[0] & 3) {
>         printf("    Max Stream Count: %u\n", (x[0] & 3) + 1);
>         if (x[0] & 4)
>             printf("    Supports MS NonMixed\n");
>         else
>                 fail("NonMixed MS support indicated but MS is unsupported\n");
>     }

Correcting the logic that would be this:

	if (x[0] & 3) {
        	printf("    Max Stream Count: %u\n", (x[0] & 3) + 1);
		if (x[0] & 4)
			printf("    Supports MS NonMixed\n");
	} else if (x[0] & 4) {
		fail("MS NonMixed support indicated but Max Stream Count == 0.\n");
	}

And that works for me.

Regards,

	Hans

> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>>       num_descs = x[1] & 7;
>>>       if (num_descs == 0)
>>
> 


