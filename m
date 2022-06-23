Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E2555768C
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 11:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiFWJYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 05:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbiFWJYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 05:24:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE5943ACC;
        Thu, 23 Jun 2022 02:24:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C99961DA1;
        Thu, 23 Jun 2022 09:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A903C3411B;
        Thu, 23 Jun 2022 09:24:05 +0000 (UTC)
Message-ID: <b38f9db2-59ab-b5d5-9194-a70cdaf8e0ac@xs4all.nl>
Date:   Thu, 23 Jun 2022 11:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v10 0/5] media: atmel: atmel-isc: implement media
 controller
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>, Eugen.Hristev@microchip.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Claudiu.Beznea@microchip.com, Nicolas.Ferre@microchip.com
References: <20220503095127.48710-1-eugen.hristev@microchip.com>
 <1da61f9c-0605-dc9d-63a3-21c18fcb74c7@xs4all.nl>
 <a19d9e72-7609-1daa-93eb-fdedcaa672c4@microchip.com>
 <bc22469c-d1ab-72e2-8e9e-6bd42d66f3d9@microchip.com>
 <c1b8820d-5ff5-b6dd-bc22-35f8daf756db@xs4all.nl>
 <20220622141439.v2ozrctikjxd67ue@uno.localdomain>
 <01b837f6-f8a2-1f59-45c1-f746b741f2db@xs4all.nl>
 <20220622154652.o7be4tl64m4yrbxv@uno.localdomain>
 <22bdd0f6-9dd5-9719-c26d-0c4b417a2a58@microchip.com>
 <20220623091903.zedzu5dv3x557lsp@uno.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220623091903.zedzu5dv3x557lsp@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/06/2022 11:19, Jacopo Mondi wrote:
