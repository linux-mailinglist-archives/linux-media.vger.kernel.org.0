Return-Path: <linux-media+bounces-13179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33D9068F1
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 11:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81F35286497
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0781422D1;
	Thu, 13 Jun 2024 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="ioxI+JCR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4897A1420BE
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718271257; cv=none; b=I4ylNBHdlw/t4VXvt+ZG8aSbidTbXJkFuIc/pAzt7R9znGvhSeS8RxIN8J5l5bjMPdDCnefaba7hJdkth2HWESQ/4to9nVm+8dkCKfgSQJCQjFE+UcIXiHdzO8AXBQKuBK9lR/0Q/As+gDxM+eyPlSTvqkSLvBvcjFnqzIdbplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718271257; c=relaxed/simple;
	bh=l/UOzlJrGDkSHTuKTHjaT+Pq7UK62xzyFQW3JHnm5Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksgpKEUhRiNz8/4ywlwVsWnsBtNMwipqAoOv37SW8EaiKI/zrVYh44LVmO2rfoN16KtoH10E7cowA50r12GiYfR7195FLglpJ/L/sXKKrI5OSuxf6mhUnOI7cE8tLv6CHVo99Xrg2KIbqwTH73fU+D13Q9AB+lhrMkgc167Epd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=ioxI+JCR; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfecd065b0aso752771276.1
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 02:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1718271254; x=1718876054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCGcmMkVAYD3NfdijGLTxRKIxsWVC1ouY5NCrb4R7to=;
        b=ioxI+JCR+kQWWMmo8zdlZhEWoWdUgyj7Iwz9mCHA+fZHGs9fffbkhhf/At+hX4Pz4S
         GrfCaGoEV21BNLk3xNNYkRprT+OhHk90Jkc/gHCsokc/Py8MgH6+pGn3mCjjdNc2XMx9
         EI+fpMUpTWuudvH2gYqtySOfvZiLVJr/CXiKmGU4BcLkiEw6CdvZ3JiJYzH8UbRZKb/5
         HCHoDlblMFaxhtHHauo1eTEbt8niRsopn5Y42RPIjJmiC455hx4NAAFdrXSVaXxtMmcZ
         LYMjp+uZyZ/zPgiynYwZefFISlXPVsyyRXZ8l2ZuJlzyyQfGWRBDYWSB04p2os1kxgt5
         vRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718271254; x=1718876054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCGcmMkVAYD3NfdijGLTxRKIxsWVC1ouY5NCrb4R7to=;
        b=clRJrKvZCLwlTMe36225nRon8Ag/smlBSLUJxf9ORBqNKeYyAa/R1YZCxTfrjQoj3+
         rf2AHD0uBcwXP2dL+jwJQ746DRwSyJcC1LEWoNqjJCkhEAlIIL/N9VuUdLXorC7vHEDD
         bi6o+kGzECl75WHvpgpQIZs409pgsx3v/AQZBtxZ8FhsCwEAXqvlh8EtJmj0rrDf2gJe
         ZD0EYvo8BbXU3Yp8PUNMtOBU9vGaxp4pDsZ0LvWXl2d7eXNLKZeOzoEFOiQ2mNyqzGrH
         4VNT+kY+Esb9f/iU/zyTYwMKw7f+8zRcMPjNoWMypOO8X+7ex3nBhcPZ6jFltALLo7kO
         qdfA==
X-Forwarded-Encrypted: i=1; AJvYcCUl6TanpNp0Duo13kxrdETCPU6p2rLFOJDUlUjW8gOrNnQEXY7qJXtNGbDzGiHxVT1J/Pp9zpjJjRYYX6Y8q6Xss+LXKvEeVFqmSF0=
X-Gm-Message-State: AOJu0Yy9Oj6zrwJsqZ3zZ+E0icjQ1dvCCW8aRlxnAEF/cK9AGw36lFK1
	aPoirQ3JzS/F1g1cKXn0muLcYdMETC0cf/FdgCwFt1Y/RpeMabxfFYw6GeivJ1k=
