Return-Path: <linux-media+bounces-38904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AFEB1B09C
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 11:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 229A83BCF81
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 09:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9443259C84;
	Tue,  5 Aug 2025 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuPY/vcg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A21D5CED;
	Tue,  5 Aug 2025 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754384534; cv=none; b=kemcJpLYlmWRBbCW+WIMBRVWnB9o1LzP0u7JFySYeHaxylQekx3UKDRaJA/41s8LAkBJZoqgjBqrmZx7PWNEbryQyOozPpH9WsrzhXsX1Ev28BwkGQH9Z4t/GiUBYJh1s9kGxYaJDVLGpqlhTPD0qQs4P6aJ6buvnJ6Dg86KWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754384534; c=relaxed/simple;
	bh=b9GN3Lz+pV7s7iyy8Oys2Xo7C8sJxv2XHxITouDycFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doU+oF4SrUFQ2jTW5G//mOxyw6L3H4M1X449PWoUU94B7c/IP/0S4wrBmMDSecRnzXFa2XBdpAuVatPMCTkvs6mEyLDJao5mK99MTJdZFDhQRPTHLAWcpMQE6YRcytuKkoDepmIkily0Z5QQ0dy2W1B+DorU8NxD0ReZeDU7oJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuPY/vcg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A81C4CEF0;
	Tue,  5 Aug 2025 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754384533;
	bh=b9GN3Lz+pV7s7iyy8Oys2Xo7C8sJxv2XHxITouDycFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RuPY/vcgxsp9GhYz888RiWGT8dG6adhsMDHJqsRcz8TOx2wgjZV5cxN19cUhLNn27
	 4KPmagJBMnN4JDSu2o5CSI2o1gbFRtfI0kJzwv2727xgLhriGJ7bBKTT10Y+4HvXAG
	 tLG28AxYTL/L3zXyJk413sMUTgL5Hm4iTwmawocZY7/4Fogg0dh7/ju21XvBm4yN9H
	 L3CRQryonzPPEbMTFozIdhW/gW17o0YCotatrzrMwrhZCOB9okmCuCKpDSHJhBIcPr
	 67BS0uzZAvvm0sc+RK6UoWl117jfMQmBgg9Fkvn2GXY7wgVSA3dC+D1ukb1chT2j/g
	 UD7yUG48RJKpg==
Message-ID: <cdb31c16-74c3-43e4-bf9f-da7f48ab8d46@kernel.org>
Date: Tue, 5 Aug 2025 11:02:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: Fix stack buffer overflow in
 gmin_get_var_int()
To: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, zepta
 <z3ptaa@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
 Thomas Andreatta <thomasandreatta2000@gmail.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250724080756.work.741-kees@kernel.org>
 <0b284755-1ae7-4f5f-8338-836dfcb1db59@kernel.org>
 <202507281745.0D675898@keescook>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <202507281745.0D675898@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kees,

On 29-Jul-25 2:46 AM, Kees Cook wrote:
> On Sat, Jul 26, 2025 at 02:24:51PM +0200, Hans de Goede wrote:
>> Hi Kees,
>>
>> On 24-Jul-25 10:08 AM, Kees Cook wrote:
>>> When gmin_get_config_var() calls efi.get_variable() and the EFI variable
>>> is larger than the expected buffer size, two behaviors combine to create
>>> a stack buffer overflow:
>>>
>>> 1. gmin_get_config_var() does not return the proper error code when
>>>    efi.get_variable() fails. It returns the stale 'ret' value from
>>>    earlier operations instead of indicating the EFI failure.
>>>
>>> 2. When efi.get_variable() returns EFI_BUFFER_TOO_SMALL, it updates
>>>    *out_len to the required buffer size but writes no data to the output
>>>    buffer. However, due to bug #1, gmin_get_var_int() believes the call
>>>    succeeded.
>>>
>>> The caller gmin_get_var_int() then performs:
>>> - Allocates val[CFG_VAR_NAME_MAX + 1] (65 bytes) on stack
>>> - Calls gmin_get_config_var(dev, is_gmin, var, val, &len) with len=64
>>> - If EFI variable is >64 bytes, efi.get_variable() sets len=required_size
>>> - Due to bug #1, thinks call succeeded with len=required_size
>>> - Executes val[len] = 0, writing past end of 65-byte stack buffer
>>>
>>> This creates a stack buffer overflow when EFI variables are larger than
>>> 64 bytes. Since EFI variables can be controlled by firmware or system
>>> configuration, this could potentially be exploited for code execution.
>>>
>>> Fix the bug by returning proper error codes from gmin_get_config_var()
>>> based on EFI status instead of stale 'ret' value.
>>>
>>> The gmin_get_var_int() function is called during device initialization
>>> for camera sensor configuration on Intel Bay Trail and Cherry Trail
>>> platforms using the atomisp camera stack.
>>>
>>> Reported-by: zepta <z3ptaa@gmail.com>
>>> Closes: https://lore.kernel.org/all/CAPBS6KoQyM7FMdPwOuXteXsOe44X4H3F8Fw+y_qWq6E+OdmxQA@mail.gmail.com
>>> Fixes: 38d4f74bc148 ("media: atomisp_gmin_platform: stop abusing efivar API")
>>> Signed-off-by: Kees Cook <kees@kernel.org>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hansg@kernel.org>
>>
>> I've already send an atomisp pull-request for 6.17 out
>> and this is already in media-committers/next now and
>> the media subsystem is typically not good in merging
>> fixes just before the merge window.
>>
>> Kees, the file touched here is unchanged in
>> media-committers/next vs Linus' latest master, can you
>> send this fix to Linus yourself ?
> 
> I apologize; this slipped through the cracks. Shall I take it for -rc2,
> or do you want to snag it?

I'm just back from vacation and I see you've send this
to Linus already:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/staging/media/atomisp?id=ee4cf798202d285dcbe85e4467a094c44f5ed8e6

Which is great, thank you.

Regards,

Hans


