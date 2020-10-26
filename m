Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0DE529931B
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 17:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786771AbgJZQ55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 12:57:57 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:43837 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1786749AbgJZQ5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 12:57:46 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 722705805DA;
        Mon, 26 Oct 2020 12:57:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 26 Oct 2020 12:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=R5DxJpEpfR/FW79xd59XCA8dEJT
        OWvdcJkuzuv1Y+Lo=; b=oPS/JxyZNriqi1c8Sf05/35fbdqIlBB2+FPamOVKJPK
        p1x97j3MTQ/AIm5e6noJUgWC8rNBfsD0HWDqTdNz1WoaR6vhJ6CFPQXMxXa1a5fQ
        PdYCFq5VqNa4tVNm0zMIp4pYT9I6XwmjiDhRDOwLk4xmuJaD8SCD+7JjSDELOkk0
        WZX3pdhLX+C4wZ/RqSyuJbPg451Z8WLr2V67I2vOIAi+1nCEuHyYlD89UGRullt9
        79uC/wA0AfKiQfyR36cuN/3WzToQkiD2+GYD0122pe0WZMQVkcFU6kXJaYPIEY5t
        HyW04HXXoSU+Xt4xAd2n03AyaNnLLuX7agP4uU8Fm1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=R5DxJp
        EpfR/FW79xd59XCA8dEJTOWvdcJkuzuv1Y+Lo=; b=LtW8O5nYQDn/QftakgDoy6
        T1uepHHybQ3S1azm4ffT315YUyZGcgJ7ADQVXluRgEwPMidbiSI3E0mIRS/BdS6s
        U1f5BICLLE7RAc1bM2BaXXMJJLkiaxjFREYm5ad2/R/OQgA8qFRgN3bzqLEC9PtF
        hCsfUdywcRLG+Bpx/SU6fhJqokYxFk/eBk4rZzvQWu/rUsllmvgon7odUqcfnfYx
        JlPXFaYeMtNsGDgJs/Pxghii4lwCKSyMYgWIUnyveOJdmu3+SgCQvOM01aUuWaQ3
        etBIkwMR4I8Cngy89I5HvEjOU4h6SaWcjTJImX5bsbT6rQ+6HlMEw5f8nMdKZIUQ
        ==
X-ME-Sender: <xms:CQCXX5LIcTHeiTSK2yjkNj-V_b4RrdcRgiKqi-0-UOst-XfzPVaNOQ>
    <xme:CQCXX1KuMxLUHAXvzgg2stZEh4UxCwP1dCYBtkkoJC-yCy6Rf3Lqam6PCxLjDRSpf
    kvAFlVSgMg--I5x7W4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CQCXXxs9l_WpAqziDzWTVFwjm3y1jlWO2qd7GrOnMJReI98XjbI7cA>
    <xmx:CQCXX6ayEnYqQ6PQ9O0_ndryjaAVvUovVr2TtSSHXgXYqN3IkHrgGg>
    <xmx:CQCXXwb5wvNPRZzQO0SBPiDEeq-dzT1ZsY1LKr0DlnhESSfZF3hBqw>
    <xmx:CQCXX9SQ4TwIth8QwPEBLkpDP4rNnGyAWnThQwe8WI8azr9j7AFJdA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id EF22D3064684;
        Mon, 26 Oct 2020 12:57:44 -0400 (EDT)
Date:   Mon, 26 Oct 2020 17:57:43 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: Re: [PATCH 14/14] media: sunxi: sun8i-a83t-mipi-csi2: Avoid using
 the (unsolicited) interrupt
Message-ID: <20201026165743.mhbt6tf27pf7pkuk@gilmour.lan>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-15-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xc2pnay3bnlgphdg"
Content-Disposition: inline
In-Reply-To: <20201023174546.504028-15-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xc2pnay3bnlgphdg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 07:45:46PM +0200, Paul Kocialkowski wrote:
> The A83T MIPI CSI-2 apparently produces interrupts regardless of the mask
> registers, for example when a transmission error occurs.
>=20
> This generates quite a flood when unsolicited interrupts are received on
> each received frame. As a result, disable the interrupt for now since
> we are not currently using it for error reporting.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

This should be merged into the driver patch

Maxime

--xc2pnay3bnlgphdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5cABwAKCRDj7w1vZxhR
xU+pAQDalV1qN1k6i35AidOm2HFNWPOBNI8mjj4eoTlsU/J3cgEAz+Q8O1TIRjWw
Rl9dTMXuupxebAMgby+v5I3QWitE8QI=
=23gw
-----END PGP SIGNATURE-----

--xc2pnay3bnlgphdg--
