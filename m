Return-Path: <linux-media+bounces-21248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E089C3B4C
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 10:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 395561F22CE3
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 09:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB83118453F;
	Mon, 11 Nov 2024 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="dl4xkMUJ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF08158214;
	Mon, 11 Nov 2024 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318423; cv=pass; b=N09nG9i5Rl1nNdLX/iKowE1OVlUSTXpuw5K3gR5idDmyinK9OMQRSfpF0DJhoDcOFCdckWpuZ08PgB6m3Z2VAFi3B6C56JzXiujyWJl2nqOr9Kz1RyjHUNJEq5TAI64Kv9Q7RMMeaP/qUbyBc9UdauEVGhNusJekVETchGmOhAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318423; c=relaxed/simple;
	bh=6vfyFX4L+kXHPuWbbb1T6M+SXbd+2jUFBfe1SlMS1+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZ70Ognmdh+3h8Eder0g+AYIHMyejuChpv9VT8vBnLkH4odFlGURCWr+A+Cw/DDvpAa6WUqvQr4Xbxy87n02aR7bRd0gHAPE5Bl33cQQC1OerLNkJk46iLf+AkPWlE2S5QsNg/oGjBo5yX4yHCNGXfLZjF5HuxB4K8qzSA24gkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=dl4xkMUJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731318404; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cGRq1bBa3PSfmKzCvYpPgWr8HfC/FU8MHHspig1ilVMEy5UI0Hd03VOtBR1wRZfKaIJhsRfATm0W+24EkSPKgp0rzfcI++VqJmr/eSMcN3J5dHPApOQS0N4cS4RsuSHFoPG8WjoQR/nES06PhbRcPUsMbpIIWZ2mEZjiXnQnCVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731318404; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yqa0lED6DeSxiKn7EHdBHyl+tiOuKcNtc9aIEllP6LU=; 
	b=R01RNZDjQuFj8hgjCiwg53hxi+9M6CqRP3BlIUljK4Z0pf4n51h05L0G+/+aTCoJlzOJyNrH1x13mCawC8OGMt0+mGEOB3qjs9wgv7Km0T6Q/fBqgSvX043yKqMkRTM+b7tNBh1m5sjNJbC/uLyUkaAL0kA0n1Ke3SbY6dAG3GY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731318404;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=yqa0lED6DeSxiKn7EHdBHyl+tiOuKcNtc9aIEllP6LU=;
	b=dl4xkMUJesAq1DcxnT1bmERKDO0vkIPIQH3xNBNoofoSG1hV+SJCg9IpHdYBTBR0
	2H/5fldIlWHEQt67RVxc7ncxvN8+DtDSpnf7JUKuy2+I+e1FmCcZmKUAfdStbvoZa9I
	M6+Eg2yXSVt/GvCZrLmN6/MdRGmuqCb9SLd9BSwg=
Received: by mx.zohomail.com with SMTPS id 1731318402557136.23569764275726;
	Mon, 11 Nov 2024 01:46:42 -0800 (PST)
Date: Mon, 11 Nov 2024 10:46:38 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	mauro.chehab@linux.intel.com, kernel@collabora.com,
	bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH 1/2] docs: Add guides section for debugging
Message-ID: <20241111094638.7ay3opov775eipzn@basti-XPS-13-9310>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <20241028-media_docs_improve_v3-v1-1-2b1b486c223e@collabora.com>
 <87ldxu235z.fsf@trenco.lwn.net>
 <20241108081315.ln5ltvw3ssldonui@basti-XPS-13-9310>
 <87o72py8z4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <87o72py8z4.fsf@trenco.lwn.net>
X-ZohoMailClient: External

Hey Jonathan,

