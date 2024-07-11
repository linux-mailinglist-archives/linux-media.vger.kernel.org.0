Return-Path: <linux-media+bounces-14906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5785092E45E
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13347284D8B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 10:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B90515AAD9;
	Thu, 11 Jul 2024 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E8sjN5hE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8340315885D
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693213; cv=none; b=Gzr/hEGUWROXEgAtEj+xPjgqLZe+eWyWjjfBzPicBeLGim4hOk4OXzACPuKGkgy4iUdTwby36rmjn75SIsvGvwVK0ohUAQtmjwbIcuXMDdNx3Q+MgdaG2wqAG7IyDiiwSZQrNV/s39aAJLy/2t5BFZnLPkwe1Y8ELMYiaAXlsvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693213; c=relaxed/simple;
	bh=ia3wSdShWzabjtDv3342ycjfQe9yOGzqDVhoscZXAc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UilMlxjsZOUTi5aYDSGTlRspQczVUlenYKeccIU8e3WpK0RlR8LuTs8G9hyOa1fcv5mNgZYB5v4hSoP6MK/JL4w/zh3GZ7IGUvaaG/NFel6K8EaHAjxqP5obgjmend1bHdDaKV/OBAJEuEBg7VP6xwB6RUup+IZi6jo0g0fC8ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E8sjN5hE; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab8cso1290885a12.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720693209; x=1721298009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4pKxsdxjVBHn5/3r7YaaRkxW/WuW1rZwIMp/JW62Xo=;
        b=E8sjN5hE8vPe+6dEAGFmZkarqijHX43KiBfdFJO06e7jx4tSmYUwfUJw/uKyDZsABI
         ytLVcpvtLzSSOl6j89xExWLVZIQK6k1Iev0POimzZQn27WnFfQ6w7Hs3L/9O15aoJVFE
         ShGbR9Y+EDKVyplkhBkQyLkl10Pqo/M1e8F5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720693209; x=1721298009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4pKxsdxjVBHn5/3r7YaaRkxW/WuW1rZwIMp/JW62Xo=;
        b=CXwXVOek+zEZ1XUml3eCgnUI6tODyODf61lSVHEOnF3uECMLJJsZIrSq3zNC+YvEOh
         ECOJ3wbak/gqrJQvvEKUZuIiXG9Y3iYwlgnj50YnOLdr0I/q+gaNpwbJb0rS9U/95rRC
         tbQhtkhLik+V+u8ejc59nbmDtogiwbX8k6LzFKSLZDaS7+ESY+8Mcq7rKtHvY58Ttr3o
         HOxFrMo+XkZ3voh73gsvIJrs1o/PXUIiKBAEQhS12MlIrlme3Ba5IcVwbv6P4mm4NsiI
         wV0F+VqyYsilCAi5KpyWdMCy3dyKYBWqnHaHhFV46rdyMJf3R9LosYohm+A6QgtlMxi6
         D+ew==
X-Forwarded-Encrypted: i=1; AJvYcCU18MgyiohgdjcfqH4g7nRM8TnuN/PHbVCMAezFs1skzHxFRKyvFWC6EVWv1jCLchV17ie2lpW/Q1VeYqqY6XYF3CXxUdUdZWZhRUY=
X-Gm-Message-State: AOJu0YwU4cJKJNvGPOf00KxC/BwEut0Fzk3KnlFEtnllrVsdct8+NT0C
	yPawRss7QOEeQR1A5eevdpk1AT0Gu0Nckvb+IiorEEVbeit9Y/6Qv0BE2UjzcVrCIgsFXIcLJ7u
	lRw==
X-Google-Smtp-Source: AGHT+IGTg4Rr6JNTKoUqgLRHlaUOPCYm9pvIfTqdq0eEL2/Pv0vdz+m+zh4pFZk8aY+Af4yR5GnavA==
X-Received: by 2002:a05:6402:231a:b0:58d:c542:2500 with SMTP id 4fb4d7f45d1cf-594baf87753mr4012250a12.10.1720693209264;
        Thu, 11 Jul 2024 03:20:09 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bd459af1sm3299084a12.59.2024.07.11.03.20.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 03:20:07 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-58b966b4166so932815a12.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 03:20:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBxePMFrotxdkagGdan+zVkm8bNX+jDl9gOw6NY0YtjpZggvvisUfSow+wamaEu7SRVYtSGQU8LzIVEtkS0ZxxAyFIPDVszj9VxHo=
X-Received: by 2002:a17:907:608d:b0:a6e:f7ee:b1fa with SMTP id
 a640c23a62f3a-a780b89cbb7mr555703466b.72.1720693206473; Thu, 11 Jul 2024
 03:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618073004.3420436-1-tao.jiang_2@nxp.com> <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
 <036bf0d7f657cae444d20ea6d279b47e3bf0164e.camel@ndufresne.ca>
 <CAAFQd5DfbqOkZzPfCNRMGeMgv2NfM6WENWXeLUNsuMgkzeBQKw@mail.gmail.com> <443d109f-c817-4f47-9368-ff8b09a9a49e@xs4all.nl>
