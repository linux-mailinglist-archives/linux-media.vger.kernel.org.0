Return-Path: <linux-media+bounces-26400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 632D7A3C2E0
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 16:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D27301659BD
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 15:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7CD1F3BBF;
	Wed, 19 Feb 2025 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dt6gme6s"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8721DF25E;
	Wed, 19 Feb 2025 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739977244; cv=none; b=A1ofNCJh4E/zddVFOp2Y8VBtlCCTo0FEuEw9RoZAaQHfB+ensjrLPf6FF1k7SG9s0sK8QgEH5CiIwVG011S5E45W4QgexYi1Do49N9IUJK8mk08yQBEr5hNDLHaYXsgIK0qKwkDwkxuUzG9nz/+2sxti2+AI87jrConpB8PdSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739977244; c=relaxed/simple;
	bh=G8+LyXuHUV9NyhApLGCBFBKT/Y2s7T3cR1hLzGOd+r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huJGsj5m0i0Xva1kTlgu17kmTON4UKca83XPHxDdQKh6OXMOEMpaPmPt3czhw80d1YMWO43fW0EYzZ/tgEeCm8h7PS6TcmjDGvV69dMZq8TQW7AfoQW3dUAj+6RjapJn09Whq2GtUKtN9+gRIDedr8PlbdKE3OHfqt2K+gTKtus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dt6gme6s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE9EA514;
	Wed, 19 Feb 2025 15:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739977158;
	bh=G8+LyXuHUV9NyhApLGCBFBKT/Y2s7T3cR1hLzGOd+r4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dt6gme6scJS2o4cTxYxyv9XQyosgKo0Inq61wX6gkvceMduPhmstPu69zqg6sPmDu
	 YhlB5k8xohxzAtfmVSOCZP/uWMVvep02qsOUU82aGf7tecFbBc13IcQieTJwrgzQO2
	 kHnPoh4ark7aRbrUlsVwl3ihH+1IbWKBnHklrgyk=
Message-ID: <68ad8295-4561-4f53-86a2-e10ac9ad1612@ideasonboard.com>
Date: Wed, 19 Feb 2025 17:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] media: rcar: Streams support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
 <20250219142256.GA512344@ragnatech.se>
 <f3795f3b-8d38-40cd-abcc-723b18d6dc70@ideasonboard.com>
 <20250219145620.GB515486@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250219145620.GB515486@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/02/2025 16:56, Niklas Söderlund wrote:
> On 2025-02-19 16:41:24 +0200, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 19/02/2025 16:22, Niklas Söderlund wrote:
>>> Hi Tomi,
>>>
>>> I'm happy to see this, nice work.
>>>
>>> Unfortunately it does not apply to the media-tree. As this series is a
>>
>> It should, if you apply the dependencies first. But one of the dependencies
>> from you is a bit old and that doesn't apply without some conflicts
>> resolved. So... Yes, doesn't apply =).
> 
> :-)
> 
>>
>>> mix of fixes and new features as well as covering multiple drivers. Do
>>> you think it would make sens to break out the fixes per driver which we
>>> could review and apply ASAP and the new features which we can review but
>>> need to wait until the dependencies are meet?
>>
>> Yes. I think that's the RAW8 and RAW10 fixes. However, I can't test them
>> without streams and GMSL2, so...
> 
> Sure but the fixes for the format setup registers don't depend on
> streams support, right? The fixes are properly tested but depend on new
> features to enable hardware to produce the test environment. It's miles
> better then the BSP testing done when these things where first
> written...

If you say so. I'm reluctant to apply fixes that I can only test with a 
huge pile of other stuff =).

>>
>>> If the new features depends on stuff that is hard to upport, maybe just
>>> focus on the fixes to get them out of the way?
>>>
>>> On 2025-02-19 15:48:54 +0200, Tomi Valkeinen wrote:
>>>> Add streams support to Renesas rcar platform driver.
>>>>
>>>> The series attempts to keep compatibility with the current upstream.
>>>> However, in upstream there's some kind of custom multi-stream support
>>>> implemented to the rcar driver, which breaks at patch "media: rcar-csi2:
>>>> Simplify rcsi2_calc_mbps()".
>>>
>>> I would not worry about breaking the make shift multi-stream, it was
>>> based on our first attempt to allow streams for GMSL many years ago and
>>> it was bonkers ;-) As long as it don't break a single streams, even from
>>> subdevs that do not themself support streams I'm happy.
>>
>> Alright. Then you're happy with this series. I hope =). I don't have
>> anything to test this with, and only the v4h board.
> 
> You can test single stream on V4H using the staging GMSL2 driver and the
> TPG. I will ofc also test it so no need if it's troublesome for you to
> rewire the V4H you have to this configuration.

Yes, that I have tested. So I have used my V4H board with two GMSL2 
deserializers + imx219 cameras, with unpublished GMSL drivers, and some 
other stuff. And I have tested (just the patches in this series, and the 
dependencies, no "other stuff") with the upstream staging driver with 
deser TPG.

I meant that I can't test this with anything "real" except with the full 
multi-stream gmsl setup. It would be great to be able to just plug in a 
single imx219 or such, but, nope.

  Tomi


