Return-Path: <linux-media+bounces-3891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80863831DF3
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 17:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDE351F21383
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 16:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49492C6B0;
	Thu, 18 Jan 2024 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qdf5Pmc2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E4D2C6AA
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705597051; cv=none; b=UGVroc31BznRe3K8YHJMqg9L1c6pTutk7PDzt7fLbKNibxEMxgcYarKgfj0DTaZPJ+LjtpB91E7zQMy1u3xmTcvBg7z5du1II8sIu9A4MxtmZVmcRgxW3sxZrrW8IWqmZuiAWmejoZTO444FUHd5d0op4+xnJqzJghOlc4xqRho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705597051; c=relaxed/simple;
	bh=cmZn+BROv+sMREBkau20U4T/TQEgObsLAqinfuULAyg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=rjjtm4w+eLPRfoc2u9qFKAv5nXuRHg1drdeI8qBOdLmex+M3Jf/X+4qROQfloBNc9iDrTXNNsvkwRQOQiDj/N352It+UoMiZh5FYij2ET8k7dIzMW25q0uoOtKhD09ooU9iB4Qr/JSjRTN4NbiuNeMrGbCSu59rz/cZYsZUFRMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qdf5Pmc2; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc25099b084so1072238276.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 08:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705597049; x=1706201849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmZn+BROv+sMREBkau20U4T/TQEgObsLAqinfuULAyg=;
        b=Qdf5Pmc2E9Lqn0tozQlEd+MJF6I8HkxjgbELP5HQzYJyByJIDwRerqRpDZKSjbi1Xm
         7NRpa7rRO87l/DR9gFXw7S/V+yhmiaCTUzlIzZC7h5rANmLgDIepigio3gUWYvVj/j/g
         uyr1KO5cMnMINt8PaB0/m/mneKHYI/YkEgKox+b6CeEz8h6KWtHz2QFAeWy6vKIQoyFg
         dNnyC9KEpUJ2N25XRyRTIifpgIZbD7mhLGdbrE5e88CGz2WABdg3hLi2THDiPSDbfL8q
         cgLdBqD/1kuMSEWyW60uR15aDeQHswAhqejXaOu4FcKYnhfumKNYs+hy8iXlHhcJd78Z
         HKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705597049; x=1706201849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmZn+BROv+sMREBkau20U4T/TQEgObsLAqinfuULAyg=;
        b=iU9w1jeh1Cj5dmkINZE+vjBy4n0lMATac195nLX/UpdtNTW764qu4601j+Z3HEc61E
         BW/gtVkl2PrAFtPKRkZlv2bhWkna2BUE0BehU60BNBXHtu4aZfF8hyqx3MS6nmg0iNtX
         q04DOLsxcUBBA4CuRcdJ6TpZ2YpKSN4LB18Z5jJhnj9fsoAO9UfQeYU7jP/FD1x3003E
         /laV9a+foKwp5V5lHjX7AGErnj83dHxrSkFo/rahSRCb7ldv15CUuXidWXRhmDEXMry8
         6sIu3teHEXavoYPg3Wuv+LUN1Bccn2FMGHJJcS/wfWa8lznXp6k629vLZRDdj6ZwzM+M
         AL7A==
X-Gm-Message-State: AOJu0Yx8TVWZPAI3obLkHT02isP6m5eBKkbeIdwy2oeNTxEsdNhObZHL
	+Q9A/vb7vZ9TlC/cbHCcYNpAsFoUZeK7/grIb0fVwkew1OMb4JMhXKsvwx6w2sKhIH+4Lr8bkUy
	IHnlg3p7zm7lusJFiJRlCvUU/4bpsK75DNg55
X-Google-Smtp-Source: AGHT+IGdm+3tzpwneR3Std891dkepC+HcM/F/QU4NLlUSQFVDjEWUf46RxO8DdQGNQYUp4EkO2YYs2e+Vx5E/WIMRrc=
X-Received: by 2002:a25:748c:0:b0:dbd:7743:77cb with SMTP id
 p134-20020a25748c000000b00dbd774377cbmr856586ybc.128.1705597048380; Thu, 18
 Jan 2024 08:57:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117181141.286383-1-tjmercier@google.com> <20a68f86-27f0-48f4-a066-7dcf0092858e@amd.com>
 <Zak6iW8lktml7f2H@phenom.ffwll.local>
In-Reply-To: <Zak6iW8lktml7f2H@phenom.ffwll.local>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 18 Jan 2024 08:57:16 -0800
Message-ID: <CABdmKX10zz6bk4VVDgsosJbA8_7WOxuCnkyYFiL1FPwtZ-C+WQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Don't track CMA dma-buf pages under RssFile
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Sandeep Patil <sspatil@android.com>, 
	Laura Abbott <labbott@redhat.com>, android-mm@google.com, minchan@google.com, 
	John Stultz <john.stultz@linaro.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: daniel@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 6:49=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Thu, Jan 18, 2024 at 11:02:22AM +0100, Christian K=C3=B6nig wrote:
> > Am 17.01.24 um 19:11 schrieb T.J. Mercier:
> > > DMA buffers allocated from the CMA dma-buf heap get counted under
> > > RssFile for processes that map them and trigger page faults. In
> > > addition to the incorrect accounting reported to userspace, reclaim
> > > behavior was influenced by the MM_FILEPAGES counter until linux 6.8, =
but
> > > this memory is not reclaimable. [1] Change the CMA dma-buf heap to se=
t
> > > VM_PFNMAP on the VMA so MM does not poke at the memory managed by thi=
s
> > > dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.
> > >
> > > The system dma-buf heap does not suffer from this issue since
> > > remap_pfn_range is used during the mmap of the buffer, which also set=
s
> > > VM_PFNMAP on the VMA.
> >
> > Mhm, not an issue with this patch but Daniel wanted to add a check for
> > VM_PFNMAP to dma_buf_mmap() which would have noted this earlier.
> >
> > I don't fully remember the discussion but for some reason that was neve=
r
> > committed. We should probably try that again.
>
> Iirc the issue is that dma_mmap is not guaranteed to give you a VM_SPECIA=
L
> mapping, at least on absolutely all architectures. That's why I defacto
> dropped that idea, but it would indeed be really great if we could
> resurrect it.

I actually had it in my head that it was a BUG_ON check for VM_PFNMAP
in dma_buf_mmap and it was merged, so I was surprised to discover that
it wasn't set for these CMA buffers.

> Maybe for x86 only? Or x86+armv8, I'm honestly not sure anymore which
> exact cases ended up with a VM_NORMAL mapping ... Would need a pile of
> digging.

Looking back at the patch, the CI email at the end of the thread lists
a bunch of now-broken links to DMESG-WARN test failures I assume
pointed at a large chunk of them.

https://lore.kernel.org/all/166919750173.15575.2864736980735346730@emeril.f=
reedesktop.org/

> >
> > > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/mm/vmscan.c?id=3Dfb46e22a9e3863e08aef8815df9f17d0f4b9aede
> > >
> > > Fixes: b61614ec318a ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
> > > Signed-off-by: T.J. Mercier<tjmercier@google.com>
> >
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thanks Christian.

