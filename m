Return-Path: <linux-media+bounces-48649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B8FCB720A
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 21:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A81C9300249C
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 20:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1595E31AA8E;
	Thu, 11 Dec 2025 20:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N9n5us6c"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C253E2DF146;
	Thu, 11 Dec 2025 20:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765483904; cv=none; b=u3t72tEQBdMCMmcWDRhy3HXXibRmYZ+pJpzHivnoDUqS3K1Ljjl9pC2/YChDgRv9TuRSugahrdiMf303hClQ82LhL59CV2SqSk89BLFvDiaGyoRsdbJ7PotU2b34PbR0x5i56Qbi4W7wmzZ6bglsxIr8DrxC/LwQbKsdTWvC7iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765483904; c=relaxed/simple;
	bh=PLnSDtkByS2g5MMkHxMWJxy6iPfJtsWvDSqXxeFG9Lc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rbvo8emyUimtF4AUWZfn6LACoT+BE62u3ybbdYEfAmjYHRBo6BYIygYtqFdN73dH6lT9sqMe+15uhOCuc1xoOrwKc2xNi6bs+avZLV+gR25BgahA4tvrpM/0V4SVy92y7JZ9mqaLZ7cHr1+LKxMMu64h0XlRGNwzAavODZCuqfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N9n5us6c; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765483899;
	bh=PLnSDtkByS2g5MMkHxMWJxy6iPfJtsWvDSqXxeFG9Lc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=N9n5us6c9RaRiVgVdZwNL4hg43ZuR/nQibPkEnuyqhakE9tpUGB3+zHDljVRH6DMh
	 QyhHs0kPTXHfVwtkeicKiwBGY+hIOUOpTYJWrKawkRMlSs2l0Osgq75je8p0RmlfaQ
	 BS7O+O9QnorUyUxVEevdtC1EfBv/Y8PXg6hsK5jmJEIhTmw07Oi5wb4k06AppyhRvV
	 YF+vYkENyNBQlnRk9UMjkLNGe5lhi54995k41fqcLnUTU3MqZrvRNfwKgZr1XEYSVq
	 tfxhd/DXJyeT0PiT5NL3/2eqH49+lNXJAAuFuFcSs1CLPy13nt8AQXGKUzt6znZFjX
	 R4mUmf8cLetKg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B2FB17E1154;
	Thu, 11 Dec 2025 21:11:37 +0100 (CET)
Message-ID: <777147df01b9d939ba86a9a006e3615d6478a773.camel@collabora.com>
Subject: Re: [PATCH v6 02/10] media: mediatek: decoder: Add a new platform
 data member
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,  George Sun
 <george.sun@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Date: Thu, 11 Dec 2025 15:11:34 -0500
