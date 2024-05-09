Return-Path: <linux-media+bounces-11194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8890F8C0E28
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 12:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A39761C213FE
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 10:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C943614B08F;
	Thu,  9 May 2024 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsZ8inD0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3AE14AD1B;
	Thu,  9 May 2024 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715250492; cv=none; b=uu/1lDR/rmXzvzOL0fAKvZ4rR5EWXyqRsoCxWKGnHLWrVwJsCcGF1TNm8cBtyzVCVP2yiPcBcOMVqsxlzBIPI7dgQpnol9TKhGOS/MR7URIVJ4L2BF53vSjzLXCuVhFsqS22IPVjrU6Y6CLlHVWZvXJ2OPJ3ihX2JopWSJAeq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715250492; c=relaxed/simple;
	bh=WyFpQ0k8HdqYaWkmfZ1u2cEJdO2FRTL/hHX9iaGsmUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFoUiEvlOCUkbdgLFfJ8gq3dYiwffsoaWGDNeNaCu5TuhgTW8ngPLD8+kjngXpC0lXXl5hae3tFlx77QNtJgbV0CD11gD0nJDwAiLg4ACTZ8F5D0HpOfr6euphOhQBqJZch6tprcpUfT20KAFaL82n7QioseSXsgd+Sxb4ueae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsZ8inD0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715250490; x=1746786490;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WyFpQ0k8HdqYaWkmfZ1u2cEJdO2FRTL/hHX9iaGsmUo=;
  b=ZsZ8inD0G5pRgZ/i36TpG/jQ2indCe2RJI+YZvUwHbIoQlxc5HlCGkSi
   L3nfOD8rchG9i9anorSm/um9HuNInIFTsbPQfj5r0Y7Y88w1Q9q04epKD
   jEpTSDlxLs935jNFXiA8FJ/YgLR+t+VBs3KL02jGE6Hz8iBSX07pQj3fj
   a8404/lnjkQ1n6/oRqVx44FCbbYGYfG18r2X7Y2OtSUf/qY76tapo34Yl
   ghSqKrD0iVefiqRpycBdzant48avg9d1OUQFZAnanXdarwHAg2s3knaKh
   CGhQzRxnNKbADDir8D87r5bfXRtY03YLRP3Fswci4JrWDY6711vIlIaHG
   A==;
X-CSE-ConnectionGUID: kSHLTh7jSxuEFN5oyAtb1Q==
X-CSE-MsgGUID: DPwd7Un2QlimJhSql+C9pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11323102"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="11323102"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 03:28:10 -0700
X-CSE-ConnectionGUID: n6mAF0lMSFOEwlyT/akNtw==
X-CSE-MsgGUID: phT5cmTqTSmNBKWBoblhUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="29274939"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 03:28:05 -0700
Message-ID: <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
Date: Thu, 9 May 2024 12:28:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.de>,
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
 <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/9/2024 12:12 PM, Shengjiu Wang wrote:
