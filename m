Return-Path: <linux-media+bounces-20138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFDD9AD8F6
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 02:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 489B61C218AF
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 00:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3E9AD55;
	Thu, 24 Oct 2024 00:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Moqlb6yV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0301E4AD
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 00:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729729603; cv=none; b=GqzLpR6x4DlXqsNC4whtyxTY/jdHzWoOUbVRsCR3xbWwS/hX1eJyU1Z7gAl6noCCIhfqcgRgEu7Z4yAlKso8qCThX+jQD53t8IHbBn3Rof4xxaN62D7dNMyFrl+pqXDzk7oEfVOZexDbMzwgY7hCbzUBeD0nDO7usXlD3HlCgWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729729603; c=relaxed/simple;
	bh=XO7VovVzj1BPrVw+Wf5x+qyjs8ZTD7IQiAtZNmvKHUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meDW1C0ksVM7MTpM26uVpM6cfDghLJGVe2e0B/zymT7pI185/2aU81eDf2oTckD+tdF2GOO3JNbLvyzXLu1W7chJ1JIsL9fwIaKibx1AJ/SvadWE8qYdnvpavSuIGWnFgNBhH0WYF+sXsKnblzDsNcyuDpeNZjLUwAIPAYANDWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Moqlb6yV; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-460b295b9eeso18701cf.1
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 17:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729729599; x=1730334399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0t1/W3VOoKzRco/3jb/6PzML2qkeqAFFQKJfPMJh0zQ=;
        b=Moqlb6yVvmMcBuChBORo348Z6sevz3mnHO+i/vy+IyKlb4HJ5vuDOh/Azjw0a5q+TZ
         Kosn8M+ImQ6BXdcSkIXvYkD8xrGAXLsP0k+mCnrpHVvHoNXGk8VF4I3emLecpLMWBsZ/
         wZaYqGmTE675DomYNxzyjtgPpoa8cQuQ3VKq28DSyGRjWCA6Jb6Jk5/UDcWumvJ36A5i
         MsOviwB7m0/Ihj8JyUhCCurhKW9USByv1Oh3JbRX1nfA4vdXxUUXwnUMzDNpTptoEt4H
         439QcFkAbt+Cj3cbx0AMVHnhnMn6UsLPNb+F+AZA11L81Gz70HaaE9ALP76COWI0u5NY
         50eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729729599; x=1730334399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0t1/W3VOoKzRco/3jb/6PzML2qkeqAFFQKJfPMJh0zQ=;
        b=bA7SymNcVl7O0rXRID9jLXmRcQhxZ2rUR5OicrEGM5qxey/xWr6sPjnLDtZtgwj6Kr
         0D1HRD5bzpj3FSTegORpZrDej3ra1Pq2xYHlXO/ZzLwpfyRKE5O4KuGEqGzj8vmF7zNq
         VHsxfv/jss/OifJetuHVraoGzwSbCs3CPxgF8iNItEerMH0LIu2g2nqnb5+++AwUXR8k
         yFAy25dM7o2x6+/B2EXsoT3hDRRHxGONqNojSuDo1XAfLv47whPHGHUbFq7QuOT1/gZW
         8yPGM2pHnutvYd2+khsBtBq0oDb2h0Jvk7Br4jPnpBg+OgCCwedkfuQ2r7jGfVmqAtDj
         ZJVA==
X-Forwarded-Encrypted: i=1; AJvYcCUQx+VF/59kh1vP7zDTNAvwGvAnBIZU92uK2b2b0RoBtjPQN83s5thWtK5IdJFDZ8EfP2DQyRHt1DKy6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtT41VZelh5iwwIeUIaLZIKgEICFhT0eP2sCalSzIjVUK7ptNA
	hMcHcVf+zfreXWrzY1FJCK7nsXlwTnL9r5hfULiKg/o5PGXPjT9Dg4nR2q0wgDHxGB6BOyOcGR4
	V6VMU6Brb4EYjokGGQSeTf1bY76gkGovTwzVG
