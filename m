Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AEE408649
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 10:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237890AbhIMIS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 04:18:29 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:59111 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237874AbhIMIS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 04:18:27 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9631F580B75;
        Mon, 13 Sep 2021 04:17:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 13 Sep 2021 04:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=LfsxPMaIAkjFAolr1YO0jdkBTkA
        SxQKSZB3Inh4PV88=; b=Iw769SMlc9Hc8sWUZevD469xuhrgj74nKPZttihMbEE
        DWemQ6Sl61z/n/MkQc0cyP5Vug1e+vdTkMtqM5L+M7wrgFLG34LHldBknuiRsvUo
        edjf++/223EowstTkqYw4YcVxNog99wYqkJ8iY721wWpyRyrB78BFaulrYvSrAv4
        zaKaGlRcDUSRx4MABs88OB2n+lDoG+DY/93QA69KG05W033W9hBK15IjSeU362pl
        TWd+XdGDlBQuwqCAJU90SWJFtdcpnTzL5eDPkaDaKPHP9t95hsZsj52XJS7JPTkl
        rJ90FRv0sCFRrVJe1cddLFHtx2rFX4CJcExcPqt5IWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LfsxPM
        aIAkjFAolr1YO0jdkBTkASxQKSZB3Inh4PV88=; b=rmALdPeLVpMm48citIobyL
        GhLS5q1khENgaWJRSOCdlbf7H3sys/oIe+h7iQkgfC8nmzeXrXG+F+mtPelrYJ5C
        4xJyuVya+jeHrn/qNk8N9Zs8vs7Frd7DOLoLVODtPy78dLPxk5FxsTASxYXXBOBr
        WJhRG8eVoJSBtp+DIAoRasfgjVC4bP8cFmdq4M61zE3TyygNhAdBhFHzzerZV2hf
        rI9KoIb0AAyRJMGRBPZNf48kuV/4yScosDHQUpB5ZDjBo16Uj4RmyAipBFtC3GZN
        gjYagHNlU2BrRg4XcPobh2yy1YX6RQWDU9GFWbnMkWZAt+VTxTnX4LVXAxviuIqg
        ==
X-ME-Sender: <xms:Bgk_YZxEnE51tbpKR02-UxcV3nk9DSfqKmQKFNrzI8YRQFCOTknShg>
    <xme:Bgk_YZR6862h2-LcguWk5d269tvbhSf1PDKdj1xQH5-eBqAkE3yjO2D92x8LR3DyK
    hCnP8sIQLR4jpDQTPM>
X-ME-Received: <xmr:Bgk_YTWBnCCcCo06JmQaZYbv7_uj8FVafVbRIRoe12aMrJwhOP4aI6Kv4EJAVF9qOrPt_NvWQ56LTnQuE8s1P-oS4eYaM716EX91>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Bgk_YbgNeNbE305-RHthxhkztMo3uE0hjoXmUYAG5IgDDHoa3qroRw>
    <xmx:Bgk_YbDrVJ8JhP2UsMTMve9suyFU77vne8j2bBlbbeLdXD7xWdCfJQ>
    <xmx:Bgk_YUIWD4oc2vTdbLVzgxxdH1VOCo-RuybpFjH6ZhjRwEHnuCbw1g>
    <xmx:Bwk_YT69NjFV11iZiB_RLJOO932JsLg98NeC2fmzzM1W2Op9Kt55Nw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 04:17:09 -0400 (EDT)
Date:   Mon, 13 Sep 2021 10:17:07 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 15/22] media: sunxi: Remove the sun6i-csi driver
 implementation
Message-ID: <20210913081707.3pjcfuwan46pbdep@gilmour>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-16-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qx7qqsz6t7rnfx4y"
Content-Disposition: inline
In-Reply-To: <20210910184147.336618-16-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--qx7qqsz6t7rnfx4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 08:41:40PM +0200, Paul Kocialkowski wrote:
> As described in the commit adding support for the new sun6i-csi driver,
> a complete rewrite was necessary to support the Allwinner A31 ISP as
> well as fix a number of issues with the current implementation.
>=20
> Farewell and thanks for all the pixels!
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

For completeness, this is what the other commit log mentions:

> While adapting the sun6i-csi driver for MIPI CSI-2 support was
> possible, it became clear that adding support for the ISP required
> very heavy changes to the driver which were quite hard to break down
> into a series of subsequent changes.

> The first major difficulty comes from the lack of v4l2 subdev that
> acts a bridge, separate from the video node representing the DMA
> engine. To support the ISP, only parts of the hardware must be
> configured (excluding aspects related to the DMA output), which made
> the separation a hard requirement.

> Another significant difficulty was the specific dance that is required
> to have both the ISP and CSI device be part of the same media device.
> Because the ISP and CSI are two different hardware blocks, they have
> two distinct drivers that will each try to register their own v4l2
> and media devices, resulting in two distinct pipelines. When the ISP
> is in use, we actually want the CSI driver to register with the ISP's
> v4l2 and media devices while keeping the ability to register its own
> when the ISP is not in use. This is done by:
> 1. Having the CSI driver check whether the ISP is available, using
>    sun6i_csi_isp_detect();
> 2. If not, it can register when its own async subdevs are ready, using
>    sun6i_csi_v4l2_complete();
> 3. If so, it will register its bridge as an async subdev which will
>    be picked-up by the ISP driver (from the fwnode graph link);
> 4. When the subdev becomes bound to the ISP's v4l2 device, we can
>    then access that device (and the associated media device) to
>    complete registration of the capture video node, using
>    sun6i_csi_isp_complete();
> Besides the logic rework, other issues were identified and resolved:
> - The sync mechanism for buffer flipping was based on the frame done
>   interrupt, which is too late (next frame is already being processed).
>   This lead to requiring 3 buffers to start and writing two addresses
>   when starting. Using vsync as a sync point seems to be the correct
>   approach and allows using only two buffers without tearing;
> - Using devm_regmap_init_mmio_clk was incorrect since the reset also
>   comes into play;
> - Some register definitions were inverted compared to their actual
>   effect (which was inherited from the Allwinner documentation and
>   code): comments were added where relevant;
> - The deprecated v4l2_async_notifier_parse_fwnode_endpoints() helper
>   is no longer used by the driver;

With that being said, NAK.

Having heavy changes to a driver is completely fine, and is kind of
expected really with such a big change. Breaking all possibility of
bisection and throwing away years of stabilization and maintenance
isn't.

And all those small bug fixes you mention at the end are just that:
small bug fixes that can be done on the current driver just fine too.

Maxime

--qx7qqsz6t7rnfx4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYT8JAwAKCRDj7w1vZxhR
xW80AQCzT1oqLXHmMJV4J378rDLxly3+QLuNLMF+HS7LpVSZ5AEAxuTn0WIx3q7k
rXKUJwy3GnQot8aoogsuY7kqOfSWQQk=
=Gphx
-----END PGP SIGNATURE-----

--qx7qqsz6t7rnfx4y--
