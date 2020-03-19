Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEDC618B962
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 15:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbgCSO37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 10:29:59 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:50335 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726892AbgCSO37 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 10:29:59 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id EwBEju89tfHuvEwBHjebZz; Thu, 19 Mar 2020 15:29:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584628196; bh=YFXiHd7nWDR8UOAdHCahZXylHN8v3bMRrzPxH24YMOw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jOFwtFUm2SimQr5pRDhA3uZOoXMXUFDl8T8yftyxJb0WFm0BuwkePeBU2dqVXU/ho
         OhvqzOwAZpp6DCBpUfwRlKtxafeguEre9qeUBaU7YoCt8822pUnaXBpuDJpKIScE7s
         hgGkuprsCwIzsf7gppDvgrkBDhloDbXnLmMDLJ8gBWGwDaQax/IPKYFO/2Wi0DxjOn
         Rn2RnNzcJCy9cMVfRUzMT5FGluDyxGLT7Jj+5Jon0oMa6jwsVUZjE9DkBrmIt0A9Tg
         16FmogHkRI/RdeeJoBEaTmjXuum1zKK4rkhCZyt595YTElloT1ZKaX0ldv8S26jHMP
         vY7NbAc+jY/kg==
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, sboyd@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <b301c247-537d-d78e-b057-a3225b10de7e@xs4all.nl>
 <dc592f29-3109-d10c-7df7-ffdb2755ade0@xs4all.nl>
 <b3933aa1-0717-183d-f00c-2d5fd6836a18@nvidia.com>
 <12a36c2a-593c-e555-d44e-e2e6c4c1a562@nvidia.com>
 <5f54c018-5670-8193-7c68-969f9bde92f6@xs4all.nl>
 <19081d90-62cc-e6eb-0337-f108fb6ca9bc@nvidia.com>
 <061eabf1-4b6f-83c0-6851-df8a193a84e8@nvidia.com>
 <a5377068-3c70-1af4-6398-630d205e794b@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bc571308-93e5-e720-1cac-eb3effe1acdd@xs4all.nl>
