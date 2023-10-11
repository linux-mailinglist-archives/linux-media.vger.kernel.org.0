Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCA5C7C58FA
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 18:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbjJKQQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 12:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbjJKQQ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 12:16:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C90191
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 09:16:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04411C433C7;
        Wed, 11 Oct 2023 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697041015;
        bh=1HtfMwwWKWdnGGsRx45OYRgNuOSJpgS2aLGiJYenX/Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UHSlCmB0Udk4pS3w90Eq0sQlpg9OrfwPTLH19fn4tLEd5O8QUn69BTeCLoNNMPKgg
         wmosN6ARTNqh32QEMv26k2sb6rUFtT9CDhV2fu5gZz2VoAa2h/Y035RwQoJv+WKs1M
         xJi12aEJip8xnyltCfBzMCY/cEl9QdaGpb3uJjm8niHleRV+Qbm8KJBK6ImVnar28e
         C/Hw1WX02/n/cHdFWL/zP6V5VJ6cs1rZzjwsx86cUmlkvBn3/1P7KHfywl5196KqZ3
         gIaAH2FfnY3FQ2v+JIHy5YMZSRkPJ3kKrzhcUym691rqPHhpEo1NTzwMZ8plgUQFYf
         0ys16KF6C472Q==
Date:   Wed, 11 Oct 2023 17:16:50 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org, Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add OmniVision OV64A40
Message-ID: <20231011-deserve-platonic-0beb72c94661@spud>
References: <20231010151208.29564-1-jacopo.mondi@ideasonboard.com>
 <20231010151208.29564-2-jacopo.mondi@ideasonboard.com>
 <20231011-conflict-monument-75379ef495cc@spud>
 <ar5rf3mas33vvg47jflmhajpyx2pypdjdf3x522x3a3v5cva2a@gjmr5cjv6dyd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oJpiP+JDvBGvfJNX"
Content-Disposition: inline
In-Reply-To: <ar5rf3mas33vvg47jflmhajpyx2pypdjdf3x522x3a3v5cva2a@gjmr5cjv6dyd>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--oJpiP+JDvBGvfJNX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 06:12:28PM +0200, Jacopo Mondi wrote:
> On Wed, Oct 11, 2023 at 04:53:34PM +0100, Conor Dooley wrote:
> > Hey,
> >
> > On Tue, Oct 10, 2023 at 05:12:07PM +0200, Jacopo Mondi wrote:
> > > Add bindings for OmniVision OV64A40.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Signed-off-by: Lee Jackson <lee.jackson@arducam.com>
> >
> > What does Lee's SoB indicate here?
> >
>=20
> Lee has contributed to the development of the driver and validation of
> bindings.

Then you're missing a Co-developed-by: from Lee :)

> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index b19995690904..df089d68b58c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15821,6 +15821,13 @@ S:	Maintained
> > >  T:	git git://linuxtv.org/media_tree.git
> > >  F:	drivers/media/i2c/ov5695.c
> > >
> > > +OMNIVISION OV64A40 SENSOR DRIVER
> > > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.org>
> > > +L:	linux-media@vger.kernel.org
> > > +S:	Maintained
> > > +T:	git git://linuxtv.org/media_tree.git
> >
> > Binding looks fine to me, my question is here. Usually having a tree
> > here means that you apply the patches yourself. Do you?
> >
>=20
> No, and only Mauro has commit rights on the media tree.
>=20
> All i2c sensor drivers have a tree listed, regardless who commits
> there. What should I put there ?

IMO, nothing. The media tree entry should cover the parent directory,
no?

Thanks,
Conor.

--oJpiP+JDvBGvfJNX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSbKcgAKCRB4tDGHoIJi
0hQFAQCeeus3+i7JzsMkd+1RohdU3+zMlpPlaQ5WTYwPgCC2rgD/dXU5djkVRqGM
6weUT8b3aWIElQNg6ZncRe+VL9dfEwk=
=dsWT
-----END PGP SIGNATURE-----

--oJpiP+JDvBGvfJNX--
