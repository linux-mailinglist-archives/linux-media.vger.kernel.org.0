Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6394332F50
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 14:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfFCMOD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 08:14:03 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:53789 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbfFCMOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 08:14:03 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 970BC60004;
        Mon,  3 Jun 2019 12:13:45 +0000 (UTC)
Date:   Mon, 3 Jun 2019 14:13:45 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     paul.kocialkowski@bootlin.com, wens@csie.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] media: cedrus: Remove dst_bufs from context
Message-ID: <20190603121345.5uh4xquo64fopqnn@flea>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
 <20190530211516.1891-5-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hwwfrxwoaemzsp3p"
Content-Disposition: inline
In-Reply-To: <20190530211516.1891-5-jernej.skrabec@siol.net>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--hwwfrxwoaemzsp3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 30, 2019 at 11:15:13PM +0200, Jernej Skrabec wrote:
> This array is just duplicated capture buffer queue. Remove it and adjust
> code to look into capture buffer queue instead.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--hwwfrxwoaemzsp3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPUO+QAKCRDj7w1vZxhR
xY1uAP9hH5O7WjfeV/BXsKPStm23IM1ZX1gwoL+bHz6M1yQBjwD+NvJ/2aWqWf8f
R+ArhaQDIa5EhvE33GmymyMWU6/RpQc=
=Hu9G
-----END PGP SIGNATURE-----

--hwwfrxwoaemzsp3p--
