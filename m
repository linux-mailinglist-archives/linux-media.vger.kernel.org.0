Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0313195B9E
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 11:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbfHTJum (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 05:50:42 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:41713 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728842AbfHTJul (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 05:50:41 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BF83D1C0014;
        Tue, 20 Aug 2019 09:50:36 +0000 (UTC)
Date:   Tue, 20 Aug 2019 11:52:05 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sh-mobile-ceu: Rename bindings
 documentation file
Message-ID: <20190820095205.xnthl7d7cpy7myq2@uno.localdomain>
References: <20190819140544.19294-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s545u3qgtcd2uv4a"
Content-Disposition: inline
In-Reply-To: <20190819140544.19294-1-horms+renesas@verge.net.au>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--s545u3qgtcd2uv4a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Simon,

On Mon, Aug 19, 2019 at 04:05:44PM +0200, Simon Horman wrote:
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename the SH Mobile CEU file to match this pattern.
>

The old soc-camera based sh-mobile-ceu driver has been removed one
year ago and replaced by driver/media/platform/renesas-ceu.c whose
bindings are described at
Documentation/devicetree/bindings/media/renesas,ceu.txt

Should this file be removed instead of renamed?

Thanks
  j

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> ---
>  .../bindings/media/{sh_mobile_ceu.txt => renesas,sh-mobile-ceu.txt}       | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/media/{sh_mobile_ceu.txt => renesas,sh-mobile-ceu.txt} (100%)
>
> diff --git a/Documentation/devicetree/bindings/media/sh_mobile_ceu.txt b/Documentation/devicetree/bindings/media/renesas,sh-mobile-ceu.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
> rename to Documentation/devicetree/bindings/media/renesas,sh-mobile-ceu.txt
> --
> 2.11.0
>

--s545u3qgtcd2uv4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1bwsUACgkQcjQGjxah
VjyPUg//ThVI0x+SJ7Y34qsLEZs0SgzopAtZefvap9z9/MAUuTbIV6qBA5/BaLqT
O1VQOg//KN/apqfVVcIPI83X1rn1IzIEEznGCKHmKxmehuL4iry+VTWPrJw3EH4y
FPxeKrOZ76GMPsQFX7xBrSGwdfZgNWzmkccFjWM2RtdYC0tDC8fgh6/uKi9XYmRe
lyy8zU4OxVLj1G0Uoqp1o5MX57jgKJ5NWs48FhgCkT+R0Yf01d9b3vwjRZF5C6tO
FTvOSJfSnoP+xaao/GyH5zudiv6LOa5cTohxfUYdEXjiQg9JjNEbWRw35Cmel92U
h/qVboanowTIBPiAlLqMtK0esWe4moGbDlKpsoivae2n53hx47UJElvo3Hu2LhHC
4bAFhpT3MRZB3i8Oqw94yl9JuCwVMc0kzzdG7xcuMQimzuijhmdgNxesxDJJk2gn
FiTt6UrTek4r8E9595/66AT9nN2UB4FnkY79dT1oxT2QJF/FKEh6sFEf6uVgUJDv
f9km+Mnw2JnssBPf+VZI06yyr24aVfhWnt5vxKi0EqIEr9c5g3NYXk15VFRM/Rqb
EG8uGkIpifriE1Ccu1G+A0pb9wPdDqQIuReZjEA0JS7K1YaaZ36ebCaudC5hjZJ2
n7wdqkhOGHzgDQ+vF127kr+ukdEjlkeTC62raHmrU+0pjPH7v64=
=lZjl
-----END PGP SIGNATURE-----

--s545u3qgtcd2uv4a--
