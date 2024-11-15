Return-Path: <linux-media+bounces-21454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 457F59CD711
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 07:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA6D31F222F5
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 06:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37514187FE8;
	Fri, 15 Nov 2024 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dEA4shVk"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBDC180A80;
	Fri, 15 Nov 2024 06:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731652142; cv=none; b=NUSyHfJmhojJEYaqQMy+6LLNvnI4alhyHQSjxwoy21SH+VU04PuUQ62S1hAkCg0IquUssMhseCHyJKBTgJQzc6PfEa5caKu/vJBJWvQKxx/omDOfNeAMSfWerCZo1kOeAinVVj6yzSrThAcjLgMGCsbQiDoBADoVelmzcna20dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731652142; c=relaxed/simple;
	bh=db4/f4bMsfYLVz07xvONLuuPioqDhB9U/zLJppNYReM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJ/8IHQXNJ0wqXpvBK+eR77TlYVd1xSbsutZvIfoZiRY8Qqp/KWBMEM1mRZxT2PpXGueneoq7B7MD5TOE89N5lVsRYkjcxcudPkwS6P/Q9zzstJnKjH6XCv09xxa71cxmzDZArhH4nKQVr+gtFUhNcaafli8e8qcpOT07uG4z3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dEA4shVk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=DxbhzM0cFUf/MPX7dBlcoY0RaFbrxHWYuImlBcVWobw=; b=dEA4shVkLU3p/nJaZKGU8c6ucq
	bsmiq/eVqGWwQoYXGYanInpGDbXPy6sm3ZUME/Yfl8hMcQ3pnfuBEjwYdhOnNAKNrU/yUwm1oSufT
	NZuBqZVZdxH1ECuVLBt+9wqQWCBWDkoa+Jc3RoiP5zQzooSXq7h/kWoqTSveFsTCNhFsfAdgfj+vy
	Y0Ja6iAVhDlv6rteF5vj/HHYZZwzftcJ8L9upUdyejMMzwBViPSfg1UGlViyw26wAuPz6h7FiPL4o
	4cRWnO7LY2+z6cngw/BZKA1rTLDeJPACMto9QzeeucUY4b7J/H3Ha/7JXTx/L0pdkdNQv4v5gZupE
	KJJBy9FA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBppB-00000000yHT-1hEv;
	Fri, 15 Nov 2024 06:28:56 +0000
Message-ID: <06bb8d73-ba52-440a-be95-42977145c026@infradead.org>
Date: Thu, 14 Nov 2024 22:28:51 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: Add debugging section to process
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>, bagasdotme@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com
References: <20241028-media_docs_improve_v3-v2-0-f1960ae22c5d@collabora.com>
 <20241028-media_docs_improve_v3-v2-1-f1960ae22c5d@collabora.com>
 <5dbe1671-e5bd-44e1-b2cf-21ad30339024@infradead.org>
 <20241115060542.lqpu3sdqnsxass6q@basti-XPS-13-9310>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241115060542.lqpu3sdqnsxass6q@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/14/24 10:05 PM, Sebastian Fricke wrote:
> Hey Randy,
> 
> Thank you for the review, I'll apply these changes, I just found one
> advice below not terribly helpful maybe you can clarify ...
> 
> On 14.11.2024 21:06, Randy Dunlap wrote:
>>
>>
>> On 11/13/24 3:17 AM, Sebastian Fricke wrote:
>>> This idea was formed after noticing that new developers experience
>>> certain difficulty to navigate within the multitude of different
>>> debugging options in the Kernel and while there often is good
>>> documentation for the tools, the developer has to know first that they
>>> exist and where to find them.
>>> Add a general debugging section to the Kernel documentation, as an
>>> easily locatable entry point to other documentation and as a general
>>> guideline for the topic.
>>>
>>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>>> ---
>>>  .../driver_development_debugging_guide.rst         | 214 ++++++++++++++++
>>>  Documentation/process/debugging/index.rst          |  65 +++++
>>>  .../debugging/userspace_debugging_guide.rst        | 278 +++++++++++++++++++++
>>>  Documentation/process/index.rst                    |   8 +-
>>>  4 files changed, 562 insertions(+), 3 deletions(-)
>>>
>>
>>
>>> diff --git a/Documentation/process/debugging/userspace_debugging_guide.rst b/Documentation/process/debugging/userspace_debugging_guide.rst
>>> new file mode 100644
>>> index 000000000000..a7c94407bcae
>>> --- /dev/null
>>> +++ b/Documentation/process/debugging/userspace_debugging_guide.rst
>>> @@ -0,0 +1,278 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +==========================
>>> +Userspace debugging advice
>>> +==========================
>>> +
>>> +A brief overview of common tools to debug the Linux Kernel from userspace.
>>
>> Make that a sentence?
> 
> Can you clarify this?
> 
> This could either mean:
> - What you even bother to make a sentence out of that?
> - Please make a proper sentence out of this because it is hard to
>   understand
> - Please go into more detail because this is too brief
> 
> Or maybe something completely different :)

Sorry for my brevity.
I just meant "do you want to make that line a sentence, because it is not a sentence
in its current form." But I'm not going to lose any sleep over it.

Thanks.

-- 
~Randy


