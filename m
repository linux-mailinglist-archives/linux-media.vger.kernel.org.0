Return-Path: <linux-media+bounces-50773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4670AD24218
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF2E3301F5E1
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9522D73B8;
	Thu, 15 Jan 2026 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRv/udan"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B6635EDCA
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768476111; cv=none; b=NNcGy8ITv1aLWFWK50pSMbKGtFVIt7ctr8N7O1zQwztADgIYGV5skzY6wsBluFj/M4rZMt9H8+WYAwdzsAS88LZEgHUmwxh90K+akP+PdlsU/Aj85t07pVb52UOYmTczRenUwVLb4YdULAFdrzc61eBiKzwaakqkxcJqJmHdWFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768476111; c=relaxed/simple;
	bh=4NvuGmk50EFnZOLSVMGrxbJmSZaQbd15DKNhogByLCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftLC1vWPAhKsORIIKasW4dB2SZ5x00UDwr8mdGcFNVOJ9UANpNb+QoX8K8hKRigBCd4OBrAMNF8kjLez4fjTMGoCk3Npy2pWQCznSLEOjHONwkSGMVYL89NiLctHXu/EOKcFmV5xTmHsj1ikOXxOl32Jrpu6pts/eIOcNnO6VzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRv/udan; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b67388c9cso973512e87.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 03:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768476108; x=1769080908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NvuGmk50EFnZOLSVMGrxbJmSZaQbd15DKNhogByLCI=;
        b=lRv/udanDKwob1XToNNijHu2Zg2KJA0amFJMfhp58VJmrsFZgzcFXTR0uuEZh7Lxej
         Cr7Z8wkWgWqbqbkwDKULJXPuf7fH3WNqeCmk41yn1D7sGct/Au/oLRJxjU+fF/0T5ihb
         7lLeKzkkg9w9++s2h4Of+n742hq9+lhfjhYMhQDXVlgvhAp0iB6Q9BmFWw/2HKGnUuJN
         56hrl3bIEVyLSZKZHRoLgZEqcHFgYandv3b5sD70Wrfjh759cyaJcvuyAfEiK88bV8Rg
         SRB2PsG3ykqoseiNzEU72Y0HHDAyet0GuySXqDpQFUOKJENjQ1uWz+zssdjmYREjSEP+
         a1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768476108; x=1769080908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NvuGmk50EFnZOLSVMGrxbJmSZaQbd15DKNhogByLCI=;
        b=Gmm1SVaFY4SJmMIlX8nzUFsA49PO8kZdy8JVWkH1NpNY+0DSrxx/rJBFa2rauSsdFb
         OL0GVKxrWZ0OwHRGQKWJYCoT7At/uz4xOQeCnA0hD6GMHgZkTAIaBEsCB1fCTPpt6ZPZ
         MgQ24CB8Epzt+dNs/GPRI4cAIp4LMVYlL2zC7vjzzhsoOKtRu1hOIj1XpBaXbXc7Hc7G
         s4u69ijFBS7y8PO/djBfv6xlPWOp4bvM5hPb6NvwzR7n5qj3q93yr2K2GRoOikc8WGoF
         NEGAalQfinbi/VQWfSIU0gtXDmDD9GtAdOGXzfaEj3oYn6GL3pUs/hwpfLueTZftWprm
         bzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU84Q+mcASTx176GUjZYm2mO0hQgNR9vMtx1zMoWngexHJZvK1jiBaxK+zNAJ4Nx6ANNL7hn4JR9ft/Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCJZJjqroTldP7WKDYu/P3xc301D7rmcrdP+31Nim3GT+OiIW9
	zAIyfeasi93y7caSqdg3n9//crft/G7yZpP+TKqjFhPIN3pTNkcTlLkqgFAm1xMz5rfmAu3Aav0
	f033sxj18bWKVjOU7X6ONkz9xr/cKsCA=
X-Gm-Gg: AY/fxX59nOgOVBw8C3v4Lw7N8E8PQWg2cNvgQRnCUgbh07+3vGGhzraVv0ZLNb1K9yp
	BYqbauYpKqqRwhTuITJjsYe60gjNqlQZuDvXlPe+zBjfKS+X5KMj7/k0ff/QcDdQfFlinrZkwFy
	N1vINd6l228IrtJVcMqePj6SJs/xMU8EM/M8+LRKk8Jgnmu240SpZp623jC7WmeMeQmzIIXvkCg
	NkbtKsLwRSrihtAy4/qM9juAAVshBS1Gi3h0LU3YHrn0YfaMvNiJTi0YrxDmCfQJPnpJDf1
