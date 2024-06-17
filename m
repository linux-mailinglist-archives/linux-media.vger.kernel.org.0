Return-Path: <linux-media+bounces-13383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B890A5E5
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 08:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FF361C2181E
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 06:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A9C1862AF;
	Mon, 17 Jun 2024 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k4ucxqli"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD76B17F36D;
	Mon, 17 Jun 2024 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718605908; cv=none; b=FPpg1IkBlhikpU957g/o9tg+0WihGCn5fxr9uphy6eWU/ZPDIggeHL7MccCdGc0HqL2R2rHePFqTRtir8P88O+oauH/xwFfnIOAXWTtUvF5w8TozrIz7bogPmia68JZKqShdu8imq1x4JkSqcqnUc5s1/IqHQIWQ0I3oPg0bnUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718605908; c=relaxed/simple;
	bh=h3NzhOWdPi1eKZoED4GYlzALqjZOAKHefLrPEdRQEm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNyDdwZQXQgUgBHBEJOVmQqRNSgyMmiamKsb/dVHRrXX9ceenQFffESmWQ+6nIEZSZRDtwwPFY7q2lRxxvT6G4ThMVUmFmzxKUvP2oWUrtQ87eAMu2HLY12TTCXKzwU1ggwA0YWNcSrEByie3w8LBqT6xSAmKbfuyk27Sraubuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k4ucxqli; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AF8E2D5;
	Mon, 17 Jun 2024 08:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718605887;
	bh=h3NzhOWdPi1eKZoED4GYlzALqjZOAKHefLrPEdRQEm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k4ucxqlivYSrRRVNAJGC+A7KCpwbofbuKz0200d3cqlz/YumgBV7CL4aI4QO9z9Tk
	 Y+PYAWWq8+3OdU5bGXOVxR12aO6cNO07g3ToHQ04ALwB9eRfnizsGsjcSVl/3lfcUv
	 hhNL+via8XLaIR13y0dNlLUKaJ26wzJV9+CZ5b7M=
Message-ID: <600e744f-3a0b-4536-9cd1-43a86a326563@ideasonboard.com>
Date: Mon, 17 Jun 2024 07:31:40 +0100
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
 <6d0be0cf-ff77-4943-8505-f78ad922e3fb@ideasonboard.com>
 <20240616193901.GA10964@pendragon.ideasonboard.com>
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
In-Reply-To: <20240616193901.GA10964@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Morning Laurent

