Return-Path: <linux-media+bounces-59896-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDYyAcIY8Wm6dAEAu9opvQ
	(envelope-from <linux-media+bounces-59896-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:29:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C65B48BC30
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C716303CFBF
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B3E39768A;
	Tue, 28 Apr 2026 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OOQMpmzM"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B033F394;
	Tue, 28 Apr 2026 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408169; cv=none; b=FPGxWB0YrCsss8K4NFBDlOwTpgBTlPgoA2LiahflnzHNXnY6Wmdcvqsq+dct4Nps1GnGxE8FSWftu6ALr2entGMDgoK0i8IfDiuT8/u5hIZIaHnwwUSnHE7quTefguz4S67pvmv3T04/ad5VwyBELOzadk7vaJXtBJBCkddwPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408169; c=relaxed/simple;
	bh=R61fwkB3jfDGdMv97HTQO+F9n6hzhfzgtfc9joc60tI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CLcIBH9IK4UB6o7WDhOhtENC3Lv7i4KbBTNWb08qQhvejIhR1qSk3BkCwVmSXajkoBIBtLj9pJ2CW8RIEdeNFDqdhAkR8kCxDNvVg9jMGNWl9v6iHG7zXGxNCXTvVrPp8q8eGkk1x/jZMaPQHm7jEAt54lfHVhn8Z1RS8P1tSH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OOQMpmzM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777408163;
	bh=R61fwkB3jfDGdMv97HTQO+F9n6hzhfzgtfc9joc60tI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=OOQMpmzMu8SXqoY+Ej209RbEfi/r6Ht+HHzzPktWy6YjuyMc0zA0ncbJtCTHVFfmX
	 0ip1UZSggW1wG+kwH6vyJUGa0Wa3VrP19TAaN2rGiViuYxWidnoUq2S2tBKZHYOtWT
	 q8mT0XaMehozv+YCiN4YhjN1ADa2Vssx/7wBpLH3zxMKsrES6v5zPFgxI8FMXa6+Xq
	 VFvlTqm20aZCKJjmUljv9O9hj7CuJ9sxhDzoHcOvzYDCkLoWUs/12w9xpe2GqLlSeU
	 +jvR97k7zL3prffy0IutY9wnFtTuzmk80ye3bvB7gVE+4MGxhG+8JPDKyUSti7E6lE
	 bolRqT7+7hLrg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BA5B17E0C83;
	Tue, 28 Apr 2026 22:29:21 +0200 (CEST)
Message-ID: <466588ec8c4c3e62adb62ec7e1ddcd760cceb89e.camel@collabora.com>
Subject: Re: [PATCH v4 01/14] media: mediatek: vcodec: add driver to support
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
Date: Tue, 28 Apr 2026 16:29:20 -0400
In-Reply-To: <20260328051630.7937-2-yunfei.dong@mediatek.com>
References: <20260328051630.7937-1-yunfei.dong@mediatek.com>
	 <20260328051630.7937-2-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-LdaboJ6Nc8r1AftsqH24"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4C65B48BC30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-59896-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[mediatek.com,collabora.com,xs4all.nl,chromium.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]


--=-LdaboJ6Nc8r1AftsqH24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 28 mars 2026 =C3=A0 13:16 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> The processor is changed from scp to vcp in mt8196 platform.
> Adding new firmware interface to communicate kernel with vcp
> for the communication method is changed.
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
=C2=A0=C2=A0=C2=A0 | 505 ++++++++++++++++++
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 139 +++++
> =C2=A07 files changed, 668 insertions(+)
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

This applies to the entire series. Do you have rational toward using the sw=
itch
and if/else approach over the entire series ? The ops pattern is much more
command for multi-platform driver. Using this as an example, you'd have a
vpu_init ops, in your pdata, and simply call this without the runtime switc=
hes
and conditions.

Please apply changes according to this comment for the entire series, keepi=
ng
mtk_vcodec_enc_drv.h a free from VCP/SCP specific code as possible.

Nicolas

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
> index 000000000000..9fee52fed181
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -0,0 +1,505 @@
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
> +#define VCP_IPI_HEADER_SIZE (sizeof(u32) * 2)
> +#define VCP_IPI_ALIGN (4)
> +
> +static struct mutex *mtk_vcodec_vcp_get_ipi_lock(struct mtk_vcp *vcp, u3=
2 ipi_id)
> +{
> +	return &vcp->ipi_desc[ipi_id].lock;
> +}
> +
> +static void mtk_vcodec_vcp_ipi_lock(struct mtk_vcp *vcp, u32 ipi_id)
> +{
> +	struct mutex *lock =3D mtk_vcodec_vcp_get_ipi_lock(vcp, ipi_id);
> +
> +	if (!lock)
> +		return;
> +
> +	mutex_lock(lock);
> +}
> +
> +static void mtk_vcodec_vcp_ipi_unlock(struct mtk_vcp *vcp, u32 ipi_id)
> +{
> +	struct mutex *lock =3D mtk_vcodec_vcp_get_ipi_lock(vcp, ipi_id);
> +
> +	if (!lock)
> +		return;
> +
> +	lockdep_assert_held(lock);
> +	mutex_unlock(lock);
> +}
> +
> +static spinlock_t *mtk_vcodec_vcp_get_msg_queue_lock(struct mtk_vcodec_f=
w *fw)
> +{
> +	return &fw->vcp->msg_queue.lock;
> +}
> +
> +static void mtk_vcodec_vcp_msq_queue_lock(struct mtk_vcodec_fw *fw, unsi=
gned long *flags)
> +{
> +	spinlock_t *lock =3D mtk_vcodec_vcp_get_msg_queue_lock(fw);
> +
> +	if (!lock)
> +		return;
> +
> +	spin_lock_irqsave(lock, *flags);
> +}
> +
> +static void mtk_vcodec_vcp_msq_queue_unlock(struct mtk_vcodec_fw *fw, un=
signed long *flags)
> +{
> +	spinlock_t *lock =3D mtk_vcodec_vcp_get_msg_queue_lock(fw);
> +
> +	if (!lock)
> +		return;
> +
> +	spin_unlock_irqrestore(lock, *flags);
> +}
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
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void mtk_vcodec_vcp_free_msg_node(struct mtk_vcodec_fw *fw,
> +					 struct mtk_vcp_msg_node *msg_node)
> +{
> +	unsigned long flags;
> +
> +	mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
> +	list_add(&msg_node->list, &fw->vcp->msg_queue.node_list);
> +	mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
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
> +	vcp_ipi_handler_t handler;
> +	unsigned long flags;
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
> +		mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
> +		msg_node =3D list_entry(fw->vcp->msg_queue.msg_list.next,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcp_msg_node, list);
> +		list_del(&msg_node->list);
> +		atomic_dec(&fw->vcp->msg_queue.cnt);
> +		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
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
> +	mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
> +	if (!list_empty(&msg_queue->node_list)) {
> +		msg_node =3D list_entry(msg_queue->node_list.next, struct mtk_vcp_msg_=
node, list);
> +
> +		memcpy(&msg_node->ipi_data, obj, sizeof(*obj));
> +		list_move_tail(&msg_node->list, &msg_queue->msg_list);
> +		atomic_inc(&msg_queue->cnt);
> +		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
> +
> +		dev_dbg(&fw->pdev->dev, "push ipi_id %x msg_id %x, msg cnt %d\n",
> +			obj->id, msg->msg_id, atomic_read(&msg_queue->cnt));
> +
> +		wake_up(&msg_queue->wq);
> +	} else {
> +		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
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
> +	mutex_lock(&vcp->ipi_mutex);
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
> +	ipi_size =3D round_up(VCP_IPI_HEADER_SIZE + len, VCP_IPI_ALIGN);
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
> +	mutex_unlock(&vcp->ipi_mutex);
> +
> +	return vcp->ipi_id_ack[id];
> +
> +error:
> +	mutex_unlock(&vcp->ipi_mutex);
> +	dev_err(&fw->pdev->dev, "send msg error type:%d msg:%d > %d ret:%d\n", =
fw->type, len,
> +		VCP_SHARE_BUF_SIZE, ret);
> +
> +	return ret;
> +}
> +
> +static int check_vcp_loaded(struct mtk_vcodec_fw *fw)
> +{
> +	struct device *dev =3D &fw->pdev->dev;
> +	struct device_driver *drv;
> +
> +	drv =3D driver_find("mtk-vcp", &platform_bus_type);
> +	if (!drv) {
> +		dev_err(dev, "find mtk-vcp driver failed, need to reload.");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_vcodec_vcp_get_vcp_device(struct mtk_vcodec_fw *fw)
> +{
> +	struct device *dev =3D &fw->pdev->dev;
> +	int retry =3D 0, retry_cnt =3D 10000;
> +	phandle vcp_phandle;
> +
> +	while (try_then_request_module(check_vcp_loaded(fw), "mtk-vcp")) {
> +		if (++retry > retry_cnt) {
> +			dev_err(dev, "failed to load mtk-vcp module");
> +			return -EPROBE_DEFER;
> +		}
> +		msleep(1);
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
> +	if (!fw->vcp->is_register_done) {
> +		ret =3D vcp_device->ops->vcp_register_feature(vcp_device, feature_id);
> +		if (ret < 0) {
> +			dev_err(&fw->pdev->dev, "%d register to vcp fail(%d)\n", feature_id, =
ret);
> +			return -EINVAL;
> +		}
> +
> +		fw->vcp->is_register_done =3D true;
> +	}
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
> +	return mtk_vcodec_vcp_msg_ipi_send(fw, id, buf, len, wait);
> +}
> +
> +static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
> +{
> +	struct mtk_vcp_device *vcp_device =3D fw->vcp->vcp_device;
> +	struct device *dev =3D &fw->pdev->dev;
> +	int ret, feature_id;
> +
> +	if (!fw->vcp->vcp_device) {
> +		dev_err(dev, "vcp device is null\n");
> +		return;
> +	}
> +
> +	if (!fw->vcp->is_register_done)
> +		return;
> +
> +	feature_id =3D VDEC_FEATURE_ID;
> +	ret =3D vcp_device->ops->vcp_deregister_feature(vcp_device, VDEC_FEATUR=
E_ID);
> +	if (ret < 0) {
> +		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", feature_id, ret);
> +		return;
> +	}
> +
> +	fw->vcp->is_register_done =3D false;
> +
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
> index 000000000000..fada786124d5
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> @@ -0,0 +1,139 @@
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
> + * @is_register_done: register vcodec to vcp
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
> +	bool is_register_done;
> +};
> +
> +#endif

--=-LdaboJ6Nc8r1AftsqH24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEYoAAKCRDZQZRRKWBy
9O59AP9cW6jhVFC19HgV+MVWScmWsy/eLGqwptrF0nnVhRhigwEAjSmhSFpm7fX+
Xuw5IFkR16ksKXpqWM6007CDWk3YlA8=
=4BKA
-----END PGP SIGNATURE-----

--=-LdaboJ6Nc8r1AftsqH24--

