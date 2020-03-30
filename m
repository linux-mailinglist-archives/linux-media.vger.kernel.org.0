Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F6F1980C6
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 18:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbgC3QRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 12:17:20 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4053 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728165AbgC3QRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 12:17:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e821b5a0000>; Mon, 30 Mar 2020 09:16:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 30 Mar 2020 09:16:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 30 Mar 2020 09:16:39 -0700
Received: from [10.2.160.81] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Mar
 2020 16:16:38 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <28ab0071-2e04-d14b-9215-db421e71b6af@nvidia.com>
Date:   Mon, 30 Mar 2020 09:16:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5ca1583a-889e-abd0-f823-eab93f09a365@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585584986; bh=BDyZjLsZvX08sNWD83Q2/gdH9KJJfTOHcfzKdDEXKXk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=rDPyTh0GtJW05IFO5iIH7jX+2ODsOj93OyBhcaFZx+w3/KiE7aTA0YABNVRxE/Xt0
         FAhI5GAKg1hvZtculLzdFordQWyKCOqsvF4nTUpk7v0v2tsuIfwQYldWDQHw+5Gof4
         grL50aKwTXXxNYs2fmFxx446P7OwLQjGi78iepmTFm5DzBCdDajQNrqIFGtYArra8w
         s5c5rr6GrSsJApWMZ8mPKif8/ZHBsHfJLGa97ciz02PD2Ux0UOPzeIE150dnZbW6hY
         GSMlq/GAUG7Ydv3MB0LsrlGoL3dNdSvVBCVJCi3fuETnQY4yvHosyDBC4bzKMKWfYs
         c5lIAoLV+6uCw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/30/20 4:02 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> On 3/30/20 12:04 PM, Hans Verkuil wrote:
>> Hi Sowjanya,
>>
>> On 3/23/20 6:52 PM, Sowjanya Komatineni wrote:
>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>> generator (TPG) capture.
>>>
>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>
>>> This series has TPG support only where it creates hard media links
>>> between CSI subdevice and VI video device without device graphs.
>>>
>>> v4l2-compliance results are available below the patch diff.
>>>
>>> [v5]:        Includes,
>>>       - v4 feedback
>>>       - fix for venc powergate mc reset order.
>>>       - fix to have unbind and bind work during v4l2-ctl sleep and streaming.
>> Unfortunately, I still crash on this.
>>
>> I do the following:
>>
>> Run: v4l2-ctl --stream-mmap
>>
>> Then, from another shell as root:
>>
>> cd /sys/devices/platform/50000000.host1x/tegra-video/driver
>> echo -n tegra-video > unbind
>>
>> I get this crash:
>>
>> [  315.691971] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b0
>> [  315.700749] Mem abort info:
>> [  315.703536]   ESR = 0x96000004
>> [  315.706587]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [  315.711886]   SET = 0, FnV = 0
>> [  315.714933]   EA = 0, S1PTW = 0
>> [  315.718064] Data abort info:
>> [  315.720936]   ISV = 0, ISS = 0x00000004
>> [  315.724763]   CM = 0, WnR = 0
>> [  315.727726] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000178ee8000
>> [  315.734152] [00000000000000b0] pgd=0000000000000000
>> [  315.739024] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>> [  315.744584] Modules linked in: r8152 nouveau lp855x_bl tegra_drm ttm
>> [  315.750942] CPU: 3 PID: 2206 Comm: bash Tainted: G        W         5.6.0-rc1-arm64 #118
>> [  315.759017] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
>> [  315.764927] pstate: 20000085 (nzCv daIf -PAN -UAO)
>> [  315.769718] pc : _raw_write_lock_irqsave+0xb0/0x2b8
>> [  315.774590] lr : ida_free+0x48/0x158
>> [  315.778155] sp : ffff800011d8bba0
>> [  315.781462] x29: ffff800011d8bba0 x28: ffff0000f4095400
>> [  315.786766] x27: 0000000000000000 x26: 0000000000000000
>> [  315.792070] x25: 0000000000000000 x24: 0000000000000000
>> [  315.797372] x23: ffff0000f21ad400 x22: ffff0000f5c93000
>> [  315.802674] x21: ffff0000f4095400 x20: ffff0000f86b5540
>> [  315.807975] x19: 0000000000000000 x18: 0000000000000000
>> [  315.813276] x17: 0000000000000001 x16: 0000000000000019
>> [  315.818578] x15: 000000148ccdabe2 x14: 0000000000000136
>> [  315.823879] x13: 0000000000000001 x12: 00000000000003f8
>> [  315.829180] x11: 0000000000000000 x10: 0000000000000000
>> [  315.834482] x9 : ffff0000ff899990 x8 : ffff0000ff899000
>> [  315.839784] x7 : 0000000040000000 x6 : 0000000000210d00
>> [  315.845085] x5 : 0000000000000001 x4 : 0000000000000000
>> [  315.850386] x3 : 00000000000000b0 x2 : 0000000000000001
>> [  315.855687] x1 : 0000000000000000 x0 : 0000000000000001
>> [  315.860988] Call trace:
>> [  315.863432]  _raw_write_lock_irqsave+0xb0/0x2b8
>> [  315.867956]  ida_free+0x48/0x158
>> [  315.871184]  __media_device_unregister_entity+0x28/0xf0
>> [  315.876402]  media_device_unregister+0x6c/0x148
>> [  315.880927]  host1x_video_remove+0x20/0x48
>> [  315.885021]  host1x_device_remove+0x1c/0x30
>> [  315.889198]  device_release_driver_internal+0xf4/0x1c0
>> [  315.894325]  device_driver_detach+0x14/0x20
>> [  315.898503]  unbind_store+0xd4/0xf8
>> [  315.901986]  drv_attr_store+0x20/0x30
>> [  315.905645]  sysfs_kf_write+0x40/0x50
>> [  315.909301]  kernfs_fop_write+0xf8/0x210
>> [  315.913219]  __vfs_write+0x18/0x40
>> [  315.916616]  vfs_write+0xdc/0x1c8
>> [  315.919926]  ksys_write+0x68/0xf0
>> [  315.923235]  __arm64_sys_write+0x18/0x20
>> [  315.927154]  el0_svc_common.constprop.0+0x68/0x160
>> [  315.931936]  do_el0_svc+0x20/0x80
>> [  315.935246]  el0_sync_handler+0x10c/0x180
>> [  315.939246]  el0_sync+0x140/0x180
>> [  315.942560] Code: 8803fc02 35ffffa3 17fffda6 f9800071 (885ffc60)
>> [  315.948644] ---[ end trace e42b943f3c1af06c ]---
>>
>> The following diff fixes this:
>>
>> ------------------ cut here ------------------
>> diff --git a/drivers/staging/media/tegra/tegra-vi.c b/drivers/staging/media/tegra/tegra-vi.c
>> index 9714152aa6a7..53cf37af9602 100644
>> --- a/drivers/staging/media/tegra/tegra-vi.c
>> +++ b/drivers/staging/media/tegra/tegra-vi.c
>> @@ -583,7 +583,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
>>        /* initialize the video_device */
>>        chan->video->fops = &tegra_channel_fops;
>>        chan->video->v4l2_dev = &vid->v4l2_dev;
>> -     chan->video->release = video_device_release_empty;
>> +     chan->video->release = video_device_release;
>>        chan->video->queue = &chan->queue;
>>        snprintf(chan->video->name, sizeof(chan->video->name), "%s-%s-%u",
>>                 dev_name(vi->dev), "output", chan->portno);
>> @@ -647,6 +647,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
>>        media_entity_cleanup(&chan->video->entity);
>>   release_vdev:
>>        video_device_release(chan->video);
>> +     chan->video = NULL;
>>        return ret;
>>   }
>>
>> @@ -707,7 +708,6 @@ static void tegra_vi_channels_cleanup(struct tegra_vi *vi)
>>                        mutex_lock(&chan->video_lock);
>>                        vb2_queue_release(&chan->queue);
>>                        mutex_unlock(&chan->video_lock);
>> -                     video_device_release(chan->video);
>>                }
>>
>>                if (chan->frame_start_sp)
>> ------------------ cut here ------------------
> Note: Sakari suggested to embed struct video_device into struct tegra_vi_channel.
> In that case chan->video->release should remain video_device_release_empty and
> all video_device_alloc()/release() calls would have to be dropped.

Thanks Hans. Tried several unbind/unbind not sure why it did not repro 
during my testing.

video device is also part of tegra_vi_channel. So, v6 will remove 
video_device_alloc and use video_device_release_empty like I had in v3.

This should help fix crash during unbind.

>
> Regards,
>
>          Hans
