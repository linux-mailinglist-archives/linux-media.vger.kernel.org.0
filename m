Return-Path: <linux-media+bounces-18152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9A897505E
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 13:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1612128CFC1
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 11:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613A1185B74;
	Wed, 11 Sep 2024 11:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="ngualw4h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8517F505
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726052615; cv=none; b=DpDvlIghS0zAQlruVN5mihsPGBH8vQq8aOdUSDChxRiaxBio4riB76bYNS5QDBrXrpIi0DRWvV4ZMhUGb8kaXqkZfY3ZlZDjQMWYrKev2zqA/pgD80F0p008rxNc/wU0R7MxASwDG1BS0Pg/Qi7xDcJt3ogZWMbfzqjjXMvXeuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726052615; c=relaxed/simple;
	bh=ORjVOdeptDBmaHaEY2r7GosRGBJcUlHe/3hAQlnOrz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NqSkROfcS50P1SwOqWBqKAJ5tHMXsNvcmLqxhPNdOXTnEtwP//dcaUL1HLsMein8PfcCpEvIHCLzCCHZ2ZOdqPMDZa9ByKS9RW1In2hFcakVPWPIRmOYesW6z47k/ndupWjEnf7YDesGoAufG40z/7Y+844Px8w/RvlxJ4dved4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=ngualw4h; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1a9e4fa5aaso6439902276.2
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1726052611; x=1726657411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxDPM9JMquUGtRkhciAkGUBMtgFCHGxBT/7mvWlerhM=;
        b=ngualw4hRVF5ZCmEB3N3M78txTOX1Bo9ezNLhw422P3AxqnpuyNRSoYu0ieVmcjvbC
         xIbE9Q4M9t8OYJZ/N8jqgKmTb7yU6DT4KEWIExqsiSBeCHYtAIH46HDBmtBLfi4n/+dt
         1gt5CPm4nQDX75VaXsi2wh2FPyXHN2rsubJ6d7ctLumCK0Y7erBLRZ3uVSLFtn5FSjlb
         TSwBLJAOoLqecXUDCrrhQuyqJjOXjBfY1VBKONUqQzBDh+2hz57NbvaKLhhpHDjVzpoY
         ag57Xr+7eBS+2HDSyAlbMdDsMJ6+0mCwU8Pyc+AYLUFeWpyWtQfdYOytBNPKC+Lk7QRW
         4O5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726052611; x=1726657411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxDPM9JMquUGtRkhciAkGUBMtgFCHGxBT/7mvWlerhM=;
        b=RYM1qtyOKCvaCig+Qntq1jFFSgpli55FtYk03W4FprPnhqAm/uf0CBAjMZ60Fnh1zK
         KA+ln5anZNyMwsEud3CDD35qGDBM+MWMv/BAGoyEyohpr3mVCQV5dTskWPNRDpoLIjxG
         zPfO0CNyJMj6AsJMIpw4+8mxNCNNMG6uw1sLlV4eerzkFxgHc10bWfQ7TNKCo7b0JZ0l
         fO8kRnzL0QO6F1bToSqB0QJv2tSOyw3xQ57v9Udb6TuTZi8n5cmshRmvY8U/bgQ0CbgJ
         biM7M1Y6QeTln9KUEPKgIQ9yNlJdRjEoTm8XYmQWqziOb6IcmrQvp6fyj0/YnA+Xlfpu
         asIw==
X-Forwarded-Encrypted: i=1; AJvYcCVRjz8qpZbrGVlgf+7vj7NfaCU2APvl/S1b6urbGgPHSjc1CsspwBN4dEyWFx9mVvTnYfNix2n/qo5jKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0B4IGvsfbOc74nLU03c92rpBqOg58zNCyzOttRd5Plzerm2SH
	4WlIdbOoBTAT+GO4qRvJpIlKGoQm1vzcsLM0/zHTtFQ9YeLgQRh6JC3HI1Sfe78=
X-Google-Smtp-Source: AGHT+IEksBAtqNIVyEeMs9l3E8i8FNYnoZY0XPPufsecc+4JGJPiqW+9JP8Cs7vP2yaYj7j9QgBnUA==
X-Received: by 2002:a05:690c:4445:b0:6b1:2825:a3e2 with SMTP id 00721157ae682-6db451667e9mr179156077b3.44.1726052611525;
        Wed, 11 Sep 2024 04:03:31 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db96501f0bsm6580827b3.80.2024.09.11.04.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 04:03:31 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e1a9e4fa5aaso6439874276.2;
        Wed, 11 Sep 2024 04:03:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRTbL+SfiiK/1yRyb+nuP5z57TWL+k7TH9KropMU5FwMfOggMIxWTHIbLKhuTfp/T2QrejL+iPASGnLk/o@vger.kernel.org, AJvYcCVU41OMxDOdEWr13nu0a6vPTYznnyCMvLqC8B+GXadVACcgafLNrds8vzYfV/JiaoNyLd8jP7zs15PM@vger.kernel.org, AJvYcCWff63YrzReDk33mnnQnh+pRwPqlaM7cIJyniuqy4Qd5GOkR2nEjYu+fadtGbXf2ZJ0CPU/SpYbGMoRY3c=@vger.kernel.org