In-Reply-To: <20251202074038.3173-3-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-3-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-wSDV3CWGPG4nXV1V7/V3"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-wSDV3CWGPG4nXV1V7/V3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:40 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> Add a new platform data member to indicate each decoder IC
> to avoid the chip name definition keep growing.
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec.h=C2=A0 |=C2=A0=C2=A0 5 =
+
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 35 +----
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 15 +-
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_hw.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0 |=C2=A0=C2=A0 1 =
+
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 137 +++++++++++++++=
---
> =C2=A06 files changed, 131 insertions(+), 64 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> index 1af075fc0194..80cb46f1cded 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> @@ -69,6 +69,11 @@ extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
> =C2=A0extern const struct media_device_ops mtk_vcodec_media_ops;
> =C2=A0extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
> =C2=A0extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata;
> =C2=A0extern const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata;
> =C2=A0extern const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata=
;
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index 6fb05bb00641..d7a269045fd6 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -331,24 +331,7 @@ static const struct v4l2_file_operations mtk_vcodec_=
fops =3D {
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev =
*vdec_dev)
> =C2=A0{
> -	struct device *dev =3D &vdec_dev->plat_dev->dev;
> -
> -	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec")=
)
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8173;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-=
dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8183;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-=
dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8192;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-=
dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8195;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-=
dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8186;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-=
dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8188;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-=
dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8196;
> -	else
> -		vdec_dev->chip_name =3D MTK_VDEC_INVAL;
> +	vdec_dev->chip_name =3D vdec_dev->vdec_pdata->chip_name;
> =C2=A0}
> =C2=A0
> =C2=A0static int mtk_vcodec_probe(struct platform_device *pdev)
> @@ -367,10 +350,6 @@ static int mtk_vcodec_probe(struct platform_device *=
pdev)
> =C2=A0	dev->plat_dev =3D pdev;
> =C2=A0
> =C2=A0	mtk_vcodec_dec_get_chip_name(dev);
> -	if (dev->chip_name =3D=3D MTK_VDEC_INVAL) {
> -		dev_err(&pdev->dev, "Failed to get decoder chip name");
> -		return -EINVAL;
> -	}
> =C2=A0
> =C2=A0	dev->vdec_pdata =3D of_device_get_match_data(&pdev->dev);
> =C2=A0	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> @@ -387,7 +366,7 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =C2=A0		return -ENODEV;
> =C2=A0	}
> =C2=A0	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> -	if (dev->chip_name =3D=3D MTK_VDEC_MT8196) {
> +	if (dev->chip_name =3D=3D 8196) {
> =C2=A0		ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
> =C2=A0		if (ret) {
> =C2=A0			dev_err(&pdev->dev, "Failed to enable 36-bit DMA: %d\n", ret);
> @@ -556,23 +535,23 @@ static const struct of_device_id mtk_vcodec_match[]=
 =3D {
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8192-vcodec-dec",
> -		.data =3D &mtk_lat_sig_core_pdata,
> +		.data =3D &mtk_vdec_8192_pdata,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8186-vcodec-dec",
> -		.data =3D &mtk_vdec_single_core_pdata,
> +		.data =3D &mtk_vdec_8186_pdata,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8195-vcodec-dec",
> -		.data =3D &mtk_lat_sig_core_pdata,
> +		.data =3D &mtk_vdec_8195_pdata,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8188-vcodec-dec",
> -		.data =3D &mtk_lat_sig_core_pdata,
> +		.data =3D &mtk_vdec_8188_pdata,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8196-vcodec-dec",
> -		.data =3D &mtk_lat_sig_core_pdata,
> +		.data =3D &mtk_vdec_8196_pdata,
> =C2=A0	},
> =C2=A0	{},
> =C2=A0};
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index 429b32952194..2dbde8d00e6f 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -19,17 +19,6 @@
> =C2=A0#define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC=
_INNER_RACING)
> =C2=A0#define IS_VDEC_SUPPORT_EXT(capability) ((capability) & MTK_VDEC_IS=
_SUPPORT_EXT)
> =C2=A0
> -enum mtk_vcodec_dec_chip_name {
> -	MTK_VDEC_INVAL =3D 0,
> -	MTK_VDEC_MT8173 =3D 8173,
> -	MTK_VDEC_MT8183 =3D 8183,
> -	MTK_VDEC_MT8186 =3D 8186,
> -	MTK_VDEC_MT8188 =3D 8188,
> -	MTK_VDEC_MT8192 =3D 8192,
> -	MTK_VDEC_MT8195 =3D 8195,
> -	MTK_VDEC_MT8196 =3D 8196,
> -};
> -
> =C2=A0/*
> =C2=A0 * enum mtk_vdec_format_types - Structure used to get supported
> =C2=A0 *		=C2=A0 format types according to decoder capability
> @@ -106,6 +95,7 @@ struct vdec_pic_info {
> =C2=A0 *
> =C2=A0 * @is_subdev_supported: whether support parent-node architecture(s=
ubdev)
> =C2=A0 * @uses_stateless_api: whether the decoder uses the stateless API =
with requests
> + * @chip_name: platforms configuration values
> =C2=A0 */
> =C2=A0struct mtk_vcodec_dec_pdata {
> =C2=A0	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
> @@ -127,6 +117,7 @@ struct mtk_vcodec_dec_pdata {
> =C2=A0
> =C2=A0	bool is_subdev_supported;
> =C2=A0	bool uses_stateless_api;
> +	unsigned int chip_name;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -307,7 +298,7 @@ struct mtk_vcodec_dec_dev {
> =C2=A0	struct mutex dec_racing_info_mutex;
> =C2=A0	struct mtk_vcodec_dbgfs dbgfs;
> =C2=A0
> -	enum mtk_vcodec_dec_chip_name chip_name;
> +	unsigned int chip_name;
> =C2=A0};
> =C2=A0
> =C2=A0static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_=
fh *fh)
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> index e4e527fe54dc..a926dc14d39d 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> @@ -76,7 +76,7 @@ static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_de=
v *dev)
> =C2=A0{
> =C2=A0	u32 val, mask, addr =3D VDEC_XPC_CLEAN_ADDR;
> =C2=A0
> -	if (dev->main_dev->chip_name !=3D MTK_VDEC_MT8196)
> +	if (dev->main_dev->chip_name !=3D 8196)
> =C2=A0		return;
> =C2=A0
> =C2=A0	val =3D dev->hw_idx =3D=3D MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL : VDEC=
_XPC_CORE_VAL;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c
> index aa9bdee7a96c..8ddb61670dc6 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -618,4 +618,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata=
 =3D {
> =C2=A0	.flush_decoder =3D mtk_vdec_flush_decoder,
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> +	.chip_name =3D 8173,
> =C2=A0};
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index c1cef78471a9..d249a8774948 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -550,16 +550,16 @@ static void mtk_vcodec_dec_fill_h264_level(struct v=
4l2_ctrl_config *cfg,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8192:
> -	case MTK_VDEC_MT8188:
> +	case 8192:
> +	case 8188:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
> =C2=A0		break;
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
> =C2=A0		break;
> -	case MTK_VDEC_MT8183:
> -	case MTK_VDEC_MT8186:
> +	case 8183:
> +	case 8186:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
> =C2=A0		break;
> =C2=A0	default:
> @@ -572,9 +572,9 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v=
4l2_ctrl_config *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8188:
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8188:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
> =C2=A0		break;
> =C2=A0	default:
> @@ -587,11 +587,11 @@ static void mtk_vcodec_dec_fill_h265_level(struct v=
4l2_ctrl_config *cfg,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8188:
> +	case 8188:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
> =C2=A0		break;
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
> =C2=A0		break;
> =C2=A0	default:
> @@ -604,9 +604,9 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v=
4l2_ctrl_config *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8188:
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8188:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
> =C2=A0		break;
> =C2=A0	default:
> @@ -619,15 +619,15 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4=
l2_ctrl_config *cfg,
> =C2=A0					=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8192:
> -	case MTK_VDEC_MT8188:
> +	case 8192:
> +	case 8188:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
> =C2=A0		break;
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
> =C2=A0		break;
> -	case MTK_VDEC_MT8186:
> +	case 8186:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
> =C2=A0		break;
> =C2=A0	default:
> @@ -640,9 +640,9 @@ static void mtk_vcodec_dec_fill_vp9_profile(struct v4=
l2_ctrl_config *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8188:
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8188:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2;
> =C2=A0		break;
> =C2=A0	default:
> @@ -886,6 +886,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata=
 =3D {
> =C2=A0	.get_cap_buffer =3D vdec_get_cap_buffer,
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> +	.chip_name =3D 8183,
> =C2=A0};
> =C2=A0
> =C2=A0/* This platform data is used for one lat and one core architecture=
. */
> @@ -906,6 +907,78 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_p=
data =3D {
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0};
> =C2=A0
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata =3D {
> +	.init_vdec_params =3D mtk_init_vdec_params,
> +	.ctrls_setup =3D mtk_vcodec_dec_ctrls_setup,
> +	.vdec_vb2_ops =3D &mtk_vdec_request_vb2_ops,
> +	.vdec_formats =3D mtk_video_formats,
> +	.num_formats =3D &num_formats,
> +	.default_out_fmt =3D &default_out_format,
> +	.default_cap_fmt =3D &default_cap_format,
> +	.uses_stateless_api =3D true,
> +	.worker =3D mtk_vdec_worker,
> +	.flush_decoder =3D mtk_vdec_flush_decoder,
> +	.cap_to_disp =3D mtk_vdec_stateless_cap_to_disp,
> +	.get_cap_buffer =3D vdec_get_cap_buffer,
> +	.is_subdev_supported =3D true,
> +	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> +	.chip_name =3D 8188,
> +};
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata =3D {
> +	.init_vdec_params =3D mtk_init_vdec_params,
> +	.ctrls_setup =3D mtk_vcodec_dec_ctrls_setup,
> +	.vdec_vb2_ops =3D &mtk_vdec_request_vb2_ops,
> +	.vdec_formats =3D mtk_video_formats,
> +	.num_formats =3D &num_formats,
> +	.default_out_fmt =3D &default_out_format,
> +	.default_cap_fmt =3D &default_cap_format,
> +	.uses_stateless_api =3D true,
> +	.worker =3D mtk_vdec_worker,
> +	.flush_decoder =3D mtk_vdec_flush_decoder,
> +	.cap_to_disp =3D mtk_vdec_stateless_cap_to_disp,
> +	.get_cap_buffer =3D vdec_get_cap_buffer,
> +	.is_subdev_supported =3D true,
> +	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> +	.chip_name =3D 8192,
> +};

I really like the change overall, but this adds a lot of code duplication.
Perhaps you could do something like:

+#define MTK_STATELESS_DEC_DATA \
+	.init_vdec_params =3D mtk_init_vdec_params,
+	.ctrls_setup =3D mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops =3D &mtk_vdec_request_vb2_ops,
+	.vdec_formats =3D mtk_video_formats,
+	.num_formats =3D &num_formats,
+	.default_out_fmt =3D &default_out_format,
+	.default_cap_fmt =3D &default_cap_format,
+	.uses_stateless_api =3D true,
+	.worker =3D mtk_vdec_worker,
+	.flush_decoder =3D mtk_vdec_flush_decoder,
+	.cap_to_disp =3D mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer =3D vdec_get_cap_buffer,
+	.is_subdev_supported =3D true

+const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata =3D {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_name =3D 8192,
+};

The other method also used in various drivers is to embed a pointer to anot=
her
structure. The benefit of this second method is that it reduce the driver b=
inary
size. With one solution to the copy paste issue implemented, the patch look=
s
good.

regards,
Nicolas

> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata =3D {
> +	.init_vdec_params =3D mtk_init_vdec_params,
> +	.ctrls_setup =3D mtk_vcodec_dec_ctrls_setup,
> +	.vdec_vb2_ops =3D &mtk_vdec_request_vb2_ops,
> +	.vdec_formats =3D mtk_video_formats,
> +	.num_formats =3D &num_formats,
> +	.default_out_fmt =3D &default_out_format,
> +	.default_cap_fmt =3D &default_cap_format,
> +	.uses_stateless_api =3D true,
> +	.worker =3D mtk_vdec_worker,
> +	.flush_decoder =3D mtk_vdec_flush_decoder,
> +	.cap_to_disp =3D mtk_vdec_stateless_cap_to_disp,
> +	.get_cap_buffer =3D vdec_get_cap_buffer,
> +	.is_subdev_supported =3D true,
> +	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> +	.chip_name =3D 8195,
> +};
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata =3D {
> +	.init_vdec_params =3D mtk_init_vdec_params,
> +	.ctrls_setup =3D mtk_vcodec_dec_ctrls_setup,
> +	.vdec_vb2_ops =3D &mtk_vdec_request_vb2_ops,
> +	.vdec_formats =3D mtk_video_formats,
> +	.num_formats =3D &num_formats,
> +	.default_out_fmt =3D &default_out_format,
> +	.default_cap_fmt =3D &default_cap_format,
> +	.uses_stateless_api =3D true,
> +	.worker =3D mtk_vdec_worker,
> +	.flush_decoder =3D mtk_vdec_flush_decoder,
> +	.cap_to_disp =3D mtk_vdec_stateless_cap_to_disp,
> +	.get_cap_buffer =3D vdec_get_cap_buffer,
> +	.is_subdev_supported =3D true,
> +	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> +	.chip_name =3D 8196,
> +};
> +
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata =3D {
> =C2=A0	.init_vdec_params =3D mtk_init_vdec_params,
> =C2=A0	.ctrls_setup =3D mtk_vcodec_dec_ctrls_setup,
> @@ -922,3 +995,21 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_single_co=
re_pdata =3D {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0};
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata =3D {
> +	.init_vdec_params =3D mtk_init_vdec_params,
> +	.ctrls_setup =3D mtk_vcodec_dec_ctrls_setup,
> +	.vdec_vb2_ops =3D &mtk_vdec_request_vb2_ops,
> +	.vdec_formats =3D mtk_video_formats,
> +	.num_formats =3D &num_formats,
> +	.default_out_fmt =3D &default_out_format,
> +	.default_cap_fmt =3D &default_cap_format,
> +	.uses_stateless_api =3D true,
> +	.worker =3D mtk_vdec_worker,
> +	.flush_decoder =3D mtk_vdec_flush_decoder,
> +	.cap_to_disp =3D mtk_vdec_stateless_cap_to_disp,
> +	.get_cap_buffer =3D vdec_get_cap_buffer,
> +	.is_subdev_supported =3D true,
> +	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> +	.chip_name =3D 8186,
> +};

--=-wSDV3CWGPG4nXV1V7/V3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTsldgAKCRDZQZRRKWBy
9L7pAQD1I+aBY+7Zz3akDdlwRpYX6QsH6UB9hqUvZeayQUyKhwD6A+ogOAq2gG0N
YDQrJ5v+BeUq0OxHCVek/HNOOqsYkQI=
=tIFu
-----END PGP SIGNATURE-----

--=-wSDV3CWGPG4nXV1V7/V3--

