Return-Path: <linux-media+bounces-47880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D6070C930F5
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 21:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 26B05349A13
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1572D7DE3;
	Fri, 28 Nov 2025 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h6AYJAh2"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9712F149C7B;
	Fri, 28 Nov 2025 20:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764360101; cv=none; b=S8AZ+a0iU2ze9uDkUT9Vcsf5djM6D0OJgElqPWL/rpgDvuxRljtKv4ChHf9jfsC/rHSbD7+kR4AJMwadEwgjc/a99rouHuLBPtzK1FHc9OJV662IqlxebXjj1Fbuo+odtMjmJbZtSIbTo68NQCay2qszV8ajrgD82P+TFf4i8DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764360101; c=relaxed/simple;
	bh=F/Lb1bwKmuJabvooKXko6LES3ISn4sJpXYE3+FQUTTk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zen1Kxq9uXro1QOioRPrWgRY/Up0PW/yncmnJj7XBqQGwK/Aia0UZrYi4rKyVqXANND6mFmDDYN2XMkA7Ht7//8Vn59vVE0YxIaoBqKFZadrhjNix2fzXM5ZKksPu36YAnOa0z19YC3hXuijYGAiyp8ueZqzwTGR33Hvedu7VAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h6AYJAh2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764360096;
	bh=F/Lb1bwKmuJabvooKXko6LES3ISn4sJpXYE3+FQUTTk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=h6AYJAh2pGkeQL930NJvEo3Nz193g4luO7Yb3zCl+6fJJI6O/pIyfI8zeUWGcLTzv
	 TJtSVLdQlUM3crGMTIiPUJ+I1O6gpUY2HDpWGT+P6ouFTHKjbYry3BS2vP+x6o/ShV
	 XqPEWdKpUlCc+82qx8K5f1e48g+L4tiT8Vpc4uWphlZLTaYueRTuEOKMqZpsra/9FJ
	 RyxDXtMDyiPdUY7hVhsvigYvEEATSYVIotjWWgksWoP4rm6bdUaURxEL1kw4pg1W6G
	 UFNBrTGThFExHHvp1hSQgb77wjbP9E85hZxSmH8IbVplUDWnRvvK5er/Lj/vDBer9X
	 SpSajpT6ABuWA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3DB817E0EDB;
	Fri, 28 Nov 2025 21:01:34 +0100 (CET)
Message-ID: <b128ac3155eb299124a80bf909dfe98a77de0b0f.camel@collabora.com>
Subject: Re: [PATCH v2 03/14] media: mediatek: vcodec: add driver to support
 vcp
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Hans Verkuil	 <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard	 <benjamin.gaignard@collabora.com>, Nathan Hebert
 <nhebert@chromium.org>,  Daniel Almeida <daniel.almeida@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 28 Nov 2025 15:01:32 -0500
In-Reply-To: <20250815085232.30240-4-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-4-yunfei.dong@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-eQ+AvL0yyKU93K31Um0o"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-eQ+AvL0yyKU93K31Um0o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> The processor is changed from scp to vcp in mt8196 platform.
> Adding new firmware interface to communicate kernel with vcp
> for the communication method is changed.

