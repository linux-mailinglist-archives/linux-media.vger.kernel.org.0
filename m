Return-Path: <linux-media+bounces-26127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DACD5A34C26
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 18:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8921B1887CD3
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 17:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAD92222D8;
	Thu, 13 Feb 2025 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="cXbg4Xsg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1374221703
	for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739468389; cv=none; b=I1jQikt4PQDXhQhtPjs6M54jv9Yi85jRqchiIIVjCiwS/Y/agQbOPNhem6V5J7RxXDLp27JPRvmHONw/oEeRBvl6EkLMTP3rkFU/cP663stAKdundf8MJ9RQeSH8blEKrYj79k/8lVH1RqSdjLB38NejbbHozU7Rl0yPHfkfUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739468389; c=relaxed/simple;
	bh=6ZpVr1zXfeW4p4aAqTJktWD02PA9u9B2cOeDG/0jTAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4XEHNvWK7Rg2glspI8+V/6gpp7kv6UsTeXbHatPejDFkDAzsRebdSGavEGkGN82YFWLp5wJp2b3Dsl1OEofh84ITtx245bu90Cmtk896knuKFIky5qRCDasyhwdYEUzYGHhC9Lms2KKX/W+t/jlqm/X/4eSZaFbIajL64NEnmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=cXbg4Xsg; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4718fa2e66eso9338571cf.0
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 09:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1739468385; x=1740073185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whhYbCC8Ye/92zXnbL6IJWDNwsx8j4boIogQLPts9MI=;
        b=cXbg4XsgzmZTXsu7KJQYatRLkjyHCTikDhbFGnU/GtiLOp0SJ1Q0a2uj1CZwmYhzlv
         pFG7b5yz9tlOyM7H1Vz3kRjnj5x5D+gNqVOQfLhzo7cguPOqeiE4h0r/ICI+0PXjIqPw
         lnug7O0t1SxrBTg3kE3hX8EHfw8W/4m1IxfCGnNDR48KlbgYuPdOL/Hp+UciDsPj4BOa
         Q31247c1kORCInSC0Dud/C9GIfNVXMJdZqBsHvZm6aTr8tEGb4nXyp2DBAVw2zSXZ/sL
         Qe4Fg0TuaKODvbRpeQtgWZIRDBbwlZN4QQ5HuIMI05kr37DEvafZhDAZvSAlVV4v9UNg
         5qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739468385; x=1740073185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whhYbCC8Ye/92zXnbL6IJWDNwsx8j4boIogQLPts9MI=;
        b=VgiDEd0QebQJEp+4VkK9exhJkq00dv1/gk33OR7k7rTiNEKF+j4Z7ifzVAAe5EPUrh
         7xbZ2wqduHclf+8JxKKvEkXuRn3wbjXaNE02UbVUPZrp+ZmdCeiQS04SGntWDYYuTPuF
         fPvA3vv8Vf5PHsxI8WEUbpwKkHlrH03emMDjvmgyMgam6h6Dyk9kU3aVttMUU4N1nXcB
         yjY6KqAmkDaEQqp5E0vqDWsmbZM+VZA3HiLIxmOWOiMFSCQoflztFdIc8Tg8MJ8+la1q
         vqcYgbtV6FN8NudH5qGGUcvYo+IezLAwIJqggv5POLagVTWUI3p4r+N1vvW74VaAccbg
         2wxw==
X-Forwarded-Encrypted: i=1; AJvYcCU1nVK3u5rToFEDTs32ux8sxIa5MF4OAwVM4eVMhu+buNu8Wfo4hnCGLlES60PpeQ65rUw10YoPv+Uh9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPk8hzNFJJ8MPsZOxK1uQayADjmeIpIDKFX2zU/XqX5t0gwHA8
	Rk2lJFzhf+50EGyLfhBTytrM85gGJx9crfzfIQ9Lq/D0+goAOUrgEShUVyXN/M7QtF6H7/uksk9
	JtXzQjU0Xf6bZpNKHtNVKorKagVGloWMscsfBpw==
X-Gm-Gg: ASbGnctjlCsVkRaeJFUgw9MZAxhJ3APjVnUd0wM/zgVAzZ81JGYEL5+LvlY0IJtftJI
	8AzQ5y5qFo0cgDKkRBdWE2o8BI+NPP6rJNMi4+tEMG6HFo7dvlEYvzs077MqR1N9AG9R44+w=
X-Google-Smtp-Source: AGHT+IGE9qUAgteAk42h8NRzlwUiEVQLmyQkmiwetNHn7TWQ4JRreBJYCr8hrD0N2jIsyDYrKQ939hR7SXW12F654hE=
X-Received: by 2002:a05:622a:418e:b0:471:bd5e:d5dd with SMTP id
 d75a77b69052e-471bd5ed804mr90077321cf.16.1739468385599; Thu, 13 Feb 2025
 09:39:45 -0800 (PST)
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
In-Reply-To: <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Feb 2025 17:39:33 +0000
X-Gm-Features: AWEUYZlDafBpFokqUpKbJAhQu7Ep0JLs4xPUNmdO9fz5XX0E98BWFTHCpoumcPo
Message-ID: <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Sumit Garg <sumit.garg@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishbar.or=
g> wrote:
> > But just because TEE is one good backend implementation, doesn't mean
> > it should be the userspace ABI. Why should userspace care that TEE has
> > mediated the allocation instead of it being a predefined range within
> > DT?
>
> The TEE may very well use a predefined range that part is abstracted
> with the interface.

Of course. But you can also (and this has been shipped on real
devices) handle this without any per-allocation TEE needs by simply
allocating from a memory range which is predefined within DT.

From the userspace point of view, why should there be one ABI to
allocate memory from a predefined range which is delivered by DT to
the kernel, and one ABI to allocate memory from a predefined range
which is mediated by TEE?

> >  What advantage
> > does userspace get from having to have a different codepath to get a
> > different handle to memory? What about x86?
> >
> > I think this proposal is looking at it from the wrong direction.
> > Instead of working upwards from the implementation to userspace, start
> > with userspace and work downwards. The interesting property to focus
> > on is allocating memory, not that EL1 is involved behind the scenes.
>
> From what I've gathered from earlier discussions, it wasn't much of a
> problem for userspace to handle this. If the kernel were to provide it
> via a different ABI, how would it be easier to implement in the
> kernel? I think we need an example to understand your suggestion.

It is a problem for userspace, because we need to expose acceptable
parameters for allocation through the entire stack. If you look at the
dmabuf documentation in the kernel for how buffers should be allocated
and exchanged, you can see the negotiation flow for modifiers. This
permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.

Standardising on heaps allows us to add those in a similar way. If we
have to add different allocation mechanisms, then the complexity
increases, permeating not only into all the different userspace APIs,
but also into the drivers which need to support every different
allocation mechanism even if they have no opinion on it - e.g. Mali
doesn't care in any way whether the allocation comes from a heap or
TEE or ACPI or whatever, it cares only that the memory is protected.

Does that help?

Cheers,
Daniel

