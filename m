Return-Path: <linux-media+bounces-42177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C32B5144D
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB42E542436
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03568314A8C;
	Wed, 10 Sep 2025 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFp44RWo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59388314B94;
	Wed, 10 Sep 2025 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501103; cv=none; b=uLtg7AtXxz9qNcKN97aOFl/sDXI1m+oC3Ca7Sa11d2hmaSRY97PWvUhO+vbn1Qi9dUnaYV/DCJL+HVuxBlXe3LcjAG9Nri8Ruk0jh8Jk5dNovPvm2iBm/anqfTl9vdyEE5E3RIAMzKh+7ZiQf+AchuoX51cJIhfq3/wmce5tpEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501103; c=relaxed/simple;
	bh=17GkzxBi+uY1roJuIWP3mnyaIhrL3E4cBDv6UBZcCxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+hOT2a/oTrXsemZLXUTDQ6tpvmDCjZrLwwUxt6FUa48rk+Ms2gDhk7Hkvgu43UdG2stBZ/zBdZ3QbawFQj1yoej5rQde0/HXiO1m2uEYVBMgFEPXJFtw2gWYiuzOOEJ9jjxaXuGhWFQ9KlKI/Nc/SmCXfD0NhC7GnUGQj3hQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFp44RWo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34985C4CEF0;
	Wed, 10 Sep 2025 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757501102;
	bh=17GkzxBi+uY1roJuIWP3mnyaIhrL3E4cBDv6UBZcCxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KFp44RWoJsCibcjLD9LpfUeFvyk2upGKMQfsCsUkUSaKk4+ZAs5nQrUdZk3FIyqUv
	 xz03NNSDOtUgy5vr2umbHnGaH1FiCU9DqkNuCLjbzrgu4F5MHHEfNJfyhEaJUaeMVo
	 yKZORRUjRk0jsSIbw+4fgiJQrn/Ao+nH4dBU2Lwxa0QYBLIhA2zX+NuVEjBvYsKMiR
	 NQ7LCOJVXNzfcWUs0Nvbqma/N8q5wLzLi4MeLYOYu6rJLV4mdxj87z9WaPASnDniFl
	 BSm4qdZpNLzSn53CIh0tedJpmxcqyzyE18CsuckutS7+N4BNOVf68aFuRAHLqqFFd3
	 RZDIOhr9GBcHg==
Message-ID: <4d04e9a4-03cd-459c-be0d-2dcf0c38da14@kernel.org>
Date: Wed, 10 Sep 2025 12:44:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] v4l2-subdev/int3472: Use "privacy" as con_id for the
 LED lookup
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Aleksandrs Vinarskis <alex@vinarskis.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250909144823.27540-1-hansg@kernel.org>
 <CAHp75VeMMKCTDNWhdZJH2F=cmUObbpoYcDUch2jpsLBBNs_EhQ@mail.gmail.com>
 <e3edf119-2dfe-4857-842d-fb2a52470eb9@kernel.org>
 <0706ca2e-cee8-8f3c-b652-ac0cf0f087f8@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <0706ca2e-cee8-8f3c-b652-ac0cf0f087f8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 10-Sep-25 11:09 AM, Ilpo Järvinen wrote:
> On Tue, 9 Sep 2025, Hans de Goede wrote:
>> On 9-Sep-25 7:27 PM, Andy Shevchenko wrote:
>>> On Tue, Sep 9, 2025 at 5:48 PM Hans de Goede <hansg@kernel.org> wrote:
>>>>
>>>> During DT-binding review for extending the V4L2 camera sensor privacy LED
>>>> support to systems using devicetree, it has come up that having a "-led"
>>>> suffix for the LED name / con_id is undesirable since it already is clear
>>>> that it is a LED:
>>>>
>>>> https://lore.kernel.org/linux-media/0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com/
>>>>
>>>> There was discussion about making an exception for "privacy-led" since
>>>> that is already used on x86/ACPI platforms, but I'm afraid that will set
>>>> a bad example which ends up being copy and pasted, so lets just drop
>>>> the "-led" prefix from the x86/ACPI side, which we can do since there
>>>> this is only an in-kernel "API".
>>>
>>> Since it's an in-kernel API, why can't these two be simply squashed?
>>
>> Good question, this is only a runtime thing when running on actual
>> hw with a privacy LED. So having this separately will not break
>> the build in the middle.
>>
>> As such it seems better to have this as 2 patches since it involves
>> 2 different subsystems.
> 
> But it's still only a single logical change, and not something with 
> monsterous complexity which would warrant splitting it at the subsystem 
> boundary.
>
> Or do you immediately know about something that would conflict with either 
> of these changes which would warrant splitting it per subsystem to avoid 
> merge challenges? If not, I agree with Andy this should just be squashed 
> into a single patch.

Ok, since both you and Andy are in favor of squashing the 2 patches
together I'll send out a v2 with the 2 patches squashed into
1 patch.

> Another question, is the "privacy_led" suffix added into pled.name still
> acceptable despite the "led" suffix?

That is just the name of the directory added under /sys/class/leds for
the LED some others, e.g. "phy0-led" also use a led suffix, so IMHO it
is fine to keep this as is.

Regards,

Hans




