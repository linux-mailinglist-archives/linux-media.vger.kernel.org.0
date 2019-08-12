Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072E88A05B
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 16:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfHLOIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 10:08:22 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40943 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfHLOIV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 10:08:21 -0400
Received: by mail-ot1-f68.google.com with SMTP id c34so19149202otb.7
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2019 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ow8LpGnvU4blxV8jtVAVzP/t1CKDUTVYDwYELa5L1OA=;
        b=QMoOo2eUvp3gu2WbvZ8ZdHlgp/NQG7dBAduHjzyTtrFyM9N/meO4yLbYHNXgQG2WUB
         APEXmfmFC8dB20dz4I8fRFPXkHG44rngmJy0POFQFD/sgbzfbGTpZ4hjlCn+a4+sHtUI
         E141pKiUhVCmBazF8ulAOtm1vG4xdpM2GXQTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ow8LpGnvU4blxV8jtVAVzP/t1CKDUTVYDwYELa5L1OA=;
        b=EoAnPQGJxbThgiR+TsHeJUDA2X6jcpZXY+JjksedO0CZKmk7Tr7mgOhbhLKrc8NrZz
         mGAvss5u57R7+Q9tq/obI5N/y2l+HK2PBI8WsPUGIiAT5OyiFZCynyWi3b3/wF5WvuNq
         TeX/cpI+Te8pOmMtxRQXa3NU84TI8qgAdWCmAxLBL718DSoPAhoHVCdl9ig0mzd1ya7L
         FHYqnRPtOASyLValr+2j78Dv1dWBlGPkdi1IprjP1F/F5y4AdwBgGjr/PiZMJVtfVKw2
         8SrEwQdmsYA4n8FWsrPQbZp0iMiQpp2ux/ew80I9/3psyPgM72jG825Aw4TDFDSgkWoa
         dCpg==
X-Gm-Message-State: APjAAAX9DH9JMbilZR0UtDzzWNPZHyN48gxV9sg2CbaWmGUwHUh9Djzi
        xajL2A1Wl9nbixzdh2bx9oW2aQ==
X-Google-Smtp-Source: APXvYqwXvyfWy8PIcQXrzVssiSiBudcYkFH05dFLBGpBIVp58R180Let5/DiaP10yu1B+PlzHWZ/VQ==
X-Received: by 2002:a6b:8f0d:: with SMTP id r13mr33467100iod.121.1565618900207;
        Mon, 12 Aug 2019 07:08:20 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id y17sm78652072ioa.40.2019.08.12.07.08.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 07:08:19 -0700 (PDT)
Subject: Re: [PATCH 0/3] Collapse vimc into single monolithic driver
To:     Helen Koike <helen.koike@collabora.com>,
        =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@collabora.com, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1565386363.git.skhan@linuxfoundation.org>
 <3118bc46-14ac-8015-9a6c-a8dfcdcea940@collabora.com>
 <4e9b8eb3-23c5-62ea-07dc-b51acb238dee@linuxfoundation.org>
 <15badf5e-49fa-7fbe-de6b-296e9a7f5cd9@collabora.com>
 <e21d38a5-4fcd-7b02-f5f2-e445c280f769@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2ee23903-8e99-a0a0-619a-be5bdaa71802@linuxfoundation.org>
