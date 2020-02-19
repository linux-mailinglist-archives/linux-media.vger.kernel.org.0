Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9141647DB
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 16:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgBSPIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 10:08:54 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:54487 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726634AbgBSPIy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 10:08:54 -0500
Received: from [IPv6:2001:420:44c1:2577:1c10:d9c8:263c:14df]
 ([IPv6:2001:420:44c1:2577:1c10:d9c8:263c:14df])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4Qxyj2N9jP9a94Qy2jplmg; Wed, 19 Feb 2020 16:08:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582124930; bh=S6Z9iOhFBOorKVf4Lu6REA4O2I0WqkJiw/7XboJRnAM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=u3CbPGQciRS5OE16cIfiyrmDPjt1/DYIwdPZRmJa5L7GilDohBYQcvDg8fUQ6doz8
         9qxkuqIWcXNB39limczUjbmkhlY1e2jyBDDf+3G2/5+Mq2n5KdaHLWow5inyCaiiqT
         Y8ViNIKXRFztkk0yeqY8IpyHRCSBN2zRN13VcObKUPriCpGzMk9hdW8saMzsIIhpNp
         KUj4+KArSu6TJ0ZZDYp7NIIKFSb0AcKSYiXOhBk7zGsZEv4/hCMe9yHQkZxt3oLFiZ
         GB9CB5KVse29/WdKL7KZtXCho0+2+J37cIxmfOYkDE5pCnZI72CIVrT7Agjt8Nof8f
         X8zzxGRmp0/PA==
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, sboyd@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <30e417ba-84e1-63d2-de74-22cfe859bddb@xs4all.nl>
 <920b4276-b2ca-646c-a21b-ca0b9bacf471@nvidia.com>
 <6bb124db-681c-55c1-e328-6e1f766a8bb3@nvidia.com>
 <0f84d37c-105f-8de6-c922-186d2f9ea156@nvidia.com>
 <44fc39f4-8e9f-bcab-8642-fe1cb332016a@xs4all.nl>
 <fb5f1566-9347-8f34-ada0-15c831cbc394@nvidia.com>
 <87c1c97d-abd7-8ca5-0709-d7c64a7d7b39@nvidia.com>
 <32ebc124-cb2d-f545-a5a0-d71192af8219@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d1505a3b-92e0-4f98-1882-c56bdab7e2f6@xs4all.nl>
Date:   Wed, 19 Feb 2020 16:08:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <32ebc124-cb2d-f545-a5a0-d71192af8219@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGb5ZsjsqSBjjLrnoo5CMNJx6XTX8hcGK8Er76DEWNaafBGKZNka2pfI5K6BEApi1pcEEWSKCJxJ/yu2kh9SyBGmMnHh8iYfa1pA9ADATBwzE1sCIFxR
 wyl/UDYxbj8AaNwgAEVs096JtkyHAKDgQieMwcOMbXgkBTz/EE2b8YKKSCJvtTHmIG1qV6gQjiACeUXPzf5h+LyIVfJvzpGX+w3xhF9Wg8b2XPFQx49nM1Xo
 4SKD6LSSH/JfL0a2XZxf+uq5juvMcH/aMClkaTDGa8IjsPin/p8MZ81R0rHiVVSfLG4MeVw5BZ/ryuGKwoBQz32oU7MSkmuceZ+iBjMAofOrHHHCcGyOpMM6
 dt8G8trFt2eJzegIbDAW29vBMM0j+LutbwmM4BavJ7rBSqg039bFczpK1b3+FqeU92QbVaYekLwe92dJeiC1elb7Aa3T0uSTkDCyB6GWjHS0g5Icjyn8Cg5j
 Qv2K3umsFmVzXhK8/ECCLDvMCfR7oIav6SCKYbNHoiSHOxcBx2bFdXMioGPgc2zWKFqeK7eQ6bNRDdDK1E4k70IkuhlI6MgHxXjRGShEj8vuBgbMTYH/8wD4
 SUbrNxl905x0I3zdzsfrZo+jIMz6BeTVaxC8f3YXBZLFHOvnjpOkXTYrj3Xz4+AhyOQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/18/20 4:19 AM, Sowjanya Komatineni wrote:
