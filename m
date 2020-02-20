Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F057E16535F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 01:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgBTAJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 19:09:48 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:3382 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbgBTAJs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 19:09:48 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4dce3b0000>; Wed, 19 Feb 2020 16:09:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 19 Feb 2020 16:09:45 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 19 Feb 2020 16:09:45 -0800
Received: from [10.2.163.58] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 00:09:43 +0000
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
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
 <d1505a3b-92e0-4f98-1882-c56bdab7e2f6@xs4all.nl>
 <fc7b975a-dffa-4826-7ae5-40abb1f16b3d@nvidia.com>
Message-ID: <3adacc07-7e3a-2d06-8d18-003b004ede17@nvidia.com>
Date:   Wed, 19 Feb 2020 16:09:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fc7b975a-dffa-4826-7ae5-40abb1f16b3d@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582157371; bh=vlE20yiB4Bn8h0Qtkki3fDrGQwtAsjHeyBgPcGE5R0Q=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=hg1aZsgrYpl1OIGJFhsKoVsGJqe0/zVROeHu+G9kDuIfa62p5tB+EJq64BeGGR3Dp
         xQUJTQBidwByJ1v63YN1VKRgWNLJbhYIMov5sgq8MVDONzWjf+2BMxCpfPjW0MzbjD
         SvbuGM/hTnzetUYfi72GpOEIVucwSttgxnNVM8vanylROx8SYuxTaKiGQecfWuXwuY
         9B00QaoC0GZKjxyGb7OGWOaA7YNEkCOLHeTE152K8fH0eDgBe1/uSoiJZsgjQXueTY
         JTSu6Y+RFCthbk0PIHlv7c5raWIW95mpKMeeJBFUQI+Fttlc+gGGKD7lQlSHGlKowA
         ba/hsynXjC/RA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/19/20 8:22 AM, Sowjanya Komatineni wrote:
