Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A312CA266
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgLAMPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:15:17 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41163 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726402AbgLAMPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 07:15:16 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7D978580276;
        Tue,  1 Dec 2020 07:14:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 01 Dec 2020 07:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=FWJ6r8bu2645L8TWRlDziIo194j
        DIIL0alIhwP56U1Q=; b=M4/33vwPcDg0HJuXUs3DjVRTtlJzyqEJlwdlb5oJtxi
        yKTBMoiDRsWRH3j7zw2SUHj9ILzhQEiZVnpdkfaQTI2sOZZdztMfSA1VvXu9kz1M
        Trgy6X2ZaSLaN77qljK/W1OaipXyx+16UJe+n3OCDNrIEHUW6F6uYXWNZzuIYCcY
        A1fYFjcPx9XmGD5Y3xpLz41j/PbAE78f01FLiShOy4NddqBxcg/otXIbgTrSXyc8
        VnJKkxQojImUlZW4Yzbu8Q1xmxjRN0KjR6jaHtJorYuDxFabJnAsuaNjsXXFmJd/
        5vfo/zellEjB8JWXi3ZoZKOjccWJn0zWCSefZJ6mpxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FWJ6r8
        bu2645L8TWRlDziIo194jDIIL0alIhwP56U1Q=; b=aerTnbcH4QgKXKTgs4AH+p
        6rD9tA21yX9BmGSCFYXQQoHcrHoZ7g8ukEjPMrxDsj8T1tPI2Le2g0pXufMg2sqn
        VrLmNw5J7wVzRurO5tdOrjaH8FLr54m2dnR2fY/alFyiGnMohlLs7sYzgcKUVAyo
        MmgI0IBsgMiX0uCFbvsUP1iUf6T4zUTomzhlSJHs7toCYusBzQaOSlJ7SQ1zEvN0
        g9HXpT9+VXOBiV/oYvDOU48Kg0dYQIh7g5C770zIDy67TNrAPAhuYwfbCwGmS5bp
        djfQFBhVLdcAcomsEbOZSdmlVjjR51JN0ZPzlXFiPWlj8ZXeZpT80Tdf39dhRxPQ
        ==
X-ME-Sender: <xms:jzPGXw6vILtJD0ZTkDKpNbIyoL4FHODL6oWlbCklTH-naim4XBIyWg>
    <xme:jzPGXx45D9dQcmaUnx53syvJFw3cZOiJUl5ADeY4UA9wvCgdbuq3XCrPBn7NDaHWy
    KATJPJHGeQCjB3bbm0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jzPGX_ed1OHCnjcfxSAK19CGxq8_1WYqrbJQZTp4pDi4jWttXI5xyQ>
    <xmx:jzPGX1KYCkQqtKrb8xAPQR0sDY_RWK9G_Thz7mPVAl5FGmpBqF_Ymw>
    <xmx:jzPGX0JLOEH9rvTIAqRW97pGEQuI9cH3ywfMaRszATgnmGIirc_OXg>
    <xmx:kjPGX5jVSlpHdNdh6S1qMi4tHMh32UqzJF2sXwSCDW14v2zM8fwO6A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3390F108005E;
        Tue,  1 Dec 2020 07:14:07 -0500 (EST)
Date:   Tue, 1 Dec 2020 13:14:05 +0100
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
Message-ID: <20201201121405.at4pwxon56ecwrx6@gilmour>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-10-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i5eeiwagdlccflgd"
Content-Disposition: inline
In-Reply-To: <20201128142839.517949-10-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--i5eeiwagdlccflgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2020 at 03:28:29PM +0100, Paul Kocialkowski wrote:
> Since the CSI controller binding is getting a bit more complex due
> to the addition of MIPI CSI-2 bridge support, make the ports node
> explicit with the parallel port.
>=20
> This way, it's clear that the controller only supports parallel
> interface input and there's no confusion about the port number.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi=
-h3-h5.dtsi
> index 9be13378d4df..02b698cace6a 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -803,6 +803,15 @@ csi: camera@1cb0000 {
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&csi_pins>;
>  			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				csi_in_parallel: port@0 {
> +					reg =3D <0>;
> +				};
> +			};
>  		};

This will create a DTC warning, since port@0 is the only node, and is
equivalent to port

Maxime

--i5eeiwagdlccflgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8YzjQAKCRDj7w1vZxhR
xb8LAP98Clpy8Ys5JzDcQGAEni7OQpAjddnj1b7f+SmvdPds1QEA+xysjKDrQb2o
S4hpeELnZEFr1ukuSG56EcXMo0FpAgI=
=jk4t
-----END PGP SIGNATURE-----

--i5eeiwagdlccflgd--
