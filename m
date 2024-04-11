Return-Path: <linux-media+bounces-9118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BF8A1D35
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 20:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91C981F223AF
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 18:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EC3482E4;
	Thu, 11 Apr 2024 16:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O3IHB9DW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5599482DF
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 16:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712854386; cv=none; b=ttIaz7BFUA+wA3BVyxvJi60O1pqcKQaRRCG2Emm+oWGE+qMwHOLgn6K16cuL9ozzgeaFZ3od6+7WuNUljyr6Htz+2TcuPPv0TglVQmLtWUB7lG1nNcKB1y/Xph0BHSS7TKkyVHCFBVnJRjKoGQIC07xsHRXftC9wJBva2d0OtSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712854386; c=relaxed/simple;
	bh=AeYBArhI/qCfLSv0Zo44jUHHp6STwez+9qRuFMcKxxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GpkTd2upGx/PuOycRdrU1NgwXyGUotTAHM9sD1bjwh8H858d1Zaj17fw0MphZRtTbZ4SeUhHnGBXKNBg/L95tc/LsfY43Wq5xj4t/jOCTX3BtOeKDI8R36au7lNg8HI2wZ3K6P9j/udf4zxxl7SwFrYdBZIHO2HBa0o0wFQ/X3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O3IHB9DW; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dd161eb03afso26363276.0
        for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 09:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712854384; x=1713459184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xk9ow4mQo0ztyiO7KrDlitvaa4igMglZOi5Xwvcpnhc=;
        b=O3IHB9DWxrXhWSwDTdtix6ux958upK2GaXEGyeJxt39OhW0y1/bPs6zrB7M98yNLbc
         gZRY3lQg7ebYJdcH5aQf0RqgYhsSq9Ds2td9wnpVr5hWX2VG/BRSbYICJx6qa0zg6mO6
         Czp4Q89af8xLL0d9QD9dslflL08RefBTVLvyOkaGmwdrPwMJspIKM2Foj2v4qwFSPsxh
         WmBbAICnhQYyYDFmL/BpJxzl5VmLTPC7Pnxn7ZEJN9urb7voA4QxWOC5mpIA2+NdZPuz
         VWFzIJCaBgKGTyvXJ0yU2tO/YKUZmjNC2MhF6jSNnpOfhhbypee+9asKkFFQST9lOwzC
         aHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712854384; x=1713459184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xk9ow4mQo0ztyiO7KrDlitvaa4igMglZOi5Xwvcpnhc=;
        b=YDpDYH7HxnPCKXwJco+Q/USpmpkS6lxzdxXwakeNMjJ76/ejLpqnlyqFOD4uMZs102
         wizpXaSadREuXgo7O1TJ2thdhiX1gg97dLWjoe/dcAme+GTJoZ3h0JYo2jqOdEDjTBp2
         Bikbb6n1wiQppOmz0vLOa8vfvIOYdaCZZFkI8g8f8tqV18bcZrcz4AZXGlHt+tKcrTsF
         LN0AiCvKrC6Y2Dldbheu0dba6ZmnPOJSLw8a3pCWbzMkiWB5Hu52/59tpUW4KxpvSitp
         ts3pwgfI6uav16uLfUCSFZZywn59/LzXHiw522SlR62rd/n7gQDRmCGP21SsdUQ33VQs
         SvDg==
X-Forwarded-Encrypted: i=1; AJvYcCWKj1/Rku9zHZHRQJ1DNIzQyR+HaC5xvHUGjvKSm8TiVo2kHBtsmzjBGVxjtTAZocB2xCqPqJlGCzB8sAOoclYSMyy9Y6+e/+CLNCQ=
X-Gm-Message-State: AOJu0YwjcAKyMJgwBkPSkCMe23xchxp2XueqKRBM4azxvzYUgKWVuLGC
	9tyGkWFRGZbX3TGyx27VZCwQPPjFd+HDlJbuGR3JyMNOSbk0yQuPcmLfrTt1fj5oIX4cb4MMUsW
	dfFRGCCj9vvMB34LZg2bduXd7dPI9gmxs0MYt
X-Google-Smtp-Source: AGHT+IHrAmk4FEak1U24FFhz5I0pjJ4Y1W1GoH1d+YXdH2uAvcc4gxTiyypFZ0hyOkDoXT/aukk4rEfY2anMtoK+l4s=
X-Received: by 2002:a25:86d1:0:b0:dc6:b088:e742 with SMTP id
 y17-20020a2586d1000000b00dc6b088e742mr112053ybm.8.1712854383276; Thu, 11 Apr
 2024 09:53:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com> <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com> <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
 <CABdmKX1OZ9yT3YQA9e7JzKND9wfiL-hnf87Q6v9pwtnAeLHrdA@mail.gmail.com> <da21fe55-2ffb-4c8e-9863-2f27aa18cf5c@vivo.com>
