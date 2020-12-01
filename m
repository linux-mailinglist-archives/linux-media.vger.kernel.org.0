Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E362CA01B
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 11:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730162AbgLAKke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 05:40:34 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:42955 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726826AbgLAKkd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 05:40:33 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1CF73580621;
        Tue,  1 Dec 2020 05:39:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 01 Dec 2020 05:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=mNpYyfmOtgskFUN5EMvALnOTS4j
        UKSGA8Yuv/4b6WkQ=; b=tnOtDlIrd4BNIqDjty2uqhJX+4DveCwYhCJby0gO9hX
        eCZe8NUzDHsKgJK/qm7dRrD0FTQt0YzihXUiF8EqRGkOLLnkb9LEc8huSWlOa+nM
        v8jPe9iLVlgrJdNs0GCyjWEv5Mb5vWFX1TS9t39trq4RmGFVNkUgLvFpkDu4HUEn
        EZ+bPBedpleV6fIf7n/5/+I46TwCVm+LOkesrEcvec/0kOHd4GpxuI+esqG58duz
        wMOIjj2jirDjOrZ1RA1nGqCX+mAxjco7Fp7u16mS7/8eC38/j8fnmNyz+1hfheBq
        4M8n9Y4H3Ds+TpOO0uz5vozrE8d6eB55Sebq3BcBSYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mNpYyf
        mOtgskFUN5EMvALnOTS4jUKSGA8Yuv/4b6WkQ=; b=Ti6zHCPF07x+5CB6vDoAQ3
        K7P0W1OZbp05uPdqJ8J4s5/llTyDNIDafoi4XwAsQHzuhgrGoRz9mWo0EMy7WdAd
        WvA+NFFZ1Sm+BWHbHDxiTbgYs8EAs7VX5jCZNTiEqpBbW+8kSbo4jDIkG88F6EO2
        o+i3FDyZYHo+m0HJPunosHGT1hpyZs4DYSqTJznumBv5oigV8uJBypP4kv4o4WPW
        2GYXPBM1IBhtTsHeRoxXUGRApG+7lafBvZgLzDqjefIIFRBezwG8MvQiCmeKJ16F
        InuetreDcweIV6s0kKNlaqGN8zVVYm3/Qa+YnVE8/PIhQvOFAO6irN435i1Tw4WQ
        ==
X-ME-Sender: <xms:ch3GXzYK_xD4KCukpJOOAtq3mhiKiICt-vld6f1xFGieJhURMl0FxA>
    <xme:ch3GXyb5geXtf893lj37YrY1kkNONYJ-ifjDIemN9-Vg8Hnsm4cAmJ065-DDi55eo
    XIqEMpUNb_yHhGj1OM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ch3GX1-Rlxh1p7WlPEUGmwrmA5FFmy54drZ03fd3BdvF8rVi_edCVw>
    <xmx:ch3GX5qrm0_Aa0aTGqMkdYAJuyLKJKoAyCGF93d0N_VZAjOh6rg7GQ>
    <xmx:ch3GX-owsLsxWLBIA7HVucXeqbYX30gzVxevef6bNSLnmVTH2nyiSw>
    <xmx:cx3GX2DIR20KNnTZ9nZfzeVdoKNKvwJl8DC0kK_oNAwrcswB-pN2xQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5543F3280067;
        Tue,  1 Dec 2020 05:39:46 -0500 (EST)
Date:   Tue, 1 Dec 2020 11:39:45 +0100
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
Subject: Re: [PATCH v2 04/19] media: sun6i-csi: Use common V4L2 format info
 for storage bpp
Message-ID: <20201201103945.3wqzmcm3htamfwld@gilmour>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-5-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ylwcdbn4m4aso46x"
Content-Disposition: inline
In-Reply-To: <20201128142839.517949-5-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ylwcdbn4m4aso46x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2020 at 03:28:24PM +0100, Paul Kocialkowski wrote:
> V4L2 has a common helper which can be used for calculating the number
> of stored bits per pixels of a given (stored) image format.
>=20
> Use the helper-returned structure instead of our own switch/case list.
> Note that a few formats are not in that list so we keep them as
> special cases.
>=20
> The custom switch/case was also wrong concerning 10/12-bit Bayer
> formats, which are aligned to 16 bits in memory. Using the common
> helper fixes it.
>=20
> Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ylwcdbn4m4aso46x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8YdcQAKCRDj7w1vZxhR
xcLgAP0TaONkl3ohyt3psmWP+fQcUXRtgDol6+pxPgE1Wlf/KAEAg3ZrGC+8W6f7
fRggrAiQbjn/SbQAq0gvY+CQIVI/7Qc=
=rmPW
-----END PGP SIGNATURE-----

--ylwcdbn4m4aso46x--
