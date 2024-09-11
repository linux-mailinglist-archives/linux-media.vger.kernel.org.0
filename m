Return-Path: <linux-media+bounces-18153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE3975072
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 13:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 090C91C2259F
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 11:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807F6185E73;
	Wed, 11 Sep 2024 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="ZIdIDwgU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3081D15442D
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726052850; cv=none; b=cxcxj3xQxSnCdfQhKcKKpWU5YU4eSyvfEQW8PBwlAKkmgYyh2zb666LC6UIsWPnI17s/1wIZ6bwjLlDPg7ofWbcuzaSr+sK4DDR9Z5rMRX8R+jP7hFrISqoJ/gx3nf7zwphdLTH1X7BMvfPGc3vzuPrzs8xLYuQ4Q13BS0hnh0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726052850; c=relaxed/simple;
	bh=BP4GHUP1ZwTseeoJTLMOIx06gueTKby1CtIKw/ccRWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jg4mey9kdiXQFO3fD0NwKo0iHCuXDMCEauk3pjfN0CuIcdxjoa6+wOime/MWxxe9CIvQ4iep+Rd5xZODltLbK2jRujbVfqQpr4eeygcAI3itvq5+udR6FJa/600NEzVvK4vsLCTQqIz3Ef30KUJKKuzqrn+g9VYzjnSuvap+hqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=ZIdIDwgU; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6db9e47ee79so13260997b3.3
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 04:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1726052847; x=1726657647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfKqpT6gMHu6yKs0bohCo1aZwLC/RRj8ZGqLiNhs4jw=;
        b=ZIdIDwgUYn6IROGGU81jsyn99iuPK7wxJAhcxJS9nRt9fc8YgdsBGVF4hSNFLk9FdD
         2P0UN3+FNGzyXz9BzOHJ/ajL7jax0H761m6dgAhW2xHI6aTXaQ29aNXCQi4vc6ALxbE/
         yVYRMS7wJJtAmQ2dJLHHNmDqgZVRgB/92b0NRgnFw8tYPC6wVpDJWrO0F/S+KMRY33KA
         ZZZSLNP7E1RECpzeR416jHvxjZ2TmoJxRYct6TU7UZM8b/Goc5mzuFchzqEtQtVWnBaT
         EiLSachOov2q2hgFndBnQQcnaEmYM1Jo2grQH7ADeB6Y+yEqz1rS1+HQJhu7cVx9uvbq
         mBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726052847; x=1726657647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfKqpT6gMHu6yKs0bohCo1aZwLC/RRj8ZGqLiNhs4jw=;
        b=GWYpOXTpK+DvYfqnvUmglxIHnIuLE9YGRk+dfvc8tugFqyPSIVA2G1rZHtQQnE85IZ
         SJkFUo9jQHNFUrqFWxg2YPK3Mg5exFo2VC2M2OX1pme2zvTx29FZ7OPWcqIxEJ1hSlcu
         6FmITi+W7iKwnVHKmMn/B4tpMPX7Mos9Wv/TMEFGtXy1YJcF9ESZ26Q0vpOM4Jkjsk3d
         z5Xdd0m7MQLvsoW0tC0IvKssFp6nkhf4ppBOsfL14YqsZwx34mAzHByrDhuoKxJimFMm
         vOFZuuerAgZ7Pg/6HBgLqGQ3eEpDwZvFHlyBerRlO8wOnYcxKGh+mmiMYxr+0mVNDln+
         upZA==
X-Forwarded-Encrypted: i=1; AJvYcCU/jzeIOD76TQ6qioiWPpaNC5H8cFTIXixCLo+rngDP94122kVllMEytXu8y67Fzx1GNOwchKbn9EpGEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGd2KR67XjeILO7c18Wh9L203rtapjbE/k3OIDOpKszW/15EJd
	Oaa/8wj0sIHlBe6RyQC8v82UwNG1HkIR1K4ly3kHvDIQ45GF6IzXLJoomKD3oSrZh7rQA92YHVZ
	tVqYF3A==
X-Google-Smtp-Source: AGHT+IEHR9fPcrUUzIhZfM3NH6WRfny6ubS180Lnq2f7J2YlJ8wPZyA1Nxs60VlAUlEXlEDCKSC0gQ==
X-Received: by 2002:a05:690c:82:b0:6db:4536:8591 with SMTP id 00721157ae682-6db45368846mr197265367b3.28.1726052847030;
        Wed, 11 Sep 2024 04:07:27 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db96501ca3sm6552417b3.87.2024.09.11.04.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 04:07:26 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e1a8e305da0so6794131276.3;
        Wed, 11 Sep 2024 04:07:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNHnG82gjPFKM3ztsO3d9Nm9KqTU3Ip2Y+WZMZZGZhRfDXCYcB3YEutiZRSvGsQmwzx//de+B6jHNC@vger.kernel.org, AJvYcCVOlEyT62i6hKa+54o20WHwcSkkSPNjmuCUdsrXgEz4a6UnoLd5YDkACvaq25e5g+ZqItXV7PFJ66qFauI=@vger.kernel.org, AJvYcCWe3gTSY96dNqphkBM0mHtQaLRSUaq/Lz/gBxLrrhb497g9Mbhnf4Kcei0iyeLaW2tHNNOaPBBUQ9azNzU2@vger.kernel.org