X-Google-Smtp-Source: AGHT+IEQrVkBml7UI0Uw4ZtwGBqVXrIo5cxee2Oexbu2tWb028MtGoy/IcXDifMTYHr92UFgH6qTtnfUiTeu1uraXWU=
X-Received: by 2002:a05:622a:256:b0:45c:9eab:cce0 with SMTP id
 d75a77b69052e-46124382133mr802111cf.15.1729729599106; Wed, 23 Oct 2024
 17:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930144057.453751-1-mripard@kernel.org> <CABdmKX3=h57Jcphiq2Ekseg=j_ay8frmFgyHKWb04b4J5f2T5w@mail.gmail.com>
 <20241021-defiant-unicorn-of-authority-b23277@houat>
In-Reply-To: <20241021-defiant-unicorn-of-authority-b23277@houat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 23 Oct 2024 17:26:26 -0700
Message-ID: <CABdmKX2LFz7t_k9EB25HpC7EacA343Eh6D46in2fLeUHcBFvLQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add heap name definitions
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 9:30=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi TJ,
>
> Thanks for your review
>
> On Tue, Oct 01, 2024 at 11:03:41PM +0200, T.J. Mercier wrote:
> > On Mon, Sep 30, 2024 at 4:41=E2=80=AFPM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > >
> > > Following a recent discussion at last Plumbers, John Stultz, Sumit
> > > Sewal, TJ Mercier and I came to an agreement that we should document
> > > what the dma-buf heaps names are expected to be, and what the buffers
> > > attributes you'll get should be documented.
> > >
> > > Let's create that doc to make sure those attributes and names are
> > > guaranteed going forward.
> >
> > Hey, thanks for sending this!
> >
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > >
> > > ---
> > >
> > > To: Jonathan Corbet <corbet@lwn.net>
> > > To: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > > Cc: John Stultz <jstultz@google.com>
> > > Cc: "T.J. Mercier" <tjmercier@google.com>
> > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linux-doc@vger.kernel.org
> > > ---
> > >  Documentation/userspace-api/dma-buf-heaps.rst | 71 +++++++++++++++++=
++
> > >  Documentation/userspace-api/index.rst         |  1 +
> > >  2 files changed, 72 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst
> > >
> > > diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Document=
ation/userspace-api/dma-buf-heaps.rst
> > > new file mode 100644
> > > index 000000000000..00436227b542
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> > > @@ -0,0 +1,71 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > +Allocating dma-buf using heaps
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Dma-buf Heaps are a way for userspace to allocate dma-buf objects. T=
hey are
> > > +typically used to allocate buffers from a specific allocation pool, =
or to share
> > > +buffers across frameworks.
> > > +
> > > +Heaps
> > > +=3D=3D=3D=3D=3D
> > > +
> > > +A heap represent a specific allocator. The Linux kernel currently su=
pports the
> >
> > "represents"
> >
> > > +following heaps:
> > > +
> > > + - The ``system`` heap allocates virtually contiguous, cacheable, bu=
ffers
> >
> > Virtually contiguous sounds a little weird to me here. Sure, that's
> > what userspace will get when it maps the buffer (and I guess this *is*
> > UAPI documentation after all), but I'm not sure it's correct to say
> > that's a property of the buffer itself? What if we invert this and
> > instead say that there is NO guarantee that the memory for the buffer:
> >  - is physically contiguous
> >  - has any particular alignment (greater than page aligned)
> >  - has any particular page size (large order allocations are attempted
> > first, but not guaranteed or even likely on some systems)
> >  - has bounds on physical addresses
> >
> > Maybe that is too much detail here...
>
> Yeah, I don't know.
>
> It's getting philosophical, but I guess there's an infinite number of
> guarantees we wouldn't provide. It seems easier for me to maintain a
> list of the things a buffer is/has rather than the opposite.
>
> But maybe we can rephrase virtually contiguous if it's weird to you?

You're right, I'm being too picky here. Virtually contiguous is as
reasonable as anything else I can come up with.

> > > +
> > > + - The ``reserved`` heap allocates physically contiguous, cacheable,=
 buffers.
