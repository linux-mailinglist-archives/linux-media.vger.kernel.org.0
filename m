Return-Path: <linux-media+bounces-3664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D125E82C8AA
	for <lists+linux-media@lfdr.de>; Sat, 13 Jan 2024 02:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 471FBB24359
	for <lists+linux-media@lfdr.de>; Sat, 13 Jan 2024 01:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB7F14F6E;
	Sat, 13 Jan 2024 01:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nVAzNk+w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759BB81D
	for <linux-media@vger.kernel.org>; Sat, 13 Jan 2024 01:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e4afe9ea7so8605e9.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 17:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705109001; x=1705713801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM/RZNODygz3tcx3iBW5QQla7ILOiDn5Z5q0jGfqFBA=;
        b=nVAzNk+wJzifbTMHg5gQsgTogGzSXLeZnbAYinxcCXcVaZHi+xFvNTKex0rVAUX60S
         NG67klpZxv6qClviL3HGsR/LU1AmiKieCCQ4fgCYowhjjZ/gkwRn7zRaNUDsEMkbd0Nx
         KTjY9ssbnSWjOCVIgA/asTbCaeB6ezw8F8gl7NEuaw01NIg19M4FV60yRstOhL/+rgBx
         /oOyLA5SWOYveYkiTjB8jrsKYFoAGaT5meoNIC9uz8RIxZZgURyajDONq/ZI//UJNdP/
         t4rn7m5qrl5XFXEhLiCO/AXpzUf/llGQMuj2S6KuyxmM5m7Mfw2Vfe8fz+kxT4mC7tCU
         xWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705109001; x=1705713801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mM/RZNODygz3tcx3iBW5QQla7ILOiDn5Z5q0jGfqFBA=;
        b=DyMKp6l9BenZ8gSQ+znHVotfUvdbxXxLoeVgUsr/fu8NsXo0lf3nwGFHlf5WfRxrtL
         JQnCwTic/EP6/YpEJGOIT7ESQzdg/LXXEzO2ofage0Kwc7kfzzRZ8Tji1Z2QCRg/90d9
         VE3Gawwvj2Xuq1/3eayKyk3ye7t7bxOdXjdbj7COd1c+tLrqGDq8+HjtWj3vwdLbc4AA
         ZnH6sDzblyKeH73jY8aHK00A0V1AyDNCcL1jw//RKfEtrNXrNbWjpCV9xT16UgmVqcZb
         jJpCk/k81HTXQIMkpBYEawuC5zj5cr5hSkiMixmmnLdgwjdATzp3ChwSNps7R1prgqrN
         YjOA==
X-Gm-Message-State: AOJu0YzMn9lsFoEqxcmVdDCCGKTzbeJtvPV4Nxz3pANgVxwxxQ8xFVWt
	mKFtU8mCvF3AWFJtbozC/SvgvsAE1403pCsJ1w/9+jhv+HY=
X-Google-Smtp-Source: AGHT+IG/+qOlk4ymLnRUPXBnV0zsSF5F2DLjgpluok3fjIXdmyv0TwrSAfnNPRC7q4VbUcI/uz5Z7ZFuE7x5bsdIM1U=
X-Received: by 2002:a1c:721a:0:b0:40e:4990:d573 with SMTP id
 n26-20020a1c721a000000b0040e4990d573mr396698wmc.4.1705109000593; Fri, 12 Jan
 2024 17:23:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com> <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
 <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
 <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com> <CA+ddPcP9bgApNw_Nu7bxcV-oK_s3Bq1i5qun+vNSuRUO9tPEkA@mail.gmail.com>
In-Reply-To: <CA+ddPcP9bgApNw_Nu7bxcV-oK_s3Bq1i5qun+vNSuRUO9tPEkA@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 12 Jan 2024 17:23:07 -0800
Message-ID: <CANDhNCrGxhHJLA2ct-iqemLAsQRt3C8m5=xAD3_dDdKH6Njrdg@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap ops
To: Jeffrey Kardatzke <jkardatzke@google.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, 
	Joakim Bech <joakim.bech@linaro.org>, Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, 
	Pekka Paalanen <ppaalanen@gmail.com>, jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	youlin.pei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 4:13=E2=80=AFPM Jeffrey Kardatzke <jkardatzke@googl=