On 16/06/2024 20:39, Laurent Pinchart wrote:
> Hi Dan,
>
> On Fri, Jun 14, 2024 at 11:13:29AM +0100, Daniel Scally wrote:
>> On 30/05/2024 01:15, Laurent Pinchart wrote:
>>> On Wed, May 29, 2024 at 04:28:47PM +0100, Daniel Scally wrote:
>>>> Add a driver for Arm's Mali-C55 Image Signal Processor. The driver is
>>>> V4L2 and Media Controller compliant and creates subdevices to manage
>>>> the ISP itself, its internal test pattern generator as well as the
>>>> crop, scaler and output format functionality for each of its two
>>>> output devices.
>>>>
>>>> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
>>>> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>> Changes in v5:
>>>>
>>>> 	- Reworked input formats - previously we allowed representing input data
>>>> 	  as any 8-16 bit format. Now we only allow input data to be represented
>>>> 	  by the new 20-bit bayer formats, which is corrected to the equivalent
>>>> 	  16-bit format in RAW bypass mode.
>>>> 	- Stopped bypassing blocks that we haven't added supporting parameters
>>>> 	  for yet.
>>>> 	- Addressed most of Sakari's comments from the list
>>>>
>>>> Changes not yet made in v5:
>>>>
>>>> 	- The output pipelines can still be started and stopped independently of
>>>> 	  one another - I'd like to discuss that more.
>>>> 	- the TPG subdev still uses .s_stream() - I need to rebase onto a tree
>>>> 	  with working .enable_streams() for a single-source-pad subdevice.
>>>>
>>>> Changes in v4:
>>>>
>>>> 	- Reworked mali_c55_update_bits() to internally perform the bit-shift
>>> I really don't like that, it makes the code very confusing, even more so
>>> as it differs from regmap_update_bits().
>>>
>>> Look at this for instance:
>>>
>>> 	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
>>> 			     MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK,
>>> 			     MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK);
>>>
>>> It only works by change because MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK is
>>> BIT(0).
>>>
>>> Sorry, I know it will be painful, but this change needs to be reverted.
>> I'd like to argue for keeping this, on the grounds that it's better. I got lazy in the change you
>> reference there, and because BIT(0) is the same as 0x01 didn't bother changing it. I agree that
>> that's confusing but I think it would be better to keep the change and just update all the call
>> sites properly. The benefits as I see them are two:
>>
>>
>> 1. This method ensures sane consistent calling of the function. Without the internal shift you have
>> to shift the values at the call site, but there's no reason to do that if the value you're setting
>> is 0x00 or if the field you're targeting in the register starts at bit 0, so I think writing code
>> naturally we'd have a mix of situations like so:
>>
>>
>> #define REG_1 0xfc00
>>
>> #define REG_2 0xff
>>
>> mali_c55_update_bits(mali_c55, 0x1234, REG_1, 0x02 << 10);
>>
>> mali_c55_update_bits(mali_c55, 0x1234, REG_1, 0x00);
>>
>> mali_c55_update_bits(mali_c55, 0x1234, REG_2, 0x02);
>>
>> And I think that the mixture is more confusing than the difference with regmap_update_bits(). We
>> could include the bitshifting for consistencies sake despite it being unecessary, but it's extra
>> work for no real reason and itself "looks wrong" if the field starts at bit(0)...it would look less
>> wrong with an offset macro that defines the number of bits to shift as 0 but then we're on to
>> advantage #2...
>>
>> 2. It makes the driver far cleaner. Without it we either have magic numbers scattered throughout
>> (and sometimes have to calculate them with extra variables where the write can target different
>> places conditionally) or have macros defining the number of bits to shift, or have to do (ffs(mask)
>> - 1) everywhere, and that tends to make the call sites a lot messier - this was the original reason
>> I moved it internal actually.
>>
>> What do you think?
> All register values (possibly with the exception of 0) should have
> macros. The callers will thus not need to perform shifts manually, they
> will all be handled in the register fields macros. From a caller point
> of view, not handling the shifts inside mali_c55_update_bits() will not
> make a difference.
>
> It's the first time I notice a driver trying to shift internally in its
> update_bits function. I think that's really confusing, especially given
> that it departs from how regmap operates. I still strongly favour
> handling the shifts in the register macros.


Alright - I will handle it that way (in fact I already did). Thanks!

>
>>>> 	- Reworked the resizer to allow cropping during streaming
>>>> 	- Fixed a bug in NV12 output
>>>>
>>>> Changes in v3:
>>>>
>>>> 	- Mostly minor fixes suggested by Sakari
>>>> 	- Fixed the sequencing of vb2 buffers to be synchronised across the two
>>>> 	  capture devices.
>>>>
>>>> Changes in v2:
>>>>
>>>> 	- Clock handling
>>>> 	- Fixed the warnings raised by the kernel test robot
>>>>
>>>>    drivers/media/platform/Kconfig                |   1 +
>>>>    drivers/media/platform/Makefile               |   1 +
>>>>    drivers/media/platform/arm/Kconfig            |   5 +
>>>>    drivers/media/platform/arm/Makefile           |   2 +
>>>>    drivers/media/platform/arm/mali-c55/Kconfig   |  18 +
>>>>    drivers/media/platform/arm/mali-c55/Makefile  |   9 +
>>>>    .../platform/arm/mali-c55/mali-c55-capture.c  | 951 ++++++++++++++++++
>>>>    .../platform/arm/mali-c55/mali-c55-common.h   | 266 +++++
>>>>    .../platform/arm/mali-c55/mali-c55-core.c     | 767 ++++++++++++++
>>>>    .../platform/arm/mali-c55/mali-c55-isp.c      | 611 +++++++++++
>>>>    .../arm/mali-c55/mali-c55-registers.h         | 258 +++++
>>>>    .../arm/mali-c55/mali-c55-resizer-coefs.h     | 382 +++++++
>>>>    .../platform/arm/mali-c55/mali-c55-resizer.c  | 779 ++++++++++++++
>>>>    .../platform/arm/mali-c55/mali-c55-tpg.c      | 402 ++++++++
>>>>    14 files changed, 4452 insertions(+)
>>>>    create mode 100644 drivers/media/platform/arm/Kconfig
>>>>    create mode 100644 drivers/media/platform/arm/Makefile
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/Kconfig
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/Makefile
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-capture.c
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-common.h
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-core.c
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer-coefs.h
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> [snip]
>