> > > +   Depending on the platform, it might be called differently:
> > > +
> > > +    - Acer Iconia Tab A500: ``linux,cma``
> > > +    - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> > > +    - Amlogic A1: ``linux,cma``
> > > +    - Amlogic G12A/G12B/SM1: ``linux,cma``
> > > +    - Amlogic GXBB/GXL: ``linux,cma``
> > > +    - ASUS EeePad Transformer TF101: ``linux,cma``
> > > +    - ASUS Google Nexus 7 (Project Bach / ME370TG) E1565: ``linux,cm=
a``
> > > +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) E1565: ``linux,c=
ma``
> > > +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) PM269: ``linux,c=
ma``
> > > +    - Asus Transformer Infinity TF700T: ``linux,cma``
> > > +    - Asus Transformer Pad 3G TF300TG: ``linux,cma``
> > > +    - Asus Transformer Pad TF300T: ``linux,cma``
> > > +    - Asus Transformer Pad TF701T: ``linux,cma``
> > > +    - Asus Transformer Prime TF201: ``linux,cma``
> > > +    - ASUS Vivobook S 15: ``linux,cma``
> > > +    - Cadence KC705: ``linux,cma``
> > > +    - Digi International ConnectCore 6UL: ``linux,cma``
> > > +    - Freescale i.MX8DXL EVK: ``linux,cma``
> > > +    - Freescale TQMa8Xx: ``linux,cma``
> > > +    - Hisilicon Hikey: ``linux,cma``
> > > +    - Lenovo ThinkPad T14s Gen 6: ``linux,cma``
> > > +    - Lenovo ThinkPad X13s: ``linux,cma``
> > > +    - Lenovo Yoga Slim 7x: ``linux,cma``
> > > +    - LG Optimus 4X HD P880: ``linux,cma``
> > > +    - LG Optimus Vu P895: ``linux,cma``
> > > +    - Loongson 2k0500, 2k1000 and 2k2000: ``linux,cma``
> > > +    - Microsoft Romulus: ``linux,cma``
> > > +    - NXP i.MX8ULP EVK: ``linux,cma``
> > > +    - NXP i.MX93 9x9 QSB: ``linux,cma``
> > > +    - NXP i.MX93 11X11 EVK: ``linux,cma``
> > > +    - NXP i.MX93 14X14 EVK: ``linux,cma``
> > > +    - NXP i.MX95 19X19 EVK: ``linux,cma``
> > > +    - Ouya Game Console: ``linux,cma``
> > > +    - Pegatron Chagall: ``linux,cma``
> > > +    - PHYTEC phyCORE-AM62A SOM: ``linux,cma``
> > > +    - PHYTEC phyCORE-i.MX93 SOM: ``linux,cma``
> > > +    - Qualcomm SC8280XP CRD: ``linux,cma``
> > > +    - Qualcomm X1E80100 CRD: ``linux,cma``
> > > +    - Qualcomm X1E80100 QCP: ``linux,cma``
> > > +    - RaspberryPi: ``linux,cma``
> > > +    - Texas Instruments AM62x SK board family: ``linux,cma``
> > > +    - Texas Instruments AM62A7 SK: ``linux,cma``
> > > +    - Toradex Apalis iMX8: ``linux,cma``
> > > +    - TQ-Systems i.MX8MM TQMa8MxML: ``linux,cma``
> > > +    - TQ-Systems i.MX8MN TQMa8MxNL: ``linux,cma``
> > > +    - TQ-Systems i.MX8MPlus TQMa8MPxL: ``linux,cma``
> > > +    - TQ-Systems i.MX8MQ TQMa8MQ: ``linux,cma``
> > > +    - TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM: ``linux,cma``
> > > +    - TQ-Systems MBA6ULx Baseboard: ``linux,cma``
> > > +
> >
> > This part LGTM. Might be worth it to document that a CMA region must
> > be specified on the kernel command line. Otherwise this heap won't
> > show up at runtime by only enabling the kernel configs necessary to
> > build it.
>
> Really? My understanding was that you need a default CMA region, which
> happens either if you have cma=3D on the kernel command line, a default
> CMA pool in the DT, or if CMA_SIZE_MBYTES isn't set to 0?

Ok yes, these too. :)
>
> Maxime