In-Reply-To: <443d109f-c817-4f47-9368-ff8b09a9a49e@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 11 Jul 2024 19:19:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Am5jBev5P1HmsdeHoJfROZat3bi1W=UsN7wpVqw-XUQQ@mail.gmail.com>
Message-ID: <CAAFQd5Am5jBev5P1HmsdeHoJfROZat3bi1W=UsN7wpVqw-XUQQ@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: sync caches for dmabuf memory
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, m.szyprowski@samsung.com, 
	TaoJiang <tao.jiang_2@nxp.com>, mchehab@kernel.org, shawnguo@kernel.org, 
	robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com, 
	eagle.zhou@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Ming Qian <ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 3:52=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 19/06/2024 06:19, Tomasz Figa wrote:
> > On Wed, Jun 19, 2024 at 1:24=E2=80=AFAM Nicolas Dufresne <nicolas@ndufr=
esne.ca> wrote:
> >>
> >> Le mardi 18 juin 2024 =C3=A0 16:47 +0900, Tomasz Figa a =C3=A9crit :
> >>> Hi TaoJiang,
> >>>
> >>> On Tue, Jun 18, 2024 at 4:30=E2=80=AFPM TaoJiang <tao.jiang_2@nxp.com=
> wrote:
> >>>>
> >>>> From: Ming Qian <ming.qian@nxp.com>
> >>>>
> >>>> When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't kno=
w
> >>>> whether the dma buffer is coherent or synchronized.
> >>>>
> >>>> The videobuf2-core will skip cache syncs as it think the DMA exporte=
r
> >>>> should take care of cache syncs
> >>>>
> >>>> But in fact it's likely that the client doesn't
> >>>> synchronize the dma buf before qbuf() or after dqbuf(). and it's
> >>>> difficult to find this type of error directly.
> >>>>
> >>>> I think it's helpful that videobuf2-core can call
> >>>> dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle th=
e
> >>>> cache syncs.
> >>>>
> >>>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> >>>> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> >>>> ---
> >>>>  .../media/common/videobuf2/videobuf2-core.c   | 22 ++++++++++++++++=
+++
> >>>>  1 file changed, 22 insertions(+)
> >>>>
> >>>
> >>> Sorry, that patch is incorrect. I believe you're misunderstanding the
> >>> way DMA-buf buffers should be managed in the userspace. It's the
> >>> userspace responsibility to call the DMA_BUF_IOCTL_SYNC ioctl [1] to
> >>> signal start and end of CPU access to the kernel and imply necessary
> >>> cache synchronization.
> >>>
> >>> [1] https://docs.kernel.org/driver-api/dma-buf.html#dma-buffer-ioctls
> >>>
> >>> So, really sorry, but it's a NAK.
> >>
> >>
> >>
> >> This patch *could* make sense if it was inside UVC Driver as an exampl=
e, as this
> >> driver can import dmabuf, to CPU memcpy, and does omits the required s=
ync calls
> >> (unless that got added recently, I can easily have missed it).
> >
> > Yeah, currently V4L2 drivers don't call the in-kernel
> > dma_buf_{begin,end}_cpu_access() when they need to access the buffers
> > from the CPU, while my quick grep [1] reveals that we have 68 files
> > retrieving plane vaddr by calling vb2_plane_vaddr() (not necessarily a
> > 100% guarantee of CPU access being done, but rather likely so).
> >
> > I also repeated the same thing with VB2_DMABUF [2] and tried to
> > attribute both lists to specific drivers (by retaining the path until
> > the first - or _ [3]; which seemed to be relatively accurate), leading
> > to the following drivers that claim support for DMABUF while also
> > retrieving plane vaddr (without proper synchronization - no drivers
> > currently call any begin/end CPU access):
> >
> >  i2c/video
> >  pci/bt8xx/bttv
> >  pci/cobalt/cobalt
> >  pci/cx18/cx18
> >  pci/tw5864/tw5864
> >  pci/tw686x/tw686x
> >  platform/allegro
> >  platform/amphion/vpu
> >  platform/chips
> >  platform/intel/pxa
> >  platform/marvell/mcam
> >  platform/mediatek/jpeg/mtk
> >  platform/mediatek/vcodec/decoder/mtk
> >  platform/mediatek/vcodec/encoder/mtk
> >  platform/nuvoton/npcm
> >  platform/nvidia/tegra
> >  platform/nxp/imx
> >  platform/renesas/rcar
> >  platform/renesas/vsp1/vsp1
> >  platform/rockchip/rkisp1/rkisp1
> >  platform/samsung/exynos4
> >  platform/samsung/s5p
> >  platform/st/sti/delta/delta
> >  platform/st/sti/hva/hva
> >  platform/verisilicon/hantro
> >  usb/au0828/au0828
> >  usb/cx231xx/cx231xx
> >  usb/dvb
> >  usb/em28xx/em28xx
> >  usb/gspca/gspca.c
> >  usb/hackrf/hackrf.c
> >  usb/stk1160/stk1160
> >  usb/uvc/uvc
> >
> > which means we potentially have ~30 drivers which likely don't handle
> > imported DMABUFs correctly (there is still a chance that DMABUF is
> > advertised for one queue, while vaddr is used for another).
> >
> > I think we have two options:
> > 1) add vb2_{begin/end}_cpu_access() helpers, carefully audit each
> > driver and add calls to those
>
> I actually started on that 9 (!) years ago:
>
> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=3Dvb2-cpu-access
>
> If memory serves, the main problem was that there were some drivers where
> it wasn't clear what should be done. In the end I never continued this
> work since nobody complained about it.
>
> This patch series adds vb2_plane_begin/end_cpu_access() functions,
> replaces all calls to vb2_plane_vaddr() in drivers to the new functions,
> and at the end removes vb2_plane_vaddr() altogether.
>
> > 2) take a heavy gun approach and just call vb2_begin_cpu_access()
> > whenever vb2_plane_vaddr() is called and then vb2_end_cpu_access()
> > whenever vb2_buffer_done() is called (if begin was called before).
> >
> > The latter has the disadvantage of drivers not having control over the
> > timing of the cache sync, so could end up with less than optimal
> > performance. Also there could be some more complex cases, where the
> > driver needs to mix DMA and CPU accesses to the buffer, so the fixed
> > sequence just wouldn't work for them. (But then they just wouldn't
> > work today either.)
> >
> > Hans, Marek, do you have any thoughts? (I'd personally just go with 2
> > and if any driver in the future needs something else, they could call
> > begin/end CPU access manually.)
>
> I prefer 1. If nothing else, that makes it easy to identify drivers
> that do such things.
>
> But perhaps a mix is possible: if a VB2 flag is set by the driver, then
> approach 2 is used. That might help with the drivers where it isn't clear
> what they should do. Although perhaps this can all be done in the driver
> itself: instead of vb2_plane_vaddr they call vb2_begin_cpu_access for the
> whole buffer, and at buffer_done time they call vb2_end_cpu_access. Shoul=
d
> work just as well for the very few drivers that need this.

