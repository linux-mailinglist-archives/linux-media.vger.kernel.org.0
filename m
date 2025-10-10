Return-Path: <linux-media+bounces-44180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC52DBCD524
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 15:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD9461898DB7
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 13:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584BA2F3C08;
	Fri, 10 Oct 2025 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nlVtMYQS"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB20748F;
	Fri, 10 Oct 2025 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760104004; cv=none; b=Rvg0BH4gNrOfsA7GWrHYOYJQQtUzkX1Rta57ZEC9hYszb+G5juK8FNxlEz7uMVCyKCXxe0/2BvrdBqXqKJnv6xWLOUq6GOsn9vnsfUkTjE65u8JLk1+WiHXQsmq+ePsRQ33VC2r6y29/ToZu6naZ0sgGV2Hx2sUZ6ftPGEd+5iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760104004; c=relaxed/simple;
	bh=j+7Q50v1WcbolonU2FwjWi93Z0/pQgPtjDDj72dphGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajB1lrz0MrVdm/+j7llbNqAjLrsHtAEQnBrVZyln8fWhOLzb2vij0TjfQw8gsX7qxqEvUVh94f2IsWikSQRC3vMifirDNnDRMYwHM7xY3kdmX+Efm49Xc+jmzi0cQQguI3kcoLso/slBj1IiHb+7VOYe6IbpsD7fEwptd94f1h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nlVtMYQS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760103999;
	bh=j+7Q50v1WcbolonU2FwjWi93Z0/pQgPtjDDj72dphGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nlVtMYQSaBTbBqEzskyVDW3uqVSg0BCrNtKS6VAG5QXDRwNiNzeITlsWwvFtu4i3P
	 1WRK4yb5kYm82Yr9g+ZWRTiMYKA1C2CFvEQExtAob4eMz7/oxBRsVGvVig9gHxGKMv
	 cJSGz3ReDwM9SWWa8y+iywpSRmJai4H3rrgzGKXFCus8YGZpxDf9uFdiL+/4cb5E5b
	 6hIufXoENtW3maZaVUrwwSUfRJF5THUFM2+GEB48Z+bumAxZYvvx0LffQJ0FIApPkP
	 eomBRxbnJvZwqdTuQ7/SGm8xuhJzx2yjDb9rj2VAeCU02C1h2PcEySLiBEYWVBK6uV
	 OS+TrbwZCsFLg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8D8017E01F5;
	Fri, 10 Oct 2025 15:46:38 +0200 (CEST)
Message-ID: <de1a1dce-f60e-48a1-9945-d2c91b328df5@collabora.com>
Date: Fri, 10 Oct 2025 15:46:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/17] media: rockchip: add a driver for the rockchip
 camera interface
To: Bryan O'Donoghue <bod@kernel.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <HSTnNzc6MTLHGWih5qjlI2nvVECP8FVdcQVeBON4KlWYLtEaWIlNmEpKTU_vlqitbIIHMpabKnvnmpEQFqHYxQ==@protonmail.internalid>
 <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <88b1dcda-be2d-4c57-b042-c1809ef1dc97@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <88b1dcda-be2d-4c57-b042-c1809ef1dc97@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 10/10/25 14:15, Bryan O'Donoghue wrote:
> On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
>> Habidere,
>>
>> This series introduces support for the Rockchip Camera Interface (CIF),
>> which is featured in many Rockchip SoCs in different variations.
>> For example, the PX30 Video Input Processor (VIP) is able to receive
>> video data via the Digital Video Port (DVP, a parallel data interface)
>> and transfer it into system memory using a double-buffering mechanism
>> called ping-pong mode.
>> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
>> DVP and a MIPI CSI-2 receiver that can receive video data independently
>> (both using the ping-pong scheme).
>> The different variants may have additional features, such as scaling
>> and/or cropping.
>> Finally, the RK3588 VICAP unit constitutes an essential piece of the
>> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
>> units, and a data path multiplexer (to scaler units, to ISP, ...).
>>
>> The v11 of the series adds a media controller centric V4L2 device driver
>> for the Rockchip CIF with
>>   - support for the PX30 VIP (not tested, though, due to the lack of HW)
>>   - support for the RK3568 VICAP, including
>>      - capturing frames from the DVP
>>      - capturing frames from the MIPI CSI-2 receiver
>>   - abstraction for the ping-pong scheme to allow for future extensions
>>   - abstraction for the INTERFACE and CROP parts to allow for future
>>     extensions
>>   - initial support for different virtual channels (not tested, though,
>>     due to the lack of HW)
>> and a V4L2 subdevice driver for the Rockchip MIPI CSI-2 Receiver.
>>
>> The driver can be readily extended to provide support for the RK3588
>> VICAP variant. In order to keep things simple, however, this extension
>> shall be submitted separately.
>>
>> Looking forward to your comments!
>>
>> To: Mehdi Djait<mehdi.djait@linux.intel.com>
>> To: Maxime Chevallier<maxime.chevallier@bootlin.com>
>> To: Théo Lebrun<theo.lebrun@bootlin.com>
>> To: Thomas Petazzoni<thomas.petazzoni@bootlin.com>
>> To: Gerald Loacker<gerald.loacker@wolfvision.net>
>> To: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> To: Markus Elfring<Markus.Elfring@web.de>
>> To: Sakari Ailus<sakari.ailus@iki.fi>
>> To: Laurent Pinchart<laurent.pinchart@ideasonboard.com>
>> To: Mauro Carvalho Chehab<mchehab@kernel.org>
>> To: Rob Herring<robh+dt@kernel.org>
>> To: Krzysztof Kozlowski<krzk+dt@kernel.org>
>> To: Conor Dooley<conor+dt@kernel.org>
>> To: Heiko Stuebner<heiko@sntech.de>
>> To: Kever Yang<kever.yang@rock-chips.com>
>> To: Nicolas Dufresne<nicolas.dufresne@collabora.com>
>> To: Sebastian Reichel<sebastian.reichel@collabora.com>
>> To: Collabora Kernel Team<kernel@collabora.com>
>> To: Paul Kocialkowski<paulk@sys-base.io>
>> To: Alexander Shiyan<eagle.alexander923@gmail.com>
>> To: Val Packett<val@packett.cool>
>> To: Rob Herring<robh@kernel.org>
>> To: Philipp Zabel<p.zabel@pengutronix.de>
>> Cc:linux-media@vger.kernel.org
>> Cc:devicetree@vger.kernel.org
>> Cc:linux-kernel@vger.kernel.org
>> Cc:linux-arm-kernel@lists.infradead.org
>> Cc:linux-rockchip@lists.infradead.org
>> Signed-off-by: Michael Riesch<michael.riesch@wolfvision.net>
>> Signed-off-by: Michael Riesch<michael.riesch@collabora.com>
>>
>> Changes in v11:
>> - rkcif: split large driver patch (6/13 of v10) into smaller
>>    patches (6-11/17 of v11) (Bryan)
>> - rkcsi: replaced devm_reset_control_array_get_exclusive with
>>    devm_reset_control_get_exclusive (Philipp)
>> - Link to v10:https://lore.kernel.org/r/20240220-rk3568-vicap-
>> v10-0-62d8a7b209b4@collabora.com
> 
> I believe it is the case and please feel free to correct me if I'm wrong
> that you've dropped a long list of sob/co-develop-by, I think we
> discussed that too, because of the level of change, it seems reasonable
> too.

Correct. The tag list used to be quite complicated [0] due to the
complicated history of this driver. Maxime worked on the driver up to
v5, Mehdi up to v14, I added RK3568 support on top of Mehdi's v14 (with
some valuable contributions from Gerald) and submitted that as v1. v2 of
my work incorporated Mehdi's v14, and here we are, after several rounds
of feedback, at soon-to-be v12 (or, in fact, v25).

> On question on that, are these people aware of the change and cc'd on
> the list of recipients/contactable/agreeable to the change ?

I announced this plan as a response to your comment to v10 [1] with
Maxime, Mehdi and Gerald on Cc: and did not hear any objections.

Hope that this is still OK for everybody!

Best regards,
Michael

[0]
https://lore.kernel.org/linux-media/20240220-rk3568-vicap-v10-6-62d8a7b209b4@collabora.com/
[1]
https://lore.kernel.org/linux-media/23ccc744-745d-4a31-a79c-2d64bf1ed43d@collabora.com/


