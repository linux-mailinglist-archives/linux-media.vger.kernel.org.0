Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B48536D238
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 18:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732371AbfGRQnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 12:43:23 -0400
Received: from sauhun.de ([88.99.104.3]:46020 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbfGRQnX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 12:43:23 -0400
Received: from localhost (p54B330C7.dip0.t-ipconnect.de [84.179.48.199])
        by pokefinder.org (Postfix) with ESMTPSA id C66C62C2868;
        Thu, 18 Jul 2019 18:43:21 +0200 (CEST)
Date:   Thu, 18 Jul 2019 18:43:21 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: adv748x: Convert to new i2c device probe()
Message-ID: <20190718164321.GB849@kunai>
References: <20190710123719.3376-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <20190710123719.3376-1-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 01:37:19PM +0100, Kieran Bingham wrote:
> The I2C core framework provides a simplified probe framework from commit
> b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type").
>=20
> Convert the ADV748x to utilise this simplfied i2c driver registration.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0woakACgkQFA3kzBSg
KbYneg//fSlJtOH8ItBrldDL6WPqMbWwRPXDmma1bYkEhvxqiaDKjgrDKfvGV80Z
Rzcw9MlPwQlgSYd5OjpzbgWHa/54n424QHVG5e6NbZ35ajRvejBQ5otnl5WYEXMJ
2PrvXmHcCwxs2xMa5CH+jda6ODfRuY1QDceTQSCzN2CXwcqT8cFoxrSQ24ONO72a
/XQRMpvT/BBR+Wwz9DFOt/QjJ1hOadQO001ufa5cMx3lk261AFLBysRqsC/6zwvL
4YsJF3+yZT5pR4TTTW/5DYxY7/7q6ACB18EzPXMYel73e1bePrHiB+P0hOZethA+
9VA4a/FTDDDWiZOvyL6ph6nb0ZHLtwZY7vjs34v2cRx079I5Hq05Nm3KtgiuG+k3
8ooJlgQuqp9sgqT0aZwaWLXbIiit3nMcSwP/pK0f6FShkJFxsb5+SJVrm7NwgfO1
rMDorKzWf6qxEzvDJLyc+tXqMKejuK+s4oBiTSIgy4TIwWnzDkDMNiO3WnoF0j8B
L1n6Us2WqoSFSThbzwROF2hBb8dU1q/3slzyGr7MVi3D5bFuLA4g6N24iSrFIwtQ
uLPnVxM45JkeOgu85Q3c/gaB0sQ3gjal5eyT9wOUGk+zB8DPEe+5zke4BGmdEMlI
ZvQyy12Mrxy3ROlxczbDCK754cAH/u+RGDE78/gzQ8GGaLXZiyU=
=h6Dy
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
