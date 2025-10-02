Return-Path: <linux-media+bounces-43634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 044D1BB3DD6
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 14:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B7019C777F
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 12:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF0A30FF1E;
	Thu,  2 Oct 2025 12:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjFtA0gX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C852C2472BD
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759407461; cv=none; b=eT6xa9ib+6WQHZoEHSolJPC5UVasi47YuDOWr+657xsv50FGALBujMR/zhZclH6l1nwiZs7+m7v2yMF2gJAQRPXOTUNojFomv2mi75W0a2DxuqvxXh+dRZ78ksU/L9YcW7h3HHtuAHgwe0Zaf8nc9RwNCT44nsDDQvkzXpXVVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759407461; c=relaxed/simple;
	bh=Hxkhz+OX3DkM8SQb01oOpCymU1Ggt9k0z/HpJpgOCLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUso9wWS1LmlHo3cA+SjHqZ25wumFh9sBML10M8GZ55R5pSmnjgdseAoQf4o+GGrAgj0T1Jt8rKpEUuTcjXw3fHBnhWkPFvxth8kDzKlD/cHTRSMveel5AZ3EmDfcYKorIOFvLga0851KML8VSc04GSVq8cU9Gn93dWM3HEYsgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjFtA0gX; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-43f88d33872so423326b6e.0
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 05:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759407459; x=1760012259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGsaoeFP4OZoz2ETAlY65ICprHno78vJEjUPKXAIoTc=;
        b=GjFtA0gXINfp1zwiBiMedoSTOjM0Qt03vJQMZnASaYjlGvYmhrbQcDmh+yCJxam4B3
         vU+SMkSE7/NqW5st8wg8mjE2eznNf7JHneheYV+Y/YIFsOmZY3WSIgsd+XsGjAq0hSHx
         jH7U4PUAgrXJ6kZyashqIjSa6PqB4LEAfOsIbzRKC6iRwy/OAB9Ywah/LsuvYUhHq0IT
         lQHhIeagpF0iMatuSsJuT6v0NKuPhbgwqtfsiG180m08K+oiM7p/VG+c8cG/yS0Wkmdh
         GZpAK/dFEkNTdP7cnCIjA87dfEHJScnEchIlu6MnJBifuWiYYHtGcVxwgZiPf7hc9HZV
         vEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759407459; x=1760012259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGsaoeFP4OZoz2ETAlY65ICprHno78vJEjUPKXAIoTc=;
        b=bb2uXDdEyH2wd2gXe0fjWfXmFoPP48qMrS6zQfnbx6eNxwaPD1JvgADj/xOzA1fWWk
         hu807vdKrb/oikEeoRdyhlT3lgnwAMGJf6+XzoSikEv7L1bPyxWq4nhFBsoeuX6oQlgQ
         MVJM343YzTc545tNf86jA8a7eUwuunx617dCs0jPb7Cpl3BwgIzcbxMch0CLune837Hd
         rTvReVZxUG3/ZQe1cCyEYrDDzl/zbJiLw480j9oLsQJSdj26mprneVYyvaiDMzhGc6S0
         HmIax/o/2IilrQMvBUcRHe9p1K8C7/obJgRLKdHTQtAy4j1KXrwY7AXG/jQQJ7c9lyDe
         3Tlg==
X-Forwarded-Encrypted: i=1; AJvYcCVS9ttzFNJDYt+sai+VUGnnilg1999yaxGHZ8cIWe8XoJ/W3zzykP9g5xfsD1wTTTdbnQFSNPMX1f+Ung==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8a9/mhNqd9k4UCo9uVKrWr5H/BBlzChM67HdCNdfWVFhwA3W0
	JcZgssz9sS6BaZslHxoRSIRKonrv1ciUfT12l/Hc+Prf32s1sGj+5318PxSMGMPdX+Tadj9+FOj
	f9z+3XU/MyfEynhDelquHhSbzujmLlWWEmpGRHWCRlA==
X-Gm-Gg: ASbGncsl/hIrt83XkEu+9SLWpSClDdj5RVD64lfFtrAeLR7QFcQvKhEl7FoyXipa7da
	m9zkEGI1iosLJtW2wE0tHJjsRKqd9fDqJ79w1UJWD8eckFQvP3i5knKr3UH5HDBfjTBWhxYNw7e
	FyizrJUzxe6+WsXCL2dRoZ/Zn+1I2g2fHTfI4CAf990i0y3t4F2tiUZSY63p/+Gbmpf3Xk4h3ob
	BSWlzDbi4CSuS7rA12/SXjqyuAVPch2sOwunyBIMT6woW4=
X-Google-Smtp-Source: AGHT+IEfetTH6APo2ttHfmQ/HD9OGM73G7JSFHlGpVInBdI/YWyuV7C6xZbIUTpTHqoh4vyg+PN0N+hbiXUnxi0n74U=
X-Received: by 2002:a05:6808:6f92:b0:43f:7287:a5de with SMTP id
 5614622812f47-43fa41ccaafmr3695885b6e.41.1759407458820; Thu, 02 Oct 2025
 05:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org> <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
In-Reply-To: <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 2 Oct 2025 14:17:27 +0200
X-Gm-Features: AS18NWAi5-v--TYVxyZOnQiOgWgAxWVYCjBvI6uxhCSDTvPtA0sa1z_it1UPtE8
Message-ID: <CAHUa44GtAY7=r_bA7ETOsBq+K4w6r1CtY7T9rFn224mshA5GYg@mail.gmail.com>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
To: Maxime Ripard <mripard@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 2, 2025 at 9:47=E2=80=AFAM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> Hi,
>
> On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> > Export the dma-buf heap functions to allow them to be used by the OP-TE=
E
> > driver. The OP-TEE driver wants to register and manage specific secure
> > DMA heaps with it.
> >
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/dma-buf/dma-heap.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..8ab49924f8b7 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/dma-buf.h>
> >  #include <linux/dma-heap.h>
> >  #include <linux/err.h>
> > +#include <linux/export.h>
> >  #include <linux/list.h>
> >  #include <linux/nospec.h>
> >  #include <linux/syscalls.h>
> > @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>
> It's not clear to me why we would need to export those symbols.
>
> As far as I know, heaps cannot be removed, and compiling them as module
> means that we would be able to remove them.
>
> Now, if we don't expect the users to be compiled as modules, then we
> don't need to export these symbols at all.
>
> Am I missing something?

In this case, it's the TEE module that _might_ need to instantiate a
DMA heap. Whether it will be instantiated depends on the TEE backend
driver and the TEE firmware. If a heap is instantiated, then it will
not be possible to unload the TEE module. That might not be perfect,
but in my opinion, it's better than other options, such as always
making the TEE subsystem built-in or disabling DMA-heap support when
compiled as a module.

Thanks,
Jens

