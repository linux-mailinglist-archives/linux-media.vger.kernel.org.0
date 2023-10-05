Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56F967BA142
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 16:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239265AbjJEOrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 10:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239917AbjJEOoq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 10:44:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6483A2486F
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 07:22:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5918EC32780;
        Thu,  5 Oct 2023 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696502704;
        bh=XRC9UryHbUEsQdaF6x3efpHlNgThognn4H3PZ5L4330=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YuDVTzzjRCW2yD6QDKXJghEYby51BgGDyAfX3nwaQl5vVl72mySyEJnutqi05l9uP
         QJShO6hjRXiiS5SNBd9+6Q1T3sVHcEyJ0GhOaEXiygKA2RkntskbWE/by8bJoaRIjq
         R8WzHFFk/DJRU5UuIYzts5X9VbROBBrMkbPdjKmQDlEr2gjbUiM1vQ8JlT07olXG34
         X8uxeo4PaDov7go106Bdm/T24cEISHqCnMgci2KTjAqXee93lomMwyAFUc0zzBUggn
         gBJ3//6DIM4Bxq4x4GJz16ryrpRjTa9iz0rHhzenjh28PaDtjYoHV416WPGgluNTKA
         HXzrsZtuoGMjw==
Date:   Thu, 5 Oct 2023 11:44:58 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com,
        martink@posteo.de, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, marex@denx.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] media: dt-bindings: imx7-csi: Make power-domains not
 required for imx8mq
Message-ID: <20231005-quartered-thickness-581df8bd04e4@spud>
References: <20231004201105.2323758-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s4XolRVR2rJVFP+W"
Content-Disposition: inline
In-Reply-To: <20231004201105.2323758-1-festevam@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--s4XolRVR2rJVFP+W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2023 at 05:11:05PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> On i.MX8MQ the MIPI CSI block does have an associated power-domain, but
> the CSI bridge does not.
>=20
> Remove the power-domains requirement from the i.MX8MQ CSI bridge
> to fix the following schema warning:
>=20
> imx8mq-librem5-r4.dtb: csi@30a90000: 'power-domains' is a required proper=
ty
> from schema $id: http://devicetree.org/schemas/media/nxp,imx7-csi.yaml#
>=20
> Fixes: de655386845a ("media: dt-bindings: media: imx7-csi: Document i.MX8=
M power-domains property")
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>=20
>  Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/=
Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> index 358019e85d90..326284e151f6 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> @@ -59,7 +59,6 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - fsl,imx8mq-csi
>                - fsl,imx8mm-csi
>      then:
>        required:
> --=20
> 2.34.1
>=20

--s4XolRVR2rJVFP+W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZR6TqQAKCRB4tDGHoIJi
0u24AQDNf0kjVbWHUSX56Cp1FoWROJRaLoVTvz716xtM8BaxsQD/a2wnp110JUXd
L6rch6QN7EFLI28zusL8cD+THcYeYwo=
=UCD9
-----END PGP SIGNATURE-----

--s4XolRVR2rJVFP+W--
