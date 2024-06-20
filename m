Return-Path: <linux-media+bounces-13828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B991087B
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63308B222E8
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410571B0129;
	Thu, 20 Jun 2024 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IVGOl/TF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781C1AED35;
	Thu, 20 Jun 2024 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894000; cv=none; b=sKGzD5lBjtwr803Ah7oxCDewyFGkTjb9uhInLqbK7HOubQhUoCSE8FrbSzUcRQMp2yIz2XTNsVPXUEYqAnAMSYXHCIaZxZbXKZaaelVHl+MqU+YKFm5GBN7c85jGxOMbs7CQSNQqmofv8BRnNaZED7ReKX0IK/ggrLjQC+PP/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894000; c=relaxed/simple;
	bh=JC34wLleNM5lSiQt6LragGagVm1VaEpNTOA10FW6fU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3Cyw+OD4hYsOuTWAbo2PFaJi/Uo1GX2SprXf7nC+yfCJu4JJ3ZGdtoc2mFtmVjwC+HkxKvOHxfIxjBnSMH6oK8oGkog7/+Lf4aHkBX3GkzgFmz5XodDdLqdZft9ENkeWbWmVM8djjwD7FsiizUcSEJVFl6To19/5YgyVGvO6dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IVGOl/TF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1693A4C;
	Thu, 20 Jun 2024 16:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718893970;
	bh=JC34wLleNM5lSiQt6LragGagVm1VaEpNTOA10FW6fU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IVGOl/TFXX2esYwuJnuD7lb9qrWGOiI3m1PTDdeGbE2UPLGYZ9eKIEGlZWTgWq7pW
	 oEzojnf1KTpFNgtCoW7pVOj0x3elhA0yA9+OVMw0zwx/UaT5Vmhfe1GWe7zRYE23qp
	 y+8a8E8ARa4AzIqjknmsP9h6uyem6dWIn6wY7tNQ=
Message-ID: <8016bc19-674f-498e-967e-27a28b26ea1e@ideasonboard.com>
Date: Thu, 20 Jun 2024 15:33:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/16] media: mali-c55: Add Mali-C55 ISP driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 sakari.ailus@iki.fi
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-6-dan.scally@ideasonboard.com>
 <20240530001507.GG10586@pendragon.ideasonboard.com>
 <20240530214348.GA5213@pendragon.ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 xsFNBGLydlEBEADa5O2s0AbUguprfvXOQun/0a8y2Vk6BqkQALgeD6KnXSWwaoCULp18etYW
 B31bfgrdphXQ5kUQibB0ADK8DERB4wrzrUb5CMxLBFE7mQty+v5NsP0OFNK9XTaAOcmD+Ove
 eIjYvqurAaro91jrRVrS1gBRxIFqyPgNvwwL+alMZhn3/2jU2uvBmuRrgnc/e9cHKiuT3Dtq
 MHGPKL2m+plk+7tjMoQFfexoQ1JKugHAjxAhJfrkXh6uS6rc01bYCyo7ybzg53m1HLFJdNGX
 sUKR+dQpBs3SY4s66tc1sREJqdYyTsSZf80HjIeJjU/hRunRo4NjRIJwhvnK1GyjOvvuCKVU
 RWpY8dNjNu5OeAfdrlvFJOxIE9M8JuYCQTMULqd1NuzbpFMjc9524U3Cngs589T7qUMPb1H1
 NTA81LmtJ6Y+IV5/kiTUANflpzBwhu18Ok7kGyCq2a2jsOcVmk8gZNs04gyjuj8JziYwwLbf
 vzABwpFVcS8aR+nHIZV1HtOzyw8CsL8OySc3K9y+Y0NRpziMRvutrppzgyMb9V+N31mK9Mxl
 1YkgaTl4ciNWpdfUe0yxH03OCuHi3922qhPLF4XX5LN+NaVw5Xz2o3eeWklXdouxwV7QlN33
 u4+u2FWzKxDqO6WLQGjxPE0mVB4Gh5Pa1Vb0ct9Ctg0qElvtGQARAQABzShEYW4gU2NhbGx5
 IDxkYW4uc2NhbGx5QGlkZWFzb25ib2FyZC5jb20+wsGNBBMBCAA3FiEEsdtt8OWP7+8SNfQe
 kiQuh/L+GMQFAmLydlIFCQWjmoACGwMECwkIBwUVCAkKCwUWAgMBAAAKCRCSJC6H8v4YxDI2
 EAC2Gz0iyaXJkPInyshrREEWbo0CA6v5KKf3I/HlMPqkZ48bmGoYm4mEQGFWZJAT3K4ir8bg
 cEfs9V54gpbrZvdwS4abXbUK4WjKwEs8HK3XJv1WXUN2bsz5oEJWZUImh9gD3naiLLI9QMMm
 w/aZkT+NbN5/2KvChRWhdcha7+2Te4foOY66nIM+pw2FZM6zIkInLLUik2zXOhaZtqdeJZQi
 HSPU9xu7TRYN4cvdZAnSpG7gQqmLm5/uGZN1/sB3kHTustQtSXKMaIcD/DMNI3JN/t+RJVS7
 c0Jh/ThzTmhHyhxx3DRnDIy7kwMI4CFvmhkVC2uNs9kWsj1DuX5kt8513mvfw2OcX9UnNKmZ
 nhNCuF6DxVrL8wjOPuIpiEj3V+K7DFF1Cxw1/yrLs8dYdYh8T8vCY2CHBMsqpESROnTazboh
 AiQ2xMN1cyXtX11Qwqm5U3sykpLbx2BcmUUUEAKNsM//Zn81QXKG8vOx0ZdMfnzsCaCzt8f6
 9dcDBBI3tJ0BI9ByiocqUoL6759LM8qm18x3FYlxvuOs4wSGPfRVaA4yh0pgI+ModVC2Pu3y
 ejE/IxeatGqJHh6Y+iJzskdi27uFkRixl7YJZvPJAbEn7kzSi98u/5ReEA8Qhc8KO/B7wprj
 xjNMZNYd0Eth8+WkixHYj752NT5qshKJXcyUU87BTQRi8nZSARAAx0BJayh1Fhwbf4zoY56x
 xHEpT6DwdTAYAetd3yiKClLVJadYxOpuqyWa1bdfQWPb+h4MeXbWw/53PBgn7gI2EA7ebIRC
 PJJhAIkeym7hHZoxqDQTGDJjxFEL11qF+U3rhWiL2Zt0Pl+zFq0eWYYVNiXjsIS4FI2+4m16
 tPbDWZFJnSZ828VGtRDQdhXfx3zyVX21lVx1bX4/OZvIET7sVUufkE4hrbqrrufre7wsjD1t
 8MQKSapVrr1RltpzPpScdoxknOSBRwOvpp57pJJe5A0L7+WxJ+vQoQXj0j+5tmIWOAV1qBQp
 hyoyUk9JpPfntk2EKnZHWaApFp5TcL6c5LhUvV7F6XwOjGPuGlZQCWXee9dr7zym8iR3irWT
 +49bIh5PMlqSLXJDYbuyFQHFxoiNdVvvf7etvGfqFYVMPVjipqfEQ38ST2nkzx+KBICz7uwj
 JwLBdTXzGFKHQNckGMl7F5QdO/35An/QcxBnHVMXqaSd12tkJmoRVWduwuuoFfkTY5mUV3uX
 xGj3iVCK4V+ezOYA7c2YolfRCNMTza6vcK/P4tDjjsyBBZrCCzhBvd4VVsnnlZhVaIxoky4K
 aL+AP+zcQrUZmXmgZjXOLryGnsaeoVrIFyrU6ly90s1y3KLoPsDaTBMtnOdwxPmo1xisH8oL
 a/VRgpFBfojLPxMAEQEAAcLBfAQYAQgAJhYhBLHbbfDlj+/vEjX0HpIkLofy/hjEBQJi8nZT
 BQkFo5qAAhsMAAoJEJIkLofy/hjEXPcQAMIPNqiWiz/HKu9W4QIf1OMUpKn3YkVIj3p3gvfM
 Res4fGX94Ji599uLNrPoxKyaytC4R6BTxVriTJjWK8mbo9jZIRM4vkwkZZ2bu98EweSucxbp
 vjESsvMXGgxniqV/RQ/3T7LABYRoIUutARYq58p5HwSP0frF0fdFHYdTa2g7MYZl1ur2JzOC
 FHRpGadlNzKDE3fEdoMobxHB3Lm6FDml5GyBAA8+dQYVI0oDwJ3gpZPZ0J5Vx9RbqXe8RDuR
 du90hvCJkq7/tzSQ0GeD3BwXb9/R/A4dVXhaDd91Q1qQXidI+2jwhx8iqiYxbT+DoAUkQRQy
 xBtoCM1CxH7u45URUgD//fxYr3D4B1SlonA6vdaEdHZOGwECnDpTxecENMbz/Bx7qfrmd901
 D+N9SjIwrbVhhSyUXYnSUb8F+9g2RDY42Sk7GcYxIeON4VzKqWM7hpkXZ47pkK0YodO+dRKM
 yMcoUWrTK0Uz6UzUGKoJVbxmSW/EJLEGoI5p3NWxWtScEVv8mO49gqQdrRIOheZycDmHnItt
 9Qjv00uFhEwv2YfiyGk6iGF2W40s2pH2t6oeuGgmiZ7g6d0MEK8Ql/4zPItvr1c1rpwpXUC1
 u1kQWgtnNjFHX3KiYdqjcZeRBiry1X0zY+4Y24wUU0KsEewJwjhmCKAsju1RpdlPg2kC
In-Reply-To: <20240530214348.GA5213@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Laurent, thanks for the comments

