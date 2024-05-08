Return-Path: <linux-media+bounces-11125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ECD8BF83C
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 10:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6E471C21163
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 08:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFEF40BE6;
	Wed,  8 May 2024 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdMWU51v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B543D96D;
	Wed,  8 May 2024 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715156045; cv=none; b=UdpJYmLAup3ncp05TV6S/T5LT0rAkjdw1LlOuH7DGcRmPfCFP4Gm6LaET1Tu9HCBdyZOEQLeZyoDKq+cTACi3P/dggofDlrTAcVMXbmWgVY37LHe2e7Xp1WyQ2UOmJ84Rv+ri1fIOpuYgAUe9QktM6CCRJZQ96FYAZRq/ehzfz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715156045; c=relaxed/simple;
	bh=o6dYzqcug6bjp99QH0Xc2b/Mh3Ae4lgbbIbqMs9s1So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oh3Wv60PYCNrWL8DeU+8+cxpLs8UR75geEpMBfGvwedwFTVP+WPcwLcqQl/lXzoVcw+W6TqUvz2QR4yQb/VjyateSFZtNIWXxeYjoj+iilryLMuFshwZhtjRBz1VE3Ma4ZQyDhyleoGdc3sDyO6joNBUpHSvmefHTzA79+NCARo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdMWU51v; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715156044; x=1746692044;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o6dYzqcug6bjp99QH0Xc2b/Mh3Ae4lgbbIbqMs9s1So=;
  b=SdMWU51vcGdHM1Fu0VptfM0VidftdSgDWsvc0BsKsSHeN+i0HOhv+3NQ
   jWtgQs/iO+iBHgDVlM2SeWNdfHSVdMNN50UMoGKhKcRpdegG8POHMLQZM
   8NkEWJx8eSqL62QCisRw4m1goj5isl5FG5KjlImYvjhZZwkv37PRpmaeG
   5PXk49Kw/+lP0GdZF0rJ1Ss7U+A29rWw05C6rDLzPc0vgGkHmHVItMQMH
   +Riyk5QekICnDombbGfBWShIO0jtRTQHJYqEH53cyMdx+dDhMA5EA4LNu
   Nr3hLzR1F2FRwjAImnJo1+s0woqI3XRSTUyumWWIeHkebv91yG/D8jylW
   A==;
X-CSE-ConnectionGUID: zsA1Mx7nRme6e3JDu9f9Eg==
X-CSE-MsgGUID: srTM+5bFQaO9GcL9da2dKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28474497"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="28474497"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 01:14:04 -0700
X-CSE-ConnectionGUID: aABURBGITHyA0xz96lfbdA==
X-CSE-MsgGUID: 8uRx8TfuRU256ZN4Nutk6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="59662273"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 01:13:57 -0700
Message-ID: <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
Date: Wed, 8 May 2024 10:13:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk> <20240430172752.20ffcd56@sal.lan>
 <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk> <87sez0k661.wl-tiwai@suse.de>
 <20240502095956.0a8c5b26@sal.lan> <20240502102643.4ee7f6c2@sal.lan>
 <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk> <20240503094225.47fe4836@sal.lan>
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> On 06/05/2024 10:49, Shengjiu Wang wrote:
>> On Fri, May 3, 2024 at 4:42 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>>
>>> Em Fri, 3 May 2024 10:47:19 +0900
>>> Mark Brown <broonie@kernel.org> escreveu:
>>>
>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>>>
>>>>>> There are still time control associated with it, as audio and video
>>>>>> needs to be in sync. This is done by controlling the buffers size
>>>>>> and could be fine-tuned by checking when the buffer transfer is done.
>>>>
>>>> ...
>>>>
>>>>> Just complementing: on media, we do this per video buffer (or
>>>>> per half video buffer). A typical use case on cameras is to have
>>>>> buffers transferred 30 times per second, if the video was streamed
>>>>> at 30 frames per second.
>>>>
>>>> IIRC some big use case for this hardware was transcoding so there was a
>>>> desire to just go at whatever rate the hardware could support as there
>>>> is no interactive user consuming the output as it is generated.
>>>
>>> Indeed, codecs could be used to just do transcoding, but I would
>>> expect it to be a border use case. See, as the chipsets implementing
>>> codecs are typically the ones used on mobiles, I would expect that
>>> the major use cases to be to watch audio and video and to participate
>>> on audio/video conferences.
>>>
>>> Going further, the codec API may end supporting not only transcoding
>>> (which is something that CPU can usually handle without too much
>>> processing) but also audio processing that may require more
>>> complex algorithms - even deep learning ones - like background noise
>>> removal, echo detection/removal, volume auto-gain, audio enhancement
>>> and such.
>>>
>>> On other words, the typical use cases will either have input
>>> or output being a physical hardware (microphone or speaker).
>>>
>>
>> All, thanks for spending time to discuss, it seems we go back to
>> the start point of this topic again.
>>
>> Our main request is that there is a hardware sample rate converter
>> on the chip, so users can use it in user space as a component like
>> software sample rate converter. It mostly may run as a gstreamer plugin.
>> so it is a memory to memory component.
>>
>> I didn't find such API in ALSA for such purpose, the best option for this
>> in the kernel is the V4L2 memory to memory framework I found.
>> As Hans said it is well designed for memory to memory.
>>
>> And I think audio is one of 'media'.  As I can see that part of Radio
>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
>> function is in DRM, part of HDMI function is in ALSA...
>> So using V4L2 for audio is not new from this point of view.
>>
>> Even now I still think V4L2 is the best option, but it looks like there
>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
>> a duplication of code (bigger duplication that just add audio support
>> in V4L2 I think).
> 
> After reading this thread I still believe that the mem2mem framework is
> a reasonable option, unless someone can come up with a method that is
> easy to implement in the alsa subsystem. From what I can tell from this
> discussion no such method exists.
> 

Hi,

my main question would be how is mem2mem use case different from 
loopback exposing playback and capture frontends in user space with DSP 
(or other piece of HW) in the middle?

Amadeusz


