Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEDB16EE72
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2019 10:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfGTI01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jul 2019 04:26:27 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:39709 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfGTI01 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jul 2019 04:26:27 -0400
X-Originating-IP: 91.163.65.175
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 97885FF805;
        Sat, 20 Jul 2019 08:26:24 +0000 (UTC)
Date:   Sat, 20 Jul 2019 10:26:24 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jan Kotas <jank@cadence.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: Update bindings for Cadence
 CSI2TX version 2.1
Message-ID: <20190720082624.wdignhhub75zh7w4@flea>
References: <20190718111509.29924-1-jank@cadence.com>
 <20190718111509.29924-2-jank@cadence.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kxdudh735ieygcik"
Content-Disposition: inline
In-Reply-To: <20190718111509.29924-2-jank@cadence.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--kxdudh735ieygcik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 18, 2019 at 12:15:07PM +0100, Jan Kotas wrote:
> This patch adds a DT bindings documentation for
> Cadence CSI2TX v2.1 controller.
>
> Signed-off-by: Jan Kotas <jank@cadence.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--kxdudh735ieygcik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTLQMAAKCRDj7w1vZxhR
xa6LAP9ZJVEG73pOF+gJ1WOZNzWcR9iUi6Al6CvMO9aj5tQfFwEAjANZAdALwgOh
rhFkyxgF1FxW1IeCTz3OL+O2jDxLUQY=
=FW9N
-----END PGP SIGNATURE-----

--kxdudh735ieygcik--