The SCP helpers lived in remote-proc, is this processor now dedicated to VP=
U and
this is why the helpers lives here ?

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0.../media/platform/mediatek/vcodec/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 4 +
> =C2=A0.../platform/mediatek/vcodec/common/Makefile=C2=A0 |=C2=A0=C2=A0 4 =
+
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 3 +
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_priv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 449 ++++++++++++++++++
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 137 ++++++
> =C2=A0include/linux/remoteproc/mtk_vcp_public.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> =C2=A08 files changed, 611 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/media/platform/mediatek/vcodec/common/mt=
k_vcodec_fw_vcp.c
> =C2=A0create mode 100644 drivers/media/platform/mediatek/vcodec/common/mt=
k_vcodec_fw_vcp.h
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/med=
ia/platform/mediatek/vcodec/Kconfig
> index bc8292232530..d23dad5c78ce 100644
> --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
> @@ -1,4 +1,7 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_MEDIATEK_VCODEC_VCP
> +	bool
> +
> =C2=A0config VIDEO_MEDIATEK_VCODEC_SCP
> =C2=A0	bool
> =C2=A0
> @@ -21,6 +24,7 @@ config VIDEO_MEDIATEK_VCODEC
> =C2=A0	select V4L2_MEM2MEM_DEV
> =C2=A0	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> =C2=A0	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
> +	select VIDEO_MEDIATEK_VCODEC_VCP if MTK_VCP_RPROC
> =C2=A0	select V4L2_H264
> =C2=A0	select V4L2_VP9
> =C2=A0	select MEDIA_CONTROLLER
> diff --git a/drivers/media/platform/mediatek/vcodec/common/Makefile b/dri=
vers/media/platform/mediatek/vcodec/common/Makefile
> index d0479914dfb3..2f68692e8c98 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/Makefile
> +++ b/drivers/media/platform/mediatek/vcodec/common/Makefile
> @@ -14,6 +14,10 @@ ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP),)
> =C2=A0mtk-vcodec-common-y +=3D mtk_vcodec_fw_scp.o
> =C2=A0endif
> =C2=A0
> +ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_VCP),)
> +mtk-vcodec-common-y +=3D mtk_vcodec_fw_vcp.o
> +endif
> +
> =C2=A0ifneq ($(CONFIG_DEBUG_FS),)
> =C2=A0obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) +=3D mtk-vcodec-dbgfs.o
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> index 08949b08fbc6..fc547afa4ebf 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> @@ -3,6 +3,7 @@
> =C2=A0#include "../decoder/mtk_vcodec_dec_drv.h"
> =C2=A0#include "../encoder/mtk_vcodec_enc_drv.h"
> =C2=A0#include "mtk_vcodec_fw_priv.h"
> +#include "mtk_vcodec_fw_vcp.h"
> =C2=A0
> =C2=A0struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vco=
dec_fw_type type,
> =C2=A0					=C2=A0=C2=A0 enum mtk_vcodec_fw_use fw_use)
> @@ -19,6 +20,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, =
enum mtk_vcodec_fw_type t
> =C2=A0		return mtk_vcodec_fw_vpu_init(priv, fw_use);
> =C2=A0	case SCP:
> =C2=A0		return mtk_vcodec_fw_scp_init(priv, fw_use);
> +	case VCP:
> +		return mtk_vcodec_fw_vcp_init(priv, fw_use);
> =C2=A0	default:
> =C2=A0		dev_err(&plat_dev->dev, "Invalid vcodec fw type");
> =C2=A0		return ERR_PTR(-EINVAL);
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> index 300363a40158..c1642fb09b42 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> @@ -14,6 +14,7 @@ struct mtk_vcodec_enc_dev;
> =C2=A0enum mtk_vcodec_fw_type {
> =C2=A0	VPU,
> =C2=A0	SCP,
> +	VCP,
> =C2=A0};
> =C2=A0
> =C2=A0enum mtk_vcodec_fw_use {
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
priv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
> index 99603accd82e..0a2a9b010244 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
> @@ -4,6 +4,7 @@
> =C2=A0#define _MTK_VCODEC_FW_PRIV_H_
> =C2=A0
> =C2=A0#include "mtk_vcodec_fw.h"
> +#include "mtk_vcodec_fw_vcp.h"
> =C2=A0
> =C2=A0struct mtk_vcodec_dec_dev;
> =C2=A0struct mtk_vcodec_enc_dev;
> @@ -13,6 +14,7 @@ struct mtk_vcodec_fw {
> =C2=A0	const struct mtk_vcodec_fw_ops *ops;
> =C2=A0	struct platform_device *pdev;
> =C2=A0	struct mtk_scp *scp;
> +	struct mtk_vcp *vcp;
> =C2=A0	enum mtk_vcodec_fw_use fw_use;
> =C2=A0};
> =C2=A0
> @@ -49,4 +51,14 @@ mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_=
use fw_use)
> =C2=A0}
> =C2=A0#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_SCP */
> =C2=A0
> +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VCP)
> +struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec=
_fw_use fw_use);
> +#else
> +static inline struct mtk_vcodec_fw *
> +mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_VCP */
> +
> =C2=A0#endif /* _MTK_VCODEC_FW_PRIV_H_ */
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> new file mode 100644
> index 000000000000..227310c116c6
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -0,0 +1,449 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iommu.h>
> +#include <linux/remoteproc/mtk_vcp_public.h>
> +#include <linux/firmware/mediatek/mtk-vcp-ipc.h>
> +
> +#include "../decoder/mtk_vcodec_dec_drv.h"
> +#include "../decoder/vdec_ipi_msg.h"
> +#include "mtk_vcodec_fw_priv.h"
> +
> +#define IPI_SEND_TIMEOUT_MS=C2=A0 100U
> +#define IPI_TIMEOUT_MS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100U
> +
> +static void mtk_vcodec_vcp_ipi_lock(struct mtk_vcp *vcp, u32 ipi_id)
> +{
> +	if (WARN_ON(ipi_id >=3D VCP_IPI_MAX))
> +		return;
> +
> +	mutex_lock(&vcp->ipi_desc[ipi_id].lock);
> +}
> +
> +static void mtk_vcodec_vcp_ipi_unlock(struct mtk_vcp *vcp, u32 ipi_id)
> +{
> +	if (WARN_ON(ipi_id >=3D VCP_IPI_MAX))
> +		return;
> +
> +	mutex_unlock(&vcp->ipi_desc[ipi_id].lock);
> +}

