Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48A24579B0D
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 14:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237775AbiGSMY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 08:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239958AbiGSMYZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 08:24:25 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D33261B25
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 05:09:15 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D4E64C000B;
        Tue, 19 Jul 2022 12:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1658232525;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8eTcaBSzPUr6JTCtERryqaIQYBbQkLVl+Df9RXZTMXI=;
        b=TBQTsVIxzhAUjemSk3MO2X7TpDQeTh4kDajrD+SQy28nUftuGJ0NzUGTSxVbFOUZ/PKZkO
        vDj8D6nsv8YMYNpVezDQ3NqWF1G00kWBBMcP6mBXgPD3yoxh3OaykbTt8NLUcUjEQ09vEv
        sdZLA5Uw4jb/Qw5asgdbqvh0j74iXayYMyCXGiJs9KGkCmY/Wm3GxRVxnDA3jbefYADrSW
        WLGIJqlx+cKlJlwfDzpdcCiB02YliOVqSzrbZUKFSQSAr5SGqH1zWnpXmc+bYP/Fsec1PU
        v3iZqg8va3WZKCzjGKGxXmsq+96kx9yjEM5cCp6y+m1/sehSs+n85CcxAhkBag==
Date:   Tue, 19 Jul 2022 14:08:44 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/1] media: sunxi: Depend on GENERIC_PHY_MIPI_DPHY
Message-ID: <YtaezNvlhZ+FX4Ek@aptenodytes>
References: <20220713192540.222794-1-sakari.ailus@linux.intel.com>
 <YtZxajlS5FFFnfgf@aptenodytes>
 <YtaVNVMxVnlr64dm@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QSXCiTIi6FhPhlQ/"
Content-Disposition: inline
In-Reply-To: <YtaVNVMxVnlr64dm@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--QSXCiTIi6FhPhlQ/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Tue 19 Jul 22, 11:27, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Tue, Jul 19, 2022 at 10:55:06AM +0200, Paul Kocialkowski wrote:
> > Hi Sakari,
> >=20
> > On Wed 13 Jul 22, 22:25, Sakari Ailus wrote:
> > > The sun6i-mipi-csi2 and sun6i-a83t-mipi-csi2 drivers depend on the ge=
neric
> > > MIPI D-PHY support. Select it. This fixes a linking problem when eith=
er of
> > > these drivers is enabled and GENERIC_PHY_MIPI_DPHY is disabled.
> > >=20
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >=20
> > Looks good to me but I have one question below.
> >=20
> > Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> >=20
> > Cheers,
> >=20
> > Paul
> >=20
> > > ---
> > >  drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig      | 1 +
> > >  drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig | 1 +
> > >  2 files changed, 2 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/d=
rivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> > > index b1712f5873fd9..eb982466abd30 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> > > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> > > @@ -8,6 +8,7 @@ config VIDEO_SUN6I_MIPI_CSI2
> > >  	select VIDEO_V4L2_SUBDEV_API
> > >  	select V4L2_FWNODE
> > >  	select PHY_SUN6I_MIPI_DPHY
> > > +	select GENERIC_PHY_MIPI_DPHY
> >=20
> > Since we select PHY_SUN6I_MIPI_DPHY here which also selects
> > GENERIC_PHY_MIPI_DPHY, I suppose this is not strictly needed?
>=20
> In that case the symbols won't be present in modpost and that causes a bu=
ild
> failure.

Oh interesting, thanks!

> Thanks for the review. The patch is already merged though.

Ah, I had a quick look at https://git.linuxtv.org/media_tree.git/
but forgot to check your own tree.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--QSXCiTIi6FhPhlQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmLWnswACgkQ3cLmz3+f
v9E6+gf+Pmr8jgJ+T+HGJPsOjGTFGLV/pyqP2cYTElTbvxbzV79VCDOk9vto62fo
ahOnQH0Q2aQMVfEsQg550UExbPVszOeL2fi+Mrl/PUG8fuhQiwTmbijRzeiUYKiM
3jEjSlnkEmt/lAG5VgVLPHfZeUMybmDpko7vdIpBGuN01DZggAphh/OV+PX62Gbw
djW4jp7Jqr1boZOJEkQ/TSK1nM21u9XkjbRN3CGOT12bonO4hItSVNcIUl99tPSI
C9JdUE6bPYRxYA5nAtV2/0jOP7Q8nTk1w6/P3V+1ZCWs8b4hvcgYRHGBbzxm/nib
97Ydq+hDsDDdcH9+PIM0DCylicqYvA==
=C8gi
-----END PGP SIGNATURE-----

--QSXCiTIi6FhPhlQ/--
