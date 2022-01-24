Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6023D498421
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240846AbiAXQCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240811AbiAXQCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:02:55 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8406C06173B
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 08:02:54 -0800 (PST)
Received: from [IPv6:2a00:c281:1137:e00:5903:19ba:8e99:7984] (unknown [IPv6:2a00:c281:1137:e00:5903:19ba:8e99:7984])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0A9D31F43A42;
        Mon, 24 Jan 2022 16:02:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1643040172;
        bh=UhneTR5I18LoK6uCIUQm4le1tw3fEW+s/V2SM3/xU0Y=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=QX9l//U85ddcVx8VsJNNrQy7QDmbaZ2ZvI+NSct3/xCP7ghYWfXB9f0aqSv7QBSrO
         pLSLehGjzpI6XBZhIPW0y1mVltBsbAdUTiCq1/EfcRMRSpx2Iyr/ojKLrFT3AaUP/K
         Ygr3a/RDOqPAcTNA1zb0z+WYwm+VXI75/zlsxObJIpSKWG/89sqeXVsqJEjYkq0GFW
         Drsaw86nepPMYcvanJBR6nT2sTQrNEk8Qh3imrJTfTL+2C7+wg63CcSSQv4p+EoI4s
         N0t/cTgrilk2+9HIzaSXjKDlJ8htemzKRtiEccO3OSPgoLqanmrASugmkSzVo0y192
         NTxTk95NEmZrg==
Subject: Re: [PATCH 3/3] media: stk1160: use dma_alloc_noncontiguous API
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de, kernel@collabora.com
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
 <20220111065505.6323-4-dafna.hirschfeld@collabora.com>
 <Yd16PXCDGwF5V7aK@eze-laptop>
 <7f64ed7f-5076-1d22-1922-9d39515125a0@collabora.com>
