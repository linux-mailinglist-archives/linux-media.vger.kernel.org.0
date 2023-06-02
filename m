Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D317871FE0D
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 11:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234767AbjFBJkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 05:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235227AbjFBJkB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 05:40:01 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509BFCE
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 02:39:58 -0700 (PDT)
X-GND-Sasl: paul.kocialkowski@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1685698796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+xQjtaZuaz5n0SUJQ/mKROD5Nif4cm44ovMyXwf2ZP4=;
        b=D6c7Kvh8/dLHuyxNj2e0cG+hOAJKz5FOs4k4Db2PU1yYEn4yrIMNK2r3gNRYDTvcDrCknU
        Oaa7vFWU20oOmsEJ92RYdsQzc7xIEz6QbIK+/zpTASNJJ3jEz0mC52oYK3NgPysoQR7bjs
        phaZNRSBo6jd8Lzz2S6j1Mt18IWvtS8SGpCWyOzqbgK/HU1VpPhMop49wBIzhBWPcSJ5ep
        01woXeeXH4CKHxypJZEdfKu6WJ1Sir+cjIkOd9l6CCLCaQ5zTisspO6GLYCAcFhCeV2H1r
        JccnKrhU4UHTFQmYSv4LKxFod92Od2/bVxL5W0iWoHR3U1nMvU8KgyuwM/SzOg==
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E9EC1C0007;
        Fri,  2 Jun 2023 09:39:54 +0000 (UTC)
Date:   Fri, 2 Jun 2023 11:39:54 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Martijn Braam <martijn@brixit.nl>
Cc:     regressions@lists.linux.dev, jernej.skrabec@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Subject: Re: [REGRESSION] breakage in sun6i-csi media api
Message-ID: <ZHm46or-MhTb457b@aptenodytes>
References: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
 <ZHmzZUkcFK8Gq_JL@aptenodytes>
 <e168d246-528d-b615-aa50-af8f17af4442@brixit.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Z+0PdKDSAr0fMDwU"
Content-Disposition: inline
In-Reply-To: <e168d246-528d-b615-aa50-af8f17af4442@brixit.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Z+0PdKDSAr0fMDwU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

(Re-adding folks from the original email, adding Laurent and Hans.)

On Fri 02 Jun 23, 11:24, Martijn Braam wrote:
> Hi Paul,
>=20
> That's basically it yes. My software doesn't expect the bridge block,
> because it wasn't there. The pipeline always worked "automatically".
>=20
> This is the workaround that's been made now it run on newer kernels:
> https://gitlab.com/postmarketOS/megapixels/-/merge_requests/31
>=20
> I'm pretty sure format propagation would fix this issue.

Okay that's good to know.

To be honest it's still not very clear to me if in-driver format propagatio=
n is
a "nice to have" feature or something that all media pipeline drivers are
supposed to implement.

Anyway I feel like this is not really a regression but a result of the driv=
er
being converted to a newer API.

Also there's a V4L2_CAP_IO_MC flag which should indicate that the video dev=
ice
must be controlled via the media controller API instead of being
video-device-centric, but I've seen comments asking not to set the flag even
when MC is used so I'm a bit confused here. Perhaps the flag is only requir=
ed
when there is no automatic format propagation?

If anyone has solid answers on these points I'd be happy to read some
clarification (and act accordingly).

Cheers,

Paul

> Greetings,
> Martijn
>=20
> On 6/2/23 11:16, Paul Kocialkowski wrote:
> > Hi Martijn,
> >=20
> > On Thu 01 Jun 23, 23:19, Martijn Braam wrote:
> > > It seems like this commit:
> > >=20
> > > media: sun6i-csi: Add bridge v4l2 subdev with port management
> > >=20
> > > Has changed the way the media pipeline on a64 devices, in my case the=
 PINE64
> > > PinePhone works. Since this is an API towards userspace and there's a=
ctive
> > > applications that use it I think this counts as a regression.
> > Do you have more details on what changed specifically?
> >=20
> > The commit added a bridge subdev in addition to the video node, which is
> > generally a better description of the CSI hardware and also a necessity
> > to support the ISP data flow.
> >=20
> > Maybe your userspace application is not configuring the bridge media bl=
ock with
> > the right format, which results in a mismatch?
> >=20
> > Some work was started to achieve automatic format propagation, perhaps =
it
> > would be enough to solve your issue.
> >=20
> > Cheers,
> >=20
> > Paul
> >=20
> > > #regzbot introduced: 0d2b746b1bef73de62d2d311e594a7ffed4ca43
> > >=20
> > > Greetings,
> > > Martijn Braam

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Z+0PdKDSAr0fMDwU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmR5uOoACgkQ3cLmz3+f
v9F/egf/RPeds/kZq4b/dhPwh8VCo5XbMkBteLw/3hzoq39I2CC3BKfSzfWBRmWc
T4/QgXWRhQjiGG3c0ODc0JxtO54g1m6y95ImYC4ZXMDDS1uJiixvj03LxqbQfFNv
PPT0gENbOKbpqG9oxYDpq5RRAbB/GJlI05wi33X2du+rjxIxxP8kkeMa0Lie+C4D
+WimmueY/mBjUu9KBaDEfRtcM429eqagUxSJ2vgHustBmwwTM5ShqWicBXvR4Wwd
dCIAb41Wv90mkRr79Nx777C4zhybVhqTgR3qbyXbhCJCYgQzkfHIHvijaL5+K678
f6fw9fQto2DKbwTb9l6SgKS5dwDFHA==
=NVjT
-----END PGP SIGNATURE-----

--Z+0PdKDSAr0fMDwU--
