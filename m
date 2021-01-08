Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B972EF031
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbhAHJz1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:55:27 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:58829 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727396AbhAHJz1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 04:55:27 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 00DCC58041E;
        Fri,  8 Jan 2021 04:54:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Jan 2021 04:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=qFTwwPWhKJO520sKUrFpnodDQuG
        Jut/CPBUcCAKJFcs=; b=mvZIxuMquZkzNjQBLGRcTx/llfQjqbhkwdMbeLi9IAt
        jaIqRPenLWuy/7K1YENeqxJDr2e9rEUW6dJ5LgM2DHIWwHViI9nV5V08Tvd5dzc6
        g1E7vxxHhGsBo7RnNoofY99QKRVDQ2GNMWZLTSrdJxGNdndAsdQNDTlc6bmxvArX
        l0QVezpufoRfph8UJzzdP3uuDfsh90jVJjBCCNHXp50cEwtigUnwKCQ5w7R/GuIT
        8Zz/bBiQwqBeStwv5Bt6QfEpxIhqqzkSI0XFhQJW6To/nODR19TICXrbxTyxRSrV
        WseESjK98MIYt1IbkM3TZuLo1Hs4Yqv4/yRXff/J5Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qFTwwP
        WhKJO520sKUrFpnodDQuGJut/CPBUcCAKJFcs=; b=M0H1o7A21x102lSCFpSNf5
        wgLOCHZtZCMzWZzLasX6GXqlMIUEagnKWmEYfGgALAILX2UWCAJ00+mFS49S1mXn
        9aXcL43mcn92lISvZrDPkDNtQix3jkUN+XXc3CY8aVO7ezNZi+V08CpGqCP+p/Lt
        97kfH2B9Hayk+1UduSWDn4CMjaXgleu6SRbH7a5NCbJqSLf06MpTRS2XG8lyCqP8
        AAAhh1dqNQYgU4WgXYtqyyN7crPmIYaBmP45IuKKKyqrZNBr5P1pxv4Dv1+4ksMR
        cQoQuY6+M9uge2kz0lwSgFL96X3jmEs8XA3ObFBmXd6fPkEH1/xAczoBV+FanPmg
        ==
X-ME-Sender: <xms:zCv4X5fpnpKuPqDPURwfO1xEPS4FIK6POhjefcQPttdIFLHttWOqkQ>
    <xme:zCv4X3M7scSBBdkicArYWHW0URm8rjX9xbz3YtDNCvGrbPV2nxo7UT4Utse1gFjSu
    pGcw9GGWNrmDD0mvw8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zCv4Xyj6Q3q891_P1j7zVR-d7YMJSaJmmjNvkljrLXKmezXP8nLMjg>
    <xmx:zCv4Xy_fdLPVICkT81--xoR9GBdph-ehHJ4KRcwMk-wTl2bItdaUsg>
    <xmx:zCv4X1sF3yY7ENGX9guWMlmWwRkoH8mZ_Dylw8kBuqIU19M1Ek22nA>
    <xmx:zCv4XyWjejkI8mqWuivjOvlf08XDfADC28MTYZpzjHRK_blj8Htmhg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1387624005A;
        Fri,  8 Jan 2021 04:54:20 -0500 (EST)
Date:   Fri, 8 Jan 2021 10:54:19 +0100
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
Subject: Re: [PATCH v4 09/15] media: sunxi: Add support for the A31 MIPI
 CSI-2 controller
Message-ID: <20210108095419.quegerk52wwhrxye@gilmour>
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
 <20201231142948.3241780-10-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cktvjn6jbtsbwfff"
Content-Disposition: inline
In-Reply-To: <20201231142948.3241780-10-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--cktvjn6jbtsbwfff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 31, 2020 at 03:29:42PM +0100, Paul Kocialkowski wrote:
> The A31 MIPI CSI-2 controller is a dedicated MIPI CSI-2 bridge
> found on Allwinner SoCs such as the A31 and V3/V3s.
>=20
> It is a standalone block, connected to the CSI controller on one side
> and to the MIPI D-PHY block on the other. It has a dedicated address
> space, interrupt line and clock.
>=20
> It is represented as a V4L2 subdev to the CSI controller and takes a
> MIPI CSI-2 sensor as its own subdev, all using the fwnode graph and
> media controller API.
>=20
> Only 8-bit and 10-bit Bayer formats are currently supported.
> While up to 4 internal channels to the CSI controller exist, only one
> is currently supported by this implementation.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

CHECK: Alignment should match open parenthesis :)

Once fixed,

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--cktvjn6jbtsbwfff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/grywAKCRDj7w1vZxhR
xRieAQDYlQLLBuqwVmiQqDlsFoQ09Uuh8jyFYXAmj8WIkfTjDAEAvjYZLZ9aOb5O
fPvRoec045mGvORmiFAoQaoCwtvbCAI=
=Ne1y
-----END PGP SIGNATURE-----

--cktvjn6jbtsbwfff--
