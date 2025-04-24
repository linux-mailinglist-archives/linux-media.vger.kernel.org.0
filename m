Return-Path: <linux-media+bounces-30960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B947A9B580
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 19:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 178ED9A56A0
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 17:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A801A28E610;
	Thu, 24 Apr 2025 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="t4ysj2Nx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D4028B50F
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516217; cv=none; b=UKFAB80cQ+kh+J7WESQwtdXt3w0N4fCKUEva5ErkIZli3brBy3s06PWzxpPeyLvA7f1PL0NzmuLBJEwpTfod8CE5gxEDGzPU6XciAUeV4eXiz0RmUFGx7lycgAkNY/FgUMFP5aM7ZglbDDJ9w7BnsxOB1YS49o1hyVAs/PcTUgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516217; c=relaxed/simple;
	bh=SMTXyGDeO4nFInITYks/8RR/pYxErgXa1RZIXvXYVqM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MHXk7sdqoKpZ1vrmLWS5AbDaVCWPlOgKD7bdvwk5gN0jIhM0gJ7hXF8IztOfNJpF/W5CY1hBpAGNdcXhUyF2GoP6tKHihX0Oq6IAEI3Fml4Zg/ftA7EzC5R5CoZHRawyKdvgorgxYxZ5YqrFxGwymtW0jG+lY1IfzvLF4EnbKdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=t4ysj2Nx; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c55500d08cso139906185a.0
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745516213; x=1746121013; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8WdJExOPKTGfO8MVm6X3x6wEggadu/3FyjOUCCkMW44=;
        b=t4ysj2NxybIJ6D5KFvi8x0H8s8omHlNndhXay2NEWGXIgucmoX6kaWw5JA3KgEAMPc
         doT3TjQf97eSHoXp7zr/qfgDBmrbipNrtCaFjcUXaYVaEQmMu8hMrfpK9O5hIgHBmveg
         qB6/7hzSoQiD+X5VwGogUQCUcMJ90jBUSEGC58wDbDMa1sA7dz2gnf2LXm1Owo25SK8Y
         FUfKGQjjNrN2xRjMdbhng+204bKf5MHLmmvMp8JApzjMCqywb/u28hRyGoj5sA2Vo9mi
         lrhnD4mRncrXtw44lxfnVwcLMRmSYoIZmVF3aOYELdHQn16nFtq0F0n6tb8hShWKKvWB
         yCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516213; x=1746121013;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WdJExOPKTGfO8MVm6X3x6wEggadu/3FyjOUCCkMW44=;
        b=mD/0XUaQpnhLkvkUOGX/yNV2/JmS2Alsz53vXYQ4aEIm50cUN/P1BuMWxgWYSjNGMa
         ainGBxb8uACx4hAbw21RuGv9+zs/+51myZwTMbdgrxKa6awqNbt9Uz4XUbtW+wGcQf/I
         /q3G51plb226ASNnBnTKrhJSBKYY9D0uAvlkwuNo9Zcfd84PneMve7ZW/ERHW76JVdJm
         yOFxCJ3BvufECzMNF8xgK3TADcsuZM+lUUcwt/Bmh89jT7mBi2VW47B2f/BBxUKL+c89
         iLV0RHYoQ95MlP2bOFuPtxxZBYIH1UUA7KTCn4ELf/EYMGkSEtkk/kAIy7BG92ybfqXd
         HZ5g==
X-Gm-Message-State: AOJu0Yz7tf1sgYaZDfOsrK2NqyObc/MqUU4rRfdmgq2qCciSdN97+T+O
	I/GaaQzpnkhBvdHZJvXpM3eKpRQrLS+3SbUp2RUvsh3l3H6n19G307qae0NRxGQ=
X-Gm-Gg: ASbGncsdF32U3tDJumL3tKKCk2aUtBNycs+bpg4H5UL1yblC3kw3soGegHLN6mUv+77
	SPoP8vMhrOmyzWwIxoH5h/rKyG8xW3hbwJGKLdiFP2utL+odCID8xRiL4hhQhpQbnuOfvDkMliV
	Jumoc/6HQ/d9Qp3KPJ6fIV6eiuck/dEm4zo+RefokdfKlNsqEW58CzaIx07lDdksOQIRGCsL61n
	ceRCX7+o94rjN9fY10SC7JrfiQu16Vr0BRy3fnDl/Yno9uySh4xcjbdrmEZb2/NqktrY9qi52zV
	G+/3fYZY06XGKHDBOUhJ2C5reQ1SusC3WurSkHIKQgiWWA==
