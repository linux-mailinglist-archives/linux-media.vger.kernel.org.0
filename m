Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76A006EE70
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2019 10:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfGTI0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jul 2019 04:26:14 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:60491 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbfGTI0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jul 2019 04:26:14 -0400
X-Originating-IP: 91.163.65.175
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A2B7860002;
        Sat, 20 Jul 2019 08:26:11 +0000 (UTC)
Date:   Sat, 20 Jul 2019 10:26:11 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jan Kotas <jank@cadence.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: Add lane checks for Cadence CSI2TX
Message-ID: <20190720082611.qpsbrlwti3wydigk@flea>
References: <20190718111509.29924-1-jank@cadence.com>
 <20190718111509.29924-3-jank@cadence.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jgvxedzjy43xc5rm"
Content-Disposition: inline
In-Reply-To: <20190718111509.29924-3-jank@cadence.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jgvxedzjy43xc5rm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

65;5603;1c
On Thu, Jul 18, 2019 at 12:15:08PM +0100, Jan Kotas wrote:
> This patch adds line checks for CSI2TX, to prevent
> clock lane being used as a data lane.
>
> Signed-off-by: Jan Kotas <jank@cadence.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jgvxedzjy43xc5rm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTLQIwAKCRDj7w1vZxhR
xatxAP0ZArJB75RtUGlL1iE13NnSYhngB3+XOjCzp1A1y09bgwEA6QhuXaYc0hxB
NdiD2xowXQPWP10goaY8YOoWs1DZQAs=
=Je75
-----END PGP SIGNATURE-----

--jgvxedzjy43xc5rm--