On 30/05/2024 22:43, Laurent Pinchart wrote:
> And now the second part of the review, addressing mali-c55-capture.c and
> mali-c55-resizer.c. I've reviewed the code from the bottom up, so some
> messages may be repeated in an order that seems weird. Sorry about that.
>
> On Thu, May 30, 2024 at 03:15:10AM +0300, Laurent Pinchart wrote:
>> On Wed, May 29, 2024 at 04:28:47PM +0100, Daniel Scally wrote:
>>> Add a driver for Arm's Mali-C55 Image Signal Processor. The driver is
>>> V4L2 and Media Controller compliant and creates subdevices to manage
>>> the ISP itself, its internal test pattern generator as well as the
>>> crop, scaler and output format functionality for each of its two
>>> output devices.
>>>
>>> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
>>> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>> Changes in v5:
>>>
>>> 	- Reworked input formats - previously we allowed representing input data
>>> 	  as any 8-16 bit format. Now we only allow input data to be represented
>>> 	  by the new 20-bit bayer formats, which is corrected to the equivalent
>>> 	  16-bit format in RAW bypass mode.
>>> 	- Stopped bypassing blocks that we haven't added supporting parameters
>>> 	  for yet.
>>> 	- Addressed most of Sakari's comments from the list
>>>
>>> Changes not yet made in v5:
>>>
>>> 	- The output pipelines can still be started and stopped independently of
>>> 	  one another - I'd like to discuss that more.
>>> 	- the TPG subdev still uses .s_stream() - I need to rebase onto a tree
>>> 	  with working .enable_streams() for a single-source-pad subdevice.
>>>
>>> Changes in v4:
>>>
>>> 	- Reworked mali_c55_update_bits() to internally perform the bit-shift
>> I really don't like that, it makes the code very confusing, even more so
>> as it differs from regmap_update_bits().
>>
>> Look at this for instance:
>>
>> 	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
>> 			     MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK,
>> 			     MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK);
>>
>> It only works by change because MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK is
>> BIT(0).
>>
>> Sorry, I know it will be painful, but this change needs to be reverted.
>>
>>> 	- Reworked the resizer to allow cropping during streaming
>>> 	- Fixed a bug in NV12 output
>>>
>>> Changes in v3:
>>>
>>> 	- Mostly minor fixes suggested by Sakari
>>> 	- Fixed the sequencing of vb2 buffers to be synchronised across the two
>>> 	  capture devices.
>>>
>>> Changes in v2:
>>>
>>> 	- Clock handling
>>> 	- Fixed the warnings raised by the kernel test robot
>>>
>>>   drivers/media/platform/Kconfig                |   1 +
>>>   drivers/media/platform/Makefile               |   1 +
>>>   drivers/media/platform/arm/Kconfig            |   5 +
>>>   drivers/media/platform/arm/Makefile           |   2 +
>>>   drivers/media/platform/arm/mali-c55/Kconfig   |  18 +
>>>   drivers/media/platform/arm/mali-c55/Makefile  |   9 +
>>>   .../platform/arm/mali-c55/mali-c55-capture.c  | 951 ++++++++++++++++++
>>>   .../platform/arm/mali-c55/mali-c55-common.h   | 266 +++++
>>>   .../platform/arm/mali-c55/mali-c55-core.c     | 767 ++++++++++++++
>>>   .../platform/arm/mali-c55/mali-c55-isp.c      | 611 +++++++++++
>>>   .../arm/mali-c55/mali-c55-registers.h         | 258 +++++
>>>   .../arm/mali-c55/mali-c55-resizer-coefs.h     | 382 +++++++
>>>   .../platform/arm/mali-c55/mali-c55-resizer.c  | 779 ++++++++++++++
>>>   .../platform/arm/mali-c55/mali-c55-tpg.c      | 402 ++++++++
>>>   14 files changed, 4452 insertions(+)
>>>   create mode 100644 drivers/media/platform/arm/Kconfig
>>>   create mode 100644 drivers/media/platform/arm/Makefile
>>>   create mode 100644 drivers/media/platform/arm/mali-c55/Kconfig
>>>   create mode 100644 drivers/media/platform/arm/mali-c55/Makefile
>>>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-capture.c
>>>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-common.h
>>>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-core.c
>>>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>>>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>>>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer-coefs.h
>>>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
>>>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
>> I've skipped review of capture.c and resizer.c as I already have plenty
>> of comments for the other files, and it's getting late. I'll try to
>> review the rest tomorrow.
>>
>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>>> index 2d79bfc68c15..c929169766aa 100644
>>> --- a/drivers/media/platform/Kconfig
>>> +++ b/drivers/media/platform/Kconfig
>>> @@ -65,6 +65,7 @@ config VIDEO_MUX
>>>   source "drivers/media/platform/allegro-dvt/Kconfig"
>>>   source "drivers/media/platform/amlogic/Kconfig"
>>>   source "drivers/media/platform/amphion/Kconfig"
>>> +source "drivers/media/platform/arm/Kconfig"
>>>   source "drivers/media/platform/aspeed/Kconfig"
>>>   source "drivers/media/platform/atmel/Kconfig"
>>>   source "drivers/media/platform/broadcom/Kconfig"
>>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>>> index da17301f7439..9a647abd5218 100644
>>> --- a/drivers/media/platform/Makefile
>>> +++ b/drivers/media/platform/Makefile
>>> @@ -8,6 +8,7 @@
>>>   obj-y += allegro-dvt/
>>>   obj-y += amlogic/
>>>   obj-y += amphion/
>>> +obj-y += arm/
>>>   obj-y += aspeed/
>>>   obj-y += atmel/
>>>   obj-y += broadcom/
>>> diff --git a/drivers/media/platform/arm/Kconfig b/drivers/media/platform/arm/Kconfig
>>> new file mode 100644
>>> index 000000000000..4f0764c329c7
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/Kconfig
>>> @@ -0,0 +1,5 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +comment "ARM media platform drivers"
>>> +
>>> +source "drivers/media/platform/arm/mali-c55/Kconfig"
>>> diff --git a/drivers/media/platform/arm/Makefile b/drivers/media/platform/arm/Makefile
>>> new file mode 100644
>>> index 000000000000..8cc4918725ef
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/Makefile
>>> @@ -0,0 +1,2 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +obj-y += mali-c55/
>>> diff --git a/drivers/media/platform/arm/mali-c55/Kconfig b/drivers/media/platform/arm/mali-c55/Kconfig
>>> new file mode 100644
>>> index 000000000000..602085e28b01
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/mali-c55/Kconfig
>>> @@ -0,0 +1,18 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +config VIDEO_MALI_C55
>>> +	tristate "ARM Mali-C55 Image Signal Processor driver"
>>> +	depends on V4L_PLATFORM_DRIVERS
>>> +	depends on VIDEO_DEV && OF
>>> +	depends on ARCH_VEXPRESS || COMPILE_TEST
>>> +	select MEDIA_CONTROLLER
>>> +	select VIDEO_V4L2_SUBDEV_API
>>> +	select VIDEOBUF2_DMA_CONTIG
>>> +	select VIDEOBUF2_VMALLOC
>>> +	select V4L2_FWNODE
>>> +	select GENERIC_PHY_MIPI_DPHY
>> Alphabetical order ?
>>
>>> +	default n
>> That's the default, you don't have to specify ti.
>>
>>> +	help
>>> +	  Enable this to support Arm's Mali-C55 Image Signal Processor.
>>> +
>>> +	  To compile this driver as a module, choose M here: the module
>>> +	  will be called mali-c55.
>>> diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
>>> new file mode 100644
>>> index 000000000000..77dcb2fbf0f4
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/mali-c55/Makefile
>>> @@ -0,0 +1,9 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +
>>> +mali-c55-y := mali-c55-capture.o \
>>> +	      mali-c55-core.o \
>>> +	      mali-c55-isp.o \
>>> +	      mali-c55-tpg.o \
>>> +	      mali-c55-resizer.o
>> Alphabetical order here too.
>>
>>> +
>>> +obj-$(CONFIG_VIDEO_MALI_C55) += mali-c55.o
>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
>>> new file mode 100644
>>> index 000000000000..1d539ac9c498
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
>>> @@ -0,0 +1,951 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * ARM Mali-C55 ISP Driver - Video capture devices
>>> + *
>>> + * Copyright (C) 2024 Ideas on Board Oy
>>> + */
>>> +
>>> +#include <linux/cleanup.h>
>>> +#include <linux/minmax.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/string.h>
>>> +#include <linux/videodev2.h>
>>> +
>>> +#include <media/v4l2-dev.h>
>>> +#include <media/v4l2-event.h>
>>> +#include <media/v4l2-ioctl.h>
>>> +#include <media/v4l2-subdev.h>
>>> +#include <media/videobuf2-core.h>
>>> +#include <media/videobuf2-dma-contig.h>
>>> +
>>> +#include "mali-c55-common.h"
>>> +#include "mali-c55-registers.h"
>>> +
>>> +static const struct mali_c55_fmt mali_c55_fmts[] = {
>>> +	/*
>>> +	 * This table is missing some entries which need further work or
>>> +	 * investigation:
>>> +	 *
>>> +	 * Base mode 1 is a backwards V4L2_PIX_FMT_XRGB32 with no V4L2 equivalent
>>> +	 * Base mode 5 is "Generic Data"
>>> +	 * Base mode 8 is a backwards V4L2_PIX_FMT_XYUV32 - no V4L2 equivalent
>>> +	 * Base mode 9 seems to have no V4L2 equivalent
>>> +	 * Base mode 17, 19 and 20 describe formats which seem to have no V4L2
>>> +	 * equivalent
>>> +	 */
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_ARGB2101010,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_RGB121212_1X36,
>>> +			MEDIA_BUS_FMT_RGB202020_1X60,
>>> +		},
>>> +		.is_raw = false,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_A2R10G10B10,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_RGB565,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_RGB121212_1X36,
>>> +			MEDIA_BUS_FMT_RGB202020_1X60,
>>> +		},
>>> +		.is_raw = false,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_RGB565,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_BGR24,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_RGB121212_1X36,
>>> +			MEDIA_BUS_FMT_RGB202020_1X60,
>>> +		},
>>> +		.is_raw = false,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_RGB24,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_YUYV,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_YUV10_1X30,
>>> +		},
>>> +		.is_raw = false,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_YUY2,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_UYVY,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_YUV10_1X30,
>>> +		},
>>> +		.is_raw = false,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_UYVY,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_Y210,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_YUV10_1X30,
>>> +		},
>>> +		.is_raw = false,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_Y210,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +	/*
>>> +	 * This is something of a hack, the ISP thinks it's running NV12M but
>>> +	 * by setting uv_plane = 0 we simply discard that planes and only output
>>> +	 * the Y-plane.
>>> +	 */
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_GREY,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_YUV10_1X30,
>>> +		},
>>> +		.is_raw = false,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_NV12_21,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_NV12M,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_YUV10_1X30,
>>> +		},
>>> +		.is_raw = false,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_NV12_21,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT1
>>> +		}
>>> +	},
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_NV21M,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_YUV10_1X30,
>>> +		},
>>> +		.is_raw = false,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_NV12_21,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT2
>>> +		}
>>> +	},
>>> +	/*
>>> +	 * RAW uncompressed formats are all packed in 16 bpp.
>>> +	 * TODO: Expand this list to encompass all possible RAW formats.
>>> +	 */
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_SRGGB16,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_SRGGB16_1X16,
>>> +		},
>>> +		.is_raw = true,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_RAW16,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_SBGGR16,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_SBGGR16_1X16,
>>> +		},
>>> +		.is_raw = true,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_RAW16,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_SGBRG16,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_SGBRG16_1X16,
>>> +		},
>>> +		.is_raw = true,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_RAW16,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +	{
>>> +		.fourcc = V4L2_PIX_FMT_SGRBG16,
>>> +		.mbus_codes = {
>>> +			MEDIA_BUS_FMT_SGRBG16_1X16,
>>> +		},
>>> +		.is_raw = true,
>>> +		.registers = {
>>> +			.base_mode = MALI_C55_OUTPUT_RAW16,
>>> +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
>>> +		}
>>> +	},
>>> +};
>>> +
>>> +static bool mali_c55_mbus_code_can_produce_fmt(const struct mali_c55_fmt *fmt,
>>> +					       u32 code)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(fmt->mbus_codes); i++) {
>>> +		if (fmt->mbus_codes[i] == code)
>>> +			return true;
>>> +	}
>>> +
>>> +	return false;
>>> +}
>>> +
>>> +bool mali_c55_format_is_raw(unsigned int mbus_code)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(mali_c55_fmts); i++) {
>>> +		if (mali_c55_fmts[i].mbus_codes[0] == mbus_code)
>>> +			return mali_c55_fmts[i].is_raw;
>>> +	}
>>> +
>>> +	return false;
>>> +}
>>> +
>>> +static const struct mali_c55_fmt *mali_c55_format_from_pix(const u32 pixelformat)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(mali_c55_fmts); i++) {
>>> +		if (mali_c55_fmts[i].fourcc == pixelformat)
>>> +			return &mali_c55_fmts[i];
>>> +	}
>>> +
>>> +	/*
>>> +	 * If we find no matching pixelformat, we'll just default to the first
>>> +	 * one for now.
>>> +	 */
>>> +
>>> +	return &mali_c55_fmts[0];
>>> +}
>>> +
>>> +static const char * const capture_device_names[] = {
>>> +	"mali-c55 fr",
>>> +	"mali-c55 ds",
>>> +	"mali-c55 3a stats",
>>> +	"mali-c55 params",
> The last two entries are not used AFAICT, neither here, nor in
> subsequent patches.
>
>>> +};
>>> +
>>> +static const char *mali_c55_cap_dev_to_name(struct mali_c55_cap_dev *cap)
>>> +{
>>> +	if (cap->reg_offset == MALI_C55_CAP_DEV_FR_REG_OFFSET)
>>> +		return capture_device_names[0];
>>> +
>>> +	if (cap->reg_offset == MALI_C55_CAP_DEV_DS_REG_OFFSET)
>>> +		return capture_device_names[1];
>>> +
>>> +	return "params/stat not supported yet";
>>> +}
> Use cap_dev->vdev.name instead of mali_c55_cap_dev_to_name(cap_dev) and
> drop this function.
>
>>> +
>>> +static int mali_c55_link_validate(struct media_link *link)
>>> +{
>>> +	struct video_device *vdev =
>>> +		media_entity_to_video_device(link->sink->entity);
>>> +	struct mali_c55_cap_dev *cap_dev = video_get_drvdata(vdev);
>>> +	struct v4l2_subdev *sd =
>>> +		media_entity_to_v4l2_subdev(link->source->entity);
>>> +	const struct v4l2_pix_format_mplane *pix_mp;
>>> +	const struct mali_c55_fmt *cap_fmt;
>>> +	struct v4l2_subdev_format sd_fmt = {
>>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>> +		.pad = link->source->index,
>>> +	};
>>> +	int ret;
>>> +
>>> +	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	pix_mp = &cap_dev->mode.pix_mp;
>>> +	cap_fmt = cap_dev->mode.capture_fmt;
>>> +
>>> +	if (sd_fmt.format.width != pix_mp->width ||
>>> +	    sd_fmt.format.height != pix_mp->height) {
>>> +		dev_dbg(cap_dev->mali_c55->dev,
>>> +			"link '%s':%u -> '%s':%u not valid: %ux%u != %ux%u\n",
>>> +			link->source->entity->name, link->source->index,
>>> +			link->sink->entity->name, link->sink->index,
>>> +			sd_fmt.format.width, sd_fmt.format.height,
>>> +			pix_mp->width, pix_mp->height);
>>> +		return -EPIPE;
>>> +	}
>>> +
>>> +	if (!mali_c55_mbus_code_can_produce_fmt(cap_fmt, sd_fmt.format.code)) {
>>> +		dev_dbg(cap_dev->mali_c55->dev,
>>> +			"link '%s':%u -> '%s':%u not valid: mbus_code 0x%04x cannot produce pixel format %p4cc\n",
>>> +			link->source->entity->name, link->source->index,
>>> +			link->sink->entity->name, link->sink->index,
>>> +			sd_fmt.format.code, &pix_mp->pixelformat);
>>> +		return -EPIPE;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct media_entity_operations mali_c55_media_ops = {
>>> +	.link_validate = mali_c55_link_validate,
>>> +};
>>> +
>>> +static int mali_c55_vb2_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
>>> +				    unsigned int *num_planes, unsigned int sizes[],
>>> +				    struct device *alloc_devs[])
>>> +{
>>> +	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
>>> +	unsigned int i;
>>> +
>>> +	if (*num_planes) {
>>> +		if (*num_planes != cap_dev->mode.pix_mp.num_planes)
>>> +			return -EINVAL;
>>> +
>>> +		for (i = 0; i < cap_dev->mode.pix_mp.num_planes; i++)
>>> +			if (sizes[i] < cap_dev->mode.pix_mp.plane_fmt[i].sizeimage)
>>> +				return -EINVAL;
>>> +	} else {
>>> +		*num_planes = cap_dev->mode.pix_mp.num_planes;
>>> +		for (i = 0; i < cap_dev->mode.pix_mp.num_planes; i++)
>>> +			sizes[i] = cap_dev->mode.pix_mp.plane_fmt[i].sizeimage;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void mali_c55_buf_queue(struct vb2_buffer *vb)
>>> +{
>>> +	struct mali_c55_cap_dev *cap_dev = vb2_get_drv_priv(vb->vb2_queue);
>>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>> +	struct mali_c55_buffer *buf = container_of(vbuf,
>>> +						   struct mali_c55_buffer, vb);
>>> +	unsigned int i;
>>> +
>>> +	buf->plane_done[MALI_C55_PLANE_Y] = false;
>>> +
>>> +	/*
>>> +	 * If we're in a single-plane format we flag the other plane as done
>>> +	 * already so it's dequeued appropriately later
>>> +	 */
>>> +	buf->plane_done[MALI_C55_PLANE_UV] = cap_dev->mode.pix_mp.num_planes <= 1;
>>> +
>>> +	for (i = 0; i < cap_dev->mode.pix_mp.num_planes; i++) {
>>> +		unsigned long size = cap_dev->mode.pix_mp.plane_fmt[i].sizeimage;
>>> +
>>> +		vb2_set_plane_payload(vb, i, size);
>>> +	}
>>> +
>>> +	spin_lock(&cap_dev->buffers.lock);
>>> +	list_add_tail(&buf->queue, &cap_dev->buffers.queue);
>>> +	spin_unlock(&cap_dev->buffers.lock);
>>> +}
>>> +
>>> +static int mali_c55_buf_init(struct vb2_buffer *vb)
>>> +{
>>> +	struct mali_c55_cap_dev *cap_dev = vb2_get_drv_priv(vb->vb2_queue);
>>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>> +	struct mali_c55_buffer *buf = container_of(vbuf,
>>> +						   struct mali_c55_buffer, vb);
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < cap_dev->mode.pix_mp.num_planes; i++)
>>> +		buf->addrs[i] = vb2_dma_contig_plane_dma_addr(vb, i);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +void mali_c55_set_next_buffer(struct mali_c55_cap_dev *cap_dev)
>>> +{
>>> +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
>>> +
>>> +	guard(spinlock)(&cap_dev->buffers.lock);
>>> +
>>> +	cap_dev->buffers.curr = cap_dev->buffers.next;
>>> +	cap_dev->buffers.next = NULL;
>>> +
>>> +	if (!list_empty(&cap_dev->buffers.queue)) {
>>> +		struct v4l2_pix_format_mplane *pix_mp;
>>> +		const struct v4l2_format_info *info;
>>> +		u32 *addrs;
>>> +
>>> +		pix_mp = &cap_dev->mode.pix_mp;
>>> +		info = v4l2_format_info(pix_mp->pixelformat);
>>> +
>>> +		mali_c55_update_bits(mali_c55,
>>> +				MALI_C55_REG_Y_WRITER_MODE(cap_dev->reg_offset),
>>> +				MALI_C55_WRITER_FRAME_WRITE_MASK, 0x01);
>>> +		if (cap_dev->mode.capture_fmt->registers.uv_plane)
>>> +			mali_c55_update_bits(mali_c55,
>>> +				MALI_C55_REG_UV_WRITER_MODE(cap_dev->reg_offset),
>>> +				MALI_C55_WRITER_FRAME_WRITE_MASK, 0x01);
>>> +
>>> +		cap_dev->buffers.next = list_first_entry(&cap_dev->buffers.queue,
>>> +							 struct mali_c55_buffer,
>>> +							 queue);
>>> +		list_del(&cap_dev->buffers.next->queue);
>>> +
>>> +		addrs = cap_dev->buffers.next->addrs;
>>> +		mali_c55_write(mali_c55,
>>> +			MALI_C55_REG_Y_WRITER_BANKS_BASE(cap_dev->reg_offset),
>>> +			addrs[MALI_C55_PLANE_Y]);
>>> +		mali_c55_write(mali_c55,
>>> +			MALI_C55_REG_UV_WRITER_BANKS_BASE(cap_dev->reg_offset),
>>> +			addrs[MALI_C55_PLANE_UV]);
>>> +		mali_c55_write(mali_c55,
>>> +			MALI_C55_REG_Y_WRITER_OFFSET(cap_dev->reg_offset),
>>> +			pix_mp->width * info->bpp[MALI_C55_PLANE_Y]);
>>> +		mali_c55_write(mali_c55,
>>> +			MALI_C55_REG_UV_WRITER_OFFSET(cap_dev->reg_offset),
>>> +			pix_mp->width * info->bpp[MALI_C55_PLANE_UV]
>>> +			/ info->hdiv);
>>> +	} else {
>>> +		/*
>>> +		 * If we underflow then we can tell the ISP that we don't want
>>> +		 * to write out the next frame.
>>> +		 */
>>> +		mali_c55_update_bits(mali_c55,
>>> +				MALI_C55_REG_Y_WRITER_MODE(cap_dev->reg_offset),
>>> +				MALI_C55_WRITER_FRAME_WRITE_MASK, 0x00);
>>> +		mali_c55_update_bits(mali_c55,
>>> +				MALI_C55_REG_UV_WRITER_MODE(cap_dev->reg_offset),
>>> +				MALI_C55_WRITER_FRAME_WRITE_MASK, 0x00);
>>> +	}
>>> +}
>>> +
>>> +static void mali_c55_handle_buffer(struct mali_c55_buffer *curr_buf,
>>> +				   unsigned int framecount)
>>> +{
>>> +	curr_buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
>>> +	curr_buf->vb.field = V4L2_FIELD_NONE;
> The could be set already when the buffer is queued.
>
>>> +	curr_buf->vb.sequence = framecount;
>>> +	vb2_buffer_done(&curr_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>>> +}
>>> +
>>> +/**
>>> + * mali_c55_set_plane_done - mark the plane as written and process the buffer if
>>> + *			     both planes are finished.
>>> + * @cap_dev:  pointer to the fr or ds pipe output
>>> + * @plane:    the plane to mark as completed
>>> + *
>>> + * The Mali C55 ISP has muliplanar outputs for some formats that come with two
>>> + * separate "buffer write completed" interrupts - we need to flag each plane's
>>> + * completion and check whether both planes are done - if so, complete the buf
>>> + * in vb2.
>>> + */
>>> +void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
>>> +			     enum mali_c55_planes plane)
>>> +{
>>> +	struct mali_c55_isp *isp = &cap_dev->mali_c55->isp;
>>> +	struct mali_c55_buffer *curr_buf;
>>> +
>>> +	guard(spinlock)(&cap_dev->buffers.lock);
>>> +	curr_buf = cap_dev->buffers.curr;
>>> +
>>> +	/*
>>> +	 * This _should_ never happen. If no buffer was available from vb2 then
>>> +	 * we tell the ISP not to bother writing the next frame, which means the
>>> +	 * interrupts that call this function should never trigger. If it does
>>> +	 * happen then one of our assumptions is horribly wrong - complain
>>> +	 * loudly and do nothing.
>>> +	 */
>>> +	if (!curr_buf) {
>>> +		dev_err(cap_dev->mali_c55->dev, "%s null buffer in %s()\n",
>>> +			mali_c55_cap_dev_to_name(cap_dev), __func__);
>>> +		return;
>>> +	}
>>> +
>>> +	/* If the other plane is also done... */
>>> +	if (curr_buf->plane_done[~plane & 1]) {
>>> +		mali_c55_handle_buffer(curr_buf, isp->frame_sequence);
>>> +		cap_dev->buffers.curr = NULL;
>>> +		isp->frame_sequence++;
>>> +	} else {
>>> +		curr_buf->plane_done[plane] = true;
>>> +	}
>>> +}
>>> +
>>> +static void mali_c55_cap_dev_stream_disable(struct mali_c55_cap_dev *cap_dev)
>>> +{
>>> +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
>>> +
>>> +	mali_c55_update_bits(mali_c55,
>>> +			     MALI_C55_REG_Y_WRITER_MODE(cap_dev->reg_offset),
>>> +			     MALI_C55_WRITER_FRAME_WRITE_MASK, 0x00);
>>> +	mali_c55_update_bits(mali_c55,
>>> +			     MALI_C55_REG_UV_WRITER_MODE(cap_dev->reg_offset),
>>> +			     MALI_C55_WRITER_FRAME_WRITE_MASK, 0x00);
>>> +}
>>> +
>>> +static void mali_c55_cap_dev_stream_enable(struct mali_c55_cap_dev *cap_dev)
>>> +{
>>> +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
>>> +
>>> +	/*
>>> +	 * The Mali ISP can hold up to 5 buffer addresses and simply cycle
>>> +	 * through them, but it's not clear to me that the vb2 queue _guarantees_
>>> +	 * it will queue buffers to the driver in a fixed order, and ensuring
>>> +	 * we call vb2_buffer_done() for the right buffer seems to me to add
>>> +	 * pointless complexity given in multi-context mode we'd need to
>>> +	 * re-write those registers every frame anyway...so we tell the ISP to
>>> +	 * use a single register and update it for each frame.
>>> +	 */
> A single register sounds prone to error conditions. Is it at least
> shadowed in the hardware, or do you have to make sure you reprogram it
> during the vertical blanking only ?


It would have to be reprogrammed during the vertical blanking if we were running in a configuration 
with a single config space, otherwise you have the time it takes to process a frame plus vertical 
blanking. As I say, it'll have to work like this in multi-context mode anyway.


If we want to use the cycling...is it guaranteed that vb2 buffers will always be queued in order?

>
> I'll mostly skip buffer handling in this review, I need to first
> understand how the hardware operates to make an informed opinion.
>
>>> +	mali_c55_update_bits(mali_c55,
>>> +			MALI_C55_REG_Y_WRITER_BANKS_CONFIG(cap_dev->reg_offset),
>>> +			MALI_C55_REG_Y_WRITER_MAX_BANKS_MASK, 0);
>>> +	mali_c55_update_bits(mali_c55,
>>> +			MALI_C55_REG_UV_WRITER_BANKS_CONFIG(cap_dev->reg_offset),
>>> +			MALI_C55_REG_UV_WRITER_MAX_BANKS_MASK, 0);
>>> +
>>> +	/*
>>> +	 * We only queue a buffer in the streamon path if this is the first of
>>> +	 * the capture devices to start streaming. If the ISP is already running
>>> +	 * then we rely on the ISP_START interrupt to queue the first buffer for
>>> +	 * this capture device.
>>> +	 */
>>> +	if (mali_c55->pipe.start_count == 1)
>>> +		mali_c55_set_next_buffer(cap_dev);
> I think we'll have to revisit buffer handling to make sure it's 100%
> race-free.
>
>>> +}
>>> +
>>> +static void mali_c55_cap_dev_return_buffers(struct mali_c55_cap_dev *cap_dev,
>>> +					    enum vb2_buffer_state state)
>>> +{
>>> +	struct mali_c55_buffer *buf, *tmp;
>>> +
>>> +	guard(spinlock)(&cap_dev->buffers.lock);
>>> +
>>> +	if (cap_dev->buffers.curr) {
>>> +		vb2_buffer_done(&cap_dev->buffers.curr->vb.vb2_buf,
>>> +				state);
>>> +		cap_dev->buffers.curr = NULL;
>>> +	}
>>> +
>>> +	if (cap_dev->buffers.next) {
>>> +		vb2_buffer_done(&cap_dev->buffers.next->vb.vb2_buf,
>>> +				state);
>>> +		cap_dev->buffers.next = NULL;
>>> +	}
>>> +
>>> +	list_for_each_entry_safe(buf, tmp, &cap_dev->buffers.queue, queue) {
>>> +		list_del(&buf->queue);
>>> +		vb2_buffer_done(&buf->vb.vb2_buf, state);
>>> +	}
>>> +}
>>> +
>>> +static int mali_c55_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>>> +{
>>> +	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
>>> +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
>>> +	struct mali_c55_resizer *rzr = cap_dev->rzr;
>>> +	struct mali_c55_isp *isp = &mali_c55->isp;
>>> +	int ret;
>>> +
>>> +	guard(mutex)(&isp->lock);
> What's the reason for using the isp lock here and in
> mali_c55_vb2_stop_streaming() ? If you need a lock that covers all video
> nodes in order to synchronize start/stop, you may want to use the
> graph_mutex of the media device instead.


It's because I wanted to make sure that the ISP was in a known started/stopped state before possibly 
trying to start/stop it, which can be done from either of the two capture devices. This would go 
away if we were synchronising with the links anyway.

>
>>> +
>>> +	ret = pm_runtime_resume_and_get(mali_c55->dev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = video_device_pipeline_start(&cap_dev->vdev,
>>> +					  &cap_dev->mali_c55->pipe);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev, "%s failed to start media pipeline\n",
>>> +			mali_c55_cap_dev_to_name(cap_dev));
> Drop the message or make it dev_dbg() as it can be triggered by
> userspace.
>
>>> +		goto err_pm_put;
>>> +	}
>>> +
>>> +	mali_c55_cap_dev_stream_enable(cap_dev);
>>> +	mali_c55_rzr_start_stream(rzr);
>>> +
>>> +	/*
>>> +	 * We only start the ISP if we're the only capture device that's
>>> +	 * streaming. Otherwise, it'll already be active.
>>> +	 */
> I still think we should use link setup to indicate which video devices
> userspace plans to use, and then only start when they're all started.
> That includes stats and parameters buffers. We can continue this
> discussion in the context of the previous version of the patch series,
> or here, up to you.

Let's just continue here. I think I called it "clunky" before; from my perspective it's an 
unnecessary extra step - we can already signal to the driver that we don't want to use the video 
devices by not queuing buffers to them or starting the stream on them and although I understand that 
that means that one of the two image data capture devices will receive data before the other, I 
don't understand why that's considered to be a problem. Possibly that last part is the stickler; can 
you explain a bit why it's an issue for one capture queue to start earlier than the other?


>
>>> +	if (mali_c55->pipe.start_count == 1) {
>>> +		ret = mali_c55_isp_start_stream(isp);
>>> +		if (ret)
>>> +			goto err_disable_cap_dev;
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +err_disable_cap_dev:
>>> +	mali_c55_cap_dev_stream_disable(cap_dev);
>>> +	video_device_pipeline_stop(&cap_dev->vdev);
>>> +err_pm_put:
>>> +	pm_runtime_put(mali_c55->dev);
>>> +	mali_c55_cap_dev_return_buffers(cap_dev, VB2_BUF_STATE_QUEUED);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void mali_c55_vb2_stop_streaming(struct vb2_queue *q)
>>> +{
>>> +	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
>>> +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
>>> +	struct mali_c55_resizer *rzr = cap_dev->rzr;
>>> +	struct mali_c55_isp *isp = &mali_c55->isp;
>>> +
>>> +	guard(mutex)(&isp->lock);
>>> +
>>> +	/*
>>> +	 * If one of the other capture nodes is streaming, we shouldn't
>>> +	 * disable the ISP here.
>>> +	 */
>>> +	if (mali_c55->pipe.start_count == 1)
>>> +		mali_c55_isp_stop_stream(&mali_c55->isp);
>>> +
>>> +	mali_c55_rzr_stop_stream(rzr);
>>> +	mali_c55_cap_dev_stream_disable(cap_dev);
>>> +	mali_c55_cap_dev_return_buffers(cap_dev, VB2_BUF_STATE_ERROR);
>>> +	video_device_pipeline_stop(&cap_dev->vdev);
>>> +	pm_runtime_put(mali_c55->dev);
> I think runtime PM autosuspend would be very useful, as it will ensure
> that stop-reconfigure-start cycles get handled as efficiently as
> possible without powering the device down. It could be done on top as a
> separate patch.
Alright
>>> +}
>>> +
>>> +static const struct vb2_ops mali_c55_vb2_ops = {
>>> +	.queue_setup		= &mali_c55_vb2_queue_setup,
>>> +	.buf_queue		= &mali_c55_buf_queue,
>>> +	.buf_init		= &mali_c55_buf_init,
>>> +	.wait_prepare		= vb2_ops_wait_prepare,
>>> +	.wait_finish		= vb2_ops_wait_finish,
>>> +	.start_streaming	= &mali_c55_vb2_start_streaming,
>>> +	.stop_streaming		= &mali_c55_vb2_stop_streaming,
>>> +};
>>> +
>>> +static const struct v4l2_file_operations mali_c55_v4l2_fops = {
>>> +	.owner = THIS_MODULE,
>>> +	.unlocked_ioctl = video_ioctl2,
>>> +	.open = v4l2_fh_open,
>>> +	.release = vb2_fop_release,
>>> +	.poll = vb2_fop_poll,
>>> +	.mmap = vb2_fop_mmap,
>>> +};
>>> +
>>> +static void mali_c55_try_fmt(struct v4l2_pix_format_mplane *pix_mp)
>>> +{
>>> +	const struct mali_c55_fmt *capture_format;
>>> +	const struct v4l2_format_info *info;
>>> +	struct v4l2_plane_pix_format *plane;
>>> +	unsigned int i;
>>> +
>>> +	capture_format = mali_c55_format_from_pix(pix_mp->pixelformat);
>>> +	pix_mp->pixelformat = capture_format->fourcc;
>>> +
>>> +	pix_mp->width = clamp(pix_mp->width, MALI_C55_MIN_WIDTH,
>>> +			      MALI_C55_MAX_WIDTH);
>>> +	pix_mp->height = clamp(pix_mp->height, MALI_C55_MIN_HEIGHT,
>>> +			       MALI_C55_MAX_HEIGHT);
> Ah, these clamps are right :-)
Hurrah!
>
>>> +
>>> +	pix_mp->field = V4L2_FIELD_NONE;
>>> +	pix_mp->colorspace = V4L2_COLORSPACE_DEFAULT;
>>> +	pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>>> +	pix_mp->quantization = V4L2_QUANTIZATION_DEFAULT;
>>> +
>>> +	info = v4l2_format_info(pix_mp->pixelformat);
> This function may return NULL. That shouldn't be the case as long as it
> supports all formats that the C55 driver supports, so I suppose it's
> safe.
>
>>> +	pix_mp->num_planes = info->mem_planes;
>>> +	memset(pix_mp->plane_fmt, 0, sizeof(pix_mp->plane_fmt));
>>> +
>>> +	pix_mp->plane_fmt[0].bytesperline = info->bpp[0] * pix_mp->width;
> Does the hardware support configurable line strides ? If so we should
> support it.


You have to set the line stride in the DMA writer registers, which we do using this same 
value...might userspace have set bytesperline already then or something? Or is there some other 
place it could be configured?

>
>>> +	pix_mp->plane_fmt[0].sizeimage = info->bpp[0] * pix_mp->width
>>> +				       * pix_mp->height;
> 	pix_mp->plane_fmt[0].sizeimage = pix_mp->plane_fmt[0].bytesperline
> 				       * pix_mp->height;
>
>>> +
>>> +	for (i = 1; i < info->comp_planes; i++) {
>>> +		plane = &pix_mp->plane_fmt[i];
>>> +
>>> +		plane->bytesperline = DIV_ROUND_UP(info->bpp[i] * pix_mp->width,
>>> +						   info->hdiv);
>>> +		plane->sizeimage = DIV_ROUND_UP(
>>> +					plane->bytesperline * pix_mp->height,
>>> +					info->vdiv);
>>> +	}
>>> +
>>> +	if (info->mem_planes == 1) {
>>> +		for (i = 1; i < info->comp_planes; i++) {
>>> +			plane = &pix_mp->plane_fmt[i];
>>> +			pix_mp->plane_fmt[0].sizeimage += plane->sizeimage;
>>> +		}
>>> +	}
> I'm wondering, could v4l2_fill_pixfmt_mp() help ? It doesn't support
> configurable strides though :-S Maybe the helper could be improved, if
> it's close enough to what you need ?

I'll take a look
>>> +}
>>> +
>>> +static int mali_c55_try_fmt_vid_cap_mplane(struct file *file, void *fh,
>>> +					   struct v4l2_format *f)
>>> +{
>>> +	mali_c55_try_fmt(&f->fmt.pix_mp);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void mali_c55_set_format(struct mali_c55_cap_dev *cap_dev,
>>> +				struct v4l2_pix_format_mplane *pix_mp)
>>> +{
>>> +	const struct mali_c55_fmt *capture_format;
>>> +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
>>> +	const struct v4l2_format_info *info;
>>> +
>>> +	mali_c55_try_fmt(pix_mp);
>>> +	capture_format = mali_c55_format_from_pix(pix_mp->pixelformat);
>>> +	info = v4l2_format_info(pix_mp->pixelformat);
>>> +	if (WARN_ON(!info))
>>> +		return;
>>> +
>>> +	mali_c55_write(mali_c55,
>>> +		       MALI_C55_REG_Y_WRITER_MODE(cap_dev->reg_offset),
>>> +		       capture_format->registers.base_mode);
>>> +	mali_c55_write(mali_c55,
>>> +		       MALI_C55_REG_ACTIVE_OUT_Y_SIZE(cap_dev->reg_offset),
>>> +		       MALI_C55_REG_ACTIVE_OUT_SIZE_W(pix_mp->width) |
>>> +		       MALI_C55_REG_ACTIVE_OUT_SIZE_H(pix_mp->height));
> Could the register writes be moved to stream start time ?
>
>>> +
>>> +	if (info->mem_planes > 1) {
>>> +		mali_c55_write(mali_c55,
>>> +			       MALI_C55_REG_UV_WRITER_MODE(cap_dev->reg_offset),
>>> +			       capture_format->registers.base_mode);
>>> +		mali_c55_update_bits(mali_c55,
>>> +				MALI_C55_REG_UV_WRITER_MODE(cap_dev->reg_offset),
>>> +				MALI_C55_WRITER_SUBMODE_MASK,
>>> +				capture_format->registers.uv_plane);
>>> +
>>> +		mali_c55_write(mali_c55,
>>> +			MALI_C55_REG_ACTIVE_OUT_UV_SIZE(cap_dev->reg_offset),
>>> +			MALI_C55_REG_ACTIVE_OUT_SIZE_W(pix_mp->width) |
>>> +			MALI_C55_REG_ACTIVE_OUT_SIZE_H(pix_mp->height));
>>> +	}
>>> +
>>> +	if (info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
>>> +		/*
>>> +		 * TODO: Figure out the colour matrix coefficients and calculate
>>> +		 * and write them here.
>>> +		 */
> Ideally they should also be exposed directly to userspace as ISP
> parameters. I would probably go as far as saying that they should come
> directly from userspace, and not derived from the colorspace fields.


Yes I think I agree, I'll drop the todo from here.

>
>>> +
>>> +		mali_c55_write(mali_c55,
>>> +			       MALI_C55_REG_CS_CONV_CONFIG(cap_dev->reg_offset),
>>> +			       MALI_C55_CS_CONV_MATRIX_MASK);
>>> +
>>> +		if (info->hdiv > 1)
>>> +			mali_c55_update_bits(mali_c55,
>>> +				MALI_C55_REG_CS_CONV_CONFIG(cap_dev->reg_offset),
>>> +				MALI_C55_CS_CONV_HORZ_DOWNSAMPLE_MASK, 0x01);
>>> +		if (info->vdiv > 1)
>>> +			mali_c55_update_bits(mali_c55,
>>> +				MALI_C55_REG_CS_CONV_CONFIG(cap_dev->reg_offset),
>>> +				MALI_C55_CS_CONV_VERT_DOWNSAMPLE_MASK, 0x01);
>>> +		if (info->hdiv > 1 || info->vdiv > 1)
>>> +			mali_c55_update_bits(mali_c55,
>>> +				MALI_C55_REG_CS_CONV_CONFIG(cap_dev->reg_offset),
>>> +				MALI_C55_CS_CONV_FILTER_MASK, 0x01);
>>> +	}
>>> +
>>> +	cap_dev->mode.pix_mp = *pix_mp;
>>> +	cap_dev->mode.capture_fmt = capture_format;
>>> +}
>>> +
>>> +static int mali_c55_s_fmt_vid_cap_mplane(struct file *file, void *fh,
>>> +					 struct v4l2_format *f)
>>> +{
>>> +	struct mali_c55_cap_dev *cap_dev = video_drvdata(file);
>>> +
>>> +	if (vb2_is_busy(&cap_dev->queue))
>>> +		return -EBUSY;
>>> +
>>> +	mali_c55_set_format(cap_dev, &f->fmt.pix_mp);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_g_fmt_vid_cap_mplane(struct file *file, void *fh,
>>> +					 struct v4l2_format *f)
>>> +{
>>> +	struct mali_c55_cap_dev *cap_dev = video_drvdata(file);
>>> +
>>> +	f->fmt.pix_mp = cap_dev->mode.pix_mp;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_enum_fmt_vid_cap_mplane(struct file *file, void *fh,
>>> +					    struct v4l2_fmtdesc *f)
>>> +{
>>> +	struct mali_c55_cap_dev *cap_dev = video_drvdata(file);
>>> +	unsigned int j = 0;
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(mali_c55_fmts); i++) {
>>> +		if (f->mbus_code &&
>>> +		    !mali_c55_mbus_code_can_produce_fmt(&mali_c55_fmts[i],
>>> +						       f->mbus_code))
> Small indentation mistake.
>
>>> +			continue;
>>> +
>>> +		/* Downscale pipe can't output RAW formats */
>>> +		if (mali_c55_fmts[i].is_raw &&
>>> +		    cap_dev->reg_offset == MALI_C55_CAP_DEV_DS_REG_OFFSET)
>>> +			continue;
>>> +
>>> +		if (j++ == f->index) {
>>> +			f->pixelformat = mali_c55_fmts[i].fourcc;
>>> +			return 0;
>>> +		}
>>> +	}
>>> +
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int mali_c55_querycap(struct file *file, void *fh,
>>> +			     struct v4l2_capability *cap)
>>> +{
>>> +	strscpy(cap->driver, MALI_C55_DRIVER_NAME, sizeof(cap->driver));
>>> +	strscpy(cap->card, "ARM Mali-C55 ISP", sizeof(cap->card));
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct v4l2_ioctl_ops mali_c55_v4l2_ioctl_ops = {
>>> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
>>> +	.vidioc_querybuf = vb2_ioctl_querybuf,
>>> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
>>> +	.vidioc_qbuf = vb2_ioctl_qbuf,
>>> +	.vidioc_expbuf = vb2_ioctl_expbuf,
>>> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
>>> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>>> +	.vidioc_streamon = vb2_ioctl_streamon,
>>> +	.vidioc_streamoff = vb2_ioctl_streamoff,
>>> +	.vidioc_try_fmt_vid_cap_mplane = mali_c55_try_fmt_vid_cap_mplane,
>>> +	.vidioc_s_fmt_vid_cap_mplane = mali_c55_s_fmt_vid_cap_mplane,
>>> +	.vidioc_g_fmt_vid_cap_mplane = mali_c55_g_fmt_vid_cap_mplane,
>>> +	.vidioc_enum_fmt_vid_cap = mali_c55_enum_fmt_vid_cap_mplane,
>>> +	.vidioc_querycap = mali_c55_querycap,
>>> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>>> +};
>>> +
>>> +int mali_c55_register_capture_devs(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct v4l2_pix_format_mplane pix_mp;
>>> +	struct mali_c55_cap_dev *cap_dev;
>>> +	struct video_device *vdev;
>>> +	struct vb2_queue *vb2q;
>>> +	unsigned int i;
>>> +	int ret;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(mali_c55->cap_devs); i++) {
> Moving the inner content to a separate mali_c55_register_capture_dev()
> function would increase readability I think, and remove usage of gotos.
> I would probably do the same for unregistration too, for consistency.
>
>>> +		cap_dev = &mali_c55->cap_devs[i];
>>> +		vdev = &cap_dev->vdev;
>>> +		vb2q = &cap_dev->queue;
>>> +
>>> +		/*
>>> +		 * The downscale output pipe is an optional block within the ISP
>>> +		 * so we need to check whether it's actually been fitted or not.
>>> +		 */
>>> +
>>> +		if (i == MALI_C55_CAP_DEV_DS &&
>>> +		    !(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED))
>>> +			continue;
> Given that there's only two capture devices, and one is optional, when
> moving the inner code to a separate function you could unroll the loop.
> Up to you.
>
>>> +
>>> +		cap_dev->mali_c55 = mali_c55;
>>> +		mutex_init(&cap_dev->lock);
>>> +		INIT_LIST_HEAD(&cap_dev->buffers.queue);
>>> +
>>> +		switch (i) {
>>> +		case MALI_C55_CAP_DEV_FR:
>>> +			cap_dev->rzr = &mali_c55->resizers[MALI_C55_RZR_FR];
>>> +			cap_dev->reg_offset = MALI_C55_CAP_DEV_FR_REG_OFFSET;
>>> +			break;
>>> +		case MALI_C55_CAP_DEV_DS:
>>> +			cap_dev->rzr = &mali_c55->resizers[MALI_C55_RZR_DS];
>>> +			cap_dev->reg_offset = MALI_C55_CAP_DEV_DS_REG_OFFSET;
>>> +			break;
>>> +		default:
> That can't happen.
>
>>> +			mutex_destroy(&cap_dev->lock);
>>> +			ret = -EINVAL;
>>> +			goto err_destroy_mutex;
>>> +		}
>>> +
>>> +		cap_dev->pad.flags = MEDIA_PAD_FL_SINK;
>>> +		ret = media_entity_pads_init(&cap_dev->vdev.entity, 1, &cap_dev->pad);
>>> +		if (ret) {
>>> +			mutex_destroy(&cap_dev->lock);
>>> +			goto err_destroy_mutex;
>>> +		}
>>> +
>>> +		vb2q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>> +		vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
>>> +		vb2q->drv_priv = cap_dev;
>>> +		vb2q->mem_ops = &vb2_dma_contig_memops;
>>> +		vb2q->ops = &mali_c55_vb2_ops;
>>> +		vb2q->buf_struct_size = sizeof(struct mali_c55_buffer);
>>> +		vb2q->min_queued_buffers = 1;
>>> +		vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>> +		vb2q->lock = &cap_dev->lock;
>>> +		vb2q->dev = mali_c55->dev;
>>> +
>>> +		ret = vb2_queue_init(vb2q);
>>> +		if (ret) {
>>> +			dev_err(mali_c55->dev, "%s vb2 queue init failed\n",
>>> +				mali_c55_cap_dev_to_name(cap_dev));
>>> +			goto err_cleanup_media_entity;
>>> +		}
>>> +
>>> +		strscpy(cap_dev->vdev.name, capture_device_names[i],
>>> +			sizeof(cap_dev->vdev.name));
>>> +		vdev->release = video_device_release_empty;
>>> +		vdev->fops = &mali_c55_v4l2_fops;
>>> +		vdev->ioctl_ops = &mali_c55_v4l2_ioctl_ops;
>>> +		vdev->lock = &cap_dev->lock;
>>> +		vdev->v4l2_dev = &mali_c55->v4l2_dev;
>>> +		vdev->queue = &cap_dev->queue;
>>> +		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>>> +				    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
>>> +		vdev->entity.ops = &mali_c55_media_ops;
>>> +		video_set_drvdata(vdev, cap_dev);
>>> +
>>> +		memset(&pix_mp, 0, sizeof(pix_mp));
>>> +		pix_mp.pixelformat = V4L2_PIX_FMT_RGB565;
>>> +		pix_mp.width = MALI_C55_DEFAULT_WIDTH;
>>> +		pix_mp.height = MALI_C55_DEFAULT_HEIGHT;
>>> +		mali_c55_set_format(cap_dev, &pix_mp);
>>> +
>>> +		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>>> +		if (ret) {
>>> +			dev_err(mali_c55->dev,
>>> +				"%s failed to register video device\n",
>>> +				mali_c55_cap_dev_to_name(cap_dev));
>>> +			goto err_release_vb2q;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +err_release_vb2q:
>>> +	vb2_queue_release(vb2q);
>>> +err_cleanup_media_entity:
>>> +	media_entity_cleanup(&cap_dev->vdev.entity);
>>> +err_destroy_mutex:
>>> +	mutex_destroy(&cap_dev->lock);
>>> +	mali_c55_unregister_capture_devs(mali_c55);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct mali_c55_cap_dev *cap_dev;
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(mali_c55->cap_devs); i++) {
>>> +		cap_dev = &mali_c55->cap_devs[i];
>>> +
>>> +		if (!video_is_registered(&cap_dev->vdev))
>>> +			continue;
>>> +
>>> +		vb2_video_unregister_device(&cap_dev->vdev);
>>> +		media_entity_cleanup(&cap_dev->vdev.entity);
>>> +		mutex_destroy(&cap_dev->lock);
>>> +	}
>>> +}
>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
>>> new file mode 100644
>>> index 000000000000..2d0c4d152beb
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
>>> @@ -0,0 +1,266 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * ARM Mali-C55 ISP Driver - Common definitions
>>> + *
>>> + * Copyright (C) 2024 Ideas on Board Oy
>>> + */
>>> +
>>> +#ifndef _MALI_C55_COMMON_H
>>> +#define _MALI_C55_COMMON_H
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/io.h>
>>> +#include <linux/list.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/scatterlist.h>
>> I don't think this is needed. You're however missing spinlock.h.
>>
>>> +#include <linux/videodev2.h>
>>> +
>>> +#include <media/media-device.h>
>>> +#include <media/v4l2-async.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-dev.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-subdev.h>
>>> +#include <media/videobuf2-core.h>
>>> +#include <media/videobuf2-v4l2.h>
>>> +
>>> +#define MALI_C55_DRIVER_NAME		"mali-c55"
>>> +
>>> +/* min and max values for the image sizes */
>>> +#define MALI_C55_MIN_WIDTH		640U
>>> +#define MALI_C55_MIN_HEIGHT		480U
>>> +#define MALI_C55_MAX_WIDTH		8192U
>>> +#define MALI_C55_MAX_HEIGHT		8192U
>>> +#define MALI_C55_DEFAULT_WIDTH		1920U
>>> +#define MALI_C55_DEFAULT_HEIGHT		1080U
>>> +
>>> +#define MALI_C55_DEFAULT_MEDIA_BUS_FMT	MEDIA_BUS_FMT_RGB121212_1X36
>>> +
>>> +struct mali_c55;
>>> +struct mali_c55_cap_dev;
>>> +struct platform_device;
>> You should also forward-declare
>>
>> struct device;
>> struct dma_chan;
>> struct resource;
>>
>>> +
>>> +static const char * const mali_c55_clk_names[] = {
>>> +	"aclk",
>>> +	"hclk",
>>> +};
>> This will end up duplicating the array in each compilation unit, not
>> great. Move it to mali-c55-core.c. You use it in this file just for its
>> size, replace that with a macro that defines the size, or allocate
>> mali_c55.clks dynamically with devm_kcalloc().
>>
>>> +
>>> +enum mali_c55_interrupts {
>>> +	MALI_C55_IRQ_ISP_START,
>>> +	MALI_C55_IRQ_ISP_DONE,
>>> +	MALI_C55_IRQ_MCM_ERROR,
>>> +	MALI_C55_IRQ_BROKEN_FRAME_ERROR,
>>> +	MALI_C55_IRQ_MET_AF_DONE,
>>> +	MALI_C55_IRQ_MET_AEXP_DONE,
>>> +	MALI_C55_IRQ_MET_AWB_DONE,
>>> +	MALI_C55_IRQ_AEXP_1024_DONE,
>>> +	MALI_C55_IRQ_IRIDIX_MET_DONE,
>>> +	MALI_C55_IRQ_LUT_INIT_DONE,
>>> +	MALI_C55_IRQ_FR_Y_DONE,
>>> +	MALI_C55_IRQ_FR_UV_DONE,
>>> +	MALI_C55_IRQ_DS_Y_DONE,
>>> +	MALI_C55_IRQ_DS_UV_DONE,
>>> +	MALI_C55_IRQ_LINEARIZATION_DONE,
>>> +	MALI_C55_IRQ_RAW_FRONTEND_DONE,
>>> +	MALI_C55_IRQ_NOISE_REDUCTION_DONE,
>>> +	MALI_C55_IRQ_IRIDIX_DONE,
>>> +	MALI_C55_IRQ_BAYER2RGB_DONE,
>>> +	MALI_C55_IRQ_WATCHDOG_TIMER,
>>> +	MALI_C55_IRQ_FRAME_COLLISION,
>>> +	MALI_C55_IRQ_UNUSED,
>>> +	MALI_C55_IRQ_DMA_ERROR,
>>> +	MALI_C55_IRQ_INPUT_STOPPED,
>>> +	MALI_C55_IRQ_MET_AWB_TARGET1_HIT,
>>> +	MALI_C55_IRQ_MET_AWB_TARGET2_HIT,
>>> +	MALI_C55_NUM_IRQ_BITS
>> Those are register bits, I think they belong to mali-c55-registers.h,
>> and should probably be macros instead of an enum.
>>
>>> +};
>>> +
>>> +enum mali_c55_isp_pads {
>>> +	MALI_C55_ISP_PAD_SINK_VIDEO,
>> As there's a single sink pad, maybe MALI_C55_ISP_PAD_SINK ? Ah, you're
>> probably preparing for ISP parameters support. It's fine.
>>
>>> +	MALI_C55_ISP_PAD_SOURCE,
>> Then maybe this should be named MALI_C55_ISP_PAD_SOURCE_VIDEO as I
>> assume there will be a stats source pad.
>>
>>> +	MALI_C55_ISP_PAD_SOURCE_BYPASS,
>>> +	MALI_C55_ISP_NUM_PADS,
>>> +};
>>> +
>>> +struct mali_c55_tpg {
>>> +	struct mali_c55 *mali_c55;
>>> +	struct v4l2_subdev sd;
>>> +	struct media_pad pad;
>>> +	struct mutex lock;
>>> +	struct mali_c55_tpg_ctrls {
>>> +		struct v4l2_ctrl_handler handler;
>>> +		struct v4l2_ctrl *test_pattern;
>> Set but never used. You can drop it.
>>
>>> +		struct v4l2_ctrl *hblank;
>> Set and used only once, in the same function. You can make it a local
>> variable.
>>
>>> +		struct v4l2_ctrl *vblank;
>>> +	} ctrls;
>>> +};
>> I wonder if this file should be split, with mali-c55-capture.h,
>> mali-c55-core.h, mali-c55-isp.h, ... I think it could increase
>> readability by clearly separating the different elements. Up to you.
>>
>>> +
>>> +struct mali_c55_isp {
>>> +	struct mali_c55 *mali_c55;
>>> +	struct v4l2_subdev sd;
>>> +	struct media_pad pads[MALI_C55_ISP_NUM_PADS];
>>> +	struct media_pad *remote_src;
>>> +	struct v4l2_async_notifier notifier;
>> I'm tempted to move the notifier to mali_c55, as it's related to
>> components external to the whole ISP, not to the ISP subdev itself.
>> Could you give it a try, to see if it could be done without any drawback
>> ?
>>
>>> +	struct mutex lock;
>> Locks require a comment to explain what they protect. Same below where
>> applicable (for both mutexes and spinlocks).
>>
>>> +	unsigned int frame_sequence;
>>> +};
>>> +
>>> +enum mali_c55_resizer_ids {
>>> +	MALI_C55_RZR_FR,
>>> +	MALI_C55_RZR_DS,
>>> +	MALI_C55_NUM_RZRS,
>> The usual abbreviation for "resizer" in drivers/media/ is "rsz", not
>> "rzr". I would have said we can leave it as-is as changing it would be a
>> bit annoying, but I then realized that "rzr" is not just unusual, it's
>> actually not used at all. Would you mind applying a sed globally ? :-)
>>
>>> +};
>>> +
>>> +enum mali_c55_rzr_pads {
>> Same enums/structs use abbreviations, some don't. Consistency would
>> help.
>>
>>> +	MALI_C55_RZR_SINK_PAD,
>>> +	MALI_C55_RZR_SOURCE_PAD,
>>> +	MALI_C55_RZR_SINK_BYPASS_PAD,
>>> +	MALI_C55_RZR_NUM_PADS
>>> +};
>>> +
>>> +struct mali_c55_resizer {
>>> +	struct mali_c55 *mali_c55;
>>> +	struct mali_c55_cap_dev *cap_dev;
>>> +	enum mali_c55_resizer_ids id;
>>> +	struct v4l2_subdev sd;
>>> +	struct media_pad pads[MALI_C55_RZR_NUM_PADS];
>>> +	unsigned int num_routes;
>>> +	bool streaming;
>>> +};
>>> +
>>> +enum mali_c55_cap_devs {
>>> +	MALI_C55_CAP_DEV_FR,
>>> +	MALI_C55_CAP_DEV_DS,
>>> +	MALI_C55_NUM_CAP_DEVS
>>> +};
>>> +
>>> +struct mali_c55_fmt {
>> mali_c55_format_info would be a better name I think, as this stores
>> format information, not formats.
>>
>>> +	u32 fourcc;
>>> +	unsigned int mbus_codes[2];
>> A comment to explain why we have two media bus codes would be useful.
>> You can document the whole structure if desired :-)
>>
>>> +	bool is_raw;
>>> +	struct mali_c55_fmt_registers {
>> Make it an anonymous structure, it's never used anywhere else.
>>
>>> +		unsigned int base_mode;
>>> +		unsigned int uv_plane;
>> If those are register field values, use u32 instead of unsigned int.
>>
>>> +	} registers;
>> It's funny, we tend to abbreviate different things, I would have used
>> "regs" here but written "format" in full in the structure name :-)
>>
>>> +};
>>> +
>>> +enum mali_c55_isp_bayer_order {
>>> +	MALI_C55_BAYER_ORDER_RGGB,
>>> +	MALI_C55_BAYER_ORDER_GRBG,
>>> +	MALI_C55_BAYER_ORDER_GBRG,
>>> +	MALI_C55_BAYER_ORDER_BGGR
>> These are registers values too, they belong to mali-c55-registers.h.
>>
>>> +};
>>> +
>>> +struct mali_c55_isp_fmt {
>> mali_c55_isp_format_info
>>
>>> +	u32 code;
>>> +	enum v4l2_pixel_encoding encoding;
>> Here you use v4l2_pixel_encoding, for mali_c55_fmt you use is_raw. Maybe
>> pick the same option for both structures ?
>>
>>> +	enum mali_c55_isp_bayer_order order;
>>> +};
>>> +
>>> +enum mali_c55_planes {
>>> +	MALI_C55_PLANE_Y,
>>> +	MALI_C55_PLANE_UV,
>>> +	MALI_C55_NUM_PLANES
>>> +};
>>> +
>>> +struct mali_c55_buffer {
>>> +	struct vb2_v4l2_buffer vb;
>>> +	bool plane_done[MALI_C55_NUM_PLANES];
>> I think tracking the pending state would simplify the logic in
>> mali_c55_set_plane_done(), which would become
>>
>> 	curr_buf->plane_pending[plane] = false;
>>
>> 	if (!curr_buf->plane_pending[0] && !curr_buf->plane_pending[1]) {
>> 		mali_c55_handle_buffer(curr_buf, isp->frame_sequence);
>> 		cap_dev->buffers.curr = NULL;
>> 		isp->frame_sequence++;
>> 	}
>>
>> Or a counter may be even easier (and would consume less memory).
>>
>>> +	struct list_head queue;
>>> +	u32 addrs[MALI_C55_NUM_PLANES];
>> This stores DMA addresses, use dma_addr_t.
>>
>>> +};
>>> +
>>> +struct mali_c55_cap_dev {
>>> +	struct mali_c55 *mali_c55;
>>> +	struct mali_c55_resizer *rzr;
>>> +	struct video_device vdev;
>>> +	struct media_pad pad;
>>> +	struct vb2_queue queue;
>>> +	struct mutex lock;
>>> +	unsigned int reg_offset;
>> Manual handling of the offset everywhere, with parametric macros for the
>> resizer register addresses, isn't very nice. Introduce resizer-specific
>> accessors and capture-specific accessors (mali_c55_rsz_write(), ...)
>> that take a mali_c55_resizer or mali_c55_cap_dev pointer, and handle the
>> offset there. The register macros should loose their offset parameter.
>>
>> You could also use a single set of accessors that would become
>> path/output-specific (mali_c55_path_write() ? mali_c55_output_write()
>> ?), that may make the code easier to read.
>>
>> You can also replace reg_offset with a void __iomem * base, which would
>> avoid the computation at runtime.
>>
>>> +
>>> +	struct mali_c55_mode {
>> Make the structure anonymous.
>>
>>> +		const struct mali_c55_fmt *capture_fmt;
>>> +		struct v4l2_pix_format_mplane pix_mp;
>>> +	} mode;
>> What's a "mode" ? I think I'd name this
>>
>> 	struct {
>> 		const struct mali_c55_fmt *info;
>> 		struct v4l2_pix_format_mplane format;
>> 	} format;
>>
>> Or you could just drop the structure and have
>>
>> 	const struct mali_c55_fmt *format_info;
>> 	struct v4l2_pix_format_mplane format;
>>
>> or something similar.
>>
>>> +
>>> +	struct {
>>> +		spinlock_t lock;
>>> +		struct list_head queue;
>>> +		struct mali_c55_buffer *curr;
>>> +		struct mali_c55_buffer *next;
>>> +	} buffers;
>>> +
>>> +	bool streaming;
>>> +};
>>> +
>>> +enum mali_c55_config_spaces {
>>> +	MALI_C55_CONFIG_PING,
>>> +	MALI_C55_CONFIG_PONG,
>>> +	MALI_C55_NUM_CONFIG_SPACES
>> The last enumerator is not used.
>>
>>> +};
>>> +
>>> +struct mali_c55_ctx {
>> mali_c55_context ?
>>
>>> +	struct mali_c55 *mali_c55;
>>> +	void *registers;
>> Please document this structure and explain that this field points to a
>> copy of the register space in system memory, I was about to write you're
>> missing __iomem :-)
>>
>>> +	phys_addr_t base;
>>> +	spinlock_t lock;
>>> +	struct list_head list;
>>> +};
>>> +
>>> +struct mali_c55 {
>>> +	struct device *dev;
>>> +	struct resource *res;
>> You could possibly drop this field by passing the physical address of
>> the register space from mali_c55_probe() to mali_c55_init_context() as a
>> function parameter.
>>
>>> +	void __iomem *base;
>>> +	struct dma_chan *channel;
>>> +	struct clk_bulk_data clks[ARRAY_SIZE(mali_c55_clk_names)];
>>> +
>>> +	u16 capabilities;
>>> +	struct media_device media_dev;
>>> +	struct v4l2_device v4l2_dev;
>>> +	struct media_pipeline pipe;
>>> +
>>> +	struct mali_c55_tpg tpg;
>>> +	struct mali_c55_isp isp;
>>> +	struct mali_c55_resizer resizers[MALI_C55_NUM_RZRS];
>>> +	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
>>> +
>>> +	struct list_head contexts;
>>> +	enum mali_c55_config_spaces next_config;
>>> +};
>>> +
>>> +void mali_c55_write(struct mali_c55 *mali_c55, unsigned int addr, u32 val);
>>> +u32 mali_c55_read(struct mali_c55 *mali_c55, unsigned int addr,
>>> +		  bool force_hardware);
>>> +void mali_c55_update_bits(struct mali_c55 *mali_c55, unsigned int addr,
>>> +			  u32 mask, u32 val);
>>> +int mali_c55_config_write(struct mali_c55_ctx *ctx,
>>> +			  enum mali_c55_config_spaces cfg_space);
>>> +
>>> +int mali_c55_register_isp(struct mali_c55 *mali_c55);
>>> +int mali_c55_register_tpg(struct mali_c55 *mali_c55);
>>> +void mali_c55_unregister_tpg(struct mali_c55 *mali_c55);
>>> +void mali_c55_unregister_isp(struct mali_c55 *mali_c55);
>>> +int mali_c55_register_resizers(struct mali_c55 *mali_c55);
>>> +void mali_c55_unregister_resizers(struct mali_c55 *mali_c55);
>>> +int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
>>> +void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
>>> +struct mali_c55_ctx *mali_c55_get_active_context(struct mali_c55 *mali_c55);
>>> +void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
>>> +			     enum mali_c55_planes plane);
>>> +void mali_c55_set_next_buffer(struct mali_c55_cap_dev *cap_dev);
>>> +void mali_c55_isp_queue_event_sof(struct mali_c55 *mali_c55);
>>> +
>>> +bool mali_c55_format_is_raw(unsigned int mbus_code);
>>> +void mali_c55_rzr_start_stream(struct mali_c55_resizer *rzr);
>>> +void mali_c55_rzr_stop_stream(struct mali_c55_resizer *rzr);
>>> +int mali_c55_isp_start_stream(struct mali_c55_isp *isp);
>>> +void mali_c55_isp_stop_stream(struct mali_c55_isp *isp);
>>> +
>>> +const struct mali_c55_isp_fmt *
>>> +mali_c55_isp_fmt_next(const struct mali_c55_isp_fmt *fmt);
>>> +bool mali_c55_isp_is_format_supported(unsigned int mbus_code);
>>> +#define for_each_mali_isp_fmt(fmt)\
>> #define for_each_mali_isp_fmt(fmt) \
>>
>>> +	for ((fmt) = NULL; ((fmt) = mali_c55_isp_fmt_next((fmt)));)
>> Looks like parentheses were on sale :-)
>>
>> 	for ((fmt) = NULL; (fmt) = mali_c55_isp_fmt_next(fmt); )
>>
>> This macro is used in two places only, in the mali-c55-isp.c file where
>> open-coding the loop without using mali_c55_isp_fmt_next() would be more
>> efficient, and in mali-c55-resizer.c where a function to return format
>> i'th would be more efficient. I think you can drop the macro and the
>> mali_c55_isp_fmt_next() function.
>>
>>> +
>>> +#endif /* _MALI_C55_COMMON_H */
>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
>>> new file mode 100644
>>> index 000000000000..50caf5ee7474
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
>>> @@ -0,0 +1,767 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * ARM Mali-C55 ISP Driver - Core driver code
>>> + *
>>> + * Copyright (C) 2024 Ideas on Board Oy
>>> + */
>>> +
>>> +#include <linux/bitops.h>
>>> +#include <linux/cleanup.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/device.h>
>>> +#include <linux/dmaengine.h>
>>> +#include <linux/dma-mapping.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/ioport.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_reserved_mem.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/scatterlist.h>
>> I don't think this is needed.
>>
>> Missing slab.h.
>>
>>> +#include <linux/string.h>
>>> +
>>> +#include <media/media-entity.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/videobuf2-dma-contig.h>
>>> +
>>> +#include "mali-c55-common.h"
>>> +#include "mali-c55-registers.h"
>>> +
>>> +static const char * const mali_c55_interrupt_names[] = {
>>> +	[MALI_C55_IRQ_ISP_START] = "ISP start",
>>> +	[MALI_C55_IRQ_ISP_DONE] = "ISP done",
>>> +	[MALI_C55_IRQ_MCM_ERROR] = "Multi-context management error",
>>> +	[MALI_C55_IRQ_BROKEN_FRAME_ERROR] = "Broken frame error",
>>> +	[MALI_C55_IRQ_MET_AF_DONE] = "AF metering done",
>>> +	[MALI_C55_IRQ_MET_AEXP_DONE] = "AEXP metering done",
>>> +	[MALI_C55_IRQ_MET_AWB_DONE] = "AWB metering done",
>>> +	[MALI_C55_IRQ_AEXP_1024_DONE] = "AEXP 1024-bit histogram done",
>>> +	[MALI_C55_IRQ_IRIDIX_MET_DONE] = "Iridix metering done",
>>> +	[MALI_C55_IRQ_LUT_INIT_DONE] = "LUT memory init done",
>>> +	[MALI_C55_IRQ_FR_Y_DONE] = "Full resolution Y plane DMA done",
>>> +	[MALI_C55_IRQ_FR_UV_DONE] = "Full resolution U/V plane DMA done",
>>> +	[MALI_C55_IRQ_DS_Y_DONE] = "Downscale Y plane DMA done",
>>> +	[MALI_C55_IRQ_DS_UV_DONE] = "Downscale U/V plane DMA done",
>>> +	[MALI_C55_IRQ_LINEARIZATION_DONE] = "Linearisation done",
>>> +	[MALI_C55_IRQ_RAW_FRONTEND_DONE] = "Raw frontend processing done",
>>> +	[MALI_C55_IRQ_NOISE_REDUCTION_DONE] = "Noise reduction done",
>>> +	[MALI_C55_IRQ_IRIDIX_DONE] = "Iridix done",
>>> +	[MALI_C55_IRQ_BAYER2RGB_DONE] = "Bayer to RGB conversion done",
>>> +	[MALI_C55_IRQ_WATCHDOG_TIMER] = "Watchdog timer timed out",
>>> +	[MALI_C55_IRQ_FRAME_COLLISION] = "Frame collision error",
>>> +	[MALI_C55_IRQ_UNUSED] = "IRQ bit unused",
>>> +	[MALI_C55_IRQ_DMA_ERROR] = "DMA error",
>>> +	[MALI_C55_IRQ_INPUT_STOPPED] = "Input port safely stopped",
>>> +	[MALI_C55_IRQ_MET_AWB_TARGET1_HIT] = "AWB metering target 1 address hit",
>>> +	[MALI_C55_IRQ_MET_AWB_TARGET2_HIT] = "AWB metering target 2 address hit"
>>> +};
>>> +
>>> +static unsigned int config_space_addrs[] = {
>> const
>>
>>> +	[MALI_C55_CONFIG_PING] = 0x0AB6C,
>>> +	[MALI_C55_CONFIG_PONG] = 0x22B2C,
>> Lowercase hex constants.
>>
>> Don't the values belong to mali-c55-registers.h ?
>>
>>> +};
>>> +
>>> +/* System IO
>> /*
>>   * System IO
>>
>>> + *
>>> + * The Mali-C55 ISP has up to two configuration register spaces (called 'ping'
>>> + * and 'pong'), with the  expectation that the 'active' space will be left
>> s/the  /the /
>>
>>> + * untouched whilst a frame is being processed and the 'inactive' space
>>> + * configured ready to be passed during the blanking period before the next
>> s/to be passed/to be switched to/ ?
>>
>>> + * frame processing starts. These spaces should ideally be set via DMA transfer
>>> + * from a buffer rather than through individual register set operations. There
>>> + * is also a shared global register space which should be set normally. Of
>>> + * course, the ISP might be included in a system which lacks a suitable DMA
>>> + * engine, and the second configuration space might not be fitted at all, which
>>> + * means we need to support four scenarios:
>>> + *
>>> + * 1. Multi config space, with DMA engine.
>>> + * 2. Multi config space, no DMA engine.
>>> + * 3. Single config space, with DMA engine.
>>> + * 4. Single config space, no DMA engine.
>>> + *
>>> + * The first case is very easy, but the rest present annoying problems. The best
>>> + * way to solve them seems to be simply to replicate the concept of DMAing over
>>> + * the configuration buffer even if there's no DMA engine on the board, for
>>> + * which we rely on memcpy. To facilitate this any read/write call that is made
>>> + * to an address within those config spaces should infact be directed to a
>>> + * buffer that was allocated to hold them rather than the IO memory itself. The
>>> + * actual copy of that buffer to IO mem will happen on interrupt.
>>> + */
>>> +
>>> +void mali_c55_write(struct mali_c55 *mali_c55, unsigned int addr, u32 val)
>>> +{
>>> +	struct mali_c55_ctx *ctx = mali_c55_get_active_context(mali_c55);
>>> +
>>> +	if (addr >= MALI_C55_REG_CONFIG_SPACES_OFFSET) {
>>> +		spin_lock(&ctx->lock);
>>> +		addr = (addr - MALI_C55_REG_CONFIG_SPACES_OFFSET) / 4;
>>> +		((u32 *)ctx->registers)[addr] = val;
>>> +		spin_unlock(&ctx->lock);
>>> +
>>> +		return;
>>> +	}
>> Ouch. This is likely the second comment you really won't like (after the
>> comment regarding mali_c55_update_bits() at the very top). I apologize
>> in advance.
>>
>> I really don't like this. Directing writes either to hardware registers
>> or to the shadow registers in the context makes the callers of the
>> read/write accessors very hard to read. The probe code, for instance,
>> mixes writes to hardware registers and writes to the context shadow
>> registers to initialize the value of some of the shadow registers.
>>
>> I'd like to split the read/write accessors into functions that access
>> the hardware registers (that's easy) and functions that access the
>> shadow registers. I think the latter should receive a mali_c55_ctx
>> pointer instead of a mali_c55 pointer to prepare for multi-context
>> support.
>>
>> You can add WARN_ON() guards to the two sets of functions, to ensure
>> that no register from the "other" space gets passed to the wrong
>> function by mistake.
>>
>>> +
>>> +	writel(val, mali_c55->base + addr);
>>> +}
>>> +
>>> +u32 mali_c55_read(struct mali_c55 *mali_c55, unsigned int addr,
>>> +		  bool force_hardware)
>> force_hardware is never set to true.
>>
>>> +{
>>> +	struct mali_c55_ctx *ctx = mali_c55_get_active_context(mali_c55);
>>> +	u32 val;
>>> +
>>> +	if (addr >= MALI_C55_REG_CONFIG_SPACES_OFFSET && !force_hardware) {
>>> +		spin_lock(&ctx->lock);
>>> +		addr = (addr - MALI_C55_REG_CONFIG_SPACES_OFFSET) / 4;
>>> +		val = ((u32 *)ctx->registers)[addr];
>>> +		spin_unlock(&ctx->lock);
>>> +
>>> +		return val;
>>> +	}
>>> +
>>> +	return readl(mali_c55->base + addr);
>>> +}
>>> +
>>> +void mali_c55_update_bits(struct mali_c55 *mali_c55, unsigned int addr,
>>> +			  u32 mask, u32 val)
>>> +{
>>> +	u32 orig, tmp;
>>> +
>>> +	orig = mali_c55_read(mali_c55, addr, false);
>>> +
>>> +	tmp = orig & ~mask;
>>> +	tmp |= (val << (ffs(mask) - 1)) & mask;
>>> +
>>> +	if (tmp != orig)
>>> +		mali_c55_write(mali_c55, addr, tmp);
>>> +}
>>> +
>>> +static int mali_c55_dma_xfer(struct mali_c55_ctx *ctx, dma_addr_t src,
>>> +			     dma_addr_t dst, enum dma_data_direction dir)
>>> +{
>>> +	struct mali_c55 *mali_c55 = ctx->mali_c55;
>>> +	struct dma_async_tx_descriptor *tx;
>>> +	enum dma_status status;
>>> +	dma_cookie_t cookie;
>>> +
>>> +	tx = dmaengine_prep_dma_memcpy(mali_c55->channel, dst, src,
>>> +				       MALI_C55_CONFIG_SPACE_SIZE, 0);
>>> +	if (!tx) {
>>> +		dev_err(mali_c55->dev, "failed to prep DMA memcpy\n");
>>> +		return -EIO;
>>> +	}
>>> +
>>> +	cookie = dmaengine_submit(tx);
>>> +	if (dma_submit_error(cookie)) {
>>> +		dev_err(mali_c55->dev, "error submitting dma transfer\n");
>>> +		return -EIO;
>>> +	}
>>> +
>>> +	status = dma_sync_wait(mali_c55->channel, cookie);
>> I've just realized this performs a busy-wait :-S See the comment in the
>> probe function about the threaded IRQ handler. I think we'll need to
>> rework all this. It could be done on top though.
>>
>>> +	if (status != DMA_COMPLETE) {
>>> +		dev_err(mali_c55->dev, "dma transfer failed\n");
>>> +		return -EIO;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_dma_read(struct mali_c55_ctx *ctx,
>>> +			     enum mali_c55_config_spaces cfg_space)
>>> +{
>>> +	struct mali_c55 *mali_c55 = ctx->mali_c55;
>>> +	struct device *dma_dev = mali_c55->channel->device->dev;
>>> +	dma_addr_t src = ctx->base + config_space_addrs[cfg_space];
>>> +	dma_addr_t dst;
>>> +	int ret;
>>> +
>>> +	guard(spinlock)(&ctx->lock);
>>> +
>>> +	dst = dma_map_single(dma_dev, ctx->registers,
>>> +			     MALI_C55_CONFIG_SPACE_SIZE, DMA_FROM_DEVICE);
>>> +	if (dma_mapping_error(dma_dev, dst)) {
>>> +		dev_err(mali_c55->dev, "failed to map DMA addr\n");
>>> +		return -EIO;
>>> +	}
>>> +
>>> +	ret = mali_c55_dma_xfer(ctx, src, dst, DMA_FROM_DEVICE);
>>> +	dma_unmap_single(dma_dev, dst, MALI_C55_CONFIG_SPACE_SIZE,
>>> +			 DMA_FROM_DEVICE);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int mali_c55_dma_write(struct mali_c55_ctx *ctx,
>>> +		       enum mali_c55_config_spaces cfg_space)
>>> +{
>>> +	struct mali_c55 *mali_c55 = ctx->mali_c55;
>>> +	struct device *dma_dev = mali_c55->channel->device->dev;
>>> +	dma_addr_t dst = ctx->base + config_space_addrs[cfg_space];
>>> +	dma_addr_t src;
>>> +	int ret;
>>> +
>>> +	guard(spinlock)(&ctx->lock);
>> The code below can take a large amount of time, holding a spinlock will
>> disable interrupts on the local CPU, that's not good :-(
>>
>>> +
>>> +	src = dma_map_single(dma_dev, ctx->registers,
>>> +			     MALI_C55_CONFIG_SPACE_SIZE, DMA_TO_DEVICE);
>>> +	if (dma_mapping_error(dma_dev, src)) {
>>> +		dev_err(mali_c55->dev, "failed to map DMA addr\n");
>>> +		return -EIO;
>>> +	}
>>> +
>>> +	ret = mali_c55_dma_xfer(ctx, src, dst, DMA_TO_DEVICE);
>>> +	dma_unmap_single(dma_dev, src, MALI_C55_CONFIG_SPACE_SIZE,
>>> +			 DMA_TO_DEVICE);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int mali_c55_config_read(struct mali_c55_ctx *ctx,
>>> +				enum mali_c55_config_spaces cfg_space)
>>> +{
>>> +	struct mali_c55 *mali_c55 = ctx->mali_c55;
>>> +
>>> +	if (mali_c55->channel) {
>>> +		return mali_c55_dma_read(ctx, cfg_space);
>> As this function is used at probe time only, to initialize the context,
>> I think DMA is overkill.
>>
>>> +	} else {
>>> +		memcpy_fromio(ctx->registers,
>>> +			      mali_c55->base + config_space_addrs[cfg_space],
>>> +			      MALI_C55_CONFIG_SPACE_SIZE);
>>> +		return 0;
>>> +	}
>>> +}
>>> +
>>> +int mali_c55_config_write(struct mali_c55_ctx *ctx,
>>> +			  enum mali_c55_config_spaces cfg_space)
>>> +{
>>> +	struct mali_c55 *mali_c55 = ctx->mali_c55;
>>> +
>>> +	if (mali_c55->channel) {
>>> +		return mali_c55_dma_write(ctx, cfg_space);
>>> +	} else {
>>> +		memcpy_toio(mali_c55->base + config_space_addrs[cfg_space],
>>> +			    ctx->registers, MALI_C55_CONFIG_SPACE_SIZE);
>>> +		return 0;
>>> +	}
>> Could you measure the time it typically takes to write the registers
>> using DMA compared to using memcpy_toio() ?
>>
>>> +}
>>> +
>>> +struct mali_c55_ctx *mali_c55_get_active_context(struct mali_c55 *mali_c55)
>>> +{
>>> +	return list_first_entry(&mali_c55->contexts, struct mali_c55_ctx, list);
>> I think it's too early to tell how multi-context support will look like.
>> I'm fine keeping mali_c55_get_active_context() as changing that would be
>> very intrusive (even if I think it will need to be changed), but the
>> list of contexts is neither the mechanism we'll use, nor something we
>> need now. Drop the list, embed the context in struct mali_c55, and
>> return the pointer to that single context from this function.
>>
>>> +}
>>> +
>>> +static void mali_c55_remove_links(struct mali_c55 *mali_c55)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	media_entity_remove_links(&mali_c55->tpg.sd.entity);
>>> +	media_entity_remove_links(&mali_c55->isp.sd.entity);
>>> +
>>> +	for (i = 0; i < MALI_C55_NUM_RZRS; i++)
>>> +		media_entity_remove_links(&mali_c55->resizers[i].sd.entity);
>>> +
>>> +	for (i = 0; i < MALI_C55_NUM_CAP_DEVS; i++)
>>> +		media_entity_remove_links(&mali_c55->cap_devs[i].vdev.entity);
>>> +}
>>> +
>>> +static int mali_c55_create_links(struct mali_c55 *mali_c55)
>>> +{
>>> +	int ret;
>>> +
>>> +	/* Test pattern generator to ISP */
>>> +	ret = media_create_pad_link(&mali_c55->tpg.sd.entity, 0,
>>> +				    &mali_c55->isp.sd.entity,
>>> +				    MALI_C55_ISP_PAD_SINK_VIDEO, 0);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev, "failed to link TPG and ISP\n");
>>> +		goto err_remove_links;
>>> +	}
>>> +
>>> +	/* Full resolution resizer pipe. */
>>> +	ret = media_create_pad_link(&mali_c55->isp.sd.entity,
>>> +			MALI_C55_ISP_PAD_SOURCE,
>>> +			&mali_c55->resizers[MALI_C55_RZR_FR].sd.entity,
>>> +			MALI_C55_RZR_SINK_PAD,
>>> +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev, "failed to link ISP and FR resizer\n");
>>> +		goto err_remove_links;
>>> +	}
>>> +
>>> +	/* Full resolution bypass. */
>>> +	ret = media_create_pad_link(&mali_c55->isp.sd.entity,
>>> +				    MALI_C55_ISP_PAD_SOURCE_BYPASS,
>>> +				    &mali_c55->resizers[MALI_C55_RZR_FR].sd.entity,
>>> +				    MALI_C55_RZR_SINK_BYPASS_PAD,
>>> +				    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev, "failed to link ISP and FR resizer\n");
>>> +		goto err_remove_links;
>>> +	}
>>> +
>>> +	/* Resizer pipe to video capture nodes. */
>>> +	ret = media_create_pad_link(&mali_c55->resizers[0].sd.entity,
>>> +			MALI_C55_RZR_SOURCE_PAD,
>>> +			&mali_c55->cap_devs[MALI_C55_CAP_DEV_FR].vdev.entity,
>>> +			0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev,
>>> +			"failed to link FR resizer and video device\n");
>>> +		goto err_remove_links;
>>> +	}
>>> +
>>> +	/* The downscale pipe is an optional hardware block */
>>> +	if (mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED) {
>>> +		ret = media_create_pad_link(&mali_c55->isp.sd.entity,
>>> +			MALI_C55_ISP_PAD_SOURCE,
>>> +			&mali_c55->resizers[MALI_C55_RZR_DS].sd.entity,
>>> +			MALI_C55_RZR_SINK_PAD,
>>> +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
>>> +		if (ret) {
>>> +			dev_err(mali_c55->dev,
>>> +				"failed to link ISP and DS resizer\n");
>>> +			goto err_remove_links;
>>> +		}
>>> +
>>> +		ret = media_create_pad_link(&mali_c55->resizers[1].sd.entity,
>>> +			MALI_C55_RZR_SOURCE_PAD,
>>> +			&mali_c55->cap_devs[MALI_C55_CAP_DEV_DS].vdev.entity,
>>> +			0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
>>> +		if (ret) {
>>> +			dev_err(mali_c55->dev,
>>> +				"failed to link DS resizer and video device\n");
>>> +			goto err_remove_links;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +err_remove_links:
>>> +	mali_c55_remove_links(mali_c55);
>>> +	return ret;
>>> +}
>>> +
>>> +static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
>>> +{
>>> +	mali_c55_unregister_tpg(mali_c55);
>>> +	mali_c55_unregister_isp(mali_c55);
>>> +	mali_c55_unregister_resizers(mali_c55);
>>> +	mali_c55_unregister_capture_devs(mali_c55);
>>> +}
>>> +
>>> +static int mali_c55_register_entities(struct mali_c55 *mali_c55)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = mali_c55_register_tpg(mali_c55);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = mali_c55_register_isp(mali_c55);
>>> +	if (ret)
>>> +		goto err_unregister_entities;
>>> +
>>> +	ret = mali_c55_register_resizers(mali_c55);
>>> +	if (ret)
>>> +		goto err_unregister_entities;
>>> +
>>> +	ret = mali_c55_register_capture_devs(mali_c55);
>>> +	if (ret)
>>> +		goto err_unregister_entities;
>>> +
>>> +	ret = mali_c55_create_links(mali_c55);
>>> +	if (ret)
>>> +		goto err_unregister_entities;
>>> +
>>> +	return 0;
>>> +
>>> +err_unregister_entities:
>>> +	mali_c55_unregister_entities(mali_c55);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static u32 mali_c55_check_hwcfg(struct mali_c55 *mali_c55)
>>> +{
>>> +	u32 product, version, revision, capabilities;
>>> +
>>> +	product = mali_c55_read(mali_c55, MALI_C55_REG_PRODUCT, false);
>>> +	version = mali_c55_read(mali_c55, MALI_C55_REG_VERSION, false);
>>> +	revision = mali_c55_read(mali_c55, MALI_C55_REG_REVISION, false);
>>> +
>>> +	dev_info(mali_c55->dev, "Detected Mali-C55 ISP %u.%u.%u\n",
>>> +		 product, version, revision);
>>> +
>>> +	capabilities = mali_c55_read(mali_c55,
>>> +				     MALI_C55_REG_GLOBAL_PARAMETER_STATUS,
>>> +				     false);
>>> +	mali_c55->capabilities = (capabilities & 0xffff);
>>> +
>>> +	/* TODO: Might as well start some debugfs */
>> If it's just to expose the version and capabilities, I think that's
>> overkill. It's not needed for debug purpose (you can get it from the
>> kernel log already). debugfs isn't meant to be accessible in production,
>> so an application that would need access to the information wouldn't be
>> able to use it.
>>
>>> +	dev_info(mali_c55->dev, "Mali-C55 capabilities: 0x%04x\n", capabilities);
>> Combine the two messages into one.
>>
>>> +	return version;
>>> +}
>>> +
>>> +static void mali_c55_swap_next_config(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct mali_c55_ctx *ctx = mali_c55_get_active_context(mali_c55);
>>> +	u32 curr_config, next_config;
>>> +
>>> +	curr_config = mali_c55_read(mali_c55, MALI_C55_REG_PING_PONG_READ, false);
>>> +	curr_config = (curr_config & MALI_C55_REG_PING_PONG_READ_MASK)
>>> +		      >> (ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1);
>>> +	next_config = curr_config ^ 1;
>>> +
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
>>> +			     MALI_C55_REG_MCU_CONFIG_WRITE_MASK, next_config);
>>> +	mali_c55_config_write(ctx, next_config ?
>>> +			      MALI_C55_CONFIG_PING : MALI_C55_CONFIG_PONG);
>>> +}
>>> +
>>> +static irqreturn_t mali_c55_isr(int irq, void *context)
>>> +{
>>> +	struct device *dev = context;
>>> +	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
>>> +	u32 interrupt_status;
>>> +	unsigned int i, j;
>>> +
>>> +	interrupt_status = mali_c55_read(mali_c55,
>>> +					 MALI_C55_REG_INTERRUPT_STATUS_VECTOR,
>>> +					 false);
>>> +	if (!interrupt_status)
>>> +		return IRQ_NONE;
>>> +
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR_VECTOR,
>>> +		       interrupt_status);
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 0);
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 1);
>>> +
>>> +	for (i = 0; i < MALI_C55_NUM_IRQ_BITS; i++) {
>>> +		if (!(interrupt_status & (1 << i)))
>>> +			continue;
>>> +
>>> +		switch (i) {
>>> +		case MALI_C55_IRQ_ISP_START:
>>> +			mali_c55_isp_queue_event_sof(mali_c55);
>>> +
>>> +			for (j = i; j < MALI_C55_NUM_CAP_DEVS; j++)
>>> +				mali_c55_set_next_buffer(&mali_c55->cap_devs[j]);
>>> +
>>> +			mali_c55_swap_next_config(mali_c55);
>>> +
>>> +			break;
>>> +		case MALI_C55_IRQ_ISP_DONE:
>>> +			/*
>>> +			 * TODO: Where the ISP has no Pong config fitted, we'd
>>> +			 * have to do the mali_c55_swap_next_config() call here.
>>> +			 */
>>> +			break;
>>> +		case MALI_C55_IRQ_FR_Y_DONE:
>>> +			mali_c55_set_plane_done(
>>> +				&mali_c55->cap_devs[MALI_C55_CAP_DEV_FR],
>>> +				MALI_C55_PLANE_Y);
>>> +			break;
>>> +		case MALI_C55_IRQ_FR_UV_DONE:
>>> +			mali_c55_set_plane_done(
>>> +				&mali_c55->cap_devs[MALI_C55_CAP_DEV_FR],
>>> +				MALI_C55_PLANE_UV);
>>> +			break;
>>> +		case MALI_C55_IRQ_DS_Y_DONE:
>>> +			mali_c55_set_plane_done(
>>> +				&mali_c55->cap_devs[MALI_C55_CAP_DEV_DS],
>>> +				MALI_C55_PLANE_Y);
>>> +			break;
>>> +		case MALI_C55_IRQ_DS_UV_DONE:
>>> +			mali_c55_set_plane_done(
>>> +				&mali_c55->cap_devs[MALI_C55_CAP_DEV_DS],
>>> +				MALI_C55_PLANE_UV);
>>> +			break;
>>> +		default:
>>> +			/*
>>> +			 * Only the above interrupts are currently unmasked. If
>>> +			 * we receive anything else here then something weird
>>> +			 * has gone on.
>>> +			 */
>>> +			dev_err(dev, "masked interrupt %s triggered\n",
>>> +				mali_c55_interrupt_names[i]);
>>> +		}
>>> +	}
>>> +
>>> +	return IRQ_HANDLED;
>>> +}
>>> +
>>> +static int mali_c55_init_context(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct mali_c55_ctx *ctx;
>>> +	int ret;
>>> +
>>> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>>> +	if (!ctx) {
>>> +		dev_err(mali_c55->dev, "failed to allocate new context\n");
>> No need for an error message when memory allocation fails.
>>
>>> +		return -ENOMEM;
>>> +	}
>>> +
>>> +	ctx->base = mali_c55->res->start;
>>> +	ctx->mali_c55 = mali_c55;
>>> +
>>> +	ctx->registers = kzalloc(MALI_C55_CONFIG_SPACE_SIZE,
>>> +				 GFP_KERNEL | GFP_DMA);
>>> +	if (!ctx->registers) {
>>> +		ret = -ENOMEM;
>>> +		goto err_free_ctx;
>>> +	}
>>> +
>>> +	/*
>>> +	 * The allocated memory is empty, we need to load the default
>>> +	 * register settings. We just read Ping; it's identical to Pong.
>>> +	 */
>>> +	ret = mali_c55_config_read(ctx, MALI_C55_CONFIG_PING);
>>> +	if (ret)
>>> +		goto err_free_registers;
>>> +
>>> +	list_add_tail(&ctx->list, &mali_c55->contexts);
>>> +
>>> +	/*
>>> +	 * Some features of the ISP need to be disabled by default and only
>>> +	 * enabled at the same time as they're configured by a parameters buffer
>>> +	 */
>>> +
>>> +	/* Bypass the sqrt and square compression and expansion modules */
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_BYPASS_1,
>>> +			     MALI_C55_REG_BYPASS_1_FE_SQRT, 0x01);
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
>>> +			     MALI_C55_REG_BYPASS_3_SQUARE_BE, 0x01);
>>> +
>>> +	/* Bypass the temper module */
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_BYPASS_2,
>>> +		       MALI_C55_REG_BYPASS_2_TEMPER);
>>> +
>>> +	/* Bypass the colour noise reduction  */
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_BYPASS_4,
>>> +		       MALI_C55_REG_BYPASS_4_CNR);
>>> +
>>> +	/* Disable the sinter module */
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_SINTER_CONFIG,
>>> +			     MALI_C55_SINTER_ENABLE_MASK, 0x00);
>>> +
>>> +	/* Disable the RGB Gamma module for each output */
>>> +	mali_c55_write(
>>> +		mali_c55,
>>> +		MALI_C55_REG_GAMMA_RGB_ENABLE(MALI_C55_CAP_DEV_FR_REG_OFFSET),
>>> +		0x00);
>>> +	mali_c55_write(
>>> +		mali_c55,
>>> +		MALI_C55_REG_GAMMA_RGB_ENABLE(MALI_C55_CAP_DEV_DS_REG_OFFSET),
>>> +		0x00);
>>> +
>>> +	/* Disable the colour correction matrix */
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0x00);
>>> +
>>> +	return 0;
>>> +
>>> +err_free_registers:
>>> +	kfree(ctx->registers);
>>> +err_free_ctx:
>>> +	kfree(ctx);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int mali_c55_runtime_resume(struct device *dev)
>>> +{
>>> +	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(mali_c55->clks),
>>> +				      mali_c55->clks);
>>> +	if (ret)
>>> +		dev_err(mali_c55->dev, "failed to enable clocks\n");
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int mali_c55_runtime_suspend(struct device *dev)
>>> +{
>>> +	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
>>> +
>>> +	clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct dev_pm_ops mali_c55_pm_ops = {
>>> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>> +				pm_runtime_force_resume)
>>> +	SET_RUNTIME_PM_OPS(mali_c55_runtime_suspend, mali_c55_runtime_resume,
>>> +			   NULL)
>>> +};
>>> +
>>> +static int mali_c55_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct mali_c55 *mali_c55;
>>> +	dma_cap_mask_t mask;
>>> +	u32 version;
>>> +	int ret;
>>> +	u32 val;
>>> +
>>> +	mali_c55 = devm_kzalloc(dev, sizeof(*mali_c55), GFP_KERNEL);
>>> +	if (!mali_c55)
>>> +		return dev_err_probe(dev, -ENOMEM,
>>> +				     "failed to allocate memory\n");
>> 		return -ENOMEM;
>>
>> There's no need to print messages for memory allocation failures.
>>
>>> +
>>> +	mali_c55->dev = dev;
>>> +	platform_set_drvdata(pdev, mali_c55);
>>> +
>>> +	mali_c55->base = devm_platform_get_and_ioremap_resource(pdev, 0,
>>> +								&mali_c55->res);
>>> +	if (IS_ERR(mali_c55->base))
>>> +		return dev_err_probe(dev, PTR_ERR(mali_c55->base),
>>> +				     "failed to map IO memory\n");
>>> +
>>> +	ret = platform_get_irq(pdev, 0);
>>> +	if (ret < 0)
>>> +		return dev_err_probe(dev, ret, "failed to get interrupt num\n");
>> s/ num// or s/num/number/
>>
>>> +
>>> +	ret = devm_request_threaded_irq(&pdev->dev, ret, NULL,
>>> +					mali_c55_isr, IRQF_ONESHOT,
>>> +					dev_driver_string(&pdev->dev),
>>> +					&pdev->dev);
>> Requested the IRQ should be done much lower, after you have initialized
>> everything, or an IRQ that would fire early would have really bad
>> consequences.
>>
>> A comment to explain why you need a threaded interrupt handler would be
>> good. I assume it is due only to the need to transfer the registers
>> using DMA. I wonder if we should then split the interrupt handler in
>> two, with a non-threaded part for the operations that can run quickly,
>> and a threaded part for the reprogramming.
>>
>> It may also be that we could just start the DMA transfer in the
>> non-threaded handler without waiting synchronously for it to complete.
>> That would be a bigger change, and would require checking race
>> conditions carefully. On the other hand, I'm a bit concerned about the
>> current implementation, have you tested what happens if the DMA transfer
>> takes too long to complete, and spans frame boundaries ? This part could
>> be addressed by a patch on top of this one.
>>
>>> +	if (ret)
>>> +		return dev_err_probe(dev, ret, "failed to request irq\n");
>>> +
>>> +	for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_clk_names); i++)
>>> +		mali_c55->clks[i].id = mali_c55_clk_names[i];
>>> +
>>> +	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
>>> +	if (ret)
>>> +		return dev_err_probe(dev, ret, "failed to acquire clocks\n");
>>> +
>>> +	pm_runtime_enable(&pdev->dev);
>>> +
>>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>>> +	if (ret)
>>> +		goto err_pm_runtime_disable;
>>> +
>>> +	of_reserved_mem_device_init(dev);
>> I'd move this, the vb2_dma_contig_set_max_seg_size() call and the
>> dma_cap_* calls before pm_runtime_enable() as they don't need the device
>> to be powered.
>>
>>> +	version = mali_c55_check_hwcfg(mali_c55);
>>> +	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
>>> +
>>> +	/* Use "software only" context management. */
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
>>> +			     MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK,
>>> +			     MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK);
>> You handle that in mali_c55_isp_start(), does the register have to be
>> set here too ?
>>
>>> +
>>> +	dma_cap_zero(mask);
>>> +	dma_cap_set(DMA_MEMCPY, mask);
>>> +
>>> +	/*
>>> +	 * No error check, because we will just fallback on memcpy if there is
>>> +	 * no usable DMA channel on the system.
>>> +	 */
>>> +	mali_c55->channel = dma_request_channel(mask, NULL, NULL);
>>> +
>>> +	INIT_LIST_HEAD(&mali_c55->contexts);
>>> +	ret = mali_c55_init_context(mali_c55);
>>> +	if (ret)
>>> +		goto err_release_dma_channel;
>>> +
>> I'd move all the code from here ...
>>
>>> +	mali_c55->media_dev.dev = dev;
>>> +	strscpy(mali_c55->media_dev.model, "ARM Mali-C55 ISP",
>>> +		sizeof(mali_c55->media_dev.model));
>>> +	mali_c55->media_dev.hw_revision = version;
>>> +
>>> +	media_device_init(&mali_c55->media_dev);
>>> +	ret = media_device_register(&mali_c55->media_dev);
>>> +	if (ret)
>>> +		goto err_cleanup_media_device;
>>> +
>>> +	mali_c55->v4l2_dev.mdev = &mali_c55->media_dev;
>>> +	ret = v4l2_device_register(dev, &mali_c55->v4l2_dev);
>>> +	if (ret) {
>>> +		dev_err(dev, "failed to register V4L2 device\n");
>>> +		goto err_unregister_media_device;
>>> +	};
>>> +
>>> +	ret = mali_c55_register_entities(mali_c55);
>>> +	if (ret) {
>>> +		dev_err(dev, "failed to register entities\n");
>>> +		goto err_unregister_v4l2_device;
>>> +	}
>> ... to here to a separate function, or maybe fold it all in
>> mali_c55_register_entities() (which should the be renamed). Same thing
>> for the cleanup code.
>>
>>> +
>>> +	/* Set safe stop to ensure we're in a non-streaming state */
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST,
>>> +		       MALI_C55_INPUT_SAFE_STOP);
>>> +	readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
>>> +			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
>>> +
>>> +	/*
>>> +	 * We're ready to process interrupts. Clear any that are set and then
>>> +	 * unmask them for processing.
>>> +	 */
>>> +	mali_c55_write(mali_c55, 0x30, 0xffffffff);
>>> +	mali_c55_write(mali_c55, 0x34, 0xffffffff);
>>> +	mali_c55_write(mali_c55, 0x40, 0x01);
>>> +	mali_c55_write(mali_c55, 0x40, 0x00);
>> Please replace the register addresses with macros.
>>
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_MASK_VECTOR, 0x39fc3fc);
>> The value should use the interrupt bits macros.
>>
>>> +
>>> +	pm_runtime_put(&pdev->dev);
>> Once power gets cut, the registers your programmed above may be lost. I
>> think you should programe them in the runtime PM resume handler.
>>
>>> +
>>> +	return 0;
>>> +
>>> +err_unregister_v4l2_device:
>>> +	v4l2_device_unregister(&mali_c55->v4l2_dev);
>>> +err_unregister_media_device:
>>> +	media_device_unregister(&mali_c55->media_dev);
>>> +err_cleanup_media_device:
>>> +	media_device_cleanup(&mali_c55->media_dev);
>>> +err_release_dma_channel:
>>> +	dma_release_channel(mali_c55->channel);
>>> +err_pm_runtime_disable:
>>> +	pm_runtime_disable(&pdev->dev);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void mali_c55_remove(struct platform_device *pdev)
>>> +{
>>> +	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
>>> +	struct mali_c55_ctx *ctx, *tmp;
>>> +
>>> +	list_for_each_entry_safe(ctx, tmp, &mali_c55->contexts, list) {
>>> +		list_del(&ctx->list);
>>> +		kfree(ctx->registers);
>>> +		kfree(ctx);
>>> +	}
>>> +
>>> +	mali_c55_remove_links(mali_c55);
>>> +	mali_c55_unregister_entities(mali_c55);
>>> +	v4l2_device_put(&mali_c55->v4l2_dev);
>>> +	media_device_unregister(&mali_c55->media_dev);
>>> +	media_device_cleanup(&mali_c55->media_dev);
>>> +	dma_release_channel(mali_c55->channel);
>>> +}
>>> +
>>> +static const struct of_device_id mali_c55_of_match[] = {
>>> +	{ .compatible = "arm,mali-c55", },
>>> +	{},
>> 	{ /* Sentinel */ },
>>
>>> +};
>>> +MODULE_DEVICE_TABLE(of, mali_c55_of_match);
>>> +
>>> +static struct platform_driver mali_c55_driver = {
>>> +	.driver = {
>>> +		.name = "mali-c55",
>>> +		.of_match_table = of_match_ptr(mali_c55_of_match),
>> Drop of_match_ptr().
>>
>>> +		.pm = &mali_c55_pm_ops,
>>> +	},
>>> +	.probe = mali_c55_probe,
>>> +	.remove_new = mali_c55_remove,
>>> +};
>>> +
>>> +module_platform_driver(mali_c55_driver);
>> Blank line.
>>
>>> +MODULE_AUTHOR("Daniel Scally <dan.scally@ideasonboard.com>");
>>> +MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com>");
>>> +MODULE_DESCRIPTION("ARM Mali-C55 ISP platform driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>>> new file mode 100644
>>> index 000000000000..ea8b7b866e7a
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>>> @@ -0,0 +1,611 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * ARM Mali-C55 ISP Driver - Image signal processor
>>> + *
>>> + * Copyright (C) 2024 Ideas on Board Oy
>>> + */
>>> +
>>> +#include <linux/delay.h>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/property.h>
>>> +#include <linux/string.h>
>>> +
>>> +#include <media/media-entity.h>
>>> +#include <media/v4l2-common.h>
>>> +#include <media/v4l2-event.h>
>>> +#include <media/v4l2-mc.h>
>>> +#include <media/v4l2-subdev.h>
>>> +
>>> +#include "mali-c55-common.h"
>>> +#include "mali-c55-registers.h"
>>> +
>>> +static const struct mali_c55_isp_fmt mali_c55_isp_fmts[] = {
>>> +	{
>>> +		.code = MEDIA_BUS_FMT_SRGGB20_1X20,
>>> +		.order = MALI_C55_BAYER_ORDER_RGGB,
>>> +		.encoding = V4L2_PIXEL_ENC_BAYER,
>>> +	},
>>> +	{
>>> +		.code = MEDIA_BUS_FMT_SGRBG20_1X20,
>>> +		.order = MALI_C55_BAYER_ORDER_GRBG,
>>> +		.encoding = V4L2_PIXEL_ENC_BAYER,
>>> +	},
>>> +	{
>>> +		.code = MEDIA_BUS_FMT_SGBRG20_1X20,
>>> +		.order = MALI_C55_BAYER_ORDER_GBRG,
>>> +		.encoding = V4L2_PIXEL_ENC_BAYER,
>>> +	},
>>> +	{
>>> +		.code = MEDIA_BUS_FMT_SBGGR20_1X20,
>>> +		.order = MALI_C55_BAYER_ORDER_BGGR,
>>> +		.encoding = V4L2_PIXEL_ENC_BAYER,
>>> +	},
>>> +	{
>>> +		.code = MEDIA_BUS_FMT_RGB202020_1X60,
>>> +		.order = 0, /* Not relevant for this format */
>>> +		.encoding = V4L2_PIXEL_ENC_RGB,
>>> +	}
>>> +	/*
>>> +	 * TODO: Support MEDIA_BUS_FMT_YUV20_1X60 here. This is so that we can
>>> +	 * also support YUV input from a sensor passed-through to the output. At
>>> +	 * present we have no mechanism to test that though so it may have to
>>> +	 * wait a while...
>>> +	 */
>>> +};
>>> +
>>> +const struct mali_c55_isp_fmt *
>>> +mali_c55_isp_fmt_next(const struct mali_c55_isp_fmt *fmt)
>>> +{
>>> +	if (!fmt)
>>> +		fmt = &mali_c55_isp_fmts[0];
>>> +	else
>>> +		fmt++;
>>> +
>>> +	for (; fmt < &mali_c55_isp_fmts[ARRAY_SIZE(mali_c55_isp_fmts)]; fmt++)
>>> +		return fmt;
>> That's peculiar.
>>
>> 	if (!fmt)
>> 		fmt = &mali_c55_isp_fmts[0];
>> 	else if (fmt < &mali_c55_isp_fmts[ARRAY_SIZE(mali_c55_isp_fmts)])
>> 		return ++fmt;
>> 	else
>> 		return NULL;
>>
>>> +
>>> +	return NULL;
>>> +}
>>> +
>>> +bool mali_c55_isp_is_format_supported(unsigned int mbus_code)
>>> +{
>>> +	const struct mali_c55_isp_fmt *isp_fmt;
>>> +
>>> +	for_each_mali_isp_fmt(isp_fmt) {
>> I would open-code the loop instead of using the macro, like you do
>> below. It will be more efficient.
>>
>>> +		if (isp_fmt->code == mbus_code)
>>> +			return true;
>>> +	}
>>> +
>>> +	return false;
>>> +}
>>> +
>>> +static const struct mali_c55_isp_fmt *
>>> +mali_c55_isp_get_mbus_config_by_code(u32 code)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(mali_c55_isp_fmts); i++) {
>>> +		if (mali_c55_isp_fmts[i].code == code)
>>> +			return &mali_c55_isp_fmts[i];
>>> +	}
>>> +
>>> +	return NULL;
>>> +}
>>> +
>>> +static void mali_c55_isp_stop(struct mali_c55 *mali_c55)
>>> +{
>>> +	u32 val;
>>> +
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST, MALI_C55_INPUT_SAFE_STOP);
>> 	mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST,
>> 		       MALI_C55_INPUT_SAFE_STOP);
>>
>>> +	readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
>>> +			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
>>> +}
>>> +
>>> +static int mali_c55_isp_start(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct mali_c55_ctx *ctx = mali_c55_get_active_context(mali_c55);
>>> +	const struct mali_c55_isp_fmt *cfg;
>>> +	struct v4l2_mbus_framefmt *format;
>> const
>>
>>> +	struct v4l2_subdev_state *state;
>>> +	struct v4l2_rect *crop;
>> const
>>
>>> +	struct v4l2_subdev *sd;
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	sd = &mali_c55->isp.sd;
>> Assign when declaring the variable.
>>
>>> +
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
>>> +			     MALI_C55_REG_MCU_CONFIG_WRITE_MASK, 0x01);
>>> +
>>> +	/* Apply input windowing */
>>> +	state = v4l2_subdev_get_locked_active_state(sd);
>> Using .enable_streams() (see below) you'll get this for free.
>>
>>> +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
>>> +	format = v4l2_subdev_state_get_format(state,
>>> +					      MALI_C55_ISP_PAD_SINK_VIDEO);
>>> +	cfg = mali_c55_isp_get_mbus_config_by_code(format->code);
>>> +
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_HC_START,
>>> +		       MALI_C55_HC_START(crop->left));
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_HC_SIZE,
>>> +		       MALI_C55_HC_SIZE(crop->width));
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_VC_START_SIZE,
>>> +		       MALI_C55_VC_START(crop->top) |
>>> +		       MALI_C55_VC_SIZE(crop->height));
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
>>> +			     MALI_C55_REG_ACTIVE_WIDTH_MASK, format->width);
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
>>> +			     MALI_C55_REG_ACTIVE_HEIGHT_MASK, format->height);
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_BAYER_ORDER,
>>> +			     MALI_C55_BAYER_ORDER_MASK, cfg->order);
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_INPUT_WIDTH,
>>> +			     MALI_C55_INPUT_WIDTH_MASK,
>>> +			     MALI_C55_INPUT_WIDTH_20BIT);
>>> +
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
>>> +			     MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK,
>>> +			     cfg->encoding == V4L2_PIXEL_ENC_RGB ?
>>> +			     MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK : 0x00);
>>> +
>>> +	ret = mali_c55_config_write(ctx, MALI_C55_CONFIG_PING);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev, "failed to DMA config\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST,
>>> +		       MALI_C55_INPUT_SAFE_START);
>>> +	readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
>>> +			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
>> Should you return an error in case of timeout ?
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +void mali_c55_isp_stop_stream(struct mali_c55_isp *isp)
>> Why is this not handled wired to .s_stream() ? Or better,
>> .enable_streams() and .disable_streams().
>>
>>> +{
>>> +	struct mali_c55 *mali_c55 = isp->mali_c55;
>>> +	struct v4l2_subdev *sd;
>>> +
>>> +	if (isp->remote_src) {
>>> +		sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
>>> +		v4l2_subdev_disable_streams(sd, isp->remote_src->index, BIT(0));
>>> +	}
>>> +	isp->remote_src = NULL;
>>> +
>>> +	mali_c55_isp_stop(mali_c55);
>>> +}
>>> +
>>> +int mali_c55_isp_start_stream(struct mali_c55_isp *isp)
>>> +{
>>> +	struct mali_c55 *mali_c55 = isp->mali_c55;
>>> +	struct media_pad *sink_pad;
>>> +	struct v4l2_subdev *sd;
>>> +	int ret;
>>> +
>>> +	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
>>> +	isp->remote_src = media_pad_remote_pad_unique(sink_pad);
>>> +	if (IS_ERR(isp->remote_src)) {
>> If you set the MUST_CONNECT flag for the MALI_C55_ISP_PAD_SINK_VIDEO pad
>> I think you can drop this check.
>>
>>> +		dev_err(mali_c55->dev, "Failed to get source for ISP\n");
>>> +		return PTR_ERR(isp->remote_src);
>>> +	}
>>> +
>>> +	sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
>>> +
>>> +	isp->frame_sequence = 0;
>>> +	ret = mali_c55_isp_start(mali_c55);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev, "Failed to start ISP\n");
>>> +		isp->remote_src = NULL;
>>> +		return ret;
>>> +	}
>>> +
>>> +	/*
>>> +	 * We only support a single input stream, so we can just enable the 1st
>>> +	 * entry in the streams mask.
>>> +	 */
>>> +	ret = v4l2_subdev_enable_streams(sd, isp->remote_src->index, BIT(0));
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev, "Failed to start ISP source\n");
>>> +		mali_c55_isp_stop(mali_c55);
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_isp_enum_mbus_code(struct v4l2_subdev *sd,
>>> +				       struct v4l2_subdev_state *state,
>>> +				       struct v4l2_subdev_mbus_code_enum *code)
>>> +{
>>> +	/*
>>> +	 * Only the internal RGB processed format is allowed on the regular
>>> +	 * processing source pad.
>>> +	 */
>>> +	if (code->pad == MALI_C55_ISP_PAD_SOURCE) {
>>> +		if (code->index)
>>> +			return -EINVAL;
>>> +
>>> +		code->code = MEDIA_BUS_FMT_RGB121212_1X36;
>>> +		return 0;
>>> +	}
>>> +
>>> +	/* On the sink and bypass pads all the supported formats are allowed. */
>>> +	if (code->index >= ARRAY_SIZE(mali_c55_isp_fmts))
>>> +		return -EINVAL;
>>> +
>>> +	code->code = mali_c55_isp_fmts[code->index].code;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_isp_enum_frame_size(struct v4l2_subdev *sd,
>>> +					struct v4l2_subdev_state *state,
>>> +					struct v4l2_subdev_frame_size_enum *fse)
>>> +{
>>> +	const struct mali_c55_isp_fmt *cfg;
>>> +
>>> +	if (fse->index > 0)
>>> +		return -EINVAL;
>>> +
>>> +	/*
>>> +	 * Only the internal RGB processed format is allowed on the regular
>>> +	 * processing source pad.
>>> +	 *
>>> +	 * On the sink and bypass pads all the supported formats are allowed.
>>> +	 */
>>> +	if (fse->pad == MALI_C55_ISP_PAD_SOURCE) {
>>> +		if (fse->code != MEDIA_BUS_FMT_RGB121212_1X36)
>>> +			return -EINVAL;
>>> +	} else {
>>> +		cfg = mali_c55_isp_get_mbus_config_by_code(fse->code);
>>> +		if (!cfg)
>>> +			return -EINVAL;
>>> +	}
>>> +
>>> +	fse->min_width = MALI_C55_MIN_WIDTH;
>>> +	fse->min_height = MALI_C55_MIN_HEIGHT;
>>> +	fse->max_width = MALI_C55_MAX_WIDTH;
>>> +	fse->max_height = MALI_C55_MAX_HEIGHT;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_isp_set_fmt(struct v4l2_subdev *sd,
>>> +				struct v4l2_subdev_state *state,
>>> +				struct v4l2_subdev_format *format)
>>> +{
>>> +	struct v4l2_mbus_framefmt *fmt = &format->format;
>>> +	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
>>> +	const struct mali_c55_isp_fmt *cfg;
>>> +	struct v4l2_rect *crop;
>>> +
>>> +	/*
>>> +	 * Disallow set_fmt on the source pads; format is fixed and the sizes
>>> +	 * are the result of applying the sink crop rectangle to the sink
>>> +	 * format.
>>> +	 */
>>> +	if (format->pad)
>> 	if (format->pad != MALI_C55_ISP_PAD_SINK_VIDEO)
>>
>>> +		return v4l2_subdev_get_fmt(sd, state, format);
>>> +
>>> +	cfg = mali_c55_isp_get_mbus_config_by_code(fmt->code);
>>> +	if (!cfg)
>>> +		fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
>>> +	fmt->field = V4L2_FIELD_NONE;
>> Do you intentionally allow the colorspace fields to be overwritten to
>> any value ? rkisp1_isp_set_src_fmt() and rkisp1_isp_set_sink_fmt() may
>> show you how this could be handled.
>>
>>> +
>>> +	/*
>>> +	 * Clamp sizes in the accepted limits and clamp the crop rectangle in
>>> +	 * the new sizes.
>>> +	 */
>>> +	clamp_t(unsigned int, fmt->width,
>>> +		MALI_C55_MIN_WIDTH, MALI_C55_MAX_WIDTH);
>>> +	clamp_t(unsigned int, fmt->width,
>>> +		MALI_C55_MIN_HEIGHT, MALI_C55_MAX_HEIGHT);
>> clamp_t() returns a value, which you ignore. Those are no-ops. You meant
>>
>> 	fmt->width = clamp_t(unsigned int, fmt->width, MALI_C55_MIN_WIDTH,
>> 			     MALI_C55_MAX_WIDTH);
>> 	fmt->height = clamp_t(unsigned int, fmt->height, MALI_C55_MIN_HEIGHT,
>> 			      MALI_C55_MAX_HEIGHT);
>>
>> Same for every use of clamp_t() through the whole driver.
>>
>> Also, do you need clamp_t() ? I think all values are unsigned int, you
>> can use clamp().
>>
>> Are there any alignment constraints, such a multiples of two for bayer
>> formats ? Same in all the other locations where applicable.
>>
>>> +
>>> +	sink_fmt = v4l2_subdev_state_get_format(state,
>>> +						MALI_C55_ISP_PAD_SINK_VIDEO);
>>> +	*sink_fmt = *fmt;
>>> +
>>> +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
>>> +	crop->left = 0;
>>> +	crop->top = 0;
>>> +	crop->width = fmt->width;
>>> +	crop->height = fmt->height;
>>> +
>>> +	/*
>>> +	 * Propagate format to source pads. On the 'regular' output pad use
>>> +	 * the internal RGB processed format, while on the bypass pad simply
>>> +	 * replicate the ISP sink format. The sizes on both pads are the same as
>>> +	 * the ISP sink crop rectangle.
>>> +	 */
>> Colorspace information will need to be propagated too.
>>
>>> +	src_fmt = v4l2_subdev_state_get_format(state, MALI_C55_ISP_PAD_SOURCE);
>>> +	src_fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
>>> +	src_fmt->width = crop->width;
>>> +	src_fmt->height = crop->height;
>>> +
>>> +	src_fmt = v4l2_subdev_state_get_format(state,
>>> +					       MALI_C55_ISP_PAD_SOURCE_BYPASS);
>>> +	src_fmt->code = fmt->code;
>>> +	src_fmt->width = crop->width;
>>> +	src_fmt->height = crop->height;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_isp_get_selection(struct v4l2_subdev *sd,
>>> +				      struct v4l2_subdev_state *state,
>>> +				      struct v4l2_subdev_selection *sel)
>>> +{
>>> +	if (sel->pad || sel->target != V4L2_SEL_TGT_CROP)
>> 	sel->pad != MALI_C55_ISP_PAD_SINK_VIDEO
>>
>>> +		return -EINVAL;
>>> +
>>> +	sel->r = *v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_isp_set_selection(struct v4l2_subdev *sd,
>>> +				      struct v4l2_subdev_state *state,
>>> +				      struct v4l2_subdev_selection *sel)
>>> +{
>>> +	struct v4l2_mbus_framefmt *src_fmt;
>>> +	struct v4l2_mbus_framefmt *fmt;
>> const
>>
>>> +	struct v4l2_rect *crop;
>>> +
>>> +	if (sel->pad || sel->target != V4L2_SEL_TGT_CROP)
>> Ditto.
>>
>>> +		return -EINVAL;
>>> +
>>> +	fmt = v4l2_subdev_state_get_format(state, MALI_C55_ISP_PAD_SINK_VIDEO);
>>> +
>>> +	clamp_t(unsigned int, sel->r.left, 0, fmt->width);
>>> +	clamp_t(unsigned int, sel->r.top, 0, fmt->height);
>>> +	clamp_t(unsigned int, sel->r.width, MALI_C55_MIN_WIDTH,
>>> +		fmt->width - sel->r.left);
>>> +	clamp_t(unsigned int, sel->r.height, MALI_C55_MIN_HEIGHT,
>>> +		fmt->height - sel->r.top);
>>> +
>>> +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
>>> +	*crop = sel->r;
>>> +
>>> +	/* Propagate the crop rectangle sizes to the source pad format. */
>>> +	src_fmt = v4l2_subdev_state_get_format(state, MALI_C55_ISP_PAD_SOURCE);
>>> +	src_fmt->width = crop->width;
>>> +	src_fmt->height = crop->height;
>> Can you confirm that cropping doesn't affect the bypass path ? And maybe
>> add a comment to mention it.
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct v4l2_subdev_pad_ops mali_c55_isp_pad_ops = {
>>> +	.enum_mbus_code		= mali_c55_isp_enum_mbus_code,
>>> +	.enum_frame_size	= mali_c55_isp_enum_frame_size,
>>> +	.get_fmt		= v4l2_subdev_get_fmt,
>>> +	.set_fmt		= mali_c55_isp_set_fmt,
>>> +	.get_selection		= mali_c55_isp_get_selection,
>>> +	.set_selection		= mali_c55_isp_set_selection,
>>> +	.link_validate		= v4l2_subdev_link_validate_default,
>>> +};
>>> +
>>> +void mali_c55_isp_queue_event_sof(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct v4l2_event event = {
>>> +		.type = V4L2_EVENT_FRAME_SYNC,
>>> +	};
>>> +
>>> +	event.u.frame_sync.frame_sequence = mali_c55->isp.frame_sequence;
>>> +	v4l2_event_queue(mali_c55->isp.sd.devnode, &event);
>>> +}
>>> +
>>> +static int
>>> +mali_c55_isp_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
>>> +			     struct v4l2_event_subscription *sub)
>>> +{
>>> +	if (sub->type != V4L2_EVENT_FRAME_SYNC)
>>> +		return -EINVAL;
>>> +
>>> +	/* V4L2_EVENT_FRAME_SYNC doesn't require an id, so zero should be set */
>>> +	if (sub->id != 0)
>>> +		return -EINVAL;
>>> +
>>> +	return v4l2_event_subscribe(fh, sub, 0, NULL);
>>> +}
>>> +
>>> +static const struct v4l2_subdev_core_ops mali_c55_isp_core_ops = {
>>> +	.subscribe_event = mali_c55_isp_subscribe_event,
>>> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_ops mali_c55_isp_ops = {
>>> +	.pad	= &mali_c55_isp_pad_ops,
>>> +	.core	= &mali_c55_isp_core_ops,
>>> +};
>>> +
>>> +static int mali_c55_isp_init_state(struct v4l2_subdev *sd,
>>> +				   struct v4l2_subdev_state *sd_state)
>> You name this variable state in every other subdev operation handler.
>>
>>> +{
>>> +	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
>>> +	struct v4l2_rect *in_crop;
>>> +
>>> +	sink_fmt = v4l2_subdev_state_get_format(sd_state,
>>> +						MALI_C55_ISP_PAD_SINK_VIDEO);
>>> +	src_fmt = v4l2_subdev_state_get_format(sd_state,
>>> +					       MALI_C55_ISP_PAD_SOURCE);
>>> +	in_crop = v4l2_subdev_state_get_crop(sd_state,
>>> +					     MALI_C55_ISP_PAD_SINK_VIDEO);
>>> +
>>> +	sink_fmt->width = MALI_C55_DEFAULT_WIDTH;
>>> +	sink_fmt->height = MALI_C55_DEFAULT_HEIGHT;
>>> +	sink_fmt->field = V4L2_FIELD_NONE;
>>> +	sink_fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
>> You should initialize the colorspace fields too. Same below.
>>
>>> +
>>> +	*v4l2_subdev_state_get_format(sd_state,
>>> +			      MALI_C55_ISP_PAD_SOURCE_BYPASS) = *sink_fmt;
>>> +
>>> +	src_fmt->width = MALI_C55_DEFAULT_WIDTH;
>>> +	src_fmt->height = MALI_C55_DEFAULT_HEIGHT;
>>> +	src_fmt->field = V4L2_FIELD_NONE;
>>> +	src_fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
>>> +
>>> +	in_crop->top = 0;
>>> +	in_crop->left = 0;
>>> +	in_crop->width = MALI_C55_DEFAULT_WIDTH;
>>> +	in_crop->height = MALI_C55_DEFAULT_HEIGHT;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct v4l2_subdev_internal_ops mali_c55_isp_internal_ops = {
>>> +	.init_state = mali_c55_isp_init_state,
>>> +};
>>> +
>>> +static const struct media_entity_operations mali_c55_isp_media_ops = {
>>> +	.link_validate		= v4l2_subdev_link_validate,
>> 	.link_validate = v4l2_subdev_link_validate,
>>
>> to match mali_c55_isp_internal_ops.
>>
>>> +};
>>> +
>>> +static int mali_c55_isp_notifier_bound(struct v4l2_async_notifier *notifier,
>>> +				       struct v4l2_subdev *subdev,
>>> +				       struct v4l2_async_connection *asc)
>>> +{
>>> +	struct mali_c55_isp *isp = container_of(notifier,
>>> +						struct mali_c55_isp, notifier);
>>> +	struct mali_c55 *mali_c55 = isp->mali_c55;
>>> +	struct media_pad *pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
>>> +	int ret;
>>> +
>>> +	/*
>>> +	 * By default we'll flag this link enabled and the TPG disabled, but
>>> +	 * no immutable flag because we need to be able to switch between the
>>> +	 * two.
>>> +	 */
>>> +	ret = v4l2_create_fwnode_links_to_pad(subdev, pad,
>>> +					      MEDIA_LNK_FL_ENABLED);
>>> +	if (ret)
>>> +		dev_err(mali_c55->dev, "failed to create link for %s\n",
>>> +			subdev->name);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int mali_c55_isp_notifier_complete(struct v4l2_async_notifier *notifier)
>>> +{
>>> +	struct mali_c55_isp *isp = container_of(notifier,
>>> +						struct mali_c55_isp, notifier);
>>> +	struct mali_c55 *mali_c55 = isp->mali_c55;
>>> +
>>> +	return v4l2_device_register_subdev_nodes(&mali_c55->v4l2_dev);
>>> +}
>>> +
>>> +static const struct v4l2_async_notifier_operations mali_c55_isp_notifier_ops = {
>>> +	.bound = mali_c55_isp_notifier_bound,
>>> +	.complete = mali_c55_isp_notifier_complete,
>>> +};
>>> +
>>> +static int mali_c55_isp_parse_endpoint(struct mali_c55_isp *isp)
>>> +{
>>> +	struct mali_c55 *mali_c55 = isp->mali_c55;
>>> +	struct v4l2_async_connection *asc;
>>> +	struct fwnode_handle *ep;
>>> +	int ret;
>>> +
>>> +	v4l2_async_nf_init(&isp->notifier, &mali_c55->v4l2_dev);
>>> +
>>> +	/*
>>> +	 * The ISP should have a single endpoint pointing to some flavour of
>>> +	 * CSI-2 receiver...but for now at least we do want everything to work
>>> +	 * normally even with no sensors connected, as we have the TPG. If we
>>> +	 * don't find a sensor just warn and return success.
>>> +	 */
>>> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(mali_c55->dev),
>>> +					     0, 0, 0);
>>> +	if (!ep) {
>>> +		dev_warn(mali_c55->dev, "no local endpoint found\n");
>>> +		return 0;
>>> +	}
>>> +
>>> +	asc = v4l2_async_nf_add_fwnode_remote(&isp->notifier, ep,
>>> +					      struct v4l2_async_connection);
>>> +	if (IS_ERR(asc)) {
>>> +		dev_err(mali_c55->dev, "failed to add remote fwnode\n");
>>> +		ret = PTR_ERR(asc);
>>> +		goto err_put_ep;
>>> +	}
>>> +
>>> +	isp->notifier.ops = &mali_c55_isp_notifier_ops;
>>> +	ret = v4l2_async_nf_register(&isp->notifier);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev, "failed to register notifier\n");
>>> +		goto err_cleanup_nf;
>>> +	}
>>> +
>>> +	fwnode_handle_put(ep);
>>> +
>>> +	return 0;
>>> +
>>> +err_cleanup_nf:
>>> +	v4l2_async_nf_cleanup(&isp->notifier);
>>> +err_put_ep:
>>> +	fwnode_handle_put(ep);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +int mali_c55_register_isp(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct mali_c55_isp *isp = &mali_c55->isp;
>>> +	struct v4l2_subdev *sd = &isp->sd;
>>> +	int ret;
>>> +
>>> +	isp->mali_c55 = mali_c55;
>>> +
>>> +	v4l2_subdev_init(sd, &mali_c55_isp_ops);
>>> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
>>> +	sd->entity.ops = &mali_c55_isp_media_ops;
>>> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
>>> +	sd->internal_ops = &mali_c55_isp_internal_ops;
>>> +	strscpy(sd->name, MALI_C55_DRIVER_NAME " isp", sizeof(sd->name));
>>> +
>>> +	isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK;
>> The MUST_CONNECT flag would make sense here.
>>
>>> +	isp->pads[MALI_C55_ISP_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
>>> +	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
>>> +
>>> +	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
>>> +				     isp->pads);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = v4l2_subdev_init_finalize(sd);
>>> +	if (ret)
>>> +		goto err_cleanup_media_entity;
>>> +
>>> +	ret = v4l2_device_register_subdev(&mali_c55->v4l2_dev, sd);
>>> +	if (ret)
>>> +		goto err_cleanup_subdev;
>>> +
>>> +	ret = mali_c55_isp_parse_endpoint(isp);
>>> +	if (ret)
>>> +		goto err_cleanup_subdev;
>> As noted elsewhere, I think this belongs to mali-c55-core.c.
>>
>>> +
>>> +	mutex_init(&isp->lock);
>> This lock is used in mali-c55-capture.c only, that seems weird.
>>
>>> +
>>> +	return 0;
>>> +
>>> +err_cleanup_subdev:
>>> +	v4l2_subdev_cleanup(sd);
>>> +err_cleanup_media_entity:
>>> +	media_entity_cleanup(&sd->entity);
>>> +	isp->mali_c55 = NULL;
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +void mali_c55_unregister_isp(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct mali_c55_isp *isp = &mali_c55->isp;
>>> +
>>> +	if (!isp->mali_c55)
>>> +		return;
>>> +
>>> +	mutex_destroy(&isp->lock);
>>> +	v4l2_async_nf_unregister(&isp->notifier);
>>> +	v4l2_async_nf_cleanup(&isp->notifier);
>>> +	v4l2_device_unregister_subdev(&isp->sd);
>>> +	v4l2_subdev_cleanup(&isp->sd);
>>> +	media_entity_cleanup(&isp->sd.entity);
>>> +}
>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>>> new file mode 100644
>>> index 000000000000..cb27abde2aa5
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>>> @@ -0,0 +1,258 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * ARM Mali-C55 ISP Driver - Register definitions
>>> + *
>>> + * Copyright (C) 2024 Ideas on Board Oy
>>> + */
>>> +
>>> +#ifndef _MALI_C55_REGISTERS_H
>>> +#define _MALI_C55_REGISTERS_H
>>> +
>>> +#include <linux/bits.h>
>>> +
>>> +/* ISP Common 0x00000 - 0x000ff */
>>> +
>>> +#define MALI_C55_REG_API				0x00000
>>> +#define MALI_C55_REG_PRODUCT				0x00004
>>> +#define MALI_C55_REG_VERSION				0x00008
>>> +#define MALI_C55_REG_REVISION				0x0000c
>>> +#define MALI_C55_REG_PULSE_MODE				0x0003c
>>> +#define MALI_C55_REG_INPUT_MODE_REQUEST			0x0009c
>>> +#define MALI_C55_INPUT_SAFE_STOP			0x00
>>> +#define MALI_C55_INPUT_SAFE_START			0x01
>>> +#define MALI_C55_REG_MODE_STATUS			0x000a0
>>> +#define MALI_C55_REG_INTERRUPT_MASK_VECTOR		0x00030
>>> +#define MALI_C55_INTERRUPT_MASK_ALL			GENMASK(31, 0)
>>> +
>>> +#define MALI_C55_REG_GLOBAL_MONITOR			0x00050
>>> +
>>> +#define MALI_C55_REG_GEN_VIDEO				0x00080
>>> +#define MALI_C55_REG_GEN_VIDEO_ON_MASK			BIT(0)
>>> +#define MALI_C55_REG_GEN_VIDEO_MULTI_MASK		BIT(1)
>>> +#define MALI_C55_REG_GEN_PREFETCH_MASK			GENMASK(31, 16)
>>> +
>>> +#define MALI_C55_REG_MCU_CONFIG				0x00020
>>> +#define MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK		BIT(0)
>> #define MALI_C55_REG_MCU_CONFIG_OVERRIDE		BIT(0)
>>
>> Same in other places where applicable.
>>
>>> +#define MALI_C55_REG_MCU_CONFIG_WRITE_MASK		BIT(1)
>>> +#define MALI_C55_REG_MCU_CONFIG_WRITE_PING		BIT(1)
>>> +#define MALI_C55_REG_MCU_CONFIG_WRITE_PONG		0x00
>>> +#define MALI_C55_REG_MULTI_CONTEXT_MODE_MASK		BIT(8)
>>> +#define MALI_C55_REG_PING_PONG_READ			0x00024
>>> +#define MALI_C55_REG_PING_PONG_READ_MASK		BIT(2)
>>> +
>>> +#define MALI_C55_REG_INTERRUPT_CLEAR_VECTOR		0x00034
>>> +#define MALI_C55_REG_INTERRUPT_CLEAR			0x00040
>>> +#define MALI_C55_REG_INTERRUPT_STATUS_VECTOR		0x00044
>>> +#define MALI_C55_REG_GLOBAL_PARAMETER_STATUS		0x00068
>>> +#define MALI_C55_GPS_PONG_FITTED			BIT(0)
>>> +#define MALI_C55_GPS_WDR_FITTED				BIT(1)
>>> +#define MALI_C55_GPS_COMPRESSION_FITTED			BIT(2)
>>> +#define MALI_C55_GPS_TEMPER_FITTED			BIT(3)
>>> +#define MALI_C55_GPS_SINTER_LITE_FITTED			BIT(4)
>>> +#define MALI_C55_GPS_SINTER_FITTED			BIT(5)
>>> +#define MALI_C55_GPS_IRIDIX_LTM_FITTED			BIT(6)
>>> +#define MALI_C55_GPS_IRIDIX_GTM_FITTED			BIT(7)
>>> +#define MALI_C55_GPS_CNR_FITTED				BIT(8)
>>> +#define MALI_C55_GPS_FRSCALER_FITTED			BIT(9)
>>> +#define MALI_C55_GPS_DS_PIPE_FITTED			BIT(10)
>>> +
>>> +#define MALI_C55_REG_BLANKING				0x00084
>>> +#define MALI_C55_REG_HBLANK_MASK			GENMASK(15, 0)
>>> +#define MALI_C55_REG_VBLANK_MASK			GENMASK(31, 16)
>>> +
>>> +#define MALI_C55_REG_HC_START				0x00088
>>> +#define MALI_C55_HC_START(h)				(((h) & 0xffff) << 16)
>>> +#define MALI_C55_REG_HC_SIZE				0x0008c
>>> +#define MALI_C55_HC_SIZE(h)				((h) & 0xffff)
>>> +#define MALI_C55_REG_VC_START_SIZE			0x00094
>>> +#define MALI_C55_VC_START(v)				((v) & 0xffff)
>>> +#define MALI_C55_VC_SIZE(v)				(((v) & 0xffff) << 16)
>>> +
>>> +/* Ping/Pong Configuration Space */
>>> +#define MALI_C55_REG_BASE_ADDR				0x18e88
>>> +#define MALI_C55_REG_BYPASS_0				0x18eac
>>> +#define MALI_C55_REG_BYPASS_0_VIDEO_TEST		BIT(0)
>>> +#define MALI_C55_REG_BYPASS_0_INPUT_FMT			BIT(1)
>>> +#define MALI_C55_REG_BYPASS_0_DECOMPANDER		BIT(2)
>>> +#define MALI_C55_REG_BYPASS_0_SENSOR_OFFSET_WDR		BIT(3)
>>> +#define MALI_C55_REG_BYPASS_0_GAIN_WDR			BIT(4)
>>> +#define MALI_C55_REG_BYPASS_0_FRAME_STITCH		BIT(5)
>>> +#define MALI_C55_REG_BYPASS_1				0x18eb0
>>> +#define MALI_C55_REG_BYPASS_1_DIGI_GAIN			BIT(0)
>>> +#define MALI_C55_REG_BYPASS_1_FE_SENSOR_OFFS		BIT(1)
>>> +#define MALI_C55_REG_BYPASS_1_FE_SQRT			BIT(2)
>>> +#define MALI_C55_REG_BYPASS_1_RAW_FE			BIT(3)
>>> +#define MALI_C55_REG_BYPASS_2				0x18eb8
>>> +#define MALI_C55_REG_BYPASS_2_SINTER			BIT(0)
>>> +#define MALI_C55_REG_BYPASS_2_TEMPER			BIT(1)
>>> +#define MALI_C55_REG_BYPASS_3				0x18ebc
>>> +#define MALI_C55_REG_BYPASS_3_SQUARE_BE			BIT(0)
>>> +#define MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH	BIT(1)
>>> +#define MALI_C55_REG_BYPASS_3_MESH_SHADING		BIT(3)
>>> +#define MALI_C55_REG_BYPASS_3_WHITE_BALANCE		BIT(4)
>>> +#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(5)
>>> +#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(6)
>>> +#define MALI_C55_REG_BYPASS_4				0x18ec0
>>> +#define MALI_C55_REG_BYPASS_4_DEMOSAIC_RGB		BIT(1)
>>> +#define MALI_C55_REG_BYPASS_4_PF_CORRECTION		BIT(3)
>>> +#define MALI_C55_REG_BYPASS_4_CCM			BIT(4)
>>> +#define MALI_C55_REG_BYPASS_4_CNR			BIT(5)
>>> +#define MALI_C55_REG_FR_BYPASS				0x18ec4
>>> +#define MALI_C55_REG_DS_BYPASS				0x18ec8
>>> +#define MALI_C55_BYPASS_CROP				BIT(0)
>>> +#define MALI_C55_BYPASS_SCALER				BIT(1)
>>> +#define MALI_C55_BYPASS_GAMMA_RGB			BIT(2)
>>> +#define MALI_C55_BYPASS_SHARPEN				BIT(3)
>>> +#define MALI_C55_BYPASS_CS_CONV				BIT(4)
>>> +#define MALI_C55_REG_ISP_RAW_BYPASS			0x18ecc
>>> +#define MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK		BIT(0)
>>> +#define MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK		GENMASK(9, 8)
>>> +#define MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS		2
>>> +#define MALI_C55_ISP_RAW_BYPASS_RGB_FR_BYPASS		1
>>> +#define MALI_C55_ISP_RAW_BYPASS_DS_PIPE_DISABLE		BIT(1)
>>> +#define MALI_C55_ISP_RAW_BYPASS_RAW_BYPASS		BIT(0)
>>> +
>>> +#define MALI_C55_REG_ACTIVE_WIDTH_MASK			0xffff
>>> +#define MALI_C55_REG_ACTIVE_HEIGHT_MASK			0xffff0000
>>> +#define MALI_C55_REG_BAYER_ORDER			0x18e8c
>>> +#define MALI_C55_BAYER_ORDER_MASK			GENMASK(1, 0)
>>> +#define MALI_C55_REG_TPG_CH0				0x18ed8
>>> +#define MALI_C55_TEST_PATTERN_ON_OFF			BIT(0)
>>> +#define MALI_C55_TEST_PATTERN_RGB_MASK			BIT(1)
>>> +#define MALI_C55_REG_TPG_R_BACKGROUND			0x18ee0
>>> +#define MALI_C55_REG_TPG_G_BACKGROUND			0x18ee4
>>> +#define MALI_C55_REG_TPG_B_BACKGROUND			0x18ee8
>>> +#define MALI_C55_TPG_BACKGROUND_MAX			0xfffff
>>> +#define MALI_C55_REG_INPUT_WIDTH			0x18f98
>>> +#define MALI_C55_INPUT_WIDTH_MASK			GENMASK(18, 16)
>>> +#define MALI_C55_INPUT_WIDTH_8BIT			0
>>> +#define MALI_C55_INPUT_WIDTH_10BIT			1
>>> +#define MALI_C55_INPUT_WIDTH_12BIT			2
>>> +#define MALI_C55_INPUT_WIDTH_14BIT			3
>>> +#define MALI_C55_INPUT_WIDTH_16BIT			4
>>> +#define MALI_C55_INPUT_WIDTH_20BIT			5
>>> +#define MALI_C55_REG_SPACE_SIZE				0x4000
>>> +#define MALI_C55_REG_CONFIG_SPACES_OFFSET		0x0ab6c
>>> +#define MALI_C55_CONFIG_SPACE_SIZE			0x1231c
>>> +
>>> +#define MALI_C55_REG_SINTER_CONFIG			0x19348
>>> +#define MALI_C55_SINTER_VIEW_FILTER_MASK		GENMASK(1, 0)
>>> +#define MALI_C55_SINTER_SCALE_MODE_MASK			GENMASK(3, 2)
>>> +#define MALI_C55_SINTER_ENABLE_MASK			BIT(4)
>>> +#define MALI_C55_SINTER_FILTER_SELECT_MASK		BIT(5)
>>> +#define MALI_C55_SINTER_INT_SELECT_MASK			BIT(6)
>>> +#define MALI_C55_SINTER_RM_ENABLE_MASK			BIT(7)
>>> +
>>> +/* Colour Correction Matrix Configuration */
>>> +#define MALI_C55_REG_CCM_ENABLE				0x1b07c
>>> +#define MALI_C55_CCM_ENABLE_MASK			BIT(0)
>>> +#define MALI_C55_REG_CCM_COEF_R_R			0x1b080
>>> +#define MALI_C55_REG_CCM_COEF_R_G			0x1b084
>>> +#define MALI_C55_REG_CCM_COEF_R_B			0x1b088
>>> +#define MALI_C55_REG_CCM_COEF_G_R			0x1b090
>>> +#define MALI_C55_REG_CCM_COEF_G_G			0x1b094
>>> +#define MALI_C55_REG_CCM_COEF_G_B			0x1b098
>>> +#define MALI_C55_REG_CCM_COEF_B_R			0x1b0a0
>>> +#define MALI_C55_REG_CCM_COEF_B_G			0x1b0a4
>>> +#define MALI_C55_REG_CCM_COEF_B_B			0x1b0a8
>>> +#define MALI_C55_CCM_COEF_MASK				GENMASK(12, 0)
>>> +#define MALI_C55_REG_CCM_ANTIFOG_GAIN_R			0x1b0b0
>>> +#define MALI_C55_REG_CCM_ANTIFOG_GAIN_G			0x1b0b4
>>> +#define MALI_C55_REG_CCM_ANTIFOG_GAIN_B			0x1b0b8
>>> +#define MALI_C55_CCM_ANTIFOG_GAIN_MASK			GENMASK(11, 0)
>>> +#define MALI_C55_REG_CCM_ANTIFOG_OFFSET_R		0x1b0c0
>>> +#define MALI_C55_REG_CCM_ANTIFOG_OFFSET_G		0x1b0c4
>>> +#define MALI_C55_REG_CCM_ANTIFOG_OFFSET_B		0x1b0c8
>>> +#define MALI_C55_CCM_ANTIFOG_OFFSET_MASK		GENMASK(11, 0)
>>> +
>>> +/*
>>> + * The Mali-C55 ISP has up to two output pipes; known as full resolution and
>>> + * down scaled. The register space for these is laid out identically, but offset
>>> + * by 372 bytes.
>>> + */
>>> +#define MALI_C55_CAP_DEV_FR_REG_OFFSET		0x0
>>> +#define MALI_C55_CAP_DEV_DS_REG_OFFSET		0x174
>>> +
>>> +#define MALI_C55_REG_CS_CONV_CONFIG(offset)		(0x1c098 + (offset))
>>> +#define MALI_C55_CS_CONV_MATRIX_MASK			BIT(0)
>>> +#define MALI_C55_CS_CONV_FILTER_MASK			BIT(1)
>>> +#define MALI_C55_CS_CONV_HORZ_DOWNSAMPLE_MASK		BIT(2)
>>> +#define MALI_C55_CS_CONV_VERT_DOWNSAMPLE_MASK		BIT(3)
>>> +#define MALI_C55_REG_Y_WRITER_MODE(offset)		(0x1c0ec + (offset))
>>> +#define MALI_C55_REG_UV_WRITER_MODE(offset)		(0x1c144 + (offset))
>>> +#define MALI_C55_WRITER_MODE_MASK			GENMASK(4, 0)
>>> +#define MALI_C55_WRITER_SUBMODE_MASK			GENMASK(7, 6)
>>> +#define MALI_C55_WRITER_FRAME_WRITE_MASK		BIT(9)
>>> +#define MALI_C55_REG_ACTIVE_OUT_Y_SIZE(offset)		(0x1c0f0 + (offset))
>>> +#define MALI_C55_REG_ACTIVE_OUT_UV_SIZE(offset)		(0x1c148 + (offset))
>>> +#define MALI_C55_REG_ACTIVE_OUT_SIZE_W(w)		((w) << 0)
>>> +#define MALI_C55_REG_ACTIVE_OUT_SIZE_H(h)		((h) << 16)
>>> +#define MALI_C55_REG_Y_WRITER_BANKS_BASE(offset)	(0x1c0f4 + (offset))
>>> +#define MALI_C55_REG_Y_WRITER_BANKS_CONFIG(offset)	(0x1c108 + (offset))
>>> +#define MALI_C55_REG_Y_WRITER_MAX_BANKS_MASK		GENMASK(2, 0)
>>> +#define MALI_C55_REG_Y_WRITER_BANKS_RESTART		BIT(3)
>>> +#define MALI_C55_REG_Y_WRITER_OFFSET(offset)		(0x1c10c + (offset))
>>> +#define MALI_C55_REG_UV_WRITER_BANKS_BASE(offset)	(0x1c14c + (offset))
>>> +#define MALI_C55_REG_UV_WRITER_BANKS_CONFIG(offset)	(0x1c160 + (offset))
>>> +#define MALI_C55_REG_UV_WRITER_MAX_BANKS_MASK		GENMASK(2, 0)
>>> +#define MALI_C55_REG_UV_WRITER_BANKS_RESTART		BIT(3)
>>> +#define MALI_C55_REG_UV_WRITER_OFFSET(offset)		(0x1c164 + (offset))
>>> +
>>> +#define MALI_C55_REG_TEST_GEN_CH0_OFF_ON
>>> +#define MALI_C55_REG_TEST_GEN_CH0_PATTERN_TYPE		0x18edc
>>> +
>>> +#define MALI_C55_REG_CROP_EN(offset)			(0x1c028 + (offset))
>>> +#define MALI_C55_CROP_ENABLE				BIT(0)
>>> +#define MALI_C55_REG_CROP_X_START(offset)		(0x1c02c + (offset))
>>> +#define MALI_C55_REG_CROP_Y_START(offset)		(0x1c030 + (offset))
>>> +#define MALI_C55_REG_CROP_X_SIZE(offset)		(0x1c034 + (offset))
>>> +#define MALI_C55_REG_CROP_Y_SIZE(offset)		(0x1c038 + (offset))
>>> +#define MALI_C55_REG_SCALER_TIMEOUT_EN(offset)		(0x1c040 + (offset))
>>> +#define MALI_C55_SCALER_TIMEOUT_EN			BIT(4)
>>> +#define MALI_C55_SCALER_TIMEOUT(t)			((t) << 16)
>>> +#define MALI_C55_REG_SCALER_IN_WIDTH(offset)		(0x1c044 + (offset))
>>> +#define MALI_C55_REG_SCALER_IN_HEIGHT(offset)		(0x1c048 + (offset))
>>> +#define MALI_C55_REG_SCALER_OUT_WIDTH(offset)		(0x1c04c + (offset))
>>> +#define MALI_C55_REG_SCALER_OUT_HEIGHT(offset)		(0x1c050 + (offset))
>>> +#define MALI_C55_REG_SCALER_HFILT_TINC(offset)		(0x1c054 + (offset))
>>> +#define MALI_C55_REG_SCALER_HFILT_COEF(offset)		(0x1c058 + (offset))
>>> +#define MALI_C55_REG_SCALER_VFILT_TINC(offset)		(0x1c05c + (offset))
>>> +#define MALI_C55_REG_SCALER_VFILT_COEF(offset)		(0x1c060 + (offset))
>>> +
>>> +#define MALI_C55_REG_GAMMA_RGB_ENABLE(offset)		(0x1c064 + (offset))
>>> +#define MALI_C55_GAMMA_ENABLE_MASK			BIT(0)
>>> +#define MALI_C55_REG_GAMMA_GAINS_1(offset)		(0x1c068 + (offset))
>>> +#define MALI_C55_GAMMA_GAIN_R_MASK			GENMASK(11, 0)
>>> +#define MALI_C55_GAMMA_GAIN_G_MASK			GENMASK(27, 16)
>>> +#define MALI_C55_REG_GAMMA_GAINS_2(offset)		(0x1c06c + (offset))
>>> +#define MALI_C55_GAMMA_GAIN_B_MASK			GENMASK(11, 0)
>>> +#define MALI_C55_REG_GAMMA_OFFSETS_1(offset)		(0x1c070 + (offset))
>>> +#define MALI_C55_GAMMA_OFFSET_R_MASK			GENMASK(11, 0)
>>> +#define MALI_C55_GAMMA_OFFSET_G_MASK			GENMASK(27, 16)
>>> +#define MALI_C55_REG_GAMMA_OFFSETS_2(offset)		(0x1c074 + (offset))
>>> +#define MALI_C55_GAMMA_OFFSET_B_MASK			GENMASK(11, 0)
>>> +
>>> +/* Output DMA Writer */
>>> +
>>> +#define MALI_C55_OUTPUT_DISABLED		0
>>> +#define MALI_C55_OUTPUT_RGB32			1
>>> +#define MALI_C55_OUTPUT_A2R10G10B10		2
>>> +#define MALI_C55_OUTPUT_RGB565			3
>>> +#define MALI_C55_OUTPUT_RGB24			4
>>> +#define MALI_C55_OUTPUT_GEN32			5
>>> +#define MALI_C55_OUTPUT_RAW16			6
>>> +#define MALI_C55_OUTPUT_AYUV			8
>>> +#define MALI_C55_OUTPUT_Y410			9
>>> +#define MALI_C55_OUTPUT_YUY2			10
>>> +#define MALI_C55_OUTPUT_UYVY			11
>>> +#define MALI_C55_OUTPUT_Y210			12
>>> +#define MALI_C55_OUTPUT_NV12_21			13
>>> +#define MALI_C55_OUTPUT_YUV_420_422		17
>>> +#define MALI_C55_OUTPUT_P210_P010		19
>>> +#define MALI_C55_OUTPUT_YUV422			20
>> I'd define this just below the MALI_C55_REG_UV_WRITER_MODE register
>> macro.
>>
>>> +
>>> +#define MALI_C55_OUTPUT_PLANE_ALT0		0
>>> +#define MALI_C55_OUTPUT_PLANE_ALT1		1
>>> +#define MALI_C55_OUTPUT_PLANE_ALT2		2
>> Same here ?
>>
>>> +
>>> +#endif /* _MALI_C55_REGISTERS_H */
>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer-coefs.h b/drivers/media/platform/arm/mali-c55/mali-c55-resizer-coefs.h
>>> new file mode 100644
>>> index 000000000000..8edae87f1e5f
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer-coefs.h
>>> @@ -0,0 +1,382 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * ARM Mali-C55 ISP Driver - Resizer Coefficients
>>> + *
>>> + * Copyright (C) 2024 Ideas on Board Oy
>>> + */
>>> +
>>> +#ifndef _MALI_C55_RESIZER_COEFS_H
>>> +#define _MALI_C55_RESIZER_COEFS_H
>>> +
>>> +#include "mali-c55-common.h"
>>> +
>>> +#define MALI_C55_RESIZER_COEFS_NUM_BANKS	8
>>> +#define MALI_C55_RESIZER_COEFS_NUM_ENTRIES	64
>> Do these belongs to mali-c55-registers.h ?
>>
>>> +
>>> +static const unsigned int mali_c55_scaler_h_filter_coefficients[8][64] = {
>>> +	{	/* Bank 0 */
>>> +		0x24fc0000, 0x0000fc24, 0x27fc0000, 0x0000fc21,
>>> +		0x28fc0000, 0x0000fd1f, 0x2cfb0000, 0x0000fd1c,
>>> +		0x2efb0000, 0x0000fd1a, 0x30fb0000, 0x0000fe17,
>>> +		0x32fb0000, 0x0000fe15, 0x35fb0000, 0x0000fe12,
>>> +		0x35fc0000, 0x0000ff10, 0x37fc0000, 0x0000ff0e,
>>> +		0x39fc0000, 0x0000ff0c, 0x3afd0000, 0x0000ff0a,
>>> +		0x3afe0000, 0x00000008, 0x3cfe0000, 0x00000006,
>>> +		0x3dff0000, 0x00000004, 0x3d000000, 0x00000003,
>>> +		0x3c020000, 0x00000002, 0x3d030000, 0x00000000,
>>> +		0x3d040000, 0x000000ff, 0x3c060000, 0x000000fe,
>>> +		0x3a080000, 0x000000fe, 0x3a0aff00, 0x000000fd,
>>> +		0x390cff00, 0x000000fc, 0x370eff00, 0x000000fc,
>>> +		0x3510ff00, 0x000000fc, 0x3512fe00, 0x000000fb,
>>> +		0x3215fe00, 0x000000fb, 0x3017fe00, 0x000000fb,
>>> +		0x2e1afd00, 0x000000fb, 0x2c1cfd00, 0x000000fb,
>>> +		0x281ffd00, 0x000000fc, 0x2721fc00, 0x000000fc,
>>> +	},
>>> +	{	/* Bank 1 */
>>> +		0x25fb0000, 0x0000fb25, 0x27fb0000, 0x0000fb23,
>>> +		0x29fb0000, 0x0000fb21, 0x2afc0000, 0x0000fb1f,
>>> +		0x2cfc0000, 0x0000fb1d, 0x2efc0000, 0x0000fb1b,
>>> +		0x2ffd0000, 0x0000fb19, 0x2ffe0000, 0x0000fc17,
>>> +		0x31fe0000, 0x0000fc15, 0x32ff0000, 0x0000fc13,
>>> +		0x3400ff00, 0x0000fc11, 0x3301ff00, 0x0000fd10,
>>> +		0x3402ff00, 0x0000fd0e, 0x3503ff00, 0x0000fd0c,
>>> +		0x3505ff00, 0x0000fd0a, 0x3506fe00, 0x0000fe09,
>>> +		0x3607fe00, 0x0000fe07, 0x3509fe00, 0x0000fe06,
>>> +		0x350afd00, 0x0000ff05, 0x350cfd00, 0x0000ff03,
>>> +		0x340efd00, 0x0000ff02, 0x3310fd00, 0x0000ff01,
>>> +		0x3411fc00, 0x0000ff00, 0x3213fc00, 0x000000ff,
>>> +		0x3115fc00, 0x000000fe, 0x2f17fc00, 0x000000fe,
>>> +		0x2f19fb00, 0x000000fd, 0x2e1bfb00, 0x000000fc,
>>> +		0x2c1dfb00, 0x000000fc, 0x2a1ffb00, 0x000000fc,
>>> +		0x2921fb00, 0x000000fb, 0x2723fb00, 0x000000fb,
>>> +	},
>>> +	{	/* Bank 2 */
>>> +		0x1f010000, 0x0000011f, 0x21010000, 0x0000001e,
>>> +		0x21020000, 0x0000001d, 0x22020000, 0x0000001c,
>>> +		0x23030000, 0x0000ff1b, 0x2404ff00, 0x0000ff1a,
>>> +		0x2504ff00, 0x0000ff19, 0x2505ff00, 0x0000ff18,
>>> +		0x2606ff00, 0x0000fe17, 0x2607ff00, 0x0000fe16,
>>> +		0x2708ff00, 0x0000fe14, 0x2709ff00, 0x0000fe13,
>>> +		0x270aff00, 0x0000fe12, 0x280bfe00, 0x0000fe11,
>>> +		0x280cfe00, 0x0000fe10, 0x280dfe00, 0x0000fe0f,
>>> +		0x280efe00, 0x0000fe0e, 0x280ffe00, 0x0000fe0d,
>>> +		0x2810fe00, 0x0000fe0c, 0x2811fe00, 0x0000fe0b,
>>> +		0x2712fe00, 0x0000ff0a, 0x2713fe00, 0x0000ff09,
>>> +		0x2714fe00, 0x0000ff08, 0x2616fe00, 0x0000ff07,
>>> +		0x2617fe00, 0x0000ff06, 0x2518ff00, 0x0000ff05,
>>> +		0x2519ff00, 0x0000ff04, 0x241aff00, 0x0000ff04,
>>> +		0x231bff00, 0x00000003, 0x221c0000, 0x00000002,
>>> +		0x211d0000, 0x00000002, 0x211e0000, 0x00000001,
>>> +	},
>>> +	{	/* Bank 3 */
>>> +		0x1b06ff00, 0x00ff061b, 0x1b07ff00, 0x00ff061a,
>>> +		0x1c07ff00, 0x00ff051a, 0x1c08ff00, 0x00ff0519,
>>> +		0x1c09ff00, 0x00ff0419, 0x1d09ff00, 0x00ff0418,
>>> +		0x1e0aff00, 0x00ff0317, 0x1e0aff00, 0x00ff0317,
>>> +		0x1e0bff00, 0x00ff0316, 0x1f0cff00, 0x00ff0215,
>>> +		0x1e0cff00, 0x00000215, 0x1e0dff00, 0x00000214,
>>> +		0x1e0e0000, 0x00000113, 0x1e0e0000, 0x00000113,
>>> +		0x1e0f0000, 0x00000112, 0x1f100000, 0x00000011,
>>> +		0x20100000, 0x00000010, 0x1f110000, 0x00000010,
>>> +		0x1e120100, 0x0000000f, 0x1e130100, 0x0000000e,
>>> +		0x1e130100, 0x0000000e, 0x1e140200, 0x0000ff0d,
>>> +		0x1e150200, 0x0000ff0c, 0x1f1502ff, 0x0000ff0c,
>>> +		0x1e1603ff, 0x0000ff0b, 0x1e1703ff, 0x0000ff0a,
>>> +		0x1e1703ff, 0x0000ff0a, 0x1d1804ff, 0x0000ff09,
>>> +		0x1c1904ff, 0x0000ff09, 0x1c1905ff, 0x0000ff08,
>>> +		0x1c1a05ff, 0x0000ff07, 0x1b1a06ff, 0x0000ff07,
>>> +	},
>>> +	{	/* Bank 4 */
>>> +		0x17090000, 0x00000917, 0x18090000, 0x00000916,
>>> +		0x170a0100, 0x00000816, 0x170a0100, 0x00000816,
>>> +		0x180b0100, 0x00000715, 0x180b0100, 0x00000715,
>>> +		0x170c0100, 0x00000715, 0x190c0100, 0x00000614,
>>> +		0x180d0100, 0x00000614, 0x190d0200, 0x00000513,
>>> +		0x180e0200, 0x00000513, 0x180e0200, 0x00000513,
>>> +		0x1a0e0200, 0x00000412, 0x190f0200, 0x00000412,
>>> +		0x190f0300, 0x00000411, 0x18100300, 0x00000411,
>>> +		0x1a100300, 0x00000310, 0x18110400, 0x00000310,
>>> +		0x19110400, 0x0000030f, 0x19120400, 0x0000020f,
>>> +		0x1a120400, 0x0000020e, 0x18130500, 0x0000020e,
>>> +		0x18130500, 0x0000020e, 0x19130500, 0x0000020d,
>>> +		0x18140600, 0x0000010d, 0x19140600, 0x0000010c,
>>> +		0x17150700, 0x0000010c, 0x18150700, 0x0000010b,
>>> +		0x18150700, 0x0000010b, 0x17160800, 0x0000010a,
>>> +		0x17160800, 0x0000010a, 0x18160900, 0x00000009,
>>> +	},
>>> +	{	/* Bank 5 */
>>> +		0x120b0300, 0x00030b12, 0x120c0300, 0x00030b11,
>>> +		0x110c0400, 0x00030b11, 0x110c0400, 0x00030b11,
>>> +		0x130c0400, 0x00020a11, 0x120d0400, 0x00020a11,
>>> +		0x110d0500, 0x00020a11, 0x110d0500, 0x00020a11,
>>> +		0x130d0500, 0x00010911, 0x130e0500, 0x00010910,
>>> +		0x120e0600, 0x00010910, 0x120e0600, 0x00010910,
>>> +		0x130e0600, 0x00010810, 0x120f0600, 0x00010810,
>>> +		0x120f0700, 0x00000810, 0x130f0700, 0x0000080f,
>>> +		0x140f0700, 0x0000070f, 0x130f0800, 0x0000070f,
>>> +		0x12100800, 0x0000070f, 0x12100801, 0x0000060f,
>>> +		0x13100801, 0x0000060e, 0x12100901, 0x0000060e,
>>> +		0x12100901, 0x0000060e, 0x13100901, 0x0000050e,
>>> +		0x13110901, 0x0000050d, 0x11110a02, 0x0000050d,
>>> +		0x11110a02, 0x0000050d, 0x12110a02, 0x0000040d,
>>> +		0x13110a02, 0x0000040c, 0x11110b03, 0x0000040c,
>>> +		0x11110b03, 0x0000040c, 0x12110b03, 0x0000030c,
>>> +	},
>>> +	{	/* Bank 6 */
>>> +		0x0b0a0805, 0x00080a0c, 0x0b0a0805, 0x00080a0c,
>>> +		0x0c0a0805, 0x00080a0b, 0x0c0a0805, 0x00080a0b,
>>> +		0x0d0a0805, 0x00070a0b, 0x0d0a0805, 0x00070a0b,
>>> +		0x0d0a0805, 0x00070a0b, 0x0c0a0806, 0x00070a0b,
>>> +		0x0b0b0806, 0x00070a0b, 0x0c0b0806, 0x0007090b,
>>> +		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
>>> +		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
>>> +		0x0b0b0906, 0x0007090b, 0x0c0b0906, 0x0006090b,
>>> +		0x0c0b0906, 0x0006090b, 0x0c0b0906, 0x0006090b,
>>> +		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
>>> +		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
>>> +		0x0b0b0907, 0x0006090b, 0x0c0b0907, 0x0006080b,
>>> +		0x0b0b0a07, 0x0006080b, 0x0c0b0a07, 0x0006080a,
>>> +		0x0d0b0a07, 0x0005080a, 0x0d0b0a07, 0x0005080a,
>>> +		0x0d0b0a07, 0x0005080a, 0x0c0b0a08, 0x0005080a,
>>> +		0x0c0b0a08, 0x0005080a, 0x0c0b0a08, 0x0005080a,
>>> +	},
>>> +	{	/* Bank 7 */
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
>>> +	}
>>> +};
>>> +
>>> +static const unsigned int mali_c55_scaler_v_filter_coefficients[8][64] = {
>>> +	{	/* Bank 0 */
>>> +		0x2424fc00, 0x000000fc, 0x2721fc00, 0x000000fc,
>>> +		0x281ffd00, 0x000000fc, 0x2c1cfd00, 0x000000fb,
>>> +		0x2e1afd00, 0x000000fb, 0x3017fe00, 0x000000fb,
>>> +		0x3215fe00, 0x000000fb, 0x3512fe00, 0x000000fb,
>>> +		0x3510ff00, 0x000000fc, 0x370eff00, 0x000000fc,
>>> +		0x390cff00, 0x000000fc, 0x3a0aff00, 0x000000fd,
>>> +		0x3a080000, 0x000000fe, 0x3c060000, 0x000000fe,
>>> +		0x3d040000, 0x000000ff, 0x3d030000, 0x00000000,
>>> +		0x3c020000, 0x00000002, 0x3d000000, 0x00000003,
>>> +		0x3dff0000, 0x00000004, 0x3cfe0000, 0x00000006,
>>> +		0x3afe0000, 0x00000008, 0x3afd0000, 0x0000ff0a,
>>> +		0x39fc0000, 0x0000ff0c, 0x37fc0000, 0x0000ff0e,
>>> +		0x35fc0000, 0x0000ff10, 0x35fb0000, 0x0000fe12,
>>> +		0x32fb0000, 0x0000fe15, 0x30fb0000, 0x0000fe17,
>>> +		0x2efb0000, 0x0000fd1a, 0x2cfb0000, 0x0000fd1c,
>>> +		0x28fc0000, 0x0000fd1f, 0x27fc0000, 0x0000fc21,
>>> +	},
>>> +	{	/* Bank 1 */
>>> +		0x2525fb00, 0x000000fb, 0x2723fb00, 0x000000fb,
>>> +		0x2921fb00, 0x000000fb, 0x2a1ffb00, 0x000000fc,
>>> +		0x2c1dfb00, 0x000000fc, 0x2e1bfb00, 0x000000fc,
>>> +		0x2f19fb00, 0x000000fd, 0x2f17fc00, 0x000000fe,
>>> +		0x3115fc00, 0x000000fe, 0x3213fc00, 0x000000ff,
>>> +		0x3411fc00, 0x0000ff00, 0x3310fd00, 0x0000ff01,
>>> +		0x340efd00, 0x0000ff02, 0x350cfd00, 0x0000ff03,
>>> +		0x350afd00, 0x0000ff05, 0x3509fe00, 0x0000fe06,
>>> +		0x3607fe00, 0x0000fe07, 0x3506fe00, 0x0000fe09,
>>> +		0x3505ff00, 0x0000fd0a, 0x3503ff00, 0x0000fd0c,
>>> +		0x3402ff00, 0x0000fd0e, 0x3301ff00, 0x0000fd10,
>>> +		0x3400ff00, 0x0000fc11, 0x32ff0000, 0x0000fc13,
>>> +		0x31fe0000, 0x0000fc15, 0x2ffe0000, 0x0000fc17,
>>> +		0x2ffd0000, 0x0000fb19, 0x2efc0000, 0x0000fb1b,
>>> +		0x2cfc0000, 0x0000fb1d, 0x2afc0000, 0x0000fb1f,
>>> +		0x29fb0000, 0x0000fb21, 0x27fb0000, 0x0000fb23,
>>> +	},
>>> +	{	/* Bank 2 */
>>> +		0x1f1f0100, 0x00000001, 0x211e0000, 0x00000001,
>>> +		0x211d0000, 0x00000002, 0x221c0000, 0x00000002,
>>> +		0x231bff00, 0x00000003, 0x241aff00, 0x0000ff04,
>>> +		0x2519ff00, 0x0000ff04, 0x2518ff00, 0x0000ff05,
>>> +		0x2617fe00, 0x0000ff06, 0x2616fe00, 0x0000ff07,
>>> +		0x2714fe00, 0x0000ff08, 0x2713fe00, 0x0000ff09,
>>> +		0x2712fe00, 0x0000ff0a, 0x2811fe00, 0x0000fe0b,
>>> +		0x2810fe00, 0x0000fe0c, 0x280ffe00, 0x0000fe0d,
>>> +		0x280efe00, 0x0000fe0e, 0x280dfe00, 0x0000fe0f,
>>> +		0x280cfe00, 0x0000fe10, 0x280bfe00, 0x0000fe11,
>>> +		0x270aff00, 0x0000fe12, 0x2709ff00, 0x0000fe13,
>>> +		0x2708ff00, 0x0000fe14, 0x2607ff00, 0x0000fe16,
>>> +		0x2606ff00, 0x0000fe17, 0x2505ff00, 0x0000ff18,
>>> +		0x2504ff00, 0x0000ff19, 0x2404ff00, 0x0000ff1a,
>>> +		0x23030000, 0x0000ff1b, 0x22020000, 0x0000001c,
>>> +		0x21020000, 0x0000001d, 0x21010000, 0x0000001e,
>>> +	},
>>> +	{	/* Bank 3 */
>>> +		0x1b1b06ff, 0x0000ff06, 0x1b1a06ff, 0x0000ff07,
>>> +		0x1c1a05ff, 0x0000ff07, 0x1c1905ff, 0x0000ff08,
>>> +		0x1c1904ff, 0x0000ff09, 0x1d1804ff, 0x0000ff09,
>>> +		0x1e1703ff, 0x0000ff0a, 0x1e1703ff, 0x0000ff0a,
>>> +		0x1e1603ff, 0x0000ff0b, 0x1f1502ff, 0x0000ff0c,
>>> +		0x1e150200, 0x0000ff0c, 0x1e140200, 0x0000ff0d,
>>> +		0x1e130100, 0x0000000e, 0x1e130100, 0x0000000e,
>>> +		0x1e120100, 0x0000000f, 0x1f110000, 0x00000010,
>>> +		0x20100000, 0x00000010, 0x1f100000, 0x00000011,
>>> +		0x1e0f0000, 0x00000112, 0x1e0e0000, 0x00000113,
>>> +		0x1e0e0000, 0x00000113, 0x1e0dff00, 0x00000214,
>>> +		0x1e0cff00, 0x00000215, 0x1f0cff00, 0x00ff0215,
>>> +		0x1e0bff00, 0x00ff0316, 0x1e0aff00, 0x00ff0317,
>>> +		0x1e0aff00, 0x00ff0317, 0x1d09ff00, 0x00ff0418,
>>> +		0x1c09ff00, 0x00ff0419, 0x1c08ff00, 0x00ff0519,
>>> +		0x1c07ff00, 0x00ff051a, 0x1b07ff00, 0x00ff061a,
>>> +	},
>>> +	{	/* Bank 4 */
>>> +		0x17170900, 0x00000009, 0x18160900, 0x00000009,
>>> +		0x17160800, 0x0000010a, 0x17160800, 0x0000010a,
>>> +		0x18150700, 0x0000010b, 0x18150700, 0x0000010b,
>>> +		0x17150700, 0x0000010c, 0x19140600, 0x0000010c,
>>> +		0x18140600, 0x0000010d, 0x19130500, 0x0000020d,
>>> +		0x18130500, 0x0000020e, 0x18130500, 0x0000020e,
>>> +		0x1a120400, 0x0000020e, 0x19120400, 0x0000020f,
>>> +		0x19110400, 0x0000030f, 0x18110400, 0x00000310,
>>> +		0x1a100300, 0x00000310, 0x18100300, 0x00000411,
>>> +		0x190f0300, 0x00000411, 0x190f0200, 0x00000412,
>>> +		0x1a0e0200, 0x00000412, 0x180e0200, 0x00000513,
>>> +		0x180e0200, 0x00000513, 0x190d0200, 0x00000513,
>>> +		0x180d0100, 0x00000614, 0x190c0100, 0x00000614,
>>> +		0x170c0100, 0x00000715, 0x180b0100, 0x00000715,
>>> +		0x180b0100, 0x00000715, 0x170a0100, 0x00000816,
>>> +		0x170a0100, 0x00000816, 0x18090000, 0x00000916,
>>> +	},
>>> +	{	/* Bank 5 */
>>> +		0x12120b03, 0x0000030b, 0x12110b03, 0x0000030c,
>>> +		0x11110b03, 0x0000040c, 0x11110b03, 0x0000040c,
>>> +		0x13110a02, 0x0000040c, 0x12110a02, 0x0000040d,
>>> +		0x11110a02, 0x0000050d, 0x11110a02, 0x0000050d,
>>> +		0x13110901, 0x0000050d, 0x13100901, 0x0000050e,
>>> +		0x12100901, 0x0000060e, 0x12100901, 0x0000060e,
>>> +		0x13100801, 0x0000060e, 0x12100801, 0x0000060f,
>>> +		0x12100800, 0x0000070f, 0x130f0800, 0x0000070f,
>>> +		0x140f0700, 0x0000070f, 0x130f0700, 0x0000080f,
>>> +		0x120f0700, 0x00000810, 0x120f0600, 0x00010810,
>>> +		0x130e0600, 0x00010810, 0x120e0600, 0x00010910,
>>> +		0x120e0600, 0x00010910, 0x130e0500, 0x00010910,
>>> +		0x130d0500, 0x00010911, 0x110d0500, 0x00020a11,
>>> +		0x110d0500, 0x00020a11, 0x120d0400, 0x00020a11,
>>> +		0x130c0400, 0x00020a11, 0x110c0400, 0x00030b11,
>>> +		0x110c0400, 0x00030b11, 0x120c0300, 0x00030b11,
>>> +	},
>>> +	{	/* Bank 6 */
>>> +		0x0b0c0a08, 0x0005080a, 0x0b0c0a08, 0x0005080a,
>>> +		0x0c0b0a08, 0x0005080a, 0x0c0b0a08, 0x0005080a,
>>> +		0x0d0b0a07, 0x0005080a, 0x0d0b0a07, 0x0005080a,
>>> +		0x0d0b0a07, 0x0005080a, 0x0c0b0a07, 0x0006080a,
>>> +		0x0b0b0a07, 0x0006080b, 0x0c0b0907, 0x0006080b,
>>> +		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
>>> +		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
>>> +		0x0b0b0907, 0x0006090b, 0x0c0b0906, 0x0006090b,
>>> +		0x0c0b0906, 0x0006090b, 0x0c0b0906, 0x0006090b,
>>> +		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
>>> +		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
>>> +		0x0b0b0906, 0x0007090b, 0x0c0b0806, 0x0007090b,
>>> +		0x0b0b0806, 0x00070a0b, 0x0c0a0806, 0x00070a0b,
>>> +		0x0d0a0805, 0x00070a0b, 0x0d0a0805, 0x00070a0b,
>>> +		0x0d0a0805, 0x00070a0b, 0x0c0a0805, 0x00080a0b,
>>> +		0x0c0a0805, 0x00080a0b, 0x0c0a0805, 0x00080a0b,
>>> +	},
>>> +	{	/* Bank 7 */
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
>>> +	}
>>> +};
>>> +
>>> +struct mali_c55_resizer_coef_bank {
>>> +	unsigned int bank;
>> This is always equal to the index of the entry in the
>> mali_c55_coefficient_banks array, you can drop it.
>>
>>> +	unsigned int top;
>>> +	unsigned int bottom;
>> The bottom value of bank N is always equal to the top value of bank N+1.
>> You can simplify this by storing a single value.
>>
>>> +};
>>> +
>>> +static const struct mali_c55_resizer_coef_bank mali_c55_coefficient_banks[] = {
>>> +	{
>>> +		.bank = 0,
>>> +		.top = 1000,
>>> +		.bottom = 770,
>>> +	},
>>> +	{
>>> +		.bank = 1,
>>> +		.top = 769,
>>> +		.bottom = 600,
>>> +	},
>>> +	{
>>> +		.bank = 2,
>>> +		.top = 599,
>>> +		.bottom = 460,
>>> +	},
>>> +	{
>>> +		.bank = 3,
>>> +		.top = 459,
>>> +		.bottom = 354,
>>> +	},
>>> +	{
>>> +		.bank = 4,
>>> +		.top = 353,
>>> +		.bottom = 273,
>>> +	},
>>> +	{
>>> +		.bank = 5,
>>> +		.top = 272,
>>> +		.bottom = 210,
>>> +	},
>>> +	{
>>> +		.bank = 6,
>>> +		.top = 209,
>>> +		.bottom = 162,
>>> +	},
>>> +	{
>>> +		.bank = 7,
>>> +		.top = 161,
>>> +		.bottom = 125,
>>> +	},
>>> +};
>>> +
>> A small comment would be nice, such as
>>
>> /* Select a bank of resizer coefficients, based on the scaling ratio. */
>>
>>> +static unsigned int mali_c55_calculate_bank_num(struct mali_c55 *mali_c55,
>> This function is related to the resizers. Add "rsz" somewhere in the
>> function name, and pass a resizer pointer.
>>
>>> +						unsigned int crop,
>>> +						unsigned int scale)
>> I think those are the input and output sizes to the scaler. Rename them
>> to make it clearer.
>>
>>> +{
>>> +	unsigned int tmp;
>> tmp is almost always a bad variable name. Please use a more descriptive
>> name, size as rsz_ratio.
>>
>>> +	unsigned int i;
>>> +
>>> +	tmp = (scale * 1000U) / crop;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(mali_c55_coefficient_banks); i++) {
>>> +		if (tmp >= mali_c55_coefficient_banks[i].bottom &&
>>> +		    tmp <= mali_c55_coefficient_banks[i].top)
>>> +			return mali_c55_coefficient_banks[i].bank;
>>> +	}
>>> +
>>> +	/*
>>> +	 * We shouldn't ever get here, in theory. As we have no good choices
>>> +	 * simply warn the user and use the first bank of coefficients.
>>> +	 */
>>> +	dev_warn(mali_c55->dev, "scaling factor outside defined bounds\n");
>>> +	return 0;
>>> +}
>> And everything else belongs to mali-c55-resizer.c. Drop this header
>> file.
>>
>>> +
>>> +#endif /* _MALI_C55_RESIZER_COEFS_H */
>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
>>> new file mode 100644
>>> index 000000000000..0a5a2969d3ce
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
>>> @@ -0,0 +1,779 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * ARM Mali-C55 ISP Driver - Image signal processor
>>> + *
>>> + * Copyright (C) 2024 Ideas on Board Oy
>>> + */
>>> +
>>> +#include <linux/math.h>
>>> +#include <linux/minmax.h>
>>> +
>>> +#include <media/media-entity.h>
>>> +#include <media/v4l2-subdev.h>
>>> +
>>> +#include "mali-c55-common.h"
>>> +#include "mali-c55-registers.h"
>>> +#include "mali-c55-resizer-coefs.h"
>>> +
>>> +/* Scaling factor in Q4.20 format. */
>>> +#define MALI_C55_RZR_SCALER_FACTOR	(1U << 20)
>>> +
>>> +static const u32 rzr_non_bypass_src_fmts[] = {
>>> +	MEDIA_BUS_FMT_RGB121212_1X36,
>>> +	MEDIA_BUS_FMT_YUV10_1X30
>>> +};
>>> +
>>> +static const char * const mali_c55_resizer_names[] = {
>>> +	[MALI_C55_RZR_FR] = "resizer fr",
>>> +	[MALI_C55_RZR_DS] = "resizer ds",
>>> +};
>>> +
>>> +static int mali_c55_rzr_program_crop(struct mali_c55_resizer *rzr,
>>> +				     struct v4l2_subdev_state *state)
>>> +{
>>> +	unsigned int reg_offset = rzr->cap_dev->reg_offset;
>>> +	struct mali_c55 *mali_c55 = rzr->mali_c55;
>>> +	struct v4l2_mbus_framefmt *fmt;
>>> +	struct v4l2_rect *crop;
> const
>
>>> +
>>> +	/* Verify if crop should be enabled. */
>>> +	fmt = v4l2_subdev_state_get_format(state, MALI_C55_RZR_SINK_PAD, 0);
>>> +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD, 0);
>>> +
>>> +	if (fmt->width == crop->width && fmt->height == crop->height)
>>> +		return MALI_C55_BYPASS_CROP;
>>> +
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_X_START(reg_offset),
>>> +		       crop->left);
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_Y_START(reg_offset),
>>> +		       crop->top);
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_X_SIZE(reg_offset),
>>> +		       crop->width);
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_Y_SIZE(reg_offset),
>>> +		       crop->height);
>>> +
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_EN(reg_offset),
>>> +		       MALI_C55_CROP_ENABLE);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_rzr_program_resizer(struct mali_c55_resizer *rzr,
>>> +					struct v4l2_subdev_state *state)
>>> +{
>>> +	unsigned int reg_offset = rzr->cap_dev->reg_offset;
>>> +	struct mali_c55 *mali_c55 = rzr->mali_c55;
>>> +	struct v4l2_rect *crop, *scale;
> const
>
> Once "[PATCH v4 0/3] media: v4l2-subdev: Support const-awareness in
> state accessors" gets merged, the state argument to this function can be
> made const too. Same for other functions, as applicable.
>
>>> +	unsigned int h_bank, v_bank;
>>> +	u64 h_scale, v_scale;
>>> +
>>> +	/* Verify if scaling should be enabled. */
>>> +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD, 0);
>>> +	scale = v4l2_subdev_state_get_compose(state, MALI_C55_RZR_SINK_PAD, 0);
>>> +
>>> +	if (crop->width == scale->width && crop->height == scale->height)
>>> +		return MALI_C55_BYPASS_SCALER;
>>> +
>>> +	/* Program the V/H scaling factor in Q4.20 format. */
>>> +	h_scale = crop->width * MALI_C55_RZR_SCALER_FACTOR;
>>> +	v_scale = crop->height * MALI_C55_RZR_SCALER_FACTOR;
>>> +
>>> +	do_div(h_scale, scale->width);
>>> +	do_div(v_scale, scale->height);
>>> +
>>> +	mali_c55_write(mali_c55,
>>> +		       MALI_C55_REG_SCALER_IN_WIDTH(reg_offset),
>>> +		       crop->width);
>>> +	mali_c55_write(mali_c55,
>>> +		       MALI_C55_REG_SCALER_IN_HEIGHT(reg_offset),
>>> +		       crop->height);
>>> +
>>> +	mali_c55_write(mali_c55,
>>> +		       MALI_C55_REG_SCALER_OUT_WIDTH(reg_offset),
>>> +		       scale->width);
>>> +	mali_c55_write(mali_c55,
>>> +		       MALI_C55_REG_SCALER_OUT_HEIGHT(reg_offset),
>>> +		       scale->height);
>>> +
>>> +	mali_c55_write(mali_c55,
>>> +		       MALI_C55_REG_SCALER_HFILT_TINC(reg_offset),
>>> +		       h_scale);
>>> +	mali_c55_write(mali_c55,
>>> +		       MALI_C55_REG_SCALER_VFILT_TINC(reg_offset),
>>> +		       v_scale);
>>> +
>>> +	h_bank = mali_c55_calculate_bank_num(mali_c55, crop->width,
>>> +					     scale->width);
>>> +	mali_c55_write(mali_c55,
>>> +		       MALI_C55_REG_SCALER_HFILT_COEF(reg_offset),
>>> +		       h_bank);
>>> +
>>> +	v_bank = mali_c55_calculate_bank_num(mali_c55, crop->height,
>>> +					     scale->height);
>>> +	mali_c55_write(mali_c55,
>>> +		       MALI_C55_REG_SCALER_VFILT_COEF(reg_offset),
>>> +		       v_bank);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void mali_c55_rzr_program(struct mali_c55_resizer *rzr,
>>> +				 struct v4l2_subdev_state *state)
>>> +{
>>> +	struct mali_c55 *mali_c55 = rzr->mali_c55;
>>> +	u32 bypass = 0;
>>> +
>>> +	/* Verify if cropping and scaling should be enabled. */
>>> +	bypass |= mali_c55_rzr_program_crop(rzr, state);
>>> +	bypass |= mali_c55_rzr_program_resizer(rzr, state);
>>> +
>>> +	mali_c55_update_bits(mali_c55, rzr->id == MALI_C55_RZR_FR ?
>>> +			     MALI_C55_REG_FR_BYPASS : MALI_C55_REG_DS_BYPASS,
>>> +			     MALI_C55_BYPASS_CROP | MALI_C55_BYPASS_SCALER,
>>> +			     bypass);
>>> +}
>>> +
>>> +/*
>>> + * Inspect the routing table to know which of the two (mutually exclusive)
>>> + * routes is enabled and return the sink pad id of the active route.
>>> + */
>>> +static unsigned int mali_c55_rzr_get_active_sink(struct v4l2_subdev_state *state)
>>> +{
>>> +	struct v4l2_subdev_krouting *routing = &state->routing;
>>> +	struct v4l2_subdev_route *route;
>>> +
>>> +	/* A single route is enabled at a time. */
>>> +	for_each_active_route(routing, route)
>>> +		return route->sink_pad;
>>> +
>>> +	return MALI_C55_RZR_SINK_PAD;
>>> +}
>>> +
>>> +static u32 mali_c55_rzr_shift_mbus_code(u32 mbus_code)
>>> +{
>>> +	u32 corrected_code = 0;
>>> +
>>> +	/*
>>> +	 * The ISP takes input in a 20-bit format, but can only output 16-bit
>>> +	 * RAW bayer data (with the 4 least significant bits from the input
>>> +	 * being lost). Return the 16-bit version of the 20-bit input formats.
>>> +	 */
>>> +	switch (mbus_code) {
>>> +	case MEDIA_BUS_FMT_SBGGR20_1X20:
>>> +		corrected_code = MEDIA_BUS_FMT_SBGGR16_1X16;
>>> +		break;
>>> +	case MEDIA_BUS_FMT_SGBRG20_1X20:
>>> +		corrected_code = MEDIA_BUS_FMT_SGBRG16_1X16;
>>> +		break;
>>> +	case MEDIA_BUS_FMT_SGRBG20_1X20:
>>> +		corrected_code = MEDIA_BUS_FMT_SGRBG16_1X16;
>>> +		break;
>>> +	case MEDIA_BUS_FMT_SRGGB20_1X20:
>>> +		corrected_code = MEDIA_BUS_FMT_SRGGB16_1X16;
>>> +		break;
> Would it make sense to add the shifted code to mali_c55_isp_fmt ?
>
>>> +	}
>>> +
>>> +	return corrected_code;
>>> +}
>>> +
>>> +static int __mali_c55_rzr_set_routing(struct v4l2_subdev *sd,
>>> +				      struct v4l2_subdev_state *state,
>>> +				      struct v4l2_subdev_krouting *routing)
> I think the last argument can be const.
>
>>> +{
>>> +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
>>> +						    sd);
> A to_mali_c55_resizer() static inline function would be useful. Same for
> other components, where applicable.
>
>>> +	unsigned int active_sink = UINT_MAX;
>>> +	struct v4l2_mbus_framefmt *src_fmt;
>>> +	struct v4l2_rect *crop, *compose;
>>> +	struct v4l2_subdev_route *route;
>>> +	unsigned int active_routes = 0;
>>> +	struct v4l2_mbus_framefmt *fmt;
>>> +	int ret;
>>> +
>>> +	ret = v4l2_subdev_routing_validate(sd, routing, 0);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Only a single route can be enabled at a time. */
>>> +	for_each_active_route(routing, route) {
>>> +		if (++active_routes > 1) {
>>> +			dev_err(rzr->mali_c55->dev,
>>> +				"Only one route can be active");
> No kernel log message with a level higher than dev_dbg() from
> user-controlled paths please, here and where applicable. This is to
> avoid giving applications an easy way to flood the kernel log.
>
>>> +			return -EINVAL;
>>> +		}
>>> +
>>> +		active_sink = route->sink_pad;
>>> +	}
>>> +	if (active_sink == UINT_MAX) {
>>> +		dev_err(rzr->mali_c55->dev, "One route has to be active");
>>> +		return -EINVAL;
>>> +	}
> The recommended handling of invalid routing is to adjust the routing
> table, not to return errors.
>
>>> +
>>> +	ret = v4l2_subdev_set_routing(sd, state, routing);
>>> +	if (ret) {
>>> +		dev_err(rzr->mali_c55->dev, "Failed to set routing\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	fmt = v4l2_subdev_state_get_format(state, active_sink, 0);
>>> +	crop = v4l2_subdev_state_get_crop(state, active_sink, 0);
>>> +	compose = v4l2_subdev_state_get_compose(state, active_sink, 0);
>>> +
>>> +	fmt->width = MALI_C55_DEFAULT_WIDTH;
>>> +	fmt->height = MALI_C55_DEFAULT_HEIGHT;
>>> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> There are other colorspace-related fields.
>
>>> +	fmt->field = V4L2_FIELD_NONE;
> I wonder if we should really update the sink pad format, or just
> propagate it. If we update it, I think it should be set to defaults on
> both sink pads, not just the active sink pad.
>
>>> +
>>> +	if (active_sink == MALI_C55_RZR_SINK_PAD) {
>>> +		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
>>> +
>>> +		crop->left = crop->top = 0;
> 		crop->left = 0;
> 		crop->top = 0;
>
>>> +		crop->width = MALI_C55_DEFAULT_WIDTH;
>>> +		crop->height = MALI_C55_DEFAULT_HEIGHT;
>>> +
>>> +		*compose = *crop;
>>> +	} else {
>>> +		fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
>>> +	}
>>> +
>>> +	/* Propagate the format to the source pad */
>>> +	src_fmt = v4l2_subdev_state_get_format(state, MALI_C55_RZR_SOURCE_PAD,
>>> +					       0);
>>> +	*src_fmt = *fmt;
>>> +
>>> +	/* In the event this is the bypass pad the mbus code needs correcting */
>>> +	if (active_sink == MALI_C55_RZR_SINK_BYPASS_PAD)
>>> +		src_fmt->code = mali_c55_rzr_shift_mbus_code(src_fmt->code);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_rzr_enum_mbus_code(struct v4l2_subdev *sd,
>>> +				       struct v4l2_subdev_state *state,
>>> +				       struct v4l2_subdev_mbus_code_enum *code)
>>> +{
>>> +	struct v4l2_mbus_framefmt *sink_fmt;
>>> +	const struct mali_c55_isp_fmt *fmt;
>>> +	unsigned int index = 0;
>>> +	u32 sink_pad;
>>> +
>>> +	switch (code->pad) {
>>> +	case MALI_C55_RZR_SINK_PAD:
>>> +		if (code->index)
>>> +			return -EINVAL;
>>> +
>>> +		code->code = MEDIA_BUS_FMT_RGB121212_1X36;
>>> +
>>> +		return 0;
>>> +	case MALI_C55_RZR_SOURCE_PAD:
>>> +		sink_pad = mali_c55_rzr_get_active_sink(state);
>>> +		sink_fmt = v4l2_subdev_state_get_format(state, sink_pad, 0);
>>> +
>>> +		/*
>>> +		 * If the active route is from the Bypass sink pad, then the
>>> +		 * source pad is a simple passthrough of the sink format,
>>> +		 * downshifted to 16-bits.
>>> +		 */
>>> +
>>> +		if (sink_pad == MALI_C55_RZR_SINK_BYPASS_PAD) {
>>> +			if (code->index)
>>> +				return -EINVAL;
>>> +
>>> +			code->code = mali_c55_rzr_shift_mbus_code(sink_fmt->code);
>>> +			if (!code->code)
>>> +				return -EINVAL;
>>> +
>>> +			return 0;
>>> +		}
>>> +
>>> +		/*
>>> +		 * If the active route is from the non-bypass sink then we can
>>> +		 * select either RGB or conversion to YUV.
>>> +		 */
>>> +
>>> +		if (code->index >= ARRAY_SIZE(rzr_non_bypass_src_fmts))
>>> +			return -EINVAL;
>>> +
>>> +		code->code = rzr_non_bypass_src_fmts[code->index];
>>> +
>>> +		return 0;
>>> +	case MALI_C55_RZR_SINK_BYPASS_PAD:
>>> +		for_each_mali_isp_fmt(fmt) {
>>> +			if (index++ == code->index) {
>>> +				code->code = fmt->code;
>>> +				return 0;
>>> +			}
>>> +		}
>>> +
>>> +		break;
>>> +	}
>>> +
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int mali_c55_rzr_enum_frame_size(struct v4l2_subdev *sd,
>>> +					struct v4l2_subdev_state *state,
>>> +					struct v4l2_subdev_frame_size_enum *fse)
>>> +{
>>> +	if (fse->index)
>>> +		return -EINVAL;
>>> +
>>> +	fse->max_width = MALI_C55_MAX_WIDTH;
>>> +	fse->max_height = MALI_C55_MAX_HEIGHT;
>>> +	fse->min_width = MALI_C55_MIN_WIDTH;
>>> +	fse->min_height = MALI_C55_MIN_HEIGHT;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_rzr_set_sink_fmt(struct v4l2_subdev *sd,
>>> +				     struct v4l2_subdev_state *state,
>>> +				     struct v4l2_subdev_format *format)
>>> +{
>>> +	struct v4l2_mbus_framefmt *fmt = &format->format;
>>> +	struct v4l2_rect *rect;
>>> +	unsigned int sink_pad;
>>> +
>>> +	/*
>>> +	 * Clamp to min/max and then reset crop and compose rectangles to the
>>> +	 * newly applied size.
>>> +	 */
>>> +	clamp_t(unsigned int, fmt->width,
>>> +		MALI_C55_MIN_WIDTH, MALI_C55_MAX_WIDTH);
>>> +	clamp_t(unsigned int, fmt->height,
>>> +		MALI_C55_MIN_HEIGHT, MALI_C55_MAX_HEIGHT);
> Please check comments for other components related to the colorspace
> fields, to decide how to handle them here.
>
>>> +
>>> +	sink_pad = mali_c55_rzr_get_active_sink(state);
>>> +	if (sink_pad == MALI_C55_RZR_SINK_PAD) {
> The selection here should depend on format->pad, not the active sink
> pad.
>
>>> +		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
>>> +
>>> +		rect = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD);
>>> +		rect->left = 0;
>>> +		rect->top = 0;
>>> +		rect->width = fmt->width;
>>> +		rect->height = fmt->height;
>>> +
>>> +		rect = v4l2_subdev_state_get_compose(state,
>>> +						     MALI_C55_RZR_SINK_PAD);
>>> +		rect->left = 0;
>>> +		rect->top = 0;
>>> +		rect->width = fmt->width;
>>> +		rect->height = fmt->height;
>>> +	} else {
>>> +		/*
>>> +		 * Make sure the media bus code is one of the supported
>>> +		 * ISP input media bus codes.
>>> +		 */
>>> +		if (!mali_c55_isp_is_format_supported(fmt->code))
>>> +			fmt->code = MALI_C55_DEFAULT_MEDIA_BUS_FMT;
>>> +	}
>>> +
>>> +	*v4l2_subdev_state_get_format(state, sink_pad, 0) = *fmt;
>>> +	*v4l2_subdev_state_get_format(state, MALI_C55_RZR_SOURCE_PAD, 0) = *fmt;
> Propagation to the source pad, however, should depend on the active
> route. If format->pad is routed to the source pad, you should propagate,
> otherwise, you shouldn't.
>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_rzr_set_source_fmt(struct v4l2_subdev *sd,
>>> +				       struct v4l2_subdev_state *state,
>>> +				       struct v4l2_subdev_format *format)
>>> +{
>>> +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
>>> +						    sd);
>>> +	struct v4l2_mbus_framefmt *fmt = &format->format;
>>> +	struct v4l2_mbus_framefmt *sink_fmt;
>>> +	struct v4l2_rect *crop, *compose;
>>> +	unsigned int sink_pad;
>>> +	unsigned int i;
>>> +
>>> +	sink_pad = mali_c55_rzr_get_active_sink(state);
>>> +	sink_fmt = v4l2_subdev_state_get_format(state, sink_pad, 0);
>>> +	crop = v4l2_subdev_state_get_crop(state, sink_pad, 0);
>>> +	compose = v4l2_subdev_state_get_compose(state, sink_pad, 0);
>>> +
>>> +	/* FR Bypass pipe. */
>>> +
>>> +	if (sink_pad == MALI_C55_RZR_SINK_BYPASS_PAD) {
>>> +		/*
>>> +		 * Format on the source pad is the same as the one on the
>>> +		 * sink pad, downshifted to 16-bits.
>>> +		 */
>>> +		fmt->code = mali_c55_rzr_shift_mbus_code(sink_fmt->code);
>>> +		if (!fmt->code)
>>> +			return -EINVAL;
>>> +
>>> +		/* RAW bypass disables scaling and cropping. */
>>> +		crop->top = compose->top = 0;
>>> +		crop->left = compose->left = 0;
>>> +		fmt->width = crop->width = compose->width = sink_fmt->width;
>>> +		fmt->height = crop->height = compose->height = sink_fmt->height;
> I don't think this is right. This function sets the format on the source
> pad. Subdevs should propagate formats from the sink to the source, not
> the other way around.
>
> The only parameter that can be modified on the source pad (as far as I
> understand) is the media bus code. In the bypass path, I understand it's
> fixed, while in the other path, you can select between RGB and YUV. I
> think the following code is what you need to implement this function.
>
> static int mali_c55_rzr_set_source_fmt(struct v4l2_subdev *sd,
> 				       struct v4l2_subdev_state *state,
> 				       struct v4l2_subdev_format *format)
> {
> 	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
> 						    sd);
> 	struct v4l2_mbus_framefmt *fmt;
>
> 	fmt = v4l2_subdev_state_get_format(state, format->pad);
>
> 	/* In the non-bypass path the output format can be selected. */
> 	if (mali_c55_rzr_get_active_sink(state) == MALI_C55_RZR_SINK_PAD) {
> 		unsigned int i;
>
> 		fmt->code = format->format.code;
>
> 		for (i = 0; i < ARRAY_SIZE(rzr_non_bypass_src_fmts); i++) {
> 			if (fmt->code == rzr_non_bypass_src_fmts[i])
> 				break;
> 		}
>
> 		if (i == ARRAY_SIZE(rzr_non_bypass_src_fmts))
> 			fmt->code = rzr_non_bypass_src_fmts[0];
> 	}
>
> 	format->format = *fmt;
>
> 	return 0;
> }
>
>>> +
>>> +		*v4l2_subdev_state_get_format(state,
>>> +					      MALI_C55_RZR_SOURCE_PAD) = *fmt;
>>> +
>>> +		return 0;
>>> +	}
>>> +
>>> +	/* Regular processing pipe. */
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(rzr_non_bypass_src_fmts); i++) {
>>> +		if (fmt->code == rzr_non_bypass_src_fmts[i])
>>> +			break;
>>> +	}
>>> +
>>> +	if (i == ARRAY_SIZE(rzr_non_bypass_src_fmts)) {
>>> +		dev_dbg(rzr->mali_c55->dev,
>>> +			"Unsupported mbus code 0x%x: using default\n",
>>> +			fmt->code);
> I think you can drop this message.
>
>>> +		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
>>> +	}
>>> +
>>> +	/*
>>> +	 * The source pad format size comes directly from the sink pad
>>> +	 * compose rectangle.
>>> +	 */
>>> +	fmt->width = compose->width;
>>> +	fmt->height = compose->height;
>>> +
>>> +	*v4l2_subdev_state_get_format(state, MALI_C55_RZR_SOURCE_PAD) = *fmt;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_rzr_set_fmt(struct v4l2_subdev *sd,
>>> +				struct v4l2_subdev_state *state,
>>> +				struct v4l2_subdev_format *format)
>>> +{
>>> +	/*
>>> +	 * On sink pads fmt is either fixed for the 'regular' processing
>>> +	 * pad or a RAW format or 20-bit wide RGB/YUV format for the FR bypass
>>> +	 * pad.
>>> +	 *
>>> +	 * On source pad sizes are the result of crop+compose on the sink
>>> +	 * pad sizes, while the format depends on the active route.
>>> +	 */
>>> +
>>> +	if (format->pad != MALI_C55_RZR_SOURCE_PAD)
>>> +		return mali_c55_rzr_set_sink_fmt(sd, state, format);
>>> +
>>> +	return mali_c55_rzr_set_source_fmt(sd, state, format);
> Nitpicking,
>
> 	if (format->pad == MALI_C55_RZR_SOURCE_PAD)
> 		return mali_c55_rzr_set_source_fmt(sd, state, format);
>
> 	return mali_c55_rzr_set_sink_fmt(sd, state, format);
>
> to match SOURCE_PAD and source_fmt.
>
>>> +}
>>> +
>>> +static int mali_c55_rzr_get_selection(struct v4l2_subdev *sd,
>>> +				      struct v4l2_subdev_state *state,
>>> +				      struct v4l2_subdev_selection *sel)
>>> +{
>>> +	if (sel->pad != MALI_C55_RZR_SINK_PAD)
>>> +		return -EINVAL;
>>> +
>>> +	if (sel->target != V4L2_SEL_TGT_CROP &&
>>> +	    sel->target != V4L2_SEL_TGT_COMPOSE)
>>> +		return -EINVAL;
>>> +
>>> +	sel->r = sel->target == V4L2_SEL_TGT_CROP
>>> +	       ? *v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD)
>>> +	       : *v4l2_subdev_state_get_compose(state, MALI_C55_RZR_SINK_PAD);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_rzr_set_selection(struct v4l2_subdev *sd,
>>> +				      struct v4l2_subdev_state *state,
>>> +				      struct v4l2_subdev_selection *sel)
>>> +{
>>> +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
>>> +						    sd);
>>> +	struct v4l2_mbus_framefmt *source_fmt;
>>> +	struct v4l2_mbus_framefmt *sink_fmt;
>>> +	struct v4l2_rect *crop, *compose;
>>> +
>>> +	if (sel->pad != MALI_C55_RZR_SINK_PAD)
>>> +		return -EINVAL;
>>> +
>>> +	if (sel->target != V4L2_SEL_TGT_CROP &&
>>> +	    sel->target != V4L2_SEL_TGT_COMPOSE)
>>> +		return -EINVAL;
>>> +
>>> +	source_fmt = v4l2_subdev_state_get_format(state,
>>> +						  MALI_C55_RZR_SOURCE_PAD);
>>> +	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C55_RZR_SINK_PAD);
>>> +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD);
>>> +	compose = v4l2_subdev_state_get_compose(state, MALI_C55_RZR_SINK_PAD);
>>> +
>>> +	/* RAW bypass disables crop/scaling. */
>>> +	if (mali_c55_format_is_raw(source_fmt->code)) {
>>> +		crop->top = compose->top = 0;
>>> +		crop->left = compose->left = 0;
>>> +		crop->width = compose->width = sink_fmt->width;
>>> +		crop->height = compose->height = sink_fmt->height;
>>> +
>>> +		sel->r = sel->target == V4L2_SEL_TGT_CROP ? *crop : *compose;
>>> +
>>> +		return 0;
>>> +	}
>>> +
>>> +	/* During streaming, it is allowed to only change the crop rectangle. */
>>> +	if (rzr->streaming && sel->target != V4L2_SEL_TGT_CROP)
>>> +		return -EINVAL;
>>> +
>>> +	 /*
>>> +	  * Update the desired target and then clamp the crop rectangle to the
>>> +	  * sink format sizes and the compose size to the crop sizes.
>>> +	  */
>>> +	if (sel->target == V4L2_SEL_TGT_CROP)
>>> +		*crop = sel->r;
>>> +	else
>>> +		*compose = sel->r;
>>> +
>>> +	clamp_t(unsigned int, crop->left, 0,  sink_fmt->width);
>>> +	clamp_t(unsigned int, crop->top, 0,  sink_fmt->height);
>>> +	clamp_t(unsigned int, crop->width, MALI_C55_MIN_WIDTH,
>>> +		sink_fmt->width - crop->left);
>>> +	clamp_t(unsigned int, crop->height, MALI_C55_MIN_HEIGHT,
>>> +		sink_fmt->height - crop->top);
>>> +
>>> +	if (rzr->streaming) {
>>> +		/*
>>> +		 * Apply at runtime a crop rectangle on the resizer's sink only
>>> +		 * if it doesn't require re-programming the scaler output sizes
>>> +		 * as it would require changing the output buffer sizes as well.
>>> +		 */
>>> +		if (sel->r.width < compose->width ||
>>> +		    sel->r.height < compose->height)
>>> +			return -EINVAL;
>>> +
>>> +		*crop = sel->r;
>>> +		mali_c55_rzr_program(rzr, state);
>>> +
>>> +		return 0;
>>> +	}
>>> +
>>> +	compose->left = 0;
>>> +	compose->top = 0;
>>> +	clamp_t(unsigned int, compose->left, 0,  sink_fmt->width);
>>> +	clamp_t(unsigned int, compose->top, 0,  sink_fmt->height);
>>> +	clamp_t(unsigned int, compose->width, crop->width / 8, crop->width);
>>> +	clamp_t(unsigned int, compose->height, crop->height / 8, crop->height);
>>> +
>>> +	sel->r = sel->target == V4L2_SEL_TGT_CROP ? *crop : *compose;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_rzr_set_routing(struct v4l2_subdev *sd,
>>> +				    struct v4l2_subdev_state *state,
>>> +				    enum v4l2_subdev_format_whence which,
>>> +				    struct v4l2_subdev_krouting *routing)
>>> +{
>>> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
>>> +	    media_entity_is_streaming(&sd->entity))
>>> +		return -EBUSY;
>>> +
>>> +	return __mali_c55_rzr_set_routing(sd, state, routing);
>>> +}
>>> +
>>> +static const struct v4l2_subdev_pad_ops mali_c55_resizer_pad_ops = {
>>> +	.enum_mbus_code		= mali_c55_rzr_enum_mbus_code,
>>> +	.enum_frame_size	= mali_c55_rzr_enum_frame_size,
>>> +	.get_fmt		= v4l2_subdev_get_fmt,
>>> +	.set_fmt		= mali_c55_rzr_set_fmt,
>>> +	.get_selection		= mali_c55_rzr_get_selection,
>>> +	.set_selection		= mali_c55_rzr_set_selection,
>>> +	.set_routing		= mali_c55_rzr_set_routing,
>>> +};
>>> +
>>> +void mali_c55_rzr_start_stream(struct mali_c55_resizer *rzr)
> Could this be handled through the .enable_streams() and
> .disable_streams() operations ? They ensure that the stream state stored
> internal is correct. That may not matter much today, but I think it will
> become increasingly important in the future for the V4L2 core.
>
>>> +{
>>> +	struct mali_c55 *mali_c55 = rzr->mali_c55;
>>> +	struct v4l2_subdev *sd = &rzr->sd;
>>> +	struct v4l2_subdev_state *state;
>>> +	unsigned int sink_pad;
>>> +
>>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>>> +
>>> +	sink_pad = mali_c55_rzr_get_active_sink(state);
>>> +	if (sink_pad == MALI_C55_RZR_SINK_BYPASS_PAD) {
>>> +		/* Bypass FR pipe processing if the bypass route is active. */
>>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
>>> +				     MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK,
>>> +				     MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS);
>>> +		goto unlock_state;
>>> +	}
>>> +
>>> +	/* Disable bypass and use regular processing. */
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
>>> +			     MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK, 0);
>>> +	mali_c55_rzr_program(rzr, state);
>>> +
>>> +unlock_state:
>>> +	rzr->streaming = true;
> And hopefully you'll be able to replace this with
> v4l2_subdev_is_streaming(), introduced in "[PATCH v6 00/11] media:
> subdev: Improve stream enable/disable machinery" (Sakari has sent a pull
> request for v6.11 yesterday).
>
>>> +	v4l2_subdev_unlock_state(state);
>>> +}
>>> +
>>> +void mali_c55_rzr_stop_stream(struct mali_c55_resizer *rzr)
>>> +{
>>> +	struct v4l2_subdev *sd = &rzr->sd;
>>> +	struct v4l2_subdev_state *state;
>>> +
>>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>>> +	rzr->streaming = false;
>>> +	v4l2_subdev_unlock_state(state);
>>> +}
>>> +
>>> +static const struct v4l2_subdev_ops mali_c55_resizer_ops = {
>>> +	.pad	= &mali_c55_resizer_pad_ops,
>>> +};
>>> +
>>> +static int mali_c55_rzr_init_state(struct v4l2_subdev *sd,
>>> +				   struct v4l2_subdev_state *state)
>>> +{
>>> +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
>>> +						    sd);
>>> +	struct v4l2_subdev_krouting routing = { };
>>> +	struct v4l2_subdev_route *routes;
>>> +	unsigned int i;
>>> +	int ret;
>>> +
>>> +	routes = kcalloc(rzr->num_routes, sizeof(*routes), GFP_KERNEL);
>>> +	if (!routes)
>>> +		return -ENOMEM;
>>> +
>>> +	for (i = 0; i < rzr->num_routes; ++i) {
>>> +		struct v4l2_subdev_route *route = &routes[i];
>>> +
>>> +		route->sink_pad = i
>>> +				? MALI_C55_RZR_SINK_BYPASS_PAD
>>> +				: MALI_C55_RZR_SINK_PAD;
>>> +		route->source_pad = MALI_C55_RZR_SOURCE_PAD;
>>> +		if (route->sink_pad != MALI_C55_RZR_SINK_BYPASS_PAD)
>>> +			route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>>> +	}
>>> +
>>> +	routing.num_routes = rzr->num_routes;
>>> +	routing.routes = routes;
>>> +
>>> +	ret = __mali_c55_rzr_set_routing(sd, state, &routing);
>>> +	kfree(routes);
>>> +
>>> +	return ret;
> I think this could be simplified.
>
> 	struct v4l2_subdev_route routes[2] = {
> 		{
> 			.sink_pad = MALI_C55_RZR_SINK_PAD,
> 			.source_pad = MALI_C55_RZR_SOURCE_PAD,
> 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> 		}, {
> 			.sink_pad = MALI_C55_RZR_SINK_BYPASS_PAD,
> 			.source_pad = MALI_C55_RZR_SOURCE_PAD,
> 		},
> 	};
> 	struct v4l2_subdev_krouting routing = {
> 		.num_routes = rzr->num_routes,
> 		.routes = routes,
> 	};
>
> 	return __mali_c55_rzr_set_routing(sd, state, &routing);
>
>>> +}
>>> +
>>> +static const struct v4l2_subdev_internal_ops mali_c55_resizer_internal_ops = {
>>> +	.init_state = mali_c55_rzr_init_state,
>>> +};
>>> +
>>> +static void mali_c55_resizer_program_coefficients(struct mali_c55 *mali_c55,
>>> +						  unsigned int index)
>>> +{
>>> +	const unsigned int scaler_filt_coefmem_addrs[][2] = {
>>> +		[MALI_C55_RZR_FR] = {
>>> +			0x034A8, /* hfilt */
>>> +			0x044A8  /* vfilt */
>> Lowercase hex constants.
> And addresses belong to the mali-c55-registers.h file.
>
>>> +		},
>>> +		[MALI_C55_RZR_DS] = {
>>> +			0x014A8, /* hfilt */
>>> +			0x024A8  /* vfilt */
>>> +		},
>>> +	};
>>> +	unsigned int haddr = scaler_filt_coefmem_addrs[index][0];
>>> +	unsigned int vaddr = scaler_filt_coefmem_addrs[index][1];
>>> +	unsigned int i, j;
>>> +
>>> +	for (i = 0; i < MALI_C55_RESIZER_COEFS_NUM_BANKS; i++) {
>>> +		for (j = 0; j < MALI_C55_RESIZER_COEFS_NUM_ENTRIES; j++) {
>>> +			mali_c55_write(mali_c55, haddr,
>>> +				mali_c55_scaler_h_filter_coefficients[i][j]);
>>> +			mali_c55_write(mali_c55, vaddr,
>>> +				mali_c55_scaler_v_filter_coefficients[i][j]);
>>> +
>>> +			haddr += sizeof(u32);
>>> +			vaddr += sizeof(u32);
>>> +		}
>>> +	}
> How about memcpy_toio() ? I suppose this function isn't
> performance sensitive, so maybe usage of mali_c55_write() is better from
> a consistency point of view.
>
>>> +}
>>> +
>>> +int mali_c55_register_resizers(struct mali_c55 *mali_c55)
>>> +{
>>> +	unsigned int i;
>>> +	int ret;
>>> +
>>> +	for (i = 0; i < MALI_C55_NUM_RZRS; ++i) {
> Moving the inner content to a separate mali_c55_register_resizer()
> function would increase readability I think, and remove usage of gotos.
> I would probably do the same for unregistration too, for consistency.
>
>>> +		struct mali_c55_resizer *rzr = &mali_c55->resizers[i];
>>> +		struct v4l2_subdev *sd = &rzr->sd;
>>> +		unsigned int num_pads = MALI_C55_RZR_NUM_PADS;
>>> +
>>> +		rzr->id = i;
>>> +		rzr->streaming = false;
>>> +
>>> +		if (rzr->id == MALI_C55_RZR_FR)
>>> +			rzr->cap_dev = &mali_c55->cap_devs[MALI_C55_CAP_DEV_FR];
>>> +		else
>>> +			rzr->cap_dev = &mali_c55->cap_devs[MALI_C55_CAP_DEV_DS];
>>> +
>>> +		mali_c55_resizer_program_coefficients(mali_c55, i);
> Should this be done at stream start, given that power may be cut off
> between streaming sessions ?
>
>>> +
>>> +		v4l2_subdev_init(sd, &mali_c55_resizer_ops);
>>> +		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE
>>> +			     | V4L2_SUBDEV_FL_STREAMS;
>>> +		sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
>>> +		sd->internal_ops = &mali_c55_resizer_internal_ops;
>>> +		snprintf(sd->name, ARRAY_SIZE(sd->name), "%s %s",
> 		snprintf(sd->name, ARRAY_SIZE(sd->name), "%s resizer %s",
>
> and drop the "resizer " prefix from mali_c55_resizer_names. You can also
> make mali_c55_resizer_names a local static const variable.
>
>>> +			 MALI_C55_DRIVER_NAME, mali_c55_resizer_names[i]);
>>> +
>>> +		rzr->pads[MALI_C55_RZR_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
>>> +		rzr->pads[MALI_C55_RZR_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
>>> +
>>> +		/* Only the FR pipe has a bypass pad. */
>>> +		if (rzr->id == MALI_C55_RZR_FR) {
>>> +			rzr->pads[MALI_C55_RZR_SINK_BYPASS_PAD].flags =
>>> +							MEDIA_PAD_FL_SINK;
>>> +			rzr->num_routes = 2;
>>> +		} else {
>>> +			num_pads -= 1;
>>> +			rzr->num_routes = 1;
>>> +		}
>>> +
>>> +		ret = media_entity_pads_init(&sd->entity, num_pads, rzr->pads);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		ret = v4l2_subdev_init_finalize(sd);
>>> +		if (ret)
>>> +			goto err_cleanup;
>>> +
>>> +		ret = v4l2_device_register_subdev(&mali_c55->v4l2_dev, sd);
>>> +		if (ret)
>>> +			goto err_cleanup;
>>> +
>>> +		rzr->mali_c55 = mali_c55;
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +err_cleanup:
>>> +	for (; i >= 0; --i) {
>>> +		struct mali_c55_resizer *rzr = &mali_c55->resizers[i];
>>> +		struct v4l2_subdev *sd = &rzr->sd;
>>> +
>>> +		v4l2_subdev_cleanup(sd);
>>> +		media_entity_cleanup(&sd->entity);
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +void mali_c55_unregister_resizers(struct mali_c55 *mali_c55)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < MALI_C55_NUM_RZRS; i++) {
>>> +		struct mali_c55_resizer *resizer = &mali_c55->resizers[i];
>>> +
>>> +		if (!resizer->mali_c55)
>>> +			continue;
>>> +
>>> +		v4l2_device_unregister_subdev(&resizer->sd);
>>> +		v4l2_subdev_cleanup(&resizer->sd);
>>> +		media_entity_cleanup(&resizer->sd.entity);
>>> +	}
>>> +}
>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
>>> new file mode 100644
>>> index 000000000000..c7e699741c6d
>>> --- /dev/null
>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
>>> @@ -0,0 +1,402 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * ARM Mali-C55 ISP Driver - Test pattern generator
>>> + *
>>> + * Copyright (C) 2024 Ideas on Board Oy
>>> + */
>>> +
>>> +#include <linux/minmax.h>
>>> +#include <linux/string.h>
>>> +
>>> +#include <media/media-entity.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-subdev.h>
>>> +
>>> +#include "mali-c55-common.h"
>>> +#include "mali-c55-registers.h"
>>> +
>>> +#define MALI_C55_TPG_SRC_PAD		0
>>> +#define MALI_C55_TPG_FIXED_HBLANK	0x20
>>> +#define MALI_C55_TPG_MAX_VBLANK		0xFFFF
>> Lowercase hex constants.
>>
>>> +#define MALI_C55_TPG_PIXEL_RATE		100000000
>> This should be exposed to applications using the V4L2_CID_PIXEL_RATE
>> control (read-only).
>>
>>> +
>>> +static const char * const mali_c55_tpg_test_pattern_menu[] = {
>>> +	"Flat field",
>>> +	"Horizontal gradient",
>>> +	"Vertical gradient",
>>> +	"Vertical bars",
>>> +	"Arbitrary rectangle",
>>> +	"White frame on black field"
>>> +};
>>> +
>>> +static const u32 mali_c55_tpg_mbus_codes[] = {
>>> +	MEDIA_BUS_FMT_SRGGB20_1X20,
>>> +	MEDIA_BUS_FMT_RGB202020_1X60,
>>> +};
>>> +
>>> +static void __mali_c55_tpg_calc_vblank(struct v4l2_mbus_framefmt *format,
>>> +				       int *def_vblank, int *min_vblank)
>> unsigned int ?
>>
>>> +{
>>> +	unsigned int hts;
>>> +	int tgt_fps;
>>> +	int vblank;
>>> +
>>> +	hts = format->width + MALI_C55_TPG_FIXED_HBLANK;
>>> +
>>> +	/*
>>> +	 * The ISP has minimum vertical blanking requirements that must be
>>> +	 * adhered to by the TPG. The minimum is a function of the Iridix blocks
>>> +	 * clocking requirements and the width of the image and horizontal
>>> +	 * blanking, but if we assume the worst case iVariance and sVariance
>>> +	 * values then it boils down to the below.
>>> +	 */
>>> +	*min_vblank = 15 + (120500 / hts);
>> I wonder if this should round up.
>>
>>> +
>>> +	/*
>>> +	 * We need to set a sensible default vblank for whatever format height
>>> +	 * we happen to be given from set_fmt(). This function just targets
>>> +	 * an even multiple of 15fps. If we can't get 15fps, let's target 5fps.
>>> +	 * If we can't get 5fps we'll take whatever the minimum vblank gives us.
>>> +	 */
>>> +	tgt_fps = MALI_C55_TPG_PIXEL_RATE / hts / (format->height + *min_vblank);
>>> +
>>> +	if (tgt_fps < 5)
>>> +		vblank = *min_vblank;
>>> +	else
>>> +		vblank = MALI_C55_TPG_PIXEL_RATE / hts
>>> +		       / max(rounddown(tgt_fps, 15), 5);
>>> +
>>> +	*def_vblank = ALIGN_DOWN(vblank, 2) - format->height;
>> "vblank = vblank - height" doesn't seem right. The "else" branch stores
>> a vts in vblank, which doesn't seem right either. Maybe you meant
>> something like
>>
>> 	if (tgt_fps < 5)
>> 		def_vts = *min_vblank + format->height;
>> 	else
>> 		def_vts = MALI_C55_TPG_PIXEL_RATE / hts
>> 			/ max(rounddown(tgt_fps, 15), 5);
>>
>> 	*def_vblank = ALIGN_DOWN(def_vts, 2) - format->height;
>>
>>> +}
>>> +
>>> +static int mali_c55_tpg_s_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +	struct mali_c55_tpg *tpg = container_of(ctrl->handler,
>>> +						struct mali_c55_tpg,
>>> +						ctrls.handler);
>>> +	struct mali_c55 *mali_c55 = container_of(tpg, struct mali_c55, tpg);
>>> +
>> Should you return here if the pipeline isn't streaming ?
>>
>>> +	switch (ctrl->id) {
>>> +	case V4L2_CID_TEST_PATTERN:
>>> +		mali_c55_write(mali_c55, MALI_C55_REG_TEST_GEN_CH0_PATTERN_TYPE,
>>> +			       ctrl->val);
>>> +		break;
>>> +	case V4L2_CID_VBLANK:
>>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_BLANKING,
>>> +				     MALI_C55_REG_VBLANK_MASK, ctrl->val);
>>> +		break;
>>> +	default:
>>> +		dev_err(mali_c55->dev, "invalid V4L2 control ID\n");
>>> +		return -EINVAL;
>> Can this happen ?
>>
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct v4l2_ctrl_ops mali_c55_tpg_ctrl_ops = {
>>> +	.s_ctrl = &mali_c55_tpg_s_ctrl,
>>> +};
>>> +
>>> +static void mali_c55_tpg_configure(struct mali_c55 *mali_c55,
>>> +				   struct v4l2_subdev *sd)
>>> +{
>>> +	struct v4l2_subdev_state *state;
>>> +	struct v4l2_mbus_framefmt *fmt;
>>> +
>>> +	/*
>>> +	 * hblank needs setting, but is a read-only control and thus won't be
>>> +	 * called during __v4l2_ctrl_handler_setup(). Do it here instead.
>>> +	 */
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_BLANKING,
>>> +			     MALI_C55_REG_HBLANK_MASK,
>>> +			     MALI_C55_TPG_FIXED_HBLANK);
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_GEN_VIDEO,
>>> +			     MALI_C55_REG_GEN_VIDEO_MULTI_MASK, 0x01);
>>> +
>>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>>> +	fmt = v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD);
>>> +
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_TPG_CH0,
>>> +			     MALI_C55_TEST_PATTERN_RGB_MASK,
>>> +			     fmt->code == MEDIA_BUS_FMT_RGB202020_1X60 ?
>>> +					  0x01 : 0x0);
>>> +
>>> +	v4l2_subdev_unlock_state(state);
>>> +}
>>> +
>>> +static int mali_c55_tpg_s_stream(struct v4l2_subdev *sd, int enable)
>>> +{
>>> +	struct mali_c55_tpg *tpg = container_of(sd, struct mali_c55_tpg, sd);
>>> +	struct mali_c55 *mali_c55 = container_of(tpg, struct mali_c55, tpg);
>>> +
>>> +	if (!enable) {
>>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_TPG_CH0,
>>> +				MALI_C55_TEST_PATTERN_ON_OFF, 0x00);
>>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_GEN_VIDEO,
>>> +				MALI_C55_REG_GEN_VIDEO_ON_MASK, 0x00);
>>> +		return 0;
>>> +	}
>>> +
>>> +	/*
>>> +	 * One might reasonably expect the framesize to be set here
>>> +	 * given it's configurable in .set_fmt(), but it's done in the
>>> +	 * ISP subdevice's stream on func instead, as the same register
>> s/func/function/
>>
>>> +	 * is also used to indicate the size of the data coming from the
>>> +	 * sensor.
>>> +	 */
>>> +	mali_c55_tpg_configure(mali_c55, sd);
>> 	mali_c55_tpg_configure(tpg);
>>
>>> +	__v4l2_ctrl_handler_setup(sd->ctrl_handler);
>>> +
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_TPG_CH0,
>>> +			     MALI_C55_TEST_PATTERN_ON_OFF,
>>> +			     MALI_C55_TEST_PATTERN_ON_OFF);
>>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_GEN_VIDEO,
>>> +			     MALI_C55_REG_GEN_VIDEO_ON_MASK,
>>> +			     MALI_C55_REG_GEN_VIDEO_ON_MASK);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct v4l2_subdev_video_ops mali_c55_tpg_video_ops = {
>>> +	.s_stream = &mali_c55_tpg_s_stream,
>> Can we use .enable_streams() and .disable_streams() ?
>>
>>> +};
>>> +
>>> +static int mali_c55_tpg_enum_mbus_code(struct v4l2_subdev *sd,
>>> +				       struct v4l2_subdev_state *state,
>>> +				       struct v4l2_subdev_mbus_code_enum *code)
>>> +{
>>> +	if (code->index >= ARRAY_SIZE(mali_c55_tpg_mbus_codes))
>>> +		return -EINVAL;
>>> +
>>> +	code->code = mali_c55_tpg_mbus_codes[code->index];
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_tpg_enum_frame_size(struct v4l2_subdev *sd,
>>> +					struct v4l2_subdev_state *state,
>>> +					struct v4l2_subdev_frame_size_enum *fse)
>>> +{
>> You sohuld verify here that fse->code is a supported value and return
>> -EINVAL otherwise.
>>
>>> +	if (fse->index > 0 || fse->pad > sd->entity.num_pads)
>> Drop the pad check, it's done in the subdev core already.
>>
>>> +		return -EINVAL;
>>> +
>>> +	fse->min_width = MALI_C55_MIN_WIDTH;
>>> +	fse->max_width = MALI_C55_MAX_WIDTH;
>>> +	fse->min_height = MALI_C55_MIN_HEIGHT;
>>> +	fse->max_height = MALI_C55_MAX_HEIGHT;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mali_c55_tpg_set_fmt(struct v4l2_subdev *sd,
>>> +				struct v4l2_subdev_state *state,
>>> +				struct v4l2_subdev_format *format)
>>> +{
>>> +	struct mali_c55_tpg *tpg = container_of(sd, struct mali_c55_tpg, sd);
>>> +	struct v4l2_mbus_framefmt *fmt = &format->format;
>>> +	int vblank_def, vblank_min;
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(mali_c55_tpg_mbus_codes); i++) {
>>> +		if (fmt->code == mali_c55_tpg_mbus_codes[i])
>>> +			break;
>>> +	}
>>> +
>>> +	if (i == ARRAY_SIZE(mali_c55_tpg_mbus_codes))
>>> +		fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
>>> +
>>> +	/*
>>> +	 * The TPG says that the test frame timing generation logic expects a
>>> +	 * minimum framesize of 4x4 pixels, but given the rest of the ISP can't
>>> +	 * handle anything smaller than 128x128 it seems pointless to allow a
>>> +	 * smaller frame.
>>> +	 */
>>> +	clamp_t(unsigned int, fmt->width, MALI_C55_MIN_WIDTH,
>>> +		MALI_C55_MAX_WIDTH);
>>> +	clamp_t(unsigned int, fmt->height, MALI_C55_MIN_HEIGHT,
>>> +		MALI_C55_MAX_HEIGHT);
>>> +
>>> +	*v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD) = *fmt;
>> You're allowing userspace to set fmt->field, as well as all the
>> colorspace parameters, to random values. I would instead do something
>> like
>>
>> 	for (i = 0; i < ARRAY_SIZE(mali_c55_tpg_mbus_codes); i++) {
>> 		if (format->format.code == mali_c55_tpg_mbus_codes[i])
>> 			break;
>> 	}
>>
>> 	if (i == ARRAY_SIZE(mali_c55_tpg_mbus_codes))
>> 		format->format.code = MEDIA_BUS_FMT_SRGGB20_1X20;
>>
>> 	format->format.width = clamp(format->format.width,
>> 				     MALI_C55_MIN_WIDTH, MALI_C55_MAX_WIDTH);
>> 	format->format.height = clamp(format->format.height,
>> 				      MALI_C55_MIN_HEIGHT, MALI_C55_MAX_HEIGHT);
>>
>> 	fmt = v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD);
>> 	fmt->code = format->format.code;
>> 	fmt->width = format->format.width;
>> 	fmt->height = format->format.height;
>>
>> 	format->format = *fmt;
>>
>> Alternatively (which I think I like better),
>>
>> 	fmt = v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD);
>>
>> 	fmt->code = format->format.code;
>>
>> 	for (i = 0; i < ARRAY_SIZE(mali_c55_tpg_mbus_codes); i++) {
>> 		if (fmt->code == mali_c55_tpg_mbus_codes[i])
>> 			break;
>> 	}
>>
>> 	if (i == ARRAY_SIZE(mali_c55_tpg_mbus_codes))
>> 		fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
>>
>> 	fmt->width = clamp(format->format.width,
>> 			   MALI_C55_MIN_WIDTH, MALI_C55_MAX_WIDTH);
>> 	fmt->height = clamp(format->format.height,
>> 			    MALI_C55_MIN_HEIGHT, MALI_C55_MAX_HEIGHT);
>>
>> 	format->format = *fmt;
>>
>>> +
>>> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>>> +		return 0;
>>> +
>>> +	__mali_c55_tpg_calc_vblank(fmt, &vblank_def, &vblank_min);
>>> +	__v4l2_ctrl_modify_range(tpg->ctrls.vblank, vblank_min,
>>> +				 MALI_C55_TPG_MAX_VBLANK, 1, vblank_def);
>>> +	__v4l2_ctrl_s_ctrl(tpg->ctrls.vblank, vblank_def);
>> Move those three calls to a separate function, it will be reused below.
>> I'd name is mali_c55_tpg_update_vblank(). You can fold
>> __mali_c55_tpg_calc_vblank() in it.
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct v4l2_subdev_pad_ops mali_c55_tpg_pad_ops = {
>>> +	.enum_mbus_code		= mali_c55_tpg_enum_mbus_code,
>>> +	.enum_frame_size	= mali_c55_tpg_enum_frame_size,
>>> +	.get_fmt		= v4l2_subdev_get_fmt,
>>> +	.set_fmt		= mali_c55_tpg_set_fmt,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_ops mali_c55_tpg_ops = {
>>> +	.video	= &mali_c55_tpg_video_ops,
>>> +	.pad	= &mali_c55_tpg_pad_ops,
>>> +};
>>> +
>>> +static int mali_c55_tpg_init_state(struct v4l2_subdev *sd,
>>> +				   struct v4l2_subdev_state *sd_state)
>> You name this variable state in every other subdev operation handler.
>>
>>> +{
>>> +	struct v4l2_mbus_framefmt *fmt =
>>> +		v4l2_subdev_state_get_format(sd_state, MALI_C55_TPG_SRC_PAD);
>>> +
>>> +	fmt->width = MALI_C55_DEFAULT_WIDTH;
>>> +	fmt->height = MALI_C55_DEFAULT_HEIGHT;
>>> +	fmt->field = V4L2_FIELD_NONE;
>>> +	fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
>> Initialize the colorspace fields too.
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct v4l2_subdev_internal_ops mali_c55_tpg_internal_ops = {
>>> +	.init_state = mali_c55_tpg_init_state,
>>> +};
>>> +
>>> +static int mali_c55_tpg_init_controls(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct mali_c55_tpg_ctrls *ctrls = &mali_c55->tpg.ctrls;
>>> +	struct v4l2_subdev *sd = &mali_c55->tpg.sd;
>>> +	struct v4l2_mbus_framefmt *format;
>>> +	struct v4l2_subdev_state *state;
>>> +	int vblank_def, vblank_min;
>>> +	int ret;
>>> +
>>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>>> +	format = v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD);
>>> +
>>> +	ret = v4l2_ctrl_handler_init(&ctrls->handler, 1);
>> You have 3 controls.
>>
>>> +	if (ret)
>>> +		goto err_unlock;
>>> +
>>> +	ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(&ctrls->handler,
>>> +				&mali_c55_tpg_ctrl_ops, V4L2_CID_TEST_PATTERN,
>>> +				ARRAY_SIZE(mali_c55_tpg_test_pattern_menu) - 1,
>>> +				0, 3, mali_c55_tpg_test_pattern_menu);
>>> +
>>> +	/*
>>> +	 * We fix hblank at the minimum allowed value and control framerate
>>> +	 * solely through the vblank control.
>>> +	 */
>>> +	ctrls->hblank = v4l2_ctrl_new_std(&ctrls->handler,
>>> +				&mali_c55_tpg_ctrl_ops,
>>> +				V4L2_CID_HBLANK, MALI_C55_TPG_FIXED_HBLANK,
>>> +				MALI_C55_TPG_FIXED_HBLANK, 1,
>>> +				MALI_C55_TPG_FIXED_HBLANK);
>>> +	if (ctrls->hblank)
>>> +		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> +
>>> +	__mali_c55_tpg_calc_vblank(format, &vblank_def, &vblank_min);
>> Drop this and initialize the control with default values. You can then
>> update the value by calling mali_c55_tpg_update_vblank() in
>> mali_c55_register_tpg().
>>
>> The reason is to share the same mutex between the control handler and
>> the subdev active state without having to add a separate mutex in the
>> mali_c55_tpg structure. The simplest way to do so is to initialize the
>> controls first, set sd->state_lock to point to the control handler lock,
>> and call v4l2_subdev_init_finalize() as the last step. As a consequence,
>> you can't access the active state when initializing controls.
>>
>> You can alternatively keep the lock in mali_c55_tpg and set
>> sd->state_lock to point to it, but I think that's more complex.
>>
>>> +	ctrls->vblank = v4l2_ctrl_new_std(&ctrls->handler,
>>> +					  &mali_c55_tpg_ctrl_ops,
>>> +					  V4L2_CID_VBLANK, vblank_min,
>>> +					  MALI_C55_TPG_MAX_VBLANK, 1,
>>> +					  vblank_def);
>>> +
>>> +	if (ctrls->handler.error) {
>>> +		dev_err(mali_c55->dev, "Error during v4l2 controls init\n");
>>> +		ret = ctrls->handler.error;
>>> +		goto err_free_handler;
>>> +	}
>>> +
>>> +	ctrls->handler.lock = &mali_c55->tpg.lock;
>> Drop this and drop the mutex. The control handler will use its internal
>> mutex.
>>
>>> +	mali_c55->tpg.sd.ctrl_handler = &ctrls->handler;
>>> +
>>> +	v4l2_subdev_unlock_state(state);
>>> +
>>> +	return 0;
>>> +
>>> +err_free_handler:
>>> +	v4l2_ctrl_handler_free(&ctrls->handler);
>>> +err_unlock:
>>> +	v4l2_subdev_unlock_state(state);
>>> +	return ret;
>>> +}
>>> +
>>> +int mali_c55_register_tpg(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct mali_c55_tpg *tpg = &mali_c55->tpg;
>>> +	struct v4l2_subdev *sd = &tpg->sd;
>>> +	struct media_pad *pad = &tpg->pad;
>>> +	int ret;
>>> +
>>> +	mutex_init(&tpg->lock);
>>> +
>>> +	v4l2_subdev_init(sd, &mali_c55_tpg_ops);
>>> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>> +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> Should we introduce a TPG function ?
>>
>>> +	sd->internal_ops = &mali_c55_tpg_internal_ops;
>>> +	strscpy(sd->name, MALI_C55_DRIVER_NAME " tpg", sizeof(sd->name));
>>> +
>>> +	pad->flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
>> I don't think MEDIA_PAD_FL_MUST_CONNECT is right.
>>
>>> +	ret = media_entity_pads_init(&sd->entity, 1, pad);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev,
>>> +			"Failed to initialize media entity pads\n");
>>> +		goto err_destroy_mutex;
>>> +	}
>>> +
>> 	sd->state_lock = sd->ctrl_handler->lock;
>>
>> to use the same lock for the controls and the active state. You need to
>> move this line and the v4l2_subdev_init_finalize() call after
>> mali_c55_tpg_init_controls() to get the control handler lock initialized
>> first.
>>
>>> +	ret = v4l2_subdev_init_finalize(sd);
>>> +	if (ret)
>>> +		goto err_cleanup_media_entity;
>>> +
>>> +	ret = mali_c55_tpg_init_controls(mali_c55);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev,
>>> +			"Error initialising controls\n");
>>> +		goto err_cleanup_subdev;
>>> +	}
>>> +
>>> +	ret = v4l2_device_register_subdev(&mali_c55->v4l2_dev, sd);
>>> +	if (ret) {
>>> +		dev_err(mali_c55->dev, "Failed to register tpg subdev\n");
>>> +		goto err_free_ctrl_handler;
>>> +	}
>>> +
>>> +	/*
>>> +	 * By default the colour settings lead to a very dim image that is
>>> +	 * nearly indistinguishable from black on some monitor settings. Ramp
>>> +	 * them up a bit so the image is brighter.
>>> +	 */
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_TPG_R_BACKGROUND,
>>> +		       MALI_C55_TPG_BACKGROUND_MAX);
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_TPG_G_BACKGROUND,
>>> +		       MALI_C55_TPG_BACKGROUND_MAX);
>>> +	mali_c55_write(mali_c55, MALI_C55_REG_TPG_B_BACKGROUND,
>>> +		       MALI_C55_TPG_BACKGROUND_MAX);
>>> +
>>> +	tpg->mali_c55 = mali_c55;
>>> +
>>> +	return 0;
>>> +
>>> +err_free_ctrl_handler:
>>> +	v4l2_ctrl_handler_free(&tpg->ctrls.handler);
>>> +err_cleanup_subdev:
>>> +	v4l2_subdev_cleanup(sd);
>>> +err_cleanup_media_entity:
>>> +	media_entity_cleanup(&sd->entity);
>>> +err_destroy_mutex:
>>> +	mutex_destroy(&tpg->lock);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +void mali_c55_unregister_tpg(struct mali_c55 *mali_c55)
>>> +{
>>> +	struct mali_c55_tpg *tpg = &mali_c55->tpg;
>>> +
>>> +	if (!tpg->mali_c55)
>>> +		return;
>>> +
>>> +	v4l2_device_unregister_subdev(&tpg->sd);
>>> +	v4l2_subdev_cleanup(&tpg->sd);
>>> +	media_entity_cleanup(&tpg->sd.entity);
>>> +	v4l2_ctrl_handler_free(&tpg->ctrls.handler);
>> Free the control handler just after v4l2_device_unregister_subdev() to
>> match the order in mali_c55_register_tpg().
>>
>>> +	mutex_destroy(&tpg->lock);
>>> +}

