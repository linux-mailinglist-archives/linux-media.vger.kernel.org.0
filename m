Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADF02CA011
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 11:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbgLAKkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 05:40:01 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:51023 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729881AbgLAKkA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 05:40:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2A70858061F;
        Tue,  1 Dec 2020 05:38:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 01 Dec 2020 05:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=AOpTmHXIB1HGDEnfEEoBW+saz75
        jDDaup38+K/BCiPs=; b=UpXwBRIOefp7bJnwv8xhvFLijWtThVy7JVaZP75EGrs
        DfgMw3k0x28LRnq0Jf+ExYNOfuE5rtOLwmPad4ws29L6sO3PQkjnzuhzebje3OGx
        dcKi8r1UepqQ/pjnEHsRaVX9sdoVcsAWZoO7SANMiuw39wgyDmigVi7FQmy0nuZg
        b1QI6h16KsN+5yINUD1Yyd7uDiR+F+baCFMQrTR/PMlCtS5GP2SM5U1srXabgHKA
        7OlVP/En40xxMhThuWn8RZiwIl6mUTGHYriacqRI/kDO5qxSFyrr5WzBHX8dVP+E
        /8PxE7TpjXpN7d26RG/yj7EWGLs+YSlvLlJPfN4X/nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=AOpTmH
        XIB1HGDEnfEEoBW+saz75jDDaup38+K/BCiPs=; b=bz6HSpsbxILtay41kU9oF2
        L8deEC3aXKXLbH5SUzA/DULlqocSU5lVP7LQFFujZYgBz54w/YAiM++LDfrED+s9
        nqEzdw8Zhm+PTVg4q1ICePj3lc9UpO2YHV7cXYWc0/axtvQTErwCKPk3D+5VfGyx
        httNoCD0JjMlsooByRUvL19TmbmMB4o5ZscFgixDzgfmHId0rXn10dwqWjhrPZSy
        E4eFK7v5vI2CMeIBCBv98O8LOCr/U/aN0+hbej2oIeYzb2pPdkrY2d88LNGSk5Wb
        J0fqcwAd1Y2+3cpQFN9RxopjoMdjz+53slffvk7unpf1NcD98JJzm49FxrC7drmw
        ==
X-ME-Sender: <xms:Ox3GX102woqyBhbf5Scbvu5ViI7X7uL5fF-ok5wFgUx_FB9lmQpM0g>
    <xme:Ox3GX8A0ur2kV3uf7oqV0fqN4zHAed1hV5Q3hHoL9b5mFVF_AyGvuBaPc-3IFkRCR
    JD3xBJdkp-lyjLgBAI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ox3GXyzr0dVxpwckZSiZ9r5y3pPfnuYQBYa9wd0O_GZJjwSFM7IAwA>
    <xmx:Ox3GX6mW5Vly6aJpEpiZ_CY6FKZfjgbE5urVmkm5ZA-Ahi_yJbJAPw>
    <xmx:Ox3GX3EF6Ay9nZGMiKNQixsIqIRJJI298bfK0EVewBfPweVzl0OB2Q>
    <xmx:Ph3GX-lJbjvXCan0hc2I3ghxzbc3zuUyc1ztLuVd3mar7N4q_j-kZQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id D94AD1080057;
        Tue,  1 Dec 2020 05:38:50 -0500 (EST)
Date:   Tue, 1 Dec 2020 11:38:49 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: Re: [PATCH v2 03/19] phy: allwinner: phy-sun6i-mipi-dphy: Support
 D-PHY Rx mode for MIPI CSI-2
Message-ID: <20201201103849.cqjpf7lurn5htwgs@gilmour>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-4-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zmsqkppuctc6r4g7"
Content-Disposition: inline
In-Reply-To: <20201128142839.517949-4-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zmsqkppuctc6r4g7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2020 at 03:28:23PM +0100, Paul Kocialkowski wrote:
> The Allwinner A31 D-PHY supports both Rx and Tx modes. While the latter
> is already supported and used for MIPI DSI this adds support for the
> former, to be used with MIPI CSI-2.
>=20
> This implementation is inspired by Allwinner's V3s Linux SDK
> implementation, which was used as a documentation base.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--zmsqkppuctc6r4g7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8YdOQAKCRDj7w1vZxhR
xfabAQCKz+DonqaT9Ix9D8Rls8njfXhm1dyR350ijoHZbIWOdwEAi6e3Q+a0clB6
8XLbvaH6EtFSjiv+xvN27NigNJ6dYQc=
=gpZc
-----END PGP SIGNATURE-----

--zmsqkppuctc6r4g7--
