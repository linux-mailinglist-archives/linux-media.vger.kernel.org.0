Return-Path: <linux-media+bounces-13180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE21E906909
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 11:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C48001C2402F
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDFB13F449;
	Thu, 13 Jun 2024 09:38:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6726013D608
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718271532; cv=none; b=iFTFVoP8KXdbaOJkrEdhE/BXeCrb5eSJ0VIuHF2pkAjg3iabrA8+REkQXJoJjnSXgkXWUA86n+REbaDxzakm0gjQpzKs2NFIh9E1STY8AUc2BFo+J3GOcm108f04swYesVGTMI6cmAK4RTJ4ndvgsFGZ1R2apn5UkguAis+GJXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718271532; c=relaxed/simple;
	bh=rijnp4UySRa/g/X82KiXd1qqIsvD48La1Qes9vF8otI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LmMopLq3zlJfWS270ih781Xw7ugotr650I5b2Pa4h3POQUxtCtWniQ793xQL5POMpirad9En4PZ8tgWxGqaBWFzdhm2rhZGhV/txsDAAYGa5H5V6httjexnfJVc6YfxkVrHe6Ul5s7xLlG9dcr6/vpWpZz9mCFIQU23E83A7zT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9357BC2BBFC;
	Thu, 13 Jun 2024 09:38:49 +0000 (UTC)
Message-ID: <475341fe-39bf-4104-bcf1-c4fd7ff73a68@xs4all.nl>
Date: Thu, 13 Jun 2024 11:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Hidenori Kobayashi <hidenorik@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
 <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
 <20240612095448.1e99b751@coco.lan>
 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
 <20240612083430.GE28989@pendragon.ideasonboard.com>
 <20240612224406.41dd88fc@coco.lan>
 <20240612205249.GB11102@pendragon.ideasonboard.com>
 <ae8cc9b0-2792-4991-83b5-d6a5e50f2d2e@xs4all.nl>
 <20240613091213.GC7291@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240613091213.GC7291@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2024 11:12, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Thu, Jun 13, 2024 at 09:08:55AM +0200, Hans Verkuil wrote:
>> On 12/06/2024 22:52, Laurent Pinchart wrote:
>>> On Wed, Jun 12, 2024 at 10:44:06PM +0200, Mauro Carvalho Chehab wrote:
>>>> Em Wed, 12 Jun 2024 11:34:30 +0300 Laurent Pinchart escreveu:
>>>>
>>>>> Focussing on this topic, if we're brainstorming memory management for
>>>>> media devices, I'd like to throw in a controversial idea. In addition to
>>>>> being clearer on the fact that USERPTR is deprecated, I would like to
>>>>> deprecate MMAP too and only focus on DMABUF. I believe Linux needs a
>>>>> centralized buffer allocator, instead of having multiple allocation APIs
>>>>> scattered in different places. There are design ideas in gralloc that we
>>>>> could benefit from.
>>>>
>>>> Deprecating USERPTR is doable, as not many apps use it, and they're
>>>> mostly focused on complex camera/ARM scenario. Now, deprecating MMAP at 
>>>> V4L2 core is a different history: lots of different userspace programs,
>>>> including browsers and proprietary apps like zoom, etc. rely on MMAP
>>>> support. We can only consider deprecating MMAP once applications switch 
>>>> to DMABUF.
>>>
>>> Deprecating doesn't mean dropping it right away, it means telling
>>> application developers that DMABUF is the recommended way. We will still
>>> have to support MMAP for a long time, including fixing bugs in it, as
>>> that will be a long transition. And it first requires solving the
>>> problem of centralizing allocation for DMABUF. It won't happen
>>> overnight, but I'm trying to gather support for the idea, and get people
>>> to collaborate on solving the technical problems that are currently
>>> blocking this long term evolution. If the media subsystem endorsed the
>>> effort, basically saying publicly that we are fine deprecating MMAP in
>>> principle once a good replacement will be available, it may help. I
>>> don't expect the deprecation to happen before at least two years, and
>>> the removal from the kernel would probably take another 10 to 15 years
>>> :-)
>>
>> IMHO you cannot removed MMAP support: it is the only streaming I/O method
>> that is supported by all drivers, whereas DMABUF isn't. And many, many userspace
>> applications use that. Nor does it pose problems: it just works.
> 
> I may have failed to get my point across properly, so I'll try again :-)
> 
> What I would like to do is
> 
> 1. Explore how we can implement a centralized allocator that
> applications can use on any Linux system to provide dmabuf instances.

Would be nice.

> 
> 2. Implement that allocator.

Good.

2.5: start adding DMABUF support to all drivers that do not yet
support this.

> 
> 3. Deprecate MMAP, meaning documenting that users of V4L2 should use the
> centralized allocator and DMABUF. No code change in V4L2, no removal of
> MMAP, and bugs in MMAP support would keep being addressed.
> 
> 4. 5-10 years later, start scheduling MMAP removal, as in setting a date
> for it.
> 
> 5. 5-10 years more in the future, drop MMAP when nobody will be using it
> anymore.

3-5: seems pointless to me. It would break many userspace applications.

Frankly, MMAP just works, and has since forever. Perhaps at some point
we might switch to dmabufs internally to vb2 (that would require that
the driver can call that central allocator!) if that would simplify
matters, but in the uAPI we need to keep MMAP.

Regards,

	Hans

> 
> It's phases 1 to 3 that I'm the most interested in. 4 and 5 are just
> about dropping code *when* MMAP isn't used anymore *iff* that ever
> happens.
> 
>> USERPTR support is another matter: there have been problems with it, and
>> the vb2 code is hard to understand and to support.
>>
>> I wouldn't shed a tear if it disappears. The strategy would be to first
>> make sure any driver supporting USERPTR also supports DMABUF, and then
>> put USERPTR under a kernel config option. Initially it would default to y,
>> but issue a warning, and later (after a few years) it can default to n
>> and eventually be removed.
> 


