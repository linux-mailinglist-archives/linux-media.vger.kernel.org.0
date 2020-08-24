Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B322519BC
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 15:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgHYNf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 09:35:59 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:46893 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725926AbgHYNfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 09:35:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 05F3758043B;
        Tue, 25 Aug 2020 09:35:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=o3DM9q4xD3PlbYRAzhhVCYF3CET
        415QdokoMlj6SX04=; b=BChT55kFwSw7j8+CIiHPkKM9sRAi+fc6+qsXnTuQnlJ
        kshksFW+GAAby5xApz6/s8d4qWwkAU1HoEKvej29hmu3P3XNH9LNmBUnswpr6giG
        IUFvoB7SWDiJXYw4Z+tjuLHD6ozmF0pWwXkV4MnyypEDGLylGsC88vdjjSz0l29d
        rzaOpFsHeVHCDDfVqylJI/gynC01t2PVRNOdBa6BeupD8hm150mwja48LsuTlyCg
        DDh5eFhFRPw2Kw0B0FGyKtXFGqDCPW6U/+Alb3fL7+Ev+3B5sb5YThNEn+S4MS3G
        JEFMYmUmoAnyRtxvuIv36JqdiqR+2UA1+6DBWZZ/EhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=o3DM9q
        4xD3PlbYRAzhhVCYF3CET415QdokoMlj6SX04=; b=st6JUplM5OW35O2QwSHbPq
        jdwJ8L+dwm2FDSRdFOllNt4+1jzxWSX5Ts6jMhtrUYAFJPKZKTb0PgLqR6FirkE7
        D8R8c5iq6UO1UkQrH92+t7n5O0Seku0IaXLMJXJ6wmnQFxzxbY/83C0Dxeoj/JRn
        klbY8OswO7WmC2AQWm8tiYzEC8eJtDKM3mGvbbL89cPJiDko5LLNFsl+KkyRk69h
        zF3M+zL22cEsJ8qJReNhPrSEeB4VUQ8tfW3pfpOcErsqq4jaS0WBD75C9a4ofP5V
        CXG321p/ryiEkVPZOZf/8KmOC+vos4krZfApa2qVDrOSDWG9RYpR/fCm2rV8ELvQ
        ==
X-ME-Sender: <xms:uBNFX5lLYUUEjymn748AxUjjTsY1dxK14zLdUAvzP3GpzYvhdkgHPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepieelhfeihedvvdevfefhffettefhledufeevffffleegfedtueehveegtefg
    teeunecuffhomhgrihhnpehtgihtrdhfrhgvvgenucfkphepledtrdekledrieekrdejie
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgig
    ihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uBNFX03CWptI3sDoAEzA0DZYahf2n-Koif-idSUBt707w4sY5YaYHw>
    <xmx:uBNFX_pAkoxUDQAjF6g6NKEVbnwZ0nYL_Mt1LMgXYh3hbVV9X0TUrg>
    <xmx:uBNFX5myATgrKHEYy88JTlZiONOK5qE5S0nPESFmmkXfXGWGMOb5Xw>
    <xmx:uRNFX5yrPKaUDdx4FVY-BUB9M2fNVL48NE0PwnRQXM32poU2vlUMqw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 936D0306005F;
        Tue, 25 Aug 2020 09:35:52 -0400 (EDT)
Date:   Mon, 24 Aug 2020 18:59:10 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/7] dt-bindings: media: i2c: Add documentation for ov8865
Message-ID: <20200824165910.tnsalyxfuimfx5rd@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
 <20200821145935.20346-3-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xtnfj6i3cfctyq4u"
Content-Disposition: inline
In-Reply-To: <20200821145935.20346-3-kevin.lhopital@bootlin.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xtnfj6i3cfctyq4u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 21, 2020 at 04:59:30PM +0200, K=E9vin L'h=F4pital wrote:
> Add a documentation for the sensor ov8865 from Omnivision.
>=20
> Signed-off-by: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>

In order to ease the submission of both drivers, you should probably
split this series into two, one with the MIPI-CSI driver, and one with
the ov8865 driver.

> ---
>  .../devicetree/bindings/media/i2c/ov8865.txt  | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8865.txt
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8865.txt b/Doc=
umentation/devicetree/bindings/media/i2c/ov8865.txt
> new file mode 100644
> index 000000000000..ac5a662288de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8865.txt
> @@ -0,0 +1,51 @@
> +* Omnivision OV8865 MIPI CSI-2
> +
> +Required Properties:
> +- compatible: should be "ovti,ov8865"
> +- clocks: reference to the xclk input clock.
> +- clock-names: should be "xclk".
> +- DOVDD-supply: Digital I/O voltage supply, 2.8 volts
> +- AVDD-supply: Analog voltage supply, 2.8 volts
> +- AFVDD-supply: Analog voltage supply, 2.8 volts
> +- DVDD-supply: Digital core voltage supply, 1.2 volts
> +- reset-gpios: reference to the GPIO connected to the reset pin.
> +	       This is an active low signal to the OV8865.
> +- powerdown-gpios: reference to the GPIO connected to the powerdown pin.
> +		   This is an active low signal to the OV8865.
> +- rotation: as defined in
> +	    Documentation/devicetree/bindings/media/video-interfaces.txt,
> +	    valid values are 0 (sensor mounted upright) and 180 (sensor
> +	    mounted upside down).
> +- remote-endpoint: a phandle to the bus receiver's endpoint node.
> +- clock-lanes: should be set to <0> (clock lane on hardware lane 0).
> +- data-lanes: should be set to <4> (four CSI-2 lanes supported).
> +
> +The device node must contain one 'port' child node for its digital outpu=
t video
> +port, in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.

Free form DT documentation is deprecated nowadays, you should be doing a
YAML schema instead (like the ov8856 driver).

Maxime

--xtnfj6i3cfctyq4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0Px3gAKCRDj7w1vZxhR
xVh1AQCXN4oPv9EvypG1mqiavakQAN3yVKv1Bxmf8WFmqxncTgD+LX/4kcbBu+/e
lzYGE1BdHmnYoYTM2IVwfxRIqJryjQM=
=L8ao
-----END PGP SIGNATURE-----

--xtnfj6i3cfctyq4u--
