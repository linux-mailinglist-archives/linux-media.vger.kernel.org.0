Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632317C7192
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 17:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347251AbjJLPeI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 11:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347288AbjJLPeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 11:34:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78648B8
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 08:34:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93BAC433C8;
        Thu, 12 Oct 2023 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697124843;
        bh=Du9N4V6KWfnC15d6hQvbSe2MbqDzCzhgYPGU7vmPG0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A7npSNyHNUta68Xb/V0V8wb+IV3OyfgVrQYSvOdRRCgyW8n94pjWXQBQX1UzMsP5C
         OWptebPIYynHKKfjxDpsM8gVE8DCf0+2YGd6imQg3GKlbLV8435EgCogXsiZsOhNFv
         dla6aEXbihUGUortH2fe0Qoy0yG+0p5JAgXTXcmtP5H9eyZBQgB9b6Q5tNdoF+k5He
         uRmxBHTeAta7zaCbqr8sSd9Z2ODTXxhiq9oUH7c6P4DWmdm5N+Fqd3Ha0B3DhBjXoF
         tojproG52XaWSCgTlu5WuJz9kKWsJX5nsqvAFdepVKCz0T131bRXhnUc0MSD00UVXX
         shwV50CZY1ymw==
Date:   Thu, 12 Oct 2023 16:33:59 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org, Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add OmniVision OV64A40
Message-ID: <20231012-wisplike-distrust-6b49aa8eae5e@spud>
References: <20231010151208.29564-1-jacopo.mondi@ideasonboard.com>
 <20231010151208.29564-2-jacopo.mondi@ideasonboard.com>
 <20231011-conflict-monument-75379ef495cc@spud>
 <ar5rf3mas33vvg47jflmhajpyx2pypdjdf3x522x3a3v5cva2a@gjmr5cjv6dyd>
 <20231011-deserve-platonic-0beb72c94661@spud>
 <20231011162454.GB5306@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/uSO+fW+/nd4ynkl"
Content-Disposition: inline
In-Reply-To: <20231011162454.GB5306@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--/uSO+fW+/nd4ynkl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 07:24:54PM +0300, Laurent Pinchart wrote:
> On Wed, Oct 11, 2023 at 05:16:50PM +0100, Conor Dooley wrote:
> > On Wed, Oct 11, 2023 at 06:12:28PM +0200, Jacopo Mondi wrote:
> > > On Wed, Oct 11, 2023 at 04:53:34PM +0100, Conor Dooley wrote:
> > > > On Tue, Oct 10, 2023 at 05:12:07PM +0200, Jacopo Mondi wrote:
> > > > > Add bindings for OmniVision OV64A40.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > Signed-off-by: Lee Jackson <lee.jackson@arducam.com>
> > > >
> > > > What does Lee's SoB indicate here?
> > >=20
> > > Lee has contributed to the development of the driver and validation of
> > > bindings.
> >=20
> > Then you're missing a Co-developed-by: from Lee :)
> >=20
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index b19995690904..df089d68b58c 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -15821,6 +15821,13 @@ S:	Maintained
> > > > >  T:	git git://linuxtv.org/media_tree.git
> > > > >  F:	drivers/media/i2c/ov5695.c
> > > > >
> > > > > +OMNIVISION OV64A40 SENSOR DRIVER
> > > > > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.org>
> > > > > +L:	linux-media@vger.kernel.org
> > > > > +S:	Maintained
> > > > > +T:	git git://linuxtv.org/media_tree.git
> > > >
> > > > Binding looks fine to me, my question is here. Usually having a tree
> > > > here means that you apply the patches yourself. Do you?
> > > >
> > >=20
> > > No, and only Mauro has commit rights on the media tree.
> > >=20
> > > All i2c sensor drivers have a tree listed, regardless who commits
> > > there. What should I put there ?
> >=20
> > IMO, nothing. The media tree entry should cover the parent directory,
> > no?
>=20
> There's little documentation for the T: tag. In MAINTAINERS, we have
>=20
>         T: *SCM* tree type and location.
>            Type is one of: git, hg, quilt, stgit, topgit
>=20
> which doesn't tell much. In Documentation/sbumitting-patches.rst,
> there's ona additional paragraph:
>=20
>   Note, however, that you may not want to develop against the mainline
>   tree directly.  Most subsystem maintainers run their own trees and
>   want to see patches prepared against those trees.  See the **T:**
>   entry for the subsystem in the MAINTAINERS file to find that tree, or
>   simply ask the maintainer if the tree is not listed there.
>=20
> If the purpose of the T: tag is to tell which tree patches for this
> driver should be developed against, the above tree seems right.

I suppose media has a different interpretation than is common elsewhere.
With the fixed attribution,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--/uSO+fW+/nd4ynkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSgR5wAKCRB4tDGHoIJi
0ia3AQDE54CI3/dcVe+fifBvzOy3N5W/4NbrczrDPQsThOO9rwD/UPV/H3zFqdQJ
KTah92fyUWgHrhmX3h8tvLUBiuiiwgU=
=Rba2
-----END PGP SIGNATURE-----

--/uSO+fW+/nd4ynkl--
