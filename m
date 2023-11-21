Return-Path: <linux-media+bounces-637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 439EE7F24C4
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 05:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB671C218E9
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 04:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A8918048;
	Tue, 21 Nov 2023 04:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jA1SnD7k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F0EBE
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 20:10:34 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a00cbb83c82so118790366b.2
        for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 20:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700539831; x=1701144631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpZlYlDwq6OANR55Qid95e4HAaAWZ/q+XmM2PSqqZFI=;
        b=jA1SnD7ko17J5DyEv4sQ9LLzB/jtTZqYlaEnwqz8rOyleWnSuLNwCIhowshf3EmCeg
         ChUdxFY/916EhmKT0vhULrbVN/tzMr+1vIdP1GKTImUoE9EOuvQHy+xEX0LhfgnPjKAw
         q74+ekHopo0+StniFZlE9xQcA1bYzYNzBLlrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700539831; x=1701144631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpZlYlDwq6OANR55Qid95e4HAaAWZ/q+XmM2PSqqZFI=;
        b=T5WgI2JXm3F3x/i9kFDQ0k0nxqK2YbhU/A7nJ7nEPbv0FyCOEm9KyLYRL3bW2+/686
         ZPeSG730923b6Swzvr4x18/H+KWuYk9Re1Oir1yjeJcOL3KSYlCgxZ94xG8noWRTiieF
         mfbJK27ou8v3LVhoXVc3SrTjDcFFRgZcYplFWO6UUH6OpW1jRgMzy3LiD2yz4FWZaoux
         1z3ZyFMnSoDGuIZrsdEYAgpBTp1UXBT62EHsL2xpBBGCbp19EYVgXW6sH5vFxwxe+afg
         bcJDh1e14LkQWdUWKhvbTLoiDMaAAFbvSCcB+8sqfktHT5/BIj7iX2tgHTl2+2N1GSf2
         +z3A==
X-Gm-Message-State: AOJu0Yw1+q8NAbpcKl5Su0n6PP0ePXAhwnxO/Ef2usbfExbELwZKSe3f
	mu7XJcng3fB6orQZ56xJJVgl8ZcUb46q8a5IVXuLhyL1
X-Google-Smtp-Source: AGHT+IGsl/hLz931wa6GuXyn06Gq/728Tz5DUct5nG7d8auaQHGIZVNsaA/5M2TgEeW+SeABRBJ4VA==
X-Received: by 2002:a17:906:2098:b0:9fa:caf3:fb17 with SMTP id 24-20020a170906209800b009facaf3fb17mr6461695ejq.51.1700539831445;
        Mon, 20 Nov 2023 20:10:31 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id cm7-20020a170906f58700b009e5e1710ae7sm3429572ejd.191.2023.11.20.20.10.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 20:10:31 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32d9effe314so3637948f8f.3
        for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 20:10:30 -0800 (PST)
X-Received: by 2002:a5d:6c66:0:b0:332:c3fc:47eb with SMTP id
 r6-20020a5d6c66000000b00332c3fc47ebmr4069768wrz.5.1700539830319; Mon, 20 Nov
 2023 20:10:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031230435.3356103-1-m.grzeschik@pengutronix.de> <b1ec2434-c5a2-4a76-bc86-9899f9fb60cb@xs4all.nl>
In-Reply-To: <b1ec2434-c5a2-4a76-bc86-9899f9fb60cb@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 21 Nov 2023 13:10:13 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ARHWhSHur8Jh-wWafoXpTLT+ZuSXGNX16jSv0Xcouspg@mail.gmail.com>
Message-ID: <CAAFQd5ARHWhSHur8Jh-wWafoXpTLT+ZuSXGNX16jSv0Xcouspg@mail.gmail.com>
Subject: Re: [PATCH v3] media: videobuf2-dma-sg: fix vmap and vunmap callbacks
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>, linux-media@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, kernel@pengutronix.de, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,


On Mon, Nov 20, 2023 at 10:27=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
>
> Tomasz,
>
> Can you review this?

I did review it a few weeks ago, with some comments pending:
https://patchwork.kernel.org/project/linux-media/patch/20231031230435.33561=
03-1-m.grzeschik@pengutronix.de/#25577798

Best,
Tomasz

>
> Michael, I have one comment below:
>
> On 01/11/2023 00:04, Michael Grzeschik wrote:
> > For dmabuf import users to be able to use the vaddr from another
> > videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
> > vb2_dma_sg_dmabuf_ops_vmap callback.
> >
> > This patch adds vmap on map if buf->vaddr was not set, and also
> > adds the vb2_dma_sg_dmabuf_ops_vunmap function to remove the mapping
> > afterwards.
> >
> > Cc: stable@kernel.org
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> >
> > ---
> > v2 -> v3: resend as a single patch
> > v1 -> v2: using vmap and vunmap instead of vm_map_ram and vm_unmap_ram
> >
> >  .../media/common/videobuf2/videobuf2-dma-sg.c    | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/driver=
s/media/common/videobuf2/videobuf2-dma-sg.c
> > index 28f3fdfe23a298..05b43edda94a7e 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > @@ -489,11 +489,26 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_=
buf *dbuf,
> >  {
> >       struct vb2_dma_sg_buf *buf =3D dbuf->priv;
> >
> > +     if (!buf->vaddr)
> > +             buf->vaddr =3D vmap(buf->pages, buf->num_pages, VM_MAP,
> > +                               PAGE_KERNEL);
>
> Shouldn't this check for success and return an error code if it fails?
>
> Regards,
>
>         Hans
>
> > +
> >       iosys_map_set_vaddr(map, buf->vaddr);
> >
> >       return 0;
> >  }
> >
> > +static void vb2_dma_sg_dmabuf_ops_vunmap(struct dma_buf *dbuf,
> > +                                   struct iosys_map *map)
> > +{
> > +     struct vb2_dma_sg_buf *buf =3D dbuf->priv;
> > +
> > +     if (buf->vaddr)
> > +             vunmap(buf->vaddr);
> > +
> > +     buf->vaddr =3D NULL;
> > +}
> > +
> >  static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
> >       struct vm_area_struct *vma)
> >  {
> > @@ -508,6 +523,7 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_o=
ps =3D {
> >       .begin_cpu_access =3D vb2_dma_sg_dmabuf_ops_begin_cpu_access,
> >       .end_cpu_access =3D vb2_dma_sg_dmabuf_ops_end_cpu_access,
> >       .vmap =3D vb2_dma_sg_dmabuf_ops_vmap,
> > +     .vunmap =3D vb2_dma_sg_dmabuf_ops_vunmap,
> >       .mmap =3D vb2_dma_sg_dmabuf_ops_mmap,
> >       .release =3D vb2_dma_sg_dmabuf_ops_release,
> >  };
>

