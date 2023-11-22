Return-Path: <linux-media+bounces-716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC617F3DBE
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 06:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE9EEB219C5
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E48213FEB;
	Wed, 22 Nov 2023 05:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SPHWhP/8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C3110C
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 21:49:42 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-543923af573so9307141a12.0
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 21:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700632180; x=1701236980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=128iwxYAf0xK5G8ivVWudK6jlM7qVWKNttFBIEHXoEE=;
        b=SPHWhP/8VAKpqvwY2ugd4sX2RIno/MVRXnMQbeGDWrhtfrEIQTmHc7ASDjerC/gy7d
         sV2iNihqd4wD7J64xTLm9bB2wfIKaEvsAQTyNSU2/dR413q1UxlY13eA7dUq7aVrmkxm
         Ydt1NcH3DyHNCVgw2N83ufc5xhqYNzr2Pa1OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700632180; x=1701236980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=128iwxYAf0xK5G8ivVWudK6jlM7qVWKNttFBIEHXoEE=;
        b=bX4cxdUhAD6ulhJZNzl0jHyvy3kjAYTTPdpEW1DNrTDU0CF30l72WOAUoS45ngcRsw
         v5wVj/JLK812YC81CumiDXPFE+P2mf72gUHx9B+dVcuBkI+qYdWer1PFf2ddd+Qb4zN4
         rKvR6q0Wc/YSHnDzXJG6Cxv7rA4pE7IPwjzYQhSxB97QodvQJL2LEC87EkL19hJUYIll
         KVSyDG0AaFcty06x1c5aLcH++3+Zyw2awBKCPWOrLnz5FxrH2wPBnZTmyZWXYyGEklnm
         05CLnNziR42MZregkQqHJoonspib8/cC/wZGWWvssKJ7neOWAW+RvZ8/qsVaqJ6hMkhx
         owPA==
X-Gm-Message-State: AOJu0Yyp9e6rMC1A/FP6GAZisKLufUS5RDWI+AE4zTeTdE8rMSCtyyjZ
	gEgYZ+lBdazN5TXR5nBp3IXn6SjANl7e4kwZDm9mWKep
X-Google-Smtp-Source: AGHT+IFrdhLFQAi1EdnS6KuScyhmKL81Tem+eqMHGn28WSekn9RL0VQIYQJqhXxJeahWRdjTEigJNg==
X-Received: by 2002:a17:906:68d:b0:a01:a8e1:2a46 with SMTP id u13-20020a170906068d00b00a01a8e12a46mr547286ejb.64.1700632179799;
        Tue, 21 Nov 2023 21:49:39 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id o8-20020a17090637c800b009fcb0e0758bsm3972242ejc.195.2023.11.21.21.49.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 21:49:39 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3316a4bc37dso3281109f8f.2
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 21:49:39 -0800 (PST)
X-Received: by 2002:adf:cc82:0:b0:321:7093:53f5 with SMTP id
 p2-20020adfcc82000000b00321709353f5mr718132wrj.64.1700632178843; Tue, 21 Nov
 2023 21:49:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031230435.3356103-1-m.grzeschik@pengutronix.de>
 <CAAFQd5CCr0ivS8REcwHwJweCTk29+wVGZVjgL0mnZzPQ47kAVw@mail.gmail.com> <ZVyxDAKYz1OaGGQZ@pengutronix.de>
In-Reply-To: <ZVyxDAKYz1OaGGQZ@pengutronix.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 22 Nov 2023 14:49:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AHdWS9zMSyG83LSQOMeGL852xq6APZm0ibiCJ3eMgtNQ@mail.gmail.com>
Message-ID: <CAAFQd5AHdWS9zMSyG83LSQOMeGL852xq6APZm0ibiCJ3eMgtNQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: videobuf2-dma-sg: fix vmap and vunmap callbacks
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, m.szyprowski@samsung.com, 
	mchehab@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	kernel@pengutronix.de, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 10:30=E2=80=AFPM Michael Grzeschik <mgr@pengutronix=
.de> wrote:
>
> On Wed, Nov 01, 2023 at 12:48:21PM +0900, Tomasz Figa wrote:
> >Hi Michael,
> >
> >
> >On Wed, Nov 1, 2023 at 8:04=E2=80=AFAM Michael Grzeschik
> ><m.grzeschik@pengutronix.de> wrote:
> >>
> >> For dmabuf import users to be able to use the vaddr from another
> >> videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
> >> vb2_dma_sg_dmabuf_ops_vmap callback.
> >>
> >> This patch adds vmap on map if buf->vaddr was not set, and also
> >> adds the vb2_dma_sg_dmabuf_ops_vunmap function to remove the mapping
> >> afterwards.
> >>
> >> Cc: stable@kernel.org
> >> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> >>
> >> ---
> >> v2 -> v3: resend as a single patch
> >> v1 -> v2: using vmap and vunmap instead of vm_map_ram and vm_unmap_ram
> >>
> >
> >First of all, thanks for the patch!
> >
> >Please check my comments inline.
> >
> >>  .../media/common/videobuf2/videobuf2-dma-sg.c    | 16 +++++++++++++++=
+
> >>  1 file changed, 16 insertions(+)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drive=
rs/media/common/videobuf2/videobuf2-dma-sg.c
> >> index 28f3fdfe23a298..05b43edda94a7e 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >> @@ -489,11 +489,26 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma=
_buf *dbuf,
> >>  {
> >>         struct vb2_dma_sg_buf *buf =3D dbuf->priv;
> >>
> >> +       if (!buf->vaddr)
> >> +               buf->vaddr =3D vmap(buf->pages, buf->num_pages, VM_MAP=
,
> >> +                                 PAGE_KERNEL);
> >> +
> >
> >Would it make sense to use vb2_dma_sg_vaddr() instead of open coding
> >the mapping again?
> >
>
> So in the end the whole patch would look like this:
>
>         buf->vaddr =3D vb2_dma_sg_vaddr(NULL, buf);
>         if (!buf->vaddr)
>                 return -ENOMEM;

Yes, but buf->vaddr is already updated by vb2_dma_sg_vaddr(), so we
should just save the return value to a local variable.

>
> >>         iosys_map_set_vaddr(map, buf->vaddr);
> >>
> >>         return 0;
> >>  }
> >>
> >> +static void vb2_dma_sg_dmabuf_ops_vunmap(struct dma_buf *dbuf,
> >> +                                     struct iosys_map *map)
> >> +{
> >> +       struct vb2_dma_sg_buf *buf =3D dbuf->priv;
> >> +
> >> +       if (buf->vaddr)
> >> +               vunmap(buf->vaddr);
> >> +
> >> +       buf->vaddr =3D NULL;
> >> +}
> >
> >This could be potentially dangerous. Please consider the situation
> >when the exporting V4L2 driver needs the CPU mapping for its own
> >usage. It would call vb2_dma_sg_vaddr(), which would return the
> >mapping. Then the importer could call vunmap, which would destroy the
> >mapping that is still in use by the exporter internally.
> >
> >The idea of the current implementation is that we just create a kernel
> >mapping when it's needed first and just keep it around until the
> >entire buffer is destroyed.
>
> In this patch I will drop the while vunmap callback then.

Ack.

I think in the long term we may want to rework vb2_plane_vaddr()
semantics so that the mapping can be reference counted, but that would
require quite a bit of a change around the vb2 framework and existing
drivers. (Has been on my list for a while...)

Best regards,
Tomasz

