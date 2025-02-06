Return-Path: <linux-media+bounces-25736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE34A2B416
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 22:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36C4B3A8A1B
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 21:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6155A1DFD9B;
	Thu,  6 Feb 2025 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="lO9TqSlq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106221DF96F
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 21:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876876; cv=none; b=HXFHIst2BiVXGuAfivWY7sn51OZyfFiGF7gG/pUHTKLfLZ555mDBlVWe16EQKeOv7zclMpyGa8SQ75GMSQwMNWvnXjbdom22MP33on2ftUuTOGkOmGiSsLuYt/3M5yG21QP0OzlbE6CnsvjdyqjTFm738Qrr2oGCYDeJQHdc9rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876876; c=relaxed/simple;
	bh=6DxvZdZPg1+c/4MiY+1eFG+nW41sRJmolNY7AFhKpW0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BdiRRfbNYfkBmzc16eDgq225eDNCIsgfxOo6mUtFKHFSSf5yl2QKRNZm+GHKKw30SpywQRNgD6Fz9xKTislTfB/Fykh5fIhcpPMvjWWJGZ0QEhqPBcGyoPNwRhWuiJIGN/L27CA88Wo5D7Rmboi3EgLzeHd5PtGkxStzANEdeHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=lO9TqSlq; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467918c35easo23791931cf.2
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2025 13:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738876874; x=1739481674; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6DxvZdZPg1+c/4MiY+1eFG+nW41sRJmolNY7AFhKpW0=;
        b=lO9TqSlqGkUY6SXdNi6SY+0OuQK+K7OSDv1c165UmJ0W9Qqkvm3jB4nx5ysPDZtuxR
         Rki9hfgaEOAVqdNh4DooAixMFfAPVQkGYknBucNWsFL2WIKSW0klStM6aJ1haVL2cgcU
         lu8WKc3FT+kytX1G6Ya92eMsiKjDmvAl64T8CLvV/9xpG2sGzDGshwMxKBil6baa4OTj
         JWlbIdz7tL2lG9RNEjjKezXqWOyfTgow4WNtSKMLScofO63X8YP6F5QHfbP8JaEXKEeW
         C6bxdM9+CRB7HtqMYSvwuRrlFffeFbKj3SMRRUTfQxQKTk66AOoxlAOUVb4S5UOMqOWl
         u6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738876874; x=1739481674;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6DxvZdZPg1+c/4MiY+1eFG+nW41sRJmolNY7AFhKpW0=;
        b=QhUmpu2cZDOMlU57aaEHf1/0/mlmlaW6qTwVt880ryd7WyIf+wHcRiqfkLz4oBmQwQ
         +h2I+XF08tUsj6qtpWP5909QFZ2FNKQgcbEIYKemWFEe2Fa7pG27nyTxJ/s+Izm0cFG/
         zkB35UQMCclJqDsRJJ3YKMot/U8az2+vSryCsnF7Z1sUAHW0MRp3ioOiX1c/kGZO7v2m
         agij1QhpGKD1R/5dVgiv02oimNukKFLvtNj+YU7Bvrgs16+FsWPc/pyQQ9/o+6UkPxDj
         7AWQfD9eczcNp5NP3BhKQgJ5Y6/1dHkOf+dT+Ha3rM+Ee7SWgMKBX++m1meDWn3Vd3VE
         x9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVUe+ES00Bb5JMZS6BEl4X9TPJ5N5WQXFloBzkV4enFvlvc58DhAnpkvJLS3Rn6p8NKzq1U1mTL/1mjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsgQzghe58jDKeV+ptPH5f+sqkPZ3rRaUq1Mb5u9c7RiKQYq2o
	cePLivxysKYP4e3lW39HmEJwflxBH3WKK3EB1Ad14MkVul5SOPcA6tndbwYn2yE=
X-Gm-Gg: ASbGncsMhGRnk/gGOH7Y1QRWXkGwdn98da86USQD0cNL/LZAJ5AOf+mfr4mLz0EefAS
	OIfv/MNQDTaGnLcdIMc3t9K1lTp/cErTXJhHR2osmsnfxnnQm8E5qDmmr8X0VKvNKZ7PkSNP6wD
	U+NwJuBgQRAZP70O+W6KsuP4sQHgavn+ppalyvN0W+uxkRDsb3M/377o546pH0sExVEaPhdsP6j
	93sppElsCGkDns8iktfn/kT/YdpMAiSDrui59q9goIq9ZJXPHSXoF6Nw4ku69sqVKH/9Lj1Ckg7
	DYj12F79yL05xJg9
