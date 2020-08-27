Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E820F2549A1
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 17:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgH0Pit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 11:38:49 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53457 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726084AbgH0Pis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 11:38:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 740865805D0;
        Thu, 27 Aug 2020 11:38:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 27 Aug 2020 11:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=bCI2/2EXYZlkg7KVNDs3Yi/c69K
        oAvaFvqLONlhFppM=; b=RfX2i3bWOzTK+f5OlOF2d9ZoklAwX2wD2QTcHz2r4qR
        GWMZZMzPoGmC7qokmeSc6XoHQo7UqcatwEoFrRmtw0VLlluhG0LMPPfkhPmR8sU0
        VSH5ybITtesW323MCBgwhWxe7c4VPGIYkUtjUB1qPkWmLxerhGFICd3CF2BtG22h
        pOF3j/BCKLA1LVNmtFe+S3+Hkt2fWvpO3uJto52Y7Lh3KcsStUpyvzv4iRThfAYV
        R7ceCMnqgi04Zz83lPghDkSPQkYhbBzq+4aokpIuGa4lD43+BqiyfW5vUmGhLLMb
        d6Q1xMu4yf4wSPo/antuyarI9hPlop8UvgBK98z0WVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bCI2/2
        EXYZlkg7KVNDs3Yi/c69KoAvaFvqLONlhFppM=; b=FOqH1eW0Yi3aSVQaRMF0UF
        8O14/sy1aOSQj4tHeJbbV12Qwy4jYVDIegOBoe9UUwBP5POw8/E5Y4VASWKGp3W+
        dATVLYzeTZsP9Rd4strOqXbmChcIE5U92Lde772sio6yBItIKbC6YazRFbvzYvx9
        EBgBGynAv1+8qZF0OjNBGVMUovlVPYiuFBEQTeqK5jyEXLDuVGkaF/Yb6nQbh5sn
        GFWNQoOW6uApODoYVdB8gSIbgmGQIQ/G2V9wTaNVLkffb47ozhm1OsGUuUqXHHl+
        TPxYsctSzINWO75lAsVHMdh8vGbfAbrK9PcVb5n7ArDG17IdMrZN+Ngm73qGqD3A
        ==
X-ME-Sender: <xms:hNNHX2JlRtfvc8Uik43eVeKQwrE09ZN2ElPCYXVg_EZsGaqfCxJXJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hNNHX-JSXaLZQoWl8i9UitAGYepqFEFgneWsPw_SVOyldUZQpPVdgg>
    <xmx:hNNHX2uu61UfmtjQ7jmrEerymHzIoXOhPg7UCE50J-hxINxUM_ibWw>
    <xmx:hNNHX7bRlC2ok98n8QGZ88gIF07gSmizq7awjTJsORFBHzKWaTZ5NQ>
    <xmx:h9NHX_nL-R_ljgJmwxLPzRijDX1C17Yx3ugDtHJY--Gs7YTyVW_yvQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 95FC93280059;
        Thu, 27 Aug 2020 11:38:44 -0400 (EDT)
Date:   Thu, 27 Aug 2020 17:38:43 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 7/7] [NOT FOR MERGE] ARM: dts: sun8i: a83t: bananapi-m3:
 Enable OV8865 camera
Message-ID: <20200827153843.mjcnc5fiuxj3df3s@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
 <20200821145935.20346-8-kevin.lhopital@bootlin.com>
 <20200825144022.mwkcqaqny7l5bab4@gilmour.lan>
 <20200826105834.0100d4a7@lhopital-XPS-13-9360>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xxui7sksudpoup7a"
Content-Disposition: inline
In-Reply-To: <20200826105834.0100d4a7@lhopital-XPS-13-9360>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xxui7sksudpoup7a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 26, 2020 at 10:58:34AM +0200, K=E9vin L'h=F4pital wrote:
> > > +&ccu {
> > > +	assigned-clocks =3D <&ccu CLK_CSI_MCLK>;
> > > +	assigned-clock-parents =3D <&osc24M>;
> > > +	assigned-clock-rates =3D <24000000>;
> > > +}; =20
> >=20
> > Why do you need to use assigned-clocks here?
>=20
> I could do it in the ov8865 node, does it sound good to you ?

I mean, it depends on why you want to do it :)

If that's because the sensor expects a clock in a particular clock
range, then it should be enforced in the sensor driver itself.

Maxime

--xxui7sksudpoup7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0fTgwAKCRDj7w1vZxhR
xSGMAQDhTlNvOxV9wnkTB+50Z9gLcsjI/f5Jr3hGnabhLDyYBwD/aIvZ15eWcPNP
EO23kDLNupJn1xWg9W/Eufm9fgATMAc=
=WONR
-----END PGP SIGNATURE-----

--xxui7sksudpoup7a--
