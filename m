Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD10E18A14E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 18:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgCRRQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 13:16:06 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:3950 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCRRQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 13:16:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7257480000>; Wed, 18 Mar 2020 10:15:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 18 Mar 2020 10:16:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 18 Mar 2020 10:16:05 -0700
Received: from [10.2.175.141] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 17:16:04 +0000
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
 <b301c247-537d-d78e-b057-a3225b10de7e@xs4all.nl>
 <dc592f29-3109-d10c-7df7-ffdb2755ade0@xs4all.nl>
 <b3933aa1-0717-183d-f00c-2d5fd6836a18@nvidia.com>
 <12a36c2a-593c-e555-d44e-e2e6c4c1a562@nvidia.com>
 <5f54c018-5670-8193-7c68-969f9bde92f6@xs4all.nl>
 <19081d90-62cc-e6eb-0337-f108fb6ca9bc@nvidia.com>
 <061eabf1-4b6f-83c0-6851-df8a193a84e8@nvidia.com>
Message-ID: <a5377068-3c70-1af4-6398-630d205e794b@nvidia.com>
Date:   Wed, 18 Mar 2020 10:17:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <061eabf1-4b6f-83c0-6851-df8a193a84e8@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584551752; bh=oBKNPTi9GLdtryL/j8HF1CfdlMDUDx2LP07rQWMZdTU=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=XU11EO/Fztnr3hGAYUHf3fIwU8CfkRR4/nx842XtN96L9Mhi1h+aWyNLvtQCdYkro
         18M4Pb1niPTJifZ8vx0a1xDqE8jgIfYWRdyopv0/QqVsZ+1MJkb/UosfaVYN0Np3Q7
         o9JSwPvj7qzGVang7q2bgTQLlSZhtkWDFpSwsPublH5QrFAb9rUWk2JNm3DqAo/zuR
         +uugeK+19xm8ckxWwB0tSAvj2+lkDl4v2lqV3mZnIyc6laiIEt5DA6/sHl/krvG+p0
         YOBRO0sC17o6Td8hVI//ptF8gilEfovPNpLAzHZJSirKQMqvZedZoP1El/DsJSRv/s
         nMZY7U/HZvt1g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/18/20 9:25 AM, Sowjanya Komatineni wrote:
>
> On 3/18/20 9:14 AM, Sowjanya Komatineni wrote:
>>
>> On 3/18/20 4:48 AM, Hans Verkuil wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 2/24/20 5:45 AM, Sowjanya Komatineni wrote:
>>>> On 2/20/20 11:11 AM, Sowjanya Komatineni wrote:
>>>>> On 2/20/20 5:33 AM, Hans Verkuil wrote:
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> (Replying to myself so I can explain this a bit more)
>>>>>>
>>>>>> On 2/20/20 1:44 PM, Hans Verkuil wrote:
>>>>>>>> +
>>>>>>>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct device_node *node =3D csi->dev->of_node=
;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int port_num;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_csi_channel *item;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int tpg_channels =3D csi->soc->csi_ma=
x_channels;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 /* allocate CSI channel for each CSI x2 ports =
*/
>>>>>>>> +=C2=A0=C2=A0=C2=A0 for (port_num =3D 0; port_num < tpg_channels; =
port_num++) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 item =3D devm_kzalloc(csi->dev, sizeof(*item),=20
>>>>>>>> GFP_KERNEL);
>>>>>>> Using devm_*alloc can be dangerous. If someone unbinds the=20
>>>>>>> driver, then
>>>>>>> all memory allocated with devm_ is immediately freed. But if an
>>>>>>> application
>>>>>>> still has a filehandle open, then when it closes it it might still
>>>>>>> reference
>>>>>>> this already-freed memory.
>>>>>>>
>>>>>>> I recommend that you avoid using devm_*alloc for media drivers.
>>>>>> A good test is to unbind & bind the driver:
>>>>>>
>>>>>> cd /sys/devices/platform/50000000.host1x/54080000.vi/driver
>>>>>> echo -n 54080000.vi >unbind
>>>>>> echo -n 54080000.vi >bind
>>>>>>
>>>>>> First just do this without the driver being used. That already
>>>>>> gives me 'list_del corruption' kernel messages (list debugging
>>>>>> is turned on in my kernel).
>>>> Will fix in v4 to use kzalloc and also proper release v4l2 to make=20
>>>> sure
>>>> unbind/bind works properly.
>>>>
>>>> BTW, tegra vi and csi are registered as clients to host1x video=20
>>>> driver.
>>>>
>>>> So, unbind and bind should be done with host1x video driver=20
>>>> "tegra-video"
>>>>
>>>> cd /sys/devices/platform/50000000.host1x/tegra-video/driver
>>>> echo -n tegra-video > unbind
>>>> echo -n tegra-video > bind
>>> This still crashes with v4, at least if I am streaming with v4l2-ctl=20
>>> --stream-mmap.
>>> Is that known?
>>>
>>> It's not a big deal at this moment, just want to know if this will=20
>>> be looked
>>> at later.
>>>
>>> Regards,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
>>
>> Weird, I tested streaming after unbind and bind as well and don't see=20
>> crash. Did below steps and tried several times unbind/bind as well.
>>
>> ./v4l2-ctl --stream-mmap --stream-count=3D1 -d /dev/video3
>> cd /sys/devices/platform/50000000.host1x/tegra-video/driver
>> echo -n tegra-video > unbind
>> sleep 1
>> echo -n tegra-video > bind
>> cd /home/ubuntu
>> ./v4l2-ctl --stream-mmap --stream-count=3D1 -d /dev/video3
>>
>> Can you post call trace when you saw crash?
>
> Tried unbind when=C2=A0 node is open with v4l2-ctl --sleep 10 as well and=
=20
> bind back.
>
> I don't see crash. Will confirm on doing unbind/bind with stream-mmap...
>
Able to repro when unbind/bind happens while stream-mmap.

Will look and have fix in v5.

Thanks Hans.

>>
>>>>>> Note that this first test is basically identical to a rmmod/modprobe
>>>>>> of the driver. But when I compiled the driver as a module it didn't
>>>>>> create any video device nodes! Nor did I see any errors in the=20
>>>>>> kernel
>>>>>> log. I didn't pursue this, and perhaps I did something wrong, but=20
>>>>>> it's
>>>>>> worth taking a look at.
>>>>>>
>>>>>> The next step would be to have a video node open with:
>>>>>>
>>>>>> v4l2-ctl --sleep 10
>>>>>>
>>>>>> then while it is sleeping unbind the driver and see what happens
>>>>>> when v4l2-ctl exits.
>>>>>>
>>>>>> Worst case is when you are streaming:
>>>>>>
>>>>>> v4l2-ctl --stream-mmap
>>>>>>
>>>>>> and then unbind.
>>>>>>
>>>>>> In general, the best way to get this to work correctly is:
>>>>>>
>>>>>> 1) don't use devm_*alloc
>>>>>> 2) set the release callback of struct v4l2_device and do all freeing
>>>>>> there.
>>>>>> 3) in the platform remove() callback you call=20
>>>>>> media_device_unregister()
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 and video_unregister_device().
>>>>> Reg 3, in current patch, media_device_unregister is called in
>>>>> host1x_video_remove
>>>>> video_unregister_device happens during host1x_video_remove ->
>>>>> host1x_device_exit -> tegra_vi_exit -> tegra_vi_channels_cleanup
>>>>>
>>>>>> It's worth getting this right in this early stage, rather than=20
>>>>>> fixing it
>>>>>> in the future.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
