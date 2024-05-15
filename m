Return-Path: <linux-media+bounces-11492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F28C683C
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 16:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46C2D28169F
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 14:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D99613F422;
	Wed, 15 May 2024 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwY79/UJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD06214D;
	Wed, 15 May 2024 14:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781888; cv=none; b=f0kXX0kbCgmr2XGWNfVmE1CSwuw50CYvAm0dm8l8IfctBStPDVNqpWDq+okgU/mnSJn1ag66S8MVrVVh/Y0BJ2BZrFQMeqhDBlgiCS7y3zZGXlZe6AmyiErNl3ifoH18mwJCFVV+Ek6gvhPcyCTalNUmrrLvrfCzPFpnOhfLuMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781888; c=relaxed/simple;
	bh=Is9J5YRpNzvklFE+cfQ23ylGaJ3nXqCLhHCxIrAy0f4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpAEwhHXtgMQeJWvXRw0ezEYu/LT5OcgwXuuOFofMdjvTaJ5Nw2QPpLSzmUIyY1fWdoXzVz7KEn6//x3dhht+l/BY4Zqo6i+hPyD6S6oSdgfsLucSiIIhvyaZsPXube7zTTLI4b/MqxWjbYpfxh/d9SGhzPqbknJzvsgziOzr7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwY79/UJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715781887; x=1747317887;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Is9J5YRpNzvklFE+cfQ23ylGaJ3nXqCLhHCxIrAy0f4=;
  b=ZwY79/UJODTXIOszgPAvXlQCE2CI+RHkktzaQ6hozv8XtIR+cj7P++B/
   Ukrtl1Knv2Hvs2pxJeTPV+IbK8jdFBCe0siPMBEiTak303RVReFZFue3Y
   alUfMac48hun+x0VO7EYb8ZhJzs6u8yXHzFShYmK1PSGVlezPS3YSVcjP
   k+PEfkKj5vj2/npxoJdWCWZz/RIiwxNLfSHNNwffplHLM2tdllH5y2gzY
   mxqaSRt0wuiz6wZqS/3QVwtgnhsXCOkTfYwyROZ6Rmfq84rN60fRJmilV
   XWxA8tXBOVs/PbZZCGDhDCqmKh/nrntH3zzQ2NJJBEjhvEQ/Ac27yJFed
   A==;
X-CSE-ConnectionGUID: +MS07ncgTK6Y9I9m1WYj9g==
X-CSE-MsgGUID: EM2rUlSOTAiVu94RnD8guw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23234031"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="23234031"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 07:04:44 -0700
X-CSE-ConnectionGUID: ureli23YTFOv+UNUpcaPtw==
X-CSE-MsgGUID: 4mxvp+5zQbCHGtglpG+BDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="35778478"
Received: from wtcline-desk12.amr.corp.intel.com (HELO [10.125.108.49]) ([10.125.108.49])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 07:04:42 -0700
Message-ID: <4170720a-f7bb-484e-9235-a8720cec92c1@linux.intel.com>
Date: Wed, 15 May 2024 09:04:41 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang
 <shengjiu.wang@gmail.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.de>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, tiwai@suse.com,
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
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
 <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/9/24 06:13, Jaroslav Kysela wrote:
> On 09. 05. 24 12:44, Shengjiu Wang wrote:
>>>> mem2mem is just like the decoder in the compress pipeline. which is
>>>> one of the components in the pipeline.
>>>
>>> I was thinking of loopback with endpoints using compress streams,
>>> without physical endpoint, something like:
>>>
>>> compress playback (to feed data from userspace) -> DSP (processing) ->
>>> compress capture (send data back to userspace)
>>>
>>> Unless I'm missing something, you should be able to process data as fast
>>> as you can feed it and consume it in such case.
>>>
>>
>> Actually in the beginning I tried this,  but it did not work well.
>> ALSA needs time control for playback and capture, playback and capture
>> needs to synchronize.  Usually the playback and capture pipeline is
>> independent in ALSA design,  but in this case, the playback and capture
>> should synchronize, they are not independent.
> 
> The core compress API core no strict timing constraints. You can
> eventually0 have two half-duplex compress devices, if you like to have
> really independent mechanism. If something is missing in API, you can
> extend this API (like to inform the user space that it's a
> producer/consumer processing without any relation to the real time). I
> like this idea.

The compress API was never intended to be used this way. It was meant to
send compressed data to a DSP for rendering, and keep the host processor
in a low-power state while the DSP local buffer was drained. There was
no intent to do a loop back to the host, because that keeps the host in
a high-power state and probably negates the power savings due to a DSP.

The other problem with the loopback is that the compress stuff is
usually a "Front-End" in ASoC/DPCM parlance, and we don't have a good
way to do a loopback between Front-Ends. The entire framework is based
on FEs being connected to BEs.

One problem that I can see for ASRC is that it's not clear when the data
will be completely processed on the "capture" stream when you stop the
"playback" stream. There's a non-zero risk of having a truncated output
or waiting for data that will never be generated.

In other words, it might be possible to reuse/extend the compress API
for a 'coprocessor' approach without any rendering to traditional
interfaces, but it's uncharted territory.

