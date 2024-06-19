Return-Path: <linux-media+bounces-13653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E807E90E246
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 06:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF6DA28443F
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 04:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB91937700;
	Wed, 19 Jun 2024 04:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b6jeoixM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779301E4AD
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 04:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718770782; cv=none; b=sHVmzbBX/AhRMmoKzJ42g9wO3kEGWSeYvD/GuIpXkz3/+leINhGWPHUqseA/u9a0FqAtSjE4sDHZBEwK9ygzrf8pBSh1Wiu18WAZwloOh/wQlT0mi3k6zgdL1CkuZ1+l+pz5OUj6OTd90reAV9MhY6Hc4wKPlG3uG5WjA+l87U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718770782; c=relaxed/simple;
	bh=JNNn2B9AEY5Fn0RAE7Nv+uvdYfJNN5JRmicXvo3cqmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqYGMYnCS7RjTY4i0U4fUMcU0gBuku/2kM1sIE5brblasKczIgePa16VwpW+kJwrMqkjjpM6pTe2hWxOO1FeVzkAyCY2tMxFHJ/3wA+ywaYQsYUe06c+9HMUKtVxenNREZw9W1KyxbG+Ibb/wGYf3HB3RbMkfGGOPgPpJiZXT1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b6jeoixM; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57cad4475e0so708738a12.1
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 21:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718770778; x=1719375578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/U+cxAMgDXTuaBoZjBUZI7zxhscWza7MiDHr3eL9Des=;
        b=b6jeoixM3wmJe2O3iQ5TXT0oMV0SepfJFboW+f5lQv/JJX4EZAWZgJCnoCutr/awza
         m4lu/7/DGiyWR571/al6lEQgA4Hk4YDRkIltASsQJDkibVTjSVune3wClxLGR+jzQynr
         ZUv5jOhXddnlLak4jk24FykjB/V8YvUEHTR8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718770778; x=1719375578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/U+cxAMgDXTuaBoZjBUZI7zxhscWza7MiDHr3eL9Des=;
        b=FHZqPBzQXAcP4HO4zQ/bdC8dKkwe9NEpb+OeAdb6fa2NqMxK/2ErkSRHFUBOQFDD9p
         anl4chYj9TYNeuLBx01eDMFNMobxy1xULwxp+UzyFPObXg2iUANyjAdSUpo+Ss+UbrcB
         01/x7gpvnFyBKthDN2kZ68mQV/INrVsCw1CXKTz0t+VHULLmtj4jKNnfkMDc+4eBhLfG
         mq3TrWze9VRjG1ryZuPTp5TncxIwUXcg+G6ZfHZ2z+GyW4Mcud1jRehmb8pSSsZOwX3l
         4AR3FzwJeYb/QQgn6WGH0fmK0IJxpEFa7nf9zzDSgXS//7oCm1FWnGjnDbxizyLknrOp
         Lr5w==
X-Forwarded-Encrypted: i=1; AJvYcCUQRSexkEhqry7THcgI4MU8xCezWvmBQuytrfMb7qDGPC/0dLHhwxtAFGdjnv6ajaO5neSdCs3b//gJu2SpEz/BvsbkZRkQfI1f1r8=
X-Gm-Message-State: AOJu0YyjhB7bvJVXURRkwZ7qtgBVJOSGhtwjGn1E4VzO4bJlkJVmnXMq
	zW8O8XHIuuiTOuMug1hpb3/AG4n9X255H8JVXOBhC7kKn5YtnS46Q5wTnec0cvYOzpUXG0fqHO6
	Bcp3L
