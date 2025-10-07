Return-Path: <linux-media+bounces-43828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2886EBC0F5F
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 12:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 03F984E31D3
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 10:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D256C2D876C;
	Tue,  7 Oct 2025 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9xFXOhm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9601494A8
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759831481; cv=none; b=dQuvZPhmVT34IwtrTCKkE7XHbsTpVdto6caE8ewwGR8tDhbyujKb3kE6+6WvQ/Lx/cwiVDZ4il/U6Wpoo8Tk2TDPbikXB6d4VjM3J36oxrJCFnQSKQdqRNp6TQSKOx43Kc0Uyf/TeZc0yRzIR3qjOggpI795c7M8zPLC7WzzfHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759831481; c=relaxed/simple;
	bh=PoSx1wwosTkOpSCxXOOcwLqB1lNiD4U6QUNsFi/DLZk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=jacsvirL8GiFLzLUb9dn/80t6sQHG4u3DBUQr7yssBS1b7fEBpD4+8n6SWjAoLPwbWgaTPz5nZ1UBNypRxjjHcY0aiEUAD8FAomRRuCfyjRtKtnwIY33vNCJgY2iP21SfYSRD/ddXRr4MA6OF6lamBCbDIxkWx6oOKCQLQQFdac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9xFXOhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035EEC4CEF1;
	Tue,  7 Oct 2025 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759831480;
	bh=PoSx1wwosTkOpSCxXOOcwLqB1lNiD4U6QUNsFi/DLZk=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=a9xFXOhmw0ZwbZN590wfyPw3IQShN8iWx3rgRactS4EMKLkMKFPMgtWtzQQFkyzA2
	 Uuvd9xaWk4NNYM2F6BbH9DqMPHIW32eyLSTdpTBjmy/SmDXXRmMQ5ahTZBBy60+g7g
	 c2aLUfRPpZrh0LKjQeIovKC1e4fnO18ydwYhDTCmVfKAwE37kyqwmIqwzVcHi+aC91
	 KNWlhCUjM5+FuGKyzwHps+FO3Y4nkuC1/dD85swe4fWfH02D2DEuw2JdzkdeMHv0Qt
	 HrPKstCHV+mQucWL+YhfiTKi7vlpb76Ew3XGXYJ8DSROfqN0zR4PFubFJ+RVcuwnSc
	 8MnjWG9CJxGKw==
Message-ID: <4c994c7a-b546-43b2-9b0b-79e30fbc660b@kernel.org>
Date: Tue, 7 Oct 2025 12:04:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 0/3] v4l2-ctl/rds-ctl: support optional ioctl and migrate
 some code to it
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz <foss+kernel@0leil.net>, linux-media@vger.kernel.org
References: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
 <f5a942fd-478c-4a5d-bf68-d53191d543f5@kernel.org>
 <5734ec94-ec46-47b6-993b-5a1ac1e41767@cherry.de>
 <7f204b8d-c2bd-4d81-b8de-b1fa50c6f091@kernel.org>
 <369af1f2-1772-4718-aa63-f3d09bdfd78f@cherry.de>
 <55696996-dee6-4433-aa24-08601ee8e62f@kernel.org>
 <31bc0002-06d0-4097-a36f-93389e67af75@cherry.de>