X-Received: by 2002:a05:6902:2004:b0:e1a:4082:e8f2 with SMTP id
 3f1490d57ef6-e1d348a15d7mr19851736276.4.1726052845474; Wed, 11 Sep 2024
 04:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net> <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
 <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
 <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com>
 <vmgk4wmlxbsb7lphq2ep3xnxx3mbv6e6lecihtftxoyp5lidvy@mectcwirrlek> <3516994c-7b06-4409-b9a9-975b9f7a60eb@arm.com>
In-Reply-To: <3516994c-7b06-4409-b9a9-975b9f7a60eb@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 11 Sep 2024 13:07:14 +0200
X-Gmail-Original-Message-ID: <CAAObsKCGr8EUB747RN_w2BpTqLzGee+Bwm7HWB=xRbSBE2huUg@mail.gmail.com>
Message-ID: <CAAObsKCGr8EUB747RN_w2BpTqLzGee+Bwm7HWB=xRbSBE2huUg@mail.gmail.com>
Subject: Re: [PATCH 2/9] iommu/rockchip: Attach multiple power domains
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
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

On Fri, Jun 14, 2024 at 2:07=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2024-06-13 10:38 pm, Sebastian Reichel wrote:
> > Hi,
> >
> > On Thu, Jun 13, 2024 at 11:34:02AM GMT, Tomeu Vizoso wrote:
> >> On Thu, Jun 13, 2024 at 11:24=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizo=
so.net> wrote:
> >>> On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Sebastian Reichel
> >>> <sebastian.reichel@collabora.com> wrote:
> >>>> On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
> >>>>> IOMMUs with multiple base addresses can also have multiple power
> >>>>> domains.
> >>>>>
> >>>>> The base framework only takes care of a single power domain, as som=
e
> >>>>> devices will need for these power domains to be powered on in a spe=
cific
> >>>>> order.
> >>>>>
> >>>>> Use a helper function to stablish links in the order in which they =
are
> >>>>> in the DT.
> >>>>>
> >>>>> This is needed by the IOMMU used by the NPU in the RK3588.
> >>>>>
> >>>>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> >>>>> ---
> >>>>
> >>>> To me it looks like this is multiple IOMMUs, which should each get
> >>>> their own node. I don't see a good reason for merging these
> >>>> together.
> >>>
> >>> I have made quite a few attempts at splitting the IOMMUs and also the
> >>> cores, but I wasn't able to get things working stably. The TRM is
> >>> really scant about how the 4 IOMMU instances relate to each other, an=
d
> >>> what the fourth one is for.
> >>>
> >>> Given that the vendor driver treats them as a single IOMMU with four
> >>> instances and we don't have any information on them, I resigned mysel=
f
> >>> to just have them as a single device.
> >>>
> >>> I would love to be proved wrong though and find a way fo getting
> >>> things stably as different devices so they can be powered on and off
> >>> as needed. We could save quite some code as well.
> >>
> >> FWIW, here a few ways how I tried to structure the DT nodes, none of
> >> these worked reliably:
> >>
> >> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple=
-devices-power/arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L=
1163
> >> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-schema-s=
ubnodes//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1162
> >> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple=
-devices//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1163
> >> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple=
-iommus//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L2669
> >>
> >> I can very well imagine I missed some way of getting this to work, but
> >> for every attempt, the domains, iommus and cores were resumed in
> >> different orders that presumably caused problems during concurrent
> >> execution fo workloads.
> >>
> >> So I fell back to what the vendor driver does, which works reliably
> >> (but all cores have to be powered on at the same time).
> >
> > Mh. The "6.10-rocket-multiple-iommus" branch seems wrong. There is
> > only one iommu node in that. I would have expected a test with
> >
> > rknn {
> >      // combined device
> >
> >      iommus =3D <&iommu1>, <&iommu2>, ...;
> > };
> >
> > Otherwise I think I would go with the schema-subnodes variant. The
> > driver can initially walk through the sub-nodes and collect the
> > resources into the main device, so on the driver side nothing would
> > really change. But that has a couple of advantages:
> >
> > 1. DT and DT binding are easier to read
> > 2. It's similar to e.g. CPU cores each having their own node
> > 3. Easy to extend to more cores in the future
> > 4. The kernel can easily switch to proper per-core device model when
> >     the problem has been identified
>
> It also would seem to permit describing and associating the per-core
> IOMMUs individually - apart from core 0's apparent coupling to whatever
> shared "uncore" stuff exists for the whole thing, from the distinct
> clocks, interrupts, power domains etc. lining up with each core I'd
> guess those IOMMUs are not interrelated the same way the ISP's
> read/write IOMMUs are (which was the main justification for adopting the
> multiple-reg design originally vs. distinct DT nodes like Exynos does).
> However, practically that would require the driver to at least populate
> per-core child devices to make DMA API or IOMMU API mappings with, since
> we couldn't spread the "collect the resources" trick into those
> subsystems as well.

They seem to be interrelated in some way, because I need to program
the mappings in all three iommus for things to work, which is also
what the downstream driver does. Unfortunately, the TRM has zero
references to the MMU in the NPU section...

Regards,

Tomeu

