Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7F52EF04E
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbhAHJ5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:57:47 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:37491 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728015AbhAHJ5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 04:57:46 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 33C6B5805ED;
        Fri,  8 Jan 2021 04:57:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Jan 2021 04:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=Gumn+UFcpMQd/G6u6D6jQGC0lUs
        rtxfZoAQ6q9w3wmE=; b=o0rxWON1XpD90My2sfmiBDlC+nbFl2csa6Dt+jaHUxs
        pWPIJeu5B5WlV4WyJobAzghwMqknvT/VoFKKsYq+MfADE4sW7f9wzuoBzeiJx7T8
        8UdxiY7L8aCazAND9d+Deozy+uFNkgY2JGs5zSwHV6wc+XvUF1m7ppztZofK1C91
        5q+p7mwvub4BEPqiIXoS7SA5eA6M1VXjOAMn/SlpWaUwwJz/oWIgLWlwlPV5Dpie
        2+HIM8grJDKEYmhugfJB6/IUe6cKEq5Fe8qYaiU2TZiCxh+1Pk2uwDXQWZ9X7EPV
        vocnX6f+lO+92bg3VIJ9LUDtHXyoNZSqVwpKMJL4yoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Gumn+U
        FcpMQd/G6u6D6jQGC0lUsrtxfZoAQ6q9w3wmE=; b=MDVf5D5fvjd0hKNvEud+L1
        0ughkqzcz+tA2C3Hp/cWW021wZ07dU9iNhZu+DOIPusdzhcCfz39PBPrif1km3W5
        z2+C1LnHfcc2f8lxWNlajWNvGZ9ndgI0oP+hNNED33NoKo8xESbUASCYfXKXBI9o
        h6BCwrZPupY4fsgqZOtERTRBlgtVwN6JH6ZfuCZZvamCt2muZCC75Bwf24OIMf6f
        X0R32ecVWxqWo3EZmo6grWITtDxp9p3u0Wdg/SnH0AWF0ygGSMwdHkEgfgs/EzuT
        nNWmQSN/iiH44SEoX7RqsueB6wiz8mY2XbEeqUnAMAuvKteEo/S0Ar7AsQneBvRQ
        ==
X-ME-Sender: <xms:ayz4X2QD9YO29o8AoZqONVQ3Bz3xfwkgJsDrL6_w2bmBO94ddi1aAg>
    <xme:ayz4X7xlhHBaeummXVxHg4t5tIUoVlQIFoeMOQ3ubAk2NkhyY54nPCisJd23khHwH
    7lqjKfu4XZ2sjJXClM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bCz4Xz2RdqT8EALSwqZtv5VP6hx616XmPq-OuOMWCLHUKM37YalLqw>
    <xmx:bCz4XyARGJxcv26hG72CNkqjKjK_yyShFkS9jJ062yBTrBsjdYm17A>
    <xmx:bCz4X_jOZds5PlkuJtMaiO-BHBUM-F3VWow8zODP52L_3_AgzMwlpg>
    <xmx:bCz4X6SfQzqFdFismthl1C3r6TnpwTO_zkPTwxKYxDmyWLPbp7yowg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 91AEE24005B;
        Fri,  8 Jan 2021 04:56:59 -0500 (EST)
Date:   Fri, 8 Jan 2021 10:56:58 +0100
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
        =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH v4 05/15] media: sun6i-csi: Only configure the interface
 data width for parallel
Message-ID: <20210108095658.krhbyunsgp2dfq2y@gilmour>
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
 <20201231142948.3241780-6-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rypyyqk74gxoh356"
Content-Disposition: inline
In-Reply-To: <20201231142948.3241780-6-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rypyyqk74gxoh356
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 31, 2020 at 03:29:38PM +0100, Paul Kocialkowski wrote:
> Bits related to the interface data width are only applicable to the
> parallel interface and are irrelevant when the CSI controller is taking
> input from the MIPI CSI-2 controller.
>=20
> In prevision of adding support for this case, set these bits
> conditionally so there is no ambiguity. The conditional block is
> moved around before the interlaced conditional block for nicer code
> symmetry (conditional blocks first) while at it.
>=20
> Co-developed-by: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>
> Signed-off-by: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--rypyyqk74gxoh356
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/gsagAKCRDj7w1vZxhR
xfL6AP9dn6HmLvnM/Ix3pQ5lhHB9Iwr84/STH1AatQ1xva4O1QEAxMbOf9LpNbRg
7Fo1+jpZm5YR5iuuhDorVRGP+IjvXgo=
=5hoq
-----END PGP SIGNATURE-----

--rypyyqk74gxoh356--
