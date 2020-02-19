Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFE8F164BD0
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 18:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgBSRWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 12:22:18 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:39019 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgBSRWS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 12:22:18 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C7D0DFF80A;
        Wed, 19 Feb 2020 17:22:12 +0000 (UTC)
Date:   Wed, 19 Feb 2020 18:24:56 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Michael Rodin <mrodin@de.adit-jv.com>
Cc:     niklas.soderlund@ragnatech.se, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com,
        sudipi@jp.adit-jv.com, akiyama@nds-osk.co.jp
Subject: Re: [PATCH] [RFC] media: rcar-vin: don't wait for stop state on
 clock lane during start of CSI2
Message-ID: <20200219172456.hyo2aksvubxpoqrn@uno.localdomain>
References: <1582026251-21047-1-git-send-email-mrodin@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jvjmcxubogualhde"
Content-Disposition: inline
In-Reply-To: <1582026251-21047-1-git-send-email-mrodin@de.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jvjmcxubogualhde
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

On Tue, Feb 18, 2020 at 12:44:11PM +0100, Michael Rodin wrote:
> The chapter 7.1 "D-PHY Physical Layer Option" of the CSI2 specification
> states that non-continuous clock behavior is optional, i.e. the Clock Lane
> can remain in high-speed mode between the transmission of data packets.
> Therefore waiting for the stop state (LP-11) on the Clock Lane is wrong and
> will cause timeouts when a CSI2 transmitter with continuous clock behavior
> is attached to R-Car CSI2 receiver. So wait only for the stop state on the
> Data Lanes.

Am I wrong or the desired behaviour should depend on the presence of
the clock-noncontinuous property in the CSI-2 input endpoint ?
If clock-noncontinuous is set, then wait for the clock lane to
enter stop state too, if not just wait for the data lanes to stop.

If this is correct, it will also require a change to the bindings and
that's the tricky part. So far the CSI-2 receiver behaved as the
clock-noncontinuous property was set (wait for both data and clock
lanes) and older dtb should continue to work under this assumption. If
you want to support devices with continuous clock then you have to require
the clock-noncontinuous property to be explicitly set to false, and
assume it's true if not specified. BUT clock-noncontinuous is a
boolean property, whose value depends on it's presence only. So I fear
we need to add a 'clock-continuous' flag to video-interfaces.txt,
parse it in the CSI-2 receiver driver, and then ignore the clock lane
stop state if and only if said property is specified.

Does this make sense ?

Thanks
   j

>
> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index faa9fb2..6d1992a 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -416,8 +416,7 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
>  	for (timeout = 0; timeout <= 20; timeout++) {
>  		const u32 lane_mask = (1 << priv->lanes) - 1;
>
> -		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
> -		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> +		if ((rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
>  			return 0;
>
>  		usleep_range(1000, 2000);
> --
> 2.7.4
>

--jvjmcxubogualhde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl5Nb2gACgkQcjQGjxah
VjxTwA/+M8267lFucyowW2LpnMiSjwueQTHQySaNv+2/1++rFkymfQFdYVRwmi1s
aEEeArjKkyZg8GQYnbXIPD2GDJygStJ69nqFKhmxsTuNSufHUaHG5ejrVz0IkI8e
pd+eqMOGPp29eHUESTLiIfNDiGM80Xhn+zs6w5Gf1bzybwOpWzMqaVBUiE2DC3Kd
f4ETr/luVYtCbmzXdgh1TAQ4lPkz93pS3EBp2AS4wNXpA+G+JSok4qnj7B3noVBi
RBeraL/Ca718dlnq5tZCd+eycIlERQTgSir+ZzDATmrzwN+q5WOCqlrmwaUMh9VF
FAWQyRLfGWOT9bo+lcnQ2RjpVbF7OvmkesiY0DsR8+btENIhpjuMuuAvI3TSQEBX
rC9hYyaPicd4V4hjeVfOGduadjIq8qJ/iOIzWmOemA4XhIv3KAySbOqNuA6ejVRM
3JntotjuknCM3HyWEfwdIFnlV2r2keZ0gqhcwG9Sg4a2sXTAQnSiIz781uETE/AH
gPS1xJsJ+pDvM3g7/WEYI/tad7roEWkHBROkudu0JUOcYzzYnIi6zaISsAWQeyGA
x5/bYSKOyiVYWV/s2ckbAhiAK37YZXGFOKs1ByLgvKt13xmtSy9UmLkJBq3kCvXv
fsE0WfNjkaFVFLM3H2w0wyzMfcmB+fK853U0lbyjtl4N1NbLBaU=
=mPQD
-----END PGP SIGNATURE-----

--jvjmcxubogualhde--
