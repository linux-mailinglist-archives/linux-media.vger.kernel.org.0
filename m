Return-Path: <linux-media+bounces-8433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D8B895B96
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 20:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D883B22FB4
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 18:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B3F15AD9D;
	Tue,  2 Apr 2024 18:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="DWioxHIz"
X-Original-To: linux-media@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D95815A48E;
	Tue,  2 Apr 2024 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712081952; cv=none; b=QyrdSA/qA8ueFNTMzl3LNcX/08G6n2oBStehJaZHjEm6GB9s1eiIrcbCyYba1OvBrsX6zYTszp6jv4OiByzcyJ+AjOn147omGeQ0mtfewHYvFb529ZKsG/SVEb+3oXhXX0I/rjjSqVta9i6TvLI2SNYV+JKj+W6X7rJm2fQO2C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712081952; c=relaxed/simple;
	bh=/w9MXgdMTxNQv40FLtRjoR1zTdQmpxiXVE83MAo9+yE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCd5+7sJTMvZPXS/W3oFNDIi4V3cdGJnK+RtDAL53EueTK45IMluqcSSKdvJKyxAN+zebIMyt/g+UMl+v+wXfrxxFuIqjE2tXpIYL43EpVD7BQzcOyjvUlBbxjbDVJQyWdXKVVmXP2Y/F+L239Mpz6C3J5fprSUzyEMiNpZwggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=DWioxHIz; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.64.232.220] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id 44D9220E8BDC;
	Tue,  2 Apr 2024 11:19:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 44D9220E8BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1712081945;
	bh=6CxfCTy2hvljG0KtnNfE1+yaCZUecQ3XXshhsgNm9Uw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DWioxHIzgS3pFY1uvHRovezlPv1RdDLcO2IT9/uxBMLrPIYLmaifrAV+YozRfQao5
	 rn7ZeC4782fWxJ68W1tiLG19p3MAqbIzFdJeAEkZWoLgMwgJMeelbVPX1Afg8R8m6u
	 UVRz1yN/74Ux892MYhIq1XY0LntOnyafVlWsWEQ4=
Message-ID: <75428d6c-c40a-43d8-84e3-f9ed161c37e2@linux.microsoft.com>
Date: Tue, 2 Apr 2024 11:19:03 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 03/14] drm/gma500,drm/i915: Make I2C terminology more
 inclusive
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:INTEL GVT-g DRIVERS (Intel GPU Virtualization)"
 <intel-gvt-dev@lists.freedesktop.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-4-eahariha@linux.microsoft.com>
 <87a5mcfbms.fsf@intel.com>
 <7d5e6ed0-ffe9-46c2-b3b4-a4a47c09532e@linux.microsoft.com>
 <87ttkjesx8.fsf@intel.com>
 <fde7a0da-1981-48db-95e2-96d45655c11c@linux.microsoft.com>
 <87o7aremfz.fsf@intel.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <87o7aremfz.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/2024 9:52 AM, Jani Nikula wrote:
> On Tue, 02 Apr 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>> On 4/2/2024 7:32 AM, Jani Nikula wrote:
>>> On Tue, 02 Apr 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>>> On 4/2/2024 12:48 AM, Jani Nikula wrote:
>>>>> On Fri, 29 Mar 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>>>>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>>>>>> with more appropriate terms. Inspired by and following on to Wolfram's
>>>>>> series to fix drivers/i2c/[1], fix the terminology for users of
>>>>>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>>>>>> in the specification.
>>>>>
>>>>> gma500 and i915 changes should be split. See MAINTAINERS.
>>>>>
>>>>> Might also split the i915 changes to smaller pieces, it's kind of
>>>>> random. And the changes here are not strictly related to I2C AFAICT, so
>>>>> the commit message should be updated.
>>>>>
>>>>> BR,
>>>>> Jani.
>>>>>
>>>>>
>>>>
>>>> <snip>
>>>>
>>>> I will split gma500 and i915 into their respective patches if possible in v2.
>>>>
>>>> Can you say more about the changes being "not strictly related to I2C"? My
>>>> heuristic was to grep for master/slave, and look in the surrounding context for
>>>> i2c-related terminology (i2c_pin, 7-bit address, struct i2c_adapter, i2c_bus, etc)
>>>> to confirm that they are i2c-related, then following the references around to
>>>> make the compiler happy. For e.g., I did not change the many references to bigjoiner
>>>> master and slave because I understood from context they were not i2c references.
>>>>
>>>> A couple examples would help me restrict the changes to I2C, since as mentioned in the
>>>> discussion on Wolfram's thread, there are places where migrating away from master/slave
>>>> terms in the code would conflict with the original technical manuals and reduce correlation
>>>> and understanding of the code.
>>>
>>> I guess I was looking at the VBT changes in intel_bios.c. Granted, they
>>> do end up being used as i2c addresses. No big deal.
>>>
>>> I think I'd expect the treewide i2c adapter changes to land first, via
>>> i2c, and subsequent cleanups to happen next, via individual driver
>>> trees. There's quite a bit of conflict potential merging this outside of
>>> drm-intel-next, and there's really no need for that.
>>>
>>> BR,
>>> Jani.
>>>
>>
>> Great! Just so I'm clear, do you still want the i915 changes split up more, along with them being
>> split off from gma500?
> 
> If we can merge the i915 changes via drm-intel-next, it's probably fine
> as a big i915 patch. Just the gma500 separated. (The struct
> i2c_algorithm change etc. necessarily has to go via I2C tree of course.)
> 
> BR,
> Jani.
> 

Got it. I'll send the split out in v1 (not v2 as mentioned earlier) since this is v0.

Thanks,
Easwar


