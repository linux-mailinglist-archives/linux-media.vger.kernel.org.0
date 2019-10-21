Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16578DF0DF
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 17:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbfJUPH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 11:07:26 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44137 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726289AbfJUPH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 11:07:26 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MZHDiVloqo1ZhMZHGiMvzP; Mon, 21 Oct 2019 17:07:23 +0200
Subject: Re: [PATCH v4 5/6] media: sun4i: Add H3 deinterlace driver
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-sunxi@googlegroups.com
References: <20191017183738.68069-1-jernej.skrabec@siol.net>
 <20191017183738.68069-6-jernej.skrabec@siol.net>
 <8137fbb3-036a-95e4-2642-5dd46fb55eb9@xs4all.nl>
 <2174547.3yqp6rY4Nl@jernej-laptop>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <639e09c3-05fa-a724-3aa2-2ccff1a2fe84@xs4all.nl>
Date:   Mon, 21 Oct 2019 17:07:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2174547.3yqp6rY4Nl@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFRz55vFgFmmN16VEl2p90YpBldoYxHQhxpRVwKRxADvI0/JBsbOV/lC/XxZEKnfUPEkaIcrZM/k4X6nZVMFWYIJfuPAN03wfLG4i6PLA/RIuKx6juhU
 QFhkEgsD81UazLmgoT1XpmidTziJPJgp8UHjCjuQIZzGXWHNMcHm6KrgH0nhRNCZTNFxtBMdgRXPdHLMQMc3eQSQ9Jo6OBQpB0k+2HL2LkYdBW483FnVpBSt
 vaRK0rSjKP5mmX8ii4mReYRvi9kv/ZwWwwl95wyS0BRyuAmbn3Ji2L/zf3it/uV9fElKLnNuU8sqiG+nhFJXQbdnMxLaKI5GCu7cSS7zxniR5Kff5bMHEO//
 kkJjQfLLe3KbF0U0biV6AMS6VfxUu68V13OvnxrwMvcNDmD1M81b0nZOs/N5mkwtk3aPLuUEuUQ5Xmmsc/l1AojtcrUsd0JaBQ/Gyr842/C2f+QKZ9izj/Ct
 lk1eMXdXROYYsOKet6K5xakejQLZbg5d0sZdIKhPiRaXBwtWwlDdj++BbAA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/21/19 4:47 PM, Jernej Škrabec wrote:
> Dne ponedeljek, 21. oktober 2019 ob 13:13:20 CEST je Hans Verkuil napisal(a):
>> On 10/17/19 8:37 PM, Jernej Skrabec wrote:
>>> Allwinner H3 SoC contains deinterlace unit, which has several modes of
>>> operation - bypass, weave, bob and mixed (advanced) mode. I don't know
>>> how mixed mode works, but according to Allwinner it gives best results,
>>> so they use it exclusively. Currently this mode is also hardcoded here.
>>>
>>> For each interleaved frame queued, this driver produces 2 deinterlaced
>>> frames. Deinterlaced frames are based on 2 consequtive output buffers,
>>> except for the first 2, where same output buffer is given to peripheral
>>> as current and previous.
>>>
>>> There is no documentation for this core, so register layout and fixed
>>> values were taken from BSP driver.
>>>
>>> I'm not sure if maximum size of the image unit is capable to process is
>>> governed by size of "flag" buffers, frequency or it really is some HW
>>> limitation. Currently driver can process full HD image in ~15ms (7.5ms
>>> for each capture buffer), which allows to process 1920x1080@60i video
>>> smoothly in real time.
>>>
>>> Acked-by: Maxime Ripard <mripard@kernel.org>
>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>>> ---
>>>
>>>  MAINTAINERS                                   |    7 +
>>>  drivers/media/platform/Kconfig                |   12 +
>>>  drivers/media/platform/sunxi/Makefile         |    1 +
>>>  .../media/platform/sunxi/sun8i-di/Makefile    |    2 +
>>>  .../media/platform/sunxi/sun8i-di/sun8i-di.c  | 1028 +++++++++++++++++
>>>  .../media/platform/sunxi/sun8i-di/sun8i-di.h  |  237 ++++
>>>  6 files changed, 1287 insertions(+)
>>>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/Makefile
>>>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
>>>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index c7b48525822a..c375455125fb 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -4646,6 +4646,13 @@ M:	"Maciej W. Rozycki" <macro@linux-mips.org>
>>>
>>>  S:	Maintained
>>>  F:	drivers/net/fddi/defxx.*
>>>
>>> +DEINTERLACE DRIVERS FOR ALLWINNER H3
>>> +M:	Jernej Skrabec <jernej.skrabec@siol.net>
>>> +L:	linux-media@vger.kernel.org
>>> +T:	git git://linuxtv.org/media_tree.git
>>> +S:	Maintained
>>> +F:	drivers/media/platform/sunxi/sun8i-di/
>>
>> This is missing the bindings file added in the previous patch.
> 
> Well, I listed Maxime and Chen-Yu as binding maintainers in patch 4, so that's 
> why I didn't include it here. If you think I should be maintainer of that 
> binding too, I can change that. I took sun6i-csi as example where binding 
> maintainers are Maxime and Chen-Yu and driver maintainer is Yong Deng.

Normally, whoever maintains the driver also maintains the corresponding bindings
documentation. It doesn't make much sense to have different people maintain it.

I see that the 'maintainers:' tag is now a valid way of describing maintainers.
But it doesn't appear to be read by scripts/get_maintainer.pl AFAICS.

So unless I am wrong about that I think it still should be added to MAINTAINERS.
It's certainly done for other drivers (grep yaml MAINTAINERS).

In my view you should include yourself as maintainer of this bindings doc, and
add it to the MAINTAINERS file.

Regards,

	Hans

> 
> Best regards,
> Jernej
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +
>>>
>>>  DELL SMBIOS DRIVER
>>>  M:	Pali Rohár <pali.rohar@gmail.com>
>>>  M:	Mario Limonciello <mario.limonciello@dell.com>
> 
> 
> 
> 

