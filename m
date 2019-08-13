Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99F258B882
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 14:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfHMMZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 08:25:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40848 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbfHMMZM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 08:25:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id B63E128A87E
Subject: Re: [PATCH 0/3] Collapse vimc into single monolithic driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        mchehab@kernel.org, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@collabora.com
References: <cover.1565386363.git.skhan@linuxfoundation.org>
 <3118bc46-14ac-8015-9a6c-a8dfcdcea940@collabora.com>
 <4e9b8eb3-23c5-62ea-07dc-b51acb238dee@linuxfoundation.org>
 <15badf5e-49fa-7fbe-de6b-296e9a7f5cd9@collabora.com>
 <e21d38a5-4fcd-7b02-f5f2-e445c280f769@collabora.com>
 <2ee23903-8e99-a0a0-619a-be5bdaa71802@linuxfoundation.org>
 <374574f2-0ecd-723a-4a66-c190332aaa04@collabora.com>
 <737dbfd4-8e86-289b-1827-736e3d6ffff5@linuxfoundation.org>
 <03b51b1e-3d78-72e6-3b3e-210b4411c897@linuxfoundation.org>
 <e81df4a5-2393-e341-258c-abf55babe519@collabora.com>
 <20190813095654.GA5009@pendragon.ideasonboard.com>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <a0fa05d7-5fc2-071a-f5ab-788662ecc6b2@collabora.com>
Date:   Tue, 13 Aug 2019 09:25:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190813095654.GA5009@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/13/19 6:56 AM, Laurent Pinchart wrote:
> Hi Helen,
> 
> On Mon, Aug 12, 2019 at 08:41:33PM -0300, Helen Koike wrote:
>> On 8/12/19 7:14 PM, Shuah Khan wrote:
>>> On 8/12/19 1:10 PM, Shuah Khan wrote:
>>>> On 8/12/19 12:52 PM, André Almeida wrote:
>>>>> On 8/12/19 11:08 AM, Shuah Khan wrote:
>>>>>> On 8/9/19 9:51 PM, Helen Koike wrote:
>>>>>>> On 8/9/19 9:24 PM, André Almeida wrote:
>>>>>>>> On 8/9/19 9:17 PM, Shuah Khan wrote:
>>>>>>>>> On 8/9/19 5:52 PM, André Almeida wrote:
>>>>>>>>>> On 8/9/19 6:45 PM, Shuah Khan wrote:
>>>>>>>>>>> vimc uses Component API to split the driver into functional
>>>>>>>>>>> components.
>>>>>>>>>>> The real hardware resembles a monolith structure than component and
>>>>>>>>>>> component structure added a level of complexity making it hard to
>>>>>>>>>>> maintain without adding any real benefit.
>>>>>>>>>>>        The sensor is one vimc component that would makes sense to be a
>>>>>>>>>>> separate
>>>>>>>>>>> module to closely align with the real hardware. It would be easier to
>>>>>>>>>>> collapse vimc into single monolithic driver first and then split the
>>>>>>>>>>> sensor off as a separate module.
>>>>>>>>>>>
>>>>>>>>>>> This patch series emoves the component API and makes minimal
>>>>>>>>>>> changes to
>>>>>>>>>>> the code base preserving the functional division of the code
>>>>>>>>>>> structure.
>>>>>>>>>>> Preserving the functional structure allows us to split the sensor off
>>>>>>>>>>> as a separate module in the future.
>>>>>>>>>>>
>>>>>>>>>>> Major design elements in this change are:
>>>>>>>>>>>        - Use existing struct vimc_ent_config and struct
>>>>>>>>>>> vimc_pipeline_config
>>>>>>>>>>>          to drive the initialization of the functional components.
>>>>>>>>>>>        - Make vimc_ent_config global by moving it to vimc.h
>>>>>>>>>>>        - Add two new hooks add and rm to initialize and register,
>>>>>>>>>>> unregister
>>>>>>>>>>>          and free subdevs.
>>>>>>>>>>>        - All component API is now gone and bind and unbind hooks are
>>>>>>>>>>> modified
>>>>>>>>>>>          to do "add" and "rm" with minimal changes to just add and rm
>>>>>>>>>>> subdevs.
>>>>>>>>>>>        - vimc-core's bind and unbind are now register and unregister.
>>>>>>>>>>>        - vimc-core invokes "add" hooks from its
>>>>>>>>>>> vimc_register_devices().
>>>>>>>>>>>          The "add" hooks remain the same and register subdevs. They
>>>>>>>>>>> don't
>>>>>>>>>>>          create platform devices of their own and use vimc's
>>>>>>>>>>> pdev.dev as
>>>>>>>>>>>          their reference device. The "add" hooks save their
>>>>>>>>>>> vimc_ent_device(s)
>>>>>>>>>>>          in the corresponding vimc_ent_config.
>>>>>>>>>>>        - vimc-core invokes "rm" hooks from its unregister to
>>>>>>>>>>> unregister
>>>>>>>>>>> subdevs
>>>>>>>>>>>          and cleanup.
>>>>>>>>>>>        - vimc-core invokes "add" and "rm" hooks with pointer to struct
>>>>>>>>>>> vimc_device
>>>>>>>>>>>          and the corresponding struct vimc_ent_config pointer.
>>>>>>>>>>>        The following configure and stream test works on all devices.
>>>>>>>>>>>             media-ctl -d platform:vimc -V '"Sensor
>>>>>>>>>>> A":0[fmt:SBGGR8_1X8/640x480]'
>>>>>>>>>>>        media-ctl -d platform:vimc -V '"Debayer
>>>>>>>>>>> A":0[fmt:SBGGR8_1X8/640x480]'
>>>>>>>>>>>        media-ctl -d platform:vimc -V '"Sensor
>>>>>>>>>>> B":0[fmt:SBGGR8_1X8/640x480]'
>>>>>>>>>>>        media-ctl -d platform:vimc -V '"Debayer
>>>>>>>>>>> B":0[fmt:SBGGR8_1X8/640x480]'
>>>>>>>>>>>             v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v
>>>>>>>>>>> width=1920,height=1440
>>>>>>>>>>>        v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v
>>>>>>>>>>> pixelformat=BA81
>>>>>>>>>>>        v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v
>>>>>>>>>>> pixelformat=BA81
>>>>>>>>>>>             v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video1
>>>>>>>>>>>        v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
>>>>>>>>>>>        v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video3
>>>>>>>>>>>
>>>>>>>>>>> The third patch in the series fixes a general protection fault found
>>>>>>>>>>> when rmmod is done while stream is active.
>>>>>>>>>>
>>>>>>>>>> I applied your patch on top of media_tree/master and I did some
>>>>>>>>>> testing.
>>>>>>>>>> Not sure if I did something wrong, but just adding and removing the
>>>>>>>>>> module generated a kernel panic:
>>>>>>>>>
>>>>>>>>> Thanks for testing.
>>>>>>>>>
>>>>>>>>> Odd. I tested modprobe and rmmod both.I was working on Linux 5.3-rc2.
>>>>>>>>> I will apply these to media latest and work from there. I have to
>>>>>>>>> rebase these on top of the reverts from Lucas and Helen
>>>>>>>>
>>>>>>>> Ok, please let me know if I succeeded to reproduce.
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> ~# modprobe vimc
>>>>>>>>>> ~# rmmod vimc
>>>>>>>>>> [   16.452974] stack segment: 0000 [#1] SMP PTI
>>>>>>>>>> [   16.453688] CPU: 0 PID: 2038 Comm: rmmod Not tainted 5.3.0-rc2+ #36
>>>>>>>>>> [   16.454678] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
>>>>>>>>>> BIOS 1.12.0-20181126_142135-anatol 04/01/2014
>>>>>>>>>> [   16.456191] RIP: 0010:kfree+0x4d/0x240
>>>>>>>>>>
>>>>>>>>>> <registers values...>
>>>>>>>>>>
>>>>>>>>>> [   16.469188] Call Trace:
>>>>>>>>>> [   16.469666]  vimc_remove+0x35/0x90 [vimc]
>>>>>>>>>> [   16.470436]  platform_drv_remove+0x1f/0x40
>>>>>>>>>> [   16.471233]  device_release_driver_internal+0xd3/0x1b0
>>>>>>>>>> [   16.472184]  driver_detach+0x37/0x6b
>>>>>>>>>> [   16.472882]  bus_remove_driver+0x50/0xc1
>>>>>>>>>> [   16.473569]  vimc_exit+0xc/0xca0 [vimc]
>>>>>>>>>> [   16.474231]  __x64_sys_delete_module+0x18d/0x240
>>>>>>>>>> [   16.475036]  do_syscall_64+0x43/0x110
>>>>>>>>>> [   16.475656]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>>>>>>>> [   16.476504] RIP: 0033:0x7fceb8dafa4b
>>>>>>>>>>
>>>>>>>>>> <registers values...>
>>>>>>>>>>
>>>>>>>>>> [   16.484853] Modules linked in: vimc(-) videobuf2_vmalloc
>>>>>>>>>> videobuf2_memops v4l2_tpg videobuf2_v4l2 videobuf2_common
>>>>>>>>>> [   16.486187] ---[ end trace 91e5e0894e254d49 ]---
>>>>>>>>>> [   16.486758] RIP: 0010:kfree+0x4d/0x240
>>>>>>>>>>
>>>>>>>>>> <registers values...>
>>>>>>>>>>
>>>>>>>>>> fish: “rmmod vimc” terminated by signal SIGSEGV (Address boundary
>>>>>>>>>> error)
>>>>>>>>>>
>>>>>>>>>> I just added the module after booting, no other action was made.
>>>>>>>>>> Here is
>>>>>>>>>> how my `git log --oneline` looks like:
>>>>>>>>>>
>>>>>>>>>> 897d708e922b media: vimc: Fix gpf in rmmod path when stream is active
>>>>>>>>>> 2e4a5ad8ad6d media: vimc: Collapse component structure into a single
>>>>>>>>>> monolithic driver
>>>>>>>>>> 7c8da1687e92 media: vimc: move private defines to a common header
>>>>>>>>>> 97299a303532 media: Remove dev_err() usage after platform_get_irq()
>>>>>>>>>> 25a3d6bac6b9 media: adv7511/cobalt: rename driver name to adv7511-v4l2
>>>>>>>
>>>>>>> I couldn't reproduce the error, my tree looks the same:
>>>>>>>
>>>>>>> [I] koike@floko ~/m/o/linux> git log --oneline
>>>>>>> e3345155c8ed (HEAD) media: vimc: Fix gpf in rmmod path when stream is
>>>>>>> active
>>>>>>> 43e9e2fe761f media: vimc: Collapse component structure into a single
>>>>>>> monolithic driver
>>>>>>> 8a6d0b9adde0 media: vimc: move private defines to a common header
>>>>>>> 97299a303532 (media/master) media: Remove dev_err() usage after
>>>>>>> platform_get_irq()
>>>>>>> 25a3d6bac6b9 media: adv7511/cobalt: rename driver name to adv7511-v4l2
>>>>>>
>>>>>> Thanks Helen for trying to reproduce and sharing the result.
>>>>>
>>>>> Me and Helen found out what is the problem. If you follow this call trace:
>>>>>
>>>>> vimc_ent_sd_unregister()
>>>>> v4l2_device_unregister_subdev()
>>>>> v4l2_subdev_release()
>>>>>
>>>>> You'll notice that this last function calls the `release` callback
>>>>> implementation of the subdevice. For instance, the `release` of
>>>>> vimc-sensor is this one:
>>>>>
>>>>> static void vimc_sen_release(struct v4l2_subdev *sd)
>>>>> {
>>>>>     struct vimc_sen_device *vsen =
>>>>>                 container_of(sd, struct vimc_sen_device, sd);
>>>>>
>>>>>     v4l2_ctrl_handler_free(&vsen->hdl);
>>>>>     tpg_free(&vsen->tpg);
>>>>>     kfree(vsen);
>>>>> }
>>>>>
>>>>> And then you can see that `vsen` has been freed. Back to
>>>>> vimc_ent_sd_unregister(), after v4l2_device_unregister_subdev(), the
>>>>> function will call vimc_pads_cleanup(). This is basically a
>>>>> kfree(ved->pads), but `ved` has just been freed at
>>>>> v4l2_subdev_release(), producing a memory fault.
>>>>>
>>>>> To fix that, we found two options:
>>>>>
>>>>> - place the kfree(ved->pads) inside the release callback of each
>>>>> subdevice and removing vimc_pads_cleanup() from
>>>>> vimc_ent_sd_unregister()
>>>>> - use a auxiliary variable to hold the address of the pads, for instance:
>>>>>
>>>>> void vimc_ent_sd_unregister(...)
>>>>> {
>>>>>      struct media_pad *pads = ved->pads;
>>>>>      ...
>>>>>      vimc_pads_cleanup(pads);
>>>>> }
>>>>>
>>>>>
>>>>
>>>> I fixed a problem in the thirds patch. vimc-capture uses the first
>>>> approach - placing the kfree(ved->pads) inside the release callback.
>>>>
>>>> I am debugging another such problem in unbind path while streaming.
>>>> I am working on v2 and I will look for the rmmod problem and fix it.
>>>>
>>>> thanks again for testing and finding the root cause.
>>>> -- Shuah
>>>
>>> Hi Andre,
>>>
>>> Here is what's happening.
>>>
>>> Before this change, you can't really do rmmod vimc, because vimc is in
>>> use by other component drivers. With the collapse, now you can actually
>>> do rmmod on vimc and this problem in vimc_ent_sd_unregister() that frees
>>> pads first and the does v4l2_device_unregister_subdev().
>>>
>>> I fixed this in the 3/3 patch. I can reproduce the problem with patches 1 and 2, and patch 3 fixes it.
>>>
>>> Did you test with the third patch in this series?
>>
>> yes, we tested with 3/3, but the new problem now is when doing the following
>> in this order:
>>
>>     v4l2_device_unregister_subdev(sd);
>>     vimc_pads_cleanup(ved->pads);
>>
>>
>> v4l2_device_unregister_subdev() calls the release function of the subdevice that
>> frees the ved object, so ved->pads is not valid anymore. That is why André suggested
>> a temporary variable to hold ved->pads and to be able to free it later:
>>
>>     struct media_pad *pads = ved->pads;
>>
>>     v4l2_device_unregister_subdev(sd);
>>     vimc_pads_cleanup(pads); // So we don't use the ved object here anymore.
> 
> Can't you simply call vimc_pads_cleanup() in the release function of the
> subdevice before freeing the ved object ?
> 

Yes we can, that is the other option Andre suggested.
The  advantage of doing it inside vimc_ent_sd_unregister() is that
who allocated the memory in the first place was vimc_ent_sd_register(), and also,
this is a common code to all subdevs, so letting it in vimc_ent_sd_unregister()
will make sure no subdevs ever forget to free this memory.
But saving the pointer to a variable to free it later is not that pretty
either.

Helen
