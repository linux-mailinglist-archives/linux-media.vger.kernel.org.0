Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1703718A03C
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 17:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgCRQNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 12:13:08 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17015 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbgCRQNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 12:13:08 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7248320000>; Wed, 18 Mar 2020 09:11:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 18 Mar 2020 09:13:07 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 18 Mar 2020 09:13:07 -0700
Received: from [10.2.175.141] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 16:13:06 +0000
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <b301c247-537d-d78e-b057-a3225b10de7e@xs4all.nl>
 <dc592f29-3109-d10c-7df7-ffdb2755ade0@xs4all.nl>
 <b3933aa1-0717-183d-f00c-2d5fd6836a18@nvidia.com>
 <12a36c2a-593c-e555-d44e-e2e6c4c1a562@nvidia.com>
 <5f54c018-5670-8193-7c68-969f9bde92f6@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <19081d90-62cc-e6eb-0337-f108fb6ca9bc@nvidia.com>
Date:   Wed, 18 Mar 2020 09:14:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5f54c018-5670-8193-7c68-969f9bde92f6@xs4all.nl>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584547890; bh=tIHZbQLtSkJ53RrtKu9vilUV11m0jEsmcYMmUk3NErg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=MkFrRgcrqQAzQJcI2+1Q40+Pr9qGESvro4Iislxt2Izw1pDw9+uxYindJKOuhauPP
         9TnHwD3EhYiI9hppup43ZWHvkPwGzWf67CXtKZSkssNgDM3QHbkyRu4XknC4xIkJy7
         0VRO3RaUv2p+fnA2Kajs5enDYxis8R1g8z7tPlWDF3k7kRjOE3LkpGyu+5G8+/bdcC
         ueokh3NujrDWrfILfiHFTGU7F7JTdXIZY/aE/vkbfUQBaLofWMZ6Dbm81SZRzCUkjt
         LbstXrBXFK4BuI8wySVdDQHWo/JL1vu0Nq7eKTKkHG4j+nzsKG8kZDPLJ05SKHrEMk
         jVKoZVqhUP0IQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/18/20 4:48 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> On 2/24/20 5:45 AM, Sowjanya Komatineni wrote:
>> On 2/20/20 11:11 AM, Sowjanya Komatineni wrote:
>>> On 2/20/20 5:33 AM, Hans Verkuil wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> (Replying to myself so I can explain this a bit more)
>>>>
>>>> On 2/20/20 1:44 PM, Hans Verkuil wrote:
>>>>>> +
>>>>>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
>>>>>> +{
>>>>>> +    struct device_node *node = csi->dev->of_node;
>>>>>> +    unsigned int port_num;
>>>>>> +    int ret;
>>>>>> +    struct tegra_csi_channel *item;
>>>>>> +    unsigned int tpg_channels = csi->soc->csi_max_channels;
>>>>>> +
>>>>>> +    /* allocate CSI channel for each CSI x2 ports */
>>>>>> +    for (port_num = 0; port_num < tpg_channels; port_num++) {
>>>>>> +            item = devm_kzalloc(csi->dev, sizeof(*item), GFP_KERNEL);
>>>>> Using devm_*alloc can be dangerous. If someone unbinds the driver, then
>>>>> all memory allocated with devm_ is immediately freed. But if an
>>>>> application
>>>>> still has a filehandle open, then when it closes it it might still
>>>>> reference
>>>>> this already-freed memory.
>>>>>
>>>>> I recommend that you avoid using devm_*alloc for media drivers.
>>>> A good test is to unbind & bind the driver:
>>>>
>>>> cd /sys/devices/platform/50000000.host1x/54080000.vi/driver
>>>> echo -n 54080000.vi >unbind
>>>> echo -n 54080000.vi >bind
>>>>
>>>> First just do this without the driver being used. That already
>>>> gives me 'list_del corruption' kernel messages (list debugging
>>>> is turned on in my kernel).
>> Will fix in v4 to use kzalloc and also proper release v4l2 to make sure
>> unbind/bind works properly.
>>
>> BTW, tegra vi and csi are registered as clients to host1x video driver.
>>
>> So, unbind and bind should be done with host1x video driver "tegra-video"
>>
>> cd /sys/devices/platform/50000000.host1x/tegra-video/driver
>> echo -n tegra-video > unbind
>> echo -n tegra-video > bind
> This still crashes with v4, at least if I am streaming with v4l2-ctl --stream-mmap.
> Is that known?
>
> It's not a big deal at this moment, just want to know if this will be looked
> at later.
>
> Regards,
>
>          Hans

Weird, I tested streaming after unbind and bind as well and don't see 
crash. Did below steps and tried several times unbind/bind as well.

./v4l2-ctl --stream-mmap --stream-count=1 -d /dev/video3
cd /sys/devices/platform/50000000.host1x/tegra-video/driver
echo -n tegra-video > unbind
sleep 1
echo -n tegra-video > bind
cd /home/ubuntu
./v4l2-ctl --stream-mmap --stream-count=1 -d /dev/video3

Can you post call trace when you saw crash?

>>>> Note that this first test is basically identical to a rmmod/modprobe
>>>> of the driver. But when I compiled the driver as a module it didn't
>>>> create any video device nodes! Nor did I see any errors in the kernel
>>>> log. I didn't pursue this, and perhaps I did something wrong, but it's
>>>> worth taking a look at.
>>>>
>>>> The next step would be to have a video node open with:
>>>>
>>>> v4l2-ctl --sleep 10
>>>>
>>>> then while it is sleeping unbind the driver and see what happens
>>>> when v4l2-ctl exits.
>>>>
>>>> Worst case is when you are streaming:
>>>>
>>>> v4l2-ctl --stream-mmap
>>>>
>>>> and then unbind.
>>>>
>>>> In general, the best way to get this to work correctly is:
>>>>
>>>> 1) don't use devm_*alloc
>>>> 2) set the release callback of struct v4l2_device and do all freeing
>>>> there.
>>>> 3) in the platform remove() callback you call media_device_unregister()
>>>>      and video_unregister_device().
>>> Reg 3, in current patch, media_device_unregister is called in
>>> host1x_video_remove
>>> video_unregister_device happens during host1x_video_remove ->
>>> host1x_device_exit -> tegra_vi_exit -> tegra_vi_channels_cleanup
>>>
>>>> It's worth getting this right in this early stage, rather than fixing it
>>>> in the future.
>>>>
>>>> Regards,
>>>>
>>>>           Hans
