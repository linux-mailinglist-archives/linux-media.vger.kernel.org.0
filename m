Return-Path: <linux-media+bounces-11463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B060A8C6380
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 11:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E22931C224F6
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 09:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE6C57CAB;
	Wed, 15 May 2024 09:17:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC8957C94;
	Wed, 15 May 2024 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715764638; cv=none; b=XfUTa9J+VDKQxBNvZG4sWSNPxpuO034pDeTpOVUrxdeUOkWJR9G0o5/9uNtGNL90NwuVIH/TtL1ku7BjBfeYXiTr7zYPuDm/3q7GvLjLmA5Sx4FNhBZ/OArKs2Skgxtn78YJqrHwIKPWRPvIx2T03Eh5Qwqdh6pQUQ6nky0iZYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715764638; c=relaxed/simple;
	bh=vLCdWJiZuxlL9/ekQEzEY6Py6sNMfC/b3bvB1D5ygPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/wqSmMqzNE7wfmSUAHbskRHbEM/CTKhj4s5wf+12m3p1eGe1zwWYaU9dC88atLvpnBDGa7wlxjQ0JEqmjrFSRt3X3D6PSe0iw6lvBFvbjd+ffQdGtL1TnlWr10Fc9wf8mOZOJLk4DF7zsRkoa5aUlSIL+9YgOnl4m6GIkY8XFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579ABC116B1;
	Wed, 15 May 2024 09:17:14 +0000 (UTC)
Message-ID: <c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl>
Date: Wed, 15 May 2024 11:17:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang
 <shengjiu.wang@gmail.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
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
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
 <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
 <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jaroslav,

On 5/13/24 13:56, Jaroslav Kysela wrote:
> On 09. 05. 24 13:13, Jaroslav Kysela wrote:
>> On 09. 05. 24 12:44, Shengjiu Wang wrote:
>>>>> mem2mem is just like the decoder in the compress pipeline. which is
>>>>> one of the components in the pipeline.
>>>>
>>>> I was thinking of loopback with endpoints using compress streams,
>>>> without physical endpoint, something like:
>>>>
>>>> compress playback (to feed data from userspace) -> DSP (processing) ->
>>>> compress capture (send data back to userspace)
>>>>
>>>> Unless I'm missing something, you should be able to process data as fast
>>>> as you can feed it and consume it in such case.
>>>>
>>>
>>> Actually in the beginning I tried this,  but it did not work well.
>>> ALSA needs time control for playback and capture, playback and capture
>>> needs to synchronize.  Usually the playback and capture pipeline is
>>> independent in ALSA design,  but in this case, the playback and capture
>>> should synchronize, they are not independent.
>>
>> The core compress API core no strict timing constraints. You can eventually0
>> have two half-duplex compress devices, if you like to have really independent
>> mechanism. If something is missing in API, you can extend this API (like to
>> inform the user space that it's a producer/consumer processing without any
>> relation to the real time). I like this idea.
> 
> I was thinking more about this. If I am right, the mentioned use in gstreamer 
> is supposed to run the conversion (DSP) job in "one shot" (can be handled 
> using one system call like blocking ioctl).  The goal is just to offload the 
> CPU work to the DSP (co-processor). If there are no requirements for the 
> queuing, we can implement this ioctl in the compress ALSA API easily using the 
> data management through the dma-buf API. We can eventually define a new 
> direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or so to allow 
> handle this new data scheme. The API may be extended later on real demand, of 
> course.
> 
> Otherwise all pieces are already in the current ALSA compress API 
> (capabilities, params, enumeration). The realtime controls may be created 
> using ALSA control API.

So does this mean that Shengjiu should attempt to use this ALSA approach first?

If there is a way to do this reasonably cleanly in the ALSA API, then that
obviously is much better from my perspective as a media maintainer.

My understanding was always that it can't be done (or at least not without
a major effort) in ALSA, and in that case V4L2 is a decent plan B, but based
on this I gather that it is possible in ALSA after all.

So can I shelf this patch series for now?

Regards,

	Hans