X-Google-Smtp-Source: AGHT+IEsWmbVlttMdP7xR0qhhTiTHogCHotcRDrK6pBYrn6Fr4ZsNFll6tbPg+Zqt9cQHIxzWTiLTw==
X-Received: by 2002:a05:6902:1889:b0:dfe:2488:c056 with SMTP id 3f1490d57ef6-dfe66d5826bmr5091704276.23.1718271254177;
        Thu, 13 Jun 2024 02:34:14 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff0466880bsm147761276.9.2024.06.13.02.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 02:34:13 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfefe1a9f01so933432276.2;
        Thu, 13 Jun 2024 02:34:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEgfUsRdazN3rjWrRwlbiucQukll/hlBSxLEa6+AsUyL6Cjys7tzp0CX6Z8G6cn1LQM0Ipzuj6xq+cu4IgMdySjKMY+Z9htptSs4eoBOt39yOwCmK8UkXyTJWNFampUkp/kK838z5aveixrACPgNvLAt+ZcBVQ/EDva+kXdniOL39/uUdu
X-Received: by 2002:a5b:5d2:0:b0:dfa:cd4a:b3aa with SMTP id
 3f1490d57ef6-dfe691067efmr4261141276.56.1718271253175; Thu, 13 Jun 2024
 02:34:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net> <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
 <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
In-Reply-To: <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 13 Jun 2024 11:34:02 +0200
X-Gmail-Original-Message-ID: <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com>
Message-ID: <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com>
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

On Thu, Jun 13, 2024 at 11:24=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.ne=
t> wrote:
>
> On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> >
> > Hi,
> >
> > On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
> > > IOMMUs with multiple base addresses can also have multiple power
> > > domains.
> > >
> > > The base framework only takes care of a single power domain, as some
> > > devices will need for these power domains to be powered on in a speci=
fic
> > > order.
> > >
> > > Use a helper function to stablish links in the order in which they ar=
e
> > > in the DT.
> > >
> > > This is needed by the IOMMU used by the NPU in the RK3588.
> > >
> > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > ---
> >
> > To me it looks like this is multiple IOMMUs, which should each get
> > their own node. I don't see a good reason for merging these
> > together.
>
> I have made quite a few attempts at splitting the IOMMUs and also the
> cores, but I wasn't able to get things working stably. The TRM is
> really scant about how the 4 IOMMU instances relate to each other, and
> what the fourth one is for.
>
> Given that the vendor driver treats them as a single IOMMU with four
> instances and we don't have any information on them, I resigned myself
> to just have them as a single device.
>
> I would love to be proved wrong though and find a way fo getting
> things stably as different devices so they can be powered on and off
> as needed. We could save quite some code as well.

FWIW, here a few ways how I tried to structure the DT nodes, none of
these worked reliably:

https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-devi=
ces-power/arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1163
https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-schema-subnod=
es//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1162
https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-devi=
ces//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1163
https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-iomm=
us//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L2669

I can very well imagine I missed some way of getting this to work, but
for every attempt, the domains, iommus and cores were resumed in
different orders that presumably caused problems during concurrent
execution fo workloads.

So I fell back to what the vendor driver does, which works reliably
(but all cores have to be powered on at the same time).

Thanks,

Tomeu

