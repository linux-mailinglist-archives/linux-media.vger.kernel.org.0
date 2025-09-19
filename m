Return-Path: <linux-media+bounces-42749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13131B884C6
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9CB51C85876
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 07:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1B82FE56B;
	Fri, 19 Sep 2025 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH/WJMHU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1520C2FD7A5
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268701; cv=none; b=uCgKA8dvBDYybVG+YpbFCDGY4m9fIu2MGtGH0aIIkIr6OeGnFuak7HzCA0u8hPC5W68JzKYaxjwjeEve1S39e1zXYL6WyxyFx0qG0KVLULH4oehfe/pTwFX0lmZrfn67WQGolJTxNZwsYDnKvL5hI7gm09MEtvruY2HhjZu8i64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268701; c=relaxed/simple;
	bh=L0yXECtg7eSfyO0a7TPST1Aow/CfDQdxq/Yj0Y/taqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXy+s39v0Y+lUaGZi6+ew7TcLkBScQtIyGfhRslUzxgZqqUXOrO4fgOi5CoAzY0/TDtsnthElBbsV5w4RoNVSTOEg7IrqOYteyx+YQlJRQfrjMCIb0CpT5PT0yBj7Qo4q1cYrY5SMOx7Az/LSmGAy2CRMyC4CQVBKVTJppael04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH/WJMHU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso13665765e9.2
        for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 00:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758268696; x=1758873496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=splF+8JlyOtgaVr9dc9noPOlUZyomVcWNQU3cuIJgKU=;
        b=nH/WJMHUZNyDaHp7VfEqOesL+AQhM4nIim8YGYppdl/y7/89G4pMLkEBr4ho52X7qu
         gl73LJqkawcfI91Jt54Y0snv/ibkT43Sgeugmld6MToLMzZOft/Z1/NTRup7bMQQzPWi
         b25ZX45KNJvPwE0KRqABP+YCnh30Kjt1PN2Uqk1/9WaP7ZWStn7rROdVnkzIkQ4dKOAX
         7S/2MbXBX8caC3Um6dn38tQhx0rIawFtJKw0r9jtuQnwDuBybjLluyqC0MRAmzATGHRT
         q5/XBqwKtp0KPrAgWqZhDtS1C7oqE9Dj7r5wt1owHZlV+bCC85kmQ0Am/0DNBS4Lgi58
         6Qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268696; x=1758873496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=splF+8JlyOtgaVr9dc9noPOlUZyomVcWNQU3cuIJgKU=;
        b=LVZ85RyQ7G18H618Vsfhj7ia2LjTgvLQmqePPRggO4+P/U8zJFAbAGLDIZSG6iapM7
         3MyzY3zT5Nq2g8XL/dRxylRQWp+bKCtFQw/CtJH/JYqXRq/nMy82jy9juz+ywgE5vvd+
         YKGGwC9StGB4yOWRcA6IIixIGIoc4ef59d4kZjepU28o+vCcg8LvOZquLqTWKxzqGkqX
         Iy27u/E5R1NiSmkF/6nxrVELVZwp2QZy++XDWuaXQsfuOylbuffePkF/RFmNos/4eF2e
         S5hwW8z1PWhtNiolniOqvAL18RvNsB4pFGfaGdOHvsIDR7ckmetOrA2MAkYYowffJzsL
         bcNA==
X-Forwarded-Encrypted: i=1; AJvYcCWqf5riOPvwdjDrWtY2aXfkBhvK7OFZ24S24y2kOKhtOLycUB1CwD7thFCraYbtcCfeHii4eHnlVbL0xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5Co3UiKWl28jl2Sh4BqJWy9TGGvZahO1ro8jEZ7Eo4GK0mxO
	U8uMbbN8dN8pLuaBKO2eTwBrHsOp3rRp579NTwaWuui9yPqA8Xf7rq/CVCxVkaN+QtJHPvdRb4l
	dGibEzJK8NWXdNdojeYOnqZrXodHnR8k=
X-Gm-Gg: ASbGncsb5UFsa0AFcoOCA1BEGb10JiRGKdqVN6u2PfUPlmTa6jnUjYsvEHBX0SFi0LX
	sJnhVIMfMecL4P7iy+9tkJ+Ebeut5dRO61HuKa+NMNQyFBYSSb1h7QgaQjwBsaAhc1xPoLy/ssl
	yreZKwqldEKMRHqK8nU9Jj6W5kjHW+nCMaxeaMiP9Z2lwVpMR+8B+TnsalXhHXL+YwtZiBobQmg
	wWqDfap
