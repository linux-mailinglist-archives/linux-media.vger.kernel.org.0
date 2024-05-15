Return-Path: <linux-media+bounces-11470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5619C8C6515
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 12:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D655E281938
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 10:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC855FB8B;
	Wed, 15 May 2024 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="iGeHzCOJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEB15D738;
	Wed, 15 May 2024 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715770008; cv=none; b=XDe3ZJNY4g+NeQ9QuBDX7h2Y16mZobSt7LU7blWFuGuxfPhPjs/rQQm8SEJXLz77PcuPNq6s3pI8i4r8+K1XPMN9H41aGgXrlqGmoeqwvQvvHY3+Bhen09Jl51uy4AJTZ+o0yrQ22lXIhJl9+Zfdo42/t+siCxqeTjFP1zhYiAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715770008; c=relaxed/simple;
	bh=Q4+Nii8csKgMfhuQxtX4PRb051LbYjs1O8cLWVVvROk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Us/1H6llygiwltOMVAukFcOi+Eyw2UFvJbSwicI5fhX/KJNycO5epcWBelsDqss69zZEPlGNsdKrDBEWTg+e6DqOeQFpLw/aXrkhywtJyGnd+dsRSqpEHLPLc4w/6m78lYcNoJK9XLV74CHVsARuVXANgP65DKv6mB8WJExsWPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=iGeHzCOJ; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DFE7145BF;
	Wed, 15 May 2024 12:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DFE7145BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1715769999; bh=XXOqLAWWRGuyFhS40r5V6s/LmOYYtDla+WSjRwZ7M6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iGeHzCOJ6XGrMTV9X4eNzJEpAxb3m3GmpR/0Adx4MT6Bay3LgiB9cVIlSbqw3fzlF
	 cKiPnmeTuJ6wpT7xjYDA/1nDgFtQ+Wrd0dqhJ9Ee84VTGHO2+y/2ZgMGgoSehS/5td
	 PhE3A+D5BHQXjJ23w8ouP8hYCoBIpZei3rf+LYR4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 15 May 2024 12:46:19 +0200 (CEST)
Message-ID: <e63ec6c8-7da7-4b87-b7ff-a71ff12dcfc1@perex.cz>
Date: Wed, 15 May 2024 12:46:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Takashi Iwai <tiwai@suse.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Shengjiu Wang
 <shengjiu.wang@gmail.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
 <20240503094225.47fe4836@sal.lan>
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
 <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
 <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
 <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
 <c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl>
 <8a6f84ac-5813-4954-b852-84f5118e607c@perex.cz> <87o7975qcw.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <87o7975qcw.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15. 05. 24 12:19, Takashi Iwai wrote:
> On Wed, 15 May 2024 11:50:52 +0200,
> Jaroslav Kysela wrote:
>>
>> On 15. 05. 24 11:17, Hans Verkuil wrote:
>>> Hi Jaroslav,
>>>
>>> On 5/13/24 13:56, Jaroslav Kysela wrote:
>>>> On 09. 05. 24 13:13, Jaroslav Kysela wrote:
>>>>> On 09. 05. 24 12:44, Shengjiu Wang wrote:
>>>>>>>> mem2mem is just like the decoder in the compress pipeline. which is
>>>>>>>> one of the components in the pipeline.
>>>>>>>
>>>>>>> I was thinking of loopback with endpoints using compress streams,
>>>>>>> without physical endpoint, something like:
>>>>>>>
>>>>>>> compress playback (to feed data from userspace) -> DSP (processing) ->
>>>>>>> compress capture (send data back to userspace)
>>>>>>>
>>>>>>> Unless I'm missing something, you should be able to process data as fast
>>>>>>> as you can feed it and consume it in such case.
>>>>>>>
>>>>>>
>>>>>> Actually in the beginning I tried this,  but it did not work well.
>>>>>> ALSA needs time control for playback and capture, playback and capture
>>>>>> needs to synchronize.  Usually the playback and capture pipeline is
>>>>>> independent in ALSA design,  but in this case, the playback and capture
>>>>>> should synchronize, they are not independent.
>>>>>
>>>>> The core compress API core no strict timing constraints. You can eventually0
>>>>> have two half-duplex compress devices, if you like to have really independent
>>>>> mechanism. If something is missing in API, you can extend this API (like to
>>>>> inform the user space that it's a producer/consumer processing without any
>>>>> relation to the real time). I like this idea.
>>>>
>>>> I was thinking more about this. If I am right, the mentioned use in gstreamer
>>>> is supposed to run the conversion (DSP) job in "one shot" (can be handled
>>>> using one system call like blocking ioctl).  The goal is just to offload the
>>>> CPU work to the DSP (co-processor). If there are no requirements for the
>>>> queuing, we can implement this ioctl in the compress ALSA API easily using the
>>>> data management through the dma-buf API. We can eventually define a new
>>>> direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or so to allow
>>>> handle this new data scheme. The API may be extended later on real demand, of
>>>> course.
>>>>
>>>> Otherwise all pieces are already in the current ALSA compress API
>>>> (capabilities, params, enumeration). The realtime controls may be created
>>>> using ALSA control API.
>>>
>>> So does this mean that Shengjiu should attempt to use this ALSA approach first?
>>
>> I've not seen any argument to use v4l2 mem2mem buffer scheme for this
>> data conversion forcefully. It looks like a simple job and ALSA APIs
>> may be extended for this simple purpose.
>>
>> Shengjiu, what are your requirements for gstreamer support? Would be a
>> new blocking ioctl enough for the initial support in the compress ALSA
>> API?
> 
> If it works with compress API, it'd be great, yeah.
> So, your idea is to open compress-offload devices for read and write,
> then and let them convert a la batch jobs without timing control?
> 
> For full-duplex usages, we might need some more extensions, so that
> both read and write parameters can be synchronized.  (So far the
> compress stream is a unidirectional, and the runtime buffer for a
> single stream.)
> 
> And the buffer management is based on the fixed size fragments.  I
> hope this doesn't matter much for the intended operation?

It's a question, if the standard I/O is really required for this case. My 
quick idea was to just implement a new "direction" for this job supporting 
only one ioctl for the data processing which will execute the job in "one 
shot" at the moment. The I/O may be handled through dma-buf API (which seems 
to be standard nowadays for this purpose and allows future chaining).

So something like:

struct dsp_job {
    int source_fd;     /* dma-buf FD with source data - for dma_buf_get() */
    int target_fd;     /* dma-buf FD for target data - for dma_buf_get() */
    ... maybe some extra data size members here ...
    ... maybe some special parameters here ...
};

#define SNDRV_COMPRESS_DSPJOB _IOWR('C', 0x60, struct dsp_job)

This ioctl will be blocking (thus synced). My question is, if it's feasible 
for gstreamer or not. For this particular case, if the rate conversion is 
implemented in software, it will block the gstreamer data processing, too.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.