Content-Language: en-US, nl
In-Reply-To: <31bc0002-06d0-4097-a36f-93389e67af75@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2025 11:47, Quentin Schulz wrote:
> On 10/7/25 9:27 AM, Hans Verkuil wrote:
>> On 06/10/2025 14:57, Quentin Schulz wrote:
>>> Hi Hans,
>>>
>>> On 10/6/25 2:19 PM, Hans Verkuil wrote:
>>>> [You don't often get email from hverkuil+cisco@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> On 06/10/2025 13:37, Quentin Schulz wrote:
>>>>> Hi Hans,
>>>>>
>>>>> On 10/1/25 11:17 AM, Hans Verkuil wrote:
>>>>>> [You don't often get email from hverkuil+cisco@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>>
>>>>>> On 05/09/2025 14:19, Quentin Schulz wrote:
>>>>>>> Some ioctls are optional and the logic around it handle it nicely,
>>>>>>> except that doioctl (via doioctl_name) sets app_result static variable
>>>>>>> to -1 if the ioctl fails.
>>>>>>>
>>>>>>> However, both rds-ctl and v4l2-ctl exit code is from app_result. So it
>>>>>>> is possible to have those tools perform the expected task (albeit
>>>>>>> failing to use an optional ioctl) and still report to the user that it
>>>>>>> failed to do so.
>>>>>>>
>>>>>>> Let's add a new function doioctl_opt which allows to NOT set the
>>>>>>> app_result variable when the ioctl fails.
>>>>>>>
>>>>>>> This migrates two ioctl VIDIOC_SUBDEV_S_CLIENT_CAP and
>>>>>>> VIDIOC_SUBDEV_QUERYCAP to be optional ioctls.
>>>>>>
>>>>>> Actually, those ioctls must be present, unless you run an old kernel, but
>>>>>> they've been around since kernel 6.4.
>>>>>>
>>>>>
>>>>> Yes, I am using a 6.1 kernel, which is supported until Dec. 2027, c.f.
>>>>> https://www.kernel.org/releases.html
>>>>>
>>>>> 5.10 is also supported until Dec. 2026.
>>>>>
>>>>>> I'm dropping this series as this isn't quite the way to do this.
>>>>>>
>>>>>
>>>>> Could you explain what is the issue with those patches so I can suggest
>>>>> something else?
>>>>>
>>>>>> Perhaps you should explain the problem you encounter first (and mention
>>>>>> the kernel version you are using)?
>>>>>>
>>>>>
>>>>> Run v4l-utils on an older kernel (6.1 for example) and it'll try to use
>>>>> the ioctl that isn't supported. Since it's optional (the return code
>>>>> isn't checked directly) it'll happily actually do what's expected from
>>>>> it but the program will end with a non-zero exit code, thus failing my
>>>>> CI tests while still actually performing what it is requested to do.
>>>>> This is due to the failing ioctl setting app_result global variable but
>>>>> the failing calls not actually being checked right after in the calling
>>>>> function so the program continues as if everything went well but the
>>>>> last line of the main function (std::exit(options[OptAll] ? 0 :
>>>>> app_result);) actually returns the exit code matching app_result value,
>>>>> which is set when the (deemed optional) ioctl fails.
>>>>>
>>>>> I use v4l2-ctl to set a test pattern on a camera and now my CI simply
>>>>> doesn't pass anymore on Trixie because of that. For now, I ignore the
>>>>> exit code of v4l2-ctl -c test_pattern=1 and validate it actually was run
>>>>> by running v4l2-ctl -C test_pattern afterwards (but still not checking
>>>>> the exit code of this command as it's still returning that it failed).
>>>>>
>>>>> Kernel is 6.1.
>>>>
>>>> Isn't debian trixie on 6.12? Why are you on 6.1?
>>>>
>>>
>>> Typical embedded ARM devices setup (sadly). 6.1 is the vendor kernel
>>> with support for cameras while upstream catches up (no camera stack on
>>> RK3588 yet). So we essentially only have the userspace stack of Trixie.
>>> I mentioned Trixie but it doesn't really matter to be honest, I could be
>>> compiling v4l-utils on Yocto with that kernel if I wanted to and the
>>> issue would be the same. It just happens that our CI is running Debian
>>> at the moment.
>>>
>>>> Honest question, I just want to better understand why you are on that old kernel.
>>>>
>>>> Anyway, the application result is of limited use: it is never tested by me and
>>>> failing on non-existing ioctls is probably not a good idea anyway. v4l2-ctl calls
>>>> lots of ioctls: if present, then do A, if not, then do B (or nothing). And each
>>>> time an ioctl fails fails with ENOTTY app_result would be set.
>>>>
>>>> Going through the v4l2-ctl code and checking all places where an ioctl can be
>>>> optional would be a substantial amount of work and is probably hard to get right.
>>>>
>>>
>>> Fair.
>>>
>>>> It might be better to only set app_result if the ioctl result is < 0 && errno != ENOTTY.
>>>> I.e. missing ioctls are just ignored as being 'normal' behavior. I think that's
>>>> reasonable.
>>>>
>>>
>>> Do we want to silently ignore ENOTTY even for the return code of the
>>> doioctl function? This would make it impossible to know if the ioctl was
>>> run or doesn't exist, which I assume may be desired?
>>
>> No, the idea was to just ignore ENOTTY when it comes to setting app_result. But I don't think
>> that's the right approach.
>>
>> I looked a bit more closely at the code, and I think the right thing to do is to use
>> test_ioctl() instead of doioctl for those cases where an ioctl might fail.
>>
> 
> This means we won't have logging of the failing (deemed optional) ioctl 
> that doioctl_name does for example. Which is one of the reasons why I 
> went for a new doioctl_opt in the first place. Another reason is that if 
> the ioctl fails with something else than ENOTTY, each caller of the 
> test_ioctl would be responsible for ignoring ENOTTY but handle the rest 
> of the error code (and possibly printing logs). Which I felt was 
> something we could avoid.
> 
>> That's already the case for ENUM ioctls (since they return EINVAL when the index
>> reaches the end of the enumeration), and so this can also be used for VIDIOC_SUBDEV_QUERYCAP
>> and VIDIOC_SUBDEV_S_CLIENT_CAP.
>>
>> So make a patch for that and mention in a comment that VIDIOC_SUBDEV_S_CLIENT_CAP was
>> introduced in v6.4.
>>
>> No need to create a doioctl_opt, since basically that's what test_ioctl already does.
>>
> 
> but keeps printing logs on failing ioctls.
> 
> Up to you, just wanted to give all my arguments for a new wrapper around 
> test_ioctl before replacing doioctl() with test_ioctl().

Not worth the effort :-)

We're talking about just two specific ioctls here, so just use test_ioctl instead of
doioctl.

Regards,

	Hans

> 
> Cheers,
> Quentin


