Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5284697633
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 11:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfHUJ3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 05:29:18 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:52307 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfHUJ3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 05:29:18 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AFAB71C0009;
        Wed, 21 Aug 2019 09:29:14 +0000 (UTC)
Date:   Wed, 21 Aug 2019 11:30:39 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Simon Horman <horms@verge.net.au>
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
Message-ID: <20190821093039.fb2art6na5stkpao@uno.localdomain>
References: <20190819140544.19294-1-horms+renesas@verge.net.au>
 <20190820095205.xnthl7d7cpy7myq2@uno.localdomain>
 <20190820151930.pwi42cewslkchssf@verge.net.au>
 <20190821081746.lt6n4nhqnpyowzmi@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jnwnpog3xinnecw2"
Content-Disposition: inline
In-Reply-To: <20190821081746.lt6n4nhqnpyowzmi@verge.net.au>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jnwnpog3xinnecw2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Simon,

On Wed, Aug 21, 2019 at 10:17:48AM +0200, Simon Horman wrote:
> On Tue, Aug 20, 2019 at 05:19:30PM +0200, Simon Horman wrote:
> > On Tue, Aug 20, 2019 at 11:52:05AM +0200, Jacopo Mondi wrote:
> > > Hi Simon,
> > >
> > > On Mon, Aug 19, 2019 at 04:05:44PM +0200, Simon Horman wrote:
> > > > Renesas media binding documentation files uses a naming schema of
> > > > 'renesas,<module>.txt'. Rename the SH Mobile CEU file to match this pattern.
> > > >
> > >
> > > The old soc-camera based sh-mobile-ceu driver has been removed one
> > > year ago and replaced by driver/media/platform/renesas-ceu.c whose
> > > bindings are described at
> > > Documentation/devicetree/bindings/media/renesas,ceu.txt
> > >
> > > Should this file be removed instead of renamed?
> >
> > Thanks,
> >
> > I thought I had checked that but clearly I did not.
> > I agree the file should be removed and I'll send a revised patch
> > accordingly.
>
> The one lingering reference to renesas,sh-mobile-ceu I can see
> in the tree is its use in an example of two data pipelines in
> Documentation/devicetree/bindings/media/video-interfaces.txt
>

Yeah, I noticed that, but never considered it more than an example.
Although, with the removal of the bindings description, it should
probably be changed to avoid generating confusion...

> Could you suggest an alternative example?

The pipeline described in the example is purely fictional, as it uses
a "renesas-shmobile-csi2" compatible to model a CSI-2 input which I
don't see mentioned anywhere. I guess the CEU compatible value there could be
changed to anything we want, including the new renesas-ceu value which
has superseded the sh-mobile-ceu one.

Otherwise, RZ/A2 supports both CSI-2 by using the rcar-vin+rcar-csi2
IP blocks we have in R-Car and parallel input using the old CEU interface.
We could use that as a real-world example, using VIN for CSI-2 and CEU for
parallel input. Unfortunately, no RZ/A2 DTS in mainline has any of the
two interfaces enabled afaict.

I'll send a patch to the media list that just changes the suppressed
compatible value with the new 'renesas-ceu' one unless someone has
different opinions.

Thanks
   j

--jnwnpog3xinnecw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1dDz8ACgkQcjQGjxah
VjxgoxAAoI6/KzvxOIBXDNLLsIs4wUToXkd7RBWwAPLs9+EXvhRjvszMFo67lAdq
48okp5lxgg/VtbBtnrMbuFqBQ2hZt5a2KMDLj5lZVG15lkzadMqOxLwPEy//0Liy
nwzBkb1eFQFHeLZjyVWeWuV3Apt6Cg2Y+ye1oBliS+Y9t/Y94s7bPs1gqwSt7cpL
Ug9JYHRDKuYWdo17zg88foO1rs6ibk9kmbs0EvYenwA9Yqhlj+6a+lv2Lg7U2Qzb
PpRvqmnes5UohFtbrH0LiBP2hrJ2wqA5Md3Ug1QJvhq3SoVhK3Se8jdvkGfsop42
FVgdklqHzv/nKzFATp8daJsQYuiPyDIydFPw9LcvbVMRluJaJSRAZyC7zDsZhJ+y
u+QF1CZqhtOi/m37bJ/QgvVwH7NSYfqfPcctM1ALyQ1huM42cTvu6ctiMOdSkZbX
NSaY+3aaE5c5yFj7Z+vEb7iYnsKBqGu1ShyhV9DS7gHAIYbP4Sgj1LFYFxXUP9TI
Nw/UIUfn5x+Sjbxq6c91uLutOiv4LQ/Cs3uuHLjmHyfkw18b9V8Wka55W26cfpjs
zWcRlMRtW2Fo8mtVO7G80kpNpTTqsplINrLlMg42bVmB7Ss1sTCo4qmHACKIq2aq
u2VeEbXyjwAddEcGm1VMxDbdkWA7TuarmJTy67MQDOFizsmQvMQ=
=UNyD
-----END PGP SIGNATURE-----

--jnwnpog3xinnecw2--
