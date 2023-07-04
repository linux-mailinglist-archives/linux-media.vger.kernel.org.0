Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E13B747749
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 18:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjGDQyi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 12:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbjGDQyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 12:54:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115F710DA;
        Tue,  4 Jul 2023 09:53:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D729612AC;
        Tue,  4 Jul 2023 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59F4C433C7;
        Tue,  4 Jul 2023 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688489622;
        bh=Cj7gCKeIhlKX9Bg5MTAssGlsntg4j/nabWNl6WhYMoU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cX8dXWcW7HmNNFWxKCUdt7bArqhgIrKRzRywc+hKD9JaxAkeWH5DKBPpbMIymbrgP
         x5BSJNXlIDrMygVEGW6IzQ3R9+Y3u2hg02J1sy8hM5K248RvBRRzvw/16iZYNTVwEY
         DzYEvGzoZlQe4N/HD2c4kV7wQZBx6hvQnLUuk29SWk/ZRuYlYOlO1EeTjYCKgzpevM
         cglWF9oUfUTj2XMsldVd1LYMzCgx/7vQmWcn8WUzR97do1iY8yOh2/imTKRSqWULYq
         7MNFAGL0kKdZBeL9Elx/W2h3CR6dVb8Kdw4rfN3BWWxaEeSWjJjbkX7z6jQrcNysK6
         bZHxmyqPiueuQ==
Date:   Tue, 4 Jul 2023 17:53:38 +0100
From:   Conor Dooley <conor@kernel.org>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI
 CSI-2
Message-ID: <20230704-unnamable-sandpaper-01fd3631e1df@spud>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
 <20230703113734.762307-2-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0vkLt1MxvRFe9G4g"
Content-Disposition: inline
In-Reply-To: <20230703113734.762307-2-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--0vkLt1MxvRFe9G4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

I know little about media bindings, so only got a single comment for
you.

On Mon, Jul 03, 2023 at 07:37:33PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>=20
> Add new binding documentation for DesignWare Core MIPI CSI-2 receiver
> and DPHY found on NXP i.MX93.
>=20
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,dwc-mipi-csi2.yaml     | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.ya=
ml b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..ece6fb8991d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml

The filename of the binding should match the compatible.

> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,dwc-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX93 MIPI CSI-2 Host Controller receiver
> +
> +maintainers:
> +  - G.N. Zhou <guoniu.zhou@nxp.com>
> +
> +description: |-
> +  The MIPI CSI-2 receiver found on i.MX93 originates from Synopsys
> +  DesignWare Core and it implements the CSI-2 protocol on the host
> +  side and a DPHY configured as a Slave acts as the physical layer.
> +  Two data lanes are supported on i.MX93 family devices and the data
> +  rate of each lane support up to 1.5Gbps.
> +
> +  While the CSI-2 receiver is separate from the MIPI D-PHY IP core,
> +  the PHY is completely wrapped by the CSI-2 controller and expose
> +  a control interface which only can communicate with CSI-2 controller
> +  This binding thus covers both IP cores.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx93-mipi-csi2

Everywhere else you say NXP, why use Freescale here?

Cheers,
Conor.

--0vkLt1MxvRFe9G4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKROkgAKCRB4tDGHoIJi
0gFoAQCkF7VyY/YHAFelWFT4H+ZrXgG0yMz3Lcj8TjP+cm903QD9GW03vJS2sg/n
jF2PFbD4McoZAJO2c0I8BHHMeUwOhgs=
=3dTI
-----END PGP SIGNATURE-----

--0vkLt1MxvRFe9G4g--
