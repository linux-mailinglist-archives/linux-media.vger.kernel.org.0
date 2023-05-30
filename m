Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3CE716B32
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjE3RfJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbjE3RfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:35:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00BF1A3;
        Tue, 30 May 2023 10:35:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 866836313F;
        Tue, 30 May 2023 17:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67539C433D2;
        Tue, 30 May 2023 17:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685468104;
        bh=/Uvu6pyPwZi08xApVS+/p5HtQI2s77ZRWUR1akR7L4c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WlH5lr/UV0O384HWb1GxhoEQVcLDNxCv1l3BtvfJOee/DExRbo2uZUjPAkIfrOuC/
         t4ckyriOWC0xf68VP/Plkbwe7gaCiRzWFS1R48o/eD6tuAdj9vYPQHeZ3yBLnuDH1c
         ktcZA5hlbZOLAH7ndxcbLv3B5d89P74NlQ+i3p8WeS29D+FSlt2cSjDNX5ZlaGGC0e
         4Ir51U8QlfDz0fBQ/h7ZZp2TfwAUMpmVdG41DewT4bYmmxZmxdul0zzVC6bqjya9FU
         eB2YbrNlSavXPi2h7XueXdIzVqMos4lJQxhqVpKl0RTjETDKcM7qtk1G+cnM1Ecpw/
         OSBtzy/xsVV/w==
Date:   Tue, 30 May 2023 18:35:01 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 18/21] dt-bindings: media: imx258: Rename to include
 vendor prefix
Message-ID: <20230530-vessel-posture-6622edce585f@spud>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-19-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="K4mx+Kso4Rs9Wl/l"
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-19-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--K4mx+Kso4Rs9Wl/l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 06:29:57PM +0100, Dave Stevenson wrote:
> imx258.yaml doesn't include the vendor prefix of sony, so
> rename to add it.
> Update the id entry and MAINTAINERS to match.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../bindings/media/i2c/{imx258.yaml =3D> sony,imx258.yaml}        | 2 +-
>  MAINTAINERS                                                     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml =3D> son=
y,imx258.yaml} (97%)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Do=
cumentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> similarity index 97%
> rename from Documentation/devicetree/bindings/media/i2c/imx258.yaml
> rename to Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> index 80d24220baa0..bee61a443b23 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx258.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26f705e94a41..16d0f64d8ee8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19633,7 +19633,7 @@ M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/i2c/imx258.yaml
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
>  F:	drivers/media/i2c/imx258.c
> =20
>  SONY IMX274 SENSOR DRIVER
> --=20
> 2.25.1
>=20

--K4mx+Kso4Rs9Wl/l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHYzxAAKCRB4tDGHoIJi
0hBDAP0WP+axKYlWKNzd/0nLIVkGpmatCXsdzqbagdjOIqsS4gEAlABSVMmClMkF
o/2Y3qt3fARld51xwjKHSHvV367sRA4=
=mUbc
-----END PGP SIGNATURE-----

--K4mx+Kso4Rs9Wl/l--
