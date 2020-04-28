Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BC81BC332
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 17:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbgD1PXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 11:23:00 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18888 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728263AbgD1PXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 11:23:00 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea84a120000>; Tue, 28 Apr 2020 08:21:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 28 Apr 2020 08:22:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 28 Apr 2020 08:22:59 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 15:22:59 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 15:22:58 +0000
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
 <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
 <3ef69413-a606-b475-f530-d5534760b73b@nvidia.com>
 <2b334095-fadb-bf0a-f7a8-62fc798c2bd2@gmail.com>
 <18a7b095-7f0f-7819-c786-7e011cfd14ed@nvidia.com>
 <ce31e273-f424-f13e-5cd6-0db2589a2a10@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <5741d5d3-e474-e23c-4841-809df5760067@nvidia.com>
Date:   Tue, 28 Apr 2020 08:22:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ce31e273-f424-f13e-5cd6-0db2589a2a10@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588087314; bh=AkjfhPNmeEPLibPX6tD4XOxStK0A8MLP7iHxDB8Tsbc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=iSzLyT80me+v4+s5FSTpDKbJmGj7E7420aLNOgfqVC1JsyRRUrsiijEMOlSItbyBu
         1+mROXzhb4Vpj6PX+LB/s8f07KbTlos5N5QtXxkYoFFKouA6ueBC1gxZ0/khCtHEE3
         TagMqfGqPbQeCUpjOFYGYry6ZG45TO0gODklxcbSa6pkKuLA1+fTbxXHnSD8CRmOF9
         79Bdnxph46CqPBJZPy94hPHK8C1Da4pqWJ6TKW/Qix36rbEFRrX/Ghw5Okt45gftVq
         okAllTBtMk6Z1+FQMGHoWVQDsPsQU8RQ1uKqL/2YChjk+4966Ni43jzhXhLuH7QOkF
         zoZboamtJbXjw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/28/20 8:15 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 28.04.2020 18:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/28/20 7:59 AM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 28.04.2020 17:51, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 4/28/20 6:59 AM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 28.04.2020 07:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> diff --git a/drivers/staging/media/tegra-video/csi.c
>>>>>> b/drivers/staging/media/tegra-video/csi.c
>>>>>> index b3dd0c3..29ccdae 100644
>>>>>> --- a/drivers/staging/media/tegra-video/csi.c
>>>>>> +++ b/drivers/staging/media/tegra-video/csi.c
>>>>>> @@ -272,8 +272,25 @@ static int tegra_csi_s_stream(struct v4l2_subde=
v
>>>>>> *subdev, int enable)
>>>>>>          struct tegra_vi_channel *chan =3D
>>>>>> v4l2_get_subdev_hostdata(subdev);
>>>>>>          struct tegra_csi_channel *csi_chan =3D to_csi_chan(subdev);
>>>>>>          struct tegra_csi *csi =3D csi_chan->csi;
>>>>>> +     int ret;
>>>>>> +
>>>>>> +     if (enable && atomic_add_return(1, &csi->clk_refcnt) =3D=3D 1)=
 {
>>>>>> +             ret =3D pm_runtime_get_sync(csi->dev);
>>>>>> +             if (ret < 0) {
>>>>>> +                     dev_err(csi->dev,
>>>>>> +                             "failed to get runtime PM: %d\n", ret)=
;
>>>>>> +                     pm_runtime_put_noidle(csi->dev);
> Why this pm_runtime_put_noidle() is needed? This should be wrong, please
> remove it.

pm_runtime_get_sync() increments power.usage_count prior to rpm_resume

if rpm_resume fails it does not decrement usage_count.

So to balance count on failure, calling pm_runtime_put_noidle()

>
>>>>>> +                     atomic_dec(&csi->clk_refcnt);
>>>>>> +                     return ret;
>>>>>> +             }
>>>>>> +     }
>>>>>> +
>>>>>> +     ret =3D csi->ops->csi_streaming(csi_chan, chan->pg_mode, enabl=
e);
>>>>>>
>>>>>> -     return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable=
);
>>>>>> +     if ((ret < 0 || !enable) &&
>>>>>> atomic_dec_and_test(&csi->clk_refcnt))
>>>>>> +             pm_runtime_put_sync(csi->dev);
>>>>> Runtime PM maintains its own refcount, why these
>>>>> clk_refcnt/power_on_refcnt are needed?
>>>> Streaming is per channel and we can't turn power/clocks off while othe=
r
>>>> channels may still be running.
>>>>
>>> All channels use the same CSI device. You should remove the custom
>>> refcounting.
>>>
>>> BTW, next time you'll really need to do refcounting, use the generic
>>> kref.
>> Before channel stream we enable power/clocks and after streaming we stop=
.
>>
>> So without refcount, on stream stop of any of the channel RPM put turns
>> power/clock but other channels will still be streaming.
>>
> Runtime PM uses its own refcounting. Please consult the RPM code and
> documentation.
>
> https://elixir.bootlin.com/linux/v5.7-rc3/source/include/linux/pm_runtime=
.h#L78
> https://elixir.bootlin.com/linux/v5.7-rc3/source/drivers/base/power/runti=
me.c#L1079
Got it. Will remove refcount for RPM put/get
