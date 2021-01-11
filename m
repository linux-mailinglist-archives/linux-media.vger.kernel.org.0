Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE7E2F1BFF
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 18:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389288AbhAKRMy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 12:12:54 -0500
Received: from mx2.suse.de ([195.135.220.15]:39646 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387538AbhAKRMy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 12:12:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C3FFEAB7A;
        Mon, 11 Jan 2021 17:12:12 +0000 (UTC)
Message-ID: <fa491b95942921e9cb1c0302bfe1cec8007ac8ea.camel@suse.de>
Subject: Re: [PATCH v2 01/15] ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org
Date:   Mon, 11 Jan 2021 18:12:11 +0100
In-Reply-To: <000a8e5b-cb97-f413-6d8b-2f5a529f7137@gmail.com>
References: <20210111142309.193441-1-maxime@cerno.tech>
         <20210111142309.193441-2-maxime@cerno.tech>
         <000a8e5b-cb97-f413-6d8b-2f5a529f7137@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-MOL1Oae2AV68diJasRLF"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-MOL1Oae2AV68diJasRLF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Maxime it seems you forgot to CC me on the series :)

On Mon, 2021-01-11 at 08:54 -0800, Florian Fainelli wrote:
>=20
> On 1/11/2021 6:22 AM, Maxime Ripard wrote:
> > The BCM2711 has a number of instances of interrupt controllers handled
> > by the driver behind the BRCMSTB_L2_IRQ Kconfig option (irq-brcmstb-l2)=
.
> >=20
> > Let's select that driver as part of the ARCH_BCM2835 Kconfig option.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>=20
> Nicolas, I suppose you will be taking patches 1 and 14, 15 through the
> SoC pull request, right?

Yes, that's about right. But I think it'd be nice to wait a bit to see if R=
obH
has something to say.

Regards,
Nicolas


--=-MOL1Oae2AV68diJasRLF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl/8husACgkQlfZmHno8
x/63Fgf+PYz4BSJjve1LDoGVTG9o8kenwQxr38CHB7phoah/8wamyPa5te1Uxtgg
LcG/dgt4m3xWdeDjLWOk5WWGthoSo3ePTw2CmtMzM2+Y+cRsX/OyEno7ehl2y0f1
qJRFnCQ+aUBbRymy0ic3FeprMEfHXOlZLThj663A+SYOWLOE6tbLtqiuOXrVz60D
iSTK/ziqnTEfnLq5UDm2y5r7wZKrI8U9qw+E8Nk+RP5giOzuPwv7idGMMbjohcA6
I3zpHvATwsqFE9nHxZdc8NYu6Cy6uJPxe5bNHMx7mXffkIzuTExyUrUC92mFt6DT
XrnztqS9FA6VRKX9KB4r3swL4Vgkyg==
=m1b7
-----END PGP SIGNATURE-----

--=-MOL1Oae2AV68diJasRLF--

