Return-Path: <linux-media+bounces-17645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D874596CFD8
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89B9E284B87
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 06:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01A2192B6B;
	Thu,  5 Sep 2024 06:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mfMGEJTc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F031925A1
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 06:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725519387; cv=none; b=Yq4XRim4sIELm08VRE+5N39dEOBNq7KJEVYL+GVook461bgJCq7bx4SiPSLy4yvTg9JQ9jlvOAFQRl3OxF8oajK9gXzNt+C2qMMJeFc0XZD2dLj/GXamGugGB9qghn3Ll2B6vMPp6NzcHAGiSeNypYsZEHx8dz3+SD2XtUK5Wcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725519387; c=relaxed/simple;
	bh=smMXhjuqZRoNTKp9fMH70kgIlhlUnlp9P4aEtTO8T1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sD5SwqqTImUekXm6EW/pzhfL65ore3keILLemGE7RiHTN7VeFiWfbbuzWx3zNLpmYbmRbmxEnk6rxWL12zrbkp0VlNjK63ffuYJhKTuZoMfL69tiZA/FbNLbBj7oFKZ/AL8cY/u8gHITKae2cQNMan7aX8cXEiDUZHxeapHNGjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mfMGEJTc; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-709340f1cb1so175723a34.3
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2024 23:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725519383; x=1726124183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is6oA3m8LIEojdfLA7VjQTerM+IVLQZFBibvLCSwhaA=;
        b=mfMGEJTcauafV9kSbMjRObSWB25mUC0KdE8tzHYw4FGc5/aZWh/+/J+s3rWYzW5WZk
         Am776c9A5hNnOj30XnIbViaFigscTy110CVg36IA5qwVoYIpqSmUNjjyS19hqxX1nsY5
         Za7ABCIhtnmQMERG0hv5bjLWHhduPIfUNWwCzCdYo+EyIqPnZWO2HUNEzH5pDwHhYvQ4
         Yrjm6wxsczHoMu3vvOd7Pq8brlduh4m0ILVxz4EK8qeB7EX3DdsXQZQe1Fbqh6l3dCvP
         ei8wQdudptqg79QFbIockBIqeE/cDkugeghReqYZDoVsscUo5ENIgQH9L/+wnyLMzcQJ
         c/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725519383; x=1726124183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=is6oA3m8LIEojdfLA7VjQTerM+IVLQZFBibvLCSwhaA=;
        b=Gw2+WtijFQo7qQ6ysNT65uom//fyOyGebRSUXEmjILw49dYvJKUIYuWHBeP8HdMv3e
         Ky2ArDomTUJvMqW00gUI4smJH+1lSaZbnq3m01TvosA3f7ctiT1X4JVDMEJifKFdnnuX
         uLpc+gAlvkmha7GzzeNHsoct8wCpdeLvbzZXAZqFoxjdX6ksigQo+IEqhZMQhmcqEyaJ
         4QN/zM/rCM9Lt8uASGTTewEt65dsL2bnEd3MWHBpGWXYTU2qQEE9eqHSB+062JmzTV0/
         qsPqYROQomDAEvvh4S2Z+Px9trBI4cooE5iPHbyHO/ivieIL0k8EEBSVQI2G1RUetnTc
         S20Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyjVqY0M1d4Y/wFJCgz4+8KF/Nwt7JgCVDr8bRC4k0oFo5v4Dyu72eZHProvnevA0sBDmCwkSh6hsS5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx61aDpwIoL1wSyI8C2xv0q/4EdppZpMxD/oB3jNYkwjOdaFSsa
	9CGD1ogFS1pC5+sNS0C5NYLPMHUQRef+0evtK2KRrDu710If4HSHWlDF/BxCR2zeZB/IMxlnxPf
	C77e1j/JI7Stye5PPPctFpfMzCeCO+ZMXDYkXRQ==
X-Google-Smtp-Source: AGHT+IH5sLg/BL7saD9/TXa220ctb5hvcylawPt/eU1IH9MP/VmfAzkYvlQbzwvsbvXXi2U8bfsvnevyQYB2IQEHh6U=
X-Received: by 2002:a05:6830:25d6:b0:703:63d3:9eef with SMTP id
 46e09a7af769-70f7072e89bmr16742155a34.25.1725519383303; Wed, 04 Sep 2024
 23:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-2-jens.wiklander@linaro.org> <4a498990-2d9e-4555-85f3-d1d22e26b9dd@amd.com>