> Hi Eugen,
> 
> On Thu, Jun 23, 2022 at 08:39:48AM +0000, Eugen.Hristev@microchip.com wrote:
>> On 6/22/22 6:46 PM, Jacopo Mondi wrote:
>>> Hi Hans,
>>>
>>> On Wed, Jun 22, 2022 at 04:55:27PM +0200, Hans Verkuil wrote:
>>>> Hi Eugen, Jacopo,
>>>>
>>>> On 22/06/2022 16:14, Jacopo Mondi wrote:
>>>>> Hi Hans, Eugen
>>>>>
>>>>> On Wed, Jun 22, 2022 at 03:47:33PM +0200, Hans Verkuil wrote:
>>>>>> On 22/06/2022 14:42, Eugen.Hristev@microchip.com wrote:
>>>>>>> On 6/22/22 3:25 PM, Eugen Hristev - M18282 wrote:
>>>>>>>> On 6/22/22 2:53 PM, Hans Verkuil wrote:
>>>>>>>>> Hi Eugen,
>>>>>>>>>
>>>>>>>>> On 03/05/2022 11:51, Eugen Hristev wrote:
>>>>>>>>>> This series is a split from the series :
>>>>>>>>>> [PATCH v9 00/13] media: atmel: atmel-isc: implement media controller
>>>>>>>>>> and it includes the media controller part.
>>>>>>>>>> previous fixes were sent on a different patch series.
>>>>>>>>>>
>>>>>>>>>> As discussed on the ML, moving forward with having the media link validate at
>>>>>>>>>> start/stop streaming call.
>>>>>>>>>> I will test the patch :
>>>>>>>>>> [RFC PATCHv2] vb2: add support for (un)prepare_streaming queue ops
>>>>>>>>>> afterwards, but that patch requires moving my logic to the new vb2 callbacks.
>>>>>>>>>
>>>>>>>>> I'm looking at merging this series, but I would like to have the output of
>>>>>>>>> 'v4l2-compliance -m /dev/mediaX' to verify that the MC links etc. is all
>>>>>>>>> correct.
>>>>>>>>
>>>>>>>> Hello Hans,
>>>>>>>>
>>>>>>>> Please have a look at attached file . Unless you want me to add the
>>>>>>>> whole output to the e-mail ?
>>>>>>>>
>>>>>>>> I also added output of media-ctl -p for your convenience.
>>>>>>>> the subdev2 is a device and driver that is not upstream and has some
>>>>>>>> compliance issues, they are reported by the v4l2-compliance tool, but
>>>>>>>> they should not affect this series, it's a synopsys driver that was
>>>>>>>> rejected on mainline a few years ago, I took it for internal usage, but
>>>>>>>> it's not cleaned up nor worked a lot upon.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> And one more question which may have been answered already in the past:
>>>>>>>>>
>>>>>>>>> Changing to the MC will break existing applications, doesn't it? Or did I
>>>>>>>>> miss something?
>>>>>>>>>
>>>>>>>>
>>>>>>>> The existing applications will have to configure the pipeline now. It
>>>>>>>> will no longer work by configuring just the top video node /dev/video0 .
>>>>>>>> They would have to use media-ctl for it, something similar with this set
>>>>>>>> of commands:
>>>>>>>
>>>>>>> To add on top of that, actually, the reality is that without the MC
>>>>>>> support in atmel-isc , some of our platforms do not work at all, because
>>>>>>> the csi2dc driver which is in the middle of the pipeline, is a MC
>>>>>>> driver. So it will not work without configuring it with MC anyway. It
>>>>>>> used to work in a very preliminary version of the csi2dc driver which I
>>>>>>> sent a few years ago, but that way of handling things was rejected.
>>>>>>> Hence I changed the csi2dc to being full-MC driver (requested for new
>>>>>>> drivers) and now I am completing the conversion for the whole pipeline.
>>>>>>> We are using this MC-centric approach in production for our products to
>>>>>>> be as close as possible to mainline, and backported it to our 5.15
>>>>>>> internal releases, which people are using right now.
>>>>>>
>>>>>> I'm not all that keen on breaking userspace for those who do NOT use the
>>>>>> Atmel BSP. Basically some platforms are currently broken, and with this patch
>>>>>> series some other platforms are broken, but at least can be fixed by changing
>>>>>> userspace.
>>>>>>
>>>>>> How feasible is it to do something similar that TI did for the cal driver?
>>>>>> (drivers/media/platform/ti/cal)
>>>>>>
>>>>>> I.e., based on a module option the MC is enabled or disabled. And if a
>>>>>> csi2dc is present, then the MC API is always enabled.
>>>>>>
>>>>>
>>>>> I think I have suggested Eugen to move to MC when he
>>>>> started looking in libcamera, so sorry for the intrusion but I feel
>>>>> a bit bad for not rising the point earlier and get him to v10
>>>>>
>>>>> I understand your point Hans, and when a vendor upstreaming code or a
>>>>> user requires to maintain compatibility, the burden of keeping more
>>>>> code in to handle the MC and non-MC cases is worth the complications.
>>>>
>>>> Eugen, can you provide a list of platforms that will break with this
>>>> change and which platforms are currently broken without this series?
>>
>> Hi Hans,
>>
>> Basically the sama5d2 platform (we have several versions of the chip :
>> sama5d21, sama5d27, sama5d29, in various packages, SIP, SoMs, on many
>> different boards ) would be broken. this is the old platform.
>> It would be broken if the sensor default format is a mismatch with the
>> default format of the ISC .  Basically the old code currently is
>> propagating all the frame information down to the sensor, thing that no
>> longer happens with this patch series.
>>
>> The platform that needs MC is mainly sama7g5 , which has a longer
>> pipeline, supports CSI2 bus, and has more drivers (the csi2dc is one of
>> them ), some are not mainlined.
>> Future platforms , which are currently in prototyping, have a similar
>> pipeline with sama7g5, some have more complicated pipelines, but they
>> include the ISC and we plan to use the same driver.
>>
>>>>
>>>> I'm trying to get a bit of a feel of the potential problems this change
>>>> will introduce.
>>>>
>>>>>
>>>>> But if even the vendor wants to move to MC to allow more use-cases I
>>>>> think we have to acknolege that if you're running mainline on an
>>>>> embedded system you could expect to adjust your setup between kernel
>>>>> updates. The idea to document the media-ctl commands required to setup
>>>>> the pipeline it's helpful, and might help in the interim period until
>>>>> the platform is not supported by libcamera.
>>>>
>>>> Well, I don't want Linus to start yelling at me for breaking userspace :-)
>>>>
>>>> We have broken userspace API (intentionally) in the past, but only with
>>>> good reasons. And sometimes a driver is used so rarely that it is not worth
>>>> the effort to try and keep compatible.
>>>>
>>>> As a developer I'd love to just forget about the old API, but as subsystem
>>>> maintainer I need good arguments.
>>>
>>> I understand and I think these are all valid concerns. Finding a
>>> balance between new features and legacy is not easy.
>>>
>>>>
>>>> Another option might be to take the TI cal approach, but have warnings that
>>>> it will be removed in, say, 2 years time. Or even make a copy of the driver
>>>> for the old platforms, and perhaps move that to staging to be removed eventually.
>>>>
>>>> The idea of a sudden breakage when going from kernel K to K+1 doesn't sit
>>>> well with me, if there was a transition period of 1-2 years then that would be
>>>> better.
>>>>
>>>
>>> If staging works for you that's probably the easiest option. Let's see
>>> what Eugen prefers!
>>
>> Hi Jacopo,
>>
>> How does the staging solution work ? I do not fully understand the
>> options here to make an educated choice
> 
> Hans should probably tell, but my interepetation would be to move the
> existing driver (before this series) to drivers/staging/ and advance
> the existing one in drivers/media/ to MC support.

Right. And strip the support for the newer platforms from the staging driver.
So it is just for sama5d2.

> 
> Users of the old driver interface could keep using the one in (de)staging
> for a little longer.
> 
> Would changing the driver KConfig symbol name help making the change
> more evident maybe ? Users that upgrade to a new kernel will be
> notified about the new symbol instead of being silently moved to the new
> interface.

I'm inclined to change the Kconfig symbol for both old and new drivers
if we decide to go in this direction: in both cases you need to be aware
that there are major changes: the new uses the MC API, the old is marked
deprecated and users should be aware that it will be removed eventually
and they should work to switch to the 'new' driver.

Regards,

	Hans

