Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D4B750B74
	for <lists+linux-media@lfdr.de>; Wed, 12 Jul 2023 16:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbjGLOz1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jul 2023 10:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjGLOz1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jul 2023 10:55:27 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1C319A0
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 07:55:25 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60426E0011;
        Wed, 12 Jul 2023 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1689173724;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Qv7G18wPTYSMMVzVnTFvwLn5zt8E4vfiqbuvfIGct0Q=;
        b=JmOWtnUSOjQYeQ8pJbFvm6vEq40CKgSt8bL1AC9O+lET7aStLz6B7fqoC0qCO7F0oER4yU
        xiP7XrwRfXoXdVVKWbrmH1OB+xfVeSJQKSkEpPUlR9FyRYjWCwBdR15weac8a3HxiXKkZE
        emzNMPT6HFRvQc72QR91HUTi2xoCsrysSxm6TQhOWBQvCspElrYoxoI3hsPXA1q2NDSntF
        V7MohKZ31YECyx+6kQZ1lRzq9M0jF4JapD5Vncno6mq4+LZwPIXWoD46z8N2ftLAfdL7pX
        oE9K3aHbJoK8ST3xnie+EdJusTa0anKxUzAYntRuq1UHMmczO68vt9VeXpMsEg==
Date:   Wed, 12 Jul 2023 16:55:21 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Martijn Braam <martijn@brixit.nl>, regressions@lists.linux.dev,
        jernej.skrabec@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [REGRESSION] breakage in sun6i-csi media api
Message-ID: <ZK6-2RaE01_RgtYU@aptenodytes>
References: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
 <ZHmzZUkcFK8Gq_JL@aptenodytes>
 <e168d246-528d-b615-aa50-af8f17af4442@brixit.nl>
 <ZHm46or-MhTb457b@aptenodytes>
 <20230602100352.GK19463@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6+rsyM2hUFI47juJ"
Content-Disposition: inline
In-Reply-To: <20230602100352.GK19463@pendragon.ideasonboard.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6+rsyM2hUFI47juJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 02 Jun 23, 13:03, Laurent Pinchart wrote:
> Hi Paul,
>=20
> On Fri, Jun 02, 2023 at 11:39:54AM +0200, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > (Re-adding folks from the original email, adding Laurent and Hans.)
> >=20
> > On Fri 02 Jun 23, 11:24, Martijn Braam wrote:
> > > Hi Paul,
> > >=20
> > > That's basically it yes. My software doesn't expect the bridge block,
> > > because it wasn't there. The pipeline always worked "automatically".
> > >=20
> > > This is the workaround that's been made now it run on newer kernels:
> > > https://gitlab.com/postmarketOS/megapixels/-/merge_requests/31
> > >=20
> > > I'm pretty sure format propagation would fix this issue.
> >=20
> > Okay that's good to know.
> >=20
> > To be honest it's still not very clear to me if in-driver format propag=
ation is
> > a "nice to have" feature or something that all media pipeline drivers a=
re
> > supposed to implement.
>=20
> For MC-based drivers, in-kernel propagation *inside* subdevs is
> mandatory, in-kernel propagration *between* subdevs is not allowed. The
> latter is the responsibility of userspace.

Right, makes good sense.

> For traditional (I'd say legacy, but I know not everybody likes that
> term :-)) drivers that only expose video device nodes and do not expose
> subdev nodes to userspace, the driver is responsible for configuring the
> full pipeline internally based on the S_FMT call on the video nodes
> only. This isn't applicable to the sun6i-csi driver, as it exposes
> subdev nodes to userspace.
>=20
> > Anyway I feel like this is not really a regression but a result of the =
driver
> > being converted to a newer API.
> >=20
> > Also there's a V4L2_CAP_IO_MC flag which should indicate that the video=
 device
> > must be controlled via the media controller API instead of being
> > video-device-centric, but I've seen comments asking not to set the flag=
 even
> > when MC is used so I'm a bit confused here.
>=20
> Would you have pointers to those comments ?

I was thinking of a reply from Hans on the Tegra driver series:
https://patchwork.kernel.org/project/linux-media/patch/20230309144320.29375=
53-4-luca.ceresoli@bootlin.com/#25285456

=46rom what I understand there's some bridge entity that needs to be explic=
itly
configured to match the sensor's format via MC, yet the reply says that the
driver "doesn't use the media controller for anything at the moment" and
should not be converted to become a proper MC-driven device.

Well maybe there was a misunderstanding on my side, or Hans', or both.

> > Perhaps the flag is only required when there is no automatic format
> > propagation?
>=20
> The flag is more or less required when you expose subdev nodes to
> userspace.

Thanks for the clarifications :)

Cheers,

Paul

> > If anyone has solid answers on these points I'd be happy to read some
> > clarification (and act accordingly).
> >
> > > On 6/2/23 11:16, Paul Kocialkowski wrote:
> > > > Hi Martijn,
> > > >=20
> > > > On Thu 01 Jun 23, 23:19, Martijn Braam wrote:
> > > > > It seems like this commit:
> > > > >=20
> > > > > media: sun6i-csi: Add bridge v4l2 subdev with port management
> > > > >=20
> > > > > Has changed the way the media pipeline on a64 devices, in my case=
 the PINE64
> > > > > PinePhone works. Since this is an API towards userspace and there=
's active
> > > > > applications that use it I think this counts as a regression.
> > > > Do you have more details on what changed specifically?
> > > >=20
> > > > The commit added a bridge subdev in addition to the video node, whi=
ch is
> > > > generally a better description of the CSI hardware and also a neces=
sity
> > > > to support the ISP data flow.
> > > >=20
> > > > Maybe your userspace application is not configuring the bridge medi=
a block with
> > > > the right format, which results in a mismatch?
> > > >=20
> > > > Some work was started to achieve automatic format propagation, perh=
aps it
> > > > would be enough to solve your issue.
> > > >=20
> > > > Cheers,
> > > >=20
> > > > Paul
> > > >=20
> > > > > #regzbot introduced: 0d2b746b1bef73de62d2d311e594a7ffed4ca43
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--6+rsyM2hUFI47juJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmSuvtkACgkQ3cLmz3+f
v9EM/wf/eZWu2yYUjCVilDx5OCeqcKJQsDsPE/GfY54QgjEOyWvHw4DvmyPahxtN
ab96BXQBI62wlNlbVtOvMTWtMtF11P9Cq+SkTO43VD2AAlNsIcZtM+GYOrcxh6pp
E3sceo38Bflj6rjgxcTTzNMBqbKxIEXWocFmwk0eJYkSNwpcTkboDbB58nkqeI/X
sBEa6sRBAH2K9HdQdqv11Uqdzpn/Bv/88TnNc8QPG2cno/3cBfQwxHZCc4bQ+kxx
cNNvHzHDyK/pAwCCgFnMAPEjfW9XtZ/ba+Gf18pMDR+fULPeZaUc5gbTNXAGX6TX
NrCiQcMKaaPbcKBQhN9MtiXuMGUApg==
=QsFP
-----END PGP SIGNATURE-----

--6+rsyM2hUFI47juJ--
