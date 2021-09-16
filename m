Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622A840E1FE
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 19:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243269AbhIPQdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 12:33:37 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:51859 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243454AbhIPQba (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 12:31:30 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id B62142B00B18;
        Thu, 16 Sep 2021 12:30:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 16 Sep 2021 12:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=Lqt0we4A/T0SHYBhw0ZBiteVrFa
        e9rbK0EPrRuFl3oY=; b=LnIWuareiS2jP4nnsunZoVLeH91/ijKlwjtNs0JMLTq
        W5SkajmnGWk707CsLe1azxnZa8myH4n+bFwA8ckwnQjA8EphQZ0JCTbh4Y6K4n92
        g2g1F/E53xOP06kQjsn+JOMXRyEu2S88ZzuGGJQxDVYZTatLErit5ewiKV6u2BdI
        lsdp1cZ5a3HMBapmFj07mGRW4hl42aMEFuzE7fU2OxArRkU7uz0Iikxns502WK2A
        VurLq8I/YfExtRjENhb9CeCKHxLmcZVIj9cZsKuRCnd2TZcIYlaMPv+7tJ16zeKO
        lv+MK8f24hm/KgC6L9xe5JnBP56ZQ7rQAeA2NIPzziw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Lqt0we
        4A/T0SHYBhw0ZBiteVrFae9rbK0EPrRuFl3oY=; b=hzcmiTskzfJ0LpViQyTC36
        ukeBnRV3kVOlWsu8LkC8k3TIb0V6CrrFJkdx5Op//6RBN8W6uLa83Op2gJZ5M6bA
        5CKZYAMI8pT3jB91IQObI/Zwdf7H9RY3lcqQvuTZhmouwzJmpjnAINJFQk9RZqCP
        oU/PuigbRr66lGhsqy7F+GrdxXBtRVpmg3VbU/sccLOyqg5GIWO6uiqOk+75rKvi
        GRDXS8VgLCMv6LllYt39AjMMPv/a9ZRqCUaBNHwX4nrPHQB95LHjWGSY5fpeEy9C
        I78PdIa9tVQJn/iwGijd8nj+guRXbXSpCIkz5ojHdqqkHjRo0hnQ5vsB7RyPdKEA
        ==
X-ME-Sender: <xms:DHFDYefc5hj8gi4dxWD0LPwIZ-7eCAuChRgl45hXKphK3maJmwnwXg>
    <xme:DHFDYYO0rUPS9nmSFSqwpcxqfQ_pQUfnIXBaWh_gKPlov19Nv09H08sl9fMbW8jej
    x4FLS8PBE-WDjuxu1Q>
X-ME-Received: <xmr:DHFDYfjlR9vtTu4VW1DUC-1go9vAGAgiu4mdYnnLPoc-sg8jUE3667OYC6LwQ6eKgLK2bp65AsiHYahP4-YRGqqoixLRb-JI6Ggs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DHFDYb8mvUuKkKkddxegg6gItiZ5TjT8Cc64Qf7pAUHPtYmMU-xSjA>
    <xmx:DHFDYavdsMaQrdk1zzZdfVtKrlwD3fDdTKdBvT-bzXktew1v5aVQpw>
    <xmx:DHFDYSGgAKXuaQV93QNJ2A44fGIJFswzUnmo5pe6HbLIx8qSeTi1UA>
    <xmx:D3FDYVkgEXJK3xiJFUwFzoVSyYi_MlOVvwBGpewYBcsbvogO0Rptf9nzLW8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 12:30:03 -0400 (EDT)
Date:   Thu, 16 Sep 2021 18:30:00 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 01/22] clk: sunxi-ng: v3s: Make the ISP PLL clock public
Message-ID: <20210916163000.6ezo6muhq23bewyi@gilmour>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-2-paul.kocialkowski@bootlin.com>
 <20210913075417.ampb2jt4quftpqzj@gilmour>
 <YT8RnzVqLebtPMD+@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6h7nudibxh245pvl"
Content-Disposition: inline
In-Reply-To: <YT8RnzVqLebtPMD+@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6h7nudibxh245pvl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Salut Paul,

On Mon, Sep 13, 2021 at 10:53:51AM +0200, Paul Kocialkowski wrote:
> On Mon 13 Sep 21, 09:54, Maxime Ripard wrote:
> > On Fri, Sep 10, 2021 at 08:41:26PM +0200, Paul Kocialkowski wrote:
> > > In order to reparent the CSI module clock to the ISP PLL via
> > > device-tree, export the ISP PLL clock declaration in the public
> > > device-tree header.
> >=20
> > You use clk_set_rate_exclusive in the ISP driver on the module clock so
> > it should prevent what you're mentioning from happening.
>=20
> It does, but then it breaks display support entirely (because the DRM
> driver doesn't use clk_set_rate_exclusive).
>=20
> The bottomline is that using the same PLL for both display and camera
> easily results in conflicts.

The commit log should reflect that then

> > If it doesn't, then clk_set_rate_exclusive has a bug and should be
> > fixed.
> >=20
> > Either way, using assigned-clock-parents is not a good solution here
> > either, it only makes sure that this is the case when probe is run.
>=20
> I'm not sure what could provide better guarantees. There is a clock
> parenting API (in the clock framework) which may, but this implies
> providing the parent clock to the driver which seems way out of line
> since this is a platform-specific matter that should certainly not
> be handled by the driver.
>=20
> I also tried hardcoding the reparenting bit in the CCU driver, but
> this felt less clean than doing it in device-tree.
>=20
> What do you think?

This is essentially policy, and putting it in the DT fails for the
reason we already discussed, but also if we ever want to change it for
example to optimize it a bit. In this case, we would have to deal with
the old and new DT, and the possible consequences.

So yeah, hardcoding it in the clock driver seems like a more sensible
choice.

Maxime

--6h7nudibxh245pvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUNxCAAKCRDj7w1vZxhR
xTHSAP94s1QU8mIU0mn77banRpkH0ZGKIUjPYygrvhOgdlCSegD/UryBgzqTDNlY
omqVVtLWlYLTj9NQE+yJaYV+lXE3oQo=
=K8KU
-----END PGP SIGNATURE-----

--6h7nudibxh245pvl--
