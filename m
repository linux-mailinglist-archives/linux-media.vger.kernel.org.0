Return-Path: <linux-media+bounces-17784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 353BE96F664
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 16:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3024283CBF
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 14:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEF41CFEDE;
	Fri,  6 Sep 2024 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ebp6Zkh7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC1F1CF7A8
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725632014; cv=none; b=Cxm+x1vJI1WmYsUVkVQFIbi1wXankwyAG3u9LxdQP7DGjTxeeIAB1ONCmF2LhKVBrmsN5qZdSsykPL1t3mqUicZHanqAJRIzfk8SlJX1MRt95YrZafCt01CugP6VKIQnAY6gi5hqBVjApQMT0iDRNPQSLMNZujWhz6kEuS2foa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725632014; c=relaxed/simple;
	bh=4aCBE341njHuZ2dkjS2bJ2UugOCiCSc+V6+2jW84rAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOXwZXWlrrVHO2iLhFwvtZ0pSXt3/Chvq63woQypcqj2ivACuVcZuGtvd5YJ+gVc2xVwlF3wdFSUA1ibyeMJtiD5KTAemrMmUXkTeCb8vM3mQ7HITFO8SDlWG/kEyB59fAKqVbPqIjtnPGocjTixHRLsZNmHBhAGpbehXNSWLo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ebp6Zkh7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E2243C7;
	Fri,  6 Sep 2024 16:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725631937;
	bh=4aCBE341njHuZ2dkjS2bJ2UugOCiCSc+V6+2jW84rAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ebp6Zkh78DJKtXX2zkmtiPcHMMX+DuQDF9mXmVZo3DwPOm46z9mnjbgjg6d+7cbUE
	 t8nw7DciVmnAcEjils/zTXCHsUoBTAqYyNQCUHAEZ996CDoz3jn6X6noYVC03fKUWE
	 1kHOdYZxYDBBDjNfAHF8X75ePiuPhIVHya+Md+7A=
Message-ID: <144b60f7-70f7-4f8e-936d-9689cf6d1120@ideasonboard.com>
Date: Fri, 6 Sep 2024 17:13:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Race in rcar-v4l2.c
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org
References: <af3f0b7c-d184-4b2e-bb75-6349ef32e4c3@ideasonboard.com>
 <20240906101446.GS3708622@fsdn.se>
 <fbb2f448-c253-44b0-82ae-e9d751b469e2@ideasonboard.com>
 <c8feb1c4-ec6a-4ea9-b8cd-cb10d99e09ca@ideasonboard.com>
 <ff998461-29fc-4e8c-8a59-dadbe971bf63@ideasonboard.com>
 <20240906134604.GT3708622@fsdn.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240906134604.GT3708622@fsdn.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/09/2024 16:46, Niklas Söderlund wrote:
> Hello Tomi,
> 
> Thanks for testing that series.
> 
> On 2024-09-06 15:28:21 +0300, Tomi Valkeinen wrote:
>> On 06/09/2024 14:27, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 06/09/2024 14:14, Tomi Valkeinen wrote:
>>>> Hi Niklas,
>>>>
>>>> On 06/09/2024 13:14, Niklas Söderlund wrote:
>>>>> Hi Tomi,
>>>>>
>>>>> Thanks for your report.
>>>>>
>>>>> I have an on-going series trying to clean this all up [1]. The one
>>>>> change in the v4l-async core I proposed was however rejected and I have
>>>>> yet to circle back to figure out a different solution.
>>>>>
>>>>> Could you give it a try and see if it also solves this issue?
>>>>>
>>>>> 1. [PATCH 0/6] media: rcar-vin: Make use of multiple connections
>>>>> in v4l-async
>>>>>      https://lore.kernel.org/linux-renesas-
>>>>> soc/20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se/
>>>>
>>>> The compilation fails (broken in media: rcar-vin: Simplify remote
>>>> source type detection) with:
>>>>
>>>> drivers/media/platform/renesas/rcar-vin/rcar-dma.c:767:24: error:
>>>> ‘struct rvin_dev’ has no member named ‘is_csi’
>>>>
>>>> If I hack past that, I don't see the warnings anymore. But if I'm
>>>> not mistaken, rvin_release() is not called at all anymore. I can
>>>> also see plenty of leaks with kmemleak. Those seem to originate from
>>>> max96712, but... I don't see max96712's remove() getting called
>>>> either when I remove the module.
> 
> FWIW module unloading is tricky and AFIK not supported upstream. There
> is a reason the VIN capture pipeline have .suppress_bind_attrs = true
> ;-)

Module unloading is tricky, but only if you define "supported" as 
supported in production, with all possible scenarios working fine.

Unloading modules, at least in my use cases (mostly DRM and V4L2, on 
many different platforms) works very well, if you just make sure to 
unload in the correct order. It's a very powerful development time 
option to use, speeding up development a lot, and highlighting resource 
management issues.

So, anyone breaking module unloading will be getting emails from me... =)

>>>
>>> Sorry, never mind that. I had the debug print in max96714... =). So
>>> max96712 remove() gets called, but it's missing:
>>>
>>> +       v4l2_subdev_cleanup(&priv->sd);
>>> +       media_entity_cleanup(&priv->sd.entity);
>>> +       v4l2_ctrl_handler_free(&priv->ctrl_handler);
>>>
>>> But now I'm seeing rvin_release() getting called (no warnings). I'm not
>>> sure what changed. Maybe I had some extra changes lying around. Let me
>>> test the series a bit more...
>>
>> I haven't seen the warning anymore, so I believe your series indeed fixes
>> the issue.
> 
> Awesome! I will try to find some time soon and rebase that series, I
> think I have an idea on how to avoid having to mock around in the
> v4l-async core and still achieve the same thing.

Hmm, do you mean "[PATCH] media: v4l: async: Fix completion of chained 
subnotifiers"? I only now noticed that. I did not apply that... Should I 
have?

  Tomi


