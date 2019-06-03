Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7885932EC4
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 13:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbfFCLid (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 07:38:33 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56235 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbfFCLid (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 07:38:33 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C3B3D20014;
        Mon,  3 Jun 2019 11:38:27 +0000 (UTC)
Date:   Mon, 3 Jun 2019 13:38:27 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     paul.kocialkowski@bootlin.com, wens@csie.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] media: cedrus: Disable engine after each slice
 decoding
Message-ID: <20190603113827.2nmm5wkycf44aqox@flea>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
 <20190530211516.1891-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jzwau3t2b77xs3xp"
Content-Disposition: inline
In-Reply-To: <20190530211516.1891-2-jernej.skrabec@siol.net>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jzwau3t2b77xs3xp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, May 30, 2019 at 11:15:10PM +0200, Jernej Skrabec wrote:
> libvdpau-sunxi always disables engine after each decoded slice.
> Do same in Cedrus driver.
>
> Presumably this also lowers power consumption which is always nice.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Is it fixing anything though?

I indeed saw that cedar did disable it everytime, but I couldn't find
a reason why.

Also, the power management improvement would need to be measured, it
can even create the opposite situation where the device will draw more
current from being woken up than if it had just remained disabled.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jzwau3t2b77xs3xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPUGswAKCRDj7w1vZxhR
xcoOAP9mzllurMZRL+0rmJfj1Ie1ewdM8HeuqLiB1e/Mm8M0VQD/ULwrfBAx5fRS
/tgzkYR2nXRMpj0jQ6+7xa2pyZdkdw0=
=lu1j
-----END PGP SIGNATURE-----

--jzwau3t2b77xs3xp--
