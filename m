Return-Path: <linux-media+bounces-38272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1175AB0F316
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 15:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 879A3AC3D7F
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 13:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92C52ED153;
	Wed, 23 Jul 2025 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzZrrnkU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7568289E20;
	Wed, 23 Jul 2025 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275766; cv=none; b=BqSSEz+ANX8wLILMvNO/vDsMMLhCJGgBTeLkQ3M9iwfSkYIso7QzLIqRCGdMF8qa9C7lZEPOU7eOlUnuusUYd3mTVXnXI3290xp1+Omirov/hMgmABnxGJyhl09mY/vF7MUtOYxbD2nuaY9RFyy3brnzJOL6JVloZwoC0WrTt/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275766; c=relaxed/simple;
	bh=d/twC7l7aOu4BG0CVPBHIv9Uh/+V0XmP38tX6W0hJX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljH+SfgLm3yEFu6c617XxJ4G0UQF4StfM3lWA71geJJhX0a5dLBvLu3aytqbhpM4tYK4lXZDo147839yE0hyDGaHoNWJ2NiwOayRixXcwHnKXeCRV4ttuyOwBZHw+FKw31g6ZdPEvMhv2b8YsixL36sdW87YfsdCr72VdLFUBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzZrrnkU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9873C4CEF6;
	Wed, 23 Jul 2025 13:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753275765;
	bh=d/twC7l7aOu4BG0CVPBHIv9Uh/+V0XmP38tX6W0hJX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bzZrrnkUXEBe9hxBCV9xRrj5qI8AwhDdsNub1RlBEgxTxOmg8NkTCarhcAL8MrCFz
	 X5hkkKGt4scZlzhPV1EJDMHu91rsahbpuLqVki4ISBW54EF7bVWHE030IhFx+g1Jj1
	 KejVDGt/l3vJtqt97gWTQ1d0HlGhKQo6df9f26Ll+QT340L17WFbyVEhKkyiHQYPgC
	 W9wfYlEVxnOWsS/bIdZNyX2bfmcB41oxqo9KMYilyeUE6J8x1+0NR5zgqZJdbv003c
	 KSo6ORp6Nbk7nSHQpzcaEfoxvkOUBHMDeBnhRYCRGL6gL/hF0ntqGN8kZvqZEj5HI0
	 Btl5PQTG9EGmg==
Message-ID: <b2976514-1dbd-4b2a-8df1-05beb98d93a1@kernel.org>
Date: Wed, 23 Jul 2025 15:02:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] parse horizontal/vertical flip properties
To: Fabian Pfitzner <f.pfitzner@pengutronix.de>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 entwicklung@pengutronix.de
References: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>
 <ryuew3kxnocj6uqq4nadp3kyaxg27rxlrgnaieyy2hlpz5jkd3@iyetnsbfanee>
 <35debf21-bca7-480f-a61e-7b0494f10ca5@pengutronix.de>
 <mljx67lkcw4kh3cs344iprik244cm7hqfckmg4bj5j5atuyt62@lh2ht4mrtkjq>
 <3ac271c7-a67a-4f6f-935d-256937516068@pengutronix.de>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <3ac271c7-a67a-4f6f-935d-256937516068@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Jul-25 12:09 PM, Fabian Pfitzner wrote:
> On 7/23/25 11:44, Jacopo Mondi wrote:
>> On Wed, Jul 23, 2025 at 11:29:27AM +0200, Fabian Pfitzner wrote:
>>> On 7/23/25 11:17, Jacopo Mondi wrote:
>>>> Hi Fabian
>>>>
>>>> On Wed, Jul 23, 2025 at 10:58:28AM +0200, Fabian Pfitzner wrote:
>>>>> There are cameras containing a mirror on their optical path e. g. when
>>>>> mounted upside down.
>>>> How is this different from 'rotation = 180' ?
>>> If you simply want to flip the output (e. g. horizontally), you cannot do
>>> this with a rotation.
>>> The camera I'm referring to is not only upside down, but also flipped
>>> horizontally.
>> 180 degress rotation = HFLIP + VFLIP
> I do not want to do both. Only one of them.
>>
>> Yes, you can't express 'mirror' in DTS, because DTS are about the
>> physical mounting rotation of the camera. Sensor drivers shall not
>> apply any flip control automatically, it's userspace that by parsing
>> the rotation property through the associated v4l2 controls should decide
>> if it has to apply flips or not to correct the images.
>>
>> What is the use case you had in mind ? Tell the driver through a DTS
>> property it has to apply flips to auto-compensate ? Because I think we
>> shouldn't and if I'm not mistaken we also document it:
>> https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#rotation-orientation-and-flipping
> I have a camera that does a horizontal flip in its hardware, so the output is not what I want. My example above was misleading. The rotation fixes the "upside down" problem, but does not fix the flip.

Hmm, so is there anything in the optical path causing just
a horizontal flip ? 

Because if not it sounds like the driver is simply buggy and
is applying hflip by default / applying hflip while the hflip
control is set to 0.

We've had this case a couple of times before. So it might just
be that we need to fix the driver here ...

Regards,

Hans


