Return-Path: <linux-media+bounces-576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB047F060B
	for <lists+linux-media@lfdr.de>; Sun, 19 Nov 2023 13:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 201A91F21C61
	for <lists+linux-media@lfdr.de>; Sun, 19 Nov 2023 12:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7319AE573;
	Sun, 19 Nov 2023 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="lfTakmJw"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2438AD8;
	Sun, 19 Nov 2023 04:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700395373; x=1701000173; i=wahrenst@gmx.net;
	bh=i+DVUJCspBrn4tDz11etcfalDTdenr3Ez2EXD/Jj8uk=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=lfTakmJw6JhNrb876zXqXlcuvkUZO0yJC/DU0AzZNyO7UXnDpSzhFE4R13S/awcr
	 WBrIPPj/PNpYaGy1sOiCBRSjsMeRP8I3x/XtPoyqW1R88ftGQt36weel/L5Wb48nP
	 12x/ZISaMeHagQFKZPNo6yffwLt39ktTeC8of1NvEPW/cCsjBZ5dUBktksRktghOn
	 4h/xipFOlyGNUq7/JUDzeYvpRmrsajUGaoZ4jk7A3P0zhgLABUOCwsqT/lrSN9AXt
	 RDwH6MgM1Gkdyevv3XB1sToVgUHLRkLir08c/QMbJFN/eLsTa/Y8K5RXZIA71CCdP
	 bF1GgzE9tto2a8DKTg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNtP-1rl87t4BJ7-00lnUv; Sun, 19
 Nov 2023 13:02:53 +0100
Message-ID: <d9e1c435-3de4-407f-bdc7-d8b2b66042ca@gmx.net>
Date: Sun, 19 Nov 2023 13:02:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] staging: vc04_services: bcm2835-isp: Add a more
 complex ISP processing component
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 kernel-list@raspberrypi.com, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>,
 Dan Carpenter <error27@gmail.com>, Naushir Patuck <naush@raspberrypi.com>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231109210309.638594-11-umang.jain@ideasonboard.com>
 <414ba478-3a96-48e6-a3a7-88c920a20960@gmx.net>
 <20231118185638.GJ20846@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231118185638.GJ20846@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Senyw37i4muptiZg26W5eyxJmmzhLTcnCpqutjgx95/ox5WZg/i
 cBhWemBWCSBkDCcBjMnHj/3rEtvdhJTZbpsqpprQ4GH7lNGedyRsZSxB1VBunM3ZvjDn3ln
 5YQALbjrVKSsZwdpagrRtguaX79+yMZLjW0oAv22b8ic39pj3HLnF1VySFUWNlhISxQ/FSG
 gvm5Dg+zpHfWmAW8l/i8A==
UI-OutboundReport: notjunk:1;M01:P0:cyVyPz9+kTk=;s1Uomy8IC3+VDOblEDHYCOwXaUj
 VJlVkECT0gEQvfbraR0SCt11r0uHxj5oKXrrBHhNtB4qeQ1yyLDzgmRh6CusOTSIftAT66PG3
 GH8vVYaS01z9GT/5GXLNvmUOVaMla374yHryc25OKvRWpexeF1sp+Aoy8u4rVB30YfT9BCNhu
 HpSEPllJSQ5bciFrIkSNNlkN8kiADDsuSByo7DaSZMl2YgDp8JJOwoHAuxLlcWtg9Ypmgv8eF
 AKE0XqA6tQvsACe+jkNTJ3mqFiXcejJ5OKUmnB62Ex37rn8F6GBw/b9GJ2tnj1HIg3KKxRGPo
 wvrZAYrihSPPSxQAWB+ZCQn93zIq0igXnJPq3YC+6lFOJp/6NKisiwHnDP3ycouhL6+/IFlZx
 +sgwQl42vu23sX3gJx6P59SNL7jmxkcBl2aEFz/QL1ySIEwN24jgKMrPoMBz+m7L5Cd8hu0Ms
 LX+NO/CMxNFftaZhKp/dq6Oh0qGvpwhi+2cJFqTuFOJaCtqag3GclEoFa6r3Qg+oXhPH03AsP
 UaWOP+ZU/2bgQD5mK2MDwBvF2EBu96ChDsHE0dUr3tifBxp8kt0N8qnuhWxjyd5bYdFln4Qh7
 zQpctvBwPyCab/MzNRRYGrmo5kkyAGuik3qI+HTuFgkgLGX8S3Ib8jFbj+Ze+KHv8EMuTItoA
 LFVRYctyXYsujdTva/mbl7PFhBUjqCA5NnG+JySqQj3/cxRrqGOmzKTqV1V8G9Ae8wBFHoIey
 oXe3ihJSdszkgJaOh+aq7iMOmde2ztpzl3K24lGlIDV12uhIWZZB69slJVxCP3UqW9lQtGOK7
 guO97RKWhNEwjfTdV9GkNvcnhPJ/3nnnSZ76vee7Hf0YZcM65ZAjz/i5BPad1jYnEsLfYeotX
 CVCLwjQL+r55a7N64N1KHc1rpynZKG1UOmKTWd36ld8Kej7oZOTLPH/MsLo/s7njMkS7rtEf3
 0eqegd0n49cD1wJyGXx8YFIkm9s=

