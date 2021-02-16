Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2252C31CECA
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhBPRO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:14:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:44058 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230335AbhBPROX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:14:23 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id EBCC3B775;
        Tue, 16 Feb 2021 17:13:40 +0000 (UTC)
Message-ID: <6d1b87e8fec188289a2e42cd2e07dd40ed1d3d3a.camel@suse.de>
Subject: Re: [PATCH] Revert "ARM: dts: bcm2711: Add the BSC interrupt
 controller"
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, maxime@cerno.tech,
        dave.stevenson@raspberrypi.com, maz@kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, eric@anholt.net,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, tzimmermann@suse.de,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        linux-media@vger.kernel.org
Date:   Tue, 16 Feb 2021 18:13:39 +0100
In-Reply-To: <20210212191104.2365912-1-f.fainelli@gmail.com>
References: <20210212191104.2365912-1-f.fainelli@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-PfV5mydmGc5L0R6INf2H"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-PfV5mydmGc5L0R6INf2H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-02-12 at 11:11 -0800, Florian Fainelli wrote:
> As Dave reported:
>=20
> This seems to have unintended side effects.  GIC interrupt 117 is shared
> between the standard I2C controllers (i2c-bcm2835) and the l2-intc block
> handling the HDMI I2C interrupts.
>=20
> There is not a great way to share an interrupt between an interrupt
> controller using the chained IRQ handler which is an interrupt flow and
> another driver like i2c-bcm2835 which uses an interrupt handler
> (although it specifies IRQF_SHARED).
>=20
> Simply revert this change for now which will mean that HDMI I2C will be
> polled, like it was before.
>=20
> Reported-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas


--=-PfV5mydmGc5L0R6INf2H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmAr/UMACgkQlfZmHno8
x/7IyQf/TNd4fUo81NpxLLpzRm5/jBf2RIorIp8u6nifhDsqwG3LaXbJfaJ6Esxa
ubv0WS89IllT4GOSBVha93zfx4SpqeduVdxf084Q0bcn9u9KwOzpDhJXr8wRT0B1
mf7vOjAlil3UUzFjqH1U3Iv0aI1ttkkhss1o2AP9ZNZ48t5VxA20hcwG/s2mR5ut
p9NsSx2kdWmBZRIOyKXXkJSTrsNH5Bqwg8m7fWTdAW2HBr7tXwX7/dzYwz7HuV3j
oO43t0VAsMGKcsQHAbpPgEaJ9iuu0xaCrOVL/VH2X5aUQZWm+R3CgjCmKluyS9A1
Rhj8+8WYCHxI9/FmHMr+v5fxj6oeww==
=lMqV
-----END PGP SIGNATURE-----

--=-PfV5mydmGc5L0R6INf2H--