That's a good point. I guess we don't really need to dig so much into
those drivers in this case. Just mechanically do the same for all of
them (+/- maybe checking for some obvious corner cases which don't
need the extra calls). Let me see if I can give it a stab.

Best,
Tomasz

>
> Regards,
>
>         Hans
>
> >
> > [1] git grep vb2_plane_vaddr | cut -d":" -f 1 | sort | uniq
> > [2] git grep VB2_DMABUF | cut -d":" -f 1 | sort | uniq
> > [3] by running [1] and [2] through | cut -d"-" -f 1 | cut -d"_" -f 1 | =
uniq
> >
> > Best,
> > Tomasz
> >
> >>
> >> But generally speaking, bracketing all driver with CPU access synchron=
ization
> >> does not make sense indeed, so I second the rejection.
> >>
> >> Nicolas
> >>
> >>>
> >>> Best regards,
> >>> Tomasz
> >>>
> >>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drive=
rs/media/common/videobuf2/videobuf2-core.c
> >>>> index 358f1fe42975..4734ff9cf3ce 100644
> >>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >>>> @@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_bu=
ffer *vb)
> >>>>         vb->synced =3D 1;
> >>>>         for (plane =3D 0; plane < vb->num_planes; ++plane)
> >>>>                 call_void_memop(vb, prepare, vb->planes[plane].mem_p=
riv);
> >>>> +
> >>>> +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> >>>> +               return;
> >>>> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> >>>> +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> >>>> +
> >>>> +               if (!dbuf)
> >>>> +                       continue;
> >>>> +
> >>>> +               dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir)=
;
> >>>> +       }
> >>>>  }
> >>>>
> >>>>  /*
> >>>> @@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buf=
fer *vb)
> >>>>         vb->synced =3D 0;
> >>>>         for (plane =3D 0; plane < vb->num_planes; ++plane)
> >>>>                 call_void_memop(vb, finish, vb->planes[plane].mem_pr=
iv);
> >>>> +
> >>>> +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> >>>> +               return;
> >>>> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> >>>> +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> >>>> +
> >>>> +               if (!dbuf)
> >>>> +                       continue;
> >>>> +
> >>>> +               dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_di=
r);
> >>>> +       }
> >>>>  }
> >>>>
> >>>>  /*
> >>>> --
> >>>> 2.43.0-rc1
> >>>>
> >>
> >
>

