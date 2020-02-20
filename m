Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96A8516623C
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 17:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgBTQVK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 11:21:10 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1264 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgBTQVK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 11:21:10 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4eb1e70001>; Thu, 20 Feb 2020 08:20:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 20 Feb 2020 08:21:09 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 20 Feb 2020 08:21:09 -0800
Received: from [10.2.163.58] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 16:21:09 +0000
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
 <920b4276-b2ca-646c-a21b-ca0b9bacf471@nvidia.com>
 <6bb124db-681c-55c1-e328-6e1f766a8bb3@nvidia.com>
 <0f84d37c-105f-8de6-c922-186d2f9ea156@nvidia.com>
 <44fc39f4-8e9f-bcab-8642-fe1cb332016a@xs4all.nl>
 <fb5f1566-9347-8f34-ada0-15c831cbc394@nvidia.com>
 <87c1c97d-abd7-8ca5-0709-d7c64a7d7b39@nvidia.com>
 <32ebc124-cb2d-f545-a5a0-d71192af8219@nvidia.com>
 <d1505a3b-92e0-4f98-1882-c56bdab7e2f6@xs4all.nl>
 <fc7b975a-dffa-4826-7ae5-40abb1f16b3d@nvidia.com>
 <3adacc07-7e3a-2d06-8d18-003b004ede17@nvidia.com>
 <dae3a6dd-f7ab-5e0f-08a9-2b0be4c68fe1@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <d896e74c-01f1-d164-7fd4-6d1fd29aaadc@nvidia.com>
Date:   Thu, 20 Feb 2020 08:21:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dae3a6dd-f7ab-5e0f-08a9-2b0be4c68fe1@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582215656; bh=W210gPNlC05Dr5SlJsLETmz5i6QrFId9t+sJFnKyOXc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=hOsLejPrXAzVhx4ATQzE29xGcs1aR/D+MMjtWRm6NyiN3SPJmJAe/0nehv43mLvyS
         6ahZDk5QcwfqTCAlYw7+Vu6kI/tl8Cwtb6T+qDU459/8J5RkI8aJQmKZkjGnDitUlO
         qZ6v7MS4B0MztsYDcvtn/3jz5JPIahchx8HZLypPdV3+h6Zz1ubNGIY7UpLzP56WvC
         8voSVAQuzTmOHorrZcQEFKDs/Vr0kT82mjM3jDHDDcWC7476L4UQoQCoVR/Z2+jEkl
         uhbfssS9ZViNB3lLMPlK15LHgl0fWDJW543tkkbvyKyqjJgj1DuNSYAyMIG5KdVl6q
         kvnkXm8dOvKVQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/20/20 1:29 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> On 2/20/20 1:09 AM, Sowjanya Komatineni wrote:
>>> Thanks Hans. Probably dma address is not aligned properly. Will check.
>>
>> I see this time repro happened right on power up during 1st run of
>> compliance test and it shows kernel write to read-only error right
>> during vb2_core_qbuf -> buf_prepare.
>>
>> it happened after buffers allocation and during pre-queuing of buffers
>> right before starting 1st stream on power up.
>>
>> Hi Thierry,
>>
>> Currently tegra vi driver don't use iommu. Could this be some issue with
>> contig allocation as iommu is not being used?
> Nothing to do with that. The root cause is that struct tegra_channel_buff=
er
> must start with struct vb2_v4l2_buffer since that's what vb2 assumes. Ins=
tead
> it starts with 'chan'. The really surprising thing is that this didn't ca=
use
> more problems sooner.
>
> The patch below fixes this KASAN error. Whether it also fixes the origina=
l
> error you found is something you need to test, but I think that's very li=
kely.
>
> Regards,
>
>          Hans

right, missed to notice. Thanks a lot hans. I think this fixes the error=20
I am seeing too.

Will fix and test...

