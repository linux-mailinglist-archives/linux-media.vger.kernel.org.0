Return-Path: <linux-media+bounces-9048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03B89FB12
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 17:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916CD1C2173B
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 15:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A3516DEAF;
	Wed, 10 Apr 2024 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QrriqILR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88816D30E
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712761650; cv=none; b=FRdKvPN5x5CkSLvLCXpsN3InJwohauYo81XuIl314rsLCm8N87t+ppJJA/cmA3/F3O5IEU8hShj2N3cxuSopHbWe40xZnmFvYqhikrQSb0DFV85SuVTTNVB8WpmnChfzR+Ic4nJP4rF8WrBxqj5PUZctIj/spsNpjdjr0o0hzSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712761650; c=relaxed/simple;
	bh=efOz0mghq+OtWB/ztjhh0s2fK209rUGcnyU0KFtsXHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwTTV6VUE1pov7G1XzfEFyAy80NHCDhaH2tStpMNg+X3IN6cDuxcLzWgPHg4gXL+v08ApGIisSuuvICiGx2LslZa/1LgtN8xRSCPZxRI+eSkqB2XjmPnzDZ6uUMFbFizO6FvOsxhe6f3DG0Z3I/3LBVeQ1IKGZV/JwHj0Zy8jnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QrriqILR; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61500da846fso55273237b3.1
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712761647; x=1713366447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLKjsUom385xmd5NMGWlteZq1y2bkkhohjUJrbv4Shg=;
        b=QrriqILRv/t/1NBZKMrb/NwbcjhQZNw48jSp62Xm6ufvKsbVgD0rEkC3Nfsgld4a7m
         j9G3M4LKvkAygoMZSH7T+E8m5LFM9CftY1N/eYnj7ud/MG1xrIx6dqZCoD186Uj1iSbs
         4lC+H2eZyjgh0PVv5Og7U0iiCfNAInB2JAC6+33ONAG+gVJ8sK+Sek9O643jmQlfgudE
         rbbKQw8jZ1LaFHFKB2GRvlQamrOKzfiT12b8TqLOQb1QzLohvdA/7QUW5vQH3Kpius2n
         ScU2PceLVuvDT/GD/jUh9AQqNUH25M8h7pq8ODws5y8vrPmjPpVE1grdnBMy6il702ah
         QrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712761647; x=1713366447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLKjsUom385xmd5NMGWlteZq1y2bkkhohjUJrbv4Shg=;
        b=fdEZFMERVAyZ6yX8A37ltKQcP8Nzpvs87SITFYMKdeISvI8e8EaddPUejUEhp/3/ds
         a5qOcghuVl8K7Zwl3fdJRQhEWUcrksbSFxQsCOl9/EkWkecphmDMVPCZmir+eFUaaujn
         R/ro8VvNgKIOlkK5szQthuMGXc1EMKyAJUoyYTKqrsE5ieVQwj+rurwow/ocibMZIA77
         l3tXXbWyM1oQXRDBwCWKxWWeoRbORHbBkFZW3kahAbYuvDyqdF8JVnMtH2jE6+11o5nc
         4SIu/lvNPbfe/DBFFWxh6jAtMkwRELs4WGfn+L9Yb2Qo5l87aNnSDmHQYFoBajcIZLaX
         0c4A==
X-Forwarded-Encrypted: i=1; AJvYcCWorbfvsCk9XTMfsOFYImSaSY2FHSSsJtyKDsfS6cbeDjKSjgOkfN8ybQV1VY0COdRN4ZCDKW1i9jCa3suUGr+P/YK6Vy8l8uMTfpI=
X-Gm-Message-State: AOJu0YzygZXdZeOd3NEX5oQ/WM48oNqTnZuGwi0PCyQe18bMmns/cahU
	Uq93u+xm2FvteAbG2nIQcschL4W7SzYiEJzz/Y3Hr8jd5fNq47gzzLNOgb1/2/xAEirtZU6ut20
	TkGF6YpcHN+Al6QBVa1cp0zDf3YkmDr5gbkEb
X-Google-Smtp-Source: AGHT+IF7TCK2LqrJgp8hV7cq9+Ry/b6lOirZ5fldgud6E7mUjNo54gC130kLZJeYihDRzjoyYJ8Lubhyj/db/BZNZCo=
X-Received: by 2002:a05:6902:1b83:b0:dd0:c12:411b with SMTP id
 ei3-20020a0569021b8300b00dd00c12411bmr3692287ybb.8.1712761647378; Wed, 10 Apr
 2024 08:07:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com> <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com> <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
 <CABdmKX1OZ9yT3YQA9e7JzKND9wfiL-hnf87Q6v9pwtnAeLHrdA@mail.gmail.com> <0df41277-ded5-4a42-9df5-864d2b6646f5@amd.com>
In-Reply-To: <0df41277-ded5-4a42-9df5-864d2b6646f5@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 10 Apr 2024 08:07:15 -0700
Message-ID: <CABdmKX03Of7OE_9PfAy5DWcCwwvQvJGXDjzAE8c4WRrz_0Z_eg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Rong Qianfeng <11065417@vivo.com>, Rong Qianfeng <rongqianfeng@vivo.com>, 
	Jianqun Xu <jay.xu@rock-chips.com>, sumit.semwal@linaro.org, 
	pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch, jason@jlekstrand.net, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 7:22=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 09.04.24 um 18:37 schrieb T.J. Mercier:
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
> > page pool connected to a shrinker.
>
> Well, it should be obvious but I'm going to repeat it here: Submitting
> kernel patches for our of tree code is a rather *extreme* no-go.
>
Sorry I think my comment led to some confusion. I wasn't suggesting
you should take the patch; it's clearly incomplete. I was pointing out
another option to Rong. It appears Rong is creating a single oversized
dma-buf, and subdividing it in userspace to avoid multiple allocations
for multiple buffers. That would lead to a need for a partial sync of
the buffer from userspace. Instead of that, using a heap with a page
pool gets you kind of the same thing with a lot less headache in
userspace, and no need for partial sync. So I wanted to share that
option, and that can go in just Android if necessary without this
patch.

> That in kernel code *must* have an in kernel user is a number one rule.
>
> When somebody violates this rule he pretty much disqualifying himself as
> reliable source of patches since maintainers then have to assume that
> this person tries to submit code which doesn't have a justification to
> be upstream.
>
> So while this actually looks useful from the technical side as long as
> nobody does an implementation based on an upstream driver I absolutely
> have to reject it from the organizational side.
>
> Regards,
> Christian.
>
> >   That allows you to skip page
> > allocation without fully pinning the memory like you get when
> > allocating a dma-buf that's way larger than necessary. If it's for a
> > camera maybe you need physically contiguous memory, but it's also
> > possible to set that up.
> >
> > https://android.googlesource.com/kernel/common/+/refs/heads/android14-6=
.1/drivers/dma-buf/heaps/system_heap.c#377
> >
> >
> >> To be honest, I didn't understand your concern "...how drivers should =
be
> >> able to fulfill this semantics." Can you please help explain it in mor=
e
> >> detail?
> >>
> >> Thanks,
> >>
> >> Rong Qianfeng.
> >>
> >>>> Thanks
> >>>> Rong Qianfeng.
>

