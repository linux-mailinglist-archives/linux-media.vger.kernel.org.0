Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF6D748F86
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 23:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbjGEVIL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 17:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjGEVIK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 17:08:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27A01700;
        Wed,  5 Jul 2023 14:08:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3096F6171F;
        Wed,  5 Jul 2023 21:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A188C433C8;
        Wed,  5 Jul 2023 21:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688591288;
        bh=NajrxupDFZ59vM47Ffnp1c/E2get+RZ4lYixh1lFIgU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sOa84jHRbktKJPfJ6am6rrZ1gSN2lSZIkXIK+uzYn6gZPLkr2Br6KyPn4fUqk88pE
         8fosqhnlThm9cNIAeIyUXA1XokLy71hbSuV75uqB9tQ81PKDt0ygKSxLPnPY6VGG+j
         XvQFxvhqIa33g0XifRdoX9h3IkWDhMlukLUyzrcm6EcU4GpmgtLt2kZ+a8GyObx/Gx
         V6KLWVy/tyqGwIhlZA8HcV/hKak0wym20hq+dCeLOYzKya0kbp5ZIDXtBruUKBF6dw
         pt+EdaMSmlJvwpTLqAV6bbzppbb4bhP3Sqih+31ET10Pw7LhgcJj7/ZJX1AF7XF1SF
         dfqnOPzrEz8/A==
Date:   Wed, 5 Jul 2023 22:08:04 +0100
From:   Conor Dooley <conor@kernel.org>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI
 CSI-2
Message-ID: <20230705-edition-fiftieth-83c3875df1ab@spud>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
 <20230703113734.762307-2-guoniu.zhou@oss.nxp.com>
 <20230704-unnamable-sandpaper-01fd3631e1df@spud>
 <AS8PR04MB9080CED9E49E7D7BDD41F26BFA2FA@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2ordbauYosi8OQ95"
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9080CED9E49E7D7BDD41F26BFA2FA@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2ordbauYosi8OQ95
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 01:30:38AM +0000, G.N. Zhou (OSS) wrote:

> > > diff --git
> > > a/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
> > > b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
> > > new file mode 100644
> > > index 000000000000..ece6fb8991d4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
> >=20
> > The filename of the binding should match the compatible.
> >=20
> > > @@ -0,0 +1,140 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/nxp,dwc-mipi-csi2.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP i.MX93 MIPI CSI-2 Host Controller receiver
> > > +
> > > +maintainers:
> > > +  - G.N. Zhou <guoniu.zhou@nxp.com>
> > > +
> > > +description: |-
> > > +  The MIPI CSI-2 receiver found on i.MX93 originates from Synopsys
> > > +  DesignWare Core and it implements the CSI-2 protocol on the host
> > > +  side and a DPHY configured as a Slave acts as the physical layer.
> > > +  Two data lanes are supported on i.MX93 family devices and the data
> > > +  rate of each lane support up to 1.5Gbps.
> > > +
> > > +  While the CSI-2 receiver is separate from the MIPI D-PHY IP core,
> > > + the PHY is completely wrapped by the CSI-2 controller and expose  a
> > > + control interface which only can communicate with CSI-2 controller
> > > + This binding thus covers both IP cores.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - fsl,imx93-mipi-csi2
> >=20
> > Everywhere else you say NXP, why use Freescale here?
>=20
> Due to history reason, all i.MX platforms of NXP use "fsl" as vendor abbr=
eviation prefix.

Okay. Please update the filename to patch the "fsl" compatible then.

Cheers,
Conor.

--2ordbauYosi8OQ95
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKXbswAKCRB4tDGHoIJi
0rqDAQD2o8q/HPtI3O9v9iTqcw3JPiCMaC4xvDuqKsZs/eisXwD/SmxI/pBth0Tj
j3YkXH7uku2hQmh9N4ssl5uWlnmMvwo=
=hZ6x
-----END PGP SIGNATURE-----

--2ordbauYosi8OQ95--