>
> diff --git a/drivers/staging/media/tegra/tegra-common.h b/drivers/staging=
/media/tegra/tegra-common.h
> index 79ec550c6f27..3980a8759e68 100644
> --- a/drivers/staging/media/tegra/tegra-common.h
> +++ b/drivers/staging/media/tegra/tegra-common.h
> @@ -221,9 +221,9 @@ struct tegra_vi_channel {
>    * @mw_ack_sp_thresh: MW_ACK_DONE syncpoint threshold
>    */
>   struct tegra_channel_buffer {
> -       struct tegra_vi_channel *chan;
>          struct vb2_v4l2_buffer buf;
>          struct list_head queue;
> +       struct tegra_vi_channel *chan;
>          dma_addr_t addr;
>          u32 mw_ack_sp_thresh;
>   };
>
>
>>
>> [=C2=A0=C2=A0 54.041421]=C2=A0 tegra_channel_buffer_prepare+0x34/0x88
>> [=C2=A0=C2=A0 54.047666]=C2=A0 __buf_prepare+0x1c4/0x230
>> [=C2=A0=C2=A0 54.052094]=C2=A0 vb2_core_qbuf+0x454/0x508
>> [=C2=A0=C2=A0 54.056434]=C2=A0 __vb2_init_fileio+0x1f8/0x2b8
>> [=C2=A0=C2=A0 54.060519]=C2=A0 __vb2_perform_fileio+0x5a0/0x6b8
>> [=C2=A0=C2=A0 54.064864]=C2=A0 vb2_read+0x10/0x18
>> [=C2=A0=C2=A0 54.067996]=C2=A0 vb2_fop_read+0xb0/0xf8
>> [=C2=A0=C2=A0 54.071475]=C2=A0 v4l2_read+0x74/0xb8
>> [=C2=A0=C2=A0 54.074697]=C2=A0 __vfs_read+0x18/0x40
>> [=C2=A0=C2=A0 54.078003]=C2=A0 vfs_read+0x98/0x168
>> [=C2=A0=C2=A0 54.081222]=C2=A0 ksys_read+0x64/0xf0
>> [=C2=A0=C2=A0 54.084439]=C2=A0 __arm64_sys_read+0x14/0x20
>> [=C2=A0=C2=A0 54.088268]=C2=A0 el0_svc_common.constprop.2+0xb0/0x168
>> [=C2=A0=C2=A0 54.093047]=C2=A0 do_el0_svc_compat+0x18/0x38
>> [=C2=A0=C2=A0 54.096961]=C2=A0 el0_sync_compat_handler+0x13c/0x194
>> [=C2=A0=C2=A0 54.101565]=C2=A0 el0_sync_compat+0x144/0x180
>> [=C2=A0=C2=A0 54.105478] Code: b9407802 eb02007f 540001e8 b9007404 (f81f=
8001)
>> [=C2=A0=C2=A0 54.111559] ---[ end trace 7fbb77a9700492f1 ]---
>>
>>>>> [=C2=A0=C2=A0 41.222012] Mem abort info:
>>>>> [=C2=A0=C2=A0 41.224807]=C2=A0=C2=A0 ESR =3D 0x9600004f
>>>>> [=C2=A0=C2=A0 41.227852]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), =
IL =3D 32 bits
>>>>> [=C2=A0=C2=A0 41.233160]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
>>>>> [=C2=A0=C2=A0 41.236204]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
>>>>> [=C2=A0=C2=A0 41.239344] Data abort info:
>>>>> [=C2=A0=C2=A0 41.242225]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x0000004f
>>>>> [=C2=A0=C2=A0 41.246058]=C2=A0=C2=A0 CM =3D 0, WnR =3D 1
>>>>> [=C2=A0=C2=A0 41.249026] swapper pgtable: 4k pages, 48-bit VAs,
>>>>> pgdp=3D0000000081498000
>>>>> [=C2=A0=C2=A0 41.255733] [ffff0000f5c3fff8] pgd=3D000000017f1f8003,
>>>>> pud=3D000000017ec06003, pmd=3D000000017ea57003, pte=3D0060000175c3f79=
3
>>>>> [=C2=A0=C2=A0 41.266345] Internal error: Oops: 9600004f [#1] PREEMPT =
SMP
>>>>> [=C2=A0=C2=A0 41.271905] Modules linked in: panel_simple tegra_drm
>>>>> snd_hda_codec_hdmi snd_hda_tegra crct10dif_ce snd_hda_codec cec
>>>>> drm_kms_helper snd_hda_core lp855x_bl drm pwm_tegra ip_tables x_table=
s
>>>>> ipv6 nf_defrag_ipv6
>>>>> [=C2=A0=C2=A0 41.290401] CPU: 3 PID: 532 Comm: v4l2-compliance Tainte=
d: G
>>>>> W         5.6.0-rc1-00035-g6a105c1c479a-dirty #1
>>>>> [=C2=A0=C2=A0 41.300902] Hardware name: NVIDIA Jetson TX1 Developer K=
it (DT)
>>>>> [=C2=A0=C2=A0 41.306807] pstate: 60000005 (nZCv daif -PAN -UAO)
>>>>> [=C2=A0=C2=A0 41.311593] pc : tegra_channel_buffer_prepare+0x34/0x88
>>>>> [=C2=A0=C2=A0 41.316807] lr : __buf_prepare+0x1c4/0x230
>>>>> [=C2=A0=C2=A0 41.320891] sp : ffff800011f5baa0
>>>>> [=C2=A0=C2=A0 41.324195] x29: ffff800011f5baa0 x28: ffff0000f58cc100
>>>>> [=C2=A0=C2=A0 41.329494] x27: ffff800011f5bc58 x26: ffff80001100b780
>>>>> [=C2=A0=C2=A0 41.334792] x25: ffff0000f81f1608 x24: ffff0000f7be7c00
>>>>> [=C2=A0=C2=A0 41.340091] x23: 00000000c058565d x22: 0000000000000000
>>>>> [=C2=A0=C2=A0 41.345390] x21: ffff0000f81f16e8 x20: 0000000000000000
>>>>> [=C2=A0=C2=A0 41.350688] x19: ffff0000f5c40000 x18: 0000000000000000
>>>>> [=C2=A0=C2=A0 41.355986] x17: 0000000000000000 x16: 0000000000000000
>>>>> [=C2=A0=C2=A0 41.361285] x15: ffff0000f8553800 x14: 0000000000000000
>>>>> [=C2=A0=C2=A0 41.366583] x13: 003f480000000000 x12: 003f500000000000
>>>>> [=C2=A0=C2=A0 41.371881] x11: 0000000100000000 x10: 0000000000000000
>>>>> [=C2=A0=C2=A0 41.377180] x9 : 0000000000000000 x8 : ffff0000f5c40258
>>>>> [=C2=A0=C2=A0 41.382478] x7 : 0000000000000030 x6 : 0000000000000001
>>>>> [=C2=A0=C2=A0 41.387776] x5 : 0000000000000000 x4 : 00000000003f4800
>>>>> [=C2=A0=C2=A0 41.393074] x3 : 00000000003f4800 x2 : 00000000003f4800
>>>>> [=C2=A0=C2=A0 41.398373] x1 : ffff0000f81f1080 x0 : ffff0000f5c40000
>>>>> [=C2=A0=C2=A0 41.403671] Call trace:
>>>>> [=C2=A0=C2=A0 41.406109]=C2=A0 tegra_channel_buffer_prepare+0x34/0x88
>>>>> [=C2=A0=C2=A0 41.410974]=C2=A0 __buf_prepare+0x1c4/0x230
>>>>> [=C2=A0=C2=A0 41.414713]=C2=A0 vb2_core_prepare_buf+0x94/0x110
>>>>> [=C2=A0=C2=A0 41.418971]=C2=A0 vb2_prepare_buf+0x74/0xa8
>>>>> [=C2=A0=C2=A0 41.422710]=C2=A0 vb2_ioctl_prepare_buf+0x54/0x60
>>>>> [=C2=A0=C2=A0 41.426970]=C2=A0 v4l_prepare_buf+0x44/0x58
>>>>> [=C2=A0=C2=A0 41.430707]=C2=A0 __video_do_ioctl+0x228/0x3e8
>>>>> [=C2=A0=C2=A0 41.434705]=C2=A0 video_usercopy+0x1cc/0x4d0
>>>>> [=C2=A0=C2=A0 41.438531]=C2=A0 video_ioctl2+0x14/0x20
>>>>> [=C2=A0=C2=A0 41.442010]=C2=A0 v4l2_ioctl+0x44/0x68
>>>>> [=C2=A0=C2=A0 41.445316]=C2=A0 v4l2_compat_ioctl32+0x21c/0x1420
>>>>> [=C2=A0=C2=A0 41.449665]=C2=A0 __arm64_compat_sys_ioctl+0xc8/0x108
>>>>> [=C2=A0=C2=A0 41.454273]=C2=A0 el0_svc_common.constprop.2+0xb0/0x168
>>>>> [=C2=A0=C2=A0 41.459051]=C2=A0 do_el0_svc_compat+0x18/0x38
>>>>> [=C2=A0=C2=A0 41.462964]=C2=A0 el0_sync_compat_handler+0x13c/0x194
>>>>> [=C2=A0=C2=A0 41.467570]=C2=A0 el0_sync_compat+0x144/0x180
>>>>> [=C2=A0=C2=A0 41.471483] Code: b9407802 eb02007f 540001e8 b9007404 (f=
81f8001)
>>>>> [=C2=A0=C2=A0 41.477563] ---[ end trace 051c84051f60870a ]---
>>>>>
>>>>>>>>>>> With using minimum 3 buffers, this issue doesnt happen at all
>>>>>>>>>>> from
>>>>>>>>>>> almost 72 hours of testing.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Will try with setting vb2 queue field min_buffers_needed as 3
>>>>>>>>>>> instead
>>>>>>>>>>> of adding check in queue setup.
>>>>>>>>>>>
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +     return 0;
>>>>>>>>>>>>> +}
