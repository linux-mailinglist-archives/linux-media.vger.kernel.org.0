Return-Path: <linux-media+bounces-38266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A56B0F2F2
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 15:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A1F9AC2A3C
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 13:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9622E7BBD;
	Wed, 23 Jul 2025 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQC9lW15"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D9F2EA495;
	Wed, 23 Jul 2025 13:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275739; cv=none; b=CWqJrP0xtMTMz4aBd41d3ScdL1zbhdATwg/z/6lpQQEktJMYjPw1iy9hMX8pU2OBPekoV8RGcUx93Rjysj+x3Hw1h065OFBoPVwVdv/XgH166XgNqu2kO+NeoW92g89AXKzZqX7tQ4NBFThjCyEum7haGI9fS7zZ7BfKAncgq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275739; c=relaxed/simple;
	bh=d/twC7l7aOu4BG0CVPBHIv9Uh/+V0XmP38tX6W0hJX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDAAyfqLA/3ICj+oQqNSr1z8X4bx99qWIJxTEL2bR9PvQgnjCweWTPbSzWsAoVOfFyMs4b5meeETdRztHPJqC2h1brSRLx/FoOUklX591usC3iX2qAo+dNry2N4f3ZLte91lYNYcJEJy6rcc+Izh6y3V6PmDPHAk6U3fi57PVAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQC9lW15; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851BEC4CEE7;
	Wed, 23 Jul 2025 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753275739;
	bh=d/twC7l7aOu4BG0CVPBHIv9Uh/+V0XmP38tX6W0hJX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iQC9lW15C8aLnHqd/wbXqoL8q80V41zhfqYcV1wWjMtlbYS47mDaywISLL4sn5WUW
	 nfdTbLyUoGydEDQv5J9g+iACjjAX3QsWenmViPdT3teCvQxePFLqHUAFdiW/O3MN1F
	 k6UA9f0XnjMbpPDp4gTs28mvo9PnNMm31P1HS8Nwpt2W6uv8uWBUeyEwkmqinGWlvG
	 lbKkVjbGAt8FIQqjtKNVozY7XZda+XWe/zB/XDssPkQDm38EWZ+0t94ib7a0V0KJyD
	 YKpNd06OHZ4LEMZQjuK9RxHNWwb3KVSbRqKXQR/ZxSsC2dqwfSFaZ0YYhhYekqONAP
	 AnsPaFPCIbvWg==
Message-ID: <85d9d497-0965-4569-b1af-bd6102c9f68d@kernel.org>
Date: Wed, 23 Jul 2025 15:02:17 +0200
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



