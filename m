Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9927D22DC5
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 10:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731133AbfETIGV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 04:06:21 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:42621 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730913AbfETIGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 04:06:20 -0400
X-Originating-IP: 90.88.22.185
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr [90.88.22.185])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 51B4C60003;
        Mon, 20 May 2019 08:06:17 +0000 (UTC)
Date:   Mon, 20 May 2019 10:06:16 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     paul.kocialkowski@bootlin.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, gregkh@linuxfoundation.org,
        wens@csie.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: Allow different mod clock rates
Message-ID: <20190520080616.qlkpru5ypmtsiob6@flea>
References: <20190518174415.17795-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z4svvflxvz3jxhmz"
Content-Disposition: inline
In-Reply-To: <20190518174415.17795-1-jernej.skrabec@siol.net>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--z4svvflxvz3jxhmz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 18, 2019 at 07:44:15PM +0200, Jernej Skrabec wrote:
> Some VPU variants may run at higher clock speeds. They actually need
> extra speed to be capable of decoding more complex codecs like HEVC or
> bigger image sizes (4K).
>
> Expand variant structure with mod_rate information.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--z4svvflxvz3jxhmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOJf+AAKCRDj7w1vZxhR
xYO1AP4hYgh/ydYRZ1dLOpWjomwTaBIE4ZTTvdBGUDoMiNB7vgD/TN9xyBUVpRON
FUBwqbdUlEFesY7PSvrMnKR0eobJYwg=
=1oN6
-----END PGP SIGNATURE-----

--z4svvflxvz3jxhmz--