X-Received: by 2002:a05:6902:2e11:b0:e11:698f:8843 with SMTP id
 3f1490d57ef6-e1d349cf097mr17492302276.44.1726052610124; Wed, 11 Sep 2024
 04:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net> <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
 <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
 <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com> <vmgk4wmlxbsb7lphq2ep3xnxx3mbv6e6lecihtftxoyp5lidvy@mectcwirrlek>
In-Reply-To: <vmgk4wmlxbsb7lphq2ep3xnxx3mbv6e6lecihtftxoyp5lidvy@mectcwirrlek>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 11 Sep 2024 13:03:18 +0200
X-Gmail-Original-Message-ID: <CAAObsKAigVVFWuoATTBWbCEfwg0RRHXa=Ehw2OQJyug6EdCDnA@mail.gmail.com>
Message-ID: <CAAObsKAigVVFWuoATTBWbCEfwg0RRHXa=Ehw2OQJyug6EdCDnA@mail.gmail.com>
Subject: Re: [PATCH 2/9] iommu/rockchip: Attach multiple power domains
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 11:38=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Thu, Jun 13, 2024 at 11:34:02AM GMT, Tomeu Vizoso wrote:
> > On Thu, Jun 13, 2024 at 11:24=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizos=
o.net> wrote:
> > > On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Sebastian Reichel
> > > <sebastian.reichel@collabora.com> wrote:
> > > > On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
> > > > > IOMMUs with multiple base addresses can also have multiple power
> > > > > domains.
> > > > >
> > > > > The base framework only takes care of a single power domain, as s=
ome
> > > > > devices will need for these power domains to be powered on in a s=
pecific
> > > > > order.
> > > > >
> > > > > Use a helper function to stablish links in the order in which the=
y are
> > > > > in the DT.
> > > > >
> > > > > This is needed by the IOMMU used by the NPU in the RK3588.
> > > > >
> > > > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > > ---
> > > >
> > > > To me it looks like this is multiple IOMMUs, which should each get
> > > > their own node. I don't see a good reason for merging these
> > > > together.
> > >
> > > I have made quite a few attempts at splitting the IOMMUs and also the
> > > cores, but I wasn't able to get things working stably. The TRM is
> > > really scant about how the 4 IOMMU instances relate to each other, an=
d
> > > what the fourth one is for.
> > >
> > > Given that the vendor driver treats them as a single IOMMU with four
> > > instances and we don't have any information on them, I resigned mysel=
f
> > > to just have them as a single device.
> > >
> > > I would love to be proved wrong though and find a way fo getting
> > > things stably as different devices so they can be powered on and off
> > > as needed. We could save quite some code as well.
> >
> > FWIW, here a few ways how I tried to structure the DT nodes, none of
> > these worked reliably:
> >
> > https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-=
devices-power/arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1=
163
> > https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-schema-su=
bnodes//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1162
> > https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-=
devices//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1163
> > https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-=
iommus//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L2669
> >
> > I can very well imagine I missed some way of getting this to work, but
> > for every attempt, the domains, iommus and cores were resumed in
> > different orders that presumably caused problems during concurrent
> > execution fo workloads.
> >
> > So I fell back to what the vendor driver does, which works reliably
> > (but all cores have to be powered on at the same time).
>
> Mh. The "6.10-rocket-multiple-iommus" branch seems wrong. There is
> only one iommu node in that. I would have expected a test with
>
> rknn {
>     // combined device
>
>     iommus =3D <&iommu1>, <&iommu2>, ...;
> };

You are right, I'm afraid I lost those changes...

> Otherwise I think I would go with the schema-subnodes variant. The
> driver can initially walk through the sub-nodes and collect the
> resources into the main device, so on the driver side nothing would
> really change. But that has a couple of advantages:
>
> 1. DT and DT binding are easier to read
> 2. It's similar to e.g. CPU cores each having their own node
> 3. Easy to extend to more cores in the future
> 4. The kernel can easily switch to proper per-core device model when
>    the problem has been identified

You mean having subnodes containing the different resources that a
core uses such as clocks, memory resources, power domain, etc? The
problem with that is that the existing code in the kernel assumes that
those resources are directly within a device node. Or do you suggest
something else?

Thanks,

Tomeu

