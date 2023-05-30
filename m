Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33CE3716DAD
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 21:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbjE3Tgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 15:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbjE3Tgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 15:36:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318FA11F;
        Tue, 30 May 2023 12:36:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B824762F76;
        Tue, 30 May 2023 19:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91962C4339B;
        Tue, 30 May 2023 19:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685475402;
        bh=ph9K4D1UYkzwqsYXJeKMX/MfjzDtMKFgr1dwVtkVq6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JUWceABhas0YqIutE0PfpxJ4z3smGc1DBgrFbD+C7fUzzfMsZQstdyPuTiogyiztp
         FKVR3sDAoN5lQ+jBEntOxXjPPxqQyCmisaXHDhR9LfOktZr1lyzBtjHPKYLhRHXPdB
         hq9hPJ4vCFulJGqgfKYQsZhcgueZmked8kuJr7kSpF2GM4M/VZO48mi3qWKbX2R8+c
         VaqrMzBOZrtRnB+UNae4tJnEQ9wMw7RIrDwcxBihKx0slkwXShlrC87XLcmh8uz8UN
         zG9ndH/0apVYXdgPU5vEU5cJXfaBpN+QBB8qkYubqm7kfvBE7VdaHwfznn54zOgkTR
         oWwWAxkNDxuSg==
Date:   Tue, 30 May 2023 20:36:38 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 19/21] dt-bindings: media: imx258: Add alternate
 compatible strings
Message-ID: <20230530-ascend-couch-5f9ae4acb7a2@spud>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-20-dave.stevenson@raspberrypi.com>
 <20230530-crying-dispose-2a0e3bc76301@spud>
 <CAPY8ntDsA4PVOowDed6zMqawzFWehABWTENkiLahGubyDZZOTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BJ1Mz4DDsym0YypQ"
Content-Disposition: inline
In-Reply-To: <CAPY8ntDsA4PVOowDed6zMqawzFWehABWTENkiLahGubyDZZOTw@mail.gmail.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--BJ1Mz4DDsym0YypQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 06:48:44PM +0100, Dave Stevenson wrote:
> Thanks for the incredibly speedy review.

Just happened to change mailboxes right as it arrived ;)

> On Tue, 30 May 2023 at 18:39, Conor Dooley <conor@kernel.org> wrote:
> >
> > Hey Dave,
> >
> > On Tue, May 30, 2023 at 06:29:58PM +0100, Dave Stevenson wrote:
> > > There are a number of variants of the imx258 modules that can not
> > > be differentiated at runtime, so add compatible strings for them.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  .../devicetree/bindings/media/i2c/sony,imx258.yaml         | 7 +++++=
+-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.=
yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > > index bee61a443b23..3415b26b5991 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > > @@ -14,10 +14,15 @@ description: |-
> > >    type stacked image sensor with a square pixel array of size 4208 x=
 3120. It
> > >    is programmable through I2C interface.  Image data is sent through=
 MIPI
> > >    CSI-2.
> > > +  There are a number of variants of the sensor which cannot be detec=
ted at
> > > +  runtime, so multiple compatible strings are required to differenti=
ate these.
> >
> > This is implied by having several compatibles.
>=20
> I'm happy to drop it, just that I've seen a number of media bindings
> that had debate on why extra compatible strings were required.

If there were no non-detectable differences, then there should be
a fallback compatible i.e.
compatible =3D "sony,imx666-foo", "sony,imx666";
Maybe Laurent will come in here and scream at me, but I don't think the
pattern should be propagated.

> > >  properties:
> > >    compatible:
> > > -    const: sony,imx258
> > > +    oneOf:
> > > +      - enum:
> > > +          - sony,imx258
> > > +          - sony,imx258-pdaf
> >
> > Why not just
> > properties:
> >   compatible:
> >     enum:
> > ?
> > I don't see other patches anding more complex compatibles (or they've
> > not arrived yet) so it doesn't appear to be avoiding churn.
>=20
> I'll freely admit that DT bindings are a black art to me, so I was
> following sony,imx290.yaml [1].
> properties:
>   compatible:
>     oneOf:
>       - enum:
>           - sony,imx290lqr # Colour
>           - sony,imx290llr # Monochrome
>           - sony,imx327lqr # Colour
>       - const: sony,imx290
>         deprecated: true
>=20
> Looking again at that case, I assume the oneOf is selecting between
> the enum and the const?

Bingo!

> Seeing as we don't have the const, I guess we
> can drop the "oneOf:"

Cheers,
Conor.

--BJ1Mz4DDsym0YypQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHZQRgAKCRB4tDGHoIJi
0q2eAQDyjGLt678LoQn5U6gRWLF0bKqrmLU2CeeclaTqDSfdigD/ZpB1aK/6a3/h
h1Uq6BbgqUwgJuaqdjmC7HzExJcGnwI=
=A7Pe
-----END PGP SIGNATURE-----

--BJ1Mz4DDsym0YypQ--
