Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBBD12FAB7C
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 21:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388557AbhARKka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 05:40:30 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:52279 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388390AbhARJKq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 04:10:46 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 950255806CC;
        Mon, 18 Jan 2021 04:09:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 18 Jan 2021 04:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=R1pGfxcuJnekXAz99rc1GrqcVhx
        oC8FEezWd5X2V/wc=; b=HDdEhP7k0u7Kr0CuJmufFRjOKLQG+h1H/Oxx8zICiFS
        m3XhURRkqWYGyESLH2ioYAOjyidK9mbPo9vxY7C0+MqQoOBumn2f8hFEmvlwxyIi
        6H94opM/TGbkKAOuPqBeItwXPCx9tA9OsaE/DRoYGfvRicNtnYxIiCQWMT5O6rhc
        q4/A0F0FdsXmOl1yzTsXXhVT0aRhnLEq92qjjEB8Gf7vwW0Ap8ExnihYOfBtjpv7
        lWzlubCqjxfJTit+2kJzW2QU+SqfDT1YAjDK/eFAG+oQfKXM8pCaxAOrQ9QtmTmh
        z0+SbeeLZNIMrZaa43fROYR/b1S/y711D4yqoeSBuow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=R1pGfx
        cuJnekXAz99rc1GrqcVhxoC8FEezWd5X2V/wc=; b=Y91WYLV3bL70Fnuz0Lcrkg
        fUcr3CPJUuNQQ/73hpLWF8xSfCtd12pU18VAeCUi0aD4hwLgn+ArVdtxGUUhETa5
        4SUfET+eDvdHW6wFrmTiRuG/QwWPLGr+V7leHuH3dh2nwrseyF7hWiLnq9v/Fvod
        JA+6SwrFTbYIMpbclZGNGVb8o74k3EQ0IJV1rYimtsn6Rl45zHolhTW3yszwAM2P
        uQ67utqjjVGSYOkZE7MgPRAj7py4P3BI3L4UfnQ2sOkGXLvj5/iTD/1ZKDy+q9zU
        B0MEfpIVDBfk/tRr3GMVz33PTJpwmq5BUQoNdKM3Lbif0ycVaEPV/0Hehs8P80kw
        ==
X-ME-Sender: <xms:XFAFYDeeKHtqy-FMSF4DaQn8bORgh2zjymAkiiOB_CXhA5VWsV8FyA>
    <xme:XFAFYJPjGsMFddeIiiADXOVcfsrFS0vpvt-S4a31B31bWVoKp1AMPRF3nwqvnVevb
    vgv5qPWXBkctAotxRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhi
    phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnh
    epleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieehgedunecu
    kfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XFAFYMhPzXcPrv8lXJzVW7dXtPA-e7CpLVEca5UyRw3QpqGAst5QxA>
    <xmx:XFAFYE8UXLmhOM5_TUoJnDF_OcIwYiwGka2bKBlnybGgT4RFezqKEw>
    <xmx:XFAFYPtjix0-ov_riM1aMc3_eD9VgYUVFUUc6vy48MAi7vRg1-GQHQ>
    <xmx:YVAFYPcftKako6DbTRIDzIJlchl40QfeLNkJJ5sWyecWcUIioS8Odw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6A748240064;
        Mon, 18 Jan 2021 04:09:48 -0500 (EST)
Date:   Mon, 18 Jan 2021 10:09:46 +0100
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
        kevin.lhopital@hotmail.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v5 04/16] media: sun6i-csi: Stop using the deprecated
 fwnode endpoint parser
Message-ID: <20210118090946.vysdaribva7jl4xi@gilmour>
References: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
 <20210115200141.1397785-5-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="phzzxokt6uufvv73"
Content-Disposition: inline
In-Reply-To: <20210115200141.1397785-5-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--phzzxokt6uufvv73
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for working on this

On Fri, Jan 15, 2021 at 09:01:29PM +0100, Paul Kocialkowski wrote:
> The v4l2_async_notifier_parse_fwnode_endpoints helper is getting
> deprecated in favor of explicit parsing of the endpoints.
>=20
> Implement it instead of using this deprecated function.
>=20
> Since this was the last user of the helper, it should now be safe to
> remove.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--phzzxokt6uufvv73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAVQWgAKCRDj7w1vZxhR
xePXAQCUCBAhygtdMlfSOyDe9FrqYWFDVy55JekmXn69swyY2AEAgRYKfDHOvKjp
OK65VWBIaKANrwzOQ+puhKAQ4DMbLgs=
=WFFY
-----END PGP SIGNATURE-----

--phzzxokt6uufvv73--
