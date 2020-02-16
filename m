Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAEED160614
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2020 20:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbgBPTyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Feb 2020 14:54:55 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14149 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgBPTyz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Feb 2020 14:54:55 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e499dc50000>; Sun, 16 Feb 2020 11:53:41 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 16 Feb 2020 11:54:50 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 16 Feb 2020 11:54:50 -0800
Received: from [10.2.163.245] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 16 Feb
 2020 19:54:49 +0000
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <30e417ba-84e1-63d2-de74-22cfe859bddb@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <920b4276-b2ca-646c-a21b-ca0b9bacf471@nvidia.com>
Date:   Sun, 16 Feb 2020 11:54:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <30e417ba-84e1-63d2-de74-22cfe859bddb@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581882821; bh=UB6GUGHmM8MBM9Onxlyt8oKlH098Je6CysPde2qz2nw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=PHMTgyO8pUL+ysZRcWinlnGiic7lxVa8DE9J//J9iZmc/vcvXruZNPQJjnwQLiZkT
         JK1hDfXBv7lHs8RX/cCGBc3AlYgJXLZkeY/LgQwcXw85MmMQaqOg2wB9PiNS3Z9gyT
         Z1Xo4xJKvWUW3dT2Kc4PEhnqMQLFf9J/BM40fEFOGI5uJNTUhDGPKRehXY6nrZAtu/
         WqzCplngD3AcginoEqFRPZ89PXrM11GVdB5QsT1FuoHlOMyUxQXYIzWA1/N8jG5Y1Y
         iwvYIRWaDhWnNgxqihgtgbsfDWe22cdMUYj9d/x+5O5MnxXUAKpA1rxqSnQqv2Li+5
         drDT8wn2MoINQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/16/20 3:03 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
>> Tegra210 contains a powerful Video Input (VI) hardware controller
>> which can support up to 6 MIPI CSI camera sensors.
>>
>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>> capture from an external camera sensor connected to CSI or from
>> built-in test pattern generator.
>>
>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>
>> This patch adds a V4L2 media controller and capture driver support
>> for Tegra210 built-in CSI to VI test pattern generator.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/staging/media/Kconfig              |    2 +
>>   drivers/staging/media/Makefile             |    1 +
>>   drivers/staging/media/tegra/Kconfig        |   10 +
>>   drivers/staging/media/tegra/Makefile       |    8 +
>>   drivers/staging/media/tegra/TODO           |   10 +
>>   drivers/staging/media/tegra/tegra-common.h |  239 +++++++
>>   drivers/staging/media/tegra/tegra-csi.c    |  374 ++++++++++
>>   drivers/staging/media/tegra/tegra-csi.h    |  115 ++++
>>   drivers/staging/media/tegra/tegra-vi.c     | 1019 ++++++++++++++++++++++++++++
>>   drivers/staging/media/tegra/tegra-vi.h     |   79 +++
>>   drivers/staging/media/tegra/tegra-video.c  |  118 ++++
>>   drivers/staging/media/tegra/tegra-video.h  |   32 +
>>   drivers/staging/media/tegra/tegra210.c     |  767 +++++++++++++++++++++
>>   drivers/staging/media/tegra/tegra210.h     |  190 ++++++
>>   14 files changed, 2964 insertions(+)
>>   create mode 100644 drivers/staging/media/tegra/Kconfig
>>   create mode 100644 drivers/staging/media/tegra/Makefile
>>   create mode 100644 drivers/staging/media/tegra/TODO
>>   create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>   create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>   create mode 100644 drivers/staging/media/tegra/tegra210.c
>>   create mode 100644 drivers/staging/media/tegra/tegra210.h
>>
> <snip>
>
>> +/*
>> + * videobuf2 queue operations
>> + */
>> +static int tegra_channel_queue_setup(struct vb2_queue *vq,
>> +                                  unsigned int *nbuffers,
>> +                                  unsigned int *nplanes,
>> +                                  unsigned int sizes[],
>> +                                  struct device *alloc_devs[])
>> +{
>> +     struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
>> +
>> +     if (*nplanes)
>> +             return sizes[0] < chan->format.sizeimage ? -EINVAL : 0;
>> +
>> +     *nplanes = 1;
>> +     sizes[0] = chan->format.sizeimage;
>> +     alloc_devs[0] = chan->vi->dev;
>> +
>> +     /*
>> +      * allocate min 3 buffers in queue to avoid race between DMA
>> +      * writes and userspace reads.
>> +      */
>> +     if (*nbuffers < 3)
>> +             *nbuffers = 3;
> First of all, don't check this here, instead set the struct vb2_queue field
> 'min_buffers_needed' to 3 instead.
>
> But the reason given for this check is peculiar: there should not be any
> race at all. Usually the reason for requiring a specific minimum number of
> buffers is that the DMA engine needs at least 2 buffers before it can start
> streaming: it can't give back a buffer to userspace (vb2_buffer_done())
> unless there is a second buffer it can start to capture to next. So for many
> DMA implementations you need a minimum of 2 buffers: two buffers for the
> DMA engine, one buffer being processed by userspace.
>
> If the driver is starved of buffers it will typically keep capturing to
> the last buffer until a new buffer is queued.
>
> In any case, once the driver releases a buffer via vb2_buffer_done() the
> buffer memory is no longer owned by the driver.
>
> To be precise, buffer ownership is as follows:
>
> userspace -> VIDIOC_QBUF -> vb2 -> buf_queue -> driver -> vb2_buffer_done() -> vb2 -> VIDIOC_DQBUF -> userspace
>
> (vb2 == videobuf2 framework)
>
> Note that vb2 never touches the buffer memory.
>
> So if you get a race condition in this driver, then there is something
> strange going on. It looks like vb2_buffer_done() is called while DMA is
> still ongoing, or because the driver really needs to keep one buffer
> available at all times.
>
> Regards,
>
>          Hans

Thanks Hans.

On running v4l2-compliance streaming tests for longer run, I noticed 
kernel reporting unable to write to read-only memory and with debugs I 
observed when this error was reported, I see 2 buffers queued and both 
using same address.

for first buffer capture start thread initiates capture and wakes done 
thread to wait for memory write ack and once its done buffer is released 
to user space but I see upon buffer released to user space immediate 
next buffer capture single shot gets issued (as soon as single shot is 
issued frame capture data is written to memory by DMA) and I see this 
kernel error of unable to write to read-only memory.

This error happens rare and happens on long run and all the times of 
repro's, I see when other thread releases buffer immediate I see single 
shot gets issued as 2 buffers are queued up at the same time with same 
DMA address.

With using minimum 3 buffers, this issue doesnt happen at all from 
almost 72 hours of testing.


Will try with setting vb2 queue field min_buffers_needed as 3 instead of 
adding check in queue setup.


>> +
>> +     return 0;
>> +}
