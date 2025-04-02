Return-Path: <linux-media+bounces-29199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 566CCA789B5
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 10:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C2E18934AE
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C61023536F;
	Wed,  2 Apr 2025 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnM4RCFX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A416BE17;
	Wed,  2 Apr 2025 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582106; cv=none; b=p7keu9UrLzAPNtltIaOPF3Mx46Go6r2pTYtp4M9zQ/6UgE0gkwO4tjz6+bpXm4kyX0gZHTw+YcwcAB/bCrrolamKABS0q+K8Itx7QgV7Kx4ZfqrqS6n6URoH0LeTzpdYwVT9yrLBl6bNQoixd44lKPkp+mGLTyMny911vEYqzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582106; c=relaxed/simple;
	bh=87dNr8hwkllHn1Xfzs3QWzciTqdFJdQoj0fztR4Z4f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAZjx5cZ5tAypRySIBxU8Bm5mVCzSv0i+7Tj2mz/PrGUZdXpcUsdd2ooBz0onzpxD5CwIZ9Spk2IKwqOufrM+3KigK21oQBRq7Awb5Nufu9tW52eHnMBu+32KB+3S6ok0uZdyvzmd71Wqx7DRHgC/hh65DGnMbaBKsQqEBo3F/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnM4RCFX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D346C4CEDD;
	Wed,  2 Apr 2025 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743582106;
	bh=87dNr8hwkllHn1Xfzs3QWzciTqdFJdQoj0fztR4Z4f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnM4RCFX6ZyYhnp20+be1YnPxxuL68IJeWZ3S+rS1u7yoK6m/p8nka8avWxkIMP3U
	 F13YBWNpsgQ8L4v+Yhw+9/Xv62CcWYLp/oMg4L8rpPtSZfSyfPMRqreNpkOxFXhp3X
	 fwdtb9tIAuUwfETUe+hroJCB5/NBm08VdS96qB50DZq8Po7ttTbRuhSXP11WSUmwth
	 xaAt0aa2XBsz2TM3MAP1qVPBR30VePoDZ5LHNGw2fsDKBYToTMHm/EGI232cB7O0Ov
	 aFp3kXhoSpxqhtdgI5JE9iIBgfCt5JI61OONqlL0ZfYemccoKqxw5eTNb8CS4jooLv
	 cSjhN38N/ANzw==
Date: Wed, 2 Apr 2025 10:21:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: i2c: imx219: Remove redundant
 description of data-lanes
Message-ID: <20250402-real-enthusiastic-ostrich-dcc243@krzk-bin>
References: <20250401145759.3253736-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250401145759.3253736-1-niklas.soderlund+renesas@ragnatech.se>

On Tue, Apr 01, 2025 at 04:57:58PM +0200, Niklas S=C3=B6derlund wrote:
> The bindings already reference video-interfaces.yaml in the endpoint
> node, there is no need to duplicate the description of the data-lanes
> property.
>=20
>   An array of physical data lane indexes. Position of an entry determines
>   the logical lane number, while the value of an entry indicates physical
>   lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes =3D <1 2=
>;",
>   assuming the clock lane is on hardware lane 0. If the hardware does not
>   support lane reordering, monotonically incremented values shall be used
>   from 0 or 1 onwards, depending on whether or not there is also a clock
>   lane. This property is valid for serial busses only (e.g. MIPI CSI-2).

Please do not quote bindings in commit. It's never helpful.

>=20
> What the generic binding do not cover is the behavior if the property
> would be omitted. But the imx219 driver have never agreed with the
> description neither. Before commit ceddfd4493b3 ("media: i2c: imx219:

It did not have to agree. See discussion for v3 of patch adding this bindin=
g.

> Support four-lane operation") the driver errored out if not 2 lanes
> where used, and after it if not 2 or 4 lanes where used.

Then... fix the driver?

This property describes hardware, not driver. Why current driver
implementation, e.g. 1 year ago or now, would change the hardware (so
the bindings)?

>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> Hello,
>=20
> The data-lanes property is a common property and the driver have always
> operated as the common description, it seemed silly to break the driver
> to adhere to odd specification, then to correct the bindings. However a
> more correct solution would be to do the work on the driver of course.
>=20
> This is just a drive-by fix in the hope of sparing others the time to
> discover this oddity themself. This is only tested by using the bindings
> themself and by 'make dt_binding_check'.
> ---
>  Documentation/devicetree/bindings/media/i2c/imx219.yaml | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Do=
cumentation/devicetree/bindings/media/i2c/imx219.yaml
> index 07d088cf66e0..31beeb2be2ea 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -55,15 +55,6 @@ properties:
>          unevaluatedProperties: false
> =20
>          properties:
> -          data-lanes:
> -            description: |-
> -              The sensor supports either two-lane, or four-lane operatio=
n.
> -              If this property is omitted four-lane operation is assumed.
> -              For two-lane operation the property must be set to <1 2>.
> -            items:
> -              - const: 1
> -              - const: 2

So 1 lane is also fine? 8 lanes are as well? Previously lack of the
property in DTS meant 4 lanes, now lack of property means anything.

Best regards,
Krzysztof


