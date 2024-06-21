Return-Path: <linux-media+bounces-13903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F1E911FE4
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 11:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F74EB21639
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 09:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1846B16D9BF;
	Fri, 21 Jun 2024 09:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiR6TTtV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723AE43156;
	Fri, 21 Jun 2024 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718960456; cv=none; b=Yt9dzOHRcK+EhKZnpSY5HewFVDRqu7/9/KLAL5OUjDiIDqtUzDiF1Pgt4JUJPzquFx0cSiZ8EsjiXgwMIkt26yUcD2w30tSmfLBW5oN/hNWKJaeG+AvlO///3Km8xdLd5OTxPUp2pQYzol94u/Wfj7Es0lxuAqY4AsHwm1iBkQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718960456; c=relaxed/simple;
	bh=9if5fECP7iXZCzmm9T9MC/4MQfBUdrm184DZ11Gr9XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jm7IKa2065yMnNcqxqgpHXqAgBGit2/ysOv+dnjCD52xqj4CbhQOf/OdygUUYgHQzhv2CDpUVF31W8+P6bRHcWb08PocmdYPw3l31yl/0CYtcFDOiX4KqqMkh5M5iCMNEYsOR28xOG2tG6hI/vxG3F2XYgIKWYfnmWaeFBmB860=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiR6TTtV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969BAC2BBFC;
	Fri, 21 Jun 2024 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718960455;
	bh=9if5fECP7iXZCzmm9T9MC/4MQfBUdrm184DZ11Gr9XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WiR6TTtVsR6xlP1vNXR8iZ+WUzIkrzjWd8kYt6Rf99D/J1LEJpD/XU/o/7ebCoFAz
	 dmR1oCAJefVCTY0coDd5zB0r/sGWmi5dwjQFBw3X5Dp0eYPUKrrHj/l4KdESmXnQix
	 cYiFnUpuAThPYPXGXRvj7ZK1SjVxX9GRLVUk+TCW4Ky958XK4GYGV8xlrQUtVofjfx
	 oeygrZZiyTJpXgSYxlUWWGgE4oJyhpsyi1R5a/vTus4DyTvkDzzCqNLEdrIVC5QYFI
	 yMPQ6XgbJ3SS+8eF286QAxuVW8xHZPEJ8PjMWabSWMZHAnKIhQjN+y7fohdqs+2kH4
	 v8uwGnUvZUd1g==
Date: Fri, 21 Jun 2024 11:00:53 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"jason-jh.lin@mediatek.corp-partner.google.com" <jason-jh.lin@mediatek.corp-partner.google.com>, 
	Jason-ch Chen =?utf-8?B?KOmZs+W7uuixqik=?= <Jason-ch.Chen@mediatek.com>, 
	Shawn Sung =?utf-8?B?KOWui+WtneismSk=?= <Shawn.Sung@mediatek.com>, Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "jkardatzke@google.com" <jkardatzke@google.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Message-ID: <20240621-colossal-acoustic-cassowary-ee8d05@houat>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
 <20240527-determined-sage-piculet-bfec4a@houat>
 <4828461fa10101eec29e2885bc1aa0e2b7114e7c.camel@mediatek.com>
 <20240530-inventive-nippy-bee-bb6fa6@houat>
 <43db5c0959b387ff049dbd285093b076ed1421fa.camel@mediatek.com>
 <705eb69997333ffaf6efec053e376243a3c80265.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sncbl7222dptrev6"
Content-Disposition: inline
In-Reply-To: <705eb69997333ffaf6efec053e376243a3c80265.camel@mediatek.com>


--sncbl7222dptrev6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 11, 2024 at 09:13:03AM GMT, Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5) wrote:
> Hi Maxime,
>=20
> [snip]
>=20
> > > > > > ---
> > > > > > TODO:
> > > > > > 1) Drop MTK_DRM_IOCTL_GEM_CREATE and use DMA_HEAP_IOCTL_ALLOC
> > > > > > in
> > > > > > userspace
> > > > > > 2) DRM driver use secure mailbox channel to handle normal and
> > > > > > secure flow
> > > > > > 3) Implement setting mmsys routing table in the secure world
> > > > > > series
> > > > >=20
> > > > > I'm not sure what you mean here. Why are you trying to upstream
> > > > > something that still needs to be removed from your patch
> > > > > series?
> > > > >=20
> > > >=20
> > > > Because their is too much patches need to be fixed in this
> > > > series,
> > > > so I
> > > > list down the remaining TODO items and send to review for the
> > > > other
> > > > patches.
> > > >=20
> > > > Sorry for the bothering, I'll drop this at the next version.
> > >=20
> > > If you don't intend to use it, we just shouldn't add it. Removing
> > > the
> > > TODO item doesn't make sense, even more so if heaps should be the
> > > way
> > > you handle this.
> > >=20
> >=20
> > Sorry for this misunderstanding.
> >=20
> > I mean I'll remove the DRM_IOCTL_GEM_CREATE patch and then change
> > user
> > space calling DMA_HEAP_IOCTL_ALLOC to allocate buffer from secure
> > heap.
> >=20
>=20
> I have changed user space to use DMA_HEAP_IOCTL_ALLOC to allocate
> secure buffer, but I still encounter the problem of determining whether
> the buffer is secure in mediatek-drm driver to add some secure
> configure for hardware.
>=20
>=20
> As the comment in [1], dma driver won't provide API for use.
> [1]:=20
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240515112308.=
10171-3-yong.wu@mediatek.com/#25857255
>=20
>=20
> So I use name checking at [PATCH v6 3/7] like this currently:
>=20
> struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device
> *dev,
>             struct dma_buf_attachment *attach, struct sg_table *sg)
> {
>     struct mtk_gem_obj *mtk_gem;
>=20
>     /* check if the entries in the sg_table are contiguous */
>     if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
>         DRM_ERROR("sg_table is not contiguous");
>         return ERR_PTR(-EINVAL);
>     }
>=20
>     mtk_gem =3D mtk_gem_init(dev, attach->dmabuf->size);
>     if (IS_ERR(mtk_gem))
>         return ERR_CAST(mtk_gem);
>=20
> +   mtk_gem->secure =3D (!strncmp(attach->dmabuf->exp_name, "restricted",
> 10));
>     mtk_gem->dma_addr =3D sg_dma_address(sg->sgl);
> +   mtk_gem->size =3D attach->dmabuf->size;
>     mtk_gem->sg =3D sg;
>=20
>     return &mtk_gem->base;
> }
>=20
> But I want to change this name checking to the information brought from
> user space.
> I tried to use arg->flags to append the secure flag in user space and
> call drmPrimeHandleToFD() to pass it to DRM driver, but it will be
> blocked by at the beginning of the drm_prime_handle_to_fd_ioctl().

I agree with you, it's something to discuss mostly with the dma-buf
maintainers but it would be better to just set a flag on the dma-buf,
and use that flag whenever necessary.

It might be related to the recent work I did to introduce allocation
flags too:
https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd04=
9511@kernel.org/

Maxime

--sncbl7222dptrev6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnVBRAAKCRDj7w1vZxhR
xW0eAQDL7FsolnEpQg0yKYGy2J97ffePbyQRQLT7aLkrr2nOygEA8o8jrPiaA91q
rOBhlLYPPx+pkleZ2bdvAacEXvA3QQA=
=dCqI
-----END PGP SIGNATURE-----

--sncbl7222dptrev6--

