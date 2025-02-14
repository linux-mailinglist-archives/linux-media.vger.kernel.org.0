Return-Path: <linux-media+bounces-26159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62766A35E7C
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 14:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ACA1171A45
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 13:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2667B23A992;
	Fri, 14 Feb 2025 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8be454q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B8A2641FC
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739538448; cv=none; b=rNm9DWz2T+saBuN50Is1kbtHseD/xG5cGHu+4pjSV8IAJBEZQ6rUNh0NgawQm346qeg+lDHO0L5JUu2fvEODNnYXBlNNiwe1Keyur/mPVXGax/TEkbal2XEjvPHxtDmhlyJlGrS18q4we0AqopYmGY/omfMxa/6A3LNtePAtfnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739538448; c=relaxed/simple;
	bh=NXRz6jedmFY/bHyVZo7hYUPjarW9g7mwWvxKzc/RriM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQhTvvtaQuMdYdQbGugEn5LOJUs9Vb4gW58X3qapi7f8AtrwwsQliU9GcRi/EDltf1Vzaf2Tje88TtWxfXmb9lz35U76eyIGF8ds5mhdep8RoOw7lRMa7qkFXlYlgoxezMTQFvjKgnwnnODcgYak+liJu/2bHpWMU6RZsHVkA18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8be454q; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c07351d2feso300643185a.3
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739538445; x=1740143245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNnj7+IGvRtmWRtdYlqf7RvYRLfXlCqJXD/wP+Mfkkw=;
        b=g8be454qgUJpVQpGkA+R/3vLpIflxmNNWV3jSbmlcqYObvMEkTFnrY6bFY3ACVUDqL
         pYXWKvEjk4Lbk0/DcXg6faALUx4/zdrozRJDc3s6nzfPf0TBFCp2SpePME0nrR4L3QJj
         tLM22UiDYURTjmm1BevBQ9f9SHoLHzHwMlSCq4OdOkQFH0YWWSa+7NPzX/YLoASFCKXx
         aaXN499wJ23RYkLzwoMvXsQHmE7zYx5r6CJ+3fEMDC1xJiGCr+5Ku7ZDHbSuYCB35koR
         ma0la+AxKfbLTmgPtR931Tcwq/O590L9Dg311RHCzKEYUv5j86Vk1wuWlE4MX0mhXb3V
         Wt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739538445; x=1740143245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNnj7+IGvRtmWRtdYlqf7RvYRLfXlCqJXD/wP+Mfkkw=;
        b=SSC/8XM9u0M+PTG9WekSGVqV5MwZbEb2r5jXr+mq+d4Rlp/eXHnQ0mgUWDpFUg3CIV
         di3k3lvoJdrc0KvK/45K3FqHbVhR6MesUcpxDOryqjRC9zdp0PLkSuIPn/Px7XFHTb8N
         ofS0PmMY4HqoeobGDLXu+yFZ2hCWpDT6UaPe6hoiJ8TmESL0u+l3duJwhGyBm4L4BNHY
         +NxY6t4A/u68z+00JLRbm99eC8JufkH+hU+SWq+R7OpOF+lg/RsmDuJaS181pu42xZF/
         3g/sNaH4q/5zqsCgHU/SxxSUE7LZnREH34digdz+uEdXhO/DHu5Xt7j/PZkCyEObzZCl
         MStA==
X-Forwarded-Encrypted: i=1; AJvYcCUUNfekFPTsWeuvsWkE6YxquVpF5yjKTFmRsSTPSR4u3hB+DUCuBtqUTwq5yeJB7xXS65wtawlEB/PJog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHJJvF4w24l7nN/8MdA11EHQq6E2Mivz+/qsVEx8bq9dKZaPd
	SSL1joEfUkU6Z7oJ6XW8OaqhfyhsaLRa0vsi0xDQxZnMQkFdLP36lgdN5fwYd16W2Yc4o4iuaT6
	QE5ZHan0KtmNFISYzjETJ3FBWMDhnAXFDpnvlkA==
X-Gm-Gg: ASbGncsns9WWgb5O/O0izRg2LaUy3TXOvrh+CQzUY3+cbxo2ADwcTLG5qntV0R2lWBw
	H+CvSg/IExLzmAvkEvibOWPah814LqTglnW1oJJ+tQiL5g6a2itjZ0dSKb20GtzJyvtAZf2N4vu
	U=
