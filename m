Return-Path: <linux-media+bounces-50235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B34D03916
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 15:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1BE83018341
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 14:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E0D44DB86;
	Thu,  8 Jan 2026 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iMXshUmD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E896A3EF0C0;
	Thu,  8 Jan 2026 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880640; cv=none; b=PQrw6OG8N9nde/lXMy4hv7YakOkXuK1MxyMRBkFUQb46j74MB0kwgKHO5MuuNGOJp9qf3tbNi+NoZAyXgP36OlICE74QCQ/OPXjGjNusj146J89mLQ/p+0hTgLOP7/InJ+ZDr/IqpHXj+4YIBFFxYmhLvEcOB6FZqgieiQiQ644=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880640; c=relaxed/simple;
	bh=OhHA0eiU//TrBNRmklDdGYlUq5mXP8Cp8oS03aXdCYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlvkV37dvyKdlkW6eNfMEmxU65ygGbZWj3kIG68eeFcq36KBri5ZZSR8Bf1qpVRP0ew1eAwno6RV8O9bEo/aXwyC1EB74yQeg683Siiet688HTh/Nk7DyaTL7vS7VssRdPYh9fYjWZSudJobmm76AmoqMW1IIsvHclJ0yiWIC/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iMXshUmD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59016557;
	Thu,  8 Jan 2026 14:56:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767880611;
	bh=OhHA0eiU//TrBNRmklDdGYlUq5mXP8Cp8oS03aXdCYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iMXshUmD+UDKTDziY3G91hBa6LzsYjYgmVKP99BDy0LGerDLiP6ZXnrSzACaoCcQP
	 RIF+Lg06qMWSXkVyrv742257giYOivBEzB13++twaP9ZUy/wDdgqjvuYXCp9/sLj67
	 LhrYstJKoGuy3ww/Rnl4q5+e4b7ZYKcB2RqaxtQY=
Message-ID: <459d26bc-f847-42cc-91fa-a939b6f205a8@ideasonboard.com>
Date: Thu, 8 Jan 2026 15:57:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] media: rcar: Streams support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
 <20251231095739.GA3091492@ragnatech.se>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20251231095739.GA3091492@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Niklas,

On 31/12/2025 11:57, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for your persistent work on this series!
> 
> On 2025-12-16 17:18:17 +0200, Tomi Valkeinen wrote:
>> Add streams support to Renesas rcar platform driver.
>>
>> The series keaps compatibility with the current upstream for a single
>> stream use case. However, in upstream there's a limited custom
>> multi-stream support implemented to the rcar driver, which will be
>> replaced with the upstream's Streams API.
>>
>> I have tested this series on Sparrow-Hawk board, with a few different
>> setups:
>>
>> IMX219 connected to the CSI0 connector
>> - The following patches applied to my test branch in addition to this
>>   series:
>>   1) The v4l2_subdev_get_frame_desc_passthrough dependency
>>   2) Revert of commit e7376745ad5c8548e31d9ea58adfb5a847e017a4 ("media:
>>      rcar-vin: Fix stride setting for RAW8 formats"), as that commit
>>      breaks RAW8
> 
> That is so odd, I do grab RAW8 on V4H with a IMX219. In what way is do 
> you see RAW8 breaking?

I also used V4H with IMX219. Let's compare our setups and results on irc
and find out what's going on.

>> - Tested with a single video stream
>>
>> IMX219 connected to the CSI0 connector
>> - Plenty of other patches applied to enable full streams support and
>>   embedded data support in imx219 and v4l2 framework
>> - Tested with video and embedded data streams
>>  
>> Arducam FPD-Link board + 4 x IMX219 connected to the CSI0 connector
>> - Plenty of other patches applied to enable full streams support and
>>   embedded data support in imx219 and v4l2 framework, and TPG support in
>>   ub953
>> - Tested with video and embedded data streams from all four cameras (so
>>   8 streams in total)
>> - Also tested with ub953's TPG, combined with video & embedded streams
>>   from other cameras.
> 
> As there are dependencies on patches that have been on the list for a 
> long time that would block merging this work. Could we try and shift 
> focus and get some of the nice fixups and cleanups merged first? IMHO we 
> could even aim for merging the rework (reduction) of the ad-hoc VC 
> support done in the graph ASAP to get it out of the way.
> 
> It would also be nice if we could sort the RAW8 issue separately to get 
> it out of the way.

Sounds fine to me.

> I have other work touching these drivers I'm holding of on to not cause 
> conflicts with your nice work, and it will make my work smaller/easier 
> too!
> 
> Could we start by breaking this out into:
> 
> - A series that just removes the ad-hoc VC thru media graph in the R-Car 
>   VIN and CSI-2 drivers.

That's just the patch 6, "media: rcar-vin: Link VINs on Gen3 to a single
channel on each CSI-2" patch, isn't it?

> - And then we can follow up with the cleanup of each of the drivers as 
>   separate series.

How about merging 1-6 as a first step (assuming they pass reviews and
tests =)? I'm not sure if there's any benefit in sending the above VIN
patch alone, then the cleanups after that. Or perhaps patches 1-8.

> This would make it easier for everybody I think. Each series becomes 
> smaller to review, we can get fixes and cleanup in now and not wait for 
> all stream dependences to land first.

I'm fine with breaking it to smaller pieces than 1-8 if you want. I
think the split could then be 1-5, 6-8, and the rest later. But I think
1-5 are quite small and straightforward, so I'm hoping we can work with
smaller amount of patch sets.

>> I have observed one issue with the embedded data (i.e. requiring bunch
>> of patches not in upstream): when stopping streaming, VIN says that it
>> cannot stop the stream. I haven't debugged that, but a possible issue is
>> that the if the video stream for the imx219 is stopped first, the
>> embedded data stops also, and VIN does not get the frame-end it is
>> waiting for.
> 
> I would not be comfortable merging with this regression. I have bad 
> experiences when VIN report it can't stop the stream. More often then 
> not it also means it then can't start streaming again...

It's not a regression, and on the "why it doesn't matter" side is that
embedded data is not supported upstream, so the user cannot hit this
issue. Also, I did not notice any issues in restarting the streaming again.

That said, I agree that it must be sorted out.

 Tomi