Not a blocker, but since this is a new file, its a good opportunity to use =
the
"guard". For that, you want a helper that returns a pointer to the right mu=
tex.

> +
> +static int mtk_vcodec_vcp_notifier(struct notifier_block *nb, unsigned l=
ong event, void *ptr)
> +{
> +	struct mtk_vcp *vcp =3D container_of(nb, struct mtk_vcp, vcp_notify);
> +
> +	switch (event) {
> +	case VCP_EVENT_SUSPEND:
> +	case VCP_EVENT_STOP:
> +		dev_dbg(&vcp->pdev->dev, "vcp notifier suspend");
> +		break;
> +	case VCP_EVENT_READY:
> +	case VCP_EVENT_RESUME:
> +		dev_dbg(&vcp->pdev->dev, "vcp notifier ready");
> +		break;
> +	}

So this is all just debugging, should we even register this callback in the
first place ?

> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void mtk_vcodec_vcp_free_msg_node(struct mtk_vcodec_fw *fw,
> +					 struct mtk_vcp_msg_node *msg_node)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fw->vcp->msg_queue.lock, flags);

A guard would look nice here. I won't repeat that over and over though.

> +	list_add(&msg_node->list, &fw->vcp->msg_queue.node_list);
> +	spin_unlock_irqrestore(&fw->vcp->msg_queue.lock, flags);
> +}
> +
> +static int mtk_vcodec_vcp_ipi_register(struct mtk_vcp *vcp, u32 ipi_id, =
vcp_ipi_handler_t handler,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *priv)
> +{
> +	if (!vcp)
> +		return -EPROBE_DEFER;
> +
> +	if (WARN_ON(ipi_id >=3D VCP_IPI_MAX) || WARN_ON(!handler))
> +		return -EINVAL;
> +
> +	mtk_vcodec_vcp_ipi_lock(vcp, ipi_id);

The warn_on is repeated in this function too, drop one.

> +	vcp->ipi_desc[ipi_id].handler =3D handler;
> +	vcp->ipi_desc[ipi_id].priv =3D priv;
> +	mtk_vcodec_vcp_ipi_unlock(vcp, ipi_id);
> +
> +	return 0;
> +}
> +
> +static int mtk_vcodec_vcp_msg_process_thread(void *arg)
> +{
> +	struct mtk_vcodec_fw *fw =3D arg;
> +	struct vdec_vpu_ipi_ack *msg =3D NULL;
> +	struct mtk_vcp_share_obj *obj;
> +	struct mtk_vcp_msg_node *msg_node;
> +	unsigned long flags;
> +	vcp_ipi_handler_t handler;
> +	int ret =3D 0;
> +
> +	do {
> +		ret =3D wait_event_interruptible(fw->vcp->msg_queue.wq,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_read(&fw->vcp->msg_queu=
e.cnt) > 0);
> +		if (ret < 0) {
> +			dev_err(&fw->pdev->dev, "wait msg queue ack timeout %d %d\n",
> +				ret, atomic_read(&fw->vcp->msg_queue.cnt));
> +			continue;
> +		}
> +
> +		spin_lock_irqsave(&fw->vcp->msg_queue.lock, flags);
> +		msg_node =3D list_entry(fw->vcp->msg_queue.msg_list.next,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcp_msg_node, list);
> +		list_del(&msg_node->list);
> +		atomic_dec(&fw->vcp->msg_queue.cnt);
> +		spin_unlock_irqrestore(&fw->vcp->msg_queue.lock, flags);
> +
> +		obj =3D &msg_node->ipi_data;
> +		msg =3D (struct vdec_vpu_ipi_ack *)obj->share_buf;
> +
> +		if (!msg->ap_inst_addr) {
> +			dev_err(&fw->pdev->dev, "invalid message address\n");
> +			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +			continue;
> +		}
> +
> +		dev_dbg(&fw->pdev->dev, "msg ack id %d len %d msg_id 0x%x\n", obj->id,=
 obj->len,
> +			msg->msg_id);
> +
> +		mtk_vcodec_vcp_ipi_lock(fw->vcp, obj->id);
> +		handler =3D fw->vcp->ipi_desc[obj->id].handler;
> +		if (!handler) {
> +			dev_err(&fw->pdev->dev, "invalid ack ipi handler id =3D %d\n", obj->i=
d);
> +			mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
> +			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +			return -EINVAL;
> +		}
> +
> +		handler(msg, obj->len, fw->vcp->ipi_desc[obj->id].priv);
> +		mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
> +
> +		fw->vcp->msg_signaled[obj->id] =3D true;
> +		wake_up(&fw->vcp->msg_wq[obj->id]);
> +
> +		mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +	} while (!kthread_should_stop());
> +
> +	return ret;
> +}
> +
> +static int mtk_vcodec_vcp_msg_ack_isr(unsigned int id, void *prdata, voi=
d *data, unsigned int len)
> +{
> +	struct mtk_vcodec_fw *fw =3D prdata;
> +	struct mtk_vcp_msg_queue *msg_queue =3D &fw->vcp->msg_queue;
> +	struct mtk_vcp_msg_node *msg_node;
> +	struct vdec_vpu_ipi_ack *msg =3D NULL;
> +	struct mtk_vcp_share_obj *obj =3D data;
> +	unsigned long flags;
> +
> +	msg =3D (struct vdec_vpu_ipi_ack *)obj->share_buf;
> +
> +	spin_lock_irqsave(&msg_queue->lock, flags);
> +	if (!list_empty(&msg_queue->node_list)) {
> +		msg_node =3D list_entry(msg_queue->node_list.next, struct mtk_vcp_msg_=
node, list);
> +
> +		memcpy(&msg_node->ipi_data, obj, sizeof(*obj));
> +		list_move_tail(&msg_node->list, &msg_queue->msg_list);
> +		atomic_inc(&msg_queue->cnt);
> +		spin_unlock_irqrestore(&msg_queue->lock, flags);
> +
> +		dev_dbg(&fw->pdev->dev, "push ipi_id %x msg_id %x, msg cnt %d\n",
> +			obj->id, msg->msg_id, atomic_read(&msg_queue->cnt));
> +
> +		wake_up(&msg_queue->wq);
> +	} else {
> +		spin_unlock_irqrestore(&msg_queue->lock, flags);
> +		dev_err(&fw->pdev->dev, "no free nodes in msg queue\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id,=
 void *buf,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int len, unsigned int =
wait)
> +{
> +	struct mtk_vcp *vcp =3D fw->vcp;
> +	struct mtk_vcp_device *vcp_device =3D vcp->vcp_device;
> +	struct mutex *msg_mutex =3D &vcp->ipi_mutex;
> +	bool *msg_signaled =3D &vcp->msg_signaled[id];
> +	wait_queue_head_t *msg_wq =3D &vcp->msg_wq[id];
> +	int ret, ipi_size, feature_id, mailbox_id, retry_cnt =3D 0;
> +	unsigned long timeout_jiffies =3D 0;
> +	struct mtk_vcp_share_obj obj =3D {0};
> +	unsigned int *data;
> +
> +	if (!vcp_device) {
> +		dev_dbg(&fw->pdev->dev, "vcp device is null\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(msg_mutex);

Please be explicit, otherwise its hard to know if this function and another=
 lock
the same thing. To do:

	mutex_lock(&vcp->ipi_mutex);

> +	feature_id =3D VDEC_FEATURE_ID;
> +	mailbox_id =3D IPI_OUT_VDEC_1;
> +
> +	timeout_jiffies =3D jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);
> +	while (!vcp_device->ops->vcp_is_ready(feature_id)) {
> +		if (time_after(jiffies, timeout_jiffies)) {
> +			vcp->ipi_id_ack[id] =3D -EINVAL;
> +			ret =3D -EINVAL;
> +			goto error;
> +		}
> +		mdelay(1);
> +	}
> +
> +	if (len > VCP_SHARE_BUF_SIZE) {
> +		vcp->ipi_id_ack[id] =3D -EINVAL;
> +		ret =3D -EINVAL;
> +		goto error;
> +	}
> +
> +	obj.id =3D id;
> +	obj.len =3D len;
> +	memcpy(obj.share_buf, buf, len);
> +
> +	ipi_size =3D ((sizeof(u32) * 2) + len + 3) / 4;

Perhaps some defines for macro, so we can understand what this size is made=
 of ?

> +	data =3D (unsigned int *)obj.share_buf;
> +	dev_dbg(&fw->pdev->dev, "vcp send message: id %d len %d data 0x%x\n",
> +		obj.id, obj.len, data[0]);
> +
> +	ret =3D mtk_vcp_ipc_send(vcp_get_ipidev(vcp_device), mailbox_id, &obj, =
ipi_size);
> +	if (ret !=3D IPI_ACTION_DONE) {
> +		vcp->ipi_id_ack[id] =3D -EIO;
> +		ret =3D -EIO;
> +		goto error;
> +	}
> +
> +wait_ack:
> +	/* wait for VCP's ACK */
> +	ret =3D wait_event_timeout(*msg_wq, *msg_signaled, msecs_to_jiffies(IPI=
_TIMEOUT_MS));
> +	if (!ret || retry_cnt > 5) {
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +		dev_err(&fw->pdev->dev, "wait ipi ack timeout! %d %d\n", ret, vcp->ipi=
_id_ack[id]);
> +	} else if (ret =3D=3D -ERESTARTSYS) {
> +		dev_err(&fw->pdev->dev, "wait ipi ack err (%d)\n", vcp->ipi_id_ack[id]=
);
> +		retry_cnt++;
> +		goto wait_ack;
> +	} else if (ret < 0) {
> +		dev_err(&fw->pdev->dev, "wait ipi ack fail ret %d %d\n", ret, vcp->ipi=
_id_ack[id]);
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +	}
> +
> +	dev_dbg(&fw->pdev->dev, "receive message: id %d len %d data 0x%x\n",
> +		obj.id, obj.len, data[0]);
> +
> +	*msg_signaled =3D false;
> +	mutex_unlock(msg_mutex);
> +
> +	return vcp->ipi_id_ack[id];
> +
> +error:
> +	mutex_unlock(msg_mutex);
> +	dev_err(&fw->pdev->dev, "send msg error type:%d msg:%d > %d ret:%d\n", =
fw->type, len,
> +		VCP_SHARE_BUF_SIZE, ret);
> +
> +	return ret;
> +}
> +
> +static int mtk_vcodec_vcp_get_vcp_device(struct mtk_vcodec_fw *fw)
> +{
> +	struct device *dev =3D &fw->pdev->dev;
> +	int retry =3D 0, retry_cnt =3D 10000;
> +	phandle vcp_phandle;
> +
> +	while (request_module("mtk-vcp")) {
> +		if (++retry > retry_cnt) {
> +			dev_err(dev, "failed to load mtk-vcp module");
> +			return -ENODEV;
> +		}
> +		msleep(1);

Seems a bit short of a retry considering that if that fails, its either the
module file is missing, or the system is waiting for the rootfs to be ready=
.
Should this make use of deferred probe ?

> +	}
> +
> +	if (of_property_read_u32(dev->of_node, "mediatek,vcp", &vcp_phandle)) {
> +		dev_err(dev, "can't get vcp handle.\n");
> +		return -ENODEV;
> +	}
> +
> +	fw->vcp->vcp_device =3D mtk_vcp_get_by_phandle(vcp_phandle);
> +	if (!fw->vcp->vcp_device) {
> +		dev_err(dev, "get vcp device failed\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
> +{
> +	struct mtk_vcp_device *vcp_device;
> +	int ret, feature_id, mem_id, mailbox_id, ipi_id;
> +
> +	if (fw->vcp->is_init_done) {
> +		dev_dbg(&fw->pdev->dev, "vcp has already been initialized done.\n");
> +		return 0;
> +	}
> +
> +	if (mtk_vcodec_vcp_get_vcp_device(fw) < 0) {
> +		dev_err(&fw->pdev->dev, "vcp device is null.\n");
> +		return -EINVAL;
> +	}
> +
> +	vcp_device =3D fw->vcp->vcp_device;
> +
> +	feature_id =3D VDEC_FEATURE_ID;
> +	mem_id =3D VDEC_MEM_ID;
> +	mailbox_id =3D IPI_IN_VDEC_1;
> +	ipi_id =3D VCP_IPI_LAT_DECODER;
> +
> +	ret =3D mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mailbox_i=
d,
> +					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
> +	if (ret) {
> +		dev_dbg(&fw->pdev->dev, "ipi register fail %d %d %d %d\n", ret, featur=
e_id,
> +			mem_id, mailbox_id);
> +		return -EINVAL;
> +	}
> +
> +	fw->vcp->vcp_notify.notifier_call =3D mtk_vcodec_vcp_notifier;
> +	fw->vcp->vcp_notify.priority =3D 1;
> +	vcp_device->ops->vcp_register_notify(feature_id, &fw->vcp->vcp_notify);
> +
> +	fw->vcp->is_init_done =3D true;
> +
> +	mutex_init(&fw->vcp->ipi_desc[ipi_id].lock);
> +	mutex_init(&fw->vcp->ipi_mutex);
> +
> +	kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_vdec_msq_thread=
");
> +
> +	fw->vcp->vsi_addr =3D vcp_device->ops->vcp_get_mem_virt(mem_id);
> +	fw->vcp->vsi_core_addr =3D fw->vcp->vsi_addr + VCODEC_VSI_LEN;
> +	fw->vcp->vsi_size =3D vcp_device->ops->vcp_get_mem_size(mem_id);
> +	fw->vcp->iova_addr =3D vcp_device->ops->vcp_get_mem_iova(mem_id);
> +
> +	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_LAT_DECODER]);
> +	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_CORE_DECODER]);
> +
> +	dev_dbg(&fw->pdev->dev, "vdec vcp init done =3D> va: %p size:0x%x iova:=
%p.\n",
> +		fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
> +
> +	return 0;
> +}
> +
> +static unsigned int mtk_vcodec_vcp_get_vdec_capa(struct mtk_vcodec_fw *f=
w)
> +{
> +	return MTK_VDEC_FORMAT_MM21 | MTK_VDEC_FORMAT_H264_SLICE | MTK_VDEC_FOR=
MAT_VP9_FRAME |
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_VDEC_FORMAT_AV1_FRAME | MTK_VD=
EC_FORMAT_HEVC_FRAME |
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_VDEC_IS_SUPPORT_10BIT | MTK_VD=
EC_IS_SUPPORT_EXT;
> +}
> +
> +static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_d=
mem_addr)
> +{
> +	return NULL;
> +}
> +
> +static int mtk_vcodec_vcp_set_ipi_register(struct mtk_vcodec_fw *fw, int=
 id,
> +					=C2=A0=C2=A0 mtk_vcodec_ipi_handler handler,
> +					=C2=A0=C2=A0 const char *name, void *priv)
> +{
> +	return mtk_vcodec_vcp_ipi_register(fw->vcp, id, handler, priv);
> +}
> +
> +static int mtk_vcodec_vcp_ipi_send(struct mtk_vcodec_fw *fw, int id, voi=
d *buf,
> +				=C2=A0=C2=A0 unsigned int len, unsigned int wait)
> +{
> +	struct mtk_vcp_device *vcp_device =3D fw->vcp->vcp_device;
> +	struct device *dev =3D &fw->pdev->dev;
> +	int ret;
> +
> +	if (!fw->vcp->vcp_device) {
> +		dev_err(dev, "vcp device is null\n");
> +		return -ENODEV;
> +	}
> +
> +	ret =3D vcp_device->ops->vcp_register_feature(vcp_device, VDEC_FEATURE_=
ID);
> +	if (ret < 0)
> +		goto error;
> +
> +	ret =3D mtk_vcodec_vcp_msg_ipi_send(fw, id, buf, len, wait);
> +	if (ret < 0)
> +		goto error;
> +
> +	ret =3D vcp_device->ops->vcp_deregister_feature(vcp_device, VDEC_FEATUR=
E_ID);
> +	if (ret < 0)
> +		goto error;
> +
> +	return ret;
> +
> +error:
> +	dev_err(dev, "vcp ipi send fail ret:%d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
> +{
> +}
> +
> +static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg =3D {
> +	.load_firmware =3D mtk_vcodec_vcp_load_firmware,
> +	.get_vdec_capa =3D mtk_vcodec_vcp_get_vdec_capa,
> +	.map_dm_addr =3D mtk_vcodec_vcp_dm_addr,
> +	.ipi_register =3D mtk_vcodec_vcp_set_ipi_register,
> +	.ipi_send =3D mtk_vcodec_vcp_ipi_send,
> +	.release =3D mtk_vcodec_vcp_release,
> +};
> +
> +struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec=
_fw_use fw_use)
> +{
> +	struct mtk_vcp_msg_node *msg_node;
> +	struct platform_device *plat_dev;
> +	struct mtk_vcodec_fw *fw;
> +	int i;
> +
> +	if (fw_use =3D=3D DECODER) {
> +		struct mtk_vcodec_dec_dev *dec_dev =3D priv;
> +
> +		plat_dev =3D dec_dev->plat_dev;
> +	} else {
> +		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_use);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> +	if (!fw)
> +		return ERR_PTR(-ENOMEM);
> +
> +	fw->type =3D VCP;
> +	fw->pdev =3D plat_dev;
> +	fw->fw_use =3D fw_use;
> +	fw->ops =3D &mtk_vcodec_vcp_msg;
> +	fw->vcp =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw->vcp), GFP_KERNEL);
> +	if (!fw->vcp)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&fw->vcp->msg_queue.msg_list);
> +	INIT_LIST_HEAD(&fw->vcp->msg_queue.node_list);
> +	spin_lock_init(&fw->vcp->msg_queue.lock);
> +	init_waitqueue_head(&fw->vcp->msg_queue.wq);
> +	atomic_set(&fw->vcp->msg_queue.cnt, 0);
> +	fw->vcp->pdev =3D plat_dev;
> +
> +	for (i =3D 0; i < VCP_MAX_MQ_NODE_CNT; i++) {
> +		msg_node =3D devm_kzalloc(&plat_dev->dev, sizeof(*msg_node), GFP_KERNE=
L);
> +		if (!msg_node)
> +			return ERR_PTR(-ENOMEM);
> +
> +		list_add(&msg_node->list, &fw->vcp->msg_queue.node_list);
> +	}
> +
> +	return fw;
> +}
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> new file mode 100644
> index 000000000000..40f5481d1889
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#ifndef _MTK_VCODEC_FW_VCP_H_
> +#define _MTK_VCODEC_FW_VCP_H_
> +
> +typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *p=
riv);
> +
> +#define VCP_MAX_MQ_NODE_CNT=C2=A0 6
> +#define VCP_SHARE_BUF_SIZE 64
> +
> +#define VCODEC_VSI_LEN (0x2000)
> +
> +/* enum mtk_vcp_ipi_index - index used to separate different hardware */
> +enum mtk_vcp_ipi_index {
> +	VCP_IPI_LAT_DECODER,
> +	VCP_IPI_CORE_DECODER,
> +	VCP_IPI_MAX,
> +};
> +
> +/**
> + * struct mtk_vcp_msg_queue - process the vcp message between kernel wit=
h vcp
> + *
> + * @msg_list:=C2=A0 store share buffer list which from vcp to kernel
> + * @wq:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 waitqueue that can be =
used to wait for vcp message
> + * @lock:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 protect msg list
> + * @cnt:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the count of share obj in m=
sg list
> + * @node_list: share obj list
> + */
> +struct mtk_vcp_msg_queue {
> +	struct list_head msg_list;
> +	wait_queue_head_t wq;
> +	spinlock_t lock;
> +	atomic_t cnt;
> +	struct list_head node_list;
> +};
> +
> +/**
> + * struct mtk_vcp_ipi_desc - store the ack handler
> + *
> + * @lock:=C2=A0=C2=A0=C2=A0 protect ack handler data
> + * @handler: calling this handler when kernel receive ack
> + * @priv:=C2=A0=C2=A0=C2=A0 private data when calling handler to process
> + */
> +struct mtk_vcp_ipi_desc {
> +	struct mutex lock;
> +	vcp_ipi_handler_t handler;
> +	void *priv;
> +};
> +
> +/**
> + * struct mtk_vcp_share_obj - share buffer used to send data to vcp
> + *
> + * @id:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 message index
> + * @len:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 message size
> + * @share_buf: message data
> + */
> +struct mtk_vcp_share_obj {
> +	unsigned int id;
> +	unsigned int len;
> +	unsigned char share_buf[VCP_SHARE_BUF_SIZE];
> +};
> +
> +/* enum mtk_vcp_ipi_msg_status - the status when send message to vcp */
> +enum mtk_vcp_ipi_msg_status {
> +	VCODEC_IPI_MSG_STATUS_OK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D 0,
> +	VCODEC_IPI_MSG_STATUS_FAIL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D -1,
> +	VCODEC_IPI_MSG_STATUS_MAX_INST=C2=A0=C2=A0 =3D -2,
> +	VCODEC_IPI_MSG_STATUS_ILSEQ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D -3,
> +	VCODEC_IPI_MSG_STATUS_INVALID_ID =3D -4,
> +	VCODEC_IPI_MSG_STATUS_DMA_FAIL=C2=A0=C2=A0 =3D -5,
> +};
> +
> +/**
> + * struct mtk_vcp_msg_node - share buffer used to send data to vcp
> + *
> + * @ipi_data: share obj data
> + * @list:=C2=A0=C2=A0=C2=A0=C2=A0 list to store msg node
> + */
> +struct mtk_vcp_msg_node {
> +	struct mtk_vcp_share_obj ipi_data;
> +	struct list_head list;
> +};
> +
> +/**
> + * struct mtk_vcp - vcp firmware private data
> + *
> + * @is_init_done:=C2=A0 vcp is ready to use
> + *
> + * @ipi_mutex:=C2=A0=C2=A0=C2=A0=C2=A0 used to protect ipi data
> + * @msg_signaled:=C2=A0 whether receive ack from vcp
> + * @msg_wq:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wake message queue
> + *
> + * @ipi_desc:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 store ack handler
> + * @ipi_id_ack:=C2=A0=C2=A0=C2=A0 the ack handler status
> + *
> + * @msg_queue:=C2=A0=C2=A0=C2=A0=C2=A0 process vcp message
> + * @share_data:=C2=A0=C2=A0=C2=A0 temp share obj data
> + *
> + * @vcp_notify:=C2=A0=C2=A0=C2=A0 register notifier to vcp
> + *
> + * @vsi_addr:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vsi virtual data address
> + * @vsi_core_addr: vsi core virtual data address
> + * @iova_addr:=C2=A0=C2=A0=C2=A0=C2=A0 vsi iova address
> + * @vsi_size:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vsi size
> + *
> + * @pdev:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 platform=
 device
> + * @vcp_device:=C2=A0=C2=A0=C2=A0 vcp private data
> + */
> +struct mtk_vcp {
> +	bool is_init_done;
> +
> +	struct mutex ipi_mutex;
> +	bool msg_signaled[VCP_IPI_MAX];
> +	wait_queue_head_t msg_wq[VCP_IPI_MAX];
> +
> +	struct mtk_vcp_ipi_desc ipi_desc[VCP_IPI_MAX];
> +	bool ipi_id_ack[VCP_IPI_MAX];
> +
> +	struct mtk_vcp_msg_queue msg_queue;
> +	struct mtk_vcp_share_obj share_data;
> +
> +	struct notifier_block vcp_notify;
> +
> +	void *vsi_addr;
> +	void *vsi_core_addr;
> +	dma_addr_t iova_addr;
> +	int vsi_size;
> +
> +	struct platform_device *pdev;
> +	struct mtk_vcp_device *vcp_device;
> +};
> +
> +#endif
> diff --git a/include/linux/remoteproc/mtk_vcp_public.h b/include/linux/re=
moteproc/mtk_vcp_public.h
> index 07b0b30ea964..0b7d1c3c28ca 100644
> --- a/include/linux/remoteproc/mtk_vcp_public.h
> +++ b/include/linux/remoteproc/mtk_vcp_public.h
> @@ -10,7 +10,7 @@
> =C2=A0#include <linux/firmware/mediatek/mtk-vcp-ipc.h>
> =C2=A0#include <linux/remoteproc.h>
> =C2=A0
> -#define VCP_SYNC_TIMEOUT_MS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (999)
> +#define VCP_SYNC_TIMEOUT_MS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (50)
> =C2=A0
> =C2=A0/* vcp notify event */
> =C2=A0enum VCP_NOTIFY_EVENT {


regards,
Nicolas

--=-eQ+AvL0yyKU93K31Um0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSn/nAAKCRDZQZRRKWBy
9ClNAP409MYA21cEii3E6KK9RkT6InaSYY4918FwTJ7xvzhZKwD/WXura54uEjTE
qy+6HFUFfNjakQTW3DjeOaFhItzcuA0=
=eptv
-----END PGP SIGNATURE-----

--=-eQ+AvL0yyKU93K31Um0o--

