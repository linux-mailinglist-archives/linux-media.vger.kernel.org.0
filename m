Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C202CC138
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388851AbgLBPqw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 10:46:52 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44481 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387985AbgLBPqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 10:46:51 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3DE115802E3;
        Wed,  2 Dec 2020 10:46:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 02 Dec 2020 10:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=jRoUn1Nixmx8fV7/eiqUN6Tsxsg
        78St+eJ4PgOBSguI=; b=TQt9wzTEpAomumtEVyYfhBOFAMhYofunpmo1MYB5ub2
        mygYpWsC8enY2HvcSTrkSd4kho0hsgZbPDmWPkwBNTji/y5p7pGWgXwXoWLCQql6
        cgS7v/2fedN8fj99I/JEF0BuO4XrMRKCPl86BVk3aPzAzT/CWhTKFK0ZXnWX2jQX
        8CDdFM7OVTyvvwnS22/bH67qUYbh4efacDPeGvP+5QC6ZLCJINM9WwLLDzYg3zyQ
        rr9FwWd3Uk0UT3yqzOq1u8CQxFA/PhonDE7b6HM/BAuOPjQkBAhDQzQYEQEF/Fiz
        vlqPsFvOipJbglqukQLaGUndk9cqsglBAk9G8ipAy6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jRoUn1
        Nixmx8fV7/eiqUN6Tsxsg78St+eJ4PgOBSguI=; b=S7b+9A+BK+bXFoLMxHcUCK
        2ml/FqmbCjgSCQ9lUP16UtpeBuFflkv0aVlTfRQANUmf5sQmH9FrwnH2/XYvQGYl
        j7j/+NwdtpOTU3FjR5rnRSuFTcQxVdrxZ0GtiafXh0XkRK2iLRtN5KgW3fe4fUGL
        v6ZFrkkQ1aZe7beWfpnxnEb4ir4lvXvq4K9mwkInDtOw75DQ7tgqJ4t4Ly5GBNYP
        SxEJt9WF/MysoAs+Gtk41hOvThUw82c4zhmTpShEQgqRzwKgEY+VJ5nvCz/Oxote
        srw0OhNwnN704qXyqf51YnYxMqB2R2ki/77k/+qP/P+FQdlCH9a9GgfVkppWn4PQ
        ==
X-ME-Sender: <xms:urbHX7mweWR1qljBr_MExWUkdMRV0tmFycoSy-4iG7shpRNcYcPjkA>
    <xme:urbHX-2QGL3MuSS6ysrC0KGAkvZclRLfNn08313yojQTwbmq2USutfe5ngPBYww0n
    6zPMrrDN7J34lD9fqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:urbHXxr7hq23eyK4HjadMXO7LlCY7uZVKhxqtnSUl-C0vBVuO3yI9Q>
    <xmx:urbHXzmy7XQptpb2dVlgOp4l5d4xu9j9yP6iWT_47cXcDlUhVw4GJw>
    <xmx:urbHX53cI05xHEVa_C_yRehMj6z3E2UgIWfHhH589jZvxQOIrflKaw>
    <xmx:vbbHX482dsQIV9UiOVhgqRglb05zjpF5PLwLRAdB2fu23SuK7Wk7Ow>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 69B94240059;
        Wed,  2 Dec 2020 10:46:02 -0500 (EST)
Date:   Wed, 2 Dec 2020 16:46:01 +0100
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
Subject: Re: [PATCH v2 09/19] ARM: dts: sunxi: h3/h5: Add CSI controller port
 for parallel input
Message-ID: <20201202154601.ws7wrx6msrp3u4pd@gilmour>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-10-paul.kocialkowski@bootlin.com>
 <20201201121405.at4pwxon56ecwrx6@gilmour>
 <X8escb4SZXEpiR0n@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="btrg2f6ei6hzo3fh"
Content-Disposition: inline
In-Reply-To: <X8escb4SZXEpiR0n@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--btrg2f6ei6hzo3fh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 04:02:09PM +0100, Paul Kocialkowski wrote:
> Hi,
>=20
> On Tue 01 Dec 20, 13:14, Maxime Ripard wrote:
> > On Sat, Nov 28, 2020 at 03:28:29PM +0100, Paul Kocialkowski wrote:
> > > Since the CSI controller binding is getting a bit more complex due
> > > to the addition of MIPI CSI-2 bridge support, make the ports node
> > > explicit with the parallel port.
> > >=20
> > > This way, it's clear that the controller only supports parallel
> > > interface input and there's no confusion about the port number.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/s=
unxi-h3-h5.dtsi
> > > index 9be13378d4df..02b698cace6a 100644
> > > --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > @@ -803,6 +803,15 @@ csi: camera@1cb0000 {
> > >  			pinctrl-names =3D "default";
> > >  			pinctrl-0 =3D <&csi_pins>;
> > >  			status =3D "disabled";
> > > +
> > > +			ports {
> > > +				#address-cells =3D <1>;
> > > +				#size-cells =3D <0>;
> > > +
> > > +				csi_in_parallel: port@0 {
> > > +					reg =3D <0>;
> > > +				};
> > > +			};
> > >  		};
> >=20
> > This will create a DTC warning, since port@0 is the only node, and is
> > equivalent to port
>=20
> I'm not seeing the warning when running dtbs_check.

Some are silenced by the Linux build system. You can pass W=3D1 to your
make command line enable all of them.

> More generally, why is it a problem that there's only one node defined?
>=20
> One issue that I did see is that the port node doesn't have an endpoint
> here, so I will remove the requirement to have an endpoint in the bindings
> documentation to allow this kind of definition.

We definitely want to have the endpoint required. If the CSI node is
disabled, the error should be ignored by the dt-validate tool though

Maxime

--btrg2f6ei6hzo3fh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8e2uQAKCRDj7w1vZxhR
xYE3AP4u/RvuwgGW7PW013WC31Z7iECgCdFpXbQBo4FZEKym5wEAuygTLOqYLNTZ
3TelATfMdZXOAbQq9j+JnNSVltFQLAk=
=/zNa
-----END PGP SIGNATURE-----

--btrg2f6ei6hzo3fh--