In-Reply-To: <da21fe55-2ffb-4c8e-9863-2f27aa18cf5c@vivo.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 11 Apr 2024 09:52:51 -0700
Message-ID: <CABdmKX0AJjdVBPR=3c7oRyDRQx86GCGheVwkheXi7fOkJaRY8A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
To: Rong Qianfeng <11065417@vivo.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Rong Qianfeng <rongqianfeng@vivo.com>, Jianqun Xu <jay.xu@rock-chips.com>, sumit.semwal@linaro.org, 
	pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch, jason@jlekstrand.net, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 1:21=E2=80=AFAM Rong Qianfeng <11065417@vivo.com> w=
rote:
>
>
> =E5=9C=A8 2024/4/10 0:37, T.J. Mercier =E5=86=99=E9=81=93:
> > [You don't often get email from tjmercier@google.com. Learn why this is=
 important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Tue, Apr 9, 2024 at 12:34=E2=80=AFAM Rong Qianfeng <11065417@vivo.co=
m> wrote:
> >>
> >> =E5=9C=A8 2024/4/8 15:58, Christian K=C3=B6nig =E5=86=99=E9=81=93:
> >>> Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
> >>>> [SNIP]
> >>>>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
> >>>>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf wi=
th
> >>>>>> offset and len.
> >>>>> You have not given an use case for this so it is a bit hard to
> >>>>> review. And from the existing use cases I don't see why this should
> >>>>> be necessary.
> >>>>>
> >>>>> Even worse from the existing backend implementation I don't even se=
e
> >>>>> how drivers should be able to fulfill this semantics.
> >>>>>
> >>>>> Please explain further,
> >>>>> Christian.
> >>>> Here is a practical case:
> >>>> The user space can allocate a large chunk of dma-buf for
> >>>> self-management, used as a shared memory pool.
> >>>> Small dma-buf can be allocated from this shared memory pool and
> >>>> released back to it after use, thus improving the speed of dma-buf
> >>>> allocation and release.
> >>>> Additionally, custom functionalities such as memory statistics and
> >>>> boundary checking can be implemented in the user space.
> >>>> Of course, the above-mentioned functionalities require the
> >>>> implementation of a partial cache sync interface.
> >>> Well that is obvious, but where is the code doing that?
> >>>
> >>> You can't send out code without an actual user of it. That will
> >>> obviously be rejected.
> >>>
> >>> Regards,
> >>> Christian.
> >> In fact, we have already used the user-level dma-buf memory pool in th=
e
> >> camera shooting scenario on the phone.
> >>
> >>   From the test results, The execution time of the photo shooting
> >> algorithm has been reduced from 3.8s to 3s.
> >>
> > For phones, the (out of tree) Android version of the system heap has a
> > page pool connected to a shrinker. That allows you to skip page
> > allocation without fully pinning the memory like you get when
> > allocating a dma-buf that's way larger than necessary. If it's for a
> > camera maybe you need physically contiguous memory, but it's also
> > possible to set that up.
> >
> > https://android.googlesource.com/kernel/common/+/refs/heads/android14-6=
.1/drivers/dma-buf/heaps/system_heap.c#377
> >
> Thank you for the reminder.
>
> The page pool of the system heap can meet the needs of most scenarios,
> but the camera shooting scenario is quite special.
>
> Why the camera shooting scenario needs to have a dma-buf memory pool in
> the user-level=EF=BC=9F
>
> (1) The memory demand is extremely high and time requirements are
> stringent.

Preallocating for this makes sense to me, whether it is individual
buffers or one large one.

> (2) The memory in the page pool(system heap) is easily reclaimed or used
> by other apps.

Yeah, by design I guess. I have seen an implementation where the page
pool is proactively refilled after it has been empty for some time
which would help in scenarios where the pool is often reclaimed and
low/empty. You could add that in a vendor heap.

> (3) High concurrent allocation and release (with deferred-free) lead to
> high memory usage peaks.

Hopefully this is not every frame? I saw enough complaints about the
deferred free of pool pages that it hasn't been carried forward since
Android 13, so this should be less of a problem on recent kernels.

> Additionally, after the camera exits, the shared memory pool can be
> released, with minimal impact.

Why do you care about the difference here? In one case it's when the
buffer refcount goes to 0 and memory is freed immediately, and in the
other it's the next time reclaim runs the shrinker.


I don't want to add UAPI for DMA_BUF_IOCTL_SYNC_PARTIAL to Android
without it being in the upstream kernel. I don't think we can get that
without an in-kernel user of dma_buf_begin_cpu_access_partial first,
even though your use case wouldn't rely on that in-kernel usage. :\ So
if you want to add this to phones for your camera app, then I think
your best option is to add a vendor driver which implements this IOCTL
and calls the dma_buf_begin_cpu_access_partial functions which are
already exported.

Best,
T.J.