X-Google-Smtp-Source: AGHT+IHppvRGOigsb83+csm47sXpTHqrPSMQZfRTamYHWe7WmHrKSq19JNVz1P8bdI7gcaP501nlOyxD1WZiEO9qsDo=
X-Received: by 2002:a05:600c:a4c:b0:45f:2c7c:c1ed with SMTP id
 5b1f17b1804b1-467ebe9db02mr17555735e9.2.1758268695912; Fri, 19 Sep 2025
 00:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-10-clamor95@gmail.com>
 <4792993.1IzOArtZ34@senjougahara>
In-Reply-To: <4792993.1IzOArtZ34@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 19 Sep 2025 10:58:04 +0300
X-Gm-Features: AS18NWAXr1wNXHHzdM2gbB4uz2mpmdR1MF94EvKfyDbqthbpxnE_0eGctbJvCYQ
Message-ID: <CAPVz0n2BpSeZkoT1YV9q5bkOCkjSvOwAXNVGgM4wPUqV3jyxgg@mail.gmail.com>
Subject: Re: [PATCH v2 09/23] gpu: host1x: convert MIPI to use operations
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 19 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:47 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> > This commit converts the existing MIPI code to use operations, which is=
 a
> > necessary step for the Tegra20/Tegra30 SoCs. Additionally, it creates a
> > dedicated header file, tegra-mipi-cal.h, to contain the MIPI calibratio=
n
> > functions, improving code organization and readability.
>
> I'd write out "operation function pointers", at least the first time. Jus=
t "operations" isn't clear to me.
>
> Please write the commit message in imperative mood (like you've done in o=
ther patches).
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dsi.c             |   1 +
> >  drivers/gpu/host1x/mipi.c               |  40 +++------
> >  drivers/staging/media/tegra-video/csi.c |   1 +
> >  include/linux/host1x.h                  |  10 ---
> >  include/linux/tegra-mipi-cal.h          | 111 ++++++++++++++++++++++++
> >  5 files changed, 126 insertions(+), 37 deletions(-)
> >  create mode 100644 include/linux/tegra-mipi-cal.h
> >
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 64f12a85a9dd..278bf2c85524 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/reset.h>
> > +#include <linux/tegra-mipi-cal.h>
> >
> >  #include <video/mipi_display.h>
> >
> > diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> > index e51b43dd15a3..2fa339a428f3 100644
> > --- a/drivers/gpu/host1x/mipi.c
> > +++ b/drivers/gpu/host1x/mipi.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> > +#include <linux/tegra-mipi-cal.h>
> >
> >  #include "dev.h"
> >
> > @@ -116,23 +117,6 @@ struct tegra_mipi_soc {
> >       u8 hsclkpuos;
> >  };
> >
> > -struct tegra_mipi {
> > -     const struct tegra_mipi_soc *soc;
> > -     struct device *dev;
> > -     void __iomem *regs;
> > -     struct mutex lock;
> > -     struct clk *clk;
> > -
> > -     unsigned long usage_count;
> > -};
> > -
> > -struct tegra_mipi_device {
> > -     struct platform_device *pdev;
> > -     struct tegra_mipi *mipi;
> > -     struct device *device;
> > -     unsigned long pads;
> > -};
> > -
> >  static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
> >                                  unsigned long offset)
> >  {
> > @@ -261,7 +245,7 @@ void tegra_mipi_free(struct tegra_mipi_device *devi=
ce)
> >  }
> >  EXPORT_SYMBOL(tegra_mipi_free);
> >
> > -int tegra_mipi_enable(struct tegra_mipi_device *dev)
> > +static int tegra114_mipi_enable(struct tegra_mipi_device *dev)
> >  {
> >       int err =3D 0;
> >
> > @@ -273,11 +257,9 @@ int tegra_mipi_enable(struct tegra_mipi_device *de=
v)
> >       mutex_unlock(&dev->mipi->lock);
> >
> >       return err;
> > -
> >  }
> > -EXPORT_SYMBOL(tegra_mipi_enable);
> >
> > -int tegra_mipi_disable(struct tegra_mipi_device *dev)
> > +static int tegra114_mipi_disable(struct tegra_mipi_device *dev)
> >  {
> >       int err =3D 0;
> >
> > @@ -289,11 +271,9 @@ int tegra_mipi_disable(struct tegra_mipi_device *d=
ev)
> >       mutex_unlock(&dev->mipi->lock);
> >
> >       return err;
> > -
> >  }
> > -EXPORT_SYMBOL(tegra_mipi_disable);
> >
> > -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> > +static int tegra114_mipi_finish_calibration(struct tegra_mipi_device *=
device)
> >  {
> >       struct tegra_mipi *mipi =3D device->mipi;
> >       void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
> > @@ -309,9 +289,8 @@ int tegra_mipi_finish_calibration(struct tegra_mipi=
_device *device)
> >
> >       return err;
> >  }
> > -EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> >
> > -int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
> > +static int tegra114_mipi_start_calibration(struct tegra_mipi_device *d=
evice)
> >  {
> >       const struct tegra_mipi_soc *soc =3D device->mipi->soc;
> >       unsigned int i;
> > @@ -384,7 +363,13 @@ int tegra_mipi_start_calibration(struct tegra_mipi=
_device *device)
> >
> >       return 0;
> >  }
> > -EXPORT_SYMBOL(tegra_mipi_start_calibration);
> > +
> > +static const struct tegra_mipi_ops tegra114_mipi_ops =3D {
> > +     .tegra_mipi_enable =3D tegra114_mipi_enable,
> > +     .tegra_mipi_disable =3D tegra114_mipi_disable,
> > +     .tegra_mipi_start_calibration =3D tegra114_mipi_start_calibration=
,
> > +     .tegra_mipi_finish_calibration =3D tegra114_mipi_finish_calibrati=
on,
> > +};
> >
> >  static const struct tegra_mipi_pad tegra114_mipi_pads[] =3D {
> >       { .data =3D MIPI_CAL_CONFIG_CSIA },
> > @@ -512,6 +497,7 @@ static int tegra_mipi_probe(struct platform_device =
*pdev)
> >
> >       mipi->soc =3D match->data;
> >       mipi->dev =3D &pdev->dev;
> > +     mipi->ops =3D &tegra114_mipi_ops;
> >
> >       mipi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, NU=
LL);
> >       if (IS_ERR(mipi->regs))
> > diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/=
media/tegra-video/csi.c
> > index 74c92db1032f..9e3bd6109781 100644
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/tegra-mipi-cal.h>
> >
> >  #include <media/v4l2-fwnode.h>
> >
> > diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> > index 9fa9c30a34e6..b1c6514859d3 100644
> > --- a/include/linux/host1x.h
> > +++ b/include/linux/host1x.h
> > @@ -453,16 +453,6 @@ void host1x_client_unregister(struct host1x_client=
 *client);
