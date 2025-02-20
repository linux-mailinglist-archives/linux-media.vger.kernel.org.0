Return-Path: <linux-media+bounces-26465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 874D8A3DBB9
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60F9B1799E7
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 13:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC6D1F9F73;
	Thu, 20 Feb 2025 13:51:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0852835942;
	Thu, 20 Feb 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740059489; cv=none; b=qHtEPAOezoTE4MhXmf7DURfKV08Vi32eKdJkwv68++oamW6K0ao+7Wbb7w6O5mFRLZLad1yuX/gH83y1RpDmC1w96NTusvb43qgJ1FLvBDolqj+RhIxZeQDrJBYPPhcj0tJnk1AFTm5W2NQoCXvxUHUg9q7jB+YAhEkHTWNELe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740059489; c=relaxed/simple;
	bh=yyNMgC0L8EOqbQJBKtFwBZUUIlx9bNlp7wBIvGIHH5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKcsDGVxe2/OO1OGBkMkp9cA+HI0QOaDoJnjO0RzODrXS9V5GbF2gmxbUTIR4I0uvkRCF+ZOH66JJ05v5lCJmt02gGEv8tkGLmEwr5znalkLRiMXQaJm7DEx5jSrCSWNQLNb3sSqt3cRGvcahQiuIljQyYy7RFcyK8pNbTWitrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE0CC4CED1;
	Thu, 20 Feb 2025 13:51:24 +0000 (UTC)
Message-ID: <d3cf3e65-fe43-4c0b-bfb5-03fdd3c9fc29@xs4all.nl>
Date: Thu, 20 Feb 2025 14:51:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: platform: Use str_enable_disable-like helpers
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>,
 Olli Salonen <olli.salonen@iki.fi>, Abylay Ospan <aospan@amazon.com>,
 Jemma Denson <jdenson@gmail.com>,
 Patrick Boettcher <patrick.boettcher@posteo.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Tim Harvey <tharvey@gateworks.com>, Andy Walls <awalls@md.metrocast.net>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
 <20250114-str-enable-disable-media-v1-5-9316270aa65f@linaro.org>
 <20250114204240.GA29414@pendragon.ideasonboard.com>
 <Z4dmFlJ_0hugX2rY@kekkonen.localdomain>
 <CAAFQd5ASMNr2tO+R1sYa58diWLHJr8iomKA2-PinEojCdXT98A@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAAFQd5ASMNr2tO+R1sYa58diWLHJr8iomKA2-PinEojCdXT98A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/15/25 08:47, Tomasz Figa wrote:
> On Wed, Jan 15, 2025 at 4:39 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
>>
>> Hi Laurent,
>>
>> On Tue, Jan 14, 2025 at 10:42:40PM +0200, Laurent Pinchart wrote:
>>> Hi Krzysztof,
>>>
>>> Thank you for the patch.
>>>
>>> On Tue, Jan 14, 2025 at 08:46:21PM +0100, Krzysztof Kozlowski wrote:
>>>> Replace ternary (condition ? "enable" : "disable") syntax with helpers
>>>> from string_choices.h because:
>>>> 1. Simple function call with one argument is easier to read.  Ternary
>>>>    operator has three arguments and with wrapping might lead to quite
>>>>    long code.
>>>
>>> It's more difficult to read for me.
>>
>> I don't have any issue in using the ternary operator either. Using these
>> helpers makes the lines generally 3 characters shorter.
>>
>>>
>>>> 2. Is slightly shorter thus also easier to read.
>>>> 3. It brings uniformity in the text - same string.
>>>> 4. Allows deduping by the linker, which results in a smaller binary
>>>>    file.
>>>
>>> I don't see why the linker can't de-dup string in the current code.
>>
>> In fact the functions are static inline so from that point of view I don't
>> think there's any difference.
>>
>>>
>>> I'm sorry, I just don't see the point in doing this. I'd like to avoid
>>> those changes in the Linux media subsystem, or at the very least in
>>> drivers I maintain.
>>
>> I don't have much of an opinion, perhaps I slightly prefer using these as
>> the rest of the kernel does, too. Yet if we choose not to use these
>> helpers, we continue to be occasional targets of largish patchsets "fixing"
>> this.
> 
> To put one more aspect on the scales:
> 
> These kinds of patches actually make it more difficult to backport
> changes (e.g. fixes) to stable kernels, so my preference would be to
> only use the new helpers in new drivers.

I agree with Tomasz. Now, if the whole kernel is converting to these
new functions, then I guess we should follow, but from what I can tell
that doesn't appear to be the case.

I'll reject this series. It can always be resurrected if there is
sufficient demand for this.

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 


