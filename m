Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046672CA00D
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 11:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388802AbgLAKip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 05:38:45 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:53359 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730020AbgLAKio (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 05:38:44 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id D6F35580612;
        Tue,  1 Dec 2020 05:37:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 01 Dec 2020 05:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=dJ8x8jAF+EN65W8rz5a676aKHaM
        W6X9PYkMXzzLt4c0=; b=AC7jsIO5A93hvm2W+ZtFmXGxbvQja4KaRIQmELdI59R
        WRSDaZYvi5/N7fv8SfT14h64m0RrZC1UMFSVrmKbFn8J056K4Ye3BiDYy/asmBWw
        KHSd9DeWzFp6qSb4h5rhQK5iaj/P4nKOs4TurEoll6MPZYyLCP3igM87pnQ7JCIe
        qbZ8pPpmh0jnLtZ15rLY2IzJJsj60DN4l9hetMH1mkhrf7QAY9cSo27irpQGbGYa
        BqkBj5WaVQiJy1vW+laG9q/ZlbEoCwxGMs+Pw5RSbviBCTEHF5bFLGvrlmjLGBm9
        Q2KhzufBoN4j7XgWF7x7QFwzAfOF4ZTSiS/iP/NJP4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dJ8x8j
        AF+EN65W8rz5a676aKHaMW6X9PYkMXzzLt4c0=; b=VzO9X1InHedAohX3LQmDBT
        LM544c1GWJ8D/2/xtPXpB7wQUvNt7hieHgWPaOUFqLSRBxjGBF6LhI/LNx530CLi
        oIe/IZGRazbiECBxcJjW6D407GdhYy7FrVOYzmXa6yfgu5ZbJvw9L2FxISvyfay3
        EDh0bhmONRzk41u7cDyixSUeWfD5zJnzyUyW3qWaA3A11tttmZkSKHKvrGgw8q4E
        fYRgW5kwww1Pvj60NXvo7mum3qdeOR4LlI++dBPk8Ye97vMfwfkq5xRViwPp+9df
        fHCJeNJo1X59QBqdi+cLs083osi+1Nl0I7pmVkVeiuIva18M0nKkMLHgXZD+piAw
        ==
X-ME-Sender: <xms:Ah3GX-bHmRs_HYXGX5gb0lJ37ZcrTKJxtAJXkh3jx7KWPBntKXr4Ng>
    <xme:Ah3GXxbdEO5V4q6I0KY1FucIA77JP2CkxNca-nQb54fBvaHc_WdU7HsPbUpJ-3p4U
    PAZVgVa2wD9ukvxHQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ah3GX48-eF-Q3iknySKMaaL7KKZ515W8OEjdae9G4gncjM7UDEz3lg>
    <xmx:Ah3GXwqJHqFh8s_UmGdq5FF_aIqhiwFGM1ICAma8ra_mhsmFKeECZA>
    <xmx:Ah3GX5oZm0ZaiiFI44BVit7QaCUI66Yavxd1T5Wv39b3hpIlbQ81cg>
    <xmx:BR3GX9CmHHN7jhptvS7H-J2QrflJnMm8l4IjZIJgim3jEwsj24lb_A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 054EC108005C;
        Tue,  1 Dec 2020 05:37:54 -0500 (EST)
Date:   Tue, 1 Dec 2020 11:37:53 +0100
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
Subject: Re: [PATCH v2 01/19] docs: phy: Add a part about PHY mode and submode
Message-ID: <20201201103753.klvoqrv7grboovgq@gilmour>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h4ge5f64arxtqfzl"
Content-Disposition: inline
In-Reply-To: <20201128142839.517949-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--h4ge5f64arxtqfzl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2020 at 03:28:21PM +0100, Paul Kocialkowski wrote:
> Besides giving pointers to the relevant functions for PHY mode and
> submode configuration, this clarifies the need to set them before
> powering on the PHY.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--h4ge5f64arxtqfzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8YdAQAKCRDj7w1vZxhR
xSjSAP4lTrtYAZ2B8ltcBIkKXx8jrh9WOHUZmd/jTVBbrlpaAQEA/Mym782MhSQN
oNoxZn8BKL4FeHuPgnid9BUa8QH5FQ4=
=VneL
-----END PGP SIGNATURE-----

--h4ge5f64arxtqfzl--
