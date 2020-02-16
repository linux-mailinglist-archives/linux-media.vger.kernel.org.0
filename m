Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF1D160654
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2020 21:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbgBPUV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Feb 2020 15:21:58 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14558 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgBPUV6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Feb 2020 15:21:58 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e49a4200000>; Sun, 16 Feb 2020 12:20:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 16 Feb 2020 12:21:57 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 16 Feb 2020 12:21:57 -0800
Received: from [10.2.163.245] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 16 Feb
 2020 20:21:56 +0000
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
Message-ID: <0f84d37c-105f-8de6-c922-186d2f9ea156@nvidia.com>
Date:   Sun, 16 Feb 2020 12:22:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6bb124db-681c-55c1-e328-6e1f766a8bb3@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581884448; bh=jZ5L2TNSpFF5Qbx5vfyoBsHsU3zI5lpu8LpfMXV6+J8=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=o3jerznXyvPBVIHCjVKnTQxyOClPaQY47npfRrIA4cl3zFtTXSryjY0Q4R20Pu41g
         tV7AHTPzgcZQHO8s78N/jMcKeza+65+Yu5JT5vg5tca2jQ8ekiz3DR4dW5dDpzsew4
         BdHeOtoytJASQVc2Nzb3FYjXEKH+h/o0bx90Fs+bmirIa6drKCdedkb7wuz/UWFSoM
         Hb9mnbZkxBFZ6XAhh2dbV3wzUAvKQ7u3fckn+JZG0LKs1yZR9MYqlucMWHrefoFVvr
         yD4y4mHumx1rnANn73SDtal1FIj/jDrKZLdY5AsIeiYymieMJEEdlYSC2GbUtucPYy
         zM6oczqcCU2cg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/16/20 12:11 PM, Sowjanya Komatineni wrote:
>
> On 2/16/20 11:54 AM, Sowjanya Komatineni wrote:
>>
>> On 2/16/20 3:03 AM, Hans Verkuil wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>
>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>> capture from an external camera sensor connected to CSI or from
>>>> built-in test pattern generator.
>>>>
>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>
>>>> This patch adds a V4L2 media controller and capture driver support
>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>> =C2=A0 drivers/staging/media/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
>>>> =C2=A0 drivers/staging/media/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
>>>> =C2=A0 drivers/staging/media/tegra/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 10 +
>>>> =C2=A0 drivers/staging/media/tegra/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +
>>>> =C2=A0 drivers/staging/media/tegra/TODO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 10 +
>>>> =C2=A0 drivers/staging/media/tegra/tegra-common.h |=C2=A0 239 +++++++
>>>> =C2=A0 drivers/staging/media/tegra/tegra-csi.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 374 ++++++++++
>>>> =C2=A0 drivers/staging/media/tegra/tegra-csi.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 115 ++++
>>>> =C2=A0 drivers/staging/media/tegra/tegra-vi.c=C2=A0=C2=A0=C2=A0=C2=A0 =
| 1019=20
>>>> ++++++++++++++++++++++++++++
>>>> =C2=A0 drivers/staging/media/tegra/tegra-vi.h=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 79 +++
>>>> =C2=A0 drivers/staging/media/tegra/tegra-video.c=C2=A0 |=C2=A0 118 +++=
+
>>>> =C2=A0 drivers/staging/media/tegra/tegra-video.h=C2=A0 |=C2=A0=C2=A0 3=
2 +
>>>> =C2=A0 drivers/staging/media/tegra/tegra210.c=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 767=20
>>>> +++++++++++++++++++++
>>>> =C2=A0 drivers/staging/media/tegra/tegra210.h=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 190 ++++++
>>>> =C2=A0 14 files changed, 2964 insertions(+)
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/Kconfig
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/Makefile
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/TODO
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>
>>> <snip>
>>>
>>>> +/*
>>>> + * videobuf2 queue operations
>>>> + */
>>>> +static int tegra_channel_queue_setup(struct vb2_queue *vq,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *nbuffe=
rs,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *nplane=
s,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int sizes[]=
,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *alloc=
_devs[])
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D vb2_get_dr=
v_priv(vq);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (*nplanes)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return sizes[0] < chan->format.sizeimage ? -EINVAL : 0;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *nplanes =3D 1;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 sizes[0] =3D chan->format.sizeimage;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 alloc_devs[0] =3D chan->vi->dev;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * allocate min 3 buffers in queue to a=
void race between DMA
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * writes and userspace reads.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (*nbuffers < 3)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *nbuffers =3D 3;
>>> First of all, don't check this here, instead set the struct=20
>>> vb2_queue field
>>> 'min_buffers_needed' to 3 instead.
>>>
>>> But the reason given for this check is peculiar: there should not be=20
>>> any
>>> race at all. Usually the reason for requiring a specific minimum=20
>>> number of
>>> buffers is that the DMA engine needs at least 2 buffers before it=20
>>> can start
>>> streaming: it can't give back a buffer to userspace (vb2_buffer_done())
>>> unless there is a second buffer it can start to capture to next. So=20
>>> for many
>>> DMA implementations you need a minimum of 2 buffers: two buffers for=20
>>> the
>>> DMA engine, one buffer being processed by userspace.
>>>
>>> If the driver is starved of buffers it will typically keep capturing to
>>> the last buffer until a new buffer is queued.
>>>
>>> In any case, once the driver releases a buffer via vb2_buffer_done()=20
>>> the
>>> buffer memory is no longer owned by the driver.
>>>
>>> To be precise, buffer ownership is as follows:
>>>
>>> userspace -> VIDIOC_QBUF -> vb2 -> buf_queue -> driver ->=20
>>> vb2_buffer_done() -> vb2 -> VIDIOC_DQBUF -> userspace
>>>
>>> (vb2 =3D=3D videobuf2 framework)
>>>
>>> Note that vb2 never touches the buffer memory.
>>>
>>> So if you get a race condition in this driver, then there is something
>>> strange going on. It looks like vb2_buffer_done() is called while=20
>>> DMA is
>>> still ongoing, or because the driver really needs to keep one buffer
>>> available at all times.
>>>
>>> Regards,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
>>
>> Thanks Hans.
>>
>> On running v4l2-compliance streaming tests for longer run, I noticed=20
>> kernel reporting unable to write to read-only memory and with debugs=20
>> I observed when this error was reported, I see 2 buffers queued and=20
>> both using same address.
>>
>> for first buffer capture start thread initiates capture and wakes=20
>> done thread to wait for memory write ack and once its done buffer is=20
>> released to user space but I see upon buffer released to user space=20
>> immediate next buffer capture single shot gets issued (as soon as=20
>> single shot is issued frame capture data is written to memory by DMA)=20
>> and I see this kernel error of unable to write to read-only memory.
>>
>> This error happens rare and happens on long run and all the times of=20
>> repro's, I see when other thread releases buffer immediate I see=20
>> single shot gets issued as 2 buffers are queued up at the same time=20
>> with same DMA address.
>>
> Just to be clear, I meant all the times when kernel reports error=20
> unable to write to read-only memory, I see 2 buffers gets queued and=20
> as the capture start thread and done thread are parallel and when=20
> capture thread wakes done thread on receiving FS event, done thread=20
> for waiting for memory write happens parallel to next frame capture=20
> and I see while vb2_buffer_done happens in done thread next frame=20
> single shot has been issues by capture start thread in parallel when=20
> it hits this error.

For low latency, we use 2 threads one thread for capture and wait for FS=20
and on receiving FS even wakes other done thread to wait for memory=20
write to finish.

While other done thread waits for memory write to finish, capture thread=20
can start capture for next frame and as soon as single shot is issued=20
capture frame is written to memory and as this thread runs in parallel=20
to done thread

there is a possibility vb2_buffer_done being called by=20
kthread_capture_done while DMA is ongoing by kthread_capture_start and I=20
observed same DMA address being used got both buffers that got queued at=20
same time when it hits this error.

>> With using minimum 3 buffers, this issue doesnt happen at all from=20
>> almost 72 hours of testing.
>>
>>
>> Will try with setting vb2 queue field min_buffers_needed as 3 instead=20
>> of adding check in queue setup.
>>
>
>>
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