> 
> Thanks
>   j
> 
>>
>> Thanks for helping out,
>>
>> Eugen
>>
>>
>>>
>>>> Regards,
>>>>
>>>>        Hans
>>>>
>>>>>
>>>>> That said, if Eugen wants to give the flag a try I won't
>>>>> oppose :)
>>>>>
>>>>>
>>>>>> Regards,
>>>>>>
>>>>>>     Hans
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> media-ctl -d /dev/media0 --set-v4l2 '"imx219
>>>>>>>> 1-0010":0[fmt:SRGGB10_1X10/1920x1080]'
>>>>>>>> media-ctl -d /dev/media0 --set-v4l2
>>>>>>>> '"dw-csi.0":0[fmt:SRGGB10_1X10/1920x1080]'
>>>>>>>> media-ctl -d /dev/media0 --set-v4l2 '"csi2dc":0[fmt:SRGGB10_1X10/1920x1080]'
>>>>>>>> media-ctl -d /dev/media0 --set-v4l2
>>>>>>>> '"atmel_isc_scaler":0[fmt:SRGGB10_1X10/1920x1080]'
>>>>>>>>
>>>>>>>> Thank you for taking care of this !
>>>>>>>>
>>>>>>>> Eugen
>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>>
>>>>>>>>>            Hans
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Full series history:
>>>>>>>>>>
>>>>>>>>>> Changes in v10:
>>>>>>>>>> -> split the series into this first fixes part.
>>>>>>>>>> -> moved IO_MC addition from first patch to the second patch on the driver changes
>>>>>>>>>> -> edited commit messages
>>>>>>>>>> -> DT nodes now disabled by default.
>>>>>>>>>>
>>>>>>>>>> Changes in v9:
>>>>>>>>>> -> kernel robot reported isc_link_validate is not static, changed to static.
>>>>>>>>>>
>>>>>>>>>> Changes in v8:
>>>>>>>>>> -> scaler: modified crop bounds to have the exact source size
>>>>>>>>>>
>>>>>>>>>> Changes in v7:
>>>>>>>>>> -> scaler: modified crop bounds to have maximum isc size
>>>>>>>>>> -> format propagation: did small changes as per Jacopo review
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Changes in v6:
>>>>>>>>>> -> worked a bit on scaler, added try crop and other changes as per Jacopo review
>>>>>>>>>> -> worked on isc-base enum_fmt , reworked as per Jacopo review
>>>>>>>>>>
>>>>>>>>>> Changes in v5:
>>>>>>>>>> -> removed patch that removed the 'stop' variable as it was still required
>>>>>>>>>> -> added two new trivial patches
>>>>>>>>>> -> reworked some parts of the scaler and format propagation after discussions with Jacopo
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Changes in v4:
>>>>>>>>>> -> as reviewed by Hans, added new patch to remove the 'stop' variable and reworked
>>>>>>>>>> one patch that was using it
>>>>>>>>>> -> as reviewed by Jacopo, reworked some parts of the media controller implementation
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Changes in v3:
>>>>>>>>>> - change in bindings, small fixes in csi2dc driver and conversion to mc
>>>>>>>>>> for the isc-base.
>>>>>>>>>> - removed some MAINTAINERS patches and used patterns in MAINTAINERS
>>>>>>>>>>
>>>>>>>>>> Changes in v2:
>>>>>>>>>> - integrated many changes suggested by Jacopo in the review of the v1 series.
>>>>>>>>>> - add a few new patches
>>>>>>>>>>
>>>>>>>>>> Eugen Hristev (5):
>>>>>>>>>>      media: atmel: atmel-isc: prepare for media controller support
>>>>>>>>>>      media: atmel: atmel-isc: implement media controller
>>>>>>>>>>      ARM: dts: at91: sama7g5: add nodes for video capture
>>>>>>>>>>      ARM: configs: at91: sama7: add xisc and csi2dc
>>>>>>>>>>      ARM: multi_v7_defconfig: add atmel video pipeline modules
>>>>>>>>>>
>>>>>>>>>>     arch/arm/boot/dts/sama7g5.dtsi                |  51 ++
>>>>>>>>>>     arch/arm/configs/multi_v7_defconfig           |   3 +
>>>>>>>>>>     arch/arm/configs/sama7_defconfig              |   2 +
>>>>>>>>>>     drivers/media/platform/atmel/Makefile         |   2 +-
>>>>>>>>>>     drivers/media/platform/atmel/atmel-isc-base.c | 485 +++++++++---------
>>>>>>>>>>     .../media/platform/atmel/atmel-isc-scaler.c   | 267 ++++++++++
>>>>>>>>>>     drivers/media/platform/atmel/atmel-isc.h      |  50 +-
>>>>>>>>>>     .../media/platform/atmel/atmel-sama5d2-isc.c  |  34 +-
>>>>>>>>>>     .../media/platform/atmel/atmel-sama7g5-isc.c  |  32 +-
>>>>>>>>>>     9 files changed, 685 insertions(+), 241 deletions(-)
>>>>>>>>>>     create mode 100644 drivers/media/platform/atmel/atmel-isc-scaler.c
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>
>>

