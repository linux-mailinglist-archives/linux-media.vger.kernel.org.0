Return-Path: <linux-media+bounces-33653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DA7AC8D24
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 529499E36B9
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 11:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E3C22A7F3;
	Fri, 30 May 2025 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="Nn6ZcV6Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC033FC2;
	Fri, 30 May 2025 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748605695; cv=none; b=GzN765mybgcg1v3DuW1/Y4QLwf8EBp2dY9kUnrlRjGBvVNDMAB4dPUiyBzJXg/zMfK0X+zKbO3XDp1eCB8YdrD5TiAiUIo51M/wDAHuzjSk0wa0XvUROtd7NFukITsxy8oImMaXGc2SexDIBiPz6RJe3ciy/k4GQwI1yOquat3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748605695; c=relaxed/simple;
	bh=f/RKIP/2DAU1LSx9UMAovXS7o5oGBrsDmhhuzfgdcqE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cnv2amb6lu4UF/ImFa6le9/JpBEIEG9zZTeNDk0O4QzNsY4D3oEa9474n9IZr5fgrgHYbeb3xbT4en4Il/fN/Ibax798GPKwG/LToIRkFg5cT/7W5oghzC8h4W8eyHqwVGBo1KZ0xNZYpq2mt7NkXRajzy9PLX9Bvs9DDnbEc60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=Nn6ZcV6Z; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1748605684; x=1748864884;
	bh=KaYqYwpWZ5nBZYohxhbwuVhnxqNJsitxSrWc7FqllOI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Nn6ZcV6ZXVYyj0mRzwtgqG+nAUyzrZRj7RhZXPeR5hb672jQ8eg2pT1VGp/ToPY4f
	 W/zSe+wHJFYlNKDqiGXhpSHsfB0Yc6Ln+S9TlTEzJAk1LLLdiXvIhmdl3+98+JpEyf
	 2q/cBNwAu4pqonnW2V/g5prO25KpWLIvIUPNK7q1bQQrRsqUanS7xANj286j8bROvC
	 Ab3t+Rh8HrOCtRF0qy9XZNCsilCKBbdVUTsGj3oqCYbWzfIJwH/UN059PFq1DrkxA0
	 rJHoe83xGuGFDwEkkbBS2FZmCaqtFErxQlbQvjzJR+3W2JXCbej0YIvTI5icrRQxE7
	 yfAH5ExwDEjqQ==
