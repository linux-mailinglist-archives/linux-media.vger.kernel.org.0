Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEA326469E
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 15:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730585AbgIJNLq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 09:11:46 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:45149 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730187AbgIJNJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 09:09:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4992F580350;
        Thu, 10 Sep 2020 09:08:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 10 Sep 2020 09:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=VVbErVHSRW+XcgK4T8+BuU5pymU
        mplYyEZNHTIBduJU=; b=TzjtPyhybN+p+jKYBxNS47cUtOeaBbzh5z8yB4wB9zp
        gtHTdpq/S8Q3A8UFakUE0o2kY5E0QLtOImFJ7cIOBEo5vKWLsXDqmyOptIyECEGY
        XganJjqI2GViX3bBwz9pkJijYqzuxZVdxdPszCCXYG4fVP1DGS/eXHAK+2NKubv3
        5woBKgXPWjqv/5bJ0CyL7+LsQUJgFbq4+DE5KvUFIM2bREDsTRoUucdxlIBAROPK
        VQu7LsjS2QRB5qzkw+0Q5PXPxF+WeCKrRKB4Aw7fmWqsaA0sN2rRhjtg3+IP1sfW
        NxtCRikYOsU3W76LpwK7w9PrsCQR8+fW4z85Qxjv+Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VVbErV
        HSRW+XcgK4T8+BuU5pymUmplYyEZNHTIBduJU=; b=CFsumIWwHqz7pddDS4wW/j
        EfA7CVxNE5uqOFCUe9wHYmebDXuQcMhX482xh/eklo6CwQCqaun6NSAstG0Cdnso
        1AFK3Os8llPbhgt7GioGMGd5M3eK0ZEt5JIyjZ2PB14F4REFNcOl/0ImkXJI8hKJ
        WYYJEBxONZXYI047gZVAo9fxNf0MEp8YfGpcnQDkuCh6ew2FWPkOMNrde/xmddwB
        sg9tQpYJ7zu4AcpOfO9ePsQzqQVuTg0GRDVI1buz1LL5Xp88MXDLvUZ/CodHOnIT
        c7DrPpRZUDgbu4UtsqcEdISZoKHvk8K9Ab6sEpbFrbZGffWAHEcg1SCKpSkqLV4g
        ==
X-ME-Sender: <xms:ZSVaX480wwkzElWwqCu6ReOpu7uzFsRaTHs2-G2SohhMPwQFGUli8A>
    <xme:ZSVaXwv3H0cC2OB5biB8E3hBxPohTVz3WCtN8dfDXyZxlJoBIQjNA1ZrTORKEbwtQ
    BDClSu4EnaALM7UDwE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
    ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepledtrdekledrieekrd
    ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZSVaX-BpFEB6LuTSO_QNaL8RlXnvCVnMCkerFGZRumuCsONxxVzo2g>
    <xmx:ZSVaX4fAM7-dysg1vEVlBbKhBptf8LfDA-zdShkgY0KYfmIHXMu5jw>
    <xmx:ZSVaX9MHurJXo01CffBXED4Xqr84flaRjRp3AKL73g6c72rJkmgVkw>
    <xmx:ZyVaX2iKMZ9hdwM6gGWjGw8MFR9saxLqQ7ZADt82ZfOz_mEMdoYzOA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 969FC328006C;
        Thu, 10 Sep 2020 09:08:53 -0400 (EDT)
Date:   Thu, 10 Sep 2020 15:08:52 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Martin Cerveny <M.Cerveny@computer.org>
Cc:     devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/6] ARM: dts: sun8i: v3s: Enable video decoder
Message-ID: <20200910130852.2bfodnkoapbtosjx@gilmour.lan>
References: <20200904200112.5563-1-m.cerveny@computer.org>
 <20200908062327.7o4abjnosvghtafy@gilmour.lan>
 <alpine.GSO.2.00.2009081840380.6717@dmz.c-home.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="whzuaxinuaqfn32l"
Content-Disposition: inline
In-Reply-To: <alpine.GSO.2.00.2009081840380.6717@dmz.c-home.cz>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--whzuaxinuaqfn32l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2020 at 06:44:06PM +0200, Martin Cerveny wrote:
> Hello.
>=20
> On Tue, 8 Sep 2020, Maxime Ripard wrote:
> > On Fri, Sep 04, 2020 at 10:01:06PM +0200, Martin Cerveny wrote:
> > > First patch extends cedrus capability to all decoders
> > > because V3s missing MPEG2 decoder.
> > >=20
> > > Next two patches add system control node (SRAM C1) and
> > > next three patches add support for Cedrus VPU.
> >=20
> > How was it tested?
>=20
> On V3s with LCD and bootlin raw v4l2 api test:
> - https://github.com/mcerveny/linux/tree/v3s_videocodec_v3
> - https://github.com/mcerveny/v4l2-request-test

Thanks. Can you put it in your cover letter in your next version?

Maxime

--whzuaxinuaqfn32l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1olZAAKCRDj7w1vZxhR
xQqYAQCb1N/Hpp3mZzTdhwal+tCqm8yNLlEGiLL41icRvYH6VwD9H8A1QtVsUhs/
MR5gRpuKZU6k8lUJtoLJWMCUWuFVbQk=
=dhw8
-----END PGP SIGNATURE-----

--whzuaxinuaqfn32l--
