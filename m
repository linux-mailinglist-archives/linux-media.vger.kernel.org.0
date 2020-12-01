Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0DF2CA260
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390184AbgLAMNc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:13:32 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:58343 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726840AbgLAMNc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 07:13:32 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 88F085801D5;
        Tue,  1 Dec 2020 07:12:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 01 Dec 2020 07:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=Z+nDVstGc5vXsyJReaUNqDRiJfZ
        TlfID4JCekxNseFc=; b=FbEw7Izv467DChudl8cMiKyc+ajYm31ye5emZJmiaju
        n+XrLVKRifgoE7bgSS3LIlgl5A2a2dS0aNGGlpxn6P1flHrDww902HyHqcFHucZ6
        bEU7/R1XS6/HSWNYzpPTN61Znx4stCAGoHLbuzZN2oNbQVke3eNvJQqTzSSSatEm
        BKEt8qjwZOfhYbe4fK2jR0lQ2GYkhktsEQ4mmIVch+eF3y8kjUNsEue5IDj6dTft
        hFZY3gzD+QqfYXWCUCMAXhND+ZmsCjvfLQ/1tVmK0De9O1XHF8Na2HAHy7TcOg6P
        rL4hKzSp75UxfiIoU3RxoNhUYbh0LMN76JwoNRuaehw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Z+nDVs
        tGc5vXsyJReaUNqDRiJfZTlfID4JCekxNseFc=; b=DE/axZFj8rFjb5yrWCxEKH
        /y+uE3qSJEr1G3BTtyAb1e2GbObJGW/wP8QNSn+rnY+hQeA2E/iL1c4UGhnW2iGX
        WB0Z8qIsQwbDSqSv0/+K0ctB0DXvneGGRt0xoN15lMb/T0Dcv0MDV4JVU5rvVC/A
        q3YoKUEsMc4tHxEzeF57unej6WUM3t/XH3w6d3MHIST1qi/CR9nz9i7NdAzj6+Ge
        5OwL6XNO1c0W05FXO+ab4fvzGii9GszsZiJxdj9G7wh9tf9cVkY/mK7tH1cRcPi8
        56Rq1QKvwJmy9yA+lIS5LlNb76OLWQYxcB6zLviu+WimbtUO03BCj1TBcOUQBlLQ
        ==
X-ME-Sender: <xms:OzPGX1R47F71h7TsBJ2PBxQusSDwIYIUWlI6nGQDacIe_DvmUp4IAg>
    <xme:OzPGX-zPMOzIWJQp6y0pf020o7AjfnT3jc3s91SZ__JsPsFDov6nI91GHB0xwMb-y
    c4QTD93cx7jXPn1fxM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OzPGX63nhrjICE6uf0UCjtNSz6K5yafk4NGcRBDsKnQTIjBH4WB0Ag>
    <xmx:OzPGX9B-9aPO4Q3QnsxJDURWxJz5yd8tvmas596onKmr4yFlfdgbfQ>
    <xmx:OzPGX-iieePNJmNhb-36u4AlzIBUG1xQVX9X471dwfSxfnjHDoViRQ>
    <xmx:PTPGXzYXyz5o6xrR8YnzHBapWQe6QuQg2LE0kDfgk_jOMIa94Z-PbA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E09C33280064;
        Tue,  1 Dec 2020 07:12:42 -0500 (EST)
Date:   Tue, 1 Dec 2020 13:12:41 +0100
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
Subject: Re: [PATCH v2 07/19] media: sun6i-csi: Add support for MIPI CSI-2
 bridge input
Message-ID: <20201201121241.cyafjhot45puusfc@gilmour>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-8-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n3hdtuwi2v3e62ny"
Content-Disposition: inline
In-Reply-To: <20201128142839.517949-8-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--n3hdtuwi2v3e62ny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 28, 2020 at 03:28:27PM +0100, Paul Kocialkowski wrote:
> The A31 CSI controller supports a MIPI CSI-2 bridge input, which has
> its own dedicated port in the fwnode graph.
>=20
> Support for this input is added with this change:
> - two pads are defined for the media entity instead of one
>   and only one needs to be connected at a time;
> - the pads currently match the fwnode graph representation;
> - links are created between our pads and the subdevs for each
>   interface and are no longer immutable so that userspace can select
>   which interface to use in case both are bound to a subdev;
> - fwnode endpoints are parsed and stored for each interface;
> - the active subdev (and fwnode endpoint) is retrieved when validating
>   the media link at stream on time and cleared at stream off;
> - an error is raised if both links are active at the same time;
> - the MIPI interface bit is set if the MIPI CSI-2 bridge endpoint is
>   active.
>=20
> In the future, the media entity representation might evolve to:
> - distinguish the internal parallel bridge and data formatter;
> - represent each of the 4 internal channels that can exist between
>   the parallel bridge (for BT656 time-multiplex) and MIPI CSI-2
>   (internal channels can be mapped to virtual channels);
> - connect the controller's output to the ISP instead of its
>   DMA engine.
>=20
> Finally note that the MIPI CSI-2 bridges should not be linked in
> the fwnode graph unless they have a sensor subdev attached.

I'll leave most of the review to Laurent and Sakari, but I'm not quite
sure what you meant in the last paragraph. Did you mean that the
MIPI-CSI controller in the Allwinner SoC should only be linked if it has
a sensor attached, or did you mean that any MIPI-CSI2 bridge cannot be
attached to the controller?

Also, having somewhere (like your cover letter) the media-ctl setup you
tested with would be great.

Maxime

--n3hdtuwi2v3e62ny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8YzOQAKCRDj7w1vZxhR
xe1pAQDJ4VWYPmX2sjefU+JMNUL5vx5k6ObBfcW4bEsF8eT67wEAzkFZu7gABP+M
zDT0Q5EbIbl1JDpuCyD6lxVTgkvvKgM=
=bri9
-----END PGP SIGNATURE-----

--n3hdtuwi2v3e62ny--
