Return-Path: <linux-media+bounces-39945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3BB27302
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 01:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B5565C57F5
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 23:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E702877E3;
	Thu, 14 Aug 2025 23:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ofrpo21Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F8927A114
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 23:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755214245; cv=none; b=XyC6iqOKmh7KQhDEgL8hq1Kn/ecuP/x/aTbH8BDfwjbbRafzIgfyp1XQeWUA51JbfeRmHWEgJAdYxD+hViQRGNjH4eRmPJCq3EJ7zHi9bSH33HdshYQiZSg7O3HyPugtp7k7vwKVz9oNx437mXdQidUsa/ne9DAdNh0JZbqkRuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755214245; c=relaxed/simple;
	bh=OvsVxJJrFGITa8UZyrCAXbsERpjYWiqbGEh4KJfUBUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4nKu/9l1h7McFgjwCP7wchtSOx1FKBaDjqps8cQ3gTLzSNqo1DbziXBq2st46wSDdAuh8A46zOUFGsDpC5Bl8TDwU4an9xIFXuTaLPjlyivrERibbicAppXDc4ZfzCTS65JznahbfYHRB+MNKsAr60bvypCKh1sqbuNCzP2HtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ofrpo21Z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-459fc675d11so15825e9.1
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 16:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755214242; x=1755819042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0JmiFdlp9ZkN1fxeZfgjKK4+EMYxMKsgyQh0URM5ec=;
        b=ofrpo21ZGZwTYZI6lSFZnurLvRCmOwZ0yBHRinNnu86sFWLlGJINMi+s6+a04qTsdl
         l4PwpAWVoBgp5pP+Xwxm4JLX2VkuUadzgZtczkICNxjjGKBDDgdKlsLbZhWrB6fSwLzZ
         cKHDOs3wvfGLtLEylaYkf67J7/rwE+qeP4p5iImJ/4h5kuKT0I/ydEA1y7IoLCThwi21
         6nhPPfX5ySI4eHLuSLY5Co+TKsZyikoASS6P78BelM2nxJ6JofQ29z/iDgyBy62GpeKo
         ItWS4xa6g7dmoKOIH+IoF0MMksExxf9359LpDr+BJxSJx0wVAMtF2QsWH1Gp3wy61c48
         aRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755214242; x=1755819042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0JmiFdlp9ZkN1fxeZfgjKK4+EMYxMKsgyQh0URM5ec=;
        b=G/Bboro0yENA1SRKRCRRI5TN5f0fWFSUu+jyFZZIiO3LAFzr9mzTQkyT3HAfWhFqAq
         WW8vp3/kbnFzl5oEhVnEsyX/CWeVzhHtgSo4DtTseSDLYcQiWPjhQp3gjJB6W0TK3nln
         AY1WfmbisLI4A6b/2WEPr3UV4O3m2IcOzuSvSaMNXupDYPOU/oG/zUGe3tVGsAmFygBl
         4IBct0CpOEI2ThsGQtzaFL5yo01ufkwb+IBx12ks+v+bplE86v2WkvSJMLhhPchL+fiv
         wySE7jXFYgR0Kaff/L44SfiMll2DH+RpHApxbdeBCr4F9IOVWasKe7cugKgCQoicDPVO
         0u7w==
X-Forwarded-Encrypted: i=1; AJvYcCUC4tGACIyEmH09IvB4RF3JXH982rPJs51TGTrr+nO59crCaTsq+aI/SYpIAniYJ6r5OckxsC67t1m5MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1VWEwSmHJ6ejhUVzb+bw32FNcf//DGsP++AapUjOk8dGlb5/K
	nV9Jyo6rZfl2ybX/6DYw1XoIDedMwZ4ZJhFFx5b2diHF5esFjT5RkZKuargDmG2PUgzwJkBEwBA
	e4a6l2lAeOcqoQp1a3VOfy1NLCdwWJ42NW6YRfmAl
X-Gm-Gg: ASbGnctYNYw+3JPPSlevLRV1M2pK4X/64kc2P83yY4iax9gJAEasuivtJlWYE+L5yoZ
	UAJ1XwGYIVDsm5gmyexb1d+lfoI4PrOgV8gTFPhtEB4Qlo6AegDNCY9RYCY1+CP/hKZ+g5fNsDv
	slJT00YdqR2oTNm5/EdvmtHrg/Exs6duWqLGpNXzQD/RpqDNMapaH0iKeeenHKrn5cDW2QEyEWC
	PopqU5eD/AElB7IatfivqYuX6BRTjEAnynKGA/ATL4=
X-Google-Smtp-Source: AGHT+IEEw+uzXS2i8WjnVSg7+M8YgE/PH0qtNvR3RZRshlFOrW4DkRzKM58Y1imbSzgGPptKIKq3mUjkWcuT38ZrZFk=
X-Received: by 2002:a05:600c:8909:b0:453:5ffb:e007 with SMTP id
 5b1f17b1804b1-45a20af818amr346105e9.4.1755214242237; Thu, 14 Aug 2025
 16:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org> <aJ1-YpgvGt4_6CFU@sumit-X1>
In-Reply-To: <aJ1-YpgvGt4_6CFU@sumit-X1>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 14 Aug 2025 16:30:30 -0700
X-Gm-Features: Ac12FXzYk8vQFwHlmYOx6GVXgELj4N91iOPnVrtkJq0EeS5aTQuf7I4LnzwBN-c
Message-ID: <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > Export the dma-buf heap functions to allow them to be used by the OP-TE=
E
> > driver. The OP-TEE driver wants to register and manage specific secure
> > DMA heaps with it.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/dma-buf/dma-heap.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
>
> Can we get an ack from DMAbuf maintainers here? With that we should be
> able to queue this patch-set for linux-next targetting the 6.18 merge
> window.
>
> -Sumit

Reviewed-by: T.J. Mercier <tjmercier@google.com>

Sorry I haven't been able to participate much upstream lately.
>
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..cdddf0e24dce 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_name);
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL(dma_heap_add);
> >
> >  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> >  {
> > --
> > 2.43.0
> >