e.com> wrote:
> On Fri, Jan 12, 2024 at 3:51=E2=80=AFPM John Stultz <jstultz@google.com> =
wrote:
> >
> > On Fri, Jan 12, 2024 at 3:27=E2=80=AFPM Jeffrey Kardatzke <jkardatzke@g=
oogle.com> wrote:
> > > On Fri, Jan 12, 2024 at 2:52=E2=80=AFPM John Stultz <jstultz@google.c=
om> wrote:
> > > > I know part of this effort here is to start to centralize all these
> > > > vendor specific restricted buffer implementations, which I think is
> > > > great, but I just worry that in doing it in the dmabuf heap interfa=
ce,
> > > > it is a bit too user-facing. The likelihood of encoding a particula=
r
> > > > semantic to the singular "restricted_heap" name seems high.
> > >
> > > In patch #5 it has the actual driver implementation for the MTK heap
> > > that includes the heap name of "restricted_mtk_cm", so there shouldn'=
t
> > > be a heap named "restricted_heap" that's actually getting exposed. Th=
e
> >
> > Ah, I appreciate that clarification! Indeed, you're right the name is
> > passed through. Apologies for missing that detail.
> >
> > > restricted_heap code is a framework, and not a driver itself.  Unless
> > > I'm missing something in this patchset...but that's the way it's
> > > *supposed* to be.
> >
> > So I guess I'm not sure I understand the benefit of the extra
> > indirection. What then does the restricted_heap.c logic itself
> > provide?
> > The dmabuf heaps framework already provides a way to add heap implement=
ations.
>
> So in the v1 patchset, it was done with just a Mediatek specific heap
> with no framework or abstractions for another vendor to build on top
> of. The feedback was to make this more generic since Mediatek won't be
> the only vendor who wants a restricted heap..which is how it ended up
> here. There was more code in the framework before relating to TEE
> calls, but then that was moved to the vendor specific code since not
> all restricted heaps are allocated through a TEE.

Yeah. I apologize, as I know how frustrating the contradictory
feedback can be. I don't mean to demotivate. :(

I think folks would very much like to see consolidation around the
various implementations, and I agree!
I just worry that creating the common framework for this concept in a
dmabuf heaps driver is maybe too peripheral/close to userland.

> This was also desirable for the V4L2 pieces since there's going to be
> a V4L2 flag set when using restricted dma_bufs (and it wants to
> validate that)....so in order to keep that more generic, there should
> be a higher level concept of restricted dma_bufs that isn't specific
> to a single vendor.  One other thing that would ideally come out of
> this is a cleaner way to check that a dma_buf is restricted or not.

Yeah. If there is a clear meaning to "restricted" here, I think having
a query method on the dmabuf is reasonable.
My only fret is if the meaning is too vague and userland starts
depending on it meaning what it meant for vendor1, but doesn't mean
for vendor2.

So we need some clarity in what "restricted" really means.  For
instance, it being not cpu mappable vs other potential variations like
being cpu mappable, but not cpu accessible.  Or not cpu mappable, but
only mappable between a set of 3 devices (Which 3 devices?! How can we
tell?).

And if there is variation, maybe we need to enumerate the types of
"restricted" buffers so we can be specific when it's queried.

That's where maybe having the framework for this be more central or
closer to the kernel mm code and not just a sub-type of a dmabuf heap
driver might be better?

> The current V4L2 patchset just attaches the dma_buf and then checks if
> the page table is empty....and if so, it's restricted. But now I see
> there's other feedback indicating attaching a restricted dma_buf
> shouldn't even be allowed, so we'll need another strategy for
> detecting them. Ideally there is some function/macro like
> is_dma_buf_restricted(struct dma_buf*) that can indicate that...but we
> haven't come up with a good way to do that yet which doesn't involve
> adding another field to dma_buf or to dma_buf_ops (and if such a thing
> would be fine, then OK...but I had assumed we would get pushback on
> modifying either of those structs).

If there's a need and the best place to put something is in the
dma_buf or dma_buf_ops, that's where it should go.  Folks may
reasonably disagree if it's the best place (there may be yet better
spots for the state to sit in the abstractions), but for stuff going
upstream, there's no reason to try to hack around things or smuggle
state just to avoid changing core structures. Especially if core
structures are internal only and have no ABI implications.

Sima's suggestion that attachments should fail if the device cannot
properly map the restricted buffer makes sense to me. Though I don't
quite see why all attachments should fail, and I don't really like the
idea of a private api, but I need to look more at the suggested virtio
example (but even they said that wasn't their preferred route).

My sense of attach was only that it was supposed to connect a device's
interest in the buffer, allowing lazy allocation to satisfy various
device constraints before first mapping - a design feature that I
don't think anyone ever implemented.  So my sense was it didn't have
much meaning otherwise (but was a requirement to call before map). But
that may have evolved since the early days.

And I'm sure the method to figure out if the attachment can work with
the device may be complicated/difficult, so it sounding reasonable can
be far from it being reasonable to implement.

And again, I don't mean to frustrate or demotivate here. I'm really
excited to see this effort being pushed upstream!

thanks
-john