X-Google-Smtp-Source: AGHT+IHnvr1JsF2Sv4xrUzTGU24VYvxMoEe5WGHH0QGYIW7Pk0lnIJAWr+DHCg0wAiEev2KYkJ9pXQ==
X-Received: by 2002:a05:6402:c8c:b0:57d:392:944b with SMTP id 4fb4d7f45d1cf-57d039294e1mr1410011a12.19.1718770777720;
        Tue, 18 Jun 2024 21:19:37 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72cdfc4sm8071889a12.19.2024.06.18.21.19.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 21:19:37 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6e43dad8ecso80381166b.1
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 21:19:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgN59VTEgbp662D7vgL2knFUKNwyQKiEb2ZKvF7F2Ylg3Z/7FvdKCNvcna4MlUSGknVqqWaJ4Z45Pk6eQ4BO3g/i8G80qKxbMRadw=
X-Received: by 2002:a17:907:2087:b0:a6f:53eb:dbe0 with SMTP id
 a640c23a62f3a-a6f9506f6f4mr245886666b.26.1718770776170; Tue, 18 Jun 2024
 21:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618073004.3420436-1-tao.jiang_2@nxp.com> <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
 <036bf0d7f657cae444d20ea6d279b47e3bf0164e.camel@ndufresne.ca>
In-Reply-To: <036bf0d7f657cae444d20ea6d279b47e3bf0164e.camel@ndufresne.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 19 Jun 2024 13:19:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DfbqOkZzPfCNRMGeMgv2NfM6WENWXeLUNsuMgkzeBQKw@mail.gmail.com>
Message-ID: <CAAFQd5DfbqOkZzPfCNRMGeMgv2NfM6WENWXeLUNsuMgkzeBQKw@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: sync caches for dmabuf memory
To: Nicolas Dufresne <nicolas@ndufresne.ca>, m.szyprowski@samsung.com, 
	hverkuil-cisco@xs4all.nl
Cc: TaoJiang <tao.jiang_2@nxp.com>, mchehab@kernel.org, shawnguo@kernel.org, 
	robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com, 
	eagle.zhou@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Ming Qian <ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 1:24=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Le mardi 18 juin 2024 =C3=A0 16:47 +0900, Tomasz Figa a =C3=A9crit :
> > Hi TaoJiang,
> >
> > On Tue, Jun 18, 2024 at 4:30=E2=80=AFPM TaoJiang <tao.jiang_2@nxp.com> =
wrote:
> > >
> > > From: Ming Qian <ming.qian@nxp.com>
> > >
> > > When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't know
> > > whether the dma buffer is coherent or synchronized.
> > >
> > > The videobuf2-core will skip cache syncs as it think the DMA exporter
> > > should take care of cache syncs
> > >
> > > But in fact it's likely that the client doesn't
> > > synchronize the dma buf before qbuf() or after dqbuf(). and it's
> > > difficult to find this type of error directly.
> > >
> > > I think it's helpful that videobuf2-core can call
> > > dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle the
> > > cache syncs.
> > >
> > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > > Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> > > ---
> > >  .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++=
++
> > >  1 file changed, 22 insertions(+)
> > >
> >
> > Sorry, that patch is incorrect. I believe you're misunderstanding the
> > way DMA-buf buffers should be managed in the userspace. It's the
> > userspace responsibility to call the DMA_BUF_IOCTL_SYNC ioctl [1] to
> > signal start and end of CPU access to the kernel and imply necessary
> > cache synchronization.
> >
> > [1] https://docs.kernel.org/driver-api/dma-buf.html#dma-buffer-ioctls
> >
> > So, really sorry, but it's a NAK.
>
>
>
> This patch *could* make sense if it was inside UVC Driver as an example, =
as this
> driver can import dmabuf, to CPU memcpy, and does omits the required sync=
 calls
> (unless that got added recently, I can easily have missed it).

Yeah, currently V4L2 drivers don't call the in-kernel
dma_buf_{begin,end}_cpu_access() when they need to access the buffers
from the CPU, while my quick grep [1] reveals that we have 68 files
retrieving plane vaddr by calling vb2_plane_vaddr() (not necessarily a
100% guarantee of CPU access being done, but rather likely so).

