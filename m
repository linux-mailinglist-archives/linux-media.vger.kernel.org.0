Return-Path: <linux-media+bounces-43786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C20BBE01A
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 14:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 00BA44ED002
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 12:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3583726C3A5;
	Mon,  6 Oct 2025 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGXr+mhv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9230E1FBC92
	for <linux-media@vger.kernel.org>; Mon,  6 Oct 2025 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759753150; cv=none; b=f2pgR6yx3qp1Oj2xttI7wx4kaz9s2OaIDI5aMNQ+hLLvskWNEpx1lS+LHvIeHWPe59vNrsinwX42mpvzZCfGY5aND5bVQhq4JZm1G1nUcB7uO3lZNysBTR5Y95sO/EvFTO5kIyVnO/HvGRQGWs2ao3K749kMLbjZ+zKzNpbDL7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759753150; c=relaxed/simple;
	bh=IRPy7n8fi908AXqycEr8w5KbgC+TXqNXXaWQDAjoxaU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=LZ4oYbKM7aiX9QuH+MHtA0aSKB7HLgvYzNWsB2dDGT0HsVbX1/ELz+4SUdksTVbpjX2W8n6ofJ38SpDlQf4pwOY0/vgAzKfPYBKU9eAPFBge0dpxoQJmHIHMqxuUEwC9D+9e+S5RqMowOsLn5PkQ3XNGdLY4RIugjfpOqXYhp30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGXr+mhv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A269CC4CEF5;
	Mon,  6 Oct 2025 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759753150;
	bh=IRPy7n8fi908AXqycEr8w5KbgC+TXqNXXaWQDAjoxaU=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=VGXr+mhvr/cP8TL54e+knYbwcPWtaUAg+UJk0gFDVGNO73VntNR4q6Jn9FqSsuIjU
	 vfQvdK7Rf3dxfx6SpTAIk+uwvc7dQFbYMX8kUaZezo/BBJEbEp8GEl7Lnm2flZAVal
	 Qf8hY2g4z3yMUWVuzUxZhCGjME5+6mVCVkKVQxfyM54v3IzP/dVTQiEvdOI6wHstyg
	 Yla4oJRwKU8LUJiRiD6z73mtu0JoCbM0sW/z2JcuY71mnWS35fBd52Qr2LjzrBD2K5
	 r+6LSQxrm7CtuLi5lpgv3bze7Jy4f4NYPiieaE3bUK4pPK6Bmdgrac2CEC2CW1YjFU
	 gR3M5MgfGKufA==
Message-ID: <7f204b8d-c2bd-4d81-b8de-b1fa50c6f091@kernel.org>
Date: Mon, 6 Oct 2025 14:19:07 +0200
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
Content-Language: en-US, nl
In-Reply-To: <5734ec94-ec46-47b6-993b-5a1ac1e41767@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/10/2025 13:37, Quentin Schulz wrote:
> Hi Hans,
> 
> On 10/1/25 11:17 AM, Hans Verkuil wrote:
>> [You don't often get email from hverkuil+cisco@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On 05/09/2025 14:19, Quentin Schulz wrote:
>>> Some ioctls are optional and the logic around it handle it nicely,
>>> except that doioctl (via doioctl_name) sets app_result static variable
>>> to -1 if the ioctl fails.
>>>
>>> However, both rds-ctl and v4l2-ctl exit code is from app_result. So it
>>> is possible to have those tools perform the expected task (albeit
>>> failing to use an optional ioctl) and still report to the user that it
>>> failed to do so.
>>>
>>> Let's add a new function doioctl_opt which allows to NOT set the
>>> app_result variable when the ioctl fails.
>>>
>>> This migrates two ioctl VIDIOC_SUBDEV_S_CLIENT_CAP and
>>> VIDIOC_SUBDEV_QUERYCAP to be optional ioctls.
>>
>> Actually, those ioctls must be present, unless you run an old kernel, but
>> they've been around since kernel 6.4.
>>
> 
> Yes, I am using a 6.1 kernel, which is supported until Dec. 2027, c.f. 
> https://www.kernel.org/releases.html
> 
> 5.10 is also supported until Dec. 2026.
> 
>> I'm dropping this series as this isn't quite the way to do this.
>>
> 
> Could you explain what is the issue with those patches so I can suggest 
> something else?
> 
>> Perhaps you should explain the problem you encounter first (and mention
>> the kernel version you are using)?
>>
> 
> Run v4l-utils on an older kernel (6.1 for example) and it'll try to use 
> the ioctl that isn't supported. Since it's optional (the return code 
> isn't checked directly) it'll happily actually do what's expected from 
> it but the program will end with a non-zero exit code, thus failing my 
> CI tests while still actually performing what it is requested to do. 
> This is due to the failing ioctl setting app_result global variable but 
> the failing calls not actually being checked right after in the calling 
> function so the program continues as if everything went well but the 
> last line of the main function (std::exit(options[OptAll] ? 0 : 
> app_result);) actually returns the exit code matching app_result value, 
> which is set when the (deemed optional) ioctl fails.
> 
> I use v4l2-ctl to set a test pattern on a camera and now my CI simply 
> doesn't pass anymore on Trixie because of that. For now, I ignore the 
> exit code of v4l2-ctl -c test_pattern=1 and validate it actually was run 
> by running v4l2-ctl -C test_pattern afterwards (but still not checking 
> the exit code of this command as it's still returning that it failed).
> 
> Kernel is 6.1.

Isn't debian trixie on 6.12? Why are you on 6.1?

Honest question, I just want to better understand why you are on that old kernel.

Anyway, the application result is of limited use: it is never tested by me and
failing on non-existing ioctls is probably not a good idea anyway. v4l2-ctl calls
lots of ioctls: if present, then do A, if not, then do B (or nothing). And each
time an ioctl fails fails with ENOTTY app_result would be set.

Going through the v4l2-ctl code and checking all places where an ioctl can be
optional would be a substantial amount of work and is probably hard to get right.

It might be better to only set app_result if the ioctl result is < 0 && errno != ENOTTY.
I.e. missing ioctls are just ignored as being 'normal' behavior. I think that's
reasonable.

Regards,

	Hans

