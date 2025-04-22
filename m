Return-Path: <linux-media+bounces-30721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486BA97271
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 18:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D0563AFB9B
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 16:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BAE290BB6;
	Tue, 22 Apr 2025 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IFU5+xoH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE42900B0
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338660; cv=none; b=Nz8nLDlBe9vlB5+ac6ty11vuRTcr06zg5N/rSydmNSjzx9W1Zau8lvB5FYQy7ek4ivZv4pOcwiqz/Tz8xjckvCCma/mOCuoLHDaGLAaRzEfCj5mBY+QaMr5cIx2tg6Qv6M596U+7oOh9FEOvjC2jJw6vQag5MF/bdrY6fwJ0A90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338660; c=relaxed/simple;
	bh=PsselFC7U3wOuPzOdrlcRuBXUrj4nJSPxGm2aehJSuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJIxOEQ6plAS9yPEy+67I+WaJVt1a+c6p1f6ab8dL9mSYZFU/KsldvsE+Jilfdm6va0eEkZL5dlmxZfJA/MEjfnvLnQv419xSwrA3wZ6EP/gtet9N+CEGlmCFP4TK/4TD7I+XSUYcOlhV8NUe7mmGkn17rrwG28YbdaSaRBkSSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IFU5+xoH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso60755e9.0
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745338657; x=1745943457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+VlTv/hTKrlRvm1O4sYCipzPw4t9W4hk+Rbsc7ns3M=;
        b=IFU5+xoHO3rYwGSc97U7Ha9uCbOegw6LVXjfujYgup1lg1vGnTTmHMzPY8lmSEJRke
         cu7CGbFZNq42BVZkIN5uDwht92Ht/L6D80Q59Fu1m62ryfY8cCT+qw1PJ+Dy0q6HUo07
         TGCX3EiFBWvVWqkAKZo5xYx4cfIfaOLbY2cZ6vcVrHbBYuroZtK9Qh94NrNeEAq1l2UM
         1wUNqzqbPRUXV+uCjV9cddpMl0+YNpMmg+w/nyRDasjxBMDFkcDeAvzXLMCND9Tf/rHh
         OYN7sgnBB7bM8BcLXJYMGb5PKpcnU5Qniudas1vys3ibRMfyxBNGeoxiy6uSEJXHnZIb
         R9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338657; x=1745943457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+VlTv/hTKrlRvm1O4sYCipzPw4t9W4hk+Rbsc7ns3M=;
        b=ht/xwkz0PfaeyFNK1EzHi5V0iTq2xXibXozziH5XbohuLw9eTIvNBRpn2AkNV5pKMG
         iWxvbOtxNNtociXYcxi42aTAG8HflTZyPwL0SggP3xLFptSamKnFKtaH1ztOVAKCucWL
         jrPM1p1CkLE4r7aRHkCv5UO1mENrdxhReDYvK1dKva923e4J2VnMKFo+VDpcUnnH47BE
         osE34gzEmMe2w6/VVtECnDcCL1fvBneGhqOTIwdInbzUW+r7XkOA8wCXqhELd3oedLhE
         cCo9Bb3qnTDyRhVNYphhSApfsBo5Y4GzD6K5AAz+DWfw3X9qPKDH1e+JqVxZmiU8fKPW
         LYCA==
X-Forwarded-Encrypted: i=1; AJvYcCWXrSAZuD0jtciEv5P/Tpx5iyCR2KXSd0sO1BJx7qto7Wzauk6gVz35RCcL1/gVD/3yblulm7j43H+axA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlE0ZumwcV+HCSlMznU0MztMmrjTNxBblGFNIJ5LgqO+GzENro
	fUpUs5E53yTIY8QnArUAMBSMOBhWPhSXCpnOeIm2A3HvA2aikv/NJ1VqKlL8enCU4YGcjUT3xq5
	S1tlRPARCy038DR2Qpmy9IHPq3T5I9RXT3pU8
X-Gm-Gg: ASbGncuBnpj5dt2+x1JJvZo9REWjhRKej0KNsBiIP6SkXnMnN8u8YGnI8wS0MjA/psV
	U6LT+9Rs7KNhHjsvlbIRyz/j7HTSRRCi4x6IKAjW31OD/nwNRdWyXAkQybgfPk7qRUHDZ4K5OT4
	Bgx4Etdkp5rmoDMNUZ/lQiLkSVgXnkZJ2Jz3BCiTgyuLfML3Zxk7hl
X-Google-Smtp-Source: AGHT+IENoY5KLCLbGnv0xSGeh3ak7+yd+up6SvbsAMQAdxs3P8pPk6x9+6wqqUTe/UoTwxZddmChRUUCohE67dhja5o=
X-Received: by 2002:a05:600c:5809:b0:43d:5b3a:18cc with SMTP id
 5b1f17b1804b1-4406a439719mr5397465e9.2.1745338656623; Tue, 22 Apr 2025
 09:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417180943.1559755-1-tjmercier@google.com> <a4f72149-70a0-4bbe-bdcc-70384c152f83@amd.com>
