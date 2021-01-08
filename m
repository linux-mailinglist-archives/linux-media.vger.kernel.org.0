Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD672EF025
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbhAHJxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:53:32 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:37439 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728174AbhAHJxb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 04:53:31 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5AC1358041D;
        Fri,  8 Jan 2021 04:52:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 08 Jan 2021 04:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=TKBkA03lRN84ad9o+as6yIqJAef
        QnnerZu10YLu1NjI=; b=m+pxzedo2S2L716UHZ4j9iCb1c5FDm8UGCb2vef3hdV
        ew3LWXiBjWiNt2+dbzspyyriTBT+K+LRmyDJGkK2hnFTcGruOy60aHVNeHPCxPki
        Td0Gr1Y958Oh7o+g5Vu7Vh8lhr4qnCj6Wh66EhCWqn/0236sU4oLnEGWDUJt+cpU
        iZO2r52XCPmI24HJFrfFHLqjmoArrG1uGTgE4xY9NgMIPYLVqvUaojw2XE+Tud4o
        xsrhpVkqo5tOsoChAu+L6yfEfhGL3SS2OMdFUJp6LA5eoi6x8FselVmijYkZ+/Tb
        9JR30bMfZyfpldrTEiXvjdWmCE+UNAtL+0undFw8T1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TKBkA0
        3lRN84ad9o+as6yIqJAefQnnerZu10YLu1NjI=; b=heq/+AQIBLXcDsCkZx5zff
        0hnm1PMvajE6l7mt4Z47GwPSsqpB8ggnwNuPHvywBvf7WKb1hwrg22hIeUUhM197
        LeSfIx7DwsJTt7l55Upr/WG4hk6D/y7wvjN55E8a/dJD3KYfpMlMFoL9k4fMbzMn
        OPvOGhhV+YH9wG6uuaGG8iGPwspLrtP81OMqo/05GAhurx9z46gfAqmPpTEAu8mC
        Iowc/0aEvMifC5po2jAxkUBI8yIrMSnT3tXH0MRT9csPaZ7HAzy5QDi0AJZqOex6
        lSNAPBegVc4SLw+cst+IrPfu20zBZLW3DtVd8Y0J+PHc/LgXE33eBDstYsB6LJzQ
        ==
X-ME-Sender: <xms:Viv4X4h3I89EjG0iLlhFhjKy7kBSvhKHAcWPTNDQE2FdBNMnMrxiCQ>
    <xme:Viv4XxAx1Hhc-qM9_K10QSi-xxLfqEARjUUIUoUULrr9ick7ODGCTDR4IzZINCrq7
    KMrAuU80PnqyxNbRLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Viv4XwGcjShzK8QFNQjNxg2u94C5NgOVSatD_enozxkDpi6F0dGUiQ>
    <xmx:Viv4X5S-Q3KDoFbUdzfqhiaLW3J83aqDSpMuC37wqaN-O0b2tADPuw>
    <xmx:Viv4X1zhxMhL93apUjud3BPMxgahozIT220Q5vnhbFT2KHv12OOMsA>
    <xmx:WSv4X7q0iqtF9Qza53DGiFN9PqwltNx255OzBpeLEMfjlMqnI35eOg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 464A61080059;
        Fri,  8 Jan 2021 04:52:22 -0500 (EST)
Date:   Fri, 8 Jan 2021 10:52:21 +0100
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
Subject: Re: [PATCH v4 07/15] media: sun6i-csi: Add support for MIPI CSI-2
 bridge input
Message-ID: <20210108095221.squax52u2knxxgoy@gilmour>
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
 <20201231142948.3241780-8-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sapnhbeyia6qq3l7"
Content-Disposition: inline
In-Reply-To: <20201231142948.3241780-8-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sapnhbeyia6qq3l7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 31, 2020 at 03:29:40PM +0100, Paul Kocialkowski wrote:
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
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--sapnhbeyia6qq3l7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/grTwAKCRDj7w1vZxhR
xaWoAQDnF8B2JCSct0BxYeQua9xd5yH22K8Et3Stf1Z7l8QlcQD8C2QDOCFM5k6d
9v4VMq95E2L9I/j04U1xefNZHfVdkw8=
=yq67
-----END PGP SIGNATURE-----

--sapnhbeyia6qq3l7--
