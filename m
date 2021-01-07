Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77B12ECCF9
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 10:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbhAGJks (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 04:40:48 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:51943 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727468AbhAGJkr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 04:40:47 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 889791685;
        Thu,  7 Jan 2021 04:40:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 07 Jan 2021 04:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=TDfFs75GCV9rsOA8VdhLLpMC1Ru
        4xH2eNakwbrWXaHc=; b=UxuVzqG58eMv1PiqarFY9vxoQMNxAfIXvakN+R/Fc/9
        TUJ1MKlSJN1gRMaiO3VC/sPCAeseYw5/IYDsT0NmyS5OHdqcLct0MmMzQVUlFMBx
        hcSWIweZiRQhv6Hk69zsBmjjn64BIGxY+j90ZMSBZ0T+mWbBqEstzHanxlqXlR5/
        Ggne19hjapju3pzG/6kqq56XRryu2DS19gYIfMdMlVR9uW4b3j8Lw4kLuIF91HQV
        vO5eqSTg/+Lboojyly3HMCZcTkEdzcUw9VEqTJCMVW2rUYzgQ9UtRH0LojX0HReq
        ezZAx9P0KzNcdaC86Q5KubraJCrZeceO/TWSGybBD1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TDfFs7
        5GCV9rsOA8VdhLLpMC1Ru4xH2eNakwbrWXaHc=; b=VK7XB6CZ9PGrm0Y6XqXpLe
        6hYv79ZLOdIs8ab3vxzsu8gEXy4s7NFYFzd6V26pop5GxRu8N/dB7AanSAJMxHl5
        VzsJrI/IuYSRs9aW75fWT+f/ce7/AGuiDVHf4LL2olBcAwX9stsHRCcRsiAwbQKF
        L8xmECcGGcjdwW/CgJN3gBJRyjpDk4M/2La63VDXTmENwp+QTre4otnY+IgfqnOU
        v4bh3sR5Xp7Golo6jLxAH7wp2WUmCcBZYADKv8tP5w7LAgpZKegNTDlWlfgrEPf3
        UlPxPoC4mmpAlAMtpej7gj0ltB19Cxa4j3j91gRny40/feEF/NMx1yWm+npqd8Lw
        ==
X-ME-Sender: <xms:79b2X_GKhO4IsUnzPPBUpCAfHSCR1PD2lRRalJ7MzBtWjYz-AcOTDw>
    <xme:79b2X8XKZf_xvJ_pjTn-E-XPmZ6sAhavqDZropJM8D69zuumQvOb_Th8wez3t_kFq
    VAmb9CFJq7uiJm7jlY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegvddgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:79b2XxKsgO2c1Z_JjC_0rZUlzqIciVHx8h02iQVylTU1TJSDhyN6jg>
    <xmx:79b2X9Hb3DvcYlh9-G6mO9aXe4WiNt0vwjmaPYR-6J-liDlERk1g6g>
    <xmx:79b2X1UidwnEgQ4xXBXzL_7z3OzjuVv71761XXyguFfVQtOXqzb4IA>
    <xmx:8Nb2X3KOXplmUCe9WX37SUwwJsQXoXM_wAD6DvMabXVhJ2L58hItaA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C835A108005B;
        Thu,  7 Jan 2021 04:39:58 -0500 (EST)
Date:   Thu, 7 Jan 2021 10:39:57 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     robh+dt@kernel.org, wens@csie.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/2] ARM: dts: sun8i: r40: Add deinterlace node
Message-ID: <20210107093957.aobpuvkdn5nyezjm@gilmour>
References: <20210106181901.1324075-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2i64phdagcysgebp"
Content-Disposition: inline
In-Reply-To: <20210106181901.1324075-1-jernej.skrabec@siol.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2i64phdagcysgebp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 07:18:59PM +0100, Jernej Skrabec wrote:
> These two patches add support for deinterlace core found on R40. It's
> compatible to H3 one, so only DT node is needed.
>=20
> Please take a look.

Applied, thanks

Maxime

--2i64phdagcysgebp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/bW7AAKCRDj7w1vZxhR
xfu9AP9OhXzDLr7U+vO/3JNjStesOkAPGR0ZkQngpLexGdBz3QEAoB8odap6dc6z
J8O6E58CmgdwzEKyLLkGtry5tPvi/gU=
=5rRQ
-----END PGP SIGNATURE-----

--2i64phdagcysgebp--