> 
> On 2/17/20 5:04 PM, Sowjanya Komatineni wrote:
>>
>> On 2/17/20 4:59 PM, Sowjanya Komatineni wrote:
>>>
>>> On 2/17/20 12:04 AM, Hans Verkuil wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 2/16/20 9:22 PM, Sowjanya Komatineni wrote:
>>>>> On 2/16/20 12:11 PM, Sowjanya Komatineni wrote:
>>>>>> On 2/16/20 11:54 AM, Sowjanya Komatineni wrote:
>>>>>>> On 2/16/20 3:03 AM, Hans Verkuil wrote:
>>>>>>>> External email: Use caution opening links or attachments
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
>>>>>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>>>>>
>>>>>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>>>>>>> capture from an external camera sensor connected to CSI or from
>>>>>>>>> built-in test pattern generator.
>>>>>>>>>
>>>>>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>>>>>
>>>>>>>>> This patch adds a V4L2 media controller and capture driver support
>>>>>>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>> ---
>>>>>>>>>    drivers/staging/media/Kconfig              |    2 +
>>>>>>>>>    drivers/staging/media/Makefile             |    1 +
>>>>>>>>>    drivers/staging/media/tegra/Kconfig        |   10 +
>>>>>>>>>    drivers/staging/media/tegra/Makefile       |    8 +
>>>>>>>>>    drivers/staging/media/tegra/TODO           |   10 +
>>>>>>>>>    drivers/staging/media/tegra/tegra-common.h |  239 +++++++
>>>>>>>>>    drivers/staging/media/tegra/tegra-csi.c    |  374 ++++++++++
>>>>>>>>>    drivers/staging/media/tegra/tegra-csi.h    |  115 ++++
>>>>>>>>>    drivers/staging/media/tegra/tegra-vi.c     | 1019
>>>>>>>>> ++++++++++++++++++++++++++++
>>>>>>>>>    drivers/staging/media/tegra/tegra-vi.h     |   79 +++
>>>>>>>>>    drivers/staging/media/tegra/tegra-video.c  |  118 ++++
>>>>>>>>>    drivers/staging/media/tegra/tegra-video.h  |   32 +
>>>>>>>>>    drivers/staging/media/tegra/tegra210.c     |  767
>>>>>>>>> +++++++++++++++++++++
>>>>>>>>>    drivers/staging/media/tegra/tegra210.h     |  190 ++++++
>>>>>>>>>    14 files changed, 2964 insertions(+)
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/Makefile
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/TODO
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>>>>>>
>>>>>>>> <snip>
>>>>>>>>
>>>>>>>>> +/*
>>>>>>>>> + * videobuf2 queue operations
>>>>>>>>> + */
>>>>>>>>> +static int tegra_channel_queue_setup(struct vb2_queue *vq,
>>>>>>>>> +                                  unsigned int *nbuffers,
>>>>>>>>> +                                  unsigned int *nplanes,
>>>>>>>>> +                                  unsigned int sizes[],
>>>>>>>>> +                                  struct device *alloc_devs[])
>>>>>>>>> +{
>>>>>>>>> +     struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
>>>>>>>>> +
>>>>>>>>> +     if (*nplanes)
>>>>>>>>> +             return sizes[0] < chan->format.sizeimage ? 
>>>>>>>>> -EINVAL : 0;
>>>>>>>>> +
>>>>>>>>> +     *nplanes = 1;
>>>>>>>>> +     sizes[0] = chan->format.sizeimage;
>>>>>>>>> +     alloc_devs[0] = chan->vi->dev;
>>>>>>>>> +
>>>>>>>>> +     /*
>>>>>>>>> +      * allocate min 3 buffers in queue to avoid race between DMA
>>>>>>>>> +      * writes and userspace reads.
>>>>>>>>> +      */
>>>>>>>>> +     if (*nbuffers < 3)
>>>>>>>>> +             *nbuffers = 3;
>>>>>>>> First of all, don't check this here, instead set the struct
>>>>>>>> vb2_queue field
>>>>>>>> 'min_buffers_needed' to 3 instead.
>>>>>>>>
>>>>>>>> But the reason given for this check is peculiar: there should 
>>>>>>>> not be
>>>>>>>> any
>>>>>>>> race at all. Usually the reason for requiring a specific minimum
>>>>>>>> number of
>>>>>>>> buffers is that the DMA engine needs at least 2 buffers before it
>>>>>>>> can start
>>>>>>>> streaming: it can't give back a buffer to userspace 
>>>>>>>> (vb2_buffer_done())
>>>>>>>> unless there is a second buffer it can start to capture to next. So
>>>>>>>> for many
>>>>>>>> DMA implementations you need a minimum of 2 buffers: two buffers 
>>>>>>>> for
>>>>>>>> the
>>>>>>>> DMA engine, one buffer being processed by userspace.
>>>>>>>>
>>>>>>>> If the driver is starved of buffers it will typically keep 
>>>>>>>> capturing to
>>>>>>>> the last buffer until a new buffer is queued.
>>>>>>>>
>>>>>>>> In any case, once the driver releases a buffer via 
>>>>>>>> vb2_buffer_done()
>>>>>>>> the
>>>>>>>> buffer memory is no longer owned by the driver.
>>>>>>>>
>>>>>>>> To be precise, buffer ownership is as follows:
>>>>>>>>
>>>>>>>> userspace -> VIDIOC_QBUF -> vb2 -> buf_queue -> driver ->
>>>>>>>> vb2_buffer_done() -> vb2 -> VIDIOC_DQBUF -> userspace
>>>>>>>>
>>>>>>>> (vb2 == videobuf2 framework)
>>>>>>>>
>>>>>>>> Note that vb2 never touches the buffer memory.
>>>>>>>>
>>>>>>>> So if you get a race condition in this driver, then there is 
>>>>>>>> something
>>>>>>>> strange going on. It looks like vb2_buffer_done() is called while
>>>>>>>> DMA is
>>>>>>>> still ongoing, or because the driver really needs to keep one 
>>>>>>>> buffer
>>>>>>>> available at all times.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>>
>>>>>>>>           Hans
>>>>>>> Thanks Hans.
>>>>>>>
>>>>>>> On running v4l2-compliance streaming tests for longer run, I noticed
>>>>>>> kernel reporting unable to write to read-only memory and with debugs
>>>>>>> I observed when this error was reported, I see 2 buffers queued and
>>>>>>> both using same address.
>>>>>>>
>>>>>>> for first buffer capture start thread initiates capture and wakes
>>>>>>> done thread to wait for memory write ack and once its done buffer is
>>>>>>> released to user space but I see upon buffer released to user space
>>>>>>> immediate next buffer capture single shot gets issued (as soon as
>>>>>>> single shot is issued frame capture data is written to memory by 
>>>>>>> DMA)
>>>>>>> and I see this kernel error of unable to write to read-only memory.
>>>>>>>
>>>>>>> This error happens rare and happens on long run and all the times of
>>>>>>> repro's, I see when other thread releases buffer immediate I see
>>>>>>> single shot gets issued as 2 buffers are queued up at the same time
>>>>>>> with same DMA address.
>>>>>>>
>>>>>> Just to be clear, I meant all the times when kernel reports error
>>>>>> unable to write to read-only memory, I see 2 buffers gets queued and
>>>>>> as the capture start thread and done thread are parallel and when
>>>>>> capture thread wakes done thread on receiving FS event, done thread
>>>>>> for waiting for memory write happens parallel to next frame capture
>>>>>> and I see while vb2_buffer_done happens in done thread next frame
>>>>>> single shot has been issues by capture start thread in parallel when
>>>>>> it hits this error.
>>>>> For low latency, we use 2 threads one thread for capture and wait 
>>>>> for FS
>>>>> and on receiving FS even wakes other done thread to wait for memory
>>>>> write to finish.
>>>>>
>>>>> While other done thread waits for memory write to finish, capture 
>>>>> thread
>>>>> can start capture for next frame and as soon as single shot is issued
>>>>> capture frame is written to memory and as this thread runs in parallel
>>>>> to done thread
>>>>>
>>>>> there is a possibility vb2_buffer_done being called by
>>>>> kthread_capture_done while DMA is ongoing by kthread_capture_start 
>>>>> and I
>>>>> observed same DMA address being used got both buffers that got 
>>>>> queued at
>>>>> same time when it hits this error.
>>>> "buffers that got queued": you mean that 
>>>> tegra_channel_buffer_queue() is
>>>> called twice with different buffers (i.e. with different buffer 
>>>> index values)
>>>> but with the same DMA address?
>>>
>>> yes I see buf_queue invoked twice and both using same DMA address.
>>>
>>> I did not monitored buf index when I repro'd with debugs.
>>>
>>>> That should not happen (unless the first buffer was returned with
>>>> vb2_buffer_done() before the second buffer was queued).
>>>>
>>>> Can you provide more details? E.g. buffer index, memory model used when
>>>> streaming, total number of buffers allocated by REQBUFS.
>>>
>>> memory type is MMAP. buffer count is 1. Didn't monitored buf index 
>>> but when this happened as count is 1 so I think it might be index 0.
>>>
>>> But what I noticed is on running long hours rarely this repro's and 
>>> at the time of repro, I see 2 immediate buf_queue with same DMA address.
>>>
>>> 1st buffer capture starts and received FS and wakes other thread to 
>>> wait for MW_ACK_DONE and when capture thread executes for 2nd buffer 
>>> right as soon as single shot bit is set which writes captured data to 
>>> memory kernel error of unable to write to read-only memory happens.
>>>
>>> I couldn't add more debugs to confirm if 1st buffer release finished 
>>> or not by the time 2nd buffer single shot is issued but I see 
>>> MW_ACK_DONE event received for 1st buffer.
>>>
>>> Adding more debugs does not repro this kernel error and that could be 
>>> because delays with debug messages helps time interval b/w buffer 
>>> release and next buffer single shot.
>>>
>>>>
>>>> I would like to fully understand this. Just increasing the minimum 
>>>> number
>>>> of buffers, while reasonable by itself, *does* feel like it is just
>>>> hiding the symptoms.
>>>>
>>>> Regards,
>>>>
>>>>          Hans
>>>
>>> kthread for capture start and kthread for done which waiting for 
>>> memory write to happen runs in parallel.
>>>
>>> Its hard to confirm if buffer done is invoked by kthread_done at same 
>>> time of kthread_capture DMA write of next frame as adding debugs has 
>>> impact on delay and doesnt repro with more debugs.
>>>
>>> But just increasing no.of min buffers to 3 doesnt repro at all and I 
>>> never see 2 buffer queue requests with same DMA address as min 
>>> buffers are 3.
>>>
>> Will add debugs and monitor with index again and check for repro by 
>> removing min buffers to re-confirm ...
> 
> Without specifying min buffers needed, I am able to repro again.
> 
> Noticed the buf that got released previously is the one that gets next 
> into the queue. So I don't see same buffer being used b/w captures. 
> Somehow I might have misinterpreted timing from logs earlier.
> 
> This time repro happened after streaming stop and on next streaming 
> buf_prepare call back (with in tegra_channel_buffer_prepare)
> 
> Earlier repro's call trace also showed all the time it happened in 
> tegra_channel_buffer_prepare but I noticed that happened when capture 
> start thread was running in parallel and right on single shot issued.
> 
> So, looks like I misunderstood that it happened b/w issuing single shot 
> and releasing buffer but could be its being reported during buffer 
> prepare itself.
> 
> All the times of repro, call trace shows it happens during buf_prepare.
> 
> [   41.213146] Unable to handle kernel write to read-only memory at 
> virtual address ffff0000f5c3fff8

This is weird: tegra_channel_buffer_prepare doesn't access any of the
actual buffer memory, it just reads data from structs like vb2_buffer, etc.

This indicates a memory overwrite or something similar. Enabling KASAN
in the kernel and poisoning freed memory caused the following (100% reproducible)
crash with 'v4l2-ctl --stream-mmap':

[  135.698408] BUG: KASAN: slab-out-of-bounds in tegra_channel_buffer_prepare+0x5c/0x100
[  135.706277] Write of size 8 at addr ffff0000c9cfdff8 by task v4l2-ctl/3030
[  135.713179]
[  135.714687] CPU: 2 PID: 3030 Comm: v4l2-ctl Tainted: G        W         5.6.0-rc1-arm64 #48
[  135.723076] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
[  135.729023] Call trace:
[  135.731490]  dump_backtrace+0x0/0x278
[  135.735172]  show_stack+0x14/0x20
[  135.738510]  dump_stack+0xe0/0x134
[  135.741933]  print_address_description.isra.0+0x68/0x348
[  135.747270]  __kasan_report+0x114/0x214
[  135.751126]  kasan_report+0xc/0x18
[  135.754546]  __asan_store8+0x94/0xb8
[  135.758142]  tegra_channel_buffer_prepare+0x5c/0x100
[  135.763133]  __buf_prepare+0x1fc/0x508
[  135.766902]  vb2_core_qbuf+0x484/0x7c8
[  135.770672]  vb2_qbuf+0x100/0x148
[  135.774004]  vb2_ioctl_qbuf+0x90/0xa8
[  135.777688]  v4l_qbuf+0x54/0x68
[  135.780847]  __video_do_ioctl+0x288/0x5a0
[  135.784879]  video_usercopy+0x1f0/0x640
[  135.788735]  video_ioctl2+0x14/0x1c
[  135.792244]  v4l2_ioctl+0x98/0xb0
[  135.795580]  ksys_ioctl+0x2fc/0x10c8
[  135.799175]  __arm64_sys_ioctl+0x40/0x58
[  135.803120]  do_el0_svc+0xb8/0x228
[  135.806542]  el0_sync_handler+0x14c/0x2a8
[  135.810572]  el0_sync+0x140/0x180
[  135.813902]
[  135.815403] Allocated by task 3028:
[  135.818913]  save_stack+0x24/0xb0
[  135.822247]  __kasan_kmalloc.isra.0+0xc0/0xe0
[  135.826626]  kasan_kmalloc+0xc/0x18
[  135.830133]  __kmalloc+0x198/0x2e8
[  135.833554]  __vb2_queue_alloc+0xa4/0x858
[  135.837584]  vb2_core_reqbufs+0x360/0x648
[  135.841613]  vb2_ioctl_reqbufs+0xe4/0x140
[  135.845644]  v4l_reqbufs+0x64/0x78
[  135.849064]  __video_do_ioctl+0x288/0x5a0
[  135.853095]  video_usercopy+0x1f0/0x640
[  135.856952]  video_ioctl2+0x14/0x1c
[  135.860459]  v4l2_ioctl+0x98/0xb0
[  135.863793]  ksys_ioctl+0x2fc/0x10c8
[  135.867387]  __arm64_sys_ioctl+0x40/0x58
[  135.871331]  do_el0_svc+0xb8/0x228
[  135.874750]  el0_sync_handler+0x14c/0x2a8
[  135.878779]  el0_sync+0x140/0x180
[  135.882109]
[  135.883609] Freed by task 3028:
[  135.886767]  save_stack+0x24/0xb0
[  135.890099]  __kasan_slab_free+0x108/0x180
[  135.894215]  kasan_slab_free+0x10/0x18
[  135.897982]  kfree+0x9c/0x2d0
[  135.900965]  __vb2_queue_free+0x774/0xb30
[  135.904996]  vb2_core_reqbufs+0x138/0x648
[  135.909026]  vb2_ioctl_reqbufs+0xe4/0x140
[  135.913059]  v4l_reqbufs+0x64/0x78
[  135.916479]  __video_do_ioctl+0x288/0x5a0
[  135.920510]  video_usercopy+0x1f0/0x640
[  135.924367]  video_ioctl2+0x14/0x1c
[  135.927875]  v4l2_ioctl+0x98/0xb0
[  135.931209]  ksys_ioctl+0x2fc/0x10c8
[  135.934804]  __arm64_sys_ioctl+0x40/0x58
[  135.938748]  do_el0_svc+0xb8/0x228
[  135.942169]  el0_sync_handler+0x14c/0x2a8
[  135.946199]  el0_sync+0x140/0x180
[  135.949528]
[  135.951030] The buggy address belongs to the object at ffff0000c9cfd000
[  135.951030]  which belongs to the cache kmalloc-2k of size 2048
[  135.963604] The buggy address is located 2040 bytes to the right of
[  135.963604]  2048-byte region [ffff0000c9cfd000, ffff0000c9cfd800)
[  135.976091] The buggy address belongs to the page:
[  135.980909] page:fffffe0003073e00 refcount:1 mapcount:0 mapping:ffff0000dc00ef80 index:0x0 compound_mapcount: 0
[  135.991046] flags: 0x2fffc00000010200(slab|head)
[  135.995691] raw: 2fffc00000010200 fffffe0003073600 0000000300000003 ffff0000dc00ef80
[  136.003473] raw: 0000000000000000 0000000000080008 00000001ffffffff 0000000000000000
[  136.011252] page dumped because: kasan: bad access detected
[  136.016848]
[  136.018349] Memory state around the buggy address:
[  136.023164]  ffff0000c9cfde80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  136.030423]  ffff0000c9cfdf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  136.037681] >ffff0000c9cfdf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  136.044935]                                                                 ^
[  136.052104]  ffff0000c9cfe000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  136.059362]  ffff0000c9cfe080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  136.066617] ==================================================================
[  136.073871] Disabling lock debugging due to kernel taint

