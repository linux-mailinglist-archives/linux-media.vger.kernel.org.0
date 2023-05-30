Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB01D716B45
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbjE3RjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbjE3RjF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:39:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAB3D9;
        Tue, 30 May 2023 10:39:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4ED6162D5F;
        Tue, 30 May 2023 17:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A2FC433D2;
        Tue, 30 May 2023 17:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685468343;
        bh=PXZWUXSfkWKnbZdOJQ745JJcNt8T3F3F734Sa0Rsf/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TMhVnZ67f8TchBG2MzlBujRv1NMwkXt7gtykTyY4bSiXuUqm5iY+DA51boNYC0QgL
         iJRirze8WHhYW/bT0/lDQKfc15nNvjpGF+HvRhfHk3pb6cM7LC6MTA2P6gukgURFqz
         htgz5zP1D2dzYqTFyNoJ6kkCYkYHlDrFPrncrF1JVOtZ1Yl5nFPnY8x+873IpFPmNZ
         gw4vIkgq4vNZPSYYSHWPIa1S1KHdF6KxpZ5NQf+CsU3+2wx98Bwo6wQAFQ3OBdD7fR
         a7cubrcikLhpN4N/0zFphFEHqDA++dVslS+Ksm+/GHHoaWB9ZPiR3LgkFe0ozW2veJ
         hb9iRCA5x7ZWg==
Date:   Tue, 30 May 2023 18:38:59 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 19/21] dt-bindings: media: imx258: Add alternate
 compatible strings
Message-ID: <20230530-crying-dispose-2a0e3bc76301@spud>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-20-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hV9/IiexTQruE/8b"
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-20-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--hV9/IiexTQruE/8b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Dave,

On Tue, May 30, 2023 at 06:29:58PM +0100, Dave Stevenson wrote:
> There are a number of variants of the imx258 modules that can not
> be differentiated at runtime, so add compatible strings for them.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx258.yaml         | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> index bee61a443b23..3415b26b5991 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> @@ -14,10 +14,15 @@ description: |-
>    type stacked image sensor with a square pixel array of size 4208 x 312=
0. It
>    is programmable through I2C interface.  Image data is sent through MIPI
>    CSI-2.
> +  There are a number of variants of the sensor which cannot be detected =
at
> +  runtime, so multiple compatible strings are required to differentiate =
these.

This is implied by having several compatibles.

>  properties:
>    compatible:
> -    const: sony,imx258
> +    oneOf:
> +      - enum:
> +          - sony,imx258
> +          - sony,imx258-pdaf

Why not just
properties:
  compatible:
    enum:
?
I don't see other patches anding more complex compatibles (or they've
not arrived yet) so it doesn't appear to be avoiding churn.

Cheers,
Conor.

--hV9/IiexTQruE/8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHY0swAKCRB4tDGHoIJi
0tXeAQDV61UiSnYHP3vKtQboIM+h4G231JWynXjd6IzOJ9X2/AEA4jWLDAZOsj7N
K/uL7xbJAkvRm7stNZLgJEPNTZDhGwM=
=f9jJ
-----END PGP SIGNATURE-----

--hV9/IiexTQruE/8b--
