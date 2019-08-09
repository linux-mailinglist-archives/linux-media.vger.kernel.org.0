Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C67A088700
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2019 01:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfHIXxW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 19:53:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57328 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfHIXxW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 19:53:22 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 889DF28C40D
Subject: Re: [PATCH 0/3] Collapse vimc into single monolithic driver
To:     Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org,
        helen.koike@collabora.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1565386363.git.skhan@linuxfoundation.org>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <3118bc46-14ac-8015-9a6c-a8dfcdcea940@collabora.com>
Date:   Fri, 9 Aug 2019 20:52:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1565386363.git.skhan@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Shuah,

Thanks for the patch, I did some comments below.

On 8/9/19 6:45 PM, Shuah Khan wrote:
> vimc uses Component API to split the driver into functional components.
> The real hardware resembles a monolith structure than component and
> component structure added a level of complexity making it hard to
> maintain without adding any real benefit.
>     
> The sensor is one vimc component that would makes sense to be a separate
> module to closely align with the real hardware. It would be easier to
> collapse vimc into single monolithic driver first and then split the
> sensor off as a separate module.
> 
> This patch series emoves the component API and makes minimal changes to
> the code base preserving the functional division of the code structure.
> Preserving the functional structure allows us to split the sensor off
> as a separate module in the future.
> 
> Major design elements in this change are:
>     - Use existing struct vimc_ent_config and struct vimc_pipeline_config
>       to drive the initialization of the functional components.
>     - Make vimc_ent_config global by moving it to vimc.h
>     - Add two new hooks add and rm to initialize and register, unregister
>       and free subdevs.
>     - All component API is now gone and bind and unbind hooks are modified
>       to do "add" and "rm" with minimal changes to just add and rm subdevs.
>     - vimc-core's bind and unbind are now register and unregister.
>     - vimc-core invokes "add" hooks from its vimc_register_devices().
>       The "add" hooks remain the same and register subdevs. They don't
>       create platform devices of their own and use vimc's pdev.dev as
>       their reference device. The "add" hooks save their vimc_ent_device(s)
>       in the corresponding vimc_ent_config.
>     - vimc-core invokes "rm" hooks from its unregister to unregister subdevs
>       and cleanup.
>     - vimc-core invokes "add" and "rm" hooks with pointer to struct vimc_device
>       and the corresponding struct vimc_ent_config pointer.
>     
> The following configure and stream test works on all devices.
>     
>     media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
>     media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
>     media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
>     media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
>     
>     v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
>     v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
>     v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
>     
>     v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video1
>     v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
>     v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video3
> 
> The third patch in the series fixes a general protection fault found
> when rmmod is done while stream is active.

I applied your patch on top of media_tree/master and I did some testing.
Not sure if I did something wrong, but just adding and removing the
module generated a kernel panic:

~# modprobe vimc
~# rmmod vimc
[   16.452974] stack segment: 0000 [#1] SMP PTI
[   16.453688] CPU: 0 PID: 2038 Comm: rmmod Not tainted 5.3.0-rc2+ #36
[   16.454678] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-20181126_142135-anatol 04/01/2014
[   16.456191] RIP: 0010:kfree+0x4d/0x240

<registers values...>

[   16.469188] Call Trace:
[   16.469666]  vimc_remove+0x35/0x90 [vimc]
[   16.470436]  platform_drv_remove+0x1f/0x40
[   16.471233]  device_release_driver_internal+0xd3/0x1b0
[   16.472184]  driver_detach+0x37/0x6b
[   16.472882]  bus_remove_driver+0x50/0xc1
[   16.473569]  vimc_exit+0xc/0xca0 [vimc]
[   16.474231]  __x64_sys_delete_module+0x18d/0x240
[   16.475036]  do_syscall_64+0x43/0x110
[   16.475656]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   16.476504] RIP: 0033:0x7fceb8dafa4b

<registers values...>

[   16.484853] Modules linked in: vimc(-) videobuf2_vmalloc
videobuf2_memops v4l2_tpg videobuf2_v4l2 videobuf2_common
[   16.486187] ---[ end trace 91e5e0894e254d49 ]---
[   16.486758] RIP: 0010:kfree+0x4d/0x240

<registers values...>

fish: “rmmod vimc” terminated by signal SIGSEGV (Address boundary error)

I just added the module after booting, no other action was made. Here is
how my `git log --oneline` looks like:

897d708e922b media: vimc: Fix gpf in rmmod path when stream is active
2e4a5ad8ad6d media: vimc: Collapse component structure into a single
monolithic driver
7c8da1687e92 media: vimc: move private defines to a common header
97299a303532 media: Remove dev_err() usage after platform_get_irq()
25a3d6bac6b9 media: adv7511/cobalt: rename driver name to adv7511-v4l2
...

> 
> vimc_print_dot (--print-dot) topology after this change:
> digraph board {
> 	rankdir=TB
> 	n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> 	n00000001:port0 -> n00000005:port0 [style=bold]
> 	n00000001:port0 -> n0000000b [style=bold]
> 	n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> 	n00000003:port0 -> n00000008:port0 [style=bold]
> 	n00000003:port0 -> n0000000f [style=bold]
> 	n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> 	n00000005:port1 -> n00000015:port0
> 	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> 	n00000008:port1 -> n00000015:port0 [style=dashed]
> 	n0000000b [label="Raw Capture 0\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> 	n0000000f [label="Raw Capture 1\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> 	n00000013 [label="{{} | RGB/YUV Input\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> 	n00000013:port0 -> n00000015:port0 [style=dashed]
> 	n00000015 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev5 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> 	n00000015:port1 -> n00000018 [style=bold]
> 	n00000018 [label="RGB/YUV Capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> }

Since the topology changed, it would be nice to change in the
documentation as well. The current dot file can be found at
`Documentation/media/v4l-drivers/vimc.dot` and it's rendered at this
page: https://www.kernel.org/doc/html/latest/media/v4l-drivers/vimc.html

Thanks,
	André

> 
> Shuah Khan (3):
>   media: vimc: move private defines to a common header
>   media: vimc: Collapse component structure into a single monolithic
>     driver
>   media: vimc: Fix gpf in rmmod path when stream is active
> 
>  drivers/media/platform/vimc/Makefile       |   7 +-
>  drivers/media/platform/vimc/vimc-capture.c |  96 ++----------
>  drivers/media/platform/vimc/vimc-common.c  |   2 +-
>  drivers/media/platform/vimc/vimc-core.c    | 174 +++++++--------------
>  drivers/media/platform/vimc/vimc-debayer.c |  84 ++--------
>  drivers/media/platform/vimc/vimc-scaler.c  |  83 ++--------
>  drivers/media/platform/vimc/vimc-sensor.c  |  82 ++--------
>  drivers/media/platform/vimc/vimc.h         | 121 ++++++++++++++
>  8 files changed, 230 insertions(+), 419 deletions(-)
>  create mode 100644 drivers/media/platform/vimc/vimc.h
> 