>
> On 2/19/20 7:08 AM, Hans Verkuil wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 2/18/20 4:19 AM, Sowjanya Komatineni wrote:
>>> On 2/17/20 5:04 PM, Sowjanya Komatineni wrote:
>>>> On 2/17/20 4:59 PM, Sowjanya Komatineni wrote:
>>>>> On 2/17/20 12:04 AM, Hans Verkuil wrote:
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> On 2/16/20 9:22 PM, Sowjanya Komatineni wrote:
>>>>>>> On 2/16/20 12:11 PM, Sowjanya Komatineni wrote:
>>>>>>>> On 2/16/20 11:54 AM, Sowjanya Komatineni wrote:
>>>>>>>>> On 2/16/20 3:03 AM, Hans Verkuil wrote:
>>>>>>>>>> External email: Use caution opening links or attachments
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>> Tegra210 contains a powerful Video Input (VI) hardware=20
>>>>>>>>>>> controller
>>>>>>>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>>>>>>>
>>>>>>>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel=20
>>>>>>>>>>> and can
>>>>>>>>>>> capture from an external camera sensor connected to CSI or from
>>>>>>>>>>> built-in test pattern generator.
>>>>>>>>>>>
>>>>>>>>>>> Tegra210 supports built-in test pattern generator from CSI=20
>>>>>>>>>>> to VI.
>>>>>>>>>>>
>>>>>>>>>>> This patch adds a V4L2 media controller and capture driver=20
>>>>>>>>>>> support
>>>>>>>>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>>>> ---
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/Kconfig |=C2=A0=C2=A0=
=C2=A0 2 +
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/Makefile |=C2=A0=C2=A0=
=C2=A0 1 +
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/Kconfig |=C2=A0=
=C2=A0 10 +
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/Makefile |=C2=A0=
=C2=A0=C2=A0 8 +
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/TODO |=C2=A0=C2=
=A0 10 +
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/tegra-common.h |=
=C2=A0 239 +++++++
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/tegra-csi.c |=C2=
=A0 374 ++++++++++
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/tegra-csi.h |=C2=
=A0 115 ++++
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/tegra-vi.c | 101=
9
>>>>>>>>>>> ++++++++++++++++++++++++++++
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/tegra-vi.h |=C2=
=A0=C2=A0 79 +++
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/tegra-video.c |=
=C2=A0 118 ++++
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/tegra-video.h |=
=C2=A0=C2=A0 32 +
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/tegra210.c |=C2=
=A0 767
>>>>>>>>>>> +++++++++++++++++++++
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/staging/media/tegra/tegra210.h |=C2=
=A0 190 ++++++
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 14 files changed, 2964 insertions(+)
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 drivers/staging/media/teg=
ra/Kconfig
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 drivers/staging/media/teg=
ra/Makefile
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 drivers/staging/media/teg=
ra/TODO
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644=20
>>>>>>>>>>> drivers/staging/media/tegra/tegra-common.h
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 drivers/staging/media/teg=
ra/tegra-csi.c
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 drivers/staging/media/teg=
ra/tegra-csi.h
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 drivers/staging/media/teg=
ra/tegra-vi.c
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 drivers/staging/media/teg=
ra/tegra-vi.h
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644=20
>>>>>>>>>>> drivers/staging/media/tegra/tegra-video.c
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644=20
>>>>>>>>>>> drivers/staging/media/tegra/tegra-video.h
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 drivers/staging/media/teg=
ra/tegra210.c
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 drivers/staging/media/teg=
ra/tegra210.h
>>>>>>>>>>>
>>>>>>>>>> <snip>
>>>>>>>>>>
>>>>>>>>>>> +/*
>>>>>>>>>>> + * videobuf2 queue operations
>>>>>>>>>>> + */
>>>>>>>>>>> +static int tegra_channel_queue_setup(struct vb2_queue *vq,
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned in=
t *nbuffers,
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned in=
t *nplanes,
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned in=
t sizes[],
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct devi=
ce *alloc_devs[])
>>>>>>>>>>> +{
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D vb2=
_get_drv_priv(vq);
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (*nplanes)
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return sizes[0] < chan->format.sizeimage ?
>>>>>>>>>>> -EINVAL : 0;
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *nplanes =3D 1;
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 sizes[0] =3D chan->format.sizeimage;
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 alloc_devs[0] =3D chan->vi->dev;
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * allocate min 3 buffers in que=
ue to avoid race=20
>>>>>>>>>>> between DMA
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * writes and userspace reads.
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (*nbuffers < 3)
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *nbuffers =3D 3;
>>>>>>>>>> First of all, don't check this here, instead set the struct
>>>>>>>>>> vb2_queue field
>>>>>>>>>> 'min_buffers_needed' to 3 instead.
>>>>>>>>>>
>>>>>>>>>> But the reason given for this check is peculiar: there should
>>>>>>>>>> not be
>>>>>>>>>> any
>>>>>>>>>> race at all. Usually the reason for requiring a specific minimum
>>>>>>>>>> number of
>>>>>>>>>> buffers is that the DMA engine needs at least 2 buffers=20
>>>>>>>>>> before it
>>>>>>>>>> can start
>>>>>>>>>> streaming: it can't give back a buffer to userspace
>>>>>>>>>> (vb2_buffer_done())
>>>>>>>>>> unless there is a second buffer it can start to capture to=20
>>>>>>>>>> next. So
>>>>>>>>>> for many
>>>>>>>>>> DMA implementations you need a minimum of 2 buffers: two buffers
>>>>>>>>>> for
>>>>>>>>>> the
>>>>>>>>>> DMA engine, one buffer being processed by userspace.
>>>>>>>>>>
>>>>>>>>>> If the driver is starved of buffers it will typically keep
>>>>>>>>>> capturing to
>>>>>>>>>> the last buffer until a new buffer is queued.
>>>>>>>>>>
>>>>>>>>>> In any case, once the driver releases a buffer via
>>>>>>>>>> vb2_buffer_done()
>>>>>>>>>> the
>>>>>>>>>> buffer memory is no longer owned by the driver.
>>>>>>>>>>
>>>>>>>>>> To be precise, buffer ownership is as follows:
>>>>>>>>>>
>>>>>>>>>> userspace -> VIDIOC_QBUF -> vb2 -> buf_queue -> driver ->
>>>>>>>>>> vb2_buffer_done() -> vb2 -> VIDIOC_DQBUF -> userspace
>>>>>>>>>>
>>>>>>>>>> (vb2 =3D=3D videobuf2 framework)
>>>>>>>>>>
>>>>>>>>>> Note that vb2 never touches the buffer memory.
>>>>>>>>>>
>>>>>>>>>> So if you get a race condition in this driver, then there is
>>>>>>>>>> something
>>>>>>>>>> strange going on. It looks like vb2_buffer_done() is called=20
>>>>>>>>>> while
>>>>>>>>>> DMA is
>>>>>>>>>> still ongoing, or because the driver really needs to keep one
>>>>>>>>>> buffer
>>>>>>>>>> available at all times.
>>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Han=
s
>>>>>>>>> Thanks Hans.
>>>>>>>>>
>>>>>>>>> On running v4l2-compliance streaming tests for longer run, I=20
>>>>>>>>> noticed
>>>>>>>>> kernel reporting unable to write to read-only memory and with=20
>>>>>>>>> debugs
>>>>>>>>> I observed when this error was reported, I see 2 buffers=20
>>>>>>>>> queued and
>>>>>>>>> both using same address.
>>>>>>>>>
>>>>>>>>> for first buffer capture start thread initiates capture and wakes
>>>>>>>>> done thread to wait for memory write ack and once its done=20
>>>>>>>>> buffer is
>>>>>>>>> released to user space but I see upon buffer released to user=20
>>>>>>>>> space
>>>>>>>>> immediate next buffer capture single shot gets issued (as soon as
>>>>>>>>> single shot is issued frame capture data is written to memory by
>>>>>>>>> DMA)
>>>>>>>>> and I see this kernel error of unable to write to read-only=20
>>>>>>>>> memory.
>>>>>>>>>
>>>>>>>>> This error happens rare and happens on long run and all the=20
>>>>>>>>> times of
>>>>>>>>> repro's, I see when other thread releases buffer immediate I see
>>>>>>>>> single shot gets issued as 2 buffers are queued up at the same=20
>>>>>>>>> time
>>>>>>>>> with same DMA address.
>>>>>>>>>
>>>>>>>> Just to be clear, I meant all the times when kernel reports error
>>>>>>>> unable to write to read-only memory, I see 2 buffers gets=20
>>>>>>>> queued and
>>>>>>>> as the capture start thread and done thread are parallel and when
>>>>>>>> capture thread wakes done thread on receiving FS event, done=20
>>>>>>>> thread
>>>>>>>> for waiting for memory write happens parallel to next frame=20
>>>>>>>> capture
>>>>>>>> and I see while vb2_buffer_done happens in done thread next frame
>>>>>>>> single shot has been issues by capture start thread in parallel=20
>>>>>>>> when
>>>>>>>> it hits this error.
>>>>>>> For low latency, we use 2 threads one thread for capture and wait
>>>>>>> for FS
>>>>>>> and on receiving FS even wakes other done thread to wait for memory
>>>>>>> write to finish.
>>>>>>>
>>>>>>> While other done thread waits for memory write to finish, capture
>>>>>>> thread
>>>>>>> can start capture for next frame and as soon as single shot is=20
>>>>>>> issued
>>>>>>> capture frame is written to memory and as this thread runs in=20
>>>>>>> parallel
>>>>>>> to done thread
>>>>>>>
>>>>>>> there is a possibility vb2_buffer_done being called by
>>>>>>> kthread_capture_done while DMA is ongoing by kthread_capture_start
>>>>>>> and I
>>>>>>> observed same DMA address being used got both buffers that got
>>>>>>> queued at
>>>>>>> same time when it hits this error.
>>>>>> "buffers that got queued": you mean that
>>>>>> tegra_channel_buffer_queue() is
>>>>>> called twice with different buffers (i.e. with different buffer
>>>>>> index values)
>>>>>> but with the same DMA address?
>>>>> yes I see buf_queue invoked twice and both using same DMA address.
>>>>>
>>>>> I did not monitored buf index when I repro'd with debugs.
>>>>>
>>>>>> That should not happen (unless the first buffer was returned with
>>>>>> vb2_buffer_done() before the second buffer was queued).
>>>>>>
>>>>>> Can you provide more details? E.g. buffer index, memory model=20
>>>>>> used when
>>>>>> streaming, total number of buffers allocated by REQBUFS.
>>>>> memory type is MMAP. buffer count is 1. Didn't monitored buf index
>>>>> but when this happened as count is 1 so I think it might be index 0.
>>>>>
>>>>> But what I noticed is on running long hours rarely this repro's and
>>>>> at the time of repro, I see 2 immediate buf_queue with same DMA=20
>>>>> address.
>>>>>
>>>>> 1st buffer capture starts and received FS and wakes other thread to
>>>>> wait for MW_ACK_DONE and when capture thread executes for 2nd buffer
>>>>> right as soon as single shot bit is set which writes captured data to
>>>>> memory kernel error of unable to write to read-only memory happens.
>>>>>
>>>>> I couldn't add more debugs to confirm if 1st buffer release finished
>>>>> or not by the time 2nd buffer single shot is issued but I see
>>>>> MW_ACK_DONE event received for 1st buffer.
>>>>>
>>>>> Adding more debugs does not repro this kernel error and that could be
>>>>> because delays with debug messages helps time interval b/w buffer
>>>>> release and next buffer single shot.
>>>>>
>>>>>> I would like to fully understand this. Just increasing the minimum
>>>>>> number
>>>>>> of buffers, while reasonable by itself, *does* feel like it is just
>>>>>> hiding the symptoms.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
>>>>> kthread for capture start and kthread for done which waiting for
>>>>> memory write to happen runs in parallel.
>>>>>
>>>>> Its hard to confirm if buffer done is invoked by kthread_done at same
>>>>> time of kthread_capture DMA write of next frame as adding debugs has
>>>>> impact on delay and doesnt repro with more debugs.
>>>>>
>>>>> But just increasing no.of min buffers to 3 doesnt repro at all and I
>>>>> never see 2 buffer queue requests with same DMA address as min
>>>>> buffers are 3.
>>>>>
>>>> Will add debugs and monitor with index again and check for repro by
>>>> removing min buffers to re-confirm ...
>>> Without specifying min buffers needed, I am able to repro again.
>>>
>>> Noticed the buf that got released previously is the one that gets next
>>> into the queue. So I don't see same buffer being used b/w captures.
>>> Somehow I might have misinterpreted timing from logs earlier.
>>>
>>> This time repro happened after streaming stop and on next streaming
>>> buf_prepare call back (with in tegra_channel_buffer_prepare)
>>>
>>> Earlier repro's call trace also showed all the time it happened in
>>> tegra_channel_buffer_prepare but I noticed that happened when capture
>>> start thread was running in parallel and right on single shot issued.
>>>
>>> So, looks like I misunderstood that it happened b/w issuing single shot
>>> and releasing buffer but could be its being reported during buffer
>>> prepare itself.
>>>
>>> All the times of repro, call trace shows it happens during buf_prepare.
>>>
>>> [=C2=A0=C2=A0 41.213146] Unable to handle kernel write to read-only mem=
ory at
>>> virtual address ffff0000f5c3fff8
>> This is weird: tegra_channel_buffer_prepare doesn't access any of the
>> actual buffer memory, it just reads data from structs like=20
>> vb2_buffer, etc.
>>
>> This indicates a memory overwrite or something similar. Enabling KASAN
>> in the kernel and poisoning freed memory caused the following (100%=20
>> reproducible)
>> crash with 'v4l2-ctl --stream-mmap':
>>
>> [=C2=A0 135.698408] BUG: KASAN: slab-out-of-bounds in=20
>> tegra_channel_buffer_prepare+0x5c/0x100
>> [=C2=A0 135.706277] Write of size 8 at addr ffff0000c9cfdff8 by task=20
>> v4l2-ctl/3030
>> [=C2=A0 135.713179]
>> [=C2=A0 135.714687] CPU: 2 PID: 3030 Comm: v4l2-ctl Tainted: G W=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>> 5.6.0-rc1-arm64 #48
>> [=C2=A0 135.723076] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
>> [=C2=A0 135.729023] Call trace:
>> [=C2=A0 135.731490]=C2=A0 dump_backtrace+0x0/0x278
>> [=C2=A0 135.735172]=C2=A0 show_stack+0x14/0x20
>> [=C2=A0 135.738510]=C2=A0 dump_stack+0xe0/0x134
>> [=C2=A0 135.741933]=C2=A0 print_address_description.isra.0+0x68/0x348
>> [=C2=A0 135.747270]=C2=A0 __kasan_report+0x114/0x214
>> [=C2=A0 135.751126]=C2=A0 kasan_report+0xc/0x18
>> [=C2=A0 135.754546]=C2=A0 __asan_store8+0x94/0xb8
>> [=C2=A0 135.758142]=C2=A0 tegra_channel_buffer_prepare+0x5c/0x100
>> [=C2=A0 135.763133]=C2=A0 __buf_prepare+0x1fc/0x508
>> [=C2=A0 135.766902]=C2=A0 vb2_core_qbuf+0x484/0x7c8
>> [=C2=A0 135.770672]=C2=A0 vb2_qbuf+0x100/0x148
>> [=C2=A0 135.774004]=C2=A0 vb2_ioctl_qbuf+0x90/0xa8
>> [=C2=A0 135.777688]=C2=A0 v4l_qbuf+0x54/0x68
>> [=C2=A0 135.780847]=C2=A0 __video_do_ioctl+0x288/0x5a0
>> [=C2=A0 135.784879]=C2=A0 video_usercopy+0x1f0/0x640
>> [=C2=A0 135.788735]=C2=A0 video_ioctl2+0x14/0x1c
>> [=C2=A0 135.792244]=C2=A0 v4l2_ioctl+0x98/0xb0
>> [=C2=A0 135.795580]=C2=A0 ksys_ioctl+0x2fc/0x10c8
>> [=C2=A0 135.799175]=C2=A0 __arm64_sys_ioctl+0x40/0x58
>> [=C2=A0 135.803120]=C2=A0 do_el0_svc+0xb8/0x228
>> [=C2=A0 135.806542]=C2=A0 el0_sync_handler+0x14c/0x2a8
>> [=C2=A0 135.810572]=C2=A0 el0_sync+0x140/0x180
>> [=C2=A0 135.813902]
>> [=C2=A0 135.815403] Allocated by task 3028:
>> [=C2=A0 135.818913]=C2=A0 save_stack+0x24/0xb0
>> [=C2=A0 135.822247]=C2=A0 __kasan_kmalloc.isra.0+0xc0/0xe0
>> [=C2=A0 135.826626]=C2=A0 kasan_kmalloc+0xc/0x18
>> [=C2=A0 135.830133]=C2=A0 __kmalloc+0x198/0x2e8
>> [=C2=A0 135.833554]=C2=A0 __vb2_queue_alloc+0xa4/0x858
>> [=C2=A0 135.837584]=C2=A0 vb2_core_reqbufs+0x360/0x648
>> [=C2=A0 135.841613]=C2=A0 vb2_ioctl_reqbufs+0xe4/0x140
>> [=C2=A0 135.845644]=C2=A0 v4l_reqbufs+0x64/0x78
>> [=C2=A0 135.849064]=C2=A0 __video_do_ioctl+0x288/0x5a0
>> [=C2=A0 135.853095]=C2=A0 video_usercopy+0x1f0/0x640
>> [=C2=A0 135.856952]=C2=A0 video_ioctl2+0x14/0x1c
>> [=C2=A0 135.860459]=C2=A0 v4l2_ioctl+0x98/0xb0
>> [=C2=A0 135.863793]=C2=A0 ksys_ioctl+0x2fc/0x10c8
>> [=C2=A0 135.867387]=C2=A0 __arm64_sys_ioctl+0x40/0x58
>> [=C2=A0 135.871331]=C2=A0 do_el0_svc+0xb8/0x228
>> [=C2=A0 135.874750]=C2=A0 el0_sync_handler+0x14c/0x2a8
>> [=C2=A0 135.878779]=C2=A0 el0_sync+0x140/0x180
>> [=C2=A0 135.882109]
>> [=C2=A0 135.883609] Freed by task 3028:
>> [=C2=A0 135.886767]=C2=A0 save_stack+0x24/0xb0
>> [=C2=A0 135.890099]=C2=A0 __kasan_slab_free+0x108/0x180
>> [=C2=A0 135.894215]=C2=A0 kasan_slab_free+0x10/0x18
>> [=C2=A0 135.897982]=C2=A0 kfree+0x9c/0x2d0
>> [=C2=A0 135.900965]=C2=A0 __vb2_queue_free+0x774/0xb30
>> [=C2=A0 135.904996]=C2=A0 vb2_core_reqbufs+0x138/0x648
>> [=C2=A0 135.909026]=C2=A0 vb2_ioctl_reqbufs+0xe4/0x140
>> [=C2=A0 135.913059]=C2=A0 v4l_reqbufs+0x64/0x78
>> [=C2=A0 135.916479]=C2=A0 __video_do_ioctl+0x288/0x5a0
>> [=C2=A0 135.920510]=C2=A0 video_usercopy+0x1f0/0x640
>> [=C2=A0 135.924367]=C2=A0 video_ioctl2+0x14/0x1c
>> [=C2=A0 135.927875]=C2=A0 v4l2_ioctl+0x98/0xb0
>> [=C2=A0 135.931209]=C2=A0 ksys_ioctl+0x2fc/0x10c8
>> [=C2=A0 135.934804]=C2=A0 __arm64_sys_ioctl+0x40/0x58
>> [=C2=A0 135.938748]=C2=A0 do_el0_svc+0xb8/0x228
>> [=C2=A0 135.942169]=C2=A0 el0_sync_handler+0x14c/0x2a8
>> [=C2=A0 135.946199]=C2=A0 el0_sync+0x140/0x180
>> [=C2=A0 135.949528]
>> [=C2=A0 135.951030] The buggy address belongs to the object at=20
>> ffff0000c9cfd000
>> [=C2=A0 135.951030]=C2=A0 which belongs to the cache kmalloc-2k of size =
2048
>> [=C2=A0 135.963604] The buggy address is located 2040 bytes to the right=
 of
>> [=C2=A0 135.963604]=C2=A0 2048-byte region [ffff0000c9cfd000, ffff0000c9=
cfd800)
>> [=C2=A0 135.976091] The buggy address belongs to the page:
>> [=C2=A0 135.980909] page:fffffe0003073e00 refcount:1 mapcount:0=20
>> mapping:ffff0000dc00ef80 index:0x0 compound_mapcount: 0
>> [=C2=A0 135.991046] flags: 0x2fffc00000010200(slab|head)
>> [=C2=A0 135.995691] raw: 2fffc00000010200 fffffe0003073600=20
>> 0000000300000003 ffff0000dc00ef80
>> [=C2=A0 136.003473] raw: 0000000000000000 0000000000080008=20
>> 00000001ffffffff 0000000000000000
>> [=C2=A0 136.011252] page dumped because: kasan: bad access detected
>> [=C2=A0 136.016848]
>> [=C2=A0 136.018349] Memory state around the buggy address:
>> [=C2=A0 136.023164]=C2=A0 ffff0000c9cfde80: fc fc fc fc fc fc fc fc fc f=
c fc fc=20
>> fc fc fc fc
>> [=C2=A0 136.030423]=C2=A0 ffff0000c9cfdf00: fc fc fc fc fc fc fc fc fc f=
c fc fc=20
>> fc fc fc fc
>> [=C2=A0 136.037681] >ffff0000c9cfdf80: fc fc fc fc fc fc fc fc fc fc fc =
fc=20
>> fc fc fc fc
>> [ 136.044935] ^
>> [=C2=A0 136.052104]=C2=A0 ffff0000c9cfe000: 00 00 00 00 00 00 00 00 00 0=
0 00 00=20
>> 00 00 00 00
>> [=C2=A0 136.059362]=C2=A0 ffff0000c9cfe080: 00 00 00 00 00 00 00 00 00 0=
0 00 00=20
>> 00 00 00 00
>> [=C2=A0 136.066617]=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [=C2=A0 136.073871] Disabling lock debugging due to kernel taint
>>
>> Note: I had to disable the nouveau driver since that also has a KASAN=20
>> bug in
>> v5.6-rc1.
>>
>> This happens with the driver as-posted, so with a 3 buffer minimum.
>>
>> Hopefully this will help you find the root cause of this issue.
>>
>> Regards,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
> Thanks Hans. Probably dma address is not aligned properly. Will check.


I see this time repro happened right on power up during 1st run of=20
compliance test and it shows kernel write to read-only error right=20
during vb2_core_qbuf -> buf_prepare.

it happened after buffers allocation and during pre-queuing of buffers=20
right before starting 1st stream on power up.

Hi Thierry,

Currently tegra vi driver don't use iommu. Could this be some issue with=20
contig allocation as iommu is not being used?


[=C2=A0=C2=A0 54.041421]=C2=A0 tegra_channel_buffer_prepare+0x34/0x88
[=C2=A0=C2=A0 54.047666]=C2=A0 __buf_prepare+0x1c4/0x230
[=C2=A0=C2=A0 54.052094]=C2=A0 vb2_core_qbuf+0x454/0x508
[=C2=A0=C2=A0 54.056434]=C2=A0 __vb2_init_fileio+0x1f8/0x2b8
[=C2=A0=C2=A0 54.060519]=C2=A0 __vb2_perform_fileio+0x5a0/0x6b8
[=C2=A0=C2=A0 54.064864]=C2=A0 vb2_read+0x10/0x18
[=C2=A0=C2=A0 54.067996]=C2=A0 vb2_fop_read+0xb0/0xf8
[=C2=A0=C2=A0 54.071475]=C2=A0 v4l2_read+0x74/0xb8
[=C2=A0=C2=A0 54.074697]=C2=A0 __vfs_read+0x18/0x40
[=C2=A0=C2=A0 54.078003]=C2=A0 vfs_read+0x98/0x168
[=C2=A0=C2=A0 54.081222]=C2=A0 ksys_read+0x64/0xf0
[=C2=A0=C2=A0 54.084439]=C2=A0 __arm64_sys_read+0x14/0x20
[=C2=A0=C2=A0 54.088268]=C2=A0 el0_svc_common.constprop.2+0xb0/0x168
[=C2=A0=C2=A0 54.093047]=C2=A0 do_el0_svc_compat+0x18/0x38
[=C2=A0=C2=A0 54.096961]=C2=A0 el0_sync_compat_handler+0x13c/0x194
[=C2=A0=C2=A0 54.101565]=C2=A0 el0_sync_compat+0x144/0x180
[=C2=A0=C2=A0 54.105478] Code: b9407802 eb02007f 540001e8 b9007404 (f81f800=
1)
[=C2=A0=C2=A0 54.111559] ---[ end trace 7fbb77a9700492f1 ]---

>>
>>> [=C2=A0=C2=A0 41.222012] Mem abort info:
>>> [=C2=A0=C2=A0 41.224807]=C2=A0=C2=A0 ESR =3D 0x9600004f
>>> [=C2=A0=C2=A0 41.227852]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL=
 =3D 32 bits
>>> [=C2=A0=C2=A0 41.233160]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
>>> [=C2=A0=C2=A0 41.236204]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
>>> [=C2=A0=C2=A0 41.239344] Data abort info:
>>> [=C2=A0=C2=A0 41.242225]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x0000004f
>>> [=C2=A0=C2=A0 41.246058]=C2=A0=C2=A0 CM =3D 0, WnR =3D 1
>>> [=C2=A0=C2=A0 41.249026] swapper pgtable: 4k pages, 48-bit VAs,=20
>>> pgdp=3D0000000081498000
>>> [=C2=A0=C2=A0 41.255733] [ffff0000f5c3fff8] pgd=3D000000017f1f8003,
>>> pud=3D000000017ec06003, pmd=3D000000017ea57003, pte=3D0060000175c3f793
>>> [=C2=A0=C2=A0 41.266345] Internal error: Oops: 9600004f [#1] PREEMPT SM=
P
>>> [=C2=A0=C2=A0 41.271905] Modules linked in: panel_simple tegra_drm
>>> snd_hda_codec_hdmi snd_hda_tegra crct10dif_ce snd_hda_codec cec
>>> drm_kms_helper snd_hda_core lp855x_bl drm pwm_tegra ip_tables x_tables
>>> ipv6 nf_defrag_ipv6
>>> [=C2=A0=C2=A0 41.290401] CPU: 3 PID: 532 Comm: v4l2-compliance Tainted:=
 G
>>> W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.6.0-rc1-00035-g6a10=
5c1c479a-dirty #1
>>> [=C2=A0=C2=A0 41.300902] Hardware name: NVIDIA Jetson TX1 Developer Kit=
 (DT)
>>> [=C2=A0=C2=A0 41.306807] pstate: 60000005 (nZCv daif -PAN -UAO)
>>> [=C2=A0=C2=A0 41.311593] pc : tegra_channel_buffer_prepare+0x34/0x88
>>> [=C2=A0=C2=A0 41.316807] lr : __buf_prepare+0x1c4/0x230
>>> [=C2=A0=C2=A0 41.320891] sp : ffff800011f5baa0
>>> [=C2=A0=C2=A0 41.324195] x29: ffff800011f5baa0 x28: ffff0000f58cc100
>>> [=C2=A0=C2=A0 41.329494] x27: ffff800011f5bc58 x26: ffff80001100b780
>>> [=C2=A0=C2=A0 41.334792] x25: ffff0000f81f1608 x24: ffff0000f7be7c00
>>> [=C2=A0=C2=A0 41.340091] x23: 00000000c058565d x22: 0000000000000000
>>> [=C2=A0=C2=A0 41.345390] x21: ffff0000f81f16e8 x20: 0000000000000000
>>> [=C2=A0=C2=A0 41.350688] x19: ffff0000f5c40000 x18: 0000000000000000
>>> [=C2=A0=C2=A0 41.355986] x17: 0000000000000000 x16: 0000000000000000
>>> [=C2=A0=C2=A0 41.361285] x15: ffff0000f8553800 x14: 0000000000000000
>>> [=C2=A0=C2=A0 41.366583] x13: 003f480000000000 x12: 003f500000000000
>>> [=C2=A0=C2=A0 41.371881] x11: 0000000100000000 x10: 0000000000000000
>>> [=C2=A0=C2=A0 41.377180] x9 : 0000000000000000 x8 : ffff0000f5c40258
>>> [=C2=A0=C2=A0 41.382478] x7 : 0000000000000030 x6 : 0000000000000001
>>> [=C2=A0=C2=A0 41.387776] x5 : 0000000000000000 x4 : 00000000003f4800
>>> [=C2=A0=C2=A0 41.393074] x3 : 00000000003f4800 x2 : 00000000003f4800
>>> [=C2=A0=C2=A0 41.398373] x1 : ffff0000f81f1080 x0 : ffff0000f5c40000
>>> [=C2=A0=C2=A0 41.403671] Call trace:
>>> [=C2=A0=C2=A0 41.406109]=C2=A0 tegra_channel_buffer_prepare+0x34/0x88
>>> [=C2=A0=C2=A0 41.410974]=C2=A0 __buf_prepare+0x1c4/0x230
>>> [=C2=A0=C2=A0 41.414713]=C2=A0 vb2_core_prepare_buf+0x94/0x110
>>> [=C2=A0=C2=A0 41.418971]=C2=A0 vb2_prepare_buf+0x74/0xa8
>>> [=C2=A0=C2=A0 41.422710]=C2=A0 vb2_ioctl_prepare_buf+0x54/0x60
>>> [=C2=A0=C2=A0 41.426970]=C2=A0 v4l_prepare_buf+0x44/0x58
>>> [=C2=A0=C2=A0 41.430707]=C2=A0 __video_do_ioctl+0x228/0x3e8
>>> [=C2=A0=C2=A0 41.434705]=C2=A0 video_usercopy+0x1cc/0x4d0
>>> [=C2=A0=C2=A0 41.438531]=C2=A0 video_ioctl2+0x14/0x20
>>> [=C2=A0=C2=A0 41.442010]=C2=A0 v4l2_ioctl+0x44/0x68
>>> [=C2=A0=C2=A0 41.445316]=C2=A0 v4l2_compat_ioctl32+0x21c/0x1420
>>> [=C2=A0=C2=A0 41.449665]=C2=A0 __arm64_compat_sys_ioctl+0xc8/0x108
>>> [=C2=A0=C2=A0 41.454273]=C2=A0 el0_svc_common.constprop.2+0xb0/0x168
>>> [=C2=A0=C2=A0 41.459051]=C2=A0 do_el0_svc_compat+0x18/0x38
>>> [=C2=A0=C2=A0 41.462964]=C2=A0 el0_sync_compat_handler+0x13c/0x194
>>> [=C2=A0=C2=A0 41.467570]=C2=A0 el0_sync_compat+0x144/0x180
>>> [=C2=A0=C2=A0 41.471483] Code: b9407802 eb02007f 540001e8 b9007404 (f81=
f8001)
>>> [=C2=A0=C2=A0 41.477563] ---[ end trace 051c84051f60870a ]---
>>>
>>>>>>>>> With using minimum 3 buffers, this issue doesnt happen at all=20
>>>>>>>>> from
>>>>>>>>> almost 72 hours of testing.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Will try with setting vb2 queue field min_buffers_needed as 3
>>>>>>>>> instead
>>>>>>>>> of adding check in queue setup.
>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>>> +}