Date: Fri, 30 May 2025 11:48:00 +0000
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, =?utf-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/4] media: qcom: camss: vfe: Add VBIF setting support
Message-ID: <2b1f17f3-da2f-4306-9adf-b0b94fab6641@nxsw.ie>
In-Reply-To: <20250530-camss-8x39-vbif-v3-1-fc91d15bb5d6@mailoo.org>
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org> <20250530-camss-8x39-vbif-v3-1-fc91d15bb5d6@mailoo.org>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: fecc8506b31909872fb03a223c9535668eb5c0c4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/05/2025 10:00, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
>=20
> Some devices need writing values to VFE VBIF registers.
> Add helper functions to do this.
>=20
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |  1 +
>   drivers/media/platform/qcom/camss/camss-vfe-4-1.c  | 12 +++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe-vbif.c | 25 +++++++++++++++=
+++++++
>   drivers/media/platform/qcom/camss/camss-vfe-vbif.h | 19 +++++++++++++++=
+
>   drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.h      |  3 +++
>   6 files changed, 69 insertions(+)
>=20
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/p=
latform/qcom/camss/Makefile
> index d26a9c24a430a831e0d865db4d96142da5276653..4c66d29ae505ae5adc717ae98=
f77fb736a6e15b9 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -21,6 +21,7 @@ qcom-camss-objs +=3D \
>   =09=09camss-vfe-680.o \
>   =09=09camss-vfe-780.o \
>   =09=09camss-vfe-gen1.o \
> +=09=09camss-vfe-vbif.o \
>   =09=09camss-vfe.o \
>   =09=09camss-video.o \
>   =09=09camss-format.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/=
media/platform/qcom/camss/camss-vfe-4-1.c
> index 901677293d971cf761944a660ef719af38203f22..9cf1ccdb2fe7ca9bf89b746af=
836e1035b457a8f 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> @@ -15,6 +15,7 @@
>   #include "camss.h"
>   #include "camss-vfe.h"
>   #include "camss-vfe-gen1.h"
> +#include "camss-vfe-vbif.h"
>=20
>   #define VFE_0_HW_VERSION=09=090x000
>=20
> @@ -733,6 +734,7 @@ static void vfe_set_qos(struct vfe_device *vfe)
>   {
>   =09u32 val =3D VFE_0_BUS_BDG_QOS_CFG_0_CFG;
>   =09u32 val7 =3D VFE_0_BUS_BDG_QOS_CFG_7_CFG;
> +=09int ret;
>=20
>   =09writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_0);
>   =09writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_1);
> @@ -742,6 +744,16 @@ static void vfe_set_qos(struct vfe_device *vfe)
>   =09writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_5);
>   =09writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_6);
>   =09writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
> +
> +=09/* SoC-specific VBIF settings */
> +=09if (vfe->res->has_vbif) {
> +=09=09ret =3D vfe_vbif_apply_settings(vfe);
> +=09=09if (ret < 0) {
> +=09=09=09dev_err_ratelimited(vfe->camss->dev,
> +=09=09=09=09=09    "VFE: VBIF error %d\n",
> +=09=09=09=09=09    ret);
> +=09=09}
> +=09}
>   }
>=20
>   static void vfe_set_ds(struct vfe_device *vfe)
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-vbif.c b/drivers=
/media/platform/qcom/camss/camss-vfe-vbif.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..691335f231a6001e6c535431a=
18b2e21ddc832c9
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-vbif.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * camss-vfe-vbif.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE VBIF Module
> + *
> + * Copyright (c) 2025, The Linux Foundation. All rights reserved.
> + *
> + */
> +
> +#include <linux/io.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +#include "camss-vfe-vbif.h"
> +
> +void vfe_vbif_write_reg(struct vfe_device *vfe, u32 reg, u32 val)
> +{
> +=09writel_relaxed(val, vfe->vbif_base + reg);
> +}
> +
> +int vfe_vbif_apply_settings(struct vfe_device *vfe)
> +{
> +=09return 0;
> +}
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-vbif.h b/drivers=
/media/platform/qcom/camss/camss-vfe-vbif.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..502db629e961f67723b14a7c8=
c9ca973fe4c267c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-vbif.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * camss-vfe-vbif.h
> + *
> + * Qualcomm MSM Camera Subsystem - VFE VBIF Module
> + *
> + * Copyright (c) 2025, The Linux Foundation. All rights reserved.
> + *
> + */
> +#ifndef QC_MSM_CAMSS_VFE_VBIF_H
> +#define QC_MSM_CAMSS_VFE_VBIF_H
> +
> +#include "camss-vfe.h"
> +
> +void vfe_vbif_write_reg(struct vfe_device *vfe, u32 reg, u32 val);
> +
> +int vfe_vbif_apply_settings(struct vfe_device *vfe);
> +
> +#endif /* QC_MSM_CAMSS_VFE_VBIF_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 4bca6c3abaff9b898ea879674a3ff8f3592d3139..3138562d399444c5cf2ae96bf=
16b75b85ff5c5ca 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1807,6 +1807,15 @@ int msm_vfe_subdev_init(struct camss *camss, struc=
t vfe_device *vfe,
>   =09=09return PTR_ERR(vfe->base);
>   =09}
>=20
> +=09if (vfe->res->has_vbif) {
> +=09=09vfe->vbif_base =3D devm_platform_ioremap_resource_byname(pdev,
> +=09=09=09=09=09vfe->res->vbif_name);

bad alignment

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#71:
new file mode 100644

CHECK: Alignment should match open parenthesis
#136: FILE: drivers/media/platform/qcom/camss/camss-vfe.c:1812:
+=09=09vfe->vbif_base =3D devm_platform_ioremap_resource_byname(pdev,
+=09=09=09=09=09vfe->res->vbif_name);

its trivial I can fix it for you when applying no need to resend

> +=09=09if (IS_ERR(vfe->vbif_base)) {
> +=09=09=09dev_err(dev, "could not map vbif memory\n");
> +=09=09=09return PTR_ERR(vfe->vbif_base);
> +=09=09}
> +=09}
> +
>   =09/* Interrupt */
>=20
>   =09ret =3D platform_get_irq_byname(pdev, res->interrupt[0]);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/medi=
a/platform/qcom/camss/camss-vfe.h
> index a23f666be7531e0366c73faea44ed245e7a8e30f..614e932c33da78e02e0800ce6=
534af7b14822f83 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -136,6 +136,8 @@ struct vfe_subdev_resources {
>   =09u8 line_num;
>   =09bool has_pd;
>   =09char *pd_name;
> +=09bool has_vbif;
> +=09char *vbif_name;
>   =09const struct vfe_hw_ops *hw_ops;
>   =09const struct camss_formats *formats_rdi;
>   =09const struct camss_formats *formats_pix;
> @@ -145,6 +147,7 @@ struct vfe_device {
>   =09struct camss *camss;
>   =09u8 id;
>   =09void __iomem *base;
> +=09void __iomem *vbif_base;
>   =09u32 irq;
>   =09char irq_name[30];
>   =09struct camss_clock *clock;
>=20
> --
> 2.49.0
>=20
>=20
>Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


