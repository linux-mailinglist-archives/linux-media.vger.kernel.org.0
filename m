Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33843078C2
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 15:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbhA1OyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 09:54:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:48210 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231575AbhA1OwO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 09:52:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 58DF8ACB7;
        Thu, 28 Jan 2021 14:51:30 +0000 (UTC)
Message-ID: <63771d7b6314edd5ec63dd9bcbb4bffbd636f5e4.camel@suse.de>
Subject: Re: [PATCH v2 15/15] ARM: dts: bcm2711: Add the CEC interrupt
 controller
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
Date:   Thu, 28 Jan 2021 15:51:28 +0100
In-Reply-To: <20210111142309.193441-16-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
         <20210111142309.193441-16-maxime@cerno.tech>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-G98LYzdq4xlu25yKmJ5B"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-G98LYzdq4xlu25yKmJ5B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-01-11 at 15:23 +0100, Maxime Ripard wrote:
> The CEC and hotplug interrupts go through an interrupt controller shared
> between the two HDMI controllers.
>=20
> Let's add that interrupt controller and the interrupts for both HDMI
> controllers
>=20
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied for-next.

Thanks,
Nicolas


--=-G98LYzdq4xlu25yKmJ5B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmASz3AACgkQlfZmHno8
x/4zPgf+LH8d5vNoAGIA/QDXj6Xd0q5Lh2HkeO6f9be0ReNe4B0G79xK+cXUuoaw
2gvlfh+36EcnbnU0gv4VrJia4UAXkpBR06MtJx+PWWza0Zp/iWjYYV0sTJuVF1kA
Rdv1Tdg4FfAbse4ZgL9sGHnC+RmN4lW6Uo0NHmdh7j6KpYaswewF29dgYQxErYRT
kNalJIrfYnCiNT4N+g+xi132l8aNg8Tzv2/I36DD8XrRx1EVBYgQeMyZxWLRTwPi
/R9sivRXtY9nFUUs25rwtiYugy2rkQyxyWzjpxM7Rc29eOstJdmsvyuFR6CbhECo
k8v1+FktMfpxYqW3XO9QCTeGsYel7A==
=TxMI
-----END PGP SIGNATURE-----

--=-G98LYzdq4xlu25yKmJ5B--

