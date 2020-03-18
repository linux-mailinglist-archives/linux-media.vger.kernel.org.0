Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 705D2189B2E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 12:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgCRLsv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 07:48:51 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:54977 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726586AbgCRLsu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 07:48:50 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id EXBkjlhXZfHuvEXBnjap5t; Wed, 18 Mar 2020 12:48:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584532128; bh=khEp2I8LHm4HvDGtASxAHrHxJnhSF2yTyhJnoLBOGY4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iBdzVVXyhBP2nEUkOIPTZIiBjqoW5rADs11fygjelrCdLqvO6Cfk0nxMrfyDix/Tw
         OHhOFr71S0sX6aE7kmemwv+pucArj/R6afCPEMybC+qMo8ucl/lxVgFRdDxMBfrPTr
         i2FTj6qpDHdu6onnD07bEMVYyGMcYItJzNnCnoW9cY4k1bPlzzzh292J/MRV4S4jW2
         SePonrJlg+tr6DhZZwdE/oujGLdGlxPBQQDeIYh1ypMUDObrcceGMWxmvK6QRd+FJt
         cLyDH0Cu8eXOWhDC2Po7LYgRe/BQZ7vgApLxlXl46Dsv67NT8vuBA+VSCCgUcjXSE3
         TzTdUIehjBNmg==
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
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5f54c018-5670-8193-7c68-969f9bde92f6@xs4all.nl>
Date:   Wed, 18 Mar 2020 12:48:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <12a36c2a-593c-e555-d44e-e2e6c4c1a562@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNwp9oXmpvDLlU0y6yBiCGF+VBdilY6z9Cy/qdkxPcn40eWB/r6e9Te3ZFqwW+zTWphUslj27araajeEl8ItMcVphxVvmx1wOq4tJ77CiNTBKx/fCA9i
 tSRmFih2blN9n/2QWo2mKp6V+5uPegrVxr1k4/Xk2YNsZo3j8qn2EKGuoMUQkR9n1pqkbK+/45VI0fmfqVsqV5WYX9ZGdTVsbprlUS29sQzOqbjscRnE1rxf
 0zTUZ556r9bxBGOEcnB//sy7dMF2Hde+ysTYNkl64I5t/S+3BmTpIPKDhTH2tWiYgx5BO6lkA3JSOOWVMu1cOtvSQo9IHEcXYFZKytgpzFxKJLoqjhu+4QNu
 TtsbR8Fm/pJbeLaPq1d3vdYZHKoPESD4eRiG1/9Bs/7zVLo4vibLr5x60bARuEe/M+aTyk0zwKm2oOm+9JTey4lC/R36GwU6lxN6nwFmi9CiVzqekAtPdZ7z
 H79/19gQ3cLu0Xopm3k9l187ks9LfJP006rO9SPx9WQ/J4W1D11EPk3NKB/MxL9z6S1611rFy0aiqMgJ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/24/20 5:45 AM, Sowjanya Komatineni wrote:
> 
> On 2/20/20 11:11 AM, Sowjanya Komatineni wrote:
>>
>> On 2/20/20 5:33 AM, Hans Verkuil wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> (Replying to myself so I can explain this a bit more)
>>>
>>> On 2/20/20 1:44 PM, Hans Verkuil wrote:
>>>>> +
>>>>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
>>>>> +{
>>>>> +    struct device_node *node = csi->dev->of_node;
>>>>> +    unsigned int port_num;
>>>>> +    int ret;
>>>>> +    struct tegra_csi_channel *item;
>>>>> +    unsigned int tpg_channels = csi->soc->csi_max_channels;
>>>>> +
>>>>> +    /* allocate CSI channel for each CSI x2 ports */
>>>>> +    for (port_num = 0; port_num < tpg_channels; port_num++) {
>>>>> +            item = devm_kzalloc(csi->dev, sizeof(*item), GFP_KERNEL);
>>>> Using devm_*alloc can be dangerous. If someone unbinds the driver, then
>>>> all memory allocated with devm_ is immediately freed. But if an 
>>>> application
>>>> still has a filehandle open, then when it closes it it might still 
>>>> reference
>>>> this already-freed memory.
>>>>
>>>> I recommend that you avoid using devm_*alloc for media drivers.
>>> A good test is to unbind & bind the driver:
>>>
>>> cd /sys/devices/platform/50000000.host1x/54080000.vi/driver
>>> echo -n 54080000.vi >unbind
>>> echo -n 54080000.vi >bind
>>>
>>> First just do this without the driver being used. That already
>>> gives me 'list_del corruption' kernel messages (list debugging
>>> is turned on in my kernel).
> 
> Will fix in v4 to use kzalloc and also proper release v4l2 to make sure 
> unbind/bind works properly.
> 
> BTW, tegra vi and csi are registered as clients to host1x video driver.
> 
> So, unbind and bind should be done with host1x video driver "tegra-video"
> 
> cd /sys/devices/platform/50000000.host1x/tegra-video/driver
> echo -n tegra-video > unbind
> echo -n tegra-video > bind

This still crashes with v4, at least if I am streaming with v4l2-ctl --stream-mmap.
Is that known?

It's not a big deal at this moment, just want to know if this will be looked
at later.

Regards,

	Hans

> 
>>>
>>> Note that this first test is basically identical to a rmmod/modprobe
>>> of the driver. But when I compiled the driver as a module it didn't
>>> create any video device nodes! Nor did I see any errors in the kernel
>>> log. I didn't pursue this, and perhaps I did something wrong, but it's
>>> worth taking a look at.
>>>
>>> The next step would be to have a video node open with:
>>>
>>> v4l2-ctl --sleep 10
>>>
>>> then while it is sleeping unbind the driver and see what happens
>>> when v4l2-ctl exits.
>>>
>>> Worst case is when you are streaming:
>>>
>>> v4l2-ctl --stream-mmap
>>>
>>> and then unbind.
>>>
>>> In general, the best way to get this to work correctly is:
>>>
>>> 1) don't use devm_*alloc
>>> 2) set the release callback of struct v4l2_device and do all freeing 
>>> there.
>>> 3) in the platform remove() callback you call media_device_unregister()
>>>     and video_unregister_device().
>> Reg 3, in current patch, media_device_unregister is called in 
>> host1x_video_remove
>> video_unregister_device happens during host1x_video_remove -> 
>> host1x_device_exit -> tegra_vi_exit -> tegra_vi_channels_cleanup
>>
>>> It's worth getting this right in this early stage, rather than fixing it
>>> in the future.
>>>
>>> Regards,
>>>
>>>          Hans

