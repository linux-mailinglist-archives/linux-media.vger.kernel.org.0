Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC202EF02D
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbhAHJyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:54:06 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:39521 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727827AbhAHJyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 04:54:05 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 51ACB58041E;
        Fri,  8 Jan 2021 04:52:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Jan 2021 04:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=C/EUhU+OduRp4VgFtO3uH13ycSS
        9LS8J19YLYD+BUAw=; b=XZNZ9Qk5K9D9G/EcpyOOUBAFREUoEsSkrIV7YFctsNk
        KXqtpuLEv+42SV3hOGuAmhNvJi5eCr1v9ZnPE6KV7IXISVhZhKyXSfUX4bmyhkQK
        Nj5xs6TS0ub/am7dIPVatXvfYl5nwDQhYw3vXxlftu+/6OeHj/stqgMsieo82J2U
        mcubdIUfePZJeI/XlsxMtbj87DEmsIGRhTupqZppFcUePB+CquSadzPK+2/c5eB6
        J+lHDPh7A5oTY2jndGelaswGtIfHKGKsR6che5EHJd0t1ppROyWyBulnQM2EQ6vf
        1o42PNuvGJ00CMFYV+QYdu5DBlpHxZhiaY4+89Nbp7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=C/EUhU
        +OduRp4VgFtO3uH13ycSS9LS8J19YLYD+BUAw=; b=EbFWcvoIFZPIwLPFWJqVhp
        MMT5nAL8Twuk5n19tNxyeftZTqHihZ4tIn7TPPGklHhf77+2sUv2No553qsaiYIh
        hTrG7qcEVmT/Y4M7GKSYMg6bxidefPo4qOKTW2R+ii7x5mDi+McoGdY+MPqCnz4R
        QRV3eASaB1kPn87TF/mLIan4wk/yF6yawVx/nObs7hhZ3iwP4nsZ0RTgbAHILDfQ
        MEUZfpBee/aMJA+yzi5wRk5jhRza3la+6vzt/8MhaiBzRdQwvlO7dOL59oJsmp/w
        H6Uy/tV+zeX+2NyybAv3EAHsIIgZTKUQtc5CWP20xJ7vjjD696KGv0lCUXITkXOw
        ==
X-ME-Sender: <xms:eyv4X-XfRvVK8urJk9ADSxMGMmjSDD0bxYo6smXVfn3FTHp0WyaOFQ>
    <xme:eyv4X6kuZ2HGKmWM6-e5Ob7u58Tjoafxtr76kpvGW2hU12d_wPvrLN0QuZux8iiXk
    Pv_qUVdoJPXn-c87i8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eyv4XyYMB7YZTCvLLHMpdQZD91IzbneA_zJIIEAt713X4bNVq6bf1w>
    <xmx:eyv4X1W81UHzRnVHzmHEHuyBGQMD9EwIY2hzaxooWpFtGQTF-0xQQw>
    <xmx:eyv4X4lS1Z98C0wcH9H-ui5Kt-ViS8oUiSQvCsM_UZ9SYcZPKZJlLw>
    <xmx:eyv4X-t0cQLiwfrQj8CxoLRugqilbyiKLWS1QmQffuxWFA8_mROfLg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B55D9240057;
        Fri,  8 Jan 2021 04:52:57 -0500 (EST)
Date:   Fri, 8 Jan 2021 10:52:56 +0100
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
Subject: Re: [PATCH v4 08/15] dt-bindings: media: Add A31 MIPI CSI-2 bindings
 documentation
Message-ID: <20210108095256.xfphiih5v2z4d2sa@gilmour>
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
 <20201231142948.3241780-9-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kroqwg5wkzimhqkm"
Content-Disposition: inline
In-Reply-To: <20201231142948.3241780-9-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--kroqwg5wkzimhqkm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 31, 2020 at 03:29:41PM +0100, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the A31 MIPI CSI-2
> controller.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--kroqwg5wkzimhqkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/greAAKCRDj7w1vZxhR
xXgEAPwMns+3sYP3np8VhHG2SJx17G0ypXQzfWimihw1hGQWaQEA0WUI9r8CFkT7
LecYyggmZ+Zr6fs+OF481T/xtAHvTAU=
=KV6o
-----END PGP SIGNATURE-----

--kroqwg5wkzimhqkm--
