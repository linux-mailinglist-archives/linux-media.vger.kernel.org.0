Return-Path: <linux-media+bounces-47786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C77CC8BF39
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 21:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7DBA3588B7
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 20:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CB4344058;
	Wed, 26 Nov 2025 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AK+cQKal"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356CB340A4A;
	Wed, 26 Nov 2025 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190657; cv=none; b=A04YevegBFbl0NnLGwhlPE5uKf3yN/7j5wF3jvRdtp8pvkXPrM82iU/vFPrt4+luGZyCwDR0B9+gN0LDvtbo7nh+kTWQ8sLWtKoXCGXhAd3GnS8lm5F29UxieD/r4OkSfEFYoyA/lRiiaE1Ca2q2WFjgZON75QSZ2ms+5i+iulM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190657; c=relaxed/simple;
	bh=VgKQqCzbrBVjIoPtkM4peyHjuiSnnuxQpPfmCkt5H8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1G6TLuaa9uVI9x9UDqqz+L6daR1nctSSphA3SGVqGM2OGd7jW+P+2zqnDUR2QyGOzTZJk7cYbaFnDjcysOLwN97SS4CVhPnvQx/0KODgteyeDyrhX3WvfyDwvXfqQI6NzBQzBu2k1jbxm+3TjAPBNurG2pfZLqQk/df4q3UyWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AK+cQKal; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764190653;
	bh=VgKQqCzbrBVjIoPtkM4peyHjuiSnnuxQpPfmCkt5H8g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AK+cQKal//7op9uk7mWZA/RS+U/uLhe06dbOACt+KmYYf/INHmiu6KGNsEZ5opcnE
	 FrmzEqCgPLU59sPxYobIkVgzHUCRW413uwe7423r0ReSYJQDSw7bRTgg/GKg0uPbon
	 BUjaspa1qhS5+sbSonDwO8opoVAqmcXEf3ntee2BXcqyhORnds6T0dFTLC6GFW2ISI
	 so0C1ngzO8qetp8KgT0nVYT9pZQ1UInsa5EHbYvcAHcVQ24pBwb51WRTa1+tWr7ATy
	 MMGUA7AmXGKsnWLd6/2AyEYbDnhaH20d5SJ6XoplqPnm1At6up9uHKZltLyMfxHJqX
	 0XvRnVe/QXCDg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 707DE17E0EDB;
	Wed, 26 Nov 2025 21:57:32 +0100 (CET)
Message-ID: <87049b4c-df7d-454b-a7f4-073975a7ee94@collabora.com>
Date: Wed, 26 Nov 2025 21:57:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
To: Frank Li <Frank.li@nxp.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
 <20251114-rockchip-mipi-receiver-v2-2-eb9b43377fc4@collabora.com>
 <aRyplYZOrGsSxSlp@lizhi-Precision-Tower-5810>
 <554971e1-6fde-4b2c-a2de-fe178358a4e3@collabora.com>
 <aRzub5Ak6DZpO5f/@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aRzub5Ak6DZpO5f/@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Frank,

On 11/18/25 23:08, Frank Li wrote:
> On Tue, Nov 18, 2025 at 07:59:14PM +0100, Michael Riesch wrote:
>> Hi Frank,
>>
>> On 11/18/25 18:15, Frank Li wrote:
>>> On Tue, Nov 18, 2025 at 12:12:26PM +0100, Michael Riesch via B4 Relay wrote:
>>>> From: Michael Riesch <michael.riesch@collabora.com>
>>>>
>>>> [...]
>>>> +#define CSI2HOST_N_LANES     0x04
>>>> +#define CSI2HOST_CSI2_RESETN 0x10
>>>> +#define CSI2HOST_PHY_STATE   0x14
>>>> +#define CSI2HOST_ERR1	     0x20
>>>> +#define CSI2HOST_ERR2	     0x24
>>>> +#define CSI2HOST_MSK1	     0x28
>>>> +#define CSI2HOST_MSK2	     0x2c
>>>> +#define CSI2HOST_CONTROL     0x40
>>>
>>> Look like that is designware CSI2 controller, can we build common library
>>> for all dwc csi2 controller, instead of every vendor create individual one.
>>>
>>> First try at
>>> https://lore.kernel.org/linux-media/20250821-95_cam-v3-21-c9286fbb34b9@nxp.com/
>>>
>>> Toshiba have similar patch
>>> https://lore.kernel.org/linux-media/aPZd39riAxqfw3mT@lizhi-Precision-Tower-5810/
>>>
>>> Frank
>>
>> This has been discussed already a while ago:
>> https://lore.kernel.org/all/20250507083837.GA11152@pendragon.ideasonboard.com/
> 
> https://lore.kernel.org/all/20250702093806.GF16835@pendragon.ideasonboard.com/
> 
> Laurent Pinchart prevent imx93 DWC CSI2 driver at Jul, your discussion at
> May, I think Laurent Pinchart change the mind.
> 
> We can choose not base on imx6, but we should create a standard dwc2 under
> drivers/media/platform/synopsys/

In principle, I agree with refactoring out common code. However, I am
not sure how similar these IP cores really are. Again, the answer I
received from Rockchip states that this is *not* a Synopsys IP core.

Can you maybe test whether the Rockchip MIPI CSI-2 Receiver driver in
this series works on your hardware? Then we will know if (and what)
parts can be shared.

Best regards,
Michael


> 
> Laurent Pinchart:
> 
> 	Can you provide direction?
> 
> Frank
> 
>>
>> Bottom line from Laurent:
>>
>> "Let's keep this driver Rockchip-specific then. Thanks for checking."
>>
>>>  [...]
>> Best regards,
>> Michael


