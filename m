Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7981A98DB
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 11:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895494AbgDOJ2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 05:28:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54692 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895493AbgDOJ2q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 05:28:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 86D772A1970
Subject: Re: media/master bisection: v4l2-compliance-vivid.device-presence on
 qemu_x86_64
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <5e960bf5.1c69fb81.8a349.6851@mx.google.com>
 <24564393-f229-6e29-7883-9605ed0d48b4@collabora.com>
 <20200414233347.2a844b85@coco.lan>
 <86feeb83-37ac-cbd6-b792-b81d17d559c9@collabora.com>
Message-ID: <2f32345d-a818-8ec4-afd6-2b9cd9dcdf4a@collabora.com>
Date:   Wed, 15 Apr 2020 10:28:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <86feeb83-37ac-cbd6-b792-b81d17d559c9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/04/2020 22:43, Guillaume Tucker wrote:
> On 14/04/2020 22:33, Mauro Carvalho Chehab wrote:
>> Em Tue, 14 Apr 2020 22:23:52 +0100
>> Guillaume Tucker <guillaume.tucker@collabora.com> escreveu:
>>
>>> Please see the bisection report below about absence of the vivid
>>> driver, which caused v4l2-compliance to fail to run.
>>>
>>> Presumably we need to update the configuration fragment used by
>>> kernelci.org to enable platform drivers.  Until now we've been
>>> using this:
>>>
>>>     CONFIG_MEDIA_SUPPORT=y
>>>     CONFIG_MEDIA_CAMERA_SUPPORT=y
>>>     CONFIG_VIDEO_DEV=y
>>>     CONFIG_VIDEO_V4L2=y
>>>     CONFIG_V4L_TEST_DRIVERS=y
>>>     CONFIG_VIDEO_VIVID=y
>>>     CONFIG_VIDEO_VIVID_MAX_DEVS=64
>>>
>>> Do we simply need to add this one in v5.7 onwards?
>>>
>>>     CONFIG_MEDIA_PLATFORM_SUPPORT=y
>>
>> No, this shouldn't be needed.
>>
>> Helen sent us a patch that should likely fix it:
>>
>> 	https://git.linuxtv.org/media_tree.git/commit/?id=860b511766a3d95308a942ac09a34e4d1839e706
>>
>> Could you please check if this solves the issue?
> 
> I see, thanks.  This revision is being built and tested at the
> moment, I'll check the results when they land in my inbox.

Helen's patch was needed, but there were still a couple of
issues.  First we need to enable this extra option now in the
config fragment:

    CONFIG_MEDIA_TEST_SUPPORT=y

as test_drivers/Kconfig starts with "if MEDIA_TEST_SUPPORT".

Then this Kconfig was included when MEDIA_PLATFORM_SUPPORT was
enabled rather than MEDIA_TEST_SUPPORT in media/Kconfig.  So I've
just sent a patch to fix this dependency, and now it appears to
be generating the correct config.  I did a full v4l2-compliance
run with the vivid driver on my local setup and it all passed.

Guillaume

