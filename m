Return-Path: <linux-media+bounces-42252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7AAB529AD
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 09:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 382CFA020BC
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 07:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3C926A0B9;
	Thu, 11 Sep 2025 07:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dar66LjG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A5329F11
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757574955; cv=none; b=TAGLwAQOcW9dFgAUFWksDP+3gQAOYm8NAuUc/DZasDutSqWblC2frCrD0wLmUBeoX0wt4GsTdZZSR2tmN1m8ZLBNHO7GaKxBoXaL8UeI8/bmnf461torVIrjbpfz2nyQW9vmiHtFVEuTerGCx10POwEYbMMVo/+mkQ4C6pWj9mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757574955; c=relaxed/simple;
	bh=3IyfD1UfYcTLUF/3VnJ3kGLOU2Buly+WMW7fkboaoGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZwqprhKVN+D+2uK92QJzrOlmVpxZlpbFQnMILPAEgsjZfAvBcZ65dQdQ+vf+mje14xuJ7gLbsLGhBswEvm15ajvPY05TAs71L1zHsWAZ1l/ofZKvenGa1w0L91Kqe4tHRViuv+dFc04etXixcs4O0xjAX65fwzaSjujpR4FSlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dar66LjG; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-622b4b14a75so727598a12.1
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 00:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757574951; x=1758179751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP9NntJ30KfEYObDqnhrL+C6H0K6PogP4x/qLVkNDh8=;
        b=Dar66LjGy91Vfom+IrQzPwVAbPWKyxGCTInDy5FK1z+5zPUgc+iTVBGfFg0V+0FXw7
         qKSrKNfqLODUTc6GgI5ly7FJ+w0i4vDwxRFRyjIQI53N9oztrkYpWC2HT7WJYNUREkQu
         HrHe167C+vLJRaEmSQYp7rMJNhPbuk6DMjeWYWt8EjZlGx+bfGlNNJL4jTTTf8ucCVw9
         Ow3/mQORZDASnamU8Xg8v830ykhSIgDxfgr4fHnfhoMILS6/BM+BdHa7ltO+PEyQ3fta
         3x/tRr3GhWF91pfaLedz7fJgpqSG9WD+qGHpTLt6+ZXIPrmc4QqcSfHRwTIsUGH/njFM
         Zi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757574951; x=1758179751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GP9NntJ30KfEYObDqnhrL+C6H0K6PogP4x/qLVkNDh8=;
        b=jewr4anMR5m245meXuGEecr/K+kQCEdwqgWA2jCOwebYa0zyj9BmiCoaZBl1fK0xUB
         zzah1FH1zmgQQVIWh7MdUuppwtkIHZWEYR7q6tDXA+YIWVXFlWfJEHfeVgl8bUrCcEFi
         HnwdfDSDhRBIjwOBDOyhuTL73gWlkyBlSakfNDFA6rCPcOi0Ty3P1GOjDg3N0V/Puo5E
         RcuiuXbg74vyY/QROVYyhZLSqjpRiBwJBBccu1k409OqHtba0n35qiYVzbzuYPBMhZQ/
         e+viHfx4DP6Ao2OvmCwiNc7IpXqKM3kfU+ujX3l92S7NHAyclFvGRHUYYmbZXD7cmFW6
         +w7A==
X-Forwarded-Encrypted: i=1; AJvYcCWnJMyL0mfFkeVWHlBrrdDl4XTgr5UJRCKQgYINdvxota4Cirdmio0X35SVyHInNjFy7pmz13wMvnsgGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWAC9vHZ6y3K7aRzDHIKpTbvygFPJE7zDTfRrc6YqLPQieKO3h
	Dql/mpZ0YZLUJ5GnFl/rlEsxrMdsAqyO1+iXRMdE8liqMIr3+Plg/Z8PPR0nZy2EgLAhxErPMML
	t5oVOzA6J5HnRoBeuH19o3MO7N/NCLUC/O2YXLjt8HA==
X-Gm-Gg: ASbGncvJ7oSOQZqR+BIE1ZGjWwyO9wHsel4ILg4iJxe41spqdVQioC2zR65k2TmzZpY
	dCezGdjkRM/tM+m2XAK9AzrbZPXdsjzHw5hIzHm9t9QyfJcV0bvem62DblVge3hVZUKorL9YOt/
	Ohz+5w7xEPd8Z+SCMKLb0u7M5wIfhGJKlqBiDu9zmnoP6kTQg0XXEcBjqK+M7ks6kWrKbxzWzos
	EW2reyrH2kad0xI09hipTXHopR+Y6718J9YvXA=
X-Google-Smtp-Source: AGHT+IHy2Mv7dBIklAlXQ3z1llA5qfh3QOZdDcp9k/xtxjZUz/DCzy7vfzzhI0hlOYW8883NeAHTA7AVAmb3DRGTR8w=
X-Received: by 2002:a17:906:730e:b0:b04:6546:345a with SMTP id
 a640c23a62f3a-b04b16c733fmr1789866766b.52.1757574950692; Thu, 11 Sep 2025
 00:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org> <aJ1-YpgvGt4_6CFU@sumit-X1>
 <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
In-Reply-To: <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 11 Sep 2025 12:45:39 +0530
X-Gm-Features: Ac12FXy7pNPcf0b_CAub_P3Nk83sbsucFa_59lr_vcagvKGZnRZhFr4eESPBY3M
Message-ID: <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jens,

On Fri, 15 Aug 2025 at 05:00, T.J. Mercier <tjmercier@google.com> wrote:
>
> On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.or=
g> wrote:
> >
> > On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > > Export the dma-buf heap functions to allow them to be used by the OP-=
TEE
> > > driver. The OP-TEE driver wants to register and manage specific secur=
e
> > > DMA heaps with it.
Thank you for the series.

Could you please use EXPORT_SYMBOL_GPL_NS instead of EXPORT_SYMBOL for thes=
e?

With that change, please feel free to use my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > >
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > ---
> > >  drivers/dma-buf/dma-heap.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> >
> > Can we get an ack from DMAbuf maintainers here? With that we should be
> > able to queue this patch-set for linux-next targetting the 6.18 merge
> > window.
> >
> > -Sumit
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
>
> Sorry I haven't been able to participate much upstream lately.
> >
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index 3cbe87d4a464..cdddf0e24dce 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> > >  {
> > >       return heap->priv;
> > >  }
> > > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> > >
> > >  /**
> > >   * dma_heap_get_name - get heap name
> > > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *he=
ap)
> > >  {
> > >       return heap->name;
> > >  }
> > > +EXPORT_SYMBOL(dma_heap_get_name);
> > >
> > >  /**
> > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> > >       kfree(heap);
> > >       return err_ret;
> > >  }
> > > +EXPORT_SYMBOL(dma_heap_add);
> > >
> > >  static char *dma_heap_devnode(const struct device *dev, umode_t *mod=
e)
> > >  {
> > > --
> > > 2.43.0
> > >

Best,
Sumit.

