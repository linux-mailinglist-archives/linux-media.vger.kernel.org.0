Return-Path: <linux-media+bounces-36441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 632A7AEFB39
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79989481A15
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C66275AF5;
	Tue,  1 Jul 2025 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nsz8DVWj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881B826FA59;
	Tue,  1 Jul 2025 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378089; cv=none; b=AbKgh54cfIO2FigyF6S41ZNk0YgkcQAn6xlK9KnonolOazPWixg87BHuVZEhcc/cmAroqjNeaLSh0TgZdtoIohqJDHi6xA/ma9erI9eous/UVxR1f4PSq+3702rxTIz9N+v4TYzVebI96KPdEC+fmXkDIvr+lXX6ZfppBN5MWZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378089; c=relaxed/simple;
	bh=ZL/u65dIbxosbqEkEvyApJed1MUepl7ko0Ds7XvleG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjntNQU9euv0NrL28dKZfdT2veA0jtOMUPV1aHn3h+lziv//ckk+ZG5903Tnd6qukqKBOPlny7Tgikt4IjW89G/CWo33TrAxXoH9cVsXH3Qb48TLGNxspS7VBcr17GcEqPH2l1AszUi2ROGC4fufemA9tkWxcyeLMtSS8sfXn94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nsz8DVWj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C603BC4CEEB;
	Tue,  1 Jul 2025 13:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751378089;
	bh=ZL/u65dIbxosbqEkEvyApJed1MUepl7ko0Ds7XvleG0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nsz8DVWjSFKbqjow7W6o1m10uyyNr8ckimVR/Zp/X3duRAgeYnFGLj+WfAClnWxFm
	 bivyyT/qnOjyP4sfFsEEegvR7vcg7k8VOHxXiXYV3ssXDXte+YtRAqwP3tD6IfK8MS
	 Mrt1JLhH2zajYEsV3n9jQ/4LmmD47quFngMft/WipvTT8ZUitgvwd0bnVB0lTeK4h4
	 P+txvfbJ2FmzsVDKS5hQTsRovvNqYRALDXS+kMQwGM3ejlPp5Y20KuJY7WHjuJpoUj
	 r+V33xOBw6QSqwDWvcl7BFjSM7qftWk/NxdXJmp6z+60potRDTENv2VeDHqeNBKNsY
	 HXHg6odR75Mgg==
Message-ID: <836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org>
Date: Tue, 1 Jul 2025 15:54:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org,
 hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, skhan@linuxfoundation.com,
 dan.carpenter@linaro.org
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
 <aGPYZhK65LaD0wVO@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aGPYZhK65LaD0wVO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1-Jul-25 2:45 PM, Andy Shevchenko wrote:
> On Tue, Jul 01, 2025 at 02:58:43PM +0300, Abdelrahman Fekry wrote:
>> Hello Andy,
>> On Sat, Jun 28, 2025 at 10:52 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Sat, Jun 28, 2025 at 8:26 AM Abdelrahman Fekry
>>> <abdelrahmanfekry375@gmail.com> wrote:
> 
>>>> The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
>>>> before key initialization steps like kmem_cache_create(),
>>>> kmem_cache_alloc(), and __bo_init().
>>>>
>>>> This means that if any of these steps fail, the flag remains set,
>>>> misleading other parts of the driver (e.g. hmm_bo_alloc())
>>>> into thinking the device is initialized. This could lead
>>>> to undefined behavior or invalid memory use.
>>>
>>> Nice. Can you make some fault injection (temporary by modifying the
>>> code to always fail, for example) and actually prove this in practice?
>>> If so, the few (important) lines from the given Oops would be nice to
>>> have here.
> 
>> I have been trying to test it without having any intel atomisp
>> hardware and failed continuously, do you have any tips or maybe some
>> resources on how i can test this driver.
> 
> So, the easiest way as I can see it is to ask people who possess the HW to
> test, but you need to provide a testing patch (which can be applied on top
> of this one, for example).

I don't think it is worth testing the error path here,
the old code is obviously wrong.

What is interesting here is to see if the extra call to hmm_init()
in __hmm_alloc() is necessary at all.

And obviously hmm_init() needs to propagate the error return
from hmm_bo_init() right away instead of continuing if nothing
was wrong and then only returning the error at the end.

So it seems that there plenty of cleanup to do around this
without needing error injection to test all paths.

Actually I'm pretty sure that there will be quite a few
error-handling paths with bugs in the atomisp code given
its overall quality. But lets clean things up first, that
should make addressing any such cases easier.

Regards,

Hans


