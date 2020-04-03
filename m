Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7654019D146
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 09:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389785AbgDCHcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 03:32:02 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5148 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388221AbgDCHcC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 03:32:02 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e86e63f0000>; Fri, 03 Apr 2020 00:31:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 03 Apr 2020 00:32:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 03 Apr 2020 00:32:01 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 3 Apr
 2020 07:32:01 +0000
Received: from [10.2.164.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 3 Apr 2020
 07:31:59 +0000
Subject: Re: [RFC PATCH v5 0/9] Add Tegra driver for video capture
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <4bb6a3b8-3332-014b-e763-bce9076179dd@xs4all.nl>
 <5ca1583a-889e-abd0-f823-eab93f09a365@xs4all.nl>
 <28ab0071-2e04-d14b-9215-db421e71b6af@nvidia.com>
 <a8e6b937-de08-ce50-9eca-3b3a5ad2916c@nvidia.com>
 <2aa2f57c-57a3-ff43-48d9-6e1e5660cdf3@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <a2f18986-ea5a-0496-d576-08bf6bd5f709@nvidia.com>
Date:   Fri, 3 Apr 2020 00:31:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2aa2f57c-57a3-ff43-48d9-6e1e5660cdf3@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585899071; bh=jPD+ez3ZfPFa1N7Uv2A1XtCoxprjT5uIrvqbqYHfaMM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=NTZoGZlLE6aT48CSIQkU6tneIXh77ubmDz7dVJOUdDkSBzDGbPszb1vWoMqTdq3+v
         NxoX0gS+D3JAlH8e38DwGROZq6Dw792XBJLaKsM8GC0F52L46rucAMfYtZGUZV++rG
         D4b05c10NUTyNCe4novl0uqyzDk9cQIcIAoXCAjZtV9YS5M1As3mBcMiHKR97qdLw5
         /+trQg2tlL5IPTcuO/knVWMqp9RC03TwnbSUjXpOPPJ/mLM01mjoR4y1xcE2wIC5Ls
         yFBAcJ0BlErdqzvviKpjsv6y+MjERe7z7V75ohFKTRKRfZHf6N+rEjhZBPSVvEm6MJ
         FNcI+HiAKJ5HQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/3/20 12:19 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> On 4/3/20 7:45 AM, Sowjanya Komatineni wrote:
>> On 3/30/20 9:16 AM, Sowjanya Komatineni wrote:
>>> On 3/30/20 4:02 AM, Hans Verkuil wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 3/30/20 12:04 PM, Hans Verkuil wrote:
>>>>> Hi Sowjanya,
>>>>>
>>>>> On 3/23/20 6:52 PM, Sowjanya Komatineni wrote:
>>>>>> This series adds Tegra210 VI and CSI driver for built-in test patter=
n
>>>>>> generator (TPG) capture.
>>>>>>
>>>>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>>>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>>>>
>>>>>> This series has TPG support only where it creates hard media links
>>>>>> between CSI subdevice and VI video device without device graphs.
>>>>>>
>>>>>> v4l2-compliance results are available below the patch diff.
>>>>>>
>>>>>> [v5]:        Includes,
>>>>>>        - v4 feedback
>>>>>>        - fix for venc powergate mc reset order.
>>>>>>        - fix to have unbind and bind work during v4l2-ctl sleep and
>>>>>> streaming.
>>>>> Unfortunately, I still crash on this.
>>>>>
>>>>> I do the following:
>>>>>
>>>>> Run: v4l2-ctl --stream-mmap
>>>>>
>>>>> Then, from another shell as root:
>>>>>
>>>>> cd /sys/devices/platform/50000000.host1x/tegra-video/driver
>>>>> echo -n tegra-video > unbind
>>>>>
>>>>> I get this crash:
>>>>>
>>>>> [=C2=A0 315.691971] Unable to handle kernel NULL pointer dereference =
at
>>>>> virtual address 00000000000000b0
>>>>> [=C2=A0 315.700749] Mem abort info:
>>>>> [=C2=A0 315.703536]=C2=A0=C2=A0 ESR =3D 0x96000004
>>>>> [=C2=A0 315.706587]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =
=3D 32 bits
>>>>> [=C2=A0 315.711886]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
>>>>> [=C2=A0 315.714933]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
>>>>> [=C2=A0 315.718064] Data abort info:
>>>>> [=C2=A0 315.720936]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000004
>>>>> [=C2=A0 315.724763]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0
>>>>> [=C2=A0 315.727726] user pgtable: 4k pages, 48-bit VAs,
>>>>> pgdp=3D0000000178ee8000
>>>>> [=C2=A0 315.734152] [00000000000000b0] pgd=3D0000000000000000
>>>>> [=C2=A0 315.739024] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>>>>> [=C2=A0 315.744584] Modules linked in: r8152 nouveau lp855x_bl tegra_=
drm ttm
>>>>> [=C2=A0 315.750942] CPU: 3 PID: 2206 Comm: bash Tainted: G W
>>>>> 5.6.0-rc1-arm64 #118
>>>>> [=C2=A0 315.759017] Hardware name: NVIDIA Jetson TX1 Developer Kit (D=
T)
>>>>> [=C2=A0 315.764927] pstate: 20000085 (nzCv daIf -PAN -UAO)
>>>>> [=C2=A0 315.769718] pc : _raw_write_lock_irqsave+0xb0/0x2b8
>>>>> [=C2=A0 315.774590] lr : ida_free+0x48/0x158
>>>>> [=C2=A0 315.778155] sp : ffff800011d8bba0
>>>>> [=C2=A0 315.781462] x29: ffff800011d8bba0 x28: ffff0000f4095400
>>>>> [=C2=A0 315.786766] x27: 0000000000000000 x26: 0000000000000000
>>>>> [=C2=A0 315.792070] x25: 0000000000000000 x24: 0000000000000000
>>>>> [=C2=A0 315.797372] x23: ffff0000f21ad400 x22: ffff0000f5c93000
>>>>> [=C2=A0 315.802674] x21: ffff0000f4095400 x20: ffff0000f86b5540
>>>>> [=C2=A0 315.807975] x19: 0000000000000000 x18: 0000000000000000
>>>>> [=C2=A0 315.813276] x17: 0000000000000001 x16: 0000000000000019
>>>>> [=C2=A0 315.818578] x15: 000000148ccdabe2 x14: 0000000000000136
>>>>> [=C2=A0 315.823879] x13: 0000000000000001 x12: 00000000000003f8
>>>>> [=C2=A0 315.829180] x11: 0000000000000000 x10: 0000000000000000
>>>>> [=C2=A0 315.834482] x9 : ffff0000ff899990 x8 : ffff0000ff899000
>>>>> [=C2=A0 315.839784] x7 : 0000000040000000 x6 : 0000000000210d00
>>>>> [=C2=A0 315.845085] x5 : 0000000000000001 x4 : 0000000000000000
>>>>> [=C2=A0 315.850386] x3 : 00000000000000b0 x2 : 0000000000000001
>>>>> [=C2=A0 315.855687] x1 : 0000000000000000 x0 : 0000000000000001
>>>>> [=C2=A0 315.860988] Call trace:
>>>>> [=C2=A0 315.863432]=C2=A0 _raw_write_lock_irqsave+0xb0/0x2b8
>>>>> [=C2=A0 315.867956]=C2=A0 ida_free+0x48/0x158
>>>>> [=C2=A0 315.871184]=C2=A0 __media_device_unregister_entity+0x28/0xf0
>>>>> [=C2=A0 315.876402]=C2=A0 media_device_unregister+0x6c/0x148
>>>>> [=C2=A0 315.880927]=C2=A0 host1x_video_remove+0x20/0x48
>>>>> [=C2=A0 315.885021]=C2=A0 host1x_device_remove+0x1c/0x30
>>>>> [=C2=A0 315.889198]=C2=A0 device_release_driver_internal+0xf4/0x1c0
>>>>> [=C2=A0 315.894325]=C2=A0 device_driver_detach+0x14/0x20
>>>>> [=C2=A0 315.898503]=C2=A0 unbind_store+0xd4/0xf8
>>>>> [=C2=A0 315.901986]=C2=A0 drv_attr_store+0x20/0x30
>>>>> [=C2=A0 315.905645]=C2=A0 sysfs_kf_write+0x40/0x50
>>>>> [=C2=A0 315.909301]=C2=A0 kernfs_fop_write+0xf8/0x210
>>>>> [=C2=A0 315.913219]=C2=A0 __vfs_write+0x18/0x40
>>>>> [=C2=A0 315.916616]=C2=A0 vfs_write+0xdc/0x1c8
>>>>> [=C2=A0 315.919926]=C2=A0 ksys_write+0x68/0xf0
>>>>> [=C2=A0 315.923235]=C2=A0 __arm64_sys_write+0x18/0x20
>>>>> [=C2=A0 315.927154]=C2=A0 el0_svc_common.constprop.0+0x68/0x160
>>>>> [=C2=A0 315.931936]=C2=A0 do_el0_svc+0x20/0x80
>>>>> [=C2=A0 315.935246]=C2=A0 el0_sync_handler+0x10c/0x180
>>>>> [=C2=A0 315.939246]=C2=A0 el0_sync+0x140/0x180
>>>>> [=C2=A0 315.942560] Code: 8803fc02 35ffffa3 17fffda6 f9800071 (885ffc=
60)
>>>>> [=C2=A0 315.948644] ---[ end trace e42b943f3c1af06c ]---
>>>>>
>>>>> The following diff fixes this:
>>>>>
>>>>> ------------------ cut here ------------------
>>>>> diff --git a/drivers/staging/media/tegra/tegra-vi.c
>>>>> b/drivers/staging/media/tegra/tegra-vi.c
>>>>> index 9714152aa6a7..53cf37af9602 100644
>>>>> --- a/drivers/staging/media/tegra/tegra-vi.c
>>>>> +++ b/drivers/staging/media/tegra/tegra-vi.c
>>>>> @@ -583,7 +583,7 @@ static int tegra_channel_init(struct
>>>>> tegra_vi_channel *chan)
>>>>>         /* initialize the video_device */
>>>>>         chan->video->fops =3D &tegra_channel_fops;
>>>>>         chan->video->v4l2_dev =3D &vid->v4l2_dev;
>>>>> -     chan->video->release =3D video_device_release_empty;
>>>>> +     chan->video->release =3D video_device_release;
>>>>>         chan->video->queue =3D &chan->queue;
>>>>>         snprintf(chan->video->name, sizeof(chan->video->name),
>>>>> "%s-%s-%u",
>>>>>                  dev_name(vi->dev), "output", chan->portno);
>>>>> @@ -647,6 +647,7 @@ static int tegra_channel_init(struct
>>>>> tegra_vi_channel *chan)
>>>>>         media_entity_cleanup(&chan->video->entity);
>>>>>    release_vdev:
>>>>>         video_device_release(chan->video);
>>>>> +     chan->video =3D NULL;
>>>>>         return ret;
>>>>>    }
>>>>>
>>>>> @@ -707,7 +708,6 @@ static void tegra_vi_channels_cleanup(struct
>>>>> tegra_vi *vi)
>>>>>                         mutex_lock(&chan->video_lock);
>>>>>                         vb2_queue_release(&chan->queue);
>>>>>                         mutex_unlock(&chan->video_lock);
>>>>> -                     video_device_release(chan->video);
>>>>>                 }
>>>>>
>>>>>                 if (chan->frame_start_sp)
>>>>> ------------------ cut here ------------------
>>>> Note: Sakari suggested to embed struct video_device into struct
>>>> tegra_vi_channel.
>>>> In that case chan->video->release should remain
>>>> video_device_release_empty and
>>>> all video_device_alloc()/release() calls would have to be dropped.
>>> Thanks Hans. Tried several unbind/unbind not sure why it did not repro
>>> during my testing.
>>>
>>> video device is also part of tegra_vi_channel. So, v6 will remove
>>> video_device_alloc and use video_device_release_empty like I had in v3.
>>>
>>> This should help fix crash during unbind.
>>>
>>>> Regards,
>>>>
>>>>           Hans
>> With video device being part of the channel structure, it gets allocated
>> along with vi channel allocation during host1x vi client init and is
>> removed during channel free which happens during host1x vi client exit.
>>
>> Wit this during driver unbind with video node kept opened with v4l2-ctl
>> sleep, it crashes during media_device_unregister_entity.
>>
>> Using, separate video device allocation and freeing allocation during
>> video device release callback,  driver unbind works  as by the time of
>> entity unregister its it still available.
>>
>> So, will keep allocating video device separately with video_device_alloc
>> and will use video_device_release call back in v6.
>>
> Sounds good. Add a comment before video_device_alloc() explaining why it =
is
> used instead of embedding it in the vi channel data structure.
>
> Regards,
>
>          Hans

Other option I was thinking is to add tegra channel specific release=20
callback and use that for video device release so video lock destroy and=20
freeing channel free can be done in the last.

With this we don't need to do have separate video device allocation.

