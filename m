Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF222EF044
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbhAHJ5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:57:25 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:38971 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727898AbhAHJ5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 04:57:24 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 62B455805B5;
        Fri,  8 Jan 2021 04:56:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Jan 2021 04:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=nhNnfGpgrsijY/Ccu+y8p0GNRzv
        B/ZDbp2P5o/E9YYI=; b=mCu2BkvuJ60N05UHH3NFsoh91nOK914AIlpEVkz6P7N
        Tv3MtQExaE4iycqINncj+4/U8eo/flDASas8AGjU3HR1NP6almnLr2wwTLjQYoxJ
        sHUvgBhFkQ8+KfjlTfYaSAFVrvjMn5qgAUL+RuGQ3JGo7Zyv9GnA1Er0qgLKwdnw
        T8Wag3E81PpRErhMagM0hUmwDK0UEl9sSBippaadqvIRW82EoaDT0BBPwXP3aKaC
        sm0mzPadNHg4gd4Qmo2xznsyx9p0L7nBLXHNnBzlfMPj9p4copwQYp0TkIVYjUxo
        S5LyJVPlkyNe50WyY1DcsfuW2pvsmu8ZouUr0L9X6Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nhNnfG
        pgrsijY/Ccu+y8p0GNRzvB/ZDbp2P5o/E9YYI=; b=FypFiIH8/HMzVMOKvJ6cNK
        03GOdjTrcdipr8QmsLbs0koleqvV58rkjUdjfSBuvYUjoRzS8xrsocCOtDqCeBas
        FkFat+dPalXcssOOA3Lq83HYFi/Una2HebqQ3lEkZu7e6+X82S11YL33v3Md0gQ9
        y7sOQ7rHwop6/wg9F3c6tXMDiWaOQzYnEQl1dmNfOcANWy+K/iMLy0dPHhU5HFzt
        54zP2ZMuosr2kQap6tvAFyF45v4GqzIKh8MgnIi+zw4P5NTE7Ln773mPpWYWYnqO
        VpYHFBZ3dWGSW907UWLiPbROS2ZEocGDRNCJK1+EJTVTufHMrZygJGvU7NU35hmg
        ==
X-ME-Sender: <xms:Qiz4XzVXczHUGtWkxxUSpJzht1sSKgO83Nh_91PmIihTPVFQ40Lz2w>
    <xme:Qiz4X7nbR1FJUS_T7zjlxjIHBowTLFMmj9UhxJF164sAr4jFYWCiXNrnq6RCkH8fX
    3zOU92jbFjWpjczlaY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Qiz4X_Yb7R6wfHUdYRv9VVqWql5ANEVGFiTs_nLEc7cmdA_hQpjTMg>
    <xmx:Qiz4X-VXv5EAm95r6c89-UjXxsgKv0BJPm1SYqLyPmqBu7nK7lYroQ>
    <xmx:Qiz4X9nuz9AeEAO4hz3TNMTqsl9s6npywTQeCmkm3V6iNHH0UYi--g>
    <xmx:Qiz4X3v_yzueyTaMUQG_WvCF8OKC4oqeZ96GeaNdkgKUjNtnU4s0xw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C7057240057;
        Fri,  8 Jan 2021 04:56:17 -0500 (EST)
Date:   Fri, 8 Jan 2021 10:56:16 +0100
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
Subject: Re: [PATCH v4 13/15] media: sunxi: Add support for the A83T MIPI
 CSI-2 controller
Message-ID: <20210108095616.fy5oaslwnyumv3if@gilmour>
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
 <20201231142948.3241780-14-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tc6l3ymxpbqq47df"
Content-Disposition: inline
In-Reply-To: <20201231142948.3241780-14-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--tc6l3ymxpbqq47df
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 31, 2020 at 03:29:46PM +0100, Paul Kocialkowski wrote:
> The A83T supports MIPI CSI-2 with a composite controller, covering
> both the protocol logic and the D-PHY implementation. This controller
> seems to be found on the A83T only and probably was abandoned since.
>=20
> This implementation splits the protocol and D-PHY registers and
> uses the PHY framework internally. The D-PHY is not registered as a
> standalone PHY driver since it cannot be used with any other
> controller.
>=20
> There are a few notable points about the controller:
> - The initialisation sequence involes writing specific magic init
>   values that do not seem to make any particular sense given the
>   concerned register fields;
> - Interrupts appear to be hitting regardless of the interrupt mask
>   registers, which can cause a serious flood when transmission errors
>   occur.
>=20
> Only 8-bit and 10-bit Bayer formats are currently supported.
> While up to 4 internal channels to the CSI controller exist, only one
> is currently supported by this implementation.
>=20
> This work is based on the first version of the driver submitted by
> K=E9vin L'h=F4pital, which was adapted to mainline from the Allwinner BSP.
> This version integrates MIPI CSI-2 support as a standalone V4L2 subdev
> instead of merging it in the sun6i-csi driver.
>=20
> It was tested on a Banana Pi M3 board with an OV8865 sensor in a 4-lane
> configuration.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

There's a couple of checkpatch --strict warnings here as well

Once fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--tc6l3ymxpbqq47df
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/gsQAAKCRDj7w1vZxhR
xa6vAQDzxq7wGkrr8cxK3zTV9vzdO+lsvVdg8AtqesAmrp2IVAD+JY8cLaoGu8C1
tfK38n0rbE9wxRSIDnEtIQ3OENiefwk=
=GD9h
-----END PGP SIGNATURE-----

--tc6l3ymxpbqq47df--
