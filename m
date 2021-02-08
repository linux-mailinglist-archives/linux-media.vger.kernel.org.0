Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A1A31310D
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 12:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhBHLi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 06:38:56 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50625 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233158AbhBHLfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 06:35:54 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 94oiljJHbW4yN94olllQl1; Mon, 08 Feb 2021 12:34:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612784099; bh=cLTN0V3qwtMIWrnNtULMVFYHebjAit9FEOYQIKf/ZKQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bJN2xKL8e0aueqyS9mkZtOV30Mxt9hSvyzz2lmz1EADnsLAKKVC/XTv+SJMMfPSr6
         /WERsnzKOGxCcZpvrxzChBDrHwVwyywp7HM4sPBW+qdDrBZTWnQ0Hl/VVyQ3H7nPjf
         wa9M8Y3IeeCVQkKf1C6c9ZPLXLFNGGDssexj1nPE/F1g1YWpuo68cHCX4Sjr5TEFXL
         XdxVjYqQyFTUalFAABcsLsolRpfbyo1sYff+b50b6vDoi32q2lcGMlkVOFSlYNNBdz
         4j2rVsOiF1AVMcKyyNz1DevGero1GNOfFdSJLah948NWnD4SQrASlbf1CnzuclQ6rD
         tXTnANbz0WcRw==
Subject: Re: [PATCH v8 1/5] media: i2c: Add driver for RDACM21 camera module
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
References: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
 <20210114170429.139762-2-jacopo+renesas@jmondi.org>
 <0b118385-70bc-01eb-8ddf-829c604d533b@xs4all.nl>
 <YCEgcPv1TWe0DN50@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c0db4607-7e2b-ac88-c9d2-d1c5f75bbf86@xs4all.nl>
Date:   Mon, 8 Feb 2021 12:34:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCEgcPv1TWe0DN50@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOycAfiYUOVJsJb7JPsJESzYmcPtMQxq949LJ7Q/77adpWZ/KIcaGZfUIc/PVFTioaiDRDStdqbVy9u3ehwQaWoGQ+eShkClJ7v5Ks5QD/xfakT7+QXo
 FPOcIY0fkYaMwD74S6yjxfbmlfQbWcgVPmbfRcwlGuICqCOG0VgfEHJuyNpnnyEgSQQp7qVdWB39gs6caHVHi7A8bZRo5xYavkvu/V4MsNBNAOuna07IqlI4
 S2Ql8kvIbGV7u9fK6keGSdV4XqmJ20eks+kyWD27HN7UF+TeDYsgs7z9nJ/GR/eP2uIK523Sp0PnRpkiDlEA5v+yGCJJelZQb7BVyjA20mxzS/tnWOBQZ3R7
 vDLePzwvQaRVOdBy3SPyEqMovjcuDXDO9NwjSApr4w5Lg2lBr1Xv9NngWeRihUaBTaG3zi2iHvfvXv5z0XUJKdU6I8HjOE4AFVPwZpg5kQnM03EVrX89zvJf
 6GPEFvF+6pgpvLqHFnN3Ky9lIaH2lWL2xFnpJkCGyidXswh2ZCZkseEX/ly95eLjKKMp3u1FOl5Dq1QlNPQJJizpCDQRCHLmD31aFkKObZVfvZax8HY9ZTl+
 Uv0OAHgTajbYeTq9KxRbXwv10btwT2TwoiJr1notw5TF7Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/02/2021 12:28, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Feb 08, 2021 at 12:21:01PM +0100, Hans Verkuil wrote:
>> On 14/01/2021 18:04, Jacopo Mondi wrote:
>>> The RDACM21 is a GMSL camera supporting 1280x1080 resolution images
>>> developed by IMI based on an Omnivision OV10640 sensor, an Omnivision
>>> OV490 ISP and a Maxim MAX9271 GMSL serializer.
>>>
>>> The driver uses the max9271 library module, to maximize code reuse with
>>> other camera module drivers using the same serializer, such as rdacm20.
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> ---
>>>  MAINTAINERS                 |  12 +
>>>  drivers/media/i2c/Kconfig   |  13 +
>>>  drivers/media/i2c/Makefile  |   2 +
>>>  drivers/media/i2c/rdacm21.c | 623 ++++++++++++++++++++++++++++++++++++
>>>  4 files changed, 650 insertions(+)
>>>  create mode 100644 drivers/media/i2c/rdacm21.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 14adf87d90c7..1822d73ed615 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -14967,6 +14967,18 @@ F:	drivers/media/i2c/max9271.c
>>>  F:	drivers/media/i2c/max9271.h
>>>  F:	drivers/media/i2c/rdacm20.c
>>>
>>> +RDACM21 Camera Sensor
>>> +M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> +M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> +M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> +L:	linux-media@vger.kernel.org
>>> +S:	Maintained
>>> +F:	Documentation/devicetree/bindings/media/i2c/rdacm2x-gmsl.yaml
>>> +F:	drivers/media/i2c/max9271.c
>>> +F:	drivers/media/i2c/max9271.h
>>> +F:	drivers/media/i2c/rdacm21.c
>>> +
>>>  RDC R-321X SoC
>>>  M:	Florian Fainelli <florian@openwrt.org>
>>>  S:	Maintained
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index 2b9d81e4794a..d500edb8638b 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -1212,6 +1212,19 @@ config VIDEO_RDACM20
>>>  	  This camera should be used in conjunction with a GMSL
>>>  	  deserialiser such as the MAX9286.
>>>
>>> +config VIDEO_RDACM21
>>> +	tristate "IMI RDACM21 camera support"
>>> +	depends on I2C
>>> +	select V4L2_FWNODE
>>> +	select VIDEO_V4L2_SUBDEV_API
>>> +	select MEDIA_CONTROLLER
>>> +	help
>>> +	  This driver supports the IMI RDACM21 GMSL camera, used in
>>> +	  ADAS systems.
>>> +
>>> +	  This camera should be used in conjunction with a GMSL
>>> +	  deserialiser such as the MAX9286.
>>> +
>>>  config VIDEO_RJ54N1
>>>  	tristate "Sharp RJ54N1CB0C sensor support"
>>>  	depends on I2C && VIDEO_V4L2
>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>> index a3149dce21bb..85b1edc62508 100644
>>> --- a/drivers/media/i2c/Makefile
>>> +++ b/drivers/media/i2c/Makefile
>>> @@ -124,6 +124,8 @@ obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
>>>  obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
>>>  rdacm20-camera_module-objs	:= rdacm20.o max9271.o
>>>  obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
>>> +rdacm21-camera_module-objs	:= rdacm21.o max9271.o
>>> +obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21-camera_module.o
>>>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
>>
>> This isn't right. The max9271 code exports various functions, but since it is
>> included with *two* modules (rdacm20/1-camera_module.ko) it is exported twice.
>>
>> Since max9271 is not a self-contained driver it should not export symbols.
> 
> Shouldn't we instead make max9271 a stand-alone module ?

If that makes sense, then that's the alternative option. I don't know if it
can be used with anything else but rdacm20/21.

Either way, this needs to be fixed.

Regards,

	Hans

> 
>> Can you provide a patch fixing that?
> 