> >  int host1x_client_suspend(struct host1x_client *client);
> >  int host1x_client_resume(struct host1x_client *client);
> >
> > -struct tegra_mipi_device;
> > -
> > -struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> > -                                          struct device_node *np);
> > -void tegra_mipi_free(struct tegra_mipi_device *device);
> > -int tegra_mipi_enable(struct tegra_mipi_device *device);
> > -int tegra_mipi_disable(struct tegra_mipi_device *device);
> > -int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> > -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> > -
> >  /* host1x memory contexts */
> >
> >  struct host1x_memory_context {
> > diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-=
cal.h
> > new file mode 100644
> > index 000000000000..2bfdbfd3cb77
> > --- /dev/null
> > +++ b/include/linux/tegra-mipi-cal.h
> > @@ -0,0 +1,111 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef __TEGRA_MIPI_CAL_H_
> > +#define __TEGRA_MIPI_CAL_H_
> > +
> > +struct tegra_mipi {
> > +     const struct tegra_mipi_soc *soc;
> > +     const struct tegra_mipi_ops *ops;
> > +     struct device *dev;
> > +     void __iomem *regs;
> > +     struct mutex lock;
> > +     struct clk *clk;
> > +
> > +     unsigned long usage_count;
> > +};
> > +
> > +struct tegra_mipi_device {
> > +     struct platform_device *pdev;
> > +     struct tegra_mipi *mipi;
> > +     struct device *device;
> > +     unsigned long pads;
> > +};
>
> We should avoid putting implementation details / chip-specific things in =
the public header. Here's a sketch of what I'm thinking about:
>
> --- tegra-mipi-cal.h:
>
> struct tegra_mipi_device;
>
> struct tegra_mipi_ops {
>         // ...
> };
>
> int tegra_mipi_add_provider(struct device_node *np, struct tegra_mipi_ops=
 *ops);
>
> int tegra_mipi_enable(...);
> // ...
>
> --- host1x/mipi.c:
>
> // move tegra114-mipi specific stuff to a new file, e.g. host1x/tegra114-=
mipi.c
>
> struct tegra_mipi_device {
>         struct tegra_mipi_ops *ops;
>         struct platform_device *pdev;
> };
>
> /* only need to support one provider */
> static struct {
>         struct device_node *np;
>         struct tegra_mipi_ops *ops;
> } provider;
>
> int tegra_mipi_add_provider(struct device_node *np, struct tegra_mipi_ops=
 *ops)
> {
>         if (provider.np)
>                 return -EBUSY;
>
>         provider.np =3D np;
>         provider.ops =3D ops;
>
>         return 0;
> }
>
> struct tegra_mipi_device *tegra_mipi_request(struct *device, struct devic=
e_node *np)
> {
>         struct device_node *phandle_np =3D /* ... */;
>         struct platform_device *pdev;
>         struct tegra_mipi_device *mipidev;
>
>         if (provider.np !=3D phandle_np)
>                 return -ENODEV;
>
>         pdev =3D /* ... */;
>
>         mipidev =3D kzalloc(...);
>         mipidev->ops =3D provider.ops;
>         mipidev->pdev =3D pdev;
>         mipidev->cells =3D phandle_cells;
>
>         return mipidev;
> }
>
> int tegra_mipi_enable(struct tegra_mipi_device *device)
> {
>         return device->ops->enable(platform_get_drvdata(device->pdev), de=
vice->cells);
> }
>
> > +
> > +/**
> > + * Operations for Tegra MIPI calibration device
> > + */
> > +struct tegra_mipi_ops {
> > +     /**
> > +      * @tegra_mipi_enable:
> > +      *
> > +      * Enable MIPI calibration device
> > +      */
> > +     int (*tegra_mipi_enable)(struct tegra_mipi_device *device);
>
> The tegra_mipi_ prefix should be dropped for the field names.
>
> > +
> > +     /**
> > +      * @tegra_mipi_disable:
> > +      *
> > +      * Disable MIPI calibration device
> > +      */
> > +     int (*tegra_mipi_disable)(struct tegra_mipi_device *device);
> > +
> > +     /**
> > +      * @tegra_mipi_start_calibration:
> > +      *
> > +      * Start MIPI calibration
> > +      */
> > +     int (*tegra_mipi_start_calibration)(struct tegra_mipi_device *dev=
ice);
> > +
> > +     /**
> > +      * @tegra_mipi_finish_calibration:
> > +      *
> > +      * Finish MIPI calibration
> > +      */
> > +     int (*tegra_mipi_finish_calibration)(struct tegra_mipi_device *de=
vice);
> > +};
> > +
> > +struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> > +                                          struct device_node *np);
> > +
> > +void tegra_mipi_free(struct tegra_mipi_device *device);
> > +
> > +static inline int tegra_mipi_enable(struct tegra_mipi_device *device)
> > +{
> > +     /* Tegra114+ has a dedicated MIPI calibration block */
> > +     if (device->mipi) {
> > +             if (!device->mipi->ops->tegra_mipi_enable)
> > +                     return 0;
> > +
> > +             return device->mipi->ops->tegra_mipi_enable(device);
> > +     }
> > +
> > +     return -ENOSYS;
> > +}
> > +
> > +static inline int tegra_mipi_disable(struct tegra_mipi_device *device)
> > +{
> > +     if (device->mipi) {
> > +             if (!device->mipi->ops->tegra_mipi_disable)
> > +                     return 0;
> > +
> > +             return device->mipi->ops->tegra_mipi_disable(device);
> > +     }
> > +
> > +     return -ENOSYS;
> > +}
> > +
> > +static inline int tegra_mipi_start_calibration(struct tegra_mipi_devic=
e *device)
> > +{
> > +     if (device->mipi) {
> > +             if (!device->mipi->ops->tegra_mipi_start_calibration)
> > +                     return 0;
> > +
> > +             return device->mipi->ops->tegra_mipi_start_calibration(de=
vice);
> > +     }
> > +
> > +     return -ENOSYS;
> > +}
> > +
> > +static inline int tegra_mipi_finish_calibration(struct tegra_mipi_devi=
ce *device)
> > +{
> > +     if (device->mipi) {
> > +             if (!device->mipi->ops->tegra_mipi_finish_calibration)
> > +                     return 0;
> > +
> > +             return device->mipi->ops->tegra_mipi_finish_calibration(d=
evice);
> > +     }
> > +
> > +     return -ENOSYS;
> > +}
> > +
> > +#endif /* __TEGRA_MIPI_CAL_H_ */
> >
>

All this is good, but how to include into this CSI? Adding support for
CSI is why I am even touching this at the first place.

