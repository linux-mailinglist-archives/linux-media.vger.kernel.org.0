Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38C94160C2B
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 09:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgBQIE0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 03:04:26 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:37885 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726808AbgBQIE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 03:04:26 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3bO7jYStf8i433bOAjVoUA; Mon, 17 Feb 2020 09:04:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581926663; bh=txmJIAXvtcxDee+52tBHOIDFL3Rvur9ir74hQjPhp04=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=U2BJBOw5OtZz5wZcFtfPr8ugg76eJLxbCxzC/4AW9YCzF/+RQldZKjG21aybG/Npv
         HxVO79ndJztsI85cHcupgZgmEFeMdfKRg3Do2AY4NYyrmUQXlhUqDkQOwp63pMkjbs
         2MpFn0n61jXyNk4/Vl1WhoskR/tQC0KOHYey5nr8uZGUkSLcdnk228ic1cOc3cuz+w
         e9MGVRni3yHzZRRA/T1F+Ge5DQD3Wyu9cnJCOvF9hf67RJUsjoT+K1tH3fFzj1DHoH
         sNaTpToeJ8lYn6N/qXF7SC4CjN7ZnDZmKJFTfi+XDVf8J5044kvjfCySKBiG8dbSZ2
         qbxpA2mdoma+w==
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
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <44fc39f4-8e9f-bcab-8642-fe1cb332016a@xs4all.nl>
Date:   Mon, 17 Feb 2020 09:04:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0f84d37c-105f-8de6-c922-186d2f9ea156@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfK/NytLtvB9gv99jqXc4MYJyz4fc01kHOMZA4X95/dFvD9j76MlUTC9r+dbW8NEA5bbfV9p0aqYj0BXYin5G43gQhD3IjZIrjCTk6cWfWD+YsQlhusiL
 9kSJCguYC6pKZkk3ehrUEX2GXLU1jWsCL5nO3h/L8RgksbDn97BtiHcZa/ilQKISwBOJnc3cYLNB0AK1fTzOEWViTyVB3CPPYpq3H7UwF0PXjTAttRJRgqLe
 0FUVsiOLSH4O+DQUlp6dJQkwmJSVUNQ1al7oUzS4c076CA1yXLmCPbtX9K5B5bKIgYFPeN+fEi2u6V7YR4dsVG2u+oNW4/c1nFNjL192owzO7MW+HCcc8MDs
 TougTW4/Z/XKrqQvHhMbyAuGcImuC22koRVkp0beQzWSU/jYW9PXteFj/LU2HUjhKg26aoAJ3yW0X4bbFCvy60qHUQfZwPoH8fW5TFIb+seh1gc4sWVNsJYT
 y+hvNvUsoa3i0F3guhLSFuCLjQyazac//74xWjQ0iaQNsq2fdFIKFNOo4E6L2PaHd/gcyHU40pXKIzPL
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/16/20 9:22 PM, Sowjanya Komatineni wrote:
> 
> On 2/16/20 12:11 PM, Sowjanya Komatineni wrote:
>>
>> On 2/16/20 11:54 AM, Sowjanya Komatineni wrote:
>>>
>>> On 2/16/20 3:03 AM, Hans Verkuil wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>
>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>>> capture from an external camera sensor connected to CSI or from
>>>>> built-in test pattern generator.
>>>>>
>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>
>>>>> This patch adds a V4L2 media controller and capture driver support
>>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>   drivers/staging/media/Kconfig              |    2 +
>>>>>   drivers/staging/media/Makefile             |    1 +
>>>>>   drivers/staging/media/tegra/Kconfig        |   10 +
>>>>>   drivers/staging/media/tegra/Makefile       |    8 +
>>>>>   drivers/staging/media/tegra/TODO           |   10 +
>>>>>   drivers/staging/media/tegra/tegra-common.h |  239 +++++++
>>>>>   drivers/staging/media/tegra/tegra-csi.c    |  374 ++++++++++
>>>>>   drivers/staging/media/tegra/tegra-csi.h    |  115 ++++
>>>>>   drivers/staging/media/tegra/tegra-vi.c     | 1019 
>>>>> ++++++++++++++++++++++++++++
>>>>>   drivers/staging/media/tegra/tegra-vi.h     |   79 +++
>>>>>   drivers/staging/media/tegra/tegra-video.c  |  118 ++++
>>>>>   drivers/staging/media/tegra/tegra-video.h  |   32 +
>>>>>   drivers/staging/media/tegra/tegra210.c     |  767 
>>>>> +++++++++++++++++++++
>>>>>   drivers/staging/media/tegra/tegra210.h     |  190 ++++++
>>>>>   14 files changed, 2964 insertions(+)
>>>>>   create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>>   create mode 100644 drivers/staging/media/tegra/Makefile
>>>>>   create mode 100644 drivers/staging/media/tegra/TODO
>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>>>>   create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>>   create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>>
>>>> <snip>
>>>>
>>>>> +/*
>>>>> + * videobuf2 queue operations
>>>>> + */
>>>>> +static int tegra_channel_queue_setup(struct vb2_queue *vq,
>>>>> +                                  unsigned int *nbuffers,
>>>>> +                                  unsigned int *nplanes,
>>>>> +                                  unsigned int sizes[],
>>>>> +                                  struct device *alloc_devs[])
>>>>> +{
>>>>> +     struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
>>>>> +
>>>>> +     if (*nplanes)
>>>>> +             return sizes[0] < chan->format.sizeimage ? -EINVAL : 0;
>>>>> +
>>>>> +     *nplanes = 1;
>>>>> +     sizes[0] = chan->format.sizeimage;
>>>>> +     alloc_devs[0] = chan->vi->dev;
>>>>> +
>>>>> +     /*
>>>>> +      * allocate min 3 buffers in queue to avoid race between DMA
>>>>> +      * writes and userspace reads.
>>>>> +      */
>>>>> +     if (*nbuffers < 3)
>>>>> +             *nbuffers = 3;
>>>> First of all, don't check this here, instead set the struct 
>>>> vb2_queue field
>>>> 'min_buffers_needed' to 3 instead.
>>>>
>>>> But the reason given for this check is peculiar: there should not be 
>>>> any
>>>> race at all. Usually the reason for requiring a specific minimum 
>>>> number of
>>>> buffers is that the DMA engine needs at least 2 buffers before it 
>>>> can start
>>>> streaming: it can't give back a buffer to userspace (vb2_buffer_done())
>>>> unless there is a second buffer it can start to capture to next. So 
>>>> for many
>>>> DMA implementations you need a minimum of 2 buffers: two buffers for 
>>>> the
>>>> DMA engine, one buffer being processed by userspace.
>>>>
>>>> If the driver is starved of buffers it will typically keep capturing to
>>>> the last buffer until a new buffer is queued.
>>>>
>>>> In any case, once the driver releases a buffer via vb2_buffer_done() 
>>>> the
>>>> buffer memory is no longer owned by the driver.
>>>>
>>>> To be precise, buffer ownership is as follows:
>>>>
>>>> userspace -> VIDIOC_QBUF -> vb2 -> buf_queue -> driver -> 
>>>> vb2_buffer_done() -> vb2 -> VIDIOC_DQBUF -> userspace
>>>>
>>>> (vb2 == videobuf2 framework)
>>>>
>>>> Note that vb2 never touches the buffer memory.
>>>>
>>>> So if you get a race condition in this driver, then there is something
>>>> strange going on. It looks like vb2_buffer_done() is called while 
>>>> DMA is
>>>> still ongoing, or because the driver really needs to keep one buffer
>>>> available at all times.
>>>>
>>>> Regards,
>>>>
>>>>          Hans
>>>
>>> Thanks Hans.
>>>
>>> On running v4l2-compliance streaming tests for longer run, I noticed 
>>> kernel reporting unable to write to read-only memory and with debugs 
>>> I observed when this error was reported, I see 2 buffers queued and 
>>> both using same address.
>>>
>>> for first buffer capture start thread initiates capture and wakes 
>>> done thread to wait for memory write ack and once its done buffer is 
>>> released to user space but I see upon buffer released to user space 
>>> immediate next buffer capture single shot gets issued (as soon as 
>>> single shot is issued frame capture data is written to memory by DMA) 
>>> and I see this kernel error of unable to write to read-only memory.
>>>
>>> This error happens rare and happens on long run and all the times of 
>>> repro's, I see when other thread releases buffer immediate I see 
>>> single shot gets issued as 2 buffers are queued up at the same time 
>>> with same DMA address.
>>>
>> Just to be clear, I meant all the times when kernel reports error 
>> unable to write to read-only memory, I see 2 buffers gets queued and 
>> as the capture start thread and done thread are parallel and when 
>> capture thread wakes done thread on receiving FS event, done thread 
>> for waiting for memory write happens parallel to next frame capture 
>> and I see while vb2_buffer_done happens in done thread next frame 
>> single shot has been issues by capture start thread in parallel when 
>> it hits this error.
> 
> For low latency, we use 2 threads one thread for capture and wait for FS 
> and on receiving FS even wakes other done thread to wait for memory 
> write to finish.
> 
> While other done thread waits for memory write to finish, capture thread 
> can start capture for next frame and as soon as single shot is issued 
> capture frame is written to memory and as this thread runs in parallel 
> to done thread
> 
> there is a possibility vb2_buffer_done being called by 
> kthread_capture_done while DMA is ongoing by kthread_capture_start and I 
> observed same DMA address being used got both buffers that got queued at 
> same time when it hits this error.

"buffers that got queued": you mean that tegra_channel_buffer_queue() is
called twice with different buffers (i.e. with different buffer index values)
but with the same DMA address?

That should not happen (unless the first buffer was returned with
vb2_buffer_done() before the second buffer was queued).

Can you provide more details? E.g. buffer index, memory model used when
streaming, total number of buffers allocated by REQBUFS.

I would like to fully understand this. Just increasing the minimum number
of buffers, while reasonable by itself, *does* feel like it is just
hiding the symptoms.

Regards,

	Hans

> 
>>> With using minimum 3 buffers, this issue doesnt happen at all from 
>>> almost 72 hours of testing.
>>>
>>>
>>> Will try with setting vb2 queue field min_buffers_needed as 3 instead 
>>> of adding check in queue setup.
>>>
>>
>>>
>>>>> +
>>>>> +     return 0;
>>>>> +}

