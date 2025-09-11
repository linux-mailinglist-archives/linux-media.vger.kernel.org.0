Return-Path: <linux-media+bounces-42254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4150FB52A7B
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 09:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E50A6565739
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 07:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD1529CB4D;
	Thu, 11 Sep 2025 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ovSMRW9J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3DD267B7F
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577018; cv=none; b=dBdLmEHUOhN5uNCeQy0NFqIlf0zrsLBOe+CmNhHF18XCTauFVJrEIMthIxnTkLgjuvquOZ7uO6NWmLTpvC9PdtOSBZkRBACSSjHQmcU4aUQEM/Q2Y9ryfwMr3R+k44UO6CpDNzkxwfShzJ9Eo1+fGUw/2i4QEa78c5164H1NHOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577018; c=relaxed/simple;
	bh=Cb6NPWAnj0ygLjUxD5zBKi6mIgeuA6YFs/mGlYMTqCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3IkAkilJUYxrqPIcV9gKRM+mtY+IbbGFgatnEqHVZtGgHljjkDFdtiURQzjSc9EonnzNU/1SKlNI5zgtyPoClgaRkv0jjZBmITy5Vnj9EJ3HlZPP8t4kuc83ugFLgmRPYUxzsplNf62q+HKYNP4UvwYKDDpU5IUwOrBUO29Zmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ovSMRW9J; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-61ea79c1e91so180933eaf.3
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 00:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757577015; x=1758181815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZ6E6bW5eiC9q7CDA3LI31bAgUOE0PZhjrPZI2/QSuQ=;
        b=ovSMRW9JZgE3qU0vwOhwHOBOxiT2uvlqCS3WVsrSJS7nLlPfUqTucK4y3Zfj+dzVmC
         GgZ+ZU1yPGTnXRZbSsM4J/OPUQQooCVuW/Vsgfvcv8zKDsfodAx7XehMMvqo/uSEu8YR
         /yT9cXeMgESOa371HdcoWIwyhVqaJMN7XAUpSdaC+65cy5iSwUV/l30Du4tCxUaTflCy
         CPaE4TOMoT7GqbCQx213GeiTUYdxzC7oVgvII/6rt0ekRiN5Ri1gdwnTcCJ5McgUqbb2
         tZVo3mqwQ3LW2QdEA9mH5HiV6YXeLUiT47L4tf+ozbMPCJQhc6UYtaudzK30o1KM/S2X
         T3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577015; x=1758181815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZ6E6bW5eiC9q7CDA3LI31bAgUOE0PZhjrPZI2/QSuQ=;
        b=f+oRYRc94SE3lIiOF2r/ELa9qfgQ3TZi+JzIdm1KW7g5qqHM5X+jM9B7oy1gQJvmOD
         14VGYtKb/CwzAwmTy0dYRNI8rEey5bS6XOopADT6BID7ovrjFBEPoShAG22teicpIzXG
         GSwr10U8jTrf2WLr7u5huSj/5SeCsYp3YbSS16ljY6eJcLROVWDKcOwmtq+uB8/xSAV3
         88jHfmqLLl5/6ZuT8n+Xcw95RMk3w6zhftXkN8mKT69RA4gyO8h6xSCvWX5pjZC2jzFY
         wnsmYZlSqIbY73aFwF+iUq3C5CUUbl/5cBgMeyalmbep/gIQaGla0otjK0XMcyQ72SRc
         sC7w==
X-Forwarded-Encrypted: i=1; AJvYcCV7nNw19TXfNxg9ek8imkDtabwLJzflPV9oodIoTBV/mPRQsGSRTuYwuOZZFCsgMwOZPjdoYuebPymm+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1tQ648n2o76kcttBCnDpPoFLLDf+n52qTOf0ESzRhvg0JOpVz
	bZi+bsVKhLeJlTFL9z/EZVZXjCE5i6xr/YyH6/p7XhbR0YwIQs67tAg7tiqINsGwCNWHkLQWnbR
	vdo6GTMhYxUrpQQSQKVRkYL5qubwf1+8Ml7DVvIE3Gw==