Date:   Mon, 12 Aug 2019 08:08:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e21d38a5-4fcd-7b02-f5f2-e445c280f769@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/9/19 9:51 PM, Helen Koike wrote:
> Hi Andre,
> 
> Thanks for testing this.
> 
> On 8/9/19 9:24 PM, André Almeida wrote:
>> On 8/9/19 9:17 PM, Shuah Khan wrote:
>>> Hi Andre,
>>>
>>> On 8/9/19 5:52 PM, André Almeida wrote:
>>>> Hello Shuah,
>>>>
>>>> Thanks for the patch, I did some comments below.
>>>>
>>>> On 8/9/19 6:45 PM, Shuah Khan wrote:
>>>>> vimc uses Component API to split the driver into functional components.
>>>>> The real hardware resembles a monolith structure than component and
>>>>> component structure added a level of complexity making it hard to
>>>>> maintain without adding any real benefit.
>>>>>       The sensor is one vimc component that would makes sense to be a
>>>>> separate
>>>>> module to closely align with the real hardware. It would be easier to
>>>>> collapse vimc into single monolithic driver first and then split the
>>>>> sensor off as a separate module.
>>>>>
>>>>> This patch series emoves the component API and makes minimal changes to
>>>>> the code base preserving the functional division of the code structure.
>>>>> Preserving the functional structure allows us to split the sensor off
>>>>> as a separate module in the future.
>>>>>
>>>>> Major design elements in this change are:
>>>>>       - Use existing struct vimc_ent_config and struct
>>>>> vimc_pipeline_config
>>>>>         to drive the initialization of the functional components.
>>>>>       - Make vimc_ent_config global by moving it to vimc.h
>>>>>       - Add two new hooks add and rm to initialize and register,
>>>>> unregister
>>>>>         and free subdevs.
>>>>>       - All component API is now gone and bind and unbind hooks are
>>>>> modified
>>>>>         to do "add" and "rm" with minimal changes to just add and rm
>>>>> subdevs.
>>>>>       - vimc-core's bind and unbind are now register and unregister.
>>>>>       - vimc-core invokes "add" hooks from its vimc_register_devices().
>>>>>         The "add" hooks remain the same and register subdevs. They don't
>>>>>         create platform devices of their own and use vimc's pdev.dev as
>>>>>         their reference device. The "add" hooks save their
>>>>> vimc_ent_device(s)
>>>>>         in the corresponding vimc_ent_config.
>>>>>       - vimc-core invokes "rm" hooks from its unregister to unregister
>>>>> subdevs
>>>>>         and cleanup.
>>>>>       - vimc-core invokes "add" and "rm" hooks with pointer to struct
>>>>> vimc_device
>>>>>         and the corresponding struct vimc_ent_config pointer.
>>>>>       The following configure and stream test works on all devices.
>>>>>            media-ctl -d platform:vimc -V '"Sensor
>>>>> A":0[fmt:SBGGR8_1X8/640x480]'
>>>>>       media-ctl -d platform:vimc -V '"Debayer
>>>>> A":0[fmt:SBGGR8_1X8/640x480]'
>>>>>       media-ctl -d platform:vimc -V '"Sensor
>>>>> B":0[fmt:SBGGR8_1X8/640x480]'
>>>>>       media-ctl -d platform:vimc -V '"Debayer
>>>>> B":0[fmt:SBGGR8_1X8/640x480]'
>>>>>            v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v
>>>>> width=1920,height=1440
>>>>>       v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
>>>>>       v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
>>>>>            v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video1
>>>>>       v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
>>>>>       v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video3
>>>>>
>>>>> The third patch in the series fixes a general protection fault found
>>>>> when rmmod is done while stream is active.
>>>>
>>>> I applied your patch on top of media_tree/master and I did some testing.
>>>> Not sure if I did something wrong, but just adding and removing the
>>>> module generated a kernel panic:
>>>
>>> Thanks for testing.
>>>
>>> Odd. I tested modprobe and rmmod both.I was working on Linux 5.3-rc2.
>>> I will apply these to media latest and work from there. I have to
>>> rebase these on top of the reverts from Lucas and Helen
>>
>> Ok, please let me know if I succeeded to reproduce.
>>
>>>>
>>>> ~# modprobe vimc
>>>> ~# rmmod vimc
>>>> [   16.452974] stack segment: 0000 [#1] SMP PTI
>>>> [   16.453688] CPU: 0 PID: 2038 Comm: rmmod Not tainted 5.3.0-rc2+ #36
>>>> [   16.454678] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
>>>> BIOS 1.12.0-20181126_142135-anatol 04/01/2014
>>>> [   16.456191] RIP: 0010:kfree+0x4d/0x240
>>>>
>>>> <registers values...>
>>>>
>>>> [   16.469188] Call Trace:
>>>> [   16.469666]  vimc_remove+0x35/0x90 [vimc]
>>>> [   16.470436]  platform_drv_remove+0x1f/0x40
>>>> [   16.471233]  device_release_driver_internal+0xd3/0x1b0
>>>> [   16.472184]  driver_detach+0x37/0x6b
>>>> [   16.472882]  bus_remove_driver+0x50/0xc1
>>>> [   16.473569]  vimc_exit+0xc/0xca0 [vimc]
>>>> [   16.474231]  __x64_sys_delete_module+0x18d/0x240
>>>> [   16.475036]  do_syscall_64+0x43/0x110
>>>> [   16.475656]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>> [   16.476504] RIP: 0033:0x7fceb8dafa4b
>>>>
>>>> <registers values...>
>>>>
>>>> [   16.484853] Modules linked in: vimc(-) videobuf2_vmalloc
>>>> videobuf2_memops v4l2_tpg videobuf2_v4l2 videobuf2_common
>>>> [   16.486187] ---[ end trace 91e5e0894e254d49 ]---
>>>> [   16.486758] RIP: 0010:kfree+0x4d/0x240
>>>>
>>>> <registers values...>
>>>>
>>>> fish: “rmmod vimc” terminated by signal SIGSEGV (Address boundary error)
>>>>
>>>> I just added the module after booting, no other action was made. Here is
>>>> how my `git log --oneline` looks like:
>>>>
>>>> 897d708e922b media: vimc: Fix gpf in rmmod path when stream is active
>>>> 2e4a5ad8ad6d media: vimc: Collapse component structure into a single
>>>> monolithic driver
>>>> 7c8da1687e92 media: vimc: move private defines to a common header
>>>> 97299a303532 media: Remove dev_err() usage after platform_get_irq()
>>>> 25a3d6bac6b9 media: adv7511/cobalt: rename driver name to adv7511-v4l2
> 
> I couldn't reproduce the error, my tree looks the same:
> 
> [I] koike@floko ~/m/o/linux> git log --oneline
> e3345155c8ed (HEAD) media: vimc: Fix gpf in rmmod path when stream is active
> 43e9e2fe761f media: vimc: Collapse component structure into a single monolithic driver
> 8a6d0b9adde0 media: vimc: move private defines to a common header
> 97299a303532 (media/master) media: Remove dev_err() usage after platform_get_irq()
> 25a3d6bac6b9 media: adv7511/cobalt: rename driver name to adv7511-v4l2

Thanks Helen for trying to reproduce and sharing the result.
> 
> André, is this deterministic? Or it just happens sometimes?
> 
>>>> ...
>>>>
>>>>>
>>>>> vimc_print_dot (--print-dot) topology after this change:
>>>>> digraph board {
>>>>>      rankdir=TB
>>>>>      n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0>
>>>>> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>      n00000001:port0 -> n00000005:port0 [style=bold]
>>>>>      n00000001:port0 -> n0000000b [style=bold]
>>>>>      n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0>
>>>>> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>      n00000003:port0 -> n00000008:port0 [style=bold]
>>>>>      n00000003:port0 -> n0000000f [style=bold]
>>>>>      n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 |
>>>>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>      n00000005:port1 -> n00000015:port0
>>>>>      n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 |
>>>>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>      n00000008:port1 -> n00000015:port0 [style=dashed]
>>>>>      n0000000b [label="Raw Capture 0\n/dev/video1", shape=box,
>>>>> style=filled, fillcolor=yellow]
>>>>>      n0000000f [label="Raw Capture 1\n/dev/video2", shape=box,
>>>>> style=filled, fillcolor=yellow]
>>>>>      n00000013 [label="{{} | RGB/YUV Input\n/dev/v4l-subdev4 |
>>>>> {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>      n00000013:port0 -> n00000015:port0 [style=dashed]
>>>>>      n00000015 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev5 |
>>>>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>      n00000015:port1 -> n00000018 [style=bold]
>>>>>      n00000018 [label="RGB/YUV Capture\n/dev/video3", shape=box,
>>>>> style=filled, fillcolor=yellow]
>>>>> }
>>>>
>>>> Since the topology changed, it would be nice to change in the
>>>> documentation as well. The current dot file can be found at
>>>> `Documentation/media/v4l-drivers/vimc.dot` and it's rendered at this
>>>> page: https://www.kernel.org/doc/html/latest/media/v4l-drivers/vimc.html
>>>>
>>>

Thanks Andre! Yes this is the one I am using as a reference.

>>> Topology shouldn't have changed. No changes to links or pads etc.
>>> I will take a look to be sure. I agree that if topology changes
>>> document should be updated.
>>
>> If you "diff" the current dot with the dot you generated, you will see
>> some differences. The main difference is that "RGB/YUV Input" was a
>> device "/dev/video2/", and now it a subdevice "/dev/v4l-subdev4".
> 
> hmm, I just generated the topology for media/master, and it is
> /dev/v4l-subdev4. As we don't have an implementation of the output device
> yet, we used the sensor as a place holder and that is why it appears as
> "/dev/v4l-subdev4", what is in the docs is the ideal version after we get
> the output merged. We should update the docs in any case.
> 

Helen! Does the master match what I generated. In any case, I will do
the diff of before and after my patches for sure.

I can update the document with what it should be.

thanks,
-- Shuah

