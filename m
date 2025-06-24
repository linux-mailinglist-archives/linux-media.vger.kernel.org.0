Return-Path: <linux-media+bounces-35783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE7AE65F5
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 15:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD469188A716
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326AF291C0E;
	Tue, 24 Jun 2025 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cHlJBGYG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B96230996;
	Tue, 24 Jun 2025 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770613; cv=none; b=OlOO89xbXE5BF+bbsdReQQkPzFVsyXDP/zrA0QVtiZ0F1JwUUrA7jD+nyzj7rUb5cIZpiX8jYTrDBxBmLFIZKiJA+VzN/YBDAcfnUDY5lTfrHIs8d1NygjJwJ+SmhMw3bBcCopb+xVjnyV/P9NJI4bCDUmND2THsKt+e4bHoZ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770613; c=relaxed/simple;
	bh=AfvttVdtwBZFnCK/gDVeSiWl48OQJD8mgU/v5viIjuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVfl6oKsurCupk3FOeFoBWaAFdjjf56Xw1Yh3WfSjg3wuK/i8RNPnWQcnJiFqB42Vo6wZRy15/bD/YCTLdwz+kCcSQcqkDqe4N2opEkR8Ld2eo8Ss7mHMtShKlxBwkGW52R0Vm+kKEmR2uOxyZGH1I6rtHRuKSdjPcRhuCz7GQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cHlJBGYG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BD5050A;
	Tue, 24 Jun 2025 15:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750770592;
	bh=AfvttVdtwBZFnCK/gDVeSiWl48OQJD8mgU/v5viIjuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cHlJBGYGfPQJz8jghlyrpqqWgwhp7Khpisj4JKyOje6caRbGFZ+x0vntv0L6pbuaX
	 6gt2a5G2yM9tH2fs2lcauB/7hEjdudc4LSfpUDtKF9OwEtKnmsv+wsmlLBSJ9DPHB+
	 YKSGKPMDXBrmjI345vSMK6ph7azHDqRCwsP+dujc=
Message-ID: <6fe97577-68b8-4659-aab5-59d3f3a1f67b@ideasonboard.com>
Date: Tue, 24 Jun 2025 14:10:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add Input Video Control Block driver for RZ/V2H
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
 <145fbca0-bb55-4809-9c13-cbfa50e5b1ec@kernel.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <145fbca0-bb55-4809-9c13-cbfa50e5b1ec@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof

On 24/06/2025 13:52, Krzysztof Kozlowski wrote:
> On 24/06/2025 14:35, Daniel Scally wrote:
>> Hello all
>>
>> This series adds a driver for the Input Video Control Block in the
>> RZ/V2H SoC. The IVC block transmits input image data from memory to
>> the ISP core (on this SoC, a Mali-C55 ISP). The driver registers an
>> output video device for userspace to queue image buffers to. One
>> noteworthy feature is that - because it is not a part of the main ISP
>> drive - the IVC driver also registers a subdevice, which connects to
>> the media device created by the ISP driver through the usual v4l2
>> async framework. This requires delaying the registration of the video
>> device until the .registered() callback of the subdevice, so that the
>> struct v4l2_dev pointer the subdevice connected to can be set to the
>> video device.
>>
>> To facilitate communication between the ISP driver and the IVC driver
>> we use the new media jobs framework that was posted recently [1]. The
>> series is also based on top of the latest version of the Mali-C55
>> driver [2] and some updates to rzg2l-cru [3].
>>
>> Note that this is not quite ready to merge, as there's an outstanding
>> bug that sometimes causes the driver to hang. The device should fire
>> two interrupts per frame; once on completion of data transmission and
>> once on expiration of the blanking period. The second interrupt seems
>> sometimes not to arrive, and at the moment the problem is worked
>> around with a timeout in rzv2h_ivc_send_next_buffer(). We're working
>> on that issue, but because the driver lends helpful context to the
>> media jobs and mali-c55 series (and is probably otherwise ready for
>> comment too) I wanted to post it.
>>
>> Thanks
>> Dan
>>
>> [1] https://lore.kernel.org/linux-media/20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com/T/#t
>> [2] https://lore.kernel.org/linux-media/20250624-c55-v10-0-54f3d4196990@ideasonboard.com/T/#t
>> [3] https://lore.kernel.org/linux-media/20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com/T/#t
>>
>> ---
>> Daniel Scally (3):
>>        dt-bindings: media: Add bindings for the RZ/V2H IVC block
>>        media: platform: Add Renesas Input Video Control block driver
>>        MAINTAINERS: Add entry for rzv2h-ivc driver
>>
>>   .../bindings/media/renesas,rzv2h-ivc.yaml          | 103 ++++
>>   MAINTAINERS                                        |   7 +
>>   drivers/media/platform/renesas/Kconfig             |   2 +
>>   drivers/media/platform/renesas/Makefile            |   1 +
>>   drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  15 +
>>   drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
>>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 237 +++++++
>>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 379 ++++++++++++
>>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 678 +++++++++++++++++++++
>>   .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 133 ++++
>>   10 files changed, 1560 insertions(+)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250624-ivc-833d24376167
> That's b4, right? So where is the changelog with lore link to previous
> version?

It is b4 indeed. It didn't add a changelog, I've only just adopted the tool so not too familiar with 
it yet, but my guess would be it's because this is the first time I've used it with this series - I 
got it to pick up the old version with b4 prep --from-thread. Normally I would link to the earlier 
version manually but I forgot, sorry about that. Here it is:

https://lore.kernel.org/linux-media/20250519145754.454005-1-dan.scally@ideasonboard.com/#t


Thanks

Dan


>
> Best regards,
> Krzysztof

