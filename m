Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7D51AB135
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 21:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411764AbgDOTIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 15:08:01 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16580 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1416839AbgDOSjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 14:39:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9754e60000>; Wed, 15 Apr 2020 11:39:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 Apr 2020 11:39:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 Apr 2020 11:39:47 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 18:39:47 +0000
Received: from [10.2.171.241] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 18:39:45 +0000
Subject: Re: [RFC PATCH v7 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1586919463-30542-1-git-send-email-skomatineni@nvidia.com>
 <1586919463-30542-7-git-send-email-skomatineni@nvidia.com>
 <4118112f-f865-5460-6319-d71271fd78d1@gmail.com>
 <a69a8b34-beea-3ad0-e08e-f7df8b9e7047@nvidia.com>
 <6afa951e-d904-f3c0-053f-82a02fb18979@nvidia.com>
 <b1c78827-13ea-0c94-a575-97b5afc0ede1@nvidia.com>
 <5954a7e1-910e-7f48-56d3-e671b56ead74@nvidia.com>
Message-ID: <d6a9e07c-474a-a076-8313-32f5f4ca8d64@nvidia.com>
Date:   Wed, 15 Apr 2020 11:39:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5954a7e1-910e-7f48-56d3-e671b56ead74@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586975974; bh=bj1JU93QUtj6XE2pESqqLx+9eAZKuOxThZc8Fa8Ddm8=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=ODAERagHyuXeifj8U3Md7Ywax9thXdz80EoKGVKw0ivRqJcYOV6nLj2hzq3cpmS95
         nOAhofJ78QwV7ol0tIf4xdj/qDDLGO0JqUfXv8eHM9zPdRn0xoRRdFK5si2LISEP4X
         9y3HCohmzKZzB58rE1BuSI5SCBfq1hnImRbUS0a8zkmmzvJpy3JAVB+o36SWNQIo3y
         pQ4ShRAFxyv5Z2VkS3QYXq1i33i9E6OFagtepWhT7vvkoWYgE7lTWQ2ZrSSOzqDshz
         IOuP11R0Tgj6m7XxJUc3gdnIHt3ByBinGoPtNAWRSw/3yZyDEh3By7XQqLVIH+4WsH
         DyYLgX2weqkkw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/15/20 10:48 AM, Sowjanya Komatineni wrote:
>
> On 4/15/20 10:47 AM, Sowjanya Komatineni wrote:
>>
>> On 4/15/20 10:21 AM, Sowjanya Komatineni wrote:
>>>
>>> On 4/15/20 9:54 AM, Sowjanya Komatineni wrote:
>>>>
>>>> On 4/15/20 7:22 AM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 15.04.2020 05:57, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> +static int tegra_csi_remove(struct platform_device *pdev)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi *csi =3D platform_get_drv=
data(pdev);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int err;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 err =3D host1x_client_unregister(&csi->cli=
ent);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dev_err(csi->dev,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to unregiste=
r host1x client: %d\n",=20
>>>>>> err);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return err;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_disable(csi->dev);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 kfree(csi);
>>>>> IIRC, the driver removal is invoked on the unbinding. Hence, I'm not
>>>>> sure how moving away from the resource-managed API helps here.=20
>>>>> Could you
>>>>> please explain in a more details?
>>>>>
>>>>> Have you tried to test this driver under KASAN? I suspect that you=20
>>>>> just
>>>>> masked the problem, instead of fixing it.
>>>> Using devm_kzalloc for vi/csi structures based on prior feedback=20
>>>> request to switch to use kzalloc all over this driver.
>>>>
>>>> Hi Hans,
>>>>
>>>> video devices lifetime is till video device nodes are released. So,=20
>>>> v4l2 device release callback does the release of tegra channel=20
>>>> allocation which hold video device.
>>>>
>>>> Below are the 3 possible cases of unbind/unload,
>>>>
>>>> 1. during tegra-video module unload, if v4l2 device refcnt is not 0=20
>>>> which is the case when any of video device node handle is kept=20
>>>> opened then unloading module will not happen and module refcnt is=20
>>>> also non-zero and unloading tegra-video module reports module in use.
v4l2 device is associated with host1x device where during=20
v4l2_device_register get_device causes refcnt of tegra video host1x=20
device to increase and prevents allowing module unload/load till v4l2=20
device release happens.


>>>> 2. during tegra-video driver unbind, tegra-video driver removal=20
>>>> will do vi/csi clients exit ops which unregisters video device=20
>>>> allocated memory during release callback of v4l2 device. vi/csi=20
>>>> structure allocation remains same as vi/csi driver removal will not=20
>>>> happen in this case.
>>>>
>>>>
>>>> 3. during direct host1x client drivers vi/csi unbind, both=20
>>>> host1x_clients vi/csi gets unregistered, deletes host1x logical=20
>>>> device which executes tegra-video driver removal() -> vi/csi exit()=20
>>>> before vi/csi memory gets freed in vi/csi driver remove().
>>>>
>>>> So, any active streaming will stop and video devices are=20
>>>> unregistered during direct client driver unbind prior to freeing=20
>>>> vi/csi memory.
>>>>
>>>> Also vi/csi driver remove does explicit free vi/csi as its=20
>>>> allocated with kzalloc. So not sure how using kzalloc is different=20
>>>> to devm_kzalloc for vi/csi structure in terms of when vi/csi memory=20
>>>> gets freed?
>>>>
>>>> Except for channel allocation which holds video device and as video=20
>>>> device life time is beyond tegra-video module unbind->vi exit(),=20
>>>> looks like we can use devm_kzalloc for vi/csi.
>>>>
>>>>
>>>> Can you please comment if you still think we need to use kzalloc=20
>>>> rather than devm_kzalloc for vi/csi structure allocation?
>>>>
>>>> Thanks
>>>>
>>>> Sowjanya
>>>>
>>> One more case is when video device node is kept opened with v4l2-ctl=20
>>> sleep (rather than streaming), where it will keep device node open=20
>>> for specified time and if direct vi client driver unbind happens=20
>>> then vi driver remove() will free vi memory before v4l2 device=20
>>> release happens.
>>>
>>> But I don't see any crash or errors with this case.

In the above case, channels allocated memory release may not happen in=20
this case as list head pointer will be gone when vi memory is freed=20
during direct client unbind and by the time v4l2 device release callback=20
gets executed vi channels list head is gone.

Also, freeing vi structure memory can't be done in v4l2 device release=20
callback either.

>>>
>>> Also if we allow direct client driver unbind, then vi structure=20
>>> memory lifetime should also be till v4l2 device release happens.
>>>
>>> But we can free vi in v4l2 device release callback as in case when=20
>>> device node is not kept opened, video device release happens=20
>>> immediate and we cant free vi that early.
>>
>> typo fix:
>>
>> But we can't free vi structure memory allocation in v4l2 device=20
>> release callback as in case when device node is not kept opened,=20
>> device release happens immediate and we can't free vi structure=20
>> memory that early.
>>

>>> Hans/Thierry, Can you please comment on this case?
>>>
>>> Thanks
>>>
>>> Sowjanya
>>>
> Also, Can you please help explain on cases where we do/need direct=20
> host1x clients vi/csi drivers unbind?