In-Reply-To: <4a498990-2d9e-4555-85f3-d1d22e26b9dd@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 5 Sep 2024 08:56:11 +0200
Message-ID: <CAHUa44G9yF2GoQD8XrE=agkGCditH1v+NYm16WpdORX4aRixYg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dma-buf: heaps: restricted_heap: add no_map attribute
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 10:47=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 30.08.24 um 09:03 schrieb Jens Wiklander:
> > Add a no_map attribute to struct restricted_heap_attachment and struct
> > restricted_heap to skip the call to dma_map_sgtable() if set. This
> > avoids trying to map a dma-buf that doens't refer to memory accessible
> > by the kernel.
>
> You seem to have a misunderstanding here dma_map_sgtable() is called to
> map a table into IOMMU and not any kernel address space.
>
> So please explain why you need that?

You're right, I had misunderstood dma_map_sgtable(). There's no need
for the no_map attribute, so I'll remove it.

Perhaps you have a suggestion on how to fix a problem when using
dma_map_sgtable()?

Without it, I'll have to assign a pointer to teedev->dev.dma_mask when
using the restricted heap with the OP-TEE driver or there will be a
warning in __dma_map_sg_attrs() ending with a failure when trying to
register the dma-buf fd. OP-TEE is probed with a platform device, and
taking the dma_mask pointer from that device works. Is that a good
approach or is there a better way of assigning dma_mask?

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   drivers/dma-buf/heaps/restricted_heap.c | 17 +++++++++++++----
> >   drivers/dma-buf/heaps/restricted_heap.h |  2 ++
> >   2 files changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/=
heaps/restricted_heap.c
> > index 8bc8a5e3f969..4bf28e3727ca 100644
> > --- a/drivers/dma-buf/heaps/restricted_heap.c
> > +++ b/drivers/dma-buf/heaps/restricted_heap.c
> > @@ -16,6 +16,7 @@
> >   struct restricted_heap_attachment {
> >       struct sg_table                 *table;
> >       struct device                   *dev;
> > +     bool no_map;
> >   };
> >
> >   static int
> > @@ -54,6 +55,8 @@ restricted_heap_memory_free(struct restricted_heap *r=
heap, struct restricted_buf
> >   static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_=
buf_attachment *attachment)
> >   {
> >       struct restricted_buffer *restricted_buf =3D dmabuf->priv;
> > +     struct dma_heap *heap =3D restricted_buf->heap;
> > +     struct restricted_heap *rheap =3D dma_heap_get_drvdata(heap);
> >       struct restricted_heap_attachment *a;
> >       struct sg_table *table;
> >
> > @@ -70,6 +73,7 @@ static int restricted_heap_attach(struct dma_buf *dma=
buf, struct dma_buf_attachm
> >       sg_dma_mark_restricted(table->sgl);
> >       a->table =3D table;
> >       a->dev =3D attachment->dev;
> > +     a->no_map =3D rheap->no_map;
> >       attachment->priv =3D a;
> >
> >       return 0;
> > @@ -92,9 +96,12 @@ restricted_heap_map_dma_buf(struct dma_buf_attachmen=
t *attachment,
> >       struct sg_table *table =3D a->table;
> >       int ret;
> >
> > -     ret =3D dma_map_sgtable(attachment->dev, table, direction, DMA_AT=
TR_SKIP_CPU_SYNC);
> > -     if (ret)
> > -             return ERR_PTR(ret);
> > +     if (!a->no_map) {
> > +             ret =3D dma_map_sgtable(attachment->dev, table, direction=
,
> > +                                   DMA_ATTR_SKIP_CPU_SYNC);
> > +             if (ret)
> > +                     return ERR_PTR(ret);
> > +     }
> >       return table;
> >   }
> >
> > @@ -106,7 +113,9 @@ restricted_heap_unmap_dma_buf(struct dma_buf_attach=
ment *attachment, struct sg_t
> >
> >       WARN_ON(a->table !=3D table);
> >
> > -     dma_unmap_sgtable(attachment->dev, table, direction, DMA_ATTR_SKI=
P_CPU_SYNC);
> > +     if (!a->no_map)
> > +             dma_unmap_sgtable(attachment->dev, table, direction,
> > +                               DMA_ATTR_SKIP_CPU_SYNC);
> >   }
> >
> >   static int
> > diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/=
heaps/restricted_heap.h
> > index 7dec4b8a471b..94cc0842f70d 100644
> > --- a/drivers/dma-buf/heaps/restricted_heap.h
> > +++ b/drivers/dma-buf/heaps/restricted_heap.h
> > @@ -27,6 +27,8 @@ struct restricted_heap {
> >       unsigned long           cma_paddr;
> >       unsigned long           cma_size;
> >
> > +     bool                    no_map;
> > +
> >       void                    *priv_data;
> >   };
> >
>