> > I will still review this assuming there is one. That would require
> > to first of all update the DT binding:
> >
> > Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> >
> > 1. It does not allow using "power-domain-names" property
> > 2. It limits the number of allowed power-domains to 1
> > 3. It limits the number of allowed base addresses to 2
> >
> > Looking at the DT patch you also add more interrupts and clocks,
> > which are also limited by the binding. You should see a bunch of
> > warnings when you check the DTBS via 'make dtbs_check'
>
> Oops, yeah, I was limiting dtbs_check with DT_SCHEMA_FILES, now I see
> the errors.
>
> > >  drivers/iommu/rockchip-iommu.c | 36 ++++++++++++++++++++++++++++++++=
++++
> > >  1 file changed, 36 insertions(+)
> > >
> > > diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-=
iommu.c
> > > index f5629515bd78..673b0ebb6262 100644
> > > --- a/drivers/iommu/rockchip-iommu.c
> > > +++ b/drivers/iommu/rockchip-iommu.c
> > > @@ -6,6 +6,8 @@
> > >   *                   Daniel Kurtz <djkurtz@chromium.org>
> > >   */
> > >
> > > +#include "linux/err.h"
> > > +#include "linux/pm_domain.h"
> > >  #include <linux/clk.h>
> > >  #include <linux/compiler.h>
> > >  #include <linux/delay.h>
> > > @@ -115,6 +117,7 @@ struct rk_iommu {
> > >       struct iommu_device iommu;
> > >       struct list_head node; /* entry in rk_iommu_domain.iommus */
> > >       struct iommu_domain *domain; /* domain to which iommu is attach=
ed */
> > > +     struct dev_pm_domain_list *pmdomains;
> > >  };
> > >
> > >  struct rk_iommudata {
> > > @@ -1186,6 +1189,7 @@ static int rk_iommu_probe(struct platform_devic=
e *pdev)
> > >       struct resource *res;
> > >       const struct rk_iommu_ops *ops;
> > >       int num_res =3D pdev->num_resources;
> > > +     int pm_domain_count;
> > >       int err, i;
> > >
> > >       iommu =3D devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
> > > @@ -1271,6 +1275,35 @@ static int rk_iommu_probe(struct platform_devi=
ce *pdev)
> > >       if (!dma_dev)
> > >               dma_dev =3D &pdev->dev;
> > >
> > > +     pm_domain_count =3D of_property_count_strings(iommu->dev->of_no=
de, "power-domain-names");
> >
> > pm_domain_count =3D device_property_string_array_count(iommu->dev, "pow=
er-domain-names");
> >
> > When possible using device_property_ is prefered, since it allows
> > reusing code for systems not using DT.
> >
> > > +     if (pm_domain_count > 0) {
> > > +             const char **pm_domains =3D kvmalloc_array(pm_domain_co=
unt, sizeof(*pm_domains), GFP_KERNEL);
> > > +             struct dev_pm_domain_attach_data pm_domain_data =3D {
> > > +                     .pd_names =3D pm_domains,
> > > +                     .num_pd_names =3D pm_domain_count,
> > > +                     .pd_flags =3D PD_FLAG_DEV_LINK_ON,
> > > +             };
> > > +             int i;
> > > +
> > > +             if (!pm_domain_data.pd_names) {
> > > +                     err =3D -ENOMEM;
> > > +                     goto err_remove_sysfs;
> > > +             }
> > > +
> > > +             for (i =3D 0; i < pm_domain_count; i++) {
> > > +                     err =3D of_property_read_string_index(iommu->de=
v->of_node, "power-domain-names", i, &pm_domains[i]);
> > > +                     if (err) {
> > > +                             kfree(pm_domains);
> > > +                             goto err_remove_sysfs;
> > > +                     }
> > > +             }
> >
> > There is a helper to read a string array:
> >
> > err =3D device_property_read_string_array(iommu->dev, "power-domain-nam=
es", pm_domains, pm_domain_count);
>
>
> Thanks for the review,
>
> Tomeu
>
> > -- Sebastian
> >
> > > +
> > > +             err =3D dev_pm_domain_attach_list(iommu->dev, &pm_domai=
n_data, &iommu->pmdomains);
> > > +             kfree(pm_domains);
> > > +             if (err < 0)
> > > +                     goto err_remove_sysfs;
> > > +     }
> > > +
> > >       pm_runtime_enable(dev);
> > >
> > >       for (i =3D 0; i < iommu->num_irq; i++) {
> > > @@ -1292,6 +1325,7 @@ static int rk_iommu_probe(struct platform_devic=
e *pdev)
> > >       return 0;
> > >  err_pm_disable:
> > >       pm_runtime_disable(dev);
> > > +     dev_pm_domain_detach_list(iommu->pmdomains);
> > >  err_remove_sysfs:
> > >       iommu_device_sysfs_remove(&iommu->iommu);
> > >  err_unprepare_clocks:
> > > @@ -1310,6 +1344,8 @@ static void rk_iommu_shutdown(struct platform_d=
evice *pdev)
> > >               devm_free_irq(iommu->dev, irq, iommu);
> > >       }
> > >
> > > +     dev_pm_domain_detach_list(iommu->pmdomains);
> > > +
> > >       pm_runtime_force_suspend(&pdev->dev);
> > >  }
> > >
> > >
> > > --
> > > 2.45.2
> > >
> > >

