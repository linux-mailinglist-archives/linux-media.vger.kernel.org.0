Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E306FD5A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 12:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbfGVKB3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 06:01:29 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:47789 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfGVKB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 06:01:28 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 68EB86000A;
        Mon, 22 Jul 2019 10:01:26 +0000 (UTC)
Date:   Mon, 22 Jul 2019 12:01:25 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jan Kotas <jank@cadence.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        rafalc@cadence.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] media: Add support for Cadence CSI2TX version 2.1
Message-ID: <20190722100125.y4ojf3quqopktncf@flea>
References: <20190722082223.18693-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dgdhrvv3ycjgpmmt"
Content-Disposition: inline
In-Reply-To: <20190722082223.18693-1-jank@cadence.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--dgdhrvv3ycjgpmmt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 22, 2019 at 09:22:19AM +0100, Jan Kotas wrote:
> This patchset adds support for Cadence CSI2TX controller version 2.1.
> Existing compatibility with v1.3 is updated and maintained.
>

For the whole series

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--dgdhrvv3ycjgpmmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTWJdQAKCRDj7w1vZxhR
xStlAQCn41vU+G6UpwEkOdIzsntf4crx4vpr3XFje6b3E/gn+AEAyOChzbyIRden
akf239VnjvsQn3AU1/GEpWsF9jCc2wE=
=YpCh
-----END PGP SIGNATURE-----

--dgdhrvv3ycjgpmmt--
