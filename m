Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A55302D38
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 22:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732516AbhAYVFY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 16:05:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:55164 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732287AbhAYVE2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 16:04:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 768F8AD2B;
        Mon, 25 Jan 2021 21:03:46 +0000 (UTC)
Message-ID: <acd2ba9f35732ba3fb7c31ba05132434ec99fd66.camel@suse.de>
Subject: Re: [PATCH v2 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
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
        linux-media@vger.kernel.org
Date:   Mon, 25 Jan 2021 22:03:44 +0100
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-CoeA/RTBImZihJ/dxP0u"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-CoeA/RTBImZihJ/dxP0u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 2021-01-11 at 15:22 +0100, Maxime Ripard wrote:
> Hi,
>=20
> Here's a series introducing the CEC support for the BCM2711 found on the
> RaspberryPi4.
>=20
> The BCM2711 HDMI controller uses a similar layout for the CEC registers, =
the
> main difference being that the interrupt handling part is now shared betw=
een
> both HDMI controllers.
>=20
> This series is mainly about fixing a couple of bugs, reworking the driver=
 to
> support having two different interrupts, one for each direction, provided=
 by an
> external irqchip, and enables the irqchip driver for the controller we ha=
ve.
>=20
> This has been tested on an RPi3 and RPi4, but requires the latest firmwar=
e.
> It's is based on the 10 and 12 bpc series.

I applied patches #1 and #14 for-next. I'm waiting on Hans' testing for #15=
.

Regards,
Nicolas


--=-CoeA/RTBImZihJ/dxP0u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmAPMjAACgkQlfZmHno8
x/5ijQgAjwTN8Q4Ar+mgYWV3E5ZaRJzmIpfUoXTJKlFPSI0aCCSlad0DIhWGHUPL
PgoEmIkKbojH7eFluaJxUdr0L4L85P9X73RI3quY0rTmuFo7aqL2TT+jHtKITdGu
PCHyYCRlht9FgW+TJjizNmPce8G7CC3OHcI7p+uFS02pOOxVx4Z68uakR2TnNE19
4PiSGJ6grZZyoQBXSE/UIyoAntkfrJvZTAApgo00ynkbiWqTbUpVM4lXfgUqWXvF
sTfwAgbLRBA8ouQxT6wVFSSmMUa2zEHm3RUWR8dFWfRmHvhjawjjkKnk7EQMo0+F
qBmNS0ejcOdEDcUsxWn7vhAeIYx2TQ==
=WUfV
-----END PGP SIGNATURE-----

--=-CoeA/RTBImZihJ/dxP0u--