On 08.11.2024 09:40, Jonathan Corbet wrote:
>Sebastian Fricke <sebastian.fricke@collabora.com> writes:
>
>> Hey Jonathan,
>>
>> On 07.11.2024 13:35, Jonathan Corbet wrote:
>>>Please, let's not add this to the top-level page.  I've been through a
>>>multi-year struggle trying to trim that page down to the point where it
>>>is possible to actually find something of interest there.  Everybody
>>>wants their stuff up front, but please link this from the process guide
>>>instead.
>>
>> Hmmm ... we are talking about a page for newbies here, when it is under
>> process the person will have to figure out first that one has to click
>> on All development-process docs and then find that document under the
>> abundance of others. Could we atleast generate a top level page called
>> Beginner intro or something similar, where you are guided through the
>> documentation tree from the perspective of a beginner?
>
>By the time somebody needs this document, they should be at least
>wrist-deep in kernel development and should be able to find it.
>
>Now, as per the discussion with Randy, if we decide we want to separate
>"how to work on kernel code" from "how to work with the kernel
>community", we can do that.  We're talking about a bigger organizational
>issue at this point, though.
>
>Meanwhile, more introductory documentation is always a good thing :)

Okay, so I conclude, for the time being, I will remove the links from
the top page and make sure that the debugging page is properly linked in
the process page and we keep the debugging guide in
Documentation/process for now. Next steps can then include:
- Adding a introductory documentation page that links to the debugging
   guide
- Move the debugging guide to a different location

>
>>>When referencing the function, say printk() - that's the convention we
>>>use.
>>
>> Ah even in the title? Can do. (Even though it makes the titles look less
>> uniform..)
>
>That would be my preference, yes.

Ack.

>
>>>That is anything but full documentation of lockdep; it's really only
>>>about RCU.  I wish (hint :) that we had proper documentation for lockdep
>>>that we could link here.  For the purposes of a reader who needs this
>>>level of guide, though, linking deep into RCU is not likely to be
>>>helpful.
>>
>> Yep I struggled finiding something useful for this topic in the docs.
>> I'd say I skip adding a link for now and we can create another MR later
>> to add a proper documentation + link in the documentation.
>
>Sounds like a good plan to me.

Ack.

>
>>>> diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
>>>> new file mode 100644
>>>> index 000000000000..c200ede7c955
>>>> --- /dev/null
>>>> +++ b/Documentation/process/debugging/index.rst
>>>> @@ -0,0 +1,21 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +============================================
>>>> +Debugging advice for Linux Kernel developers
>>>> +============================================
>>>> +
>>>
>>>This file needs an introductory paragraph (at least) saying what it is
>>>about.  A simple directory listing is not hugely useful.
>>>
>>>An alternative might be to turn your "general advice" document into the
>>>index.rst file.
>>
>> Well that is what I had in the previous iteration and Bagas Sanjaya told me:
>>>Please split general debugging advice into its own doc (e.g. at
>>>general-advice.rst). Most other docs have index.rst only for toctree
>>>listing.
>>
>> So, shall I revert that or should I add a intro sentence to the index
>> file?
>
>Bagas is fond of giving bad but authoritative-sounding advice to
>documentation contributors despite repeated requests to stop.
>Unfortunately, I don't have the time to chase him around all the time
>and set things straight.
>
>My preference would be to go back to what you had, but if you prefer to
>just add an intro paragraph at this point we can certainly live with it.

I go back to what I had previously. Thanks.

>
>>>> +  $ alias ddcmd='echo $* > /proc/dynamic_debug/control'
>>>> +  $ ddcmd '-p; file v4l2-h264.c +p'
>>>
>>>It seems to me that the alias just obfuscates things, why bother?
>>
>> Well because the Linux Kernel documentation suggests that :P
>> https://docs.kernel.org/admin-guide/dynamic-debug-howto.html#controlling-dynamic-debug-behaviour
>>
>> If you don't like that, then I think I should send a MR for that file as
>> well.
>
>Up to you, this is just something that caught my eye as I was going by.

I'd say I keep it as is for now and put this and I discuss with the
dynamic debug maintainer to see if we change that in both locations, I
wouldn't want the dynamic debug guide advice from the debugging guide to
differ from the official documentation.

>
>>>> +  To analyse the crash dump please use `Kdump` & `Kexec`.
>>>
>>>Those will not *analyze* a crash dump.
>>
>> Well yes they will capture the crash dump, which can then be used to
>> analyse the crash. Maybe a better wording is:
>>
>> To capture the crash dump please use `Kdump` & `Kexec`. Below you can
>> find some advice for analysing the data.
>>
>> better?
>
>Yes, thanks.

Ack.

>
>jon

Regards,
Sebastian Fricke

