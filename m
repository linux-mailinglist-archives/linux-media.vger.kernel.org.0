Return-Path: <linux-media+bounces-16883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5CE96056C
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 11:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 625ACB21000
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 09:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A54194A4F;
	Tue, 27 Aug 2024 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="ZZo481WI"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250CD194AF6
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724750435; cv=none; b=m7NnxXK2838fd30MEQ97Gmt+nnp7AoAR3AFZnbvltrDO1BmcsbWftEyRrQ8izqwgO2R0jUwXEcYgtAkaq4FbnsZRJNyE/MZ3aNJhNoaRWhaCDeL+rhQbiA+uDSn7gcw2m2C1VGapxHcrL4vo4TZy5jbhHMY6msHuQYgJv6gFSEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724750435; c=relaxed/simple;
	bh=YXJcwnamKTneYzWhbIRpPcOE4uUMYra/8+ezm0om+4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bU3epNToztmYewLO7qUc5iR+LOBWIpr1PHRG9ReUsUMMUPjljxRiiFQnha8ZrTmVTPtNPJUVNdh1y9KYMdHcbndZfk5pGcKrRLCxH6oMn8MQUpRl0vM5fmxTrKkyKhkdrKbmur1rdtgDTX4G0mspkGMGVrViFrE7Ibnh9bL0m7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=ZZo481WI; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 71ca1d8a-6455-11ef-a718-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 71ca1d8a-6455-11ef-a718-005056992ed3;
	Tue, 27 Aug 2024 11:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=V/VSBddE/qzk24cDCK4vWX7YbZzTTEE/YqfbXNez6UU=;
	b=ZZo481WI89gE3379OzGw6y5OPj/TNCDntxui/QfgG1C6uc9VuKe8qrp5iaCAVJkbYm7sZFrV18pb4
	 lPe1RFY7m/oaie15QlLTfcz0rDabYl5mS1zqA3T4cSpwfurh5kCTpkfn1HBOyVt3NdeexigXO9JbxA
	 Lhgbb6yZnC7AOFGpFlueJyikL4pNYU/ukrmo9BKoP4+LuFfyz55h/v7QCmnOAFt4inAG6XBPFrpfdF
	 ulCTTKbifuQtNlM7equVNl2tbZVAY+TP2J8FXlLc0GovXaVahfhQTMgPcNhgy4wVcoYwJAVSQPzOrm
	 Z3fOZ41GLP9+45sGL1DmxBt4SIdMB4A==
X-KPN-MID: 33|bdowf2YyZJ73p+l+KxIvNI4hvd9rDe/13af7bekCi8bzO5YkMXfFnu25Tws2Hwl
 HaqvfwOX7JfL7F3g+NY6Uro/1HrEcg9A/cI8TWTrkvME=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|6NS6lpYyLEehUIERFyp4etbYUh4rZ2KTnTSbQ2dPJpKSr8FglKSBe9fPCUhjjny
 skgJHTlvgVkLI2FAqH78N8A==
Received: from [10.47.75.249] (unknown [173.38.220.48])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 7229cf0a-6455-11ef-8748-00505699d6e5;
	Tue, 27 Aug 2024 11:19:22 +0200 (CEST)
Message-ID: <1f41c045-da75-429b-9d3e-0dc531bbd5db@xs4all.nl>
Date: Tue, 27 Aug 2024 11:19:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: Drop minimum allocation requirement of
 2 buffers
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, stable@vger.kernel.org
References: <20240825232449.25905-1-laurent.pinchart+renesas@ideasonboard.com>
 <fbdc2a88-bffc-4603-8ceb-25817967ade8@xs4all.nl>
 <20240827091528.GD23129@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240827091528.GD23129@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/24 11:15, Laurent Pinchart wrote:
> Hi Hans,
> 
> Please let me know if you expect a pull request, otherwise I'll consider
> you will take this in your tree.

Can you add it to your "Miscellaneous V4L2 patches" PR and post a v2 of that today?

Regards,

	Hans

> 
> On Mon, Aug 26, 2024 at 08:31:13AM +0200, Hans Verkuil wrote:
>> On 26/08/2024 01:24, Laurent Pinchart wrote:
>>> When introducing the ability for drivers to indicate the minimum number
>>> of buffers they require an application to allocate, commit 6662edcd32cc
>>> ("media: videobuf2: Add min_reqbufs_allocation field to vb2_queue
>>> structure") also introduced a global minimum of 2 buffers. It turns out
>>> this breaks the Renesas R-Car VSP test suite, where a test that
>>> allocates a single buffer fails when two buffers are used.
>>>
>>> One may consider debatable whether test suite failures without failures
>>> in production use cases should be considered as a regression, but
>>> operation with a single buffer is a valid use case. While full frame
>>> rate can't be maintained, memory-to-memory devices can still be used
>>> with a decent efficiency, and requiring applications to allocate
>>> multiple buffers for single-shot use cases with capture devices would
>>> just waste memory.
>>>
>>> For those reasons, fix the regression by dropping the global minimum of
>>> buffers. Individual drivers can still set their own minimum.
>>>
>>> Fixes: 6662edcd32cc ("media: videobuf2: Add min_reqbufs_allocation field to vb2_queue structure")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>>> ---
>>>  drivers/media/common/videobuf2/videobuf2-core.c | 7 -------
>>>  1 file changed, 7 deletions(-)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>>> index 500a4e0c84ab..29a8d876e6c2 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>> @@ -2632,13 +2632,6 @@ int vb2_core_queue_init(struct vb2_queue *q)
>>>  	if (WARN_ON(q->supports_requests && q->min_queued_buffers))
>>>  		return -EINVAL;
>>>  
>>> -	/*
>>> -	 * The minimum requirement is 2: one buffer is used
>>> -	 * by the hardware while the other is being processed by userspace.
>>> -	 */
>>> -	if (q->min_reqbufs_allocation < 2)
>>> -		q->min_reqbufs_allocation = 2;
>>> -
>>>  	/*
>>>  	 * If the driver needs 'min_queued_buffers' in the queue before
>>>  	 * calling start_streaming() then the minimum requirement is
>>>
>>> base-commit: a043ea54bbb975ca9239c69fd17f430488d33522
> 


