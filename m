Return-Path: <linux-media+bounces-38239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C94B0EF70
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F08D5606A6
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215E828C016;
	Wed, 23 Jul 2025 10:10:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7B1283C9F
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265409; cv=none; b=pN1S7wtQSqGj5rcOFGruOd0J8Vw33JNKG2sIbaSNcSGhiYH9NR5BGxDI17GL6lI8ackeEdfq+CrNRLfbmgT1tkLAbCaem5AkJp7tnzIkCamT5NouVZbiQ+7D3W9L98ZqNFpd0EOP7f9RxVC3JU5ijVeVkQYC9W0zIYxdmCmCSlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265409; c=relaxed/simple;
	bh=8Suesx4npuPJMm9nhhKBhI/owXmIxD8q8h4mq2JB7Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWbDwHn6vJUlmjQZMWEgHjxpuRsRLdDIpNojPVo+5baJEQgx3uCHAwgSZJWDvEQUIQYGOGcz78LOovJ6b/axxlJ/xaxBlNn5Y+pYidW5M+h/vcSQD4Bd85vf6okl/oLdEGXcLgGUtsKRVpzXJAClqNTHGrraWoRLglNh5wwtLqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pfitzner@pengutronix.de>)
	id 1ueWQB-0005dJ-Qq; Wed, 23 Jul 2025 12:09:59 +0200
Message-ID: <3ac271c7-a67a-4f6f-935d-256937516068@pengutronix.de>
Date: Wed, 23 Jul 2025 12:09:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] parse horizontal/vertical flip properties
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
Content-Language: en-US, de-DE
From: Fabian Pfitzner <f.pfitzner@pengutronix.de>
In-Reply-To: <mljx67lkcw4kh3cs344iprik244cm7hqfckmg4bj5j5atuyt62@lh2ht4mrtkjq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: f.pfitzner@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On 7/23/25 11:44, Jacopo Mondi wrote:
> On Wed, Jul 23, 2025 at 11:29:27AM +0200, Fabian Pfitzner wrote:
>> On 7/23/25 11:17, Jacopo Mondi wrote:
>>> Hi Fabian
>>>
>>> On Wed, Jul 23, 2025 at 10:58:28AM +0200, Fabian Pfitzner wrote:
>>>> There are cameras containing a mirror on their optical path e. g. when
>>>> mounted upside down.
>>> How is this different from 'rotation = 180' ?
>> If you simply want to flip the output (e. g. horizontally), you cannot do
>> this with a rotation.
>> The camera I'm referring to is not only upside down, but also flipped
>> horizontally.
> 180 degress rotation = HFLIP + VFLIP
I do not want to do both. Only one of them.
>
> Yes, you can't express 'mirror' in DTS, because DTS are about the
> physical mounting rotation of the camera. Sensor drivers shall not
> apply any flip control automatically, it's userspace that by parsing
> the rotation property through the associated v4l2 controls should decide
> if it has to apply flips or not to correct the images.
>
> What is the use case you had in mind ? Tell the driver through a DTS
> property it has to apply flips to auto-compensate ? Because I think we
> shouldn't and if I'm not mistaken we also document it:
> https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#rotation-orientation-and-flipping
I have a camera that does a horizontal flip in its hardware, so the 
output is not what I want. My example above was misleading. The rotation 
fixes the "upside down" problem, but does not fix the flip.

Doing that in userspace might be a solution, but in my opinion it is a 
bit ugly to write a script that always sets the flip property from 
userspace when the device was started.
A much cleaner way would be to simply set this property in the device 
tree such that the driver can be initially configured with the proper 
values.

PS: I have to send this email twice. The first one contained HTML parts 
that were rejected by some receivers...

>
> TL;DR drivers shall not flip, userspace should. Mirroring is an effect
> of drivers applying an HFLIP, because unless I'm missing something
> obvious, 'mirror' is not a physical mounting configuration of the camera
> sensor.
>
> FIY we're talking about something similar in libcamera
> https://lists.libcamera.org/pipermail/libcamera-devel/2025-July/051533.html
>
>>>> Introduce two options to change the device's flip property via device tree.
>>>>
>>>> As there is already support for the panel-common driver [1], add it for cameras in the same way.
>>>>
>>>> [1] commit 3c0ecd83eee9 ("dt-bindings: display: panel: Move flip properties to panel-common")
>>>>
>>>> Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
>>>> ---
>>>> Fabian Pfitzner (2):
>>>>         media: dt-bindings: add flip properties
>>>>         media: v4l: fwnode: parse horizontal/vertical flip properties
>>>>
>>>>    .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
>>>>    drivers/media/v4l2-core/v4l2-fwnode.c                             | 3 +++
>>>>    include/media/v4l2-fwnode.h                                       | 4 ++++
>>>>    3 files changed, 15 insertions(+)
>>>> ---
>>>> base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
>>>> change-id: 20250718-fpf-media-dt-flip-7fcad30bcfb7
>>>>
>>>> Best regards,
>>>> --
>>>> Fabian Pfitzner <f.pfitzner@pengutronix.de>
>>>>
>> --
>> Pengutronix e.K.                           | Fabian Pfitzner             |
>> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
>>
-- 
Pengutronix e.K.                           | Fabian Pfitzner             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |


