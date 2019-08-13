Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094878AC51
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 02:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfHMA6S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 20:58:18 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33078 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbfHMA6R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 20:58:17 -0400
Received: by mail-ot1-f68.google.com with SMTP id q20so13312840otl.0
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2019 17:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/TVFV6h/MTwgQn3BV9VrjLAqLmGMar/dlkAaMEKXlKQ=;
        b=T3feM/O8ZtOvtgN/461pZIJ3YETGNSD0fxLuH9244x2EhwVrf1svdwr5idG+40XSI3
         EjSWVhdlM5J71Xwbc7j898HTFM4QWXEPSSXwcCymt98/BlB04EO3bZ6jtauGbu67hzvr
         XzS1xCaZ2bJZuSUBnj4ydwA7iFSTzRMlrswKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/TVFV6h/MTwgQn3BV9VrjLAqLmGMar/dlkAaMEKXlKQ=;
        b=WGkRzaHfD6ryM7hmlbzPzdczal6xM1s+oiSD87JnGjG/oXc82gO6c7vahriiCz3Dju
         HWIMLRZvCANQ757QJvDSLQVLSPOmdnY71lzSE2NNE0MgR3l+TopZh3jj6TFGBz5DBFME
         gfL7BnJDKHk9RCprblBqSfjb9ZY+yepo5J+0iyf38NgJ3RwuTZn1wV7xNlXAu4A8bSCH
         4XkZm6QpUtUW/pXm1OkJ6WhDzFzOoXcVDARS9JL2ABGD168AUsBCxcDJgScYWfhaPxXp
         DICITlDIQDh11wNbWFNzeMsVYv8JI4wM+9bhV2kl1hI/VE6/2+zbpAs93IQmGAqCVNzS
         pfCA==
X-Gm-Message-State: APjAAAX1WAZTSJ/Z1Yx3u/1ASL7w2bmKWGkzcNUxEi4rhWD1zUw1fPBq
        1ijNz7Vq27cQDfi/ounp84s7Lg==
X-Google-Smtp-Source: APXvYqxj9IpanuXuSUhwWr1EnhL7ihEx4LyvdBR/jfAG4rRR2hasbp07GABnfovyyu9zEJEqel3hFA==
X-Received: by 2002:a5d:964d:: with SMTP id d13mr38258588ios.224.1565657895812;
        Mon, 12 Aug 2019 17:58:15 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v13sm9293566iol.60.2019.08.12.17.58.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 17:58:14 -0700 (PDT)
Subject: Re: [PATCH 0/3] Collapse vimc into single monolithic driver
To:     Helen Koike <helen.koike@collabora.com>,
        =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@collabora.com,
        "skha >> Shuah Khan" <skhan@linuxfoundation.org>
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
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1a7273b0-127b-54cf-269b-cb1908c8af23@linuxfoundation.org>
Date:   Mon, 12 Aug 2019 18:58:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e81df4a5-2393-e341-258c-abf55babe519@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/12/19 5:41 PM, Helen Koike wrote:
> Hi Shuah,
> 
> On 8/12/19 7:14 PM, Shuah Khan wrote:
>> On 8/12/19 1:10 PM, Shuah Khan wrote:
>>> On 8/12/19 12:52 PM, André Almeida wrote:
>>>> Hi Shuah,
>>>>
>>>> On 8/12/19 11:08 AM, Shuah Khan wrote:
>>>>> On 8/9/19 9:51 PM, Helen Koike wrote:
>>>>>> Hi Andre,
>>>>>>
>>>>>> Thanks for testing this.
>>>>>>
>>>>>> On 8/9/19 9:24 PM, André Almeida wrote:
>>>>>>> On 8/9/19 9:17 PM, Shuah Khan wrote:
>>>>>>>> Hi Andre,
>>>>>>>>
>>>>>>>> On 8/9/19 5:52 PM, André Almeida wrote:
>>>>>>>>> Hello Shuah,
>>>>>>>>>
>>>>>>>>> Thanks for the patch, I did some comments below.
>>>>>>>>>
>>>>>>>>> On 8/9/19 6:45 PM, Shuah Khan wrote:
>>>>>>>>>> vimc uses Component API to split the driver into functional
>>>>>>>>>> components.
>>>>>>>>>> The real hardware resembles a monolith structure than component and
>>>>>>>>>> component structure added a level of complexity making it hard to
>>>>>>>>>> maintain without adding any real benefit.
>>>>>>>>>>         The sensor is one vimc component that would makes sense to be a
>>>>>>>>>> separate
>>>>>>>>>> module to closely align with the real hardware. It would be easier to
>>>>>>>>>> collapse vimc into single monolithic driver first and then split the
>>>>>>>>>> sensor off as a separate module.
>>>>>>>>>>
>>>>>>>>>> This patch series emoves the component API and makes minimal
>>>>>>>>>> changes to
>>>>>>>>>> the code base preserving the functional division of the code
>>>>>>>>>> structure.
>>>>>>>>>> Preserving the functional structure allows us to split the sensor off
>>>>>>>>>> as a separate module in the future.
>>>>>>>>>>
>>>>>>>>>> Major design elements in this change are:
>>>>>>>>>>         - Use existing struct vimc_ent_config and struct
>>>>>>>>>> vimc_pipeline_config
>>>>>>>>>>           to drive the initialization of the functional components.
>>>>>>>>>>         - Make vimc_ent_config global by moving it to vimc.h
>>>>>>>>>>         - Add two new hooks add and rm to initialize and register,
>>>>>>>>>> unregister
>>>>>>>>>>           and free subdevs.
>>>>>>>>>>         - All component API is now gone and bind and unbind hooks are
>>>>>>>>>> modified
>>>>>>>>>>           to do "add" and "rm" with minimal changes to just add and rm
>>>>>>>>>> subdevs.
>>>>>>>>>>         - vimc-core's bind and unbind are now register and unregister.
>>>>>>>>>>         - vimc-core invokes "add" hooks from its
>>>>>>>>>> vimc_register_devices().
>>>>>>>>>>           The "add" hooks remain the same and register subdevs. They
>>>>>>>>>> don't
>>>>>>>>>>           create platform devices of their own and use vimc's
>>>>>>>>>> pdev.dev as
>>>>>>>>>>           their reference device. The "add" hooks save their
>>>>>>>>>> vimc_ent_device(s)
>>>>>>>>>>           in the corresponding vimc_ent_config.
>>>>>>>>>>         - vimc-core invokes "rm" hooks from its unregister to
>>>>>>>>>> unregister
>>>>>>>>>> subdevs
>>>>>>>>>>           and cleanup.
>>>>>>>>>>         - vimc-core invokes "add" and "rm" hooks with pointer to struct
>>>>>>>>>> vimc_device
>>>>>>>>>>           and the corresponding struct vimc_ent_config pointer.
>>>>>>>>>>         The following configure and stream test works on all devices.
>>>>>>>>>>              media-ctl -d platform:vimc -V '"Sensor
>>>>>>>>>> A":0[fmt:SBGGR8_1X8/640x480]'
>>>>>>>>>>         media-ctl -d platform:vimc -V '"Debayer
>>>>>>>>>> A":0[fmt:SBGGR8_1X8/640x480]'
>>>>>>>>>>         media-ctl -d platform:vimc -V '"Sensor
>>>>>>>>>> B":0[fmt:SBGGR8_1X8/640x480]'
>>>>>>>>>>         media-ctl -d platform:vimc -V '"Debayer
>>>>>>>>>> B":0[fmt:SBGGR8_1X8/640x480]'
>>>>>>>>>>              v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v
>>>>>>>>>> width=1920,height=1440
>>>>>>>>>>         v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v
>>>>>>>>>> pixelformat=BA81
>>>>>>>>>>         v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v
>>>>>>>>>> pixelformat=BA81
>>>>>>>>>>              v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video1
>>>>>>>>>>         v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
>>>>>>>>>>         v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video3
>>>>>>>>>>
>>>>>>>>>> The third patch in the series fixes a general protection fault found
>>>>>>>>>> when rmmod is done while stream is active.
>>>>>>>>>
>>>>>>>>> I applied your patch on top of media_tree/master and I did some
>>>>>>>>> testing.
>>>>>>>>> Not sure if I did something wrong, but just adding and removing the
>>>>>>>>> module generated a kernel panic:
>>>>>>>>
>>>>>>>> Thanks for testing.
>>>>>>>>
>>>>>>>> Odd. I tested modprobe and rmmod both.I was working on Linux 5.3-rc2.
>>>>>>>> I will apply these to media latest and work from there. I have to
>>>>>>>> rebase these on top of the reverts from Lucas and Helen
>>>>>>>
>>>>>>> Ok, please let me know if I succeeded to reproduce.
>>>>>>>
>>>>>>>>>
>>>>>>>>> ~# modprobe vimc
>>>>>>>>> ~# rmmod vimc
>>>>>>>>> [   16.452974] stack segment: 0000 [#1] SMP PTI
>>>>>>>>> [   16.453688] CPU: 0 PID: 2038 Comm: rmmod Not tainted 5.3.0-rc2+ #36
>>>>>>>>> [   16.454678] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
>>>>>>>>> BIOS 1.12.0-20181126_142135-anatol 04/01/2014
>>>>>>>>> [   16.456191] RIP: 0010:kfree+0x4d/0x240
>>>>>>>>>
>>>>>>>>> <registers values...>
>>>>>>>>>
>>>>>>>>> [   16.469188] Call Trace:
>>>>>>>>> [   16.469666]  vimc_remove+0x35/0x90 [vimc]
>>>>>>>>> [   16.470436]  platform_drv_remove+0x1f/0x40
>>>>>>>>> [   16.471233]  device_release_driver_internal+0xd3/0x1b0
>>>>>>>>> [   16.472184]  driver_detach+0x37/0x6b
>>>>>>>>> [   16.472882]  bus_remove_driver+0x50/0xc1
>>>>>>>>> [   16.473569]  vimc_exit+0xc/0xca0 [vimc]
>>>>>>>>> [   16.474231]  __x64_sys_delete_module+0x18d/0x240
>>>>>>>>> [   16.475036]  do_syscall_64+0x43/0x110
>>>>>>>>> [   16.475656]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>>>>>>> [   16.476504] RIP: 0033:0x7fceb8dafa4b
>>>>>>>>>
>>>>>>>>> <registers values...>
>>>>>>>>>
>>>>>>>>> [   16.484853] Modules linked in: vimc(-) videobuf2_vmalloc
>>>>>>>>> videobuf2_memops v4l2_tpg videobuf2_v4l2 videobuf2_common
>>>>>>>>> [   16.486187] ---[ end trace 91e5e0894e254d49 ]---
>>>>>>>>> [   16.486758] RIP: 0010:kfree+0x4d/0x240
>>>>>>>>>
>>>>>>>>> <registers values...>
>>>>>>>>>
>>>>>>>>> fish: “rmmod vimc” terminated by signal SIGSEGV (Address boundary
>>>>>>>>> error)
>>>>>>>>>
>>>>>>>>> I just added the module after booting, no other action was made.
>>>>>>>>> Here is
>>>>>>>>> how my `git log --oneline` looks like:
>>>>>>>>>
>>>>>>>>> 897d708e922b media: vimc: Fix gpf in rmmod path when stream is active
>>>>>>>>> 2e4a5ad8ad6d media: vimc: Collapse component structure into a single
>>>>>>>>> monolithic driver
>>>>>>>>> 7c8da1687e92 media: vimc: move private defines to a common header
>>>>>>>>> 97299a303532 media: Remove dev_err() usage after platform_get_irq()
>>>>>>>>> 25a3d6bac6b9 media: adv7511/cobalt: rename driver name to adv7511-v4l2
>>>>>>
>>>>>> I couldn't reproduce the error, my tree looks the same:
>>>>>>
>>>>>> [I] koike@floko ~/m/o/linux> git log --oneline
>>>>>> e3345155c8ed (HEAD) media: vimc: Fix gpf in rmmod path when stream is
>>>>>> active
>>>>>> 43e9e2fe761f media: vimc: Collapse component structure into a single
>>>>>> monolithic driver
>>>>>> 8a6d0b9adde0 media: vimc: move private defines to a common header
>>>>>> 97299a303532 (media/master) media: Remove dev_err() usage after
>>>>>> platform_get_irq()
>>>>>> 25a3d6bac6b9 media: adv7511/cobalt: rename driver name to adv7511-v4l2
>>>>>
>>>>> Thanks Helen for trying to reproduce and sharing the result.
>>>>
>>>> Me and Helen found out what is the problem. If you follow this call trace:
>>>>
>>>> vimc_ent_sd_unregister()
>>>> v4l2_device_unregister_subdev()
>>>> v4l2_subdev_release()
>>>>
>>>> You'll notice that this last function calls the `release` callback
>>>> implementation of the subdevice. For instance, the `release` of
>>>> vimc-sensor is this one:
>>>>
>>>> static void vimc_sen_release(struct v4l2_subdev *sd)
>>>> {
>>>>      struct vimc_sen_device *vsen =
>>>>                  container_of(sd, struct vimc_sen_device, sd);
>>>>
>>>>      v4l2_ctrl_handler_free(&vsen->hdl);
>>>>      tpg_free(&vsen->tpg);
>>>>      kfree(vsen);
>>>> }
>>>>
>>>> And then you can see that `vsen` has been freed. Back to
>>>> vimc_ent_sd_unregister(), after v4l2_device_unregister_subdev(), the
>>>> function will call vimc_pads_cleanup(). This is basically a
>>>> kfree(ved->pads), but `ved` has just been freed at
>>>> v4l2_subdev_release(), producing a memory fault.
>>>>
>>>> To fix that, we found two options:
>>>>
>>>> - place the kfree(ved->pads) inside the release callback of each
>>>> subdevice and removing vimc_pads_cleanup() from
>>>> vimc_ent_sd_unregister()
>>>> - use a auxiliary variable to hold the address of the pads, for instance:
>>>>
>>>> void vimc_ent_sd_unregister(...)
>>>> {
>>>>       struct media_pad *pads = ved->pads;
>>>>       ...
>>>>       vimc_pads_cleanup(pads);
>>>> }
>>>>
>>>>
>>>
>>> I fixed a problem in the thirds patch. vimc-capture uses the first
>>> approach - placing the kfree(ved->pads) inside the release callback.
>>>
>>> I am debugging another such problem in unbind path while streaming.
>>> I am working on v2 and I will look for the rmmod problem and fix it.
>>>
>>> thanks again for testing and finding the root cause.
>>> -- Shuah
>>
>> Hi Andre,
>>
>> Here is what's happening.
>>
>> Before this change, you can't really do rmmod vimc, because vimc is in
>> use by other component drivers. With the collapse, now you can actually
>> do rmmod on vimc and this problem in vimc_ent_sd_unregister() that frees
>> pads first and the does v4l2_device_unregister_subdev().
>>
>> I fixed this in the 3/3 patch. I can reproduce the problem with patches 1 and 2, and patch 3 fixes it.
>>
>> Did you test with the third patch in this series?
> 
> yes, we tested with 3/3, but the new problem now is when doing the following
> in this order:
> 
>      v4l2_device_unregister_subdev(sd);
>      vimc_pads_cleanup(ved->pads);
> 
> 
> v4l2_device_unregister_subdev() calls the release function of the subdevice that
> frees the ved object, so ved->pads is not valid anymore. That is why André suggested
> a temporary variable to hold ved->pads and to be able to free it later:
> 
>      struct media_pad *pads = ved->pads;
> 
>      v4l2_device_unregister_subdev(sd);
>      vimc_pads_cleanup(pads); // So we don't use the ved object here anymore.
> 
> 

Got it.

thanks,
-- Shuah

