Return-Path: <linux-media+bounces-36437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AF6AEFA88
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFA28188B7B7
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0EB2750E4;
	Tue,  1 Jul 2025 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V0V4Hjd/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA6D274FC6;
	Tue,  1 Jul 2025 13:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376270; cv=none; b=Hk4wUNf8dd96mimwy7ett5MARc3f4k/6KmgxO/Pm1YgI5DaHayLRC9ZGMft66kFoVTw3Wynrb1UlvADqnorPUyPQ0608HtRxfYpYBGhT8+x4dIFkIxaPN3p6p+Dt1oE3gLJzZxZZpoxFn8dzTQmWaPV9Qr0RYXKXwdxlzr07QiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376270; c=relaxed/simple;
	bh=KPK3XaLTe+i2CcE1y0p7udF/XbSToUqDWfNnG/w10NQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlrMfihyIc1TdMcQ+lOdqgb9xeCjBk0LNW4qfY8UcW3Id+uQGcioK7ijvNN9/HhxtTLVLiEYWLaPlxy0H6h7W4eZGep2DGmgVR+LTOqzOUnd8fcZ8rksiSElfwJhVsED8spqwkmoTsUZs9t4ZAYvJl0KeILTBHZseY2dsc0KYjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V0V4Hjd/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 860347E1;
	Tue,  1 Jul 2025 15:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751376243;
	bh=KPK3XaLTe+i2CcE1y0p7udF/XbSToUqDWfNnG/w10NQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V0V4Hjd//6xcIeR5UjyQcXL2a2PM7xj33IHNrk40DRawuSPq+NZHVO8QvwXYXao/u
	 CXhwJP81OcpEqIPFW6s433Ov0UowSsTxwZdE6Kc6lKCTpMJwgNaT+uK0QjlDkUwfsR
	 9EccypI9LPD1U3UYQbScCn6JxLOkiWCQg22DaUvI=
Message-ID: <0b96bc4c-ab99-41b3-b959-66edf18f4250@ideasonboard.com>
Date: Tue, 1 Jul 2025 14:24:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: platform: Add Renesas Input Video Control
 block driver
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, jacopo.mondi@ideasonboard.com,
 biju.das.jz@bp.renesas.com
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
 <20250624-ivc-v2-2-e4ecdddb0a96@ideasonboard.com>
 <8301d2862546507303e2dba1dd61906b848552c2.camel@pengutronix.de>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <8301d2862546507303e2dba1dd61906b848552c2.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Philipp

On 01/07/2025 09:34, Philipp Zabel wrote:
> On Di, 2025-06-24 at 13:35 +0100, Daniel Scally wrote:
>> Add a driver for the Input Video Control block in an RZ/V2H SoC which
>> feeds data into the Arm Mali-C55 ISP.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v2:
>>
>> 	- Added selects and depends statements to Kconfig entry
>> 	- Fixed copyright year
>> 	- Stopped including in .c files headers already included in .h
>> 	- Fixed uninitialized variable in iterator
>> 	- Only check vvalid member in interrupt function and wait
>> 	  unconditionally elsewhere
>> 	- __maybe_unused for the PM ops
>> 	- Initialise the subdevice after setting up PM
>> 	- Fixed the remove function for the driver to actually do
>> 	  something.
>> 	- Some minor formatting changes
>> 	- Fixed the quantization member for the format
>> 	- Changes accounting for the v2 of the media jobs framework
>> 	- Change min_queued_buffers to 0
>> ---
>>   drivers/media/platform/renesas/Kconfig             |   2 +
>>   drivers/media/platform/renesas/Makefile            |   1 +
>>   drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  15 +
>>   drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
>>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 237 +++++++
>>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 379 ++++++++++++
>>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 678 +++++++++++++++++++++
>>   .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 133 ++++
>>   8 files changed, 1450 insertions(+)
>>
>> diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
>> index 27a54fa7908384f2e8200f0f7283a82b0ae8435c..5462e524c3708be87a50dd80d4b4017a2466aa99 100644
>> --- a/drivers/media/platform/renesas/Kconfig
>> +++ b/drivers/media/platform/renesas/Kconfig
>> @@ -42,6 +42,8 @@ config VIDEO_SH_VOU
>>   source "drivers/media/platform/renesas/rcar-isp/Kconfig"
>>   source "drivers/media/platform/renesas/rcar-vin/Kconfig"
>>   source "drivers/media/platform/renesas/rzg2l-cru/Kconfig"
>> +source "drivers/media/platform/renesas/rzv2h-ivc/Kconfig"
>> +
>>   
>>   # Mem2mem drivers
>>   
>> diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/platform/renesas/Makefile
>> index 1127259c09d6a51b70803e76c495918e06777f67..b6b4abf01db246aaf8269b8027efee9b0b32083a 100644
>> --- a/drivers/media/platform/renesas/Makefile
>> +++ b/drivers/media/platform/renesas/Makefile
>> @@ -6,6 +6,7 @@
>>   obj-y += rcar-isp/
>>   obj-y += rcar-vin/
>>   obj-y += rzg2l-cru/
>> +obj-y += rzv2h-ivc/
>>   obj-y += vsp1/
>>   
>>   obj-$(CONFIG_VIDEO_RCAR_CSI2) += rcar-csi2.o
>> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Kconfig b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3df8ff585c36fe7c74e1eb0408b344cbc2b4d898
>> --- /dev/null
>> +++ b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config VIDEO_RZV2H_IVC
>> +	tristate "Renesas RZ/V2H Input Video Control block driver"
>> +	depends on V4L_PLATFORM_DRIVERS
>> +	depends on VIDEO_DEV
>> +	depends on ARCH_RENESAS || COMPILE_TEST
>> +	depends on OF
>> +	select VIDEOBUF2_DMA_CONTIG
>> +	select MEDIA_CONTROLLER
>> +	select VIDEO_V4L2_SUBDEV_API
>> +	select RESET_CONTROLLER
> There is no need to select RESET_CONTROLLER, the API has stubs to allow
> compiling without it.
Ah - thanks for pointing that out
>
> regards
> Philipp