X-Google-Smtp-Source: AGHT+IE3ByM7DSgjLBAaQUp9tqk81OqGvrRN0VTqQ2J9pH/WZcBHm5+t6oEWmrDoJ+W5s9rNaAD7/fQhaTsa/R2yq4c=
X-Received: by 2002:a05:6214:469c:b0:6e6:6225:a907 with SMTP id
 6a1803df08f44-6e66225a975mr79026126d6.31.1739538445485; Fri, 14 Feb 2025
 05:07:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com> <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
In-Reply-To: <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 14 Feb 2025 18:37:14 +0530
X-Gm-Features: AWEUYZnJYqssuMMtIO5Ohg5UzNEocwYL0hODNzFGJUyN-biak0SnkML6hDkQjD8
Message-ID: <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Jens Wiklander <jens.wiklander@linaro.org>, Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 14 Feb 2025 at 15:37, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> Hi,
>
> On Thu, Feb 13, 2025 at 6:39=E2=80=AFPM Daniel Stone <daniel@fooishbar.or=
g> wrote:
> >
> > Hi,
> >
> > On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> > > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishba=
r.org> wrote:
> > > > But just because TEE is one good backend implementation, doesn't me=
an
> > > > it should be the userspace ABI. Why should userspace care that TEE =
has
> > > > mediated the allocation instead of it being a predefined range with=
in
> > > > DT?
> > >
> > > The TEE may very well use a predefined range that part is abstracted
> > > with the interface.
> >
> > Of course. But you can also (and this has been shipped on real
> > devices) handle this without any per-allocation TEE needs by simply
> > allocating from a memory range which is predefined within DT.
> >
> > From the userspace point of view, why should there be one ABI to
> > allocate memory from a predefined range which is delivered by DT to
> > the kernel, and one ABI to allocate memory from a predefined range
> > which is mediated by TEE?
>
> We need some way to specify the protection profile (or use case as
> I've called it in the ABI) required for the buffer. Whether it's
> defined in DT seems irrelevant.
>
> >
> > > >  What advantage
> > > > does userspace get from having to have a different codepath to get =
a
> > > > different handle to memory? What about x86?
> > > >
> > > > I think this proposal is looking at it from the wrong direction.
> > > > Instead of working upwards from the implementation to userspace, st=
art
> > > > with userspace and work downwards. The interesting property to focu=
s
> > > > on is allocating memory, not that EL1 is involved behind the scenes=
.
> > >
> > > From what I've gathered from earlier discussions, it wasn't much of a
> > > problem for userspace to handle this. If the kernel were to provide i=
t
> > > via a different ABI, how would it be easier to implement in the
> > > kernel? I think we need an example to understand your suggestion.
> >
> > It is a problem for userspace, because we need to expose acceptable
> > parameters for allocation through the entire stack. If you look at the
> > dmabuf documentation in the kernel for how buffers should be allocated
> > and exchanged, you can see the negotiation flow for modifiers. This
> > permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.
>
> What dma-buf properties are you referring to?
> dma_heap_ioctl_allocate() accepts a few flags for the resulting file
> descriptor and no flags for the heap itself.
>
> >
> > Standardising on heaps allows us to add those in a similar way.
>
> How would you solve this with heaps? Would you use one heap for each
> protection profile (use case), add heap_flags, or do a bit of both?

Christian gave an historical background here [1] as to why that hasn't
worked in the past with DMA heaps given the scalability issues.

[1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532f71@=
gmail.com/

>
> > If we
> > have to add different allocation mechanisms, then the complexity
> > increases, permeating not only into all the different userspace APIs,
> > but also into the drivers which need to support every different
> > allocation mechanism even if they have no opinion on it - e.g. Mali
> > doesn't care in any way whether the allocation comes from a heap or
> > TEE or ACPI or whatever, it cares only that the memory is protected.
> >
> > Does that help?
>
> I think you're missing the stage where an unprotected buffer is
> received and decrypted into a protected buffer. If you use the TEE for
> decryption or to configure the involved devices for the use case, it
> makes sense to let the TEE allocate the buffers, too. A TEE doesn't
> have to be an OS in the secure world, it can be an abstraction to
> support the use case depending on the design. So the restricted buffer
> is already allocated before we reach Mali in your example.
>
> Allocating restricted buffers from the TEE subsystem saves us from
> maintaining proxy dma-buf heaps.

+1

-Sumit

