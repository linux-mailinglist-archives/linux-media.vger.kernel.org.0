Return-Path: <linux-media+bounces-13770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC05490FD17
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 08:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85ED12862CB
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 06:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AC041746;
	Thu, 20 Jun 2024 06:52:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1589844C64;
	Thu, 20 Jun 2024 06:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718866322; cv=none; b=poeS0SpHk4OPz90Mde3wgCfyksTtc8Mlhff8pH7zOzZFvW9jCYQBZMeRkQBq2UIIrPGw4crovsHZUhYu0PMsrbcdagepF7+KYBXobpBXIWIJlLpzEwu1uYERsMrwvkZHtcYuthKEjbmnnY/qa5N1mdbYGhgaKIJPX7G50WncRCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718866322; c=relaxed/simple;
	bh=8lKKWsDyVzL30LhWcWcC1wOf1jxISzt1JZs/SQD0YSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9JWMUc6Pd4ACSfaRSu9o9jJQDbZFmDyKwlameuVWl8ATAtCIDHo7gV6plTwN2eAnvzSBtdoRyAe6o1Vlw5fXcTSbeJ46c5cIF8q3wBNiCadWmboJudt4TFo5eenbVCwkbClHcA4BAwxtQOxuNzhEdQ+5OCsWFxMbDxYj1j3/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C47BC2BD10;
	Thu, 20 Jun 2024 06:51:57 +0000 (UTC)
Message-ID: <443d109f-c817-4f47-9368-ff8b09a9a49e@xs4all.nl>
Date: Thu, 20 Jun 2024 08:51:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: sync caches for dmabuf memory
To: Tomasz Figa <tfiga@chromium.org>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, m.szyprowski@samsung.com
Cc: TaoJiang <tao.jiang_2@nxp.com>, mchehab@kernel.org, shawnguo@kernel.org,
 robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Ming Qian <ming.qian@nxp.com>
References: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
 <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
 <036bf0d7f657cae444d20ea6d279b47e3bf0164e.camel@ndufresne.ca>
 <CAAFQd5DfbqOkZzPfCNRMGeMgv2NfM6WENWXeLUNsuMgkzeBQKw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAAFQd5DfbqOkZzPfCNRMGeMgv2NfM6WENWXeLUNsuMgkzeBQKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/06/2024 06:19, Tomasz Figa wrote:
> On Wed, Jun 19, 2024 at 1:24 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>>
>> Le mardi 18 juin 2024 à 16:47 +0900, Tomasz Figa a écrit :
>>> Hi TaoJiang,
>>>
>>> On Tue, Jun 18, 2024 at 4:30 PM TaoJiang <tao.jiang_2@nxp.com> wrote:
>>>>
>>>> From: Ming Qian <ming.qian@nxp.com>
>>>>
>>>> When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't know
>>>> whether the dma buffer is coherent or synchronized.
>>>>
>>>> The videobuf2-core will skip cache syncs as it think the DMA exporter
>>>> should take care of cache syncs
>>>>
>>>> But in fact it's likely that the client doesn't
>>>> synchronize the dma buf before qbuf() or after dqbuf(). and it's
>>>> difficult to find this type of error directly.
>>>>
>>>> I think it's helpful that videobuf2-core can call
>>>> dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle the
>>>> cache syncs.
>>>>
>>>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
>>>> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
>>>> ---
>>>>  .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++++
>>>>  1 file changed, 22 insertions(+)
>>>>
>>>
>>> Sorry, that patch is incorrect. I believe you're misunderstanding the
>>> way DMA-buf buffers should be managed in the userspace. It's the
>>> userspace responsibility to call the DMA_BUF_IOCTL_SYNC ioctl [1] to
>>> signal start and end of CPU access to the kernel and imply necessary
>>> cache synchronization.
>>>
>>> [1] https://docs.kernel.org/driver-api/dma-buf.html#dma-buffer-ioctls
>>>
>>> So, really sorry, but it's a NAK.
>>
>>
>>
>> This patch *could* make sense if it was inside UVC Driver as an example, as this
>> driver can import dmabuf, to CPU memcpy, and does omits the required sync calls
>> (unless that got added recently, I can easily have missed it).
> 
> Yeah, currently V4L2 drivers don't call the in-kernel
> dma_buf_{begin,end}_cpu_access() when they need to access the buffers
> from the CPU, while my quick grep [1] reveals that we have 68 files
> retrieving plane vaddr by calling vb2_plane_vaddr() (not necessarily a
> 100% guarantee of CPU access being done, but rather likely so).
> 
> I also repeated the same thing with VB2_DMABUF [2] and tried to
> attribute both lists to specific drivers (by retaining the path until
> the first - or _ [3]; which seemed to be relatively accurate), leading
> to the following drivers that claim support for DMABUF while also
> retrieving plane vaddr (without proper synchronization - no drivers
> currently call any begin/end CPU access):
> 
>  i2c/video
>  pci/bt8xx/bttv
>  pci/cobalt/cobalt
>  pci/cx18/cx18
>  pci/tw5864/tw5864
>  pci/tw686x/tw686x
>  platform/allegro
>  platform/amphion/vpu
>  platform/chips
>  platform/intel/pxa
>  platform/marvell/mcam
>  platform/mediatek/jpeg/mtk
>  platform/mediatek/vcodec/decoder/mtk
>  platform/mediatek/vcodec/encoder/mtk
>  platform/nuvoton/npcm
>  platform/nvidia/tegra
>  platform/nxp/imx
>  platform/renesas/rcar
>  platform/renesas/vsp1/vsp1
>  platform/rockchip/rkisp1/rkisp1
>  platform/samsung/exynos4
>  platform/samsung/s5p
>  platform/st/sti/delta/delta
>  platform/st/sti/hva/hva
>  platform/verisilicon/hantro
>  usb/au0828/au0828
>  usb/cx231xx/cx231xx
>  usb/dvb
>  usb/em28xx/em28xx
>  usb/gspca/gspca.c
>  usb/hackrf/hackrf.c
>  usb/stk1160/stk1160
>  usb/uvc/uvc
> 
> which means we potentially have ~30 drivers which likely don't handle
> imported DMABUFs correctly (there is still a chance that DMABUF is
> advertised for one queue, while vaddr is used for another).
> 
> I think we have two options:
> 1) add vb2_{begin/end}_cpu_access() helpers, carefully audit each
> driver and add calls to those