Message-ID: <45e206c0-bb83-66dd-df92-613c99495e75@collabora.com>
Date:   Mon, 24 Jan 2022 18:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7f64ed7f-5076-1d22-1922-9d39515125a0@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 24.01.22 16:43, Dafna Hirschfeld wrote:
> 
> 
> On 11.01.22 14:38, Ezequiel Garcia wrote:
>> Hi Dafna,
>>
>> Very nice work.
>>
>> I specially like all the testing that you mentioned in the cover-letter.
>>
>> Back in the day, there were a few users trying to use STK1160 (Easycap)
>> with Beaglebone boards, without success due to lack of USB throughput.
> 
> Hi, what do you mean by "USB throughput" ?
> I see that the FPS does not change with this patchset and stands on about 25 frames/sec
> So this patchset only improve cpu time.
> 
>>
>> If anything else, I think it's good to see additional noncontiguous API users.
>>
>> On Tue, Jan 11, 2022 at 08:55:05AM +0200, Dafna Hirschfeld wrote:
>>> Replace the urb buffers allocation to
>>> use the noncontiguous API. This improve performance
>>> on Arm.
>>> The noncontiguous API require handling
>>> synchronization.
>>> This commit is similar to the one sent to
>>> uvc: [1]
>>>
>>> [1] https://lkml.org/lkml/2021/3/12/1506
>>>
>>
>> This commit description needs lots of attention. In particular,
>> please add the test results here.
>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>>   drivers/media/usb/stk1160/stk1160-v4l.c   |   3 +
>>>   drivers/media/usb/stk1160/stk1160-video.c | 109 +++++++++++++---------
>>>   drivers/media/usb/stk1160/stk1160.h       |  10 ++
>>>   3 files changed, 79 insertions(+), 43 deletions(-)
>>>
>> [..]
>>> @@ -501,7 +524,7 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
>>>   free_i_bufs:
>>>       /* Save the allocated buffers so far, so we can properly free them */
>>> -    dev->isoc_ctl.num_bufs = i+1;
>>> +    dev->isoc_ctl.num_bufs = i;
>>
>> This looks like a separate fix, similar to 1/3 ?
>>
>>>       stk1160_free_isoc(dev);
>>>       return -ENOMEM;
>>>   }
>>> diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
>>> index 1ffca1343d88..52bea7815ae5 100644
>>> --- a/drivers/media/usb/stk1160/stk1160.h
>>> +++ b/drivers/media/usb/stk1160/stk1160.h
>>> @@ -16,6 +16,8 @@
>>>   #include <media/videobuf2-v4l2.h>
>>>   #include <media/v4l2-device.h>
>>>   #include <media/v4l2-ctrls.h>
>>> +#include <linux/usb.h>
>>> +#include <linux/usb/hcd.h>
>>>   #define STK1160_VERSION        "0.9.5"
>>>   #define STK1160_VERSION_NUM    0x000905
>>> @@ -87,6 +89,9 @@ struct stk1160_buffer {
>>>   struct stk1160_urb {
>>>       struct urb *urb;
>>>       char *transfer_buffer;
>>> +    struct sg_table *sgt;
>>> +    struct stk1160 *dev;
>>> +    dma_addr_t dma;
>>>   };
>>>   struct stk1160_isoc_ctl {
>>> @@ -190,3 +195,8 @@ void stk1160_select_input(struct stk1160 *dev);
>>>   /* Provided by stk1160-ac97.c */
>>>   void stk1160_ac97_setup(struct stk1160 *dev);
>>> +
>>> +static inline struct device *stk1160_get_dmadev(struct stk1160 *dev)
>>> +{
>>> +    return bus_to_hcd(dev->udev->bus)->self.sysdev;
>>
>> This function looks truly horrible, is there no other way to get the device ?
>>
>> I suppose this function return something different than (struct stk1160*)dev->dev ?
> 
> I remember I tried using this device and got an error that it is not cable of doing dma
> allocations or something like that. The function "stk1160_get_dmadev" is a copy-paste from the
> uvc equivalent:
> 
> static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
> {
>          return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> }
> 
> Thanks,
> Dafna

There are 3 'struct device' related, when printing their names with:

         pr_err("dmadev device is %s\n", dev_name(stk1160_get_dmadev(dev)));
         pr_err("udev->dev device is %s\n", dev_name(&dev->udev->dev));
         pr_err("dev device is %s\n", dev_name(dev->dev));

I get:

[  107.770870] dmadev device is fe900000.usb
[  107.771253] udev->dev device is 7-1
[  107.771561] dev device is 7-1:1.0

If I try to use 'dev->dev' instead of the above stk1160_get_dmadev,
streaming fails and I get two warnings. The first one is originated from:

https://elixir.bootlin.com/linux/v5.16-rc4/source/kernel/dma/mapping.c#L546

Which is:
WARN_ON_ONCE(!dev->coherent_dma_mask)

I wonder if that warning is required in our case since we remove the alloc_coherent usage.

The second warning in videobuf2-core.c:1612 seems to be a bug in the driver itself.
I'll look at that.


[   65.554406] ------------[ cut here ]------------
[   65.554815] WARNING: CPU: 1 PID: 593 at /home/dafna/git/easycap_media_tree/kernel/dma/mapping.c:546 __dma_alloc_pages+0x78/0xc8
[   65.555836] Modules linked in: snd_usb_audio snd_hwdep snd_usbmidi_lib snd_rawmidi snd_soc_hdmi_codec dw_hdmi_i2s_audio saa7115 stk1160 videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc crct10dif_ce panfrost snd_soc_simple_card snd_soc_audio_graph_card snd_soc_spdif_tx snd_soc_simple_card_utils gpu_sched phy_rockchip_pcie snd_soc_rockchip_i2s rockchipdrm analogix_dp dw_mipi_dsi dw_hdmi cec drm_kms_helper drm rtc_rk808 rockchip_saradc industrialio_triggered_buffer kfifo_buf rockchip_thermal pcie_rockchip_host ip_tables x_tables ipv6
[   65.560265] CPU: 1 PID: 593 Comm: v4l2src0:src Not tainted 5.16.0-rc4-62408-g32447129cb30-dirty #14
[   65.561269] Hardware name: Radxa ROCK Pi 4B (DT)
[   65.561676] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   65.562288] pc : __dma_alloc_pages+0x78/0xc8
[   65.562849] lr : dma_alloc_noncontiguous+0x128/0x1a8
[   65.563288] sp : ffff800012bc39b0
[   65.563579] x29: ffff800012bc39b0 x28: 0000000000000000 x27: 0000000000030000
[   65.564213] x26: ffff00000908a950 x25: ffff0000018af830 x24: 0000000000410080
[   65.564843] x23: 0000000000000002 x22: ffff000005c88090 x21: 0000000000000cc0
[   65.565473] x20: ffff0000018af830 x19: 0000000000030000 x18: ffffffffffffffff
[   65.566103] x17: 000000040044ffff x16: 00400032b5503510 x15: ffff800011323f78
[   65.566735] x14: 0000000000000000 x13: 302e313a312d3720 x12: 7369206563697665
[   65.567366] x11: 0000000005f5e0ff x10: 000000000000005d x9 : 00000000ffffffd0
[   65.567997] x8 : ffff000005c880a0 x7 : 0000000000000000 x6 : ffff800012bc3750
[   65.568628] x5 : ffff800011b671f8 x4 : 0000000000000cc0 x3 : 0000000000000002
[   65.569259] x2 : ffff000005c88090 x1 : 0000000000030000 x0 : 0000000000000000
[   65.569891] Call trace:
[   65.570110]  __dma_alloc_pages+0x78/0xc8
[   65.570459]  dma_alloc_noncontiguous+0x128/0x1a8
[   65.570868]  stk1160_alloc_isoc+0xf0/0x2b0 [stk1160]
[   65.571318]  start_streaming+0xfc/0x250 [stk1160]
[   65.571740]  vb2_start_streaming+0x6c/0x160 [videobuf2_common]
[   65.572273]  vb2_core_streamon+0x17c/0x1a8 [videobuf2_common]
[   65.572794]  vb2_streamon+0x54/0x88 [videobuf2_v4l2]
[   65.573244]  vb2_ioctl_streamon+0x54/0x60 [videobuf2_v4l2]
[   65.573736]  v4l_streamon+0x3c/0x50 [videodev]
[   65.574195]  __video_do_ioctl+0x1a4/0x428 [videodev]
[   65.574684]  video_usercopy+0x320/0x828 [videodev]
[   65.575158]  video_ioctl2+0x3c/0x58 [videodev]
[   65.575603]  v4l2_ioctl+0x60/0x90 [videodev]
[   65.576031]  __arm64_sys_ioctl+0xa8/0xe0
[   65.576381]  invoke_syscall+0x54/0x118
[   65.576718]  el0_svc_common.constprop.3+0x84/0x100
[   65.577144]  do_el0_svc+0x34/0xa0
[   65.577441]  el0_svc+0x1c/0x50
[   65.577716]  el0t_64_sync_handler+0x88/0xb0
[   65.578086]  el0t_64_sync+0x16c/0x170
[   65.578413] ---[ end trace 578e0ba07742170c ]---
[   65.583222] ------------[ cut here ]------------
[   65.583633] WARNING: CPU: 5 PID: 593 at /home/dafna/git/easycap_media_tree/drivers/media/common/videobuf2/videobuf2-core.c:1612 vb2_start_streaming+0xd4/0x160 [videobuf2_common]
[   65.585027] Modules linked in: snd_usb_audio snd_hwdep snd_usbmidi_lib snd_rawmidi snd_soc_hdmi_codec dw_hdmi_i2s_audio saa7115 stk1160 videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc crct10dif_ce panfrost snd_soc_simple_card snd_soc_audio_graph_card snd_soc_spdif_tx snd_soc_simple_card_utils gpu_sched phy_rockchip_pcie snd_soc_rockchip_i2s rockchipdrm analogix_dp dw_mipi_dsi dw_hdmi cec drm_kms_helper drm rtc_rk808 rockchip_saradc industrialio_triggered_buffer kfifo_buf rockchip_thermal pcie_rockchip_host ip_tables x_tables ipv6
[   65.589383] CPU: 5 PID: 593 Comm: v4l2src0:src Tainted: G        W         5.16.0-rc4-62408-g32447129cb30-dirty #14
[   65.590293] Hardware name: Radxa ROCK Pi 4B (DT)
[   65.590696] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   65.591304] pc : vb2_start_streaming+0xd4/0x160 [videobuf2_common]
[   65.591850] lr : vb2_start_streaming+0x6c/0x160 [videobuf2_common]
[   65.592395] sp : ffff800012bc3ad0
[   65.592685] x29: ffff800012bc3ad0 x28: 0000000000000000 x27: ffff800012bc3cd8
[   65.593312] x26: 0000000000000000 x25: ffff00000d8a7800 x24: 0000000040045612
[   65.593938] x23: ffff800011323000 x22: ffff800012bc3cd8 x21: ffff00000908a8b0
[   65.594562] x20: ffff00000908a8c8 x19: 00000000fffffff4 x18: ffffffffffffffff
[   65.595188] x17: 000000040044ffff x16: 00400034b5503510 x15: ffff800011323f78
[   65.595813] x14: ffff000013163886 x13: ffff000013163885 x12: 00000000000002ce
[   65.596439] x11: 0000000000000028 x10: 0000000000000001 x9 : 0000000000000228
[   65.597064] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff726c5e78
[   65.597690] x5 : ffff800012bc3990 x4 : 0000000000000000 x3 : ffff000009a34880
[   65.598315] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000007cd99f0
[   65.598940] Call trace:
[   65.599155]  vb2_start_streaming+0xd4/0x160 [videobuf2_common]
[   65.599672]  vb2_core_streamon+0x17c/0x1a8 [videobuf2_common]
[   65.600179]  vb2_streamon+0x54/0x88 [videobuf2_v4l2]
[   65.600619]  vb2_ioctl_streamon+0x54/0x60 [videobuf2_v4l2]
[   65.601103]  v4l_streamon+0x3c/0x50 [videodev]
[   65.601521]  __video_do_ioctl+0x1a4/0x428 [videodev]
[   65.601977]  video_usercopy+0x320/0x828 [videodev]
[   65.602419]  video_ioctl2+0x3c/0x58 [videodev]
[   65.602830]  v4l2_ioctl+0x60/0x90 [videodev]
[   65.603227]  __arm64_sys_ioctl+0xa8/0xe0
[   65.603576]  invoke_syscall+0x54/0x118
[   65.603911]  el0_svc_common.constprop.3+0x84/0x100
[   65.604332]  do_el0_svc+0x34/0xa0
[   65.604625]  el0_svc+0x1c/0x50
[   65.604897]  el0t_64_sync_handler+0x88/0xb0
[   65.605264]  el0t_64_sync+0x16c/0x170
[   65.605587] ---[ end trace 578e0ba07742170d ]---

Thanks,
Dafna

> 
>>
>> Thanks,
>> Ezequiel
>>
> 
