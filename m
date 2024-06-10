Return-Path: <linux-media+bounces-12875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7EB902643
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 18:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D461C1C21A10
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 16:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B40D1422CA;
	Mon, 10 Jun 2024 16:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8Q9EX5+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE312E1F1;
	Mon, 10 Jun 2024 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718035433; cv=none; b=PU6YA49gqXK5RIU9rq6p4I0fda3cym5Kk23B+cNPAWDlaRa1atj4nW8WYgNE8MYn8iQrf3N52JAmQDiiuZYCv3moPN1yG4nKRNuPGVgLBA7/9K4SFICee8Kaoj4EzohGm+jzdIoNCWB9pVM8ydBFxjnLJHD1nSmYYbpoFrWjKJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718035433; c=relaxed/simple;
	bh=RwF9HGM3v2JKmElGI/IpKM2vavADFeV3uIMUuQdu26c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q07qi59ffdAGyzWsnE+umAOeQUwetoeAFqbKYlnSzcXPjElULMbLXVC4uSgIrn0idj+JPVTpFTKR96y5pUtteZApTiDuUIZ5kfvVxkTB3c0Q9xuy9RZpci0qhbCYioS/Jxaz4RZs5Vm408fKRgTdIp6YtSlia0l5Phbf/kVzVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8Q9EX5+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E17BC2BBFC;
	Mon, 10 Jun 2024 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718035433;
	bh=RwF9HGM3v2JKmElGI/IpKM2vavADFeV3uIMUuQdu26c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8Q9EX5+QfFyJCpRn7bWKcWYhZ2ozI/RXD9E5XPU87ccZAafj699B+zdYmzmWBziV
	 kyjcQz2D14y++caMYTVT3iDIJYH308qW2xr03tMf6Xf/6HOyfHwSalygea1rexJO/Q
	 oIDmcX7m982/HX4yfz4cw56Go16Y+/X67D80NLa/f6eCcc+wca/VqbqTv3V0GKhlzL
	 uYoI51TTtGPHOT3koTxy2dm01g5XROmIzsQ+VIVGpl3f2P5VSz0kMi8oVIbxL4p3LV
	 lG0frsg/As6SHhQuVAZUTm20DWUhtEGpF5ypwKB4wr6kiSUhmwkGSrtyIgYN8R2jpz
	 OlATPS7zbOvmg==
Date: Mon, 10 Jun 2024 17:03:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240610-screen-wolverine-78370c66d40f@spud>
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
 <20240610113124.2396688-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UpOQ7ScyTPHogBDg"
Content-Disposition: inline
In-Reply-To: <20240610113124.2396688-2-niklas.soderlund+renesas@ragnatech.se>


--UpOQ7ScyTPHogBDg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 01:31:23PM +0200, Niklas S=F6derlund wrote:
> Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,vin.yaml
> index 5539d0f8e74d..168cb02f8abe 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -54,6 +54,7 @@ properties:
>                - renesas,vin-r8a77995 # R-Car D3
>                - renesas,vin-r8a779a0 # R-Car V3U
>                - renesas,vin-r8a779g0 # R-Car V4H
> +              - renesas,vin-r8a779h0 # R-Car V4M

Your driver patch suggests that this is compatible with the g variant.

--UpOQ7ScyTPHogBDg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmcj5QAKCRB4tDGHoIJi
0tFhAP9hVva+Qfu5znqYBjqL6eKNP0nBZMzhNm581qicnXKWfAEAgAHMIl3RsIOu
RdQ/KcfmhQrIDCv2bH5uv5PwlCnpCAI=
=/tCf
-----END PGP SIGNATURE-----

--UpOQ7ScyTPHogBDg--

