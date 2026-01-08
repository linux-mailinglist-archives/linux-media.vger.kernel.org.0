Return-Path: <linux-media+bounces-50248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA603D05D53
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 20:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D32953051F8A
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 19:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C6C225A35;
	Thu,  8 Jan 2026 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="wafQxpAz"
X-Original-To: linux-media@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F96329E5F
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 19:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767900353; cv=none; b=sxKOYSBmWd9a7F4mPzEJocoeMODiHAwz01Z53ErG3JvBy3a+aoOkd5F8pdIQdtbXtc3p+BiRbFFimcCIIo2fPmPuBzjsJt36IfgqUAj2McLAIG6fFeoqNpj1Eu4pgeLC5Wf+tBw7ydPcVE+Y11Kl+tMMkwp8ob2UVF00D3DC0H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767900353; c=relaxed/simple;
	bh=oqsQIyOfdUN10ZWmBSlaRzwDqJBFA0k+bK+3KGaBWCU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fmriLTHt19XqmPp5+wbHLb7TelN2UixpkFflGCVgpnNpJGsEK9652PkCsa2KPuvWlPJI1WsTQkf5mYdBnP8N9OG+jTn6SqpdvKLMgPMnmAkrTbfPT5fiCoDNXVjVBkiCJCq6by1Ex7enI0ZdvRczFOAHoyytun45tkp6MzFcovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=wafQxpAz; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <bc0aa47d-81a9-480b-b156-b0cb23179515@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1767900348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QPy2moNpfXyKzpsuRRn1WphpzYdcy/N6eUTrP8hh2hA=;
	b=wafQxpAzYW9sPN/Dvw9WZcDJvO9nTsgn3nIfVeGpCh8Zc3XmG0iAYeO2gdpnnJXKJJ9LXp
	wO42jELc3pCtwJ5XWuDh57I23n9QlsnuY6n8fch/4n6Up8CsoNLxTfUjV9YJWhL6vqeN25
	FE3qL6oZ14QQYb6i3z5+XVbYf/DwriCX2wXqyb9gFKRqHtgS3UZPKc2JsPuRhQgP16oup8
	IPESH7hM1oNzXPj17ay/BnPLLoJGA22Mw2HIkNjSvBzRMG0/4u9hXFGUXat+x9wAqG/Kgj
	3HFu64r1l5n2LRyzVsJOa/XekejcAWyHIJmclfLkqmRbAYMC7xws8c66LcHzHQ==
Date: Thu, 8 Jan 2026 16:25:30 -0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [PATCH v10 0/5] Enable support for AV1 stateful decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
 <DjKkpb96k7gGFmmmqsmLvO6sKcd02WwZq67n9hY4c75sajI_hENGebzfUBW3Xs3WGJ_oXdeYkNcV-T7UkXO6Xw==@protonmail.internalid>
 <ae5531fa-a3a4-4fc5-8580-3a790bec4961@packett.cool>
 <de8fe895-79ae-4540-9879-64d6f8f9e239@kernel.org>
 <f86a904e-110e-448f-96e0-22bc6b3e4b38@packett.cool>
 <a8af1513-fda6-4809-80ae-bb07d2ed0db3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a8af1513-fda6-4809-80ae-bb07d2ed0db3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 1/2/26 3:59 PM, Deepa Guthyappa Madivalara wrote:
>
> On 1/2/2026 3:01 AM, Val Packett wrote:
>>
>> On 1/2/26 7:44 AM, Bryan O'Donoghue wrote:
>>> On 02/01/2026 10:43, Val Packett wrote:
>>>>
>>>> On 12/10/25 3:59 PM, Deepa Guthyappa Madivalara wrote:
>>>>> Hi all,
>>>>>
>>>>> This patch series adds initial support for the AV1 stateful decoder
>>>>> codecs in iris decoder. Also it adds support for AV1 stateful decoder
>>>>> in V4l2. The objective of this work is to extend the Iris decoder's
>>>>> capabilities to handle AV1 format codec streams, including necessary
>>>>> format handling and buffer management.
>>>>
>>>> This is awesome, thanks!
>>>>
>>>> I've tested it with rpi-ffmpeg as well, and it works great (only
>>>> required one interesting logic change..
>>>> https://github.com/jc-kynesim/rpi-ffmpeg/pull/108) \o/


BTW, the rpi-ffmpeg maintainer is asking,

> for that flag_last code to trigger we have to have received an empty 
> capture buffer, which is the legacy method of signalling EOS, so 
> flag_last is a legitimate response. Is there something about AV1 
> stateful that means it is legitimate to receive empty capture buffers 
> mid stream? (grain & no-grain buffers spring to mind with an empty 
> frame if grain isn't enabled but that is pure speculation on my part 
> not supported by the documentation I've read). Now I'll grant that if 
> we get an EOS signalled this way we probably shouldn't attempt to 
> dequeue an event, but the "correct" answer of simply signalling EOS 
> back down the chain isn't what you want either?

(`flag_last` being an internal variable for an end-of-stream condition, 
so basically, I needed to make ffmpeg *not* interpret an empty capture 
buffer as an end-of-stream. I never saw those with H264/H265/VP9, but 
with AV1 one arrives after the first frame)


~val