X-Google-Smtp-Source: AGHT+IHDHiJyYPwZO332hvnKTbwh2VjZVYH3h9ee9D8uHI7ykr5z5wILllHPUCM9JryYxoDEJmkwbA==
X-Received: by 2002:a05:620a:319e:b0:7c5:5296:55ba with SMTP id af79cd13be357-7c956ee2645mr593547585a.13.1745516213438;
        Thu, 24 Apr 2025 10:36:53 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ce3cf6sm113261485a.64.2025.04.24.10.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:36:52 -0700 (PDT)
Message-ID: <f5778b751ee5044d5e3448a77032ff020d63994b.camel@ndufresne.ca>
Subject: Re: [PATCH v2 3/8] media: chips-media: wave6: Add Wave6 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-imx@nxp.com, marex@denx.de, 
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com, Ming Qian
	 <ming.qian@oss.nxp.com>
Date: Thu, 24 Apr 2025 13:36:51 -0400
In-Reply-To: <20250422093119.595-4-nas.chung@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
	 <20250422093119.595-4-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 22 avril 2025 =C3=A0 18:31 +0900, Nas Chung a =C3=A9crit=C2=A0:
> This adds the main driver for the Chips&Media Wave6 video codec IP.
>=20
> On NXP i.MX platforms, the Wave6 consists of two functional regions:
> a control region responsible for firmware and shared resources,
> and a core region for encoding and decoding.
>=20
> This driver binds the `wave6-ctrl` and `wave6-core` sub-devices,
> and coordinates their initialization and teardown.
>=20
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/chips-media/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/chips-media/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0.../media/platform/chips-media/wave6/Kconfig=C2=A0 |=C2=A0 24 +
> =C2=A0.../media/platform/chips-media/wave6/Makefile |=C2=A0=C2=A0 4 +
> =C2=A0.../platform/chips-media/wave6/wave6-vpu.c=C2=A0=C2=A0=C2=A0 | 469 =
++++++++++++++++++
> =C2=A0.../platform/chips-media/wave6/wave6-vpu.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 85 ++++
> =C2=A07 files changed, 585 insertions(+)
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/Makefil=
e
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
pu.c
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
pu.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6ca159e532e7..4fc54c824f65 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25529,6 +25529,7 @@ M:	Jackson Lee <jackson.lee@chipsnmedia.com>
> =C2=A0L:	linux-media@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/media/cnm,wave633c.yaml
> +F:	drivers/media/platform/chips-media/wave6/
> =C2=A0
> =C2=A0WHISKEYCOVE PMIC GPIO DRIVER
> =C2=A0M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.int=
el.com>
> diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/p=
latform/chips-media/Kconfig
> index ad350eb6b1fc..8ef7fc8029a4 100644
> --- a/drivers/media/platform/chips-media/Kconfig
> +++ b/drivers/media/platform/chips-media/Kconfig
> @@ -4,3 +4,4 @@ comment "Chips&Media media platform drivers"
> =C2=A0
> =C2=A0source "drivers/media/platform/chips-media/coda/Kconfig"
> =C2=A0source "drivers/media/platform/chips-media/wave5/Kconfig"
> +source "drivers/media/platform/chips-media/wave6/Kconfig"
> diff --git a/drivers/media/platform/chips-media/Makefile b/drivers/media/=
platform/chips-media/Makefile
> index 6b5d99de8b54..b9a07a91c9d6 100644
> --- a/drivers/media/platform/chips-media/Makefile
> +++ b/drivers/media/platform/chips-media/Makefile
> @@ -2,3 +2,4 @@
> =C2=A0
> =C2=A0obj-y +=3D coda/
> =C2=A0obj-y +=3D wave5/
> +obj-y +=3D wave6/
> diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/m=
edia/platform/chips-media/wave6/Kconfig
> new file mode 100644
> index 000000000000..3d7369ca690c
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/Kconfig
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_WAVE6_VPU
> +	tristate "Chips&Media Wave6 Codec Driver"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on VIDEO_DEV && OF
> +	depends on ARCH_MXC || COMPILE_TEST
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	select GENERIC_ALLOCATOR
> +	help
> +	=C2=A0 Chips&Media Wave6 stateful codec driver.
> +	=C2=A0 The codec driver provides encoding and decoding capabilities
> +	=C2=A0 for H.264, HEVC, and other video formats.
> +	=C2=A0 To compile this driver as modules, choose M here: the
> +	=C2=A0 modules will be called wave6.
> +
> +config VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER
> +	bool "Support Wave6 VPU follower"
> +	depends on VIDEO_WAVE6_VPU
> +	depends on ARCH_MXC || COMPILE_TEST
> +	default n
> +	help
> +	=C2=A0 Indicates whether the VPU domain power always on.
                                               >is< ?