In-Reply-To: <a4f72149-70a0-4bbe-bdcc-70384c152f83@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 22 Apr 2025 09:17:24 -0700
X-Gm-Features: ATxdqUFWtfUd0V2lIDMC14HVW9RJdQPpnjsioC_15uNznFDm7wn85ZdVHvIBgZU
Message-ID: <CABdmKX2-innZC65Fut6wc2MFUNwO2g6w=_iLv9EBkDn+6LQs5w@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: No separate allocation for
 attachment sg_tables
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 1:24=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.04.25 um 20:09 schrieb T.J. Mercier:
> > struct dma_heap_attachment is a separate allocation from the struct
> > sg_table it contains, but there is no reason for this. Let's use the
> > slab allocator just once instead of twice for dma_heap_attachment.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> I'm not *that* expert for this code, but looks totally reasonable to me.

I noticed this while reviewing Maxime Ripard's recent carveout heap
patches, where I was confused about sg_free_table() until I realized
it doesn't free the underlying allocation. Then I started looking at
other heaps and found that most of them do it this way (including the
cma heap), and figured it was a nice cleanup here.

> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Let me know if I should push that to drm-misc-next.
>
> Regards,
> Christian.

Thanks, yes please!




> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 43 ++++++++++++-----------------
> >  1 file changed, 17 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index 26d5dc89ea16..bee10c400cf0 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -35,7 +35,7 @@ struct system_heap_buffer {
> >
> >  struct dma_heap_attachment {
> >       struct device *dev;
> > -     struct sg_table *table;
> > +     struct sg_table table;
> >       struct list_head list;
> >       bool mapped;
> >  };
> > @@ -54,29 +54,22 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIG=
H_ORDER_GFP, LOW_ORDER_GFP};
> >  static const unsigned int orders[] =3D {8, 4, 0};
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> >
> > -static struct sg_table *dup_sg_table(struct sg_table *table)
> > +static int dup_sg_table(struct sg_table *from, struct sg_table *to)
> >  {
> > -     struct sg_table *new_table;
> > -     int ret, i;
> >       struct scatterlist *sg, *new_sg;
> > +     int ret, i;
> >
> > -     new_table =3D kzalloc(sizeof(*new_table), GFP_KERNEL);
> > -     if (!new_table)
> > -             return ERR_PTR(-ENOMEM);
> > -
> > -     ret =3D sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
> > -     if (ret) {
> > -             kfree(new_table);
> > -             return ERR_PTR(-ENOMEM);
> > -     }
> > +     ret =3D sg_alloc_table(to, from->orig_nents, GFP_KERNEL);
> > +     if (ret)
> > +             return ret;
> >
> > -     new_sg =3D new_table->sgl;
> > -     for_each_sgtable_sg(table, sg, i) {
> > +     new_sg =3D to->sgl;
> > +     for_each_sgtable_sg(from, sg, i) {
> >               sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
> >               new_sg =3D sg_next(new_sg);
> >       }
> >
> > -     return new_table;
> > +     return 0;
> >  }
> >
> >  static int system_heap_attach(struct dma_buf *dmabuf,
> > @@ -84,19 +77,18 @@ static int system_heap_attach(struct dma_buf *dmabu=
f,
> >  {
> >       struct system_heap_buffer *buffer =3D dmabuf->priv;
> >       struct dma_heap_attachment *a;
> > -     struct sg_table *table;
> > +     int ret;
> >
> >       a =3D kzalloc(sizeof(*a), GFP_KERNEL);
> >       if (!a)
> >               return -ENOMEM;
> >
> > -     table =3D dup_sg_table(&buffer->sg_table);
> > -     if (IS_ERR(table)) {
> > +     ret =3D dup_sg_table(&buffer->sg_table, &a->table);
> > +     if (ret) {
> >               kfree(a);
> > -             return -ENOMEM;
> > +             return ret;
> >       }
> >
> > -     a->table =3D table;
> >       a->dev =3D attachment->dev;
> >       INIT_LIST_HEAD(&a->list);
> >       a->mapped =3D false;
> > @@ -120,8 +112,7 @@ static void system_heap_detach(struct dma_buf *dmab=
uf,
> >       list_del(&a->list);
> >       mutex_unlock(&buffer->lock);
> >
> > -     sg_free_table(a->table);
> > -     kfree(a->table);
> > +     sg_free_table(&a->table);
> >       kfree(a);
> >  }
> >
> > @@ -129,7 +120,7 @@ static struct sg_table *system_heap_map_dma_buf(str=
uct dma_buf_attachment *attac
> >                                               enum dma_data_direction d=
irection)
> >  {
> >       struct dma_heap_attachment *a =3D attachment->priv;
> > -     struct sg_table *table =3D a->table;
> > +     struct sg_table *table =3D &a->table;
> >       int ret;
> >
> >       ret =3D dma_map_sgtable(attachment->dev, table, direction, 0);
> > @@ -164,7 +155,7 @@ static int system_heap_dma_buf_begin_cpu_access(str=
uct dma_buf *dmabuf,
> >       list_for_each_entry(a, &buffer->attachments, list) {
> >               if (!a->mapped)
> >                       continue;
> > -             dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> > +             dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
> >       }
> >       mutex_unlock(&buffer->lock);
> >
> > @@ -185,7 +176,7 @@ static int system_heap_dma_buf_end_cpu_access(struc=
t dma_buf *dmabuf,
> >       list_for_each_entry(a, &buffer->attachments, list) {
> >               if (!a->mapped)
> >                       continue;
> > -             dma_sync_sgtable_for_device(a->dev, a->table, direction);
> > +             dma_sync_sgtable_for_device(a->dev, &a->table, direction)=
;
> >       }
> >       mutex_unlock(&buffer->lock);
> >
> >
> > base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
>

