Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76E26FCEA0
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 21:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234622AbjEIThv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 15:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjEIThu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 15:37:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E6D4498;
        Tue,  9 May 2023 12:37:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0046B63699;
        Tue,  9 May 2023 19:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBD5C433D2;
        Tue,  9 May 2023 19:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683661068;
        bh=akCksvr0VjMzfpNXHRrnyFAk16WkbynjlwtjEJ3KVuI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uiZaoA0ZMCn8YT38oDVNemHbnOLJJc8Xe0jtAjsS6E8uHSOpT4wAtzVwBrE+JqMW6
         IAIfcJK9ZtGuIqK/QJUgwhN7tq3tguJRUdNbWzpZ/XWgsy63a/ngeKFl64w3vdyltg
         8sLW6Ajlqd56aO5WpiEKEkZzEmgZHe4lTbGgsU5yc9T6hc5NnPn+dqxFVyYyVTvXDy
         vebNZZILxwbArlWJHdS5c+REff+KkgDWVX3d9AgcVFqd11sxBmdFPPsUh/pp+JSAK5
         k7FiqFjkr5xWLO8G2KrtUxDHOh+Koj8eGtanyGQvO+nOTO7GVpAoHnNyOLisvhpcfW
         toiXh6KBDtESA==
Date:   Tue, 9 May 2023 20:37:43 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: maxim,max96712: Require setting
 bus-type property
Message-ID: <20230509-entree-gratify-102945de8004@spud>
References: <20230509190031.769298-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ijz5PjfBL5MnLr2G"
Content-Disposition: inline
In-Reply-To: <20230509190031.769298-1-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ijz5PjfBL5MnLr2G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 09:00:31PM +0200, Niklas S=F6derlund wrote:
> The MAX96712 can support both a CSI-2 C-PHY and D-PHY bus. The initial
> staging driver however only supported D-PHY and the bus-type property
> was left optional.
>=20
> In preparation for adding C-PHY support to the staging driver make the
> bus-type property mandatory as it is needed to select the correct PHY
> mode. Without the bus-type property present, the driver falls-back to
> D-PHY mode, so the change is functionally backward compatible with old
> DTS files lacking the property.
>=20
> The only in-tree DTS file (renesas/r8a779a0-falcon-csi-dsi.dtsi) that
> lacked the property uses D-PHY and have been updated.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
> * Changes since v1
> - Use symbolic names in comments for the bus-type properties.
> - Improve the commit message.
> - Rebased to v6.4-rc1.
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 444f24838d3d..6c72e77b927c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -65,9 +65,14 @@ properties:
> =20
>              properties:
>                data-lanes: true
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> =20
>              required:
>                - data-lanes
> +              - bus-type
> =20
>      required:
>        - port@4
> @@ -82,6 +87,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> =20
>      i2c@e6508000 {
>              #address-cells =3D <1>;
> @@ -101,6 +107,7 @@ examples:
>                              port@4 {
>                                      reg =3D <4>;
>                                      max96712_out0: endpoint {
> +                                            bus-type =3D <MEDIA_BUS_TYPE=
_CSI2_DPHY>;
>                                              clock-lanes =3D <0>;
>                                              data-lanes =3D <1 2 3 4>;
>                                              remote-endpoint =3D <&csi40_=
in>;
> --=20
> 2.40.1
>=20

--ijz5PjfBL5MnLr2G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFqhBwAKCRB4tDGHoIJi
0r38AQDVJu9s/FIx72+R+64/GqQ+NfgcJEGkp/fdhNEm5F0INAD+P8PL/myzv9di
+HO9Xl1q62kKPFmjWmpuUY7kFF9SYg0=
=PEWr
-----END PGP SIGNATURE-----

--ijz5PjfBL5MnLr2G--