>>> On 14/04/2020 20:16, kernelci.org bot wrote:
>>>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>>> * This automated bisection report was sent to you on the basis  *
>>>> * that you may be involved with the breaking commit it has      *
>>>> * found.  No manual investigation has been done to verify it,   *
>>>> * and the root cause of the problem may be somewhere else.      *
>>>> *                                                               *
>>>> * If you do send a fix, please include this trailer:            *
>>>> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
>>>> *                                                               *
>>>> * Hope this helps!                                              *
>>>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>>>
>>>> media/master bisection: v4l2-compliance-vivid.device-presence on qemu_x86_64
>>>>
>>>> Summary:
>>>>   Start:      ba445b7ff43b3 media: dt-bindings: rockchip-vpu: Convert bindings to json-schema
>>>>   Plain log:  https://storage.kernelci.org//media/master/v5.7-rc1-63-gba445b7ff43b/x86_64/x86_64_defconfig+virtualvideo/gcc-8/lab-collabora/v4l2-compliance-vivid-qemu_x86_64.txt
>>>>   HTML log:   https://storage.kernelci.org//media/master/v5.7-rc1-63-gba445b7ff43b/x86_64/x86_64_defconfig+virtualvideo/gcc-8/lab-collabora/v4l2-compliance-vivid-qemu_x86_64.html
>>>>   Result:     06b93644f4d10 media: Kconfig: add an option to filter in/out platform drivers
>>>>
>>>> Checks:
>>>>   revert:     PASS
>>>>   verify:     PASS
>>>>
>>>> Parameters:
>>>>   Tree:       media
>>>>   URL:        https://git.linuxtv.org/media_tree.git
>>>>   Branch:     master
>>>>   Target:     qemu_x86_64
>>>>   CPU arch:   x86_64
>>>>   Lab:        lab-collabora
>>>>   Compiler:   gcc-8
>>>>   Config:     x86_64_defconfig+virtualvideo
>>>>   Test case:  v4l2-compliance-vivid.device-presence
>>>>
>>>> Breaking commit found:
>>>>
>>>> -------------------------------------------------------------------------------
>>>> commit 06b93644f4d102bdfc297159121acc1de794d68d
>>>> Author: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>>> Date:   Tue Mar 24 10:27:15 2020 +0100
>>>>
>>>>     media: Kconfig: add an option to filter in/out platform drivers
>>>>     
>>>>     Most systems don't need support for those, while others only
>>>>     need those, instead of the others.
>>>>     
>>>>     So, add an option to filter in/out platform drivers.
>>>>     
>>>>     Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>>>
>>>> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
>>>> index 9dfea5c4b6ab7..2b6ea8beb9199 100644
>>>> --- a/drivers/media/Kconfig
>>>> +++ b/drivers/media/Kconfig
>>>> @@ -87,6 +87,18 @@ config MEDIA_CEC_SUPPORT
>>>>  	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
>>>>  	  adapter that supports HDMI CEC.
>>>>  
>>>> +config MEDIA_PLATFORM_SUPPORT
>>>> +	bool "Platform-specific devices support"
>>>> +	help
>>>> +	  Enable support for complex cameras, codecs, and other hardware
>>>> +	  that are integrated at the CPU, GPU or on Image Signalling Processor
>>>> +	  and don't use PCI, USB or Firewire buses.
>>>> +
>>>> +	  This is found on Embedded hardware (SoC), on V4L2 codecs and
>>>> +	  on some GPU and newer CPU chipsets.
>>>> +
>>>> +	  Say Y when you want to be able so see such devices.
>>>> +
>>>>  source "drivers/media/cec/Kconfig"
>>>>  
>>>>  source "drivers/media/mc/Kconfig"
>>>> @@ -161,15 +173,14 @@ source "drivers/media/dvb-core/Kconfig"
>>>>  
>>>>  comment "Media drivers"
>>>>  
>>>> -#
>>>> -# V4L platform/mem2mem drivers
>>>> -#
>>>> -
>>>>  source "drivers/media/usb/Kconfig"
>>>>  source "drivers/media/pci/Kconfig"
>>>> +source "drivers/media/radio/Kconfig"
>>>> +
>>>> +if MEDIA_PLATFORM_SUPPORT
>>>>  source "drivers/media/platform/Kconfig"
>>>>  source "drivers/media/mmc/Kconfig"
>>>> -source "drivers/media/radio/Kconfig"
>>>> +endif
>>>>  
>>>>  comment "Supported FireWire (IEEE 1394) Adapters"
>>>>  	depends on DVB_CORE && FIREWIRE
>>>> -------------------------------------------------------------------------------
>>>>
>>>>
>>>> Git bisection log:
>>>>
>>>> -------------------------------------------------------------------------------
>>>> git bisect start
>>>> # good: [2632e7b618a7730969f9782593c29ca53553aa22] media: venus: firmware: Ignore secure call error on first resume
>>>> git bisect good 2632e7b618a7730969f9782593c29ca53553aa22
>>>> # bad: [ba445b7ff43b3e45836a9a290efdc3a36ea63941] media: dt-bindings: rockchip-vpu: Convert bindings to json-schema
>>>> git bisect bad ba445b7ff43b3e45836a9a290efdc3a36ea63941
>>>> # good: [29d9f30d4ce6c7a38745a54a8cddface10013490] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
>>>> git bisect good 29d9f30d4ce6c7a38745a54a8cddface10013490
>>>> # good: [e109f506074152b7241bcbd3949a099e776cb802] Merge tag 'mtd/for-5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
>>>> git bisect good e109f506074152b7241bcbd3949a099e776cb802
>>>> # good: [aa1a8ce533324d12696a9f4b71dbc5eb561a2e04] Merge tag 'trace-v5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace
>>>> git bisect good aa1a8ce533324d12696a9f4b71dbc5eb561a2e04
>>>> # good: [c7b6a566b98524baea6a244186e665d22b633545] mm/gup: Mark lock taken only after a successful retake
>>>> git bisect good c7b6a566b98524baea6a244186e665d22b633545
>>>> # good: [e4da01d8333e500e15a674d75885a9dfcfd31e77] Merge tag 'powerpc-5.7-2' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
>>>> git bisect good e4da01d8333e500e15a674d75885a9dfcfd31e77
>>>> # good: [6900433e0fbca146d8170bdf876271cdf3053021] Merge tag 'for-linus-5.7-1' of git://github.com/cminyard/linux-ipmi
>>>> git bisect good 6900433e0fbca146d8170bdf876271cdf3053021
>>>> # good: [b753101a4ac0b906064a72feec43f5b80a1fe2e5] Merge tag 'kbuild-v5.7-2' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
>>>> git bisect good b753101a4ac0b906064a72feec43f5b80a1fe2e5
>>>> # bad: [4b32216adb010a364f23a055c45e06e839b089f9] media: split test drivers from platform directory
>>>> git bisect bad 4b32216adb010a364f23a055c45e06e839b089f9
>>>> # good: [20e2aa812620439d010a3f78ba4e05bc0b3e2861] Merge tag 'perf-urgent-2020-04-12' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>>> git bisect good 20e2aa812620439d010a3f78ba4e05bc0b3e2861
>>>> # good: [0785249f8b93836986e9d1bdeefd2a2c13f160af] Merge tag 'timers-urgent-2020-04-12' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>>> git bisect good 0785249f8b93836986e9d1bdeefd2a2c13f160af
>>>> # good: [3b50142d8528e1efc1c07f69c540f926c58ab3ad] MAINTAINERS: sort field names for all entries
>>>> git bisect good 3b50142d8528e1efc1c07f69c540f926c58ab3ad
>>>> # bad: [06b93644f4d102bdfc297159121acc1de794d68d] media: Kconfig: add an option to filter in/out platform drivers
>>>> git bisect bad 06b93644f4d102bdfc297159121acc1de794d68d
>>>> # good: [d9d6e1f3d5bbca799910072b2110963250e0b9c6] media: dvb-usb: auto-select CYPRESS_FIRMWARE
>>>> git bisect good d9d6e1f3d5bbca799910072b2110963250e0b9c6
>>>> # first bad commit: [06b93644f4d102bdfc297159121acc1de794d68d] media: Kconfig: add an option to filter in/out platform drivers
>>>> -------------------------------------------------------------------------------
>>>>   
>>>
>>
>>
>>
>> Thanks,
>> Mauro
>>
> 