Date:   Thu, 19 Mar 2020 15:29:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a5377068-3c70-1af4-6398-630d205e794b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOdH5QrWWNhCYCf6J6Ms7qEEUOvIuPOpGdiEdpDygypYOns4spRU2Aj0dAuvPhDC+BDT1lq8GsYvuk/kIzlLes33OwDag0s088KBeqkAx0pC6mxxdz39
 JQdhpNkQ317FremVgnzudw4LeJEL8f+484+n/tkwD+9SvNRvFZkajP5AtVXye1nrvu/Y3tfWNxwSqC+VnpHEMjzNYvMODJQ/IhaZ01C3ZAWLsT36R7U0hlJY
 mpe4oVm7x5qhF7iOBWLkxM+sMyBjScjDpBPMgjfhVEh3oBoQBzNLv9L5aBRr2LcUtRusu7bqumddUkd+9KML6WI8cjSlF4c6ncdF/vuCl5DEIrBkUqa52PfD
 Xy2IsGIp4tQsihoRqZm4fxu3knnHYSx1GSYGqPKDV7CRNUB1aaahQnqiAVmCZDMr6uaWeEMxboqrGHEaKsa374lzMLWN1Nu/fLfCwMxwfwbCZ/fulrD2RCtI
 H+ky69uhu/D0kC5LROwNGrnFy00qfvjw7bw3CnA2CiMunN820+qWwOYxjoy/+sHu+4nlegLbRyxzyAPL
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/18/20 6:17 PM, Sowjanya Komatineni wrote:
> 
> On 3/18/20 9:25 AM, Sowjanya Komatineni wrote:
>>
>> On 3/18/20 9:14 AM, Sowjanya Komatineni wrote:
>>>
>>> On 3/18/20 4:48 AM, Hans Verkuil wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 2/24/20 5:45 AM, Sowjanya Komatineni wrote:
>>>>> On 2/20/20 11:11 AM, Sowjanya Komatineni wrote:
>>>>>> On 2/20/20 5:33 AM, Hans Verkuil wrote:
>>>>>>> External email: Use caution opening links or attachments
>>>>>>>
>>>>>>>
>>>>>>> (Replying to myself so I can explain this a bit more)
>>>>>>>
>>>>>>> On 2/20/20 1:44 PM, Hans Verkuil wrote:
>>>>>>>>> +
>>>>>>>>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
>>>>>>>>> +{
>>>>>>>>> +    struct device_node *node = csi->dev->of_node;
>>>>>>>>> +    unsigned int port_num;
>>>>>>>>> +    int ret;
>>>>>>>>> +    struct tegra_csi_channel *item;
>>>>>>>>> +    unsigned int tpg_channels = csi->soc->csi_max_channels;
>>>>>>>>> +
>>>>>>>>> +    /* allocate CSI channel for each CSI x2 ports */
>>>>>>>>> +    for (port_num = 0; port_num < tpg_channels; port_num++) {
>>>>>>>>> +            item = devm_kzalloc(csi->dev, sizeof(*item), 
>>>>>>>>> GFP_KERNEL);
>>>>>>>> Using devm_*alloc can be dangerous. If someone unbinds the 
>>>>>>>> driver, then
>>>>>>>> all memory allocated with devm_ is immediately freed. But if an
>>>>>>>> application
>>>>>>>> still has a filehandle open, then when it closes it it might still
>>>>>>>> reference
>>>>>>>> this already-freed memory.
>>>>>>>>
>>>>>>>> I recommend that you avoid using devm_*alloc for media drivers.
>>>>>>> A good test is to unbind & bind the driver:
>>>>>>>
>>>>>>> cd /sys/devices/platform/50000000.host1x/54080000.vi/driver
>>>>>>> echo -n 54080000.vi >unbind
>>>>>>> echo -n 54080000.vi >bind
>>>>>>>
>>>>>>> First just do this without the driver being used. That already
>>>>>>> gives me 'list_del corruption' kernel messages (list debugging
>>>>>>> is turned on in my kernel).
>>>>> Will fix in v4 to use kzalloc and also proper release v4l2 to make 
>>>>> sure
>>>>> unbind/bind works properly.
>>>>>
>>>>> BTW, tegra vi and csi are registered as clients to host1x video 
>>>>> driver.
>>>>>
>>>>> So, unbind and bind should be done with host1x video driver 
>>>>> "tegra-video"
>>>>>
>>>>> cd /sys/devices/platform/50000000.host1x/tegra-video/driver
>>>>> echo -n tegra-video > unbind
>>>>> echo -n tegra-video > bind
>>>> This still crashes with v4, at least if I am streaming with v4l2-ctl 
>>>> --stream-mmap.
>>>> Is that known?
>>>>
>>>> It's not a big deal at this moment, just want to know if this will 
>>>> be looked
>>>> at later.
>>>>
>>>> Regards,
>>>>
>>>>          Hans
>>>
>>> Weird, I tested streaming after unbind and bind as well and don't see 
>>> crash. Did below steps and tried several times unbind/bind as well.
>>>
>>> ./v4l2-ctl --stream-mmap --stream-count=1 -d /dev/video3
>>> cd /sys/devices/platform/50000000.host1x/tegra-video/driver
>>> echo -n tegra-video > unbind
>>> sleep 1
>>> echo -n tegra-video > bind
>>> cd /home/ubuntu
>>> ./v4l2-ctl --stream-mmap --stream-count=1 -d /dev/video3
>>>
>>> Can you post call trace when you saw crash?
>>
>> Tried unbind when  node is open with v4l2-ctl --sleep 10 as well and 
>> bind back.
>>
>> I don't see crash. Will confirm on doing unbind/bind with stream-mmap...
>>
> Able to repro when unbind/bind happens while stream-mmap.

That's indeed what I did. I don't want to try it again since I'm working from home
and the Jetson is in the office. And once it crashes I need someone in the office
to press the reset button. I hope I can pick it up next week to keep it at home as
that will make testing a lot easier.

> 
> Will look and have fix in v5.

Nice!

Thank you,

	Hans

> 
> Thanks Hans.
> 
>>>
>>>>>>> Note that this first test is basically identical to a rmmod/modprobe
>>>>>>> of the driver. But when I compiled the driver as a module it didn't
>>>>>>> create any video device nodes! Nor did I see any errors in the 
>>>>>>> kernel
>>>>>>> log. I didn't pursue this, and perhaps I did something wrong, but 
>>>>>>> it's
>>>>>>> worth taking a look at.
>>>>>>>
>>>>>>> The next step would be to have a video node open with:
>>>>>>>
>>>>>>> v4l2-ctl --sleep 10
>>>>>>>
>>>>>>> then while it is sleeping unbind the driver and see what happens
>>>>>>> when v4l2-ctl exits.
>>>>>>>
>>>>>>> Worst case is when you are streaming:
>>>>>>>
>>>>>>> v4l2-ctl --stream-mmap
>>>>>>>
>>>>>>> and then unbind.
>>>>>>>
>>>>>>> In general, the best way to get this to work correctly is:
>>>>>>>
>>>>>>> 1) don't use devm_*alloc
>>>>>>> 2) set the release callback of struct v4l2_device and do all freeing
>>>>>>> there.
>>>>>>> 3) in the platform remove() callback you call 
>>>>>>> media_device_unregister()
>>>>>>>      and video_unregister_device().
>>>>>> Reg 3, in current patch, media_device_unregister is called in
>>>>>> host1x_video_remove
>>>>>> video_unregister_device happens during host1x_video_remove ->
>>>>>> host1x_device_exit -> tegra_vi_exit -> tegra_vi_channels_cleanup
>>>>>>
>>>>>>> It's worth getting this right in this early stage, rather than 
>>>>>>> fixing it
>>>>>>> in the future.
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>>           Hans