X-Google-Smtp-Source: AGHT+IHI8yMd/5aYfmfZcfbDFH3h4Fy2Z99LYvivEu182Bj0ddc/CD4GBHcML5OVdc/uP/LZDxsEvA==
X-Received: by 2002:a05:622a:5a95:b0:466:a06f:ae0a with SMTP id d75a77b69052e-47167ae29c0mr13578771cf.32.1738876873855;
        Thu, 06 Feb 2025 13:21:13 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153bc741asm9168671cf.62.2025.02.06.13.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 13:21:12 -0800 (PST)
Message-ID: <5e0e2fbb22c2ffb0c5281727cd95d70f5f5ba696.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 3/5] dt-bindings: gpu: Add protected heap name to
 Mali Valhall CSF binding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzk@kernel.org>, Florent Tomasin	
 <florent.tomasin@arm.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier"	
 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	nd@arm.com, Akash Goel <akash.goel@arm.com>
Date: Thu, 06 Feb 2025 16:21:10 -0500
In-Reply-To: <c0aad911-ecc4-4b04-a453-6da226f76ed2@kernel.org>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	 <36b57dcf20860398ba83985e1c5b6f6958d08ba7.1738228114.git.florent.tomasin@arm.com>
	 <7234f25c-a2aa-4834-931b-aeeb7a49dfa7@kernel.org>
	 <4b9deab1-e330-4c93-8260-75276c2bc9ff@arm.com>
	 <c0aad911-ecc4-4b04-a453-6da226f76ed2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 05 f=C3=A9vrier 2025 =C3=A0 10:13 +0100, Krzysztof Kozlowski a =
=C3=A9crit=C2=A0:
> On 03/02/2025 16:31, Florent Tomasin wrote:
> > Hi Krzysztof
> >=20
> > On 30/01/2025 13:25, Krzysztof Kozlowski wrote:
> > > On 30/01/2025 14:08, Florent Tomasin wrote:
> > > > Allow mali-valhall-csf driver to retrieve a protected
> > > > heap at probe time by passing the name of the heap
> > > > as attribute to the device tree GPU node.
> > >=20
> > > Please wrap commit message according to Linux coding style / submissi=
on
> > > process (neither too early nor over the limit):
> > > https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/proces=
s/submitting-patches.rst#L597
> > Apologies, I think I made quite few other mistakes in the style of the
> > patches I sent. I will work on improving this aspect, appreciated
> >=20
> > > Why this cannot be passed by phandle, just like all reserved regions?
> > >=20
> > > From where do you take these protected heaps? Firmware? This would
> > > explain why no relation is here (no probe ordering, no device links,
> > > nothing connecting separate devices).
> >=20
> > The protected heap is generaly obtained from a firmware (TEE) and could
> > sometimes be a carved-out memory with restricted access.
>=20
> Which is a reserved memory, isn't it?
>=20
> >=20
> > The Panthor CSF kernel driver does not own or manage the protected heap
> > and is instead a consumer of it (assuming the heap is made available by
> > the system integrator).
> >=20
> > I initially used a phandle, but then I realised it would introduce a ne=
w
> > API to share the heap across kernel driver. In addition I found this
> > patch series:
> > -
> > https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.co=
m/#t
> >=20
> > which introduces a DMA Heap API to the rest of the kernel to find a
> > heap by name:
> > - dma_heap_find()
> >=20
> > I then decided to follow that approach to help isolate the heap
> > management from the GPU driver code. In the Panthor driver, if the
> > heap is not found at probe time, the driver will defer the probe until
> > the exporter made it available.
>=20
>=20
> I don't talk here really about the driver but even above mediatek
> patchset uses reserved memory bindings.
>=20
> You explained some things about driver yet you did not answer the
> question. This looks like reserved memory. If it does not, bring
> arguments why this binding cannot be a reserved memory, why hardware is
> not a carve out memory.

I think the point is that from the Mali GPU view, the memory does not need =
to be
within the range the Linux Kernel actually see, even though current integra=
tion
have that. From Mali GPU driver stand point (or codec drivers and what's no=
t),
the memory range is not useful to allocate protected/restricted memory. On =
top
of which, its not reserved specifically for the Mali GPU.

What's your practical suggestion here ? Introduce dma_heap_find_by_region()=
 ?

Nicolas

>=20
> Best regards,
> Krzysztof
>=20