Note: I had to disable the nouveau driver since that also has a KASAN bug in
v5.6-rc1.

This happens with the driver as-posted, so with a 3 buffer minimum.

Hopefully this will help you find the root cause of this issue.

Regards,

	Hans

> [   41.222012] Mem abort info:
> [   41.224807]   ESR = 0x9600004f
> [   41.227852]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   41.233160]   SET = 0, FnV = 0
> [   41.236204]   EA = 0, S1PTW = 0
> [   41.239344] Data abort info:
> [   41.242225]   ISV = 0, ISS = 0x0000004f
> [   41.246058]   CM = 0, WnR = 1
> [   41.249026] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000081498000
> [   41.255733] [ffff0000f5c3fff8] pgd=000000017f1f8003, 
> pud=000000017ec06003, pmd=000000017ea57003, pte=0060000175c3f793
> [   41.266345] Internal error: Oops: 9600004f [#1] PREEMPT SMP
> [   41.271905] Modules linked in: panel_simple tegra_drm 
> snd_hda_codec_hdmi snd_hda_tegra crct10dif_ce snd_hda_codec cec 
> drm_kms_helper snd_hda_core lp855x_bl drm pwm_tegra ip_tables x_tables 
> ipv6 nf_defrag_ipv6
> [   41.290401] CPU: 3 PID: 532 Comm: v4l2-compliance Tainted: G        
> W         5.6.0-rc1-00035-g6a105c1c479a-dirty #1
> [   41.300902] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
> [   41.306807] pstate: 60000005 (nZCv daif -PAN -UAO)
> [   41.311593] pc : tegra_channel_buffer_prepare+0x34/0x88
> [   41.316807] lr : __buf_prepare+0x1c4/0x230
> [   41.320891] sp : ffff800011f5baa0
> [   41.324195] x29: ffff800011f5baa0 x28: ffff0000f58cc100
> [   41.329494] x27: ffff800011f5bc58 x26: ffff80001100b780
> [   41.334792] x25: ffff0000f81f1608 x24: ffff0000f7be7c00
> [   41.340091] x23: 00000000c058565d x22: 0000000000000000
> [   41.345390] x21: ffff0000f81f16e8 x20: 0000000000000000
> [   41.350688] x19: ffff0000f5c40000 x18: 0000000000000000
> [   41.355986] x17: 0000000000000000 x16: 0000000000000000
> [   41.361285] x15: ffff0000f8553800 x14: 0000000000000000
> [   41.366583] x13: 003f480000000000 x12: 003f500000000000
> [   41.371881] x11: 0000000100000000 x10: 0000000000000000
> [   41.377180] x9 : 0000000000000000 x8 : ffff0000f5c40258
> [   41.382478] x7 : 0000000000000030 x6 : 0000000000000001
> [   41.387776] x5 : 0000000000000000 x4 : 00000000003f4800
> [   41.393074] x3 : 00000000003f4800 x2 : 00000000003f4800
> [   41.398373] x1 : ffff0000f81f1080 x0 : ffff0000f5c40000
> [   41.403671] Call trace:
> [   41.406109]  tegra_channel_buffer_prepare+0x34/0x88
> [   41.410974]  __buf_prepare+0x1c4/0x230
> [   41.414713]  vb2_core_prepare_buf+0x94/0x110
> [   41.418971]  vb2_prepare_buf+0x74/0xa8
> [   41.422710]  vb2_ioctl_prepare_buf+0x54/0x60
> [   41.426970]  v4l_prepare_buf+0x44/0x58
> [   41.430707]  __video_do_ioctl+0x228/0x3e8
> [   41.434705]  video_usercopy+0x1cc/0x4d0
> [   41.438531]  video_ioctl2+0x14/0x20
> [   41.442010]  v4l2_ioctl+0x44/0x68
> [   41.445316]  v4l2_compat_ioctl32+0x21c/0x1420
> [   41.449665]  __arm64_compat_sys_ioctl+0xc8/0x108
> [   41.454273]  el0_svc_common.constprop.2+0xb0/0x168
> [   41.459051]  do_el0_svc_compat+0x18/0x38
> [   41.462964]  el0_sync_compat_handler+0x13c/0x194
> [   41.467570]  el0_sync_compat+0x144/0x180
> [   41.471483] Code: b9407802 eb02007f 540001e8 b9007404 (f81f8001)
> [   41.477563] ---[ end trace 051c84051f60870a ]---
> 
>>>
>>>>>>> With using minimum 3 buffers, this issue doesnt happen at all from
>>>>>>> almost 72 hours of testing.
>>>>>>>
>>>>>>>
>>>>>>> Will try with setting vb2 queue field min_buffers_needed as 3 
>>>>>>> instead
>>>>>>> of adding check in queue setup.
>>>>>>>
>>>>>>>>> +
>>>>>>>>> +     return 0;
>>>>>>>>> +}