X-Received: by 2002:a05:6512:ba9:b0:59b:7888:62ba with SMTP id
 2adb3069b0e04-59ba1741dadmr1750913e87.37.1768476107600; Thu, 15 Jan 2026
 03:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112190054.9828-1-dev.anubhavk@gmail.com> <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
 <CAF6CsJwg8EFtCT+zyKWex=RbWu4TyZanbXnqip=J7=sCZDab5Q@mail.gmail.com>
 <CAHp75VcuO2qNeWLcrDqVfE_aQs=2ZiRB0CDxJpFquXJ6jd5eSg@mail.gmail.com> <CAF6CsJxKZ2FvRWVR0SjyfYR=Nj+4uCMgaJgO4BVBtbMvakXhVQ@mail.gmail.com>
In-Reply-To: <CAF6CsJxKZ2FvRWVR0SjyfYR=Nj+4uCMgaJgO4BVBtbMvakXhVQ@mail.gmail.com>
From: Anubhav Kokane <dev.anubhavk@gmail.com>
Date: Thu, 15 Jan 2026 16:51:35 +0530
X-Gm-Features: AZwV_QhCgKgy8vS-PBhxDm6FPyFnuBhpvI1l1dggEfVmfafZZZLjnbW2r_KGLRs
Message-ID: <CAF6CsJzAzieEumnunohi9VrBZ8D+1rqG0wLO9EW2vLKUZS4keg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to sizeof(*ptr)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, hansg@kernel.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andy,

I appreciate you taking time to explain to me the refactor using kcalloc.

After reviewing the requirements of the task, I realized that this is
beyond my current understanding of the kernel. As this is my first
contribution, I would prefer to build up more foundational knowledge
before tackling a refactor of this scope.

I am stepping back from this patch for now and working on simpler
contributions while I learn more about kernel development. If this issue
is still open after I have gained more experience, I would be interested
in revisiting it.

Thank you for your time and the learning opportunity.

Best regards,
Anubhav

On Tue, Jan 13, 2026 at 9:38=E2=80=AFPM Anubhav Kokane <dev.anubhavk@gmail.=
com> wrote:
>
> On Tue, Jan 13, 2026 at 4:16=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > > I looked into implementing kcalloc() as suggested. But the issue is s=
truct
> > > atomisp_s3a_buf (and the other buffers) are defined as list nodes wit=
h
> > > struct list_head list embedded in them.
> >
> > Yes, and how does it affect the allocation?
> >
> > > The driver relies on adding these
> > > individually to asd->s3a_stats and freeing them individually using kf=
ree()
> > > in multiple cleanup paths (including error path here).
> >
> > Is it the issue? Instead of incrementing by a pointer size, you will
> > increment an address by a structure size, this is how + operator works
> > in C from the beginning (or close enough to that time).
> >
> > > Switching to kcalloc() would mean the s3a_buf is no longer a standalo=
ne
> > > object but a slice of an array. This would lead to invalid or double =
frees
> > > if the existing code tries kfree() on this array element.
> >
> > How? As I showed above you need to carefully move and replace
> > individual handling by a common one. So, instead of allocation per
> > item it will be an allocation per bucket.
> >
> > > Addressing this requires a larger refactor of the buffer management l=
ogic
> > > across the driver,
> >
> > Exactly! And that's what I think is the best way moving forward. You
> > will kill two birds with one stone: fixing the issue at hand and
> > improving the memory allocations in the driver in this area a lot.
> >
> > > would you prefer I stick to the sizeof(*ptr) hardening for
> > > now to fix the checkpatch warning?
> >
> > See above. As now I think this is unneeded churn as the idea would
> > still be the same =E2=80=94 moving towards kcalloc().
>
> Hi Andy,
>
> Thanks for the explanation regarding the pointer arithmetic and bucket
> allocation.
>
> I understand the approach now, will work on refactoring the allocation
> to use kcalloc() and updating the cleanup paths to handle the array
> correctly.
>
> I'll send a v2 once I have verified the changes, though it might take me
> a little time to ensure the cleanup logic is robust.
>
> Regards,
> Anubhav