I also repeated the same thing with VB2_DMABUF [2] and tried to
attribute both lists to specific drivers (by retaining the path until
the first - or _ [3]; which seemed to be relatively accurate), leading
to the following drivers that claim support for DMABUF while also
retrieving plane vaddr (without proper synchronization - no drivers
currently call any begin/end CPU access):

 i2c/video
 pci/bt8xx/bttv
 pci/cobalt/cobalt
 pci/cx18/cx18
 pci/tw5864/tw5864
 pci/tw686x/tw686x
 platform/allegro
 platform/amphion/vpu
 platform/chips
 platform/intel/pxa
 platform/marvell/mcam
 platform/mediatek/jpeg/mtk
 platform/mediatek/vcodec/decoder/mtk
 platform/mediatek/vcodec/encoder/mtk
 platform/nuvoton/npcm
 platform/nvidia/tegra
 platform/nxp/imx
 platform/renesas/rcar
 platform/renesas/vsp1/vsp1
 platform/rockchip/rkisp1/rkisp1
 platform/samsung/exynos4
 platform/samsung/s5p
 platform/st/sti/delta/delta
 platform/st/sti/hva/hva
 platform/verisilicon/hantro
 usb/au0828/au0828
 usb/cx231xx/cx231xx
 usb/dvb
 usb/em28xx/em28xx
 usb/gspca/gspca.c
 usb/hackrf/hackrf.c
 usb/stk1160/stk1160
 usb/uvc/uvc

which means we potentially have ~30 drivers which likely don't handle
imported DMABUFs correctly (there is still a chance that DMABUF is
advertised for one queue, while vaddr is used for another).

I think we have two options:
1) add vb2_{begin/end}_cpu_access() helpers, carefully audit each
driver and add calls to those
2) take a heavy gun approach and just call vb2_begin_cpu_access()
whenever vb2_plane_vaddr() is called and then vb2_end_cpu_access()
whenever vb2_buffer_done() is called (if begin was called before).

The latter has the disadvantage of drivers not having control over the
timing of the cache sync, so could end up with less than optimal
performance. Also there could be some more complex cases, where the
driver needs to mix DMA and CPU accesses to the buffer, so the fixed
sequence just wouldn't work for them. (But then they just wouldn't
work today either.)

Hans, Marek, do you have any thoughts? (I'd personally just go with 2
and if any driver in the future needs something else, they could call
begin/end CPU access manually.)

[1] git grep vb2_plane_vaddr | cut -d":" -f 1 | sort | uniq
[2] git grep VB2_DMABUF | cut -d":" -f 1 | sort | uniq
[3] by running [1] and [2] through | cut -d"-" -f 1 | cut -d"_" -f 1 | uniq

Best,
Tomasz

>
> But generally speaking, bracketing all driver with CPU access synchroniza=
tion
> does not make sense indeed, so I second the rejection.
>
> Nicolas
>
> >
> > Best regards,
> > Tomasz
> >
> > > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/driver=
s/media/common/videobuf2/videobuf2-core.c
> > > index 358f1fe42975..4734ff9cf3ce 100644
> > > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > > @@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_buf=
fer *vb)
> > >         vb->synced =3D 1;
> > >         for (plane =3D 0; plane < vb->num_planes; ++plane)
> > >                 call_void_memop(vb, prepare, vb->planes[plane].mem_pr=
iv);
> > > +
> > > +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> > > +               return;
> > > +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > > +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> > > +
> > > +               if (!dbuf)
> > > +                       continue;
> > > +
> > > +               dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> > > +       }
> > >  }
> > >
> > >  /*
> > > @@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buff=
er *vb)
> > >         vb->synced =3D 0;
> > >         for (plane =3D 0; plane < vb->num_planes; ++plane)
> > >                 call_void_memop(vb, finish, vb->planes[plane].mem_pri=
v);
> > > +
> > > +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> > > +               return;
> > > +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > > +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> > > +
> > > +               if (!dbuf)
> > > +                       continue;
> > > +
> > > +               dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_dir=
);
> > > +       }
> > >  }
> > >
> > >  /*
> > > --
> > > 2.43.0-rc1
> > >
>