Am 18.11.23 um 19:56 schrieb Laurent Pinchart:
> Hi Stefan,
>
> On Sat, Nov 18, 2023 at 03:53:41PM +0100, Stefan Wahren wrote:
>> Am 09.11.23 um 22:03 schrieb Umang Jain:
>>> From: Naushir Patuck <naush@raspberrypi.com>
>>>
>>> Driver for the BCM2835 ISP hardware block.  This driver uses the MMAL
>>> component to program the ISP hardware through the VC firmware.
>>>
>>> The ISP component can produce two video stream outputs, and Bayer
>>> image statistics. This can't be encompassed in a simple V4L2
>>> M2M device, so create a new device that registers 4 video nodes.
>> sorry, i don't have much knowledge about V4L2, so someone else should
>> review this in depth.
>>
>> But from my PoV, patch 11, 12, 13 and 15 should be squash into this one=
.
> For 11 and 12, I agree. 13 is a bit of a workaround for a missing
> feature in V4L2, and while it's acceptable today, having it as a
> separate commit may make it easier to revert it in the future when the
> V4L2 API will be extended (that may or may not happen, and I wouldn't
> count on it happening quickly in any case). I would keep patch 15
> separate as it's not part of this driver.

Okay, accepted

>
>>> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>> ---
>>>    MAINTAINERS                                   |    9 +
>>>    drivers/staging/vc04_services/Kconfig         |    2 +
>>>    drivers/staging/vc04_services/Makefile        |    1 +
>>>    .../staging/vc04_services/bcm2835-isp/Kconfig |   14 +
>>>    .../vc04_services/bcm2835-isp/Makefile        |    4 +
>>>    .../bcm2835-isp/bcm2835-isp-ctrls.h           |   72 +
>>>    .../bcm2835-isp/bcm2835-isp-fmts.h            |  482 +++++
>>>    .../bcm2835-isp/bcm2835-v4l2-isp.c            | 1712 ++++++++++++++=
+++
>>>    .../vc04_services/vchiq-mmal/mmal-encodings.h |    4 +
>>>    .../vchiq-mmal/mmal-parameters.h              |  165 +-
>>>    include/uapi/linux/bcm2835-isp.h              |   27 +
>>>    11 files changed, 2491 insertions(+), 1 deletion(-)
>>>    create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Kconfi=
g
>>>    create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Makefi=
le
>>>    create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm283=
5-isp-ctrls.h
>>>    create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm283=
5-isp-fmts.h
>>>    create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm283=
5-v4l2-isp.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 0748cc15588c..8670a8d95400 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3976,6 +3976,15 @@ F:	Documentation/devicetree/bindings/mips/brcm/
>>>    F:	arch/mips/bcm47xx/*
>>>    F:	arch/mips/include/asm/mach-bcm47xx/*
>>>
>>> +BROADCOM BCM2835 ISP DRIVER
>>> +M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>>> +L:	linux-media@vger.kernel.org
>>> +S:	Maintained
>>> +F:	Documentation/media/uapi/v4l/pixfmt-meta-bcm2835-isp-stats.rst
>>> +F:	Documentation/media/v4l-drivers/bcm2835-isp.rst
>>> +F:	drivers/staging/vc04_services/bcm2835-isp
>>> +F:	include/uapi/linux/bcm2835-isp.h
>>> +
>>>    BROADCOM BCM4908 ETHERNET DRIVER
>>>    M:	Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>>    R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@b=
roadcom.com>
>>> diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/v=
c04_services/Kconfig
>>> index 6c0e77d64376..e71e5a8b820a 100644
>>> --- a/drivers/staging/vc04_services/Kconfig
>>> +++ b/drivers/staging/vc04_services/Kconfig
>>> @@ -44,6 +44,8 @@ source "drivers/staging/vc04_services/bcm2835-audio/=
Kconfig"
>>>
>>>    source "drivers/staging/vc04_services/bcm2835-camera/Kconfig"
>>>
>>> +source "drivers/staging/vc04_services/bcm2835-isp/Kconfig"
>>> +
>>>    source "drivers/staging/vc04_services/vchiq-mmal/Kconfig"
>>>
>>>    source "drivers/staging/vc04_services/vc-sm-cma/Kconfig"
>>> diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/=
vc04_services/Makefile
>>> index 1f61a263f22d..2cebf92525a0 100644
>>> --- a/drivers/staging/vc04_services/Makefile
>>> +++ b/drivers/staging/vc04_services/Makefile
>>> @@ -16,3 +16,4 @@ obj-$(CONFIG_SND_BCM2835)		+=3D bcm2835-audio/
>>>    obj-$(CONFIG_VIDEO_BCM2835)		+=3D bcm2835-camera/
>>>    obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+=3D vchiq-mmal/
>>>    obj-$(CONFIG_BCM_VC_SM_CMA)		+=3D vc-sm-cma/
>>> +obj-$(CONFIG_VIDEO_ISP_BCM2835) 	+=3D bcm2835-isp/
>>> diff --git a/drivers/staging/vc04_services/bcm2835-isp/Kconfig b/drive=
rs/staging/vc04_services/bcm2835-isp/Kconfig
>>> new file mode 100644
>>> index 000000000000..6222799ebe16
>>> --- /dev/null
>>> +++ b/drivers/staging/vc04_services/bcm2835-isp/Kconfig
>>> @@ -0,0 +1,14 @@
>>> +config VIDEO_ISP_BCM2835
>>> +	tristate "BCM2835 ISP support"
>>> +	depends on MEDIA_SUPPORT
>>> +	depends on VIDEO_DEV && (ARCH_BCM2835 || COMPILE_TEST)
>>> +	depends on MEDIA_CONTROLLER
>>> +	select BCM2835_VCHIQ_MMAL
>>> +	select VIDEOBUF2_DMA_CONTIG
>>> +	help
>>> +	  This is the V4L2 driver for the Broadcom BCM2835 ISP hardware.
>> I think the description is not helpful for all users. Not everybody
>> knows what ISP is for. Please describe it more for an end user.
>>
>>> +	  This operates over the VCHIQ interface to a service running on
>>> +	  VideoCore.
>>> +
>>> +	  To compile this driver as a module, choose M here: the module
>>> +	  will be called bcm2835-isp.


