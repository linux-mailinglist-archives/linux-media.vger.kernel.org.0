Return-Path: <linux-media+bounces-32311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E94FAB3DB5
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 18:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1BD8162D53
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 16:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3F12517B1;
	Mon, 12 May 2025 16:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmcUDIuu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F73246768;
	Mon, 12 May 2025 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067655; cv=none; b=sqQ6yUkvOZW6K9uoR9AjXNCuTiKNiX1cj9wmWNDxfpYEI9/1GLGO5+B3XigQClQKK2dXwgzonltAo+DUWzlpqZ5uWH0vXY3dAx/j45muzuHqSBofuruG+sInwDbonazZdluzFWc7fO293Y8kFCnVniN/P2ajlsy/tBBks2th3Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067655; c=relaxed/simple;
	bh=Lk35CP8LZmPslpsnxWnA0SM9IdKc0rO8t7ScWnmdFIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egDWN2DWvE3OqM+V2cKgvh+Hpie1Q0notlRXLH8jDhT32ufui9ER5dOliun5VfiEGZY1BPH1gNScg15WXSO7CcVmf2kIxGgOew9T3nafDnJ/zDANoezqQINtgMOZ0t5jg1YeA9aQjsZTAgnZ/VyZr9qTsNsbCPbH9OCaUhvLH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmcUDIuu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE71C4CEE7;
	Mon, 12 May 2025 16:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747067655;
	bh=Lk35CP8LZmPslpsnxWnA0SM9IdKc0rO8t7ScWnmdFIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmcUDIuuOHPFo4k8FQ8G660Ixz6AEAHLKmXznOPhu0w0IXzB0oyIo5gjHB01vB9kf
	 ZchRsFHHKQpLt/VVANRBPVZYqXRTnWqWPU2zcKLHTDYvIFv+ul1xY9uXlOi+LLHf8y
	 xRxnBw/xgR9adwcF8zmQdxatg3PK6EFXJ2biKECNfwpjjj23ICfFDJN9koeofULoXz
	 XuC8I/qBi3Yfm/PMN14RdTUPyyU3m7vlaL0agLpC8441DvNvEHz6qoA1JqeSwdPxhs
	 54zCmta26CjV6GuGl2lZY0SkCTFwvn0gh9nwUYc65IV8w/jgTA5/JOjfAqwyjSQf2h
	 SbTXqSvYG8BIw==
Date: Mon, 12 May 2025 17:34:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 01/14] dt-bindings: media: mediatek: vcodec: add decoder
 dt-bindings for mt8196
Message-ID: <20250512-cilantro-aviation-4328d79e02b6@spud>
References: <20250510075357.11761-1-yunfei.dong@mediatek.com>
 <20250510075357.11761-2-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sMtwU4b+uIOkGgh2"
Content-Disposition: inline
In-Reply-To: <20250510075357.11761-2-yunfei.dong@mediatek.com>


--sMtwU4b+uIOkGgh2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 03:53:31PM +0800, Yunfei Dong wrote:
> Add compatible for video decoder on MT8196 platform, which is a
> lat + single core architecture.

Please mention what makes this different from the existing devices since
a fallback compatible is not permitted.

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index bf8082d87ac0..74e1d88d3056 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec
> =20
>    reg:
>      minItems: 1
> --=20
> 2.46.0
>=20
>=20

--sMtwU4b+uIOkGgh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIjAQAKCRB4tDGHoIJi
0k0QAQDsVpMhJhlm50bTaTI++/O1PIGlsmy6yib9ZYoDAbRqIgEA3qnCMVVPvuhw
eIG5A1Me4vqECJW3lsXvK002oVvo+gg=
=OPXB
-----END PGP SIGNATURE-----

--sMtwU4b+uIOkGgh2--

