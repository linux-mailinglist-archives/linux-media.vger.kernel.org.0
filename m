Return-Path: <linux-media+bounces-12876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4CF902664
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 18:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCE30B28A1F
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 16:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EA8142E7F;
	Mon, 10 Jun 2024 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orCNGMkr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D41DFF7;
	Mon, 10 Jun 2024 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718035857; cv=none; b=XBtwKt6zGE9uyPTDxGDXpd79jRUAu71dWK/F4tU03yehEaOpDxQ7QTkrdfhZ2/Y5pkywJZR3opEjKw3FB+FQ8DJTC9xE2L07WQZw3DECgTJjBFs0Nnf1KqVmbYLUtxTPf2C5TLI/0Es3lJYDiPShFh9rXa1uiK+YkDQBmqD8Gog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718035857; c=relaxed/simple;
	bh=0SBQKxFziNtepULMRY6wZaiRMZZADYCczi5ZYCguNvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cieKzHBFFxi7E2gIhIfPi2ISW+gswHXUZ9L+aQl7zal9dS7B5GJb90FCFeuaOPXmOcjw5rvcvFkD6EkN4v5QlQ2T9aBkQJtdDbotNVfBkC9f/DexCs9N0vjUXOvToYZR3R74YG/+M13/PPB2oHadaJ7f4e36+gbSq7ABxIkmO2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orCNGMkr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F670C2BBFC;
	Mon, 10 Jun 2024 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718035856;
	bh=0SBQKxFziNtepULMRY6wZaiRMZZADYCczi5ZYCguNvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orCNGMkrY7i6t4PYencQGYpdjnGIA9KBkAbKFHIt0yx5f0KnKzEKb1TU9hkGBN9Nw
	 6HzAGUWT0bz8ucq8NtfpivivHpm9ErRcayZeXWIjfT6YLHUQg6IZtESLw4FHwKqatz
	 EohzaE3fkW21/EiHGpDJRGGvpWt0EyVa5yVMQ2dk8YH4R86BXsWCIZ+FDOu8qD37lZ
	 8qx3fJFuf5TFm9UI4qWmNkPjJUZ17tAXb5tCsbDvNuJDOqXxgakDfpo9x4xVjz0Q8Z
	 Wu8RaBDrRqE8n/WKZAHa2OY75zf+c9/FLbG2FxI2GRR5/mowL/zDx8r45cKHjAXQ5W
	 qLeRD9ZcL1q+g==
Date: Mon, 10 Jun 2024 17:10:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240610-roping-ninja-56074ad61f77@spud>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
 <20240607144154.GD18479@pendragon.ideasonboard.com>
 <cf49fbb3-9de6-4e57-bc38-d720f76118a7@linaro.org>
 <20240610085424.GH26663@pendragon.ideasonboard.com>
 <e9a44b0b-1930-42fa-ab5e-a7eac1470041@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L5tzetz+W9OqfYBE"
Content-Disposition: inline
In-Reply-To: <e9a44b0b-1930-42fa-ab5e-a7eac1470041@linaro.org>


--L5tzetz+W9OqfYBE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 12:18:12PM +0200, Krzysztof Kozlowski wrote:
> On 10/06/2024 10:54, Laurent Pinchart wrote:
> >>
> >>> There's also the camsv IP in the same series that needs a generic nam=
e.
> >>> I really don't know what to propose for it. Could you recommend
> >>> something that would make you happy ?
> >>
> >> Sorry,that's almost half year old thread. Not present in my inbox.
> >=20
> > I remember someone presenting a talk titled "Beginner Linux kernel
> > maintainer's toolbox" in Prague last year. The talk mentioned a tool
> > call b4. I highly recommend it ;-)
>=20
> Wouldn't solve it. I would need to download the thread and import to
> mailbox (several clicks needed) or open in some other tool just to see
> the email. Or find it on lore.kernel.org - anyway just not convenient.

Apparently you can use b4 from within mutt to populate threads, but I am
yet to figure out if it works with non-local maildirs:
https://b4.docs.kernel.org/en/latest/maintainer/mbox.html#using-with-mutt

--L5tzetz+W9OqfYBE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmcliwAKCRB4tDGHoIJi
0lW8AQCShzBBGaBieTe4A+ZSBNiyKUc5whM2VE7q1+SQrFQNTwD/SoFAQzB2ID9X
XndVMh3NKULPW4s3q785mEtlFKVGrgI=
=ihJA
-----END PGP SIGNATURE-----

--L5tzetz+W9OqfYBE--

