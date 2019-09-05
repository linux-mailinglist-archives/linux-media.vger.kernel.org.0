Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04479AA25F
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 14:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387582AbfIEMBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 08:01:24 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:46207 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729809AbfIEMBX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 08:01:23 -0400
X-Originating-IP: 82.195.192.6
Received: from localhost (unknown [82.195.192.6])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0FD27FF814;
        Thu,  5 Sep 2019 12:01:20 +0000 (UTC)
Date:   Thu, 5 Sep 2019 15:01:19 +0300
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jan Kotas <jank@cadence.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        rafalc@cadence.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: Add support for Cadence CSI2RX version 2.1
Message-ID: <20190905120119.q4u6iyc555simdqa@flea>
References: <20190905105601.27034-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b24bcaatzpnvmlil"
Content-Disposition: inline
In-Reply-To: <20190905105601.27034-1-jank@cadence.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--b24bcaatzpnvmlil
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2019 at 11:55:58AM +0100, Jan Kotas wrote:
> This patchset adds support for Cadence CSI2RX controller version 2.1.
> It currently limits maximum amount of data lanes to 4.
> Existing compatibility with v1.3 is maintained.

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--b24bcaatzpnvmlil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXXD5DwAKCRDj7w1vZxhR
xQJ2AP4vHOC198ms6cJrZMAAchsCkPuTHioJxT9R8iNtLc4xLQEAzBQGZPtWmbHN
kN+/tPIFPPcrCzburPlR7qQWBzj8iw0=
=BN76
-----END PGP SIGNATURE-----

--b24bcaatzpnvmlil--
