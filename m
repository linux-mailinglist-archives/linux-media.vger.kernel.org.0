Return-Path: <linux-media+bounces-48467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C97CAFD44
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 12:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2746830BFD45
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 11:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCC22F5A36;
	Tue,  9 Dec 2025 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O1wLwCYN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA22EFDB4;
	Tue,  9 Dec 2025 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765281142; cv=none; b=rndpZO711NL7+KzVrrH3g7A3MhTanAX7vwbHBI4ybqwwNKgmILQG8iIbayr4lF4S1ItqSsYQXwGRAgvwOVNaWPzZn8EjUUwu2hMmDN7t9OUlaPvSKQWx1h27QdvYROhZLGu9MzNwkdRwHeB3yOq+shyA8hcbUkssDL+ZWDzyq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765281142; c=relaxed/simple;
	bh=Ftb9PirvmJRGyLRE98CYCaXxFqs70fQTe1cFRDDjKJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGuUJYR/pRuijT3yvXa771pIN897/7GUk4D5hM8oxB7A/AAOvHxbAbRFApHbXzvMJ+GCy8y3qtgUhJD8/Nqp+dalUZxhsYCCoJb2uw4GzmVHdql+czAX5gfGrc7F0uy/Vboc0/k9vhtqfCnQK8LIuFONkrjoS0FXgGBUyYxjhM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O1wLwCYN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6084A667;
	Tue,  9 Dec 2025 12:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765281132;
	bh=Ftb9PirvmJRGyLRE98CYCaXxFqs70fQTe1cFRDDjKJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O1wLwCYNZ1rfvvDdYTY3e8ruhDlBSU7DNA8+mQlSwTzBclLaCCTesfYUu/U+1DUuf
	 OjYFbRQTtmUHvsO1z8TCu6nXhI82+TyG+LrT2WBtRLsdYK5hVIFxSAacJG2PjOMN4X
	 AYDK1BLWG9Zvqi2ozL1jAFTkVgANvh0AWH8ov3hM=
Message-ID: <4854792f-e682-4291-89c4-c0139a6c24bc@ideasonboard.com>
Date: Tue, 9 Dec 2025 13:52:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/18] media: ti: j721e-csi2rx: add multistream support
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com,
 jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org,
 hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-14-r-donadkar@ti.com>
 <1e7be0c3-b7da-4eac-9a39-147c1e627cbb@ideasonboard.com>
 <719ee15a-92fd-4597-b25e-196f4a906a5a@ti.com>
 <176527657688.20066.3405220622225469005@freya>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <176527657688.20066.3405220622225469005@freya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 09/12/2025 12:36, Jai Luthra wrote:
> Hi Rishikesh,
> 
> Quoting Rishikesh Donadkar (2025-12-09 15:38:33)
>>
>> On 01/12/25 18:33, Tomi Valkeinen wrote:
>>> Hi,
>>
>>
>> Hi Tomi,
>>
>> Thank you for the review !
>>
>>>
>>> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
>>>> From: Jai Luthra <j-luthra@ti.com>
>>>>
>>>> Each CSI2 stream can be multiplexed into 4 independent streams, each
>>> Well, that's not true, at least generally speaking (there can be more
>>> than 4). Is that specific to TI hardware?
>>
>>
>> Yes, The commit message talks about how TI CSI does the multiplexing of 
>> CSI stream from the sensor into 4 streams as show in the Figure 12-388 
>> in AM62A TRM[1]. I will modify the commit message to mention that this 
>> is TI CSI specific.
> 
> Figure 12-388 shows the internal pixel stream coming from Cadence to
> different hardware blocks like TI's Shim (DMA) and VP0 (ISP) and VP1. I
> don't see that being related to CSI2 VC/DT support, which is handled by the
> Shim using different DMA contexts and channels.
> 
> In the TRM, under 12.6.1.1.1 CSI_RX_IF Features, I see:
>  * Compliant to MIPI CSI v1.3
>  * Supports up to 16 virtual channels per input (partial MIPI CSI v2.0 feature)
> 
> So 16 VCs is supported by TI's CSI pipeline, despite it being MIPI CSI2
> v1.3 compliant otherwise. I think I might have been confused with DS90UB960
> while writing this commit message originally, which strictly supports a
> maximum of 4 VCs.
> 
> Secondly, even with just CSI2 v1.0 compliant source, this could
> theoretically handle 8 "streams" of data with 4 different VCs x 2 data
> types each. So please update the paragraph in next revision.
Where does the "8" come from? Do we have 8 context registers, to which
we program the VC + DT filter?

Also, it could as well be 8 streams, all with VC 0, but each different
DT (probably unlikely scenario =). But I just want to highlight that VC
is not the "stream". The "stream" is the VC+DT tuple.

 Tomi