> On Thu, May 9, 2024 at 5:50 PM Amadeusz Sławiński
> <amadeuszx.slawinski@linux.intel.com> wrote:
>>
>> On 5/9/2024 11:36 AM, Shengjiu Wang wrote:
>>> On Wed, May 8, 2024 at 4:14 PM Amadeusz Sławiński
>>> <amadeuszx.slawinski@linux.intel.com> wrote:
>>>>
>>>> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
>>>>> On 06/05/2024 10:49, Shengjiu Wang wrote:
>>>>>> On Fri, May 3, 2024 at 4:42 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>>>>>>
>>>>>>> Em Fri, 3 May 2024 10:47:19 +0900
>>>>>>> Mark Brown <broonie@kernel.org> escreveu:
>>>>>>>
>>>>>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
>>>>>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>>>>>>>
>>>>>>>>>> There are still time control associated with it, as audio and video
>>>>>>>>>> needs to be in sync. This is done by controlling the buffers size
>>>>>>>>>> and could be fine-tuned by checking when the buffer transfer is done.
>>>>>>>>
>>>>>>>> ...
>>>>>>>>
>>>>>>>>> Just complementing: on media, we do this per video buffer (or
>>>>>>>>> per half video buffer). A typical use case on cameras is to have
>>>>>>>>> buffers transferred 30 times per second, if the video was streamed
>>>>>>>>> at 30 frames per second.
>>>>>>>>
>>>>>>>> IIRC some big use case for this hardware was transcoding so there was a
>>>>>>>> desire to just go at whatever rate the hardware could support as there
>>>>>>>> is no interactive user consuming the output as it is generated.
>>>>>>>
>>>>>>> Indeed, codecs could be used to just do transcoding, but I would
>>>>>>> expect it to be a border use case. See, as the chipsets implementing
>>>>>>> codecs are typically the ones used on mobiles, I would expect that
>>>>>>> the major use cases to be to watch audio and video and to participate
>>>>>>> on audio/video conferences.
>>>>>>>
>>>>>>> Going further, the codec API may end supporting not only transcoding
>>>>>>> (which is something that CPU can usually handle without too much
>>>>>>> processing) but also audio processing that may require more
>>>>>>> complex algorithms - even deep learning ones - like background noise
>>>>>>> removal, echo detection/removal, volume auto-gain, audio enhancement
>>>>>>> and such.
>>>>>>>
>>>>>>> On other words, the typical use cases will either have input
>>>>>>> or output being a physical hardware (microphone or speaker).
>>>>>>>
>>>>>>
>>>>>> All, thanks for spending time to discuss, it seems we go back to
>>>>>> the start point of this topic again.
>>>>>>
>>>>>> Our main request is that there is a hardware sample rate converter
>>>>>> on the chip, so users can use it in user space as a component like
>>>>>> software sample rate converter. It mostly may run as a gstreamer plugin.
>>>>>> so it is a memory to memory component.
>>>>>>
>>>>>> I didn't find such API in ALSA for such purpose, the best option for this
>>>>>> in the kernel is the V4L2 memory to memory framework I found.
>>>>>> As Hans said it is well designed for memory to memory.
>>>>>>
>>>>>> And I think audio is one of 'media'.  As I can see that part of Radio
>>>>>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
>>>>>> function is in DRM, part of HDMI function is in ALSA...
>>>>>> So using V4L2 for audio is not new from this point of view.
>>>>>>
>>>>>> Even now I still think V4L2 is the best option, but it looks like there
>>>>>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
>>>>>> a duplication of code (bigger duplication that just add audio support
>>>>>> in V4L2 I think).
>>>>>
>>>>> After reading this thread I still believe that the mem2mem framework is
>>>>> a reasonable option, unless someone can come up with a method that is
>>>>> easy to implement in the alsa subsystem. From what I can tell from this
>>>>> discussion no such method exists.
>>>>>
>>>>
>>>> Hi,
>>>>
>>>> my main question would be how is mem2mem use case different from
>>>> loopback exposing playback and capture frontends in user space with DSP
>>>> (or other piece of HW) in the middle?
>>>>
>>> I think loopback has a timing control,  user need to feed data to playback at a
>>> fixed time and get data from capture at a fixed time.  Otherwise there
>>> is xrun in
>>> playback and capture.
>>>
>>> mem2mem case: there is no such timing control,  user feeds data to it
>>> then it generates output,  if user doesn't feed data, there is no xrun.
>>> but mem2mem is just one of the components in the playback or capture
>>> pipeline, overall there is time control for whole pipeline,
>>>
>>
>> Have you looked at compress streams? If I remember correctly they are
>> not tied to time due to the fact that they can pass data in arbitrary
>> formats?
>>
>> From:
>> https://docs.kernel.org/sound/designs/compress-offload.html
>>
>> "No notion of underrun/overrun. Since the bytes written are compressed
>> in nature and data written/read doesn’t translate directly to rendered
>> output in time, this does not deal with underrun/overrun and maybe dealt
>> in user-library"
> 
> I checked the compress stream. mem2mem case is different with
> compress-offload case
> 
> compress-offload case is a full pipeline,  the user sends a compress
> stream to it, then DSP decodes it and renders it to the speaker in real
> time.
> 
> mem2mem is just like the decoder in the compress pipeline. which is
> one of the components in the pipeline.

I was thinking of loopback with endpoints using compress streams, 
without physical endpoint, something like:

compress playback (to feed data from userspace) -> DSP (processing) -> 
compress capture (send data back to userspace)

Unless I'm missing something, you should be able to process data as fast 
as you can feed it and consume it in such case.

Amadeusz

