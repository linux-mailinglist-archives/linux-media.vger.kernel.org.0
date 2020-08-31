Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA394257A08
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 15:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgHaNFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 09:05:08 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:59127 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726312AbgHaNEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 09:04:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4109B5806A8;
        Mon, 31 Aug 2020 09:04:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 31 Aug 2020 09:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=OksYHyac3fnP5r/s9UEYAtkDaXe
        rVbf3CMP9KhXgW3A=; b=gEKZiHsoxC331MtHaDKehDi/zbAgqh9THXdSpEIAv1H
        LxjIKK2As5frnQaNy4+cDvpOKqK29Hs9C+qbOKlFxXKS5M3bJp8tntpc8Zzy9zrR
        pmUzBPwAhzJln1LWWBiU9nxhgFquJIdodK+APoYEuJuDisv8uoaAA5TWm8GSNxqP
        QWp2dcFg8lTLwrA0me4t79F7e4/XNZYowti8Zhp1t3Sudbj0whbT2MWIFRgA9HYP
        TWJnjckUun+AYhj1Efoj5tlE8Ru8howXexc8cNHCf/xQoQ0BzaSSM63BXmTAqQTn
        ESTQzjLSJEDp5L+fxTX7nAMqkId4/6cyCMRG+0/sRNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OksYHy
        ac3fnP5r/s9UEYAtkDaXerVbf3CMP9KhXgW3A=; b=Ovu0ngWueytMSNIAV6J6sR
        vrGksFa02XoVowfgyUNlWfUdpOzrXiH4R4CpgcPuFDHuqBpnVKRHQSO88dYA7Cyj
        OGefdq1LC3aoYqLcgaaQ8bxDi3ysN8+Is4PVyAJfV1OPGR6hRa7x/6DspL2XWbS2
        JBYKEpKNuesFIPYLaSI0JtU/atDsinEC1JWX9W1TNog3chufI2PyBr32QWoKnMKa
        O9OY51LBOAOh/Sc+SKHk3Dy24/8351FH3pvW7/TADQmUsPwCljudjSVMXJAJsspg
        mOcREGU3T/JN22tfwvo941Y7795UNKiBxVuS6ND9mxSCb9NVplYr3GR9JA0PHfLQ
        ==
X-ME-Sender: <xms:aPVMX0W1ZXUkLyOW5_x13LNUKIvlg0TirwoKrGpWqW72bsF7eXAHUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefhedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aPVMX4lIvJbGBpR96RYwSyCrEhpaunktOp3YXRIMcN1rq2nGD5yfzQ>
    <xmx:aPVMX4ZQAvsTq2mtT3XcfTUyfbf-x-rxkTBbQgWQwfhsQ05rv2cnuw>
    <xmx:aPVMXzUZwKiacGqLd0FI7cK7UbqzFGZ6LCobvyGrBU9_f2Bc9vaDrw>
    <xmx:bfVMXwdxudmdp1gUHfC1_mJjHIMUrfhSbYvvWayPoiTFNJCsOHwLCQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 14AA13280065;
        Mon, 31 Aug 2020 09:04:39 -0400 (EDT)
Date:   Mon, 31 Aug 2020 15:04:38 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, wens@csie.org, yong.deng@magewell.com,
        mchehab+samsung@kernel.org, p.zabel@pengutronix.de,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 0/4] Support of MIPI CSI-2 for A83T
Message-ID: <20200831130438.5j237mntivrw3cwo@gilmour.lan>
References: <20200828131737.12483-1-kevin.lhopital@bootlin.com>
 <20200828141203.GC6858@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b4qmuwqdmiqxdr5o"
Content-Disposition: inline
In-Reply-To: <20200828141203.GC6858@aptenodytes>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--b4qmuwqdmiqxdr5o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, Aug 28, 2020 at 04:12:03PM +0200, Paul Kocialkowski wrote:
> Hi everyone,
>=20
> On Fri 28 Aug 20, 15:17, K=E9vin L'h=F4pital wrote:
> > This series adds the support for the MIPI CSI-2 controller for the A83T=
 SoC.
> > The CSI controller is the same as the V3s SoC that's why I put the A83T
> > MIPI CSI-2 driver in sun6i-csi.
> > My work is based on the Allwinner BSP for A83T and also on MIPI CSI-2
> > specification for the A83T given by Allwinner.
>=20
> To give a bit of context here, Kevin is our intern who worked on MIPI CSI=
-2
> support on the A83t this summer. As we were approaching the end of the
> internship, we wanted to publish the current state of the work as a worki=
ng
> reference and base for mainline support.
>=20
> However, we are well aware that there are significant design issues in th=
is
> series, such as:
> - not supporting the fwnode graph;
> - not working with the DPHY API;
> - adding MIPI CSI-2 support under the same dt compatible as parallel CSI;
>=20
> and probably other things.
>=20
> Bootlin is currently working on V3s MIPI CSI-2 support and we intend to r=
espin
> this series when submitting V3s MIPI CSI-2 support, with fixes to these d=
esign
> issues.

It's great to have that clarification, but it really doesn't address any
of the questions I had in the v1:

> There's a bunch of things that would need to be explained and / or
> argued for here, in particular:
>   - Why did you need to plumb it into sun6i-csi?
>   - You're naming the CSI part as the A83t CSI, while MIPI-CSI has been
>     supported since the A31(?), is there a reason for that?
>   - This is not documented anywhere, what did you base this work on?

You're also mentioning the v3s, without really stating why this driver
wouldn't be able to drive it.

> So we hope you keep this in mind when reviewing the series, which is
> not meant to be merged in its current state.

I mean, if the current code needs to be redesigned, and you provide no
details whatsoever on the hardware, I'm not really sure what kind of
input you're expecting.

Maxime

--b4qmuwqdmiqxdr5o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0z1ZgAKCRDj7w1vZxhR
xcIdAQD4AMq93jtqf5iCSZvZKfZ561pwJYqkPNSNcGBJRo89/AEAkZqWO5FhGhtu
g9JnCFQyoH2HOEf2wpPFLfqZRWgnIQY=
=K+VR
-----END PGP SIGNATURE-----

--b4qmuwqdmiqxdr5o--
