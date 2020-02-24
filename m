Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4CD169D26
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 05:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbgBXEpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Feb 2020 23:45:11 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16566 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbgBXEpL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Feb 2020 23:45:11 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e53548a0000>; Sun, 23 Feb 2020 20:43:54 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 23 Feb 2020 20:45:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 23 Feb 2020 20:45:10 -0800
Received: from [10.2.163.13] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Feb
 2020 04:45:09 +0000
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
Message-ID: <12a36c2a-593c-e555-d44e-e2e6c4c1a562@nvidia.com>
Date:   Sun, 23 Feb 2020 20:45:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b3933aa1-0717-183d-f00c-2d5fd6836a18@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582519434; bh=FgL2m4fXOwXtVm1YDLzjj9gGq1pHL5mo0ZGAZTooP+k=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=mhvItGsYXSiFtNz1X3+DppRrTX+dFSreZSJx2j4/v3zXgHP8Ggd0Hdj6pvi2ELyH7
         QfLmADm0c7h5+P5+3UNFCVSAWL0/6ou70OdYiJIDnWuwgUhPoxcAuoav6wO76qjjy2
         OtBvX67nahf+Vn9zGizDtg2jIN6/tqEL/jog+trcZZVg06/5EkjFBoac3V2CKhEihZ
         08HY9spxNs0lkvTr5HyvM+jH6C8tveHsTtP/WrA0xbTcbLIiR8EvQ7U8AW/tfn8Rhf
         71HujkEU9IiYYq+bk3KQaYba7YB6Sh/j8uZLxyo8XRWvGmX6S7tBJXPaEAiKFByynm
         Qz09Y9N8qfTvA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/20/20 11:11 AM, Sowjanya Komatineni wrote:
>
> On 2/20/20 5:33 AM, Hans Verkuil wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> (Replying to myself so I can explain this a bit more)
>>
>> On 2/20/20 1:44 PM, Hans Verkuil wrote:
>>>> +
>>>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct device_node *node =3D csi->dev->of_node;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int port_num;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_csi_channel *item;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int tpg_channels =3D csi->soc->csi_max_ch=
annels;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* allocate CSI channel for each CSI x2 ports */
>>>> +=C2=A0=C2=A0=C2=A0 for (port_num =3D 0; port_num < tpg_channels; port=
_num++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it=
em =3D devm_kzalloc(csi->dev, sizeof(*item), GFP_KERNEL);
>>> Using devm_*alloc can be dangerous. If someone unbinds the driver, then
>>> all memory allocated with devm_ is immediately freed. But if an=20
>>> application
>>> still has a filehandle open, then when it closes it it might still=20
>>> reference
>>> this already-freed memory.
>>>
>>> I recommend that you avoid using devm_*alloc for media drivers.
>> A good test is to unbind & bind the driver:
>>
>> cd /sys/devices/platform/50000000.host1x/54080000.vi/driver
>> echo -n 54080000.vi >unbind
>> echo -n 54080000.vi >bind
>>
>> First just do this without the driver being used. That already
>> gives me 'list_del corruption' kernel messages (list debugging
>> is turned on in my kernel).

Will fix in v4 to use kzalloc and also proper release v4l2 to make sure=20
unbind/bind works properly.

BTW, tegra vi and csi are registered as clients to host1x video driver.

So, unbind and bind should be done with host1x video driver "tegra-video"

cd /sys/devices/platform/50000000.host1x/tegra-video/driver
echo -n tegra-video > unbind
echo -n tegra-video > bind

>>
>> Note that this first test is basically identical to a rmmod/modprobe
>> of the driver. But when I compiled the driver as a module it didn't
>> create any video device nodes! Nor did I see any errors in the kernel
>> log. I didn't pursue this, and perhaps I did something wrong, but it's
>> worth taking a look at.
>>
>> The next step would be to have a video node open with:
>>
>> v4l2-ctl --sleep 10
>>
>> then while it is sleeping unbind the driver and see what happens
>> when v4l2-ctl exits.
>>
>> Worst case is when you are streaming:
>>
>> v4l2-ctl --stream-mmap
>>
>> and then unbind.
>>
>> In general, the best way to get this to work correctly is:
>>
>> 1) don't use devm_*alloc
>> 2) set the release callback of struct v4l2_device and do all freeing=20
>> there.
>> 3) in the platform remove() callback you call media_device_unregister()
>> =C2=A0=C2=A0=C2=A0 and video_unregister_device().
> Reg 3, in current patch, media_device_unregister is called in=20
> host1x_video_remove
> video_unregister_device happens during host1x_video_remove ->=20
> host1x_device_exit -> tegra_vi_exit -> tegra_vi_channels_cleanup
>
>> It's worth getting this right in this early stage, rather than fixing it
>> in the future.
>>
>> Regards,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
