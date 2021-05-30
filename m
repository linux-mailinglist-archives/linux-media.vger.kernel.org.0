Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D140395305
	for <lists+linux-media@lfdr.de>; Sun, 30 May 2021 23:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhE3VZS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 May 2021 17:25:18 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58974 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhE3VZR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 May 2021 17:25:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C32641C0B79; Sun, 30 May 2021 23:23:37 +0200 (CEST)
Date:   Sun, 30 May 2021 23:23:37 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v2 0/5] Add support for the Hynix Hi-846 camera
Message-ID: <20210530212337.GA15366@duo.ucw.cz>
References: <20210528081336.3858700-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <20210528081336.3858700-1-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This patchset add support for the SK Hynix Hi-846 CMOS images sensor.
> It includes documentation, dt-bindings and the driver.
>=20
> patch 4 and 5 are basically optional: if i2c-cardlist is deprecated,
> ignore it and act on it appropriately, and the defconfig would just
> be convenience for now.

Can I get you to cc phone-devel@vger.kernel.org with phone-related
patches?

Thank you,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYLQCWQAKCRAw5/Bqldv6
8iT+AJsGiO64k5k450cW7uWBmqlqdcOuQACggEOKxEZKH5HcWg/scaREaOuP7XM=
=IERV
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
