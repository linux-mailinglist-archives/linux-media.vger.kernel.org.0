Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A312D9776
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437958AbgLNLf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 06:35:56 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:46749 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2438197AbgLNLfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:35:43 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 46A28580503;
        Mon, 14 Dec 2020 06:34:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 14 Dec 2020 06:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=HC54RztzNa/cUR9WRuFCupTCs1r
        TPzZoY9HGRsF4LiI=; b=rkERmi/aXqC6mQzJ61vf3C3Gi6JCObZe75f83T/WCmU
        aedCWfySN3evAloO4lsWRfTU6x2ZKTLDZpUXXodbgUyCYscu5LCQpBuJ6ZCdr/+O
        Yq+RskwpX34p+dMKshf2qu+WdPdjeVkUMmWWbDFLql7VOjI3kRcJ5f40P2aS+5bN
        FErOfZ0bb8klWGisErEe78bHsMbn+YQlOakRMaNUIEVtJ9JBYZjrxjX7BAeg2ExU
        cbwyaqCBF0tzBqiSRnPFbLZdLHGnyylDvxgCQMTif7KsabqBCP1J0LKHeDQ8mYf1
        m4EC9ho2+Ap5/VKxMPEhAm39B19gFK0ePP6J501EHSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HC54Rz
        tzNa/cUR9WRuFCupTCs1rTPzZoY9HGRsF4LiI=; b=Ky4mL77zz6E4sqY+AzhWRU
        AvjJ2uJdZ8O3SkPFPakiQajlS79CHgbkh7gxhEgFJz66I/AMrCiIqEjltO1EBrNV
        N5IeUy5MMSlhtJmmNWUesL1orqkxjgXj/fJYc69QmFSUWu8paUPHMkCxcOQtqN6V
        kpXGJUGqOS8UilntQ/4xansxMJ+b1b4xJpPkREv8r+pX4QFHSeUlr6cW2GKgpdkb
        Wq4Q9g5KH6/G5GQojaL7x3RXhfZNESRLZBfXmiI9xnMS1lZ3mIHVVRLMjv8fk8Ri
        xosJUpBj5W/9FzHmz3F7fa+krWBF8CThkO6irqw7tUAL1MmMjJAt/m7YvOeco9dA
        ==
X-ME-Sender: <xms:wk3XX30nB47orHKr2_L_Ww9cZ_UdQOjgAVROSpmEE6x7KZt9NPPPbQ>
    <xme:wk3XX2E6uPvG0LmZ917PpqR8-9So1L4BbZTMVrekBPm_0OT4iaj47qDQXlp8F-wiP
    2ggXM5A0m8MqpBOWw0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wk3XX35ZsJjqmuVmJ-LXfBkEDRwRaYCWcZe8XXUREfxDHCRWJy8seQ>
    <xmx:wk3XX826iHwWE7vLS2-RhLWbt0dp1F1E7I6jNut9WZSqmitooCgOjg>
    <xmx:wk3XX6F7SxWwjV-YcpHFsX7k1NURvP6_d32ntpAZ6HgXVMvbT3oNNg>
    <xmx:xE3XX-PXjHGA_t162XmWWhoc9J0Ll5i2BUkdRCwzS3Hy1XQp-_Pqlw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C30F1240057;
        Mon, 14 Dec 2020 06:34:25 -0500 (EST)
Date:   Mon, 14 Dec 2020 12:34:24 +0100
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
Subject: Re: [PATCH v3 07/15] media: sun6i-csi: Add support for MIPI CSI-2
 bridge input
Message-ID: <20201214113424.cx7ox6i5bm7lszhb@gilmour>
References: <20201211155708.154710-1-paul.kocialkowski@bootlin.com>
 <20201211155708.154710-8-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="q5rb2agebcwu6woe"
Content-Disposition: inline
In-Reply-To: <20201211155708.154710-8-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--q5rb2agebcwu6woe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 04:57:00PM +0100, Paul Kocialkowski wrote:
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
> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 123 ++++++++++++++----
>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |   3 -
>  .../platform/sunxi/sun6i-csi/sun6i_video.c    |  53 ++++----
>  .../platform/sunxi/sun6i-csi/sun6i_video.h    |   7 +-
>  4 files changed, 135 insertions(+), 51 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers=
/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index f1150de94e98..481181038e1e 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -52,15 +52,16 @@ bool sun6i_csi_is_format_supported(struct sun6i_csi *=
csi,
>  				   u32 pixformat, u32 mbus_code)
>  {
>  	struct sun6i_csi_dev *sdev =3D sun6i_csi_to_dev(csi);
> +	struct v4l2_fwnode_endpoint *endpoint =3D sdev->csi.video.source_endpoi=
nt;
> =20
>  	/*
>  	 * Some video receivers have the ability to be compatible with
>  	 * 8bit and 16bit bus width.
>  	 * Identify the media bus format from device tree.
>  	 */
> -	if ((sdev->csi.v4l2_ep.bus_type =3D=3D V4L2_MBUS_PARALLEL
> -	     || sdev->csi.v4l2_ep.bus_type =3D=3D V4L2_MBUS_BT656)
> -	     && sdev->csi.v4l2_ep.bus.parallel.bus_width =3D=3D 16) {
> +	if ((endpoint->bus_type =3D=3D V4L2_MBUS_PARALLEL
> +	     || endpoint->bus_type =3D=3D V4L2_MBUS_BT656)
> +	     && endpoint->bus.parallel.bus_width =3D=3D 16) {

The operators should be at the end of the previous line, not at the beginni=
ng

Maxime

--q5rb2agebcwu6woe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9dNwAAKCRDj7w1vZxhR
xU1FAQCe7tGabmV5/A5Z5LxuElH4dianoBeoE4wLIaT/n63r+AD+IT8rCnQclTCB
sMoAwM/wMKeqVEflw4FhFI2POaza5QQ=
=gZ/r
-----END PGP SIGNATURE-----

--q5rb2agebcwu6woe--
