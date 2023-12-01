Return-Path: <linux-media+bounces-1483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDF0800EBA
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 16:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79B7E281C20
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 15:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF34F4AF9D;
	Fri,  1 Dec 2023 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBvTh41K"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7914AF87;
	Fri,  1 Dec 2023 15:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DAEC433C9;
	Fri,  1 Dec 2023 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701445311;
	bh=JGX/Z3BTWHIf5qRlqFz/16EnPOGE2v0/UGv9oJWij2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBvTh41K3htiHVvOXeF2xq0TovBOYbSQnYtZ7onB7gNOqr46wMQNhy41h/9YkWIJc
	 UKKmOuGeImfn0stD5ZejQhae+qgNneoCJ+t3yKCC12NdMAZcmfL0uNYpMMjjGKOhj4
	 azb/kAIlJZFRKtmz/+4eORtZ1JzpXli1Fb0DXl+wvPlvbI4zYqHfl2rQL+VJaVatS0
	 KPYRpfoOYZjw4AD4MBVyZ0nlSdqBA9JOonb3pEUfYwVT2PjaxYixPoFv7A8kKwr5qt
	 beAwPhKfnDdB4p01Rt9XFOS/n8+ZbjB4taZ0oiqJOER0z2rBNJu1xZs3s6izFGWhTm
	 yft3boi4ZkflQ==
Date: Fri, 1 Dec 2023 15:41:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: sakari.ailus@linux.intel.com, rfoss@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	xji@analogixsemi.com, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: drm/bridge: anx7625: Remove
 incorrect bus-type
Message-ID: <20231201-blush-hate-165029f3e2c9@spud>
References: <20231201123935.1057929-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a0SSux8lcc0JVEmQ"
Content-Disposition: inline
In-Reply-To: <20231201123935.1057929-1-festevam@gmail.com>


--a0SSux8lcc0JVEmQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 09:39:33AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> bus-type =3D <7> is incorrect as this is a DSI endpoint, not a DPI
> endpoint.
>=20
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
> Changes since v1:
> - Newly introduced.
>=20
>  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml     | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,an=
x7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7=
625.yaml
> index a1ed1004651b..f043d57dd25a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.y=
aml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.y=
aml
> @@ -157,7 +157,6 @@ examples:
>                      reg =3D <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint =3D <&mipi_dsi>;
> -                        bus-type =3D <7>;
>                          data-lanes =3D <0 1 2 3>;
>                      };
>                  };
> --=20
> 2.34.1
>=20

--a0SSux8lcc0JVEmQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWn+ugAKCRB4tDGHoIJi
0pwbAP4kUsMwJf9u4n8qY79s14gi3VfWFhuvGADbI8Owh+jBpwEAjOvwNa+ntY8u
/Rmldu7f38EDDH716Tcm+1GrOtvqQA4=
=S40e
-----END PGP SIGNATURE-----

--a0SSux8lcc0JVEmQ--