I actually started on that 9 (!) years ago:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=vb2-cpu-access

If memory serves, the main problem was that there were some drivers where
it wasn't clear what should be done. In the end I never continued this
work since nobody complained about it.

This patch series adds vb2_plane_begin/end_cpu_access() functions,
replaces all calls to vb2_plane_vaddr() in drivers to the new functions,
and at the end removes vb2_plane_vaddr() altogether.

> 2) take a heavy gun approach and just call vb2_begin_cpu_access()
> whenever vb2_plane_vaddr() is called and then vb2_end_cpu_access()
> whenever vb2_buffer_done() is called (if begin was called before).
> 
> The latter has the disadvantage of drivers not having control over the
> timing of the cache sync, so could end up with less than optimal
> performance. Also there could be some more complex cases, where the
> driver needs to mix DMA and CPU accesses to the buffer, so the fixed
> sequence just wouldn't work for them. (But then they just wouldn't
> work today either.)
> 
> Hans, Marek, do you have any thoughts? (I'd personally just go with 2
> and if any driver in the future needs something else, they could call
> begin/end CPU access manually.)

I prefer 1. If nothing else, that makes it easy to identify drivers
that do such things.

But perhaps a mix is possible: if a VB2 flag is set by the driver, then
approach 2 is used. That might help with the drivers where it isn't clear
what they should do. Although perhaps this can all be done in the driver
itself: instead of vb2_plane_vaddr they call vb2_begin_cpu_access for the
whole buffer, and at buffer_done time they call vb2_end_cpu_access. Should
work just as well for the very few drivers that need this.

Regards,

	Hans

> 
> [1] git grep vb2_plane_vaddr | cut -d":" -f 1 | sort | uniq
> [2] git grep VB2_DMABUF | cut -d":" -f 1 | sort | uniq
> [3] by running [1] and [2] through | cut -d"-" -f 1 | cut -d"_" -f 1 | uniq
> 
> Best,
> Tomasz
> 
>>
>> But generally speaking, bracketing all driver with CPU access synchronization
>> does not make sense indeed, so I second the rejection.
>>
>> Nicolas
>>
>>>
>>> Best regards,
>>> Tomasz
>>>
>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>>>> index 358f1fe42975..4734ff9cf3ce 100644
>>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>>> @@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer *vb)
>>>>         vb->synced = 1;
>>>>         for (plane = 0; plane < vb->num_planes; ++plane)
>>>>                 call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
>>>> +
>>>> +       if (vb->memory != VB2_MEMORY_DMABUF)
>>>> +               return;
>>>> +       for (plane = 0; plane < vb->num_planes; ++plane) {
>>>> +               struct dma_buf *dbuf = vb->planes[plane].dbuf;
>>>> +
>>>> +               if (!dbuf)
>>>> +                       continue;
>>>> +
>>>> +               dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir);
>>>> +       }
>>>>  }
>>>>
>>>>  /*
>>>> @@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
>>>>         vb->synced = 0;
>>>>         for (plane = 0; plane < vb->num_planes; ++plane)
>>>>                 call_void_memop(vb, finish, vb->planes[plane].mem_priv);
>>>> +
>>>> +       if (vb->memory != VB2_MEMORY_DMABUF)
>>>> +               return;
>>>> +       for (plane = 0; plane < vb->num_planes; ++plane) {
>>>> +               struct dma_buf *dbuf = vb->planes[plane].dbuf;
>>>> +
>>>> +               if (!dbuf)
>>>> +                       continue;
>>>> +
>>>> +               dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_dir);
>>>> +       }
>>>>  }
>>>>
>>>>  /*
>>>> --
>>>> 2.43.0-rc1
>>>>
>>
> 


