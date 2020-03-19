Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5D018BF9A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 19:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgCSSsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 14:48:23 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:7492 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCSSsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 14:48:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73be430001>; Thu, 19 Mar 2020 11:47:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 11:48:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Mar 2020 11:48:21 -0700
Received: from [10.2.175.141] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 18:48:21 +0000
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
 <19081d90-62cc-e6eb-0337-f108fb6ca9bc@nvidia.com>
 <061eabf1-4b6f-83c0-6851-df8a193a84e8@nvidia.com>
 <a5377068-3c70-1af4-6398-630d205e794b@nvidia.com>
 <bc571308-93e5-e720-1cac-eb3effe1acdd@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <6be84f2c-12d7-3077-73af-55301c24627b@nvidia.com>
Date:   Thu, 19 Mar 2020 11:49:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bc571308-93e5-e720-1cac-eb3effe1acdd@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584643651; bh=PxupzcuW7ZMqezNCkpHo/442CvyUUHdXbp9nBekxA8s=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=SVLsdmXr0WHfrf0hgtzDisiZAxfyuyHfFUYHMSE5yS6u/4Se6YF/kjPJI36XBgV7C
         sWjIv8li/pz/2v5oEe1pZa+biz6i+bsXx0WxOnyjHYQTTScsU8sA/ziPPGwWCCymH2
         Dq6yudjoWcmcAf7teraxlh0uM0xKVcl3bNqBSGVGBW6B+eGVoLC0tuf8n1m4UsXTZy
         Ph9oQldvv2ByWsz1SME8kS2BEQ2gkhwAXEYEFbI2zfZO/zPoPt5qceKvJnnGv4JVMj
         TXes3AVdpajZMP7mIv3694rgWIWkphycqj4EEJWK427vojqHgKmJyo8G94xygZpdFe
         xOSGV/UEkPiAQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/19/20 7:29 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> On 3/18/20 6:17 PM, Sowjanya Komatineni wrote:
>> On 3/18/20 9:25 AM, Sowjanya Komatineni wrote:
>>> On 3/18/20 9:14 AM, Sowjanya Komatineni wrote:
>>>> On 3/18/20 4:48 AM, Hans Verkuil wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> On 2/24/20 5:45 AM, Sowjanya Komatineni wrote:
>>>>>> On 2/20/20 11:11 AM, Sowjanya Komatineni wrote:
>>>>>>> On 2/20/20 5:33 AM, Hans Verkuil wrote:
>>>>>>>> External email: Use caution opening links or attachments
>>>>>>>>
>>>>>>>>
>>>>>>>> (Replying to myself so I can explain this a bit more)
>>>>>>>>
>>>>>>>> On 2/20/20 1:44 PM, Hans Verkuil wrote:
>>>>>>>>>> +
>>>>>>>>>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
>>>>>>>>>> +{
>>>>>>>>>> +    struct device_node *node =3D csi->dev->of_node;
>>>>>>>>>> +    unsigned int port_num;
>>>>>>>>>> +    int ret;
>>>>>>>>>> +    struct tegra_csi_channel *item;
>>>>>>>>>> +    unsigned int tpg_channels =3D csi->soc->csi_max_channels;
>>>>>>>>>> +
>>>>>>>>>> +    /* allocate CSI channel for each CSI x2 ports */
>>>>>>>>>> +    for (port_num =3D 0; port_num < tpg_channels; port_num++) {
>>>>>>>>>> +            item =3D devm_kzalloc(csi->dev, sizeof(*item),
>>>>>>>>>> GFP_KERNEL);
>>>>>>>>> Using devm_*alloc can be dangerous. If someone unbinds the
>>>>>>>>> driver, then
>>>>>>>>> all memory allocated with devm_ is immediately freed. But if an
>>>>>>>>> application
>>>>>>>>> still has a filehandle open, then when it closes it it might stil=
l
>>>>>>>>> reference
>>>>>>>>> this already-freed memory.
>>>>>>>>>
>>>>>>>>> I recommend that you avoid using devm_*alloc for media drivers.
>>>>>>>> A good test is to unbind & bind the driver:
>>>>>>>>
>>>>>>>> cd /sys/devices/platform/50000000.host1x/54080000.vi/driver
>>>>>>>> echo -n 54080000.vi >unbind
>>>>>>>> echo -n 54080000.vi >bind
>>>>>>>>
>>>>>>>> First just do this without the driver being used. That already
>>>>>>>> gives me 'list_del corruption' kernel messages (list debugging
>>>>>>>> is turned on in my kernel).
>>>>>> Will fix in v4 to use kzalloc and also proper release v4l2 to make
>>>>>> sure
>>>>>> unbind/bind works properly.
>>>>>>
>>>>>> BTW, tegra vi and csi are registered as clients to host1x video
>>>>>> driver.
>>>>>>
>>>>>> So, unbind and bind should be done with host1x video driver
>>>>>> "tegra-video"
>>>>>>
>>>>>> cd /sys/devices/platform/50000000.host1x/tegra-video/driver
>>>>>> echo -n tegra-video > unbind
>>>>>> echo -n tegra-video > bind
>>>>> This still crashes with v4, at least if I am streaming with v4l2-ctl
>>>>> --stream-mmap.
>>>>> Is that known?
>>>>>
>>>>> It's not a big deal at this moment, just want to know if this will
>>>>> be looked
>>>>> at later.
>>>>>
>>>>> Regards,
>>>>>
>>>>>           Hans
>>>> Weird, I tested streaming after unbind and bind as well and don't see
>>>> crash. Did below steps and tried several times unbind/bind as well.
>>>>
>>>> ./v4l2-ctl --stream-mmap --stream-count=3D1 -d /dev/video3
>>>> cd /sys/devices/platform/50000000.host1x/tegra-video/driver
>>>> echo -n tegra-video > unbind
>>>> sleep 1
>>>> echo -n tegra-video > bind
>>>> cd /home/ubuntu
>>>> ./v4l2-ctl --stream-mmap --stream-count=3D1 -d /dev/video3
>>>>
>>>> Can you post call trace when you saw crash?
>>> Tried unbind when  node is open with v4l2-ctl --sleep 10 as well and
>>> bind back.
>>>
>>> I don't see crash. Will confirm on doing unbind/bind with stream-mmap..=
.
>>>
>> Able to repro when unbind/bind happens while stream-mmap.
> That's indeed what I did. I don't want to try it again since I'm working =
from home
> and the Jetson is in the office. And once it crashes I need someone in th=
e office
> to press the reset button. I hope I can pick it up next week to keep it a=
t home as
> that will make testing a lot easier.

Hi Hans, no problem. I repro'd and fixed it. Will include the fix in v5.

Tested fix to make sure of no crash with unbind/bind during sleep and=20
also during streaming.

during sleep, after specified time it shows below info but no crash.

Test VIDIOC_QUERYCAP:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 VIDIOC_QUERYCAP returned -1 (No such device)
VIDIOC_QUERYCAP: No such device

Thanks

Sowjanya

>
>> Will look and have fix in v5.
> Nice!
>
> Thank you,
>
>          Hans
>
>> Thanks Hans.
>>
>>>>>>>> Note that this first test is basically identical to a rmmod/modpro=
be
>>>>>>>> of the driver. But when I compiled the driver as a module it didn'=
t
>>>>>>>> create any video device nodes! Nor did I see any errors in the
>>>>>>>> kernel
>>>>>>>> log. I didn't pursue this, and perhaps I did something wrong, but
>>>>>>>> it's
>>>>>>>> worth taking a look at.
>>>>>>>>
>>>>>>>> The next step would be to have a video node open with:
>>>>>>>>
>>>>>>>> v4l2-ctl --sleep 10
>>>>>>>>
>>>>>>>> then while it is sleeping unbind the driver and see what happens
>>>>>>>> when v4l2-ctl exits.
>>>>>>>>
>>>>>>>> Worst case is when you are streaming:
>>>>>>>>
>>>>>>>> v4l2-ctl --stream-mmap
>>>>>>>>
>>>>>>>> and then unbind.
>>>>>>>>
>>>>>>>> In general, the best way to get this to work correctly is:
>>>>>>>>
>>>>>>>> 1) don't use devm_*alloc
>>>>>>>> 2) set the release callback of struct v4l2_device and do all freei=
ng
>>>>>>>> there.
>>>>>>>> 3) in the platform remove() callback you call
>>>>>>>> media_device_unregister()
>>>>>>>>       and video_unregister_device().
>>>>>>> Reg 3, in current patch, media_device_unregister is called in
>>>>>>> host1x_video_remove
>>>>>>> video_unregister_device happens during host1x_video_remove ->
>>>>>>> host1x_device_exit -> tegra_vi_exit -> tegra_vi_channels_cleanup
>>>>>>>
>>>>>>>> It's worth getting this right in this early stage, rather than
>>>>>>>> fixing it
>>>>>>>> in the future.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>>
>>>>>>>>            Hans
