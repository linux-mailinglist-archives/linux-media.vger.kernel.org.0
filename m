Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77B2D161E64
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 02:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgBRBEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 20:04:38 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1206 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbgBRBEi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 20:04:38 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4b38040000>; Mon, 17 Feb 2020 17:04:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 17 Feb 2020 17:04:36 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 17 Feb 2020 17:04:36 -0800
Received: from [10.2.163.245] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb
 2020 01:04:35 +0000
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
Message-ID: <87c1c97d-abd7-8ca5-0709-d7c64a7d7b39@nvidia.com>
Date:   Mon, 17 Feb 2020 17:04:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fb5f1566-9347-8f34-ada0-15c831cbc394@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581987845; bh=k+eR99F2IQAV10UbmY58momnGFuW/+Bnevb4pnz4Oww=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=H7BWZT0cSvDYtiHe9molMQyAo5C1DY2F8Lwt0TjY5fjTAYPrIyenPGue5E94YjahU
         AyVfTPCPqDeeCNvvo+IxrBar2L69QiOdRX1OTK5RPN1dk7BI8SeuGeiEyafTvO3D/s
         WvhTlrZc6pVTb41ibk0NjBqElbSG04ky5nBAJ+V7RRkdWvsrJJPjH3amsLcN2LKIZ+
         15g87EJF9TI9N1FmRYvmgyZroAhrUV4xtiaNmPg9gIEMYldJ5xw8W8+WT5mNv2/tZa
         uWKx+aJbSy+of8/YFDk84BgLL5/TeS9pmjTkJmdK4nNUxhQitJO8uAHHzLiw8uKnPV
         fZklqPqOBaQCQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/17/20 4:59 PM, Sowjanya Komatineni wrote:
>
> On 2/17/20 12:04 AM, Hans Verkuil wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 2/16/20 9:22 PM, Sowjanya Komatineni wrote:
>>> On 2/16/20 12:11 PM, Sowjanya Komatineni wrote:
>>>> On 2/16/20 11:54 AM, Sowjanya Komatineni wrote:
>>>>> On 2/16/20 3:03 AM, Hans Verkuil wrote:
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
>>>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>>>
>>>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>>>>> capture from an external camera sensor connected to CSI or from
>>>>>>> built-in test pattern generator.
>>>>>>>
>>>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>>>
>>>>>>> This patch adds a V4L2 media controller and capture driver support
>>>>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>>>>
>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>> ---
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 =
2 +
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/Kconfig=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 10 +
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/Makefile=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/TODO=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 10 +
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/tegra-common.h |=C2=A0 239=
 +++++++
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/tegra-csi.c=C2=A0=C2=A0=C2=
=A0 |=C2=A0 374 ++++++++++
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/tegra-csi.h=C2=A0=C2=A0=C2=
=A0 |=C2=A0 115 ++++
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/tegra-vi.c=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1019
>>>>>>> ++++++++++++++++++++++++++++
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/tegra-vi.h=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 79 +++
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/tegra-video.c=C2=A0 |=C2=
=A0 118 ++++
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/tegra-video.h=C2=A0 |=C2=
=A0=C2=A0 32 +
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/tegra210.c=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 767
>>>>>>> +++++++++++++++++++++
>>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra/tegra210.h=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 190 ++++++
>>>>>>> =C2=A0=C2=A0 14 files changed, 2964 insertions(+)
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/Makefil=
e
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/TODO
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-c=
ommon.h
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-c=
si.c
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-c=
si.h
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-v=
i.c
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-v=
i.h
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-v=
ideo.c
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-v=
ideo.h
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/tegra21=
0.c
>>>>>>> =C2=A0=C2=A0 create mode 100644 drivers/staging/media/tegra/tegra21=
0.h
>>>>>>>
>>>>>> <snip>
>>>>>>
>>>>>>> +/*
>>>>>>> + * videobuf2 queue operations
>>>>>>> + */
>>>>>>> +static int tegra_channel_queue_setup(struct vb2_queue *vq,
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *nbu=
ffers,
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *npl=
anes,
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size=
s[],
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *al=
loc_devs[])
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D vb2_get=
_drv_priv(vq);
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (*nplanes)
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return sizes[0] < chan->format.sizeimage ? -EINVAL=20
>>>>>>> : 0;
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *nplanes =3D 1;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 sizes[0] =3D chan->format.sizeimage;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 alloc_devs[0] =3D chan->vi->dev;
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * allocate min 3 buffers in queue t=
o avoid race between DMA
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * writes and userspace reads.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (*nbuffers < 3)
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *nbuffers =3D 3;
>>>>>> First of all, don't check this here, instead set the struct
>>>>>> vb2_queue field
>>>>>> 'min_buffers_needed' to 3 instead.
>>>>>>
>>>>>> But the reason given for this check is peculiar: there should not be
>>>>>> any
>>>>>> race at all. Usually the reason for requiring a specific minimum
>>>>>> number of
>>>>>> buffers is that the DMA engine needs at least 2 buffers before it
>>>>>> can start
>>>>>> streaming: it can't give back a buffer to userspace=20
>>>>>> (vb2_buffer_done())
>>>>>> unless there is a second buffer it can start to capture to next. So
>>>>>> for many
>>>>>> DMA implementations you need a minimum of 2 buffers: two buffers for
>>>>>> the
>>>>>> DMA engine, one buffer being processed by userspace.
>>>>>>
>>>>>> If the driver is starved of buffers it will typically keep=20
>>>>>> capturing to
>>>>>> the last buffer until a new buffer is queued.
>>>>>>
>>>>>> In any case, once the driver releases a buffer via vb2_buffer_done()
>>>>>> the
>>>>>> buffer memory is no longer owned by the driver.
>>>>>>
>>>>>> To be precise, buffer ownership is as follows:
>>>>>>
>>>>>> userspace -> VIDIOC_QBUF -> vb2 -> buf_queue -> driver ->
>>>>>> vb2_buffer_done() -> vb2 -> VIDIOC_DQBUF -> userspace
>>>>>>
>>>>>> (vb2 =3D=3D videobuf2 framework)
>>>>>>
>>>>>> Note that vb2 never touches the buffer memory.
>>>>>>
>>>>>> So if you get a race condition in this driver, then there is=20
>>>>>> something
>>>>>> strange going on. It looks like vb2_buffer_done() is called while
>>>>>> DMA is
>>>>>> still ongoing, or because the driver really needs to keep one buffer
>>>>>> available at all times.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
>>>>> Thanks Hans.
>>>>>
>>>>> On running v4l2-compliance streaming tests for longer run, I noticed
>>>>> kernel reporting unable to write to read-only memory and with debugs
>>>>> I observed when this error was reported, I see 2 buffers queued and
>>>>> both using same address.
>>>>>
>>>>> for first buffer capture start thread initiates capture and wakes
>>>>> done thread to wait for memory write ack and once its done buffer is
>>>>> released to user space but I see upon buffer released to user space
>>>>> immediate next buffer capture single shot gets issued (as soon as
>>>>> single shot is issued frame capture data is written to memory by DMA)
>>>>> and I see this kernel error of unable to write to read-only memory.
>>>>>
>>>>> This error happens rare and happens on long run and all the times of
>>>>> repro's, I see when other thread releases buffer immediate I see
>>>>> single shot gets issued as 2 buffers are queued up at the same time
>>>>> with same DMA address.
>>>>>
>>>> Just to be clear, I meant all the times when kernel reports error
>>>> unable to write to read-only memory, I see 2 buffers gets queued and
>>>> as the capture start thread and done thread are parallel and when
>>>> capture thread wakes done thread on receiving FS event, done thread
>>>> for waiting for memory write happens parallel to next frame capture
>>>> and I see while vb2_buffer_done happens in done thread next frame
>>>> single shot has been issues by capture start thread in parallel when
>>>> it hits this error.
>>> For low latency, we use 2 threads one thread for capture and wait=20
>>> for FS
>>> and on receiving FS even wakes other done thread to wait for memory
>>> write to finish.
>>>
>>> While other done thread waits for memory write to finish, capture=20
>>> thread
>>> can start capture for next frame and as soon as single shot is issued
>>> capture frame is written to memory and as this thread runs in parallel
>>> to done thread
>>>
>>> there is a possibility vb2_buffer_done being called by
>>> kthread_capture_done while DMA is ongoing by kthread_capture_start=20
>>> and I
>>> observed same DMA address being used got both buffers that got=20
>>> queued at
>>> same time when it hits this error.
>> "buffers that got queued": you mean that tegra_channel_buffer_queue() is
>> called twice with different buffers (i.e. with different buffer index=20
>> values)
>> but with the same DMA address?
>
> yes I see buf_queue invoked twice and both using same DMA address.
>
> I did not monitored buf index when I repro'd with debugs.
>
>> That should not happen (unless the first buffer was returned with
>> vb2_buffer_done() before the second buffer was queued).
>>
>> Can you provide more details? E.g. buffer index, memory model used when
>> streaming, total number of buffers allocated by REQBUFS.
>
> memory type is MMAP. buffer count is 1. Didn't monitored buf index but=20
> when this happened as count is 1 so I think it might be index 0.
>
> But what I noticed is on running long hours rarely this repro's and at=20
> the time of repro, I see 2 immediate buf_queue with same DMA address.
>
> 1st buffer capture starts and received FS and wakes other thread to=20
> wait for MW_ACK_DONE and when capture thread executes for 2nd buffer=20
> right as soon as single shot bit is set which writes captured data to=20
> memory kernel error of unable to write to read-only memory happens.
>
> I couldn't add more debugs to confirm if 1st buffer release finished=20
> or not by the time 2nd buffer single shot is issued but I see=20
> MW_ACK_DONE event received for 1st buffer.
>
> Adding more debugs does not repro this kernel error and that could be=20
> because delays with debug messages helps time interval b/w buffer=20
> release and next buffer single shot.
>
>>
>> I would like to fully understand this. Just increasing the minimum=20
>> number
>> of buffers, while reasonable by itself, *does* feel like it is just
>> hiding the symptoms.
>>
>> Regards,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
>
> kthread for capture start and kthread for done which waiting for=20
> memory write to happen runs in parallel.
>
> Its hard to confirm if buffer done is invoked by kthread_done at same=20
> time of kthread_capture DMA write of next frame as adding debugs has=20
> impact on delay and doesnt repro with more debugs.
>
> But just increasing no.of min buffers to 3 doesnt repro at all and I=20
> never see 2 buffer queue requests with same DMA address as min buffers=20
> are 3.
>
Will add debugs and monitor with index again and check for repro by=20
removing min buffers to re-confirm ...
>
>>>>> With using minimum 3 buffers, this issue doesnt happen at all from
>>>>> almost 72 hours of testing.
>>>>>
>>>>>
>>>>> Will try with setting vb2 queue field min_buffers_needed as 3 instead
>>>>> of adding check in queue setup.
>>>>>
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>> +}