This configuration is pretty vague to me. Do we really need that ?
Isn't there other ways to disable PM runtime ? If unsure, just remove
that, and we can discuss separately.

> diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/=
media/platform/chips-media/wave6/Makefile
> new file mode 100644
> index 000000000000..255fc90bc642
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +wave6-objs +=3D wave6-vpu.o
> +obj-$(CONFIG_VIDEO_WAVE6_VPU) +=3D wave6.o
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drive=
rs/media/platform/chips-media/wave6/wave6-vpu.c
> new file mode 100644
> index 000000000000..5d0c093a9cc5
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
> @@ -0,0 +1,469 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)

nit: Its first time I notice, wave5 is like this too, but what the
purpose of BDS-3-Clause here ? This driver can't possibly be used
outside of Linux, and when loaded inside Linux, GPL is the only valid
choice as far as I know.

> +/*
> + * Wave6 series multi-standard codec IP - wave6 driver
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/pm_runtime.h>
> +#include "wave6-vpu.h"
> +
> +#define VPU_PLATFORM_DEVICE_NAME "wave6-vpu"
> +#define VPU_CLK_NAME "vpu"
> +
> +#define WAVE6_VPU_FLAG_SLEEP	BIT(0)
> +#define WAVE6_VPU_FLAG_WAKEUP	BIT(1)

Mind aligning these ?

> +
> +/**
> + * wave6_alloc_dma - Allocate DMA memory
> + * @dev: device pointer
> + * @vb: VPU buffer structure
> + *
> + * Allocates a contiguous DMA memory region for VPU usage.
> + * The allocated memory information is stored in the given
> + * @vb structure.
> + *
> + * Return: 0 on success, -EINVAL for invalid arguments, -ENOMEM on failu=
re
> + */
> +int wave6_alloc_dma(struct device *dev, struct vpu_buf *vb)
> +{
> +	void *vaddr;
> +	dma_addr_t daddr;
> +
> +	if (!vb || !vb->size)
> +		return -EINVAL;
> +
> +	vaddr =3D dma_alloc_coherent(dev, vb->size, &daddr, GFP_KERNEL);
> +	if (!vaddr)
> +		return -ENOMEM;
> +
> +	vb->vaddr =3D vaddr;
> +	vb->daddr =3D daddr;
> +	vb->dev =3D dev;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(wave6_alloc_dma);

Also to emphasis the clash with dual license.

> +
> +/**
> + * wave6_free_dma - Free DMA memory
> + * @vb: VPU buffer structure
> + *
> + * Frees the DMA memory previously allocated by wave6_alloc_dma().
> + * @vb structure is also cleared to zero.
> + */
> +void wave6_free_dma(struct vpu_buf *vb)
> +{
> +	if (!vb || !vb->size || !vb->vaddr)
> +		return;
> +
> +	dma_free_coherent(vb->dev, vb->size, vb->vaddr, vb->daddr);
> +	memset(vb, 0, sizeof(*vb));
> +}
> +EXPORT_SYMBOL_GPL(wave6_free_dma);
> +
> +static int wave6_check_entity(struct wave6_vpu_device *vpu,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct wave6_vpu_entity *entity)

When I read code below, I don't see what wave6_check_entity() does. You
should rename this, perhaps it means "wave6_valid_entity()" ?

Its also not obvious to me in which normal condition you will hold a
ref to an entity that is no longer valid. I'd ask here, can this fail
without a programming error ? And in which case, if its a programming
error, a WARN_ON would likely be a good idea.

> +{
> +	if (!entity || !entity->vpu || !vpu || entity->vpu !=3D vpu->dev)
> +		return -EINVAL;
> +	if (entity->index < 0 || entity->index >=3D WAVE6_VPU_MAXIMUM_ENTITY_CN=
T)
> +		return -EINVAL;
> +	if (entity !=3D vpu->entities[entity->index])
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static unsigned long wave6_vpu_get_clk_rate(struct wave6_vpu_device *vpu=
)
> +{
> +	unsigned long rate =3D 0;
> +	int i;
> +
> +	mutex_lock(&vpu->lock);
> +
> +	for (i =3D 0; i < vpu->num_clks; i++) {
> +		if (vpu->clks[i].id && !strcmp(vpu->clks[i].id, VPU_CLK_NAME))
> +			rate =3D clk_get_rate(vpu->clks[i].clk);
> +	}
> +
> +	mutex_unlock(&vpu->lock);
> +	return rate;
> +}
> +
> +static int __wave6_vpu_get(struct wave6_vpu_device *vpu,
> +			=C2=A0=C2=A0 struct wave6_vpu_entity *entity)
> +{
> +	int ret;

Would be nice to add:

	lockdep_assert_held(&vpu->lock);

> +
> +	if (atomic_inc_return(&vpu->ref_count) > 1)
> +		return 0;
> +
> +	ret =3D pm_runtime_resume_and_get(vpu->dev);
> +	if (ret) {
> +		dev_err(vpu->dev, "pm runtime resume fail, ret =3D %d\n", ret);
> +		atomic_dec(&vpu->ref_count);
> +		return -EINVAL;
> +	}
> +
> +	if (vpu->ctrl && vpu->ctrl_ops) {
> +		ret =3D vpu->ctrl_ops->get_ctrl(vpu->ctrl, entity);
> +		if (ret) {
> +			dev_err(vpu->dev, "get ctrl fail, ret =3D %d\n", ret);
> +			pm_runtime_put_sync(vpu->dev);
> +			atomic_dec(&vpu->ref_count);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_get(struct wave6_vpu_device *vpu,
> +			 struct wave6_vpu_entity *entity)
> +{
> +	int ret =3D 0;

Drop.

> +
> +	mutex_lock(&vpu->lock);

Replace with:

	guard(mutex)(&vpu->lock);

> +
> +	if (wave6_check_entity(vpu, entity)) {
> +		ret =3D -EINVAL;
> +		goto unlock;

Then these two lines becomes:

		return -EINVAL;

You won't even need a scope.

> +	}
> +
> +	if (!entity->active)
> +		goto unlock;
		return 0;

> +
> +	ret =3D __wave6_vpu_get(vpu, entity);
> +
> +unlock:
> +	mutex_unlock(&vpu->lock);

Drop the two above lines;

> +	return ret;
	return 0;

> +}
> +
> +static void __wave6_vpu_put(struct wave6_vpu_device *vpu,
> +			=C2=A0=C2=A0=C2=A0 struct wave6_vpu_entity *entity)
> +{
> +	if (atomic_dec_return(&vpu->ref_count) > 0)
> +		return;
> +
> +	if (vpu->ctrl && vpu->ctrl_ops)
> +		vpu->ctrl_ops->put_ctrl(vpu->ctrl, entity);
> +
> +	pm_runtime_put_sync(vpu->dev);
> +}
> +
> +static void wave6_vpu_put(struct wave6_vpu_device *vpu,
> +			=C2=A0 struct wave6_vpu_entity *entity)
> +{
> +	mutex_lock(&vpu->lock);

Same, you should use guard()().

> +
> +	if (wave6_check_entity(vpu, entity))
> +		goto unlock;
> +
> +	if (!entity->active)
> +		goto unlock;
> +
> +	__wave6_vpu_put(vpu, entity);
> +
> +unlock:
> +	mutex_unlock(&vpu->lock);
> +}
> +
> +static void wave6_support_follower(struct wave6_vpu_device *vpu,
> +				=C2=A0=C2=A0 struct wave6_vpu_entity *entity, u32 flag)
> +{

I haven't figure-out what this is about, bare in mind.

> +	struct wave6_vpu_entity *target =3D NULL;
> +	int ret;
> +	int i;

Seems like this needs to be called with lock held:

	lockdep_assert_held(&vpu->lock);

> +
> +	if (!vpu->support_follower)
> +		return;
> +	if (!vpu->ctrl)
> +		return;
> +
> +	if (entity)
> +		target =3D entity;
> +
> +	ret =3D pm_runtime_resume_and_get(vpu->dev);
> +	if (ret) {
> +		dev_warn(vpu->dev, "pm runtime resume fail, ret =3D %d\n", ret);
> +		return;
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(vpu->entities); i++) {
> +		if (!vpu->entities[i])
> +			continue;
> +		if (target && vpu->entities[i] !=3D target)
> +			continue;
> +		if (flag & WAVE6_VPU_FLAG_WAKEUP)
> +			__wave6_vpu_get(vpu, vpu->entities[i]);
> +		if (flag & WAVE6_VPU_FLAG_SLEEP)
> +			__wave6_vpu_put(vpu, vpu->entities[i]);
> +	}
> +
> +	pm_runtime_put_sync(vpu->dev);
> +}
> +
> +static int wave6_find_unused_index(struct wave6_vpu_device *vpu)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(vpu->entities); i++) {
> +		if (!vpu->entities[i])
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static int wave6_register_vpu_core(struct wave6_vpu_device *vpu,
> +				=C2=A0=C2=A0 struct wave6_vpu_entity *entity)
> +{
> +	int ret =3D 0;
> +	int index;
> +
> +	mutex_lock(&vpu->lock);

Also:
	guard(mutex)(&vpu->lock);

> +
> +	if (!entity || !entity->dev) {
> +		ret =3D -EINVAL;
> +		goto unlock;
> +	}
> +
> +	index =3D wave6_find_unused_index(vpu);
> +	if (index < 0 || index >=3D ARRAY_SIZE(vpu->entities)) {

Drop the second condition, its defensive coding, you can trust your
wave6_find_unused_index() helper to return a valid index or -1.

> +		ret =3D -1;
> +		goto unlock;
> +	}
> +
> +	entity->vpu =3D vpu->dev;
> +	entity->index =3D index;
> +	vpu->entities[index] =3D entity;
> +	wave6_support_follower(vpu, entity, WAVE6_VPU_FLAG_WAKEUP);

So this support_follower() actually does wave6_vpu_get()/put(), except
when the build config forces always on. I think if you drop that
config, you can drop that strange function and just use get/put.

I don't have the full portait of when vpu core are registered and when
not. It does give me the strange impression that once a stream is
active, it cannot sleep anymore. I'd like to see some text about the PM
runtime strategies.

> +
> +unlock:
> +	mutex_unlock(&vpu->lock);
> +	return ret;
> +}
> +
> +static void wave6_unregister_vpu_core(struct wave6_vpu_device *vpu,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct wave6_vpu_entity *entity)
> +{
> +	mutex_lock(&vpu->lock);
Also:
	guard(mutex)(&vpu->lock);

> +
> +	if (wave6_check_entity(vpu, entity))
> +		goto unlock;
> +
> +	wave6_support_follower(vpu, entity, WAVE6_VPU_FLAG_SLEEP);
> +	vpu->entities[entity->index] =3D NULL;
> +	entity->vpu =3D NULL;
> +	entity->index =3D -1;
> +
> +unlock:
> +	mutex_unlock(&vpu->lock);
> +}
> +
> +static int wave6_register_vpu_ctrl(struct wave6_vpu_device *vpu,
> +				=C2=A0=C2=A0 struct device *ctrl,
> +				=C2=A0=C2=A0 const struct wave6_vpu_ctrl_ops *ops)
> +{
> +	int ret =3D 0;
> +
> +	mutex_lock(&vpu->lock);

Also:
	guard(mutex)(&vpu->lock);

> +
> +	if (!ctrl || !ops) {

Seems like some WARN_ON would be preferred, you don't expect this to
happen outside of programmer error right ?

> +		ret =3D -EINVAL;
> +		goto unlock;
> +	}
> +
> +	if (vpu->ctrl) {
> +		if (vpu->ctrl !=3D ctrl)
> +			ret =3D -EINVAL;
> +
> +		goto unlock;
> +	}
> +
> +	vpu->ctrl =3D ctrl;
> +	vpu->ctrl_ops =3D ops;
> +	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_WAKEUP);
> +
> +unlock:
> +	mutex_unlock(&vpu->lock);
> +	return ret;
> +}
> +
> +static void wave6_unregister_vpu_ctrl(struct wave6_vpu_device *vpu,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *ctrl)
> +{
> +	mutex_lock(&vpu->lock);
> +
> +	if (vpu->ctrl !=3D ctrl)
> +		goto unlock;
> +
> +	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_SLEEP);
> +	vpu->ctrl =3D NULL;
> +
> +unlock:
> +	mutex_unlock(&vpu->lock);
> +}
> +
> +static void wave6_require_work_buffer(struct wave6_vpu_device *vpu,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct wave6_vpu_entity *entity)
> +{
> +	int ret =3D 0;
> +
> +	mutex_lock(&vpu->lock);

Also:
	guard(mutex)(&vpu->lock);

> +
> +	if (wave6_check_entity(vpu, entity))
> +		goto unlock;
> +
> +	if (!vpu->ctrl || !vpu->ctrl_ops)
> +		goto unlock;
> +
> +	ret =3D vpu->ctrl_ops->require_work_buffer(vpu->ctrl, entity);
> +	if (ret)
> +		dev_warn(vpu->dev, "require_work_buffer fail %d\n", ret);
> +
> +unlock:
> +	mutex_unlock(&vpu->lock);
> +}
> +
> +static const struct wave6_vpu_ops wave6_vpu_ops =3D {
> +	.get_vpu =3D wave6_vpu_get,
> +	.put_vpu =3D wave6_vpu_put,
> +	.reg_core =3D wave6_register_vpu_core,
> +	.unreg_core =3D wave6_unregister_vpu_core,
> +	.reg_ctrl =3D wave6_register_vpu_ctrl,
> +	.unreg_ctrl =3D wave6_unregister_vpu_ctrl,
> +	.req_work_buffer =3D wave6_require_work_buffer,
> +	.get_clk_rate =3D wave6_vpu_get_clk_rate,
> +};
> +
> +static int wave6_vpu_probe(struct platform_device *pdev)
> +{
> +	struct wave6_vpu_device *vpu;
> +	int ret;
> +
> +	vpu =3D devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
> +	if (!vpu)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&pdev->dev, vpu);
> +	vpu->dev =3D &pdev->dev;
> +	vpu->ops =3D &wave6_vpu_ops;
> +
> +	mutex_init(&vpu->lock);
> +	atomic_set(&vpu->ref_count, 0);
> +
> +	ret =3D devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
> +	if (ret < 0) {
> +		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
> +		ret =3D 0;
> +	}
> +	vpu->num_clks =3D ret;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +#if IS_ENABLED(CONFIG_VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER)
> +	vpu->support_follower =3D true;
> +#endif
> +	if (vpu->support_follower) {

This scope seems unreachable if CONFIG_VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER
is not set, move it inside the ifdef.

> +		ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +		if (ret) {
> +			dev_warn(&pdev->dev, "pm resume fail %d\n", ret);
> +			vpu->support_follower =3D false;

If you couldn't wake the HW now, its unlikely to wake later. Better
cleanup and fail the probe ?

> +		}
> +	}
> +
> +	of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +
> +	return 0;
> +}
> +
> +static void wave6_vpu_remove(struct platform_device *pdev)
> +{
> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(&pdev->dev);
> +
> +	if (vpu->support_follower) {
> +		if (!pm_runtime_suspended(&pdev->dev))
> +			pm_runtime_put_sync(&pdev->dev);
> +
> +		wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_SLEEP);
> +	}
> +
> +	pm_runtime_disable(&pdev->dev);
> +	mutex_destroy(&vpu->lock);
> +}
> +
> +static int __maybe_unused wave6_vpu_runtime_suspend(struct device *dev)
> +{
> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(dev);
> +
> +	if (!vpu->num_clks)
> +		return 0;
> +
> +	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
> +	return 0;
> +}
> +
> +static int __maybe_unused wave6_vpu_runtime_resume(struct device *dev)
> +{
> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(dev);
> +
> +	if (!vpu->num_clks)
> +		return 0;
> +
> +	return clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
> +}
> +
> +static int __maybe_unused wave6_vpu_suspend(struct device *dev)
> +{
> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(dev);
> +
> +	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_SLEEP);

Not sure I like it, its kind of move the ref-count in the air. I don't
have a suggestion atm, but perhaps we can do better.

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused wave6_vpu_resume(struct device *dev)
> +{
> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(dev);
> +
> +	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_WAKEUP);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops wave6_vpu_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(wave6_vpu_runtime_suspend,
> +			=C2=A0=C2=A0 wave6_vpu_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(wave6_vpu_suspend,
> +				wave6_vpu_resume)
> +};
> +
> +static const struct of_device_id wave6_vpu_ids[] =3D {
> +	{ .compatible =3D "nxp,imx95-vpu" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, wave6_vpu_ids);
> +
> +static struct platform_driver wave6_vpu_driver =3D {
> +	.driver =3D {
> +		.name =3D VPU_PLATFORM_DEVICE_NAME,
> +		.of_match_table =3D wave6_vpu_ids,
> +		.pm =3D &wave6_vpu_pm_ops,
> +	},
> +	.probe =3D wave6_vpu_probe,
> +	.remove =3D wave6_vpu_remove,
> +};
> +
> +module_platform_driver(wave6_vpu_driver);
> +MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drive=
rs/media/platform/chips-media/wave6/wave6-vpu.h
> new file mode 100644
> index 000000000000..faa5f8af3191
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - wave6 driver
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#ifndef __WAVE6_VPU_H__
> +#define __WAVE6_VPU_H__
> +
> +#include <linux/device.h>
> +
> +#define WAVE6_VPU_MAXIMUM_ENTITY_CNT	4
> +
> +#define call_vop(vpu, op, args...)					\
> +	((vpu)->ops->op ? (vpu)->ops->op(vpu, ##args) : 0)		\
> +
> +#define call_void_vop(vpu, op, args...)					\
> +	do {								\
> +		if ((vpu)->ops->op)					\
> +			(vpu)->ops->op(vpu, ##args);			\
> +	} while (0)
> +
> +struct vpu_buf {
> +	size_t size;
> +	dma_addr_t daddr;
> +	void *vaddr;
> +	struct device *dev;
> +};
> +
> +struct wave6_vpu_entity {
> +	struct list_head list;
> +	struct device *dev;
> +	struct device *vpu;
> +	u32 (*read_reg)(struct device *dev, u32 addr);
> +	void (*write_reg)(struct device *dev, u32 addr, u32 data);
> +	void (*on_boot)(struct device *dev);
> +	void (*pause)(struct device *dev, int resume);
> +	bool active;
> +	int index;
> +};
> +
> +struct wave6_vpu_ctrl_ops {
> +	int (*get_ctrl)(struct device *ctrl, struct wave6_vpu_entity *entity);
> +	void (*put_ctrl)(struct device *ctrl, struct wave6_vpu_entity *entity);
> +	int (*require_work_buffer)(struct device *ctrl,
> +				=C2=A0=C2=A0 struct wave6_vpu_entity *entity);
> +};
> +
> +struct wave6_vpu_device;
> +
> +struct wave6_vpu_ops {
> +	int (*get_vpu)(struct wave6_vpu_device *vpu,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct wave6_vpu_entity *entity);
> +	void (*put_vpu)(struct wave6_vpu_device *vpu,
> +			struct wave6_vpu_entity *entity);
> +	int (*reg_core)(struct wave6_vpu_device *vpu,
> +			struct wave6_vpu_entity *entity);
> +	void (*unreg_core)(struct wave6_vpu_device *vpu,
> +			=C2=A0=C2=A0 struct wave6_vpu_entity *entity);
> +	int (*reg_ctrl)(struct wave6_vpu_device *vpu, struct device *ctrl,
> +			const struct wave6_vpu_ctrl_ops *ops);
> +	void (*unreg_ctrl)(struct wave6_vpu_device *vpu, struct device *ctrl);
> +	void (*req_work_buffer)(struct wave6_vpu_device *vpu,
> +				struct wave6_vpu_entity *entity);
> +	unsigned long (*get_clk_rate)(struct wave6_vpu_device *vpu);
> +};
> +
> +struct wave6_vpu_device {
> +	struct device *dev;
> +	const struct wave6_vpu_ops *ops;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	struct device *ctrl;
> +	const struct wave6_vpu_ctrl_ops *ctrl_ops;
> +	struct wave6_vpu_entity *entities[WAVE6_VPU_MAXIMUM_ENTITY_CNT];
> +	struct mutex lock; /* the lock for vpu device */
> +	atomic_t ref_count;
> +	bool support_follower;
> +};

All structs could gain having documentation.

Nicolas

> +
> +int wave6_alloc_dma(struct device *dev, struct vpu_buf *vb);
> +void wave6_free_dma(struct vpu_buf *vb);
> +
> +#endif /* __WAVE6_VPU_H__ */

