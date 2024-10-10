Return-Path: <linux-media+bounces-19332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50486997C64
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 07:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 808171C21B2D
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 05:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605A419F41D;
	Thu, 10 Oct 2024 05:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrEDYwFz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C28F2AEEC;
	Thu, 10 Oct 2024 05:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728538005; cv=none; b=IPrbhp4VNwLkDBviQltfFYN5UE95Dc2713S5StOw4tLIVMkbS3wXA3DMdXZwlV+ujrlHYLFYzUM+4t3VN+KK3AQNO6ipzci/aRJECPFe1wXxJwojvKIxUGhVedTBiIhV746HHBKof/zCQG6akQZTxqbOLnfCA43Y6rBLnHaNZHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728538005; c=relaxed/simple;
	bh=sFwwmMSzqurE1sruBpItZIzFYoywFaGLAcvZ+DkleU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVlmXvsU+pSFL2F0tPQbb0gBi7Ouv7uXUVITgSqh1sjTC9r9kqJ4pG2rDl90FOd7440wwSJQEyBn9onG4zolDY5b8+p0Nlhlv+CQsAGpiNR0b7/+Ce9vnfsk9faYCdmVJknolKfVlPA9aisR2zel7r/frW4bG46QBbmOTlMLx3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrEDYwFz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53959a88668so545196e87.2;
        Wed, 09 Oct 2024 22:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728538002; x=1729142802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2OggcA+gxqqTXGi/3T5tDMn09O+q9SzuiOHvmMgRpY=;
        b=hrEDYwFzbe9C2gsRAH3VRZVoZjlD+27AXqm6pHTTZ3uoCOUdUdIJ1B6jepxTcwTiaO
         BqEAmw2ISNKDMu4SRExCA0NqbqvpRKx8ECe/2CU7PhM5VIXwWx9KpnKvJbTI4XpQ6CA5
         34jVe3qc3YzahdUw4BXdtBfiojfRAw+qOp1pcpMdjotEugwY+whwYKqKXEokwLn66pA4
         Z3NFWKTSnqLUlWLKTb5HMraQToxnPm5fWzBpCT4or18QHTvNrlH4InYAw+z/7+cWcQNU
         CBUIor36+lj1x6LhcUQlTIM1iH5ogn3SQX1PLkOzO6/ogYtNrfSlCA4u+ddjtjDQdC0Q
         Yydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728538002; x=1729142802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2OggcA+gxqqTXGi/3T5tDMn09O+q9SzuiOHvmMgRpY=;
        b=tdfWAxwGTi66flHgkONCr13UN/7L5sTmfwuLOXjMKsXb/dJQUVlq6eBkvMlrMPJoYw
         tNK4LaRs/CaiARu8tNT+sACQlj7q9v/PQ02Op6C4XDUcV1ZRjjnu+X26xVX+JpFhsudL
         2ndteeI5kcRuhg9l/1Oi9B9XWYMeJ7aim4i7YXDqKIj9nVtfePA+P2OFxnUrPtynljwN
         VtOxN0ifQAAc71egCS70WJeTzZVfx36ZDbZFzc4M7GZlcWjLnKtzkc6KCTtlfh7ilwhB
         7V6/65SLw85+pczqYYumO7mBYXVJSOhftmwWNU6ECTpZUpBaTg4EJV/JqNYaKM6mGJbG
         6Rxw==
X-Forwarded-Encrypted: i=1; AJvYcCXA9GIQHYIlDYpTOBmsFcSAu359IFA6EvoUSEvYgumgwteMsPCpMCjKUeqdE/KDuLCmWZBxQ9EKpZ744eg=@vger.kernel.org, AJvYcCXKKQ/OJn5bqVyF+vjcLbTv7TumZD5ERL7atL2Xk9hvjstuZFCRcOarrKJkWJ0e+22nml2k3THGVG87Gsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvOZnCa/pUMbhGFkUZ8+cwIWy09g/G+8NEwT558lE71o/Wmm6
	W2A+jHyoHqGzkQun4u0U2dFlWccfjh5aoyUDskMVSUfT+eodr6s+qMnKpw6ZVqcjCWpoyUCyJ9p
	IKIQW168t3eI/xSMLkkytNdJweGLdcezs
X-Google-Smtp-Source: AGHT+IEbIWNphp9CaxyIBmS6fFoevv90QzHYFfcACGBeoawWKdzJgDWeGYAJzuVQ4Yqa5/qKqf5ITwHfksRZcGmb+ws=
X-Received: by 2002:a05:6512:4003:b0:539:88f7:d3c0 with SMTP id
 2adb3069b0e04-539c496ce04mr3124182e87.51.1728538001854; Wed, 09 Oct 2024
 22:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001175057.27172-1-quic_pintu@quicinc.com> <CABdmKX2xEn8QjObqR3VNb=RqMZVNBiNtkfYWm8h_3Xc8KMkdag@mail.gmail.com>
In-Reply-To: <CABdmKX2xEn8QjObqR3VNb=RqMZVNBiNtkfYWm8h_3Xc8KMkdag@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 10 Oct 2024 10:56:29 +0530
Message-ID: <CAOuPNLihBBQ0zviFsQ7Vqsde+yy3CGP5OJUkaZFA=1aZbj_NZg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dma-buf/heaps: replace kmap_atomic with kmap_local_page
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Pintu Kumar <quic_pintu@quicinc.com>, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, joe@perches.com, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Oct 2024 at 02:54, T.J. Mercier <tjmercier@google.com> wrote:
>
> On Tue, Oct 1, 2024 at 7:51=E2=80=AFPM Pintu Kumar <quic_pintu@quicinc.co=
m> wrote:
> >
> > Use of kmap_atomic/kunmap_atomic is deprecated, use
> > kmap_local_page/kunmap_local instead.
> >
> > This is reported by checkpatch.
> > Also fix repeated word issue.
> >
> > WARNING: Deprecated use of 'kmap_atomic', prefer 'kmap_local_page' inst=
ead
> > +                       void *vaddr =3D kmap_atomic(page);
> >
> > WARNING: Deprecated use of 'kunmap_atomic', prefer 'kunmap_local' inste=
ad
> > +                       kunmap_atomic(vaddr);
> >
> > WARNING: Possible repeated word: 'by'
> > +                        * has been killed by by SIGKILL
> >
> > total: 0 errors, 3 warnings, 405 lines checked
> >
> > Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
>
> The Android kernels have been doing this for over a year, so should be
> pretty well tested at this point:
> https://r.android.com/c/kernel/common/+/2500840
>
Thank you TJ for the review.
Hope this will be picked soon.

> > ---
> >  drivers/dma-buf/heaps/cma_heap.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/c=
ma_heap.c
> > index 93be88b805fe..8c55431cc16c 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -309,13 +309,13 @@ static struct dma_buf *cma_heap_allocate(struct d=
ma_heap *heap,
> >                 struct page *page =3D cma_pages;
> >
> >                 while (nr_clear_pages > 0) {
> > -                       void *vaddr =3D kmap_atomic(page);
> > +                       void *vaddr =3D kmap_local_page(page);
> >
> >                         memset(vaddr, 0, PAGE_SIZE);
> > -                       kunmap_atomic(vaddr);
> > +                       kunmap_local(vaddr);

However, I realized one more thing.
This can be easily replaced by:
memset_page(page, 0, 0, PAGE_SIZE);

I will push this in new patchset once this is available in linux-next.

Thanks,
Pintu