X-Gm-Gg: ASbGncu/JN2E61yMGAMPldG0xxqCZCCwIabJJ15rVFwk57mRnWcFiz5Pu7swQfwImqo
	L9vycjUcv5nXoNrXGI7J8ZusB33qGCuf7G3p7RFuItITB9JWdfUQqiwPY5/nVz0aU91VOj3H7dC
	ut8l/kk0Fu2KRprgF4JKr++FZKS1xPCE33hHZuFLCcpN1/2UdgaYFOEREF68oivVewTQsZO5T2x
	7yt0Bp4
X-Google-Smtp-Source: AGHT+IHM+qomPa7mkwPaxbF4J0ZwMvmQZ4r3i08spiXwqRdColY0ofOiN+xC4zPpK9pKKDVK1an+zwdrKVe+3sc2KLA=
X-Received: by 2002:a05:6820:1518:b0:620:ea78:ceb4 with SMTP id
 006d021491bc7-6217897a730mr7686244eaf.0.1757577015334; Thu, 11 Sep 2025
 00:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org> <aJ1-YpgvGt4_6CFU@sumit-X1>
 <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com> <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
In-Reply-To: <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 11 Sep 2025 09:50:04 +0200
X-Gm-Features: Ac12FXyvCWRnQD7Gsb8VWVWslCX8Upv9AarUZnTiiQT33HIlYHfy4GNTnaJlFIg
Message-ID: <CAHUa44HHSKwiBYPMSY5hj6wyWc9-uvtQVx+JLx4M5yjD5AwyTg@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, Sumit Garg <sumit.garg@kernel.org>, 
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

Hi Sumit,

On Thu, Sep 11, 2025 at 9:15=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.o=
rg> wrote:
>
> Hello Jens,
>
> On Fri, 15 Aug 2025 at 05:00, T.J. Mercier <tjmercier@google.com> wrote:
> >
> > On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.=
org> wrote:
> > >
> > > On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > > > Export the dma-buf heap functions to allow them to be used by the O=
P-TEE
> > > > driver. The OP-TEE driver wants to register and manage specific sec=
ure
> > > > DMA heaps with it.
> Thank you for the series.
>
> Could you please use EXPORT_SYMBOL_GPL_NS instead of EXPORT_SYMBOL for th=
ese?

Sure, what namespace do you want in the argument for
EXPORT_SYMBOL_GPL_NS()? "DMA_BUF"?

>
> With that change, please feel free to use my
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Thanks,
Jens

> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > ---
> > > >  drivers/dma-buf/dma-heap.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > >
> > > Can we get an ack from DMAbuf maintainers here? With that we should b=
e
> > > able to queue this patch-set for linux-next targetting the 6.18 merge
> > > window.
> > >
> > > -Sumit
> >
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> >
> > Sorry I haven't been able to participate much upstream lately.
> > >
> > > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.=
c
> > > > index 3cbe87d4a464..cdddf0e24dce 100644
> > > > --- a/drivers/dma-buf/dma-heap.c
> > > > +++ b/drivers/dma-buf/dma-heap.c
> > > > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *hea=
p)
> > > >  {
> > > >       return heap->priv;
> > > >  }
> > > > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> > > >
> > > >  /**
> > > >   * dma_heap_get_name - get heap name
> > > > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *=
heap)
> > > >  {
> > > >       return heap->name;
> > > >  }
> > > > +EXPORT_SYMBOL(dma_heap_get_name);
> > > >
> > > >  /**
> > > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_=
heap_export_info *exp_info)
> > > >       kfree(heap);
> > > >       return err_ret;
> > > >  }
> > > > +EXPORT_SYMBOL(dma_heap_add);
> > > >
> > > >  static char *dma_heap_devnode(const struct device *dev, umode_t *m=
ode)
> > > >  {
> > > > --
> > > > 2.43.0
> > > >
>
> Best,
> Sumit.

