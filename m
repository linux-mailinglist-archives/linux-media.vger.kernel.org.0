Return-Path: <linux-media+bounces-15601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8922B9425E5
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB7D71C236E4
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 05:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B2A4DA1F;
	Wed, 31 Jul 2024 05:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kej4nhI4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E7149643;
	Wed, 31 Jul 2024 05:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722404505; cv=none; b=FLN83kHL95yaJMjZ0B10jehFi8HM2Rg1oCsXMSJiBsqZwjH8CvqZ5WfdH9BwVVyM6KPRPLvJTS4P6KSTOUwN9uqPSYRfyPT87hoZZyxZOFU7O9UUZTeAfTlCyj2J1abi6kzylwUSC1zNIj5QMSR72hMNqPQVSAggKTTNUaf/bW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722404505; c=relaxed/simple;
	bh=SYX0hQh7ONEqqew2stg31w9fGPl4k5OEpC9Da6F1hcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfKP6G2IZrIlxJrVVBd4DIotvsLtO+dwDdPzrBz9NKItBe/HkRXSiBOyivrItw3WbI8el+Nwkxx8TzZ3RTo58ueqgKG8CC7SpIwvwTFI3LAth1xS788qlVDoBn89TY1221IivC9u3fDpDDsraoY1tSZXr42QPZKnbPrJLIzG7Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kej4nhI4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE43A7E4;
	Wed, 31 Jul 2024 07:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722404453;
	bh=SYX0hQh7ONEqqew2stg31w9fGPl4k5OEpC9Da6F1hcY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kej4nhI4lTjAUgdJmYq2vxzD+G4oZnKLhgThMi/oeRNp3461R82K98M7Nee7XyMBf
	 bclvLtnMeCLP6MiMsz3UV8IhE5A6Mk79cNu9lEHh8cRFQnYqksA/Jm+ya5eYHAJn9F
	 TM7hq287a6R6Z/0f0BNMsEoPm0A1DKc6pqmjdsnA=
Message-ID: <cefc0b19-f065-4023-a536-56b2762ac967@ideasonboard.com>
Date: Wed, 31 Jul 2024 11:11:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 stable@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-3-umang.jain@ideasonboard.com>
 <ef05c39a-ad5c-4751-a758-f73a2d114823@kernel.org>
 <ZqijVf68ZQuFGKhU@kekkonen.localdomain>
 <729280cd-557f-43ba-b1a6-8d319977ca82@kernel.org>
 <20240730091011.GL300@pendragon.ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240730091011.GL300@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 30/07/24 2:40 pm, Laurent Pinchart wrote:
> On Tue, Jul 30, 2024 at 10:42:01AM +0200, Krzysztof Kozlowski wrote:
>> On 30/07/2024 10:24, Sakari Ailus wrote:
>>> Hi Krzysztof,
>>>
>>> On Mon, Jul 29, 2024 at 04:09:39PM +0200, Krzysztof Kozlowski wrote:
>>>> On 29/07/2024 13:04, Umang Jain wrote:
>>>>> Rectify the logical value of reset-gpio so that it is set to
>>>>> 0 (disabled) during power-on and to 1 (enabled) during power-off.
>>>>>
>>>>> Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initialization
>>>>> time to make sure it starts off in reset.
>>>>>
>>>>> Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
>>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>>>> ---
>>>>>   drivers/media/i2c/imx335.c | 8 ++++----
>>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>> This will break all the users, so no. At least not without mentioning
>>>> ABI break and some sort of investigating how customers or users are
>>>> affected.
>>> I know the original authors aren't using the driver anymore and it took
>>> quite a bit of time until others started to contribute to it so I suspect
>>> the driver hasn't been in use for that long. There are no instances of the
>>> device in the in-kernel DTS either.
>>>
>>> Any DTS author should have also noticed the issue but of course there's a
>>> risk someone could have just changed the polarity and not bothered to chech
>>> what it was supposed to be.
>>>
>>> I agree the commit message should be more vocal about the effects on
>>> existing DTS.
>> I can imagine that all users (out of tree, in this case) inverted
>> polarity in DTS based on what's implemented. You could go with some
>> trivial hack, like I did for one of codecs - see 738455858a2d ("ASoC:
>> codecs: wsa881x: Use proper shutdown GPIO polarity"), but I remember
>> Mark Brown rejected similar commit for newer drivers.
> I don't think there's any out-of-tree user, because when we started
> using the recently driver, it required lots of fixes to even work at
> all. I'll let Kieran and Umang comment on that, I haven't follow the
> development in details.

indeed, initially we had to put up fixes like :

14a60786d72e ("media: imx335: Set reserved register to default value")
81495a59baeba ("media: imx335: Fix active area height discrepency")

to make the sensor work properly on our platforms. Only after that we 
had a base to support more capabilities on the sensor (multiple lanes 
support, flips, TPG etc.)

>


