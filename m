Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB232958AF
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 08:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504684AbgJVG4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 02:56:51 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47123 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2504609AbgJVG4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 02:56:50 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id EF65F5C00CB;
        Thu, 22 Oct 2020 02:56:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 22 Oct 2020 02:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=PNqJSiLFvYPB2J9r+0yH7DHREwS
        OjzwcypCGVmkzdqI=; b=mPKVnE1aQzXYRWl+CVqd+opRTlc/eQhSv+M4rnoX2g7
        XjpzlsEHZlz2PYXnjjtmj4jYoB1l+BL2iyK8iADEXasN4QQ1UicT5uU5OYh2jcS2
        OwzDXBcxAifPWAQ8Is/ScBJ4JEZ1x+4nGU3z/skJkPHHdK91pLV5l31S/dWUvOjf
        FNRa8yolLFuDyJNKLdsY8yZY7EUkiDFwVlzZ9paE1IiBuFqtx8chN9uGZa4GZZMk
        2pbuJRdhXGndVLCB6JUwhzeXFVjIvyfvhEU1IdJK+Pk79kq/FbGL33T8N8LEXoiY
        P/FcD2vlC28NRV7CGAtq5809O+9sbgWzXFtvc6+v6oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PNqJSi
        LFvYPB2J9r+0yH7DHREwSOjzwcypCGVmkzdqI=; b=HrnE3W9OG76YL5alhpMBHf
        kWsmR9zC1WNQDYlrCJYI4xA1uCkleZs7ry9RpFS2bSn/C+4K1V5gTKYu/4Or2C3M
        kVlx4zbnrLNGWajAmwgI2D1XTarn1+5rfIAFOBSUtlS5+QK4xjU22H4eoZDHqp5Q
        uLNuR+OY5gY0/1Xk9+B0aSMprxG8EKTsla8ZEb4P1X3/b+YkAVkHBG41h5cZt2dY
        1PNEb79JowcRYMVC6JFlucV+wbrLw0EJMg8gw4XrtSSat4StegL17u1l6aX7p8Rj
        xJfHqIgvweXLkAydYMHR+n/wjeaYvrR0qxDOaWY3tetFr8+rYkePrt9wlrwfuOsA
        ==
X-ME-Sender: <xms:Ly2RX8lTT687s_8p7TFbRliFXqj1bzyWQxiIbwh6o4bdKuYyvBI6CQ>
    <xme:Ly2RX71eT718tye3QV2WdwF7EgVanDyTsK16adUxs-FwFxnnXIL56A6ou5mupfUP8
    XbNPXwWtZAn30J2_7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeigdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ly2RX6p8hR0lmuaFBQCs5pHCnZx04FT3VjnAW8tq7RjcXvOTdL-joQ>
    <xmx:Ly2RX4k8ch1Da2XdVyHv0uC8iBbN_-mrri0XEBAK1E1dbJNyY10M9Q>
    <xmx:Ly2RX62glgQ6BAs4MkoBJ0B_rOUdkoYCA9FFj1MDCr8Kz3uDQoi6tw>
    <xmx:MC2RXzkS8m9Y3gGLIn1_px4xeFlRs2qHdAkRzRDAxJErWhPfumslTQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8137C328005D;
        Thu, 22 Oct 2020 02:56:47 -0400 (EDT)
Date:   Thu, 22 Oct 2020 08:56:45 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     paul.kocialkowski@bootlin.com, mchehab@kernel.org, wens@csie.org,
        ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: h264: Fix check for presence of scaling
 matrix
Message-ID: <20201022065645.qlveci5f3nywxha7@gilmour.lan>
References: <20201021203325.543189-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5mrqutjgwcuzyi5g"
Content-Disposition: inline
In-Reply-To: <20201021203325.543189-1-jernej.skrabec@siol.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--5mrqutjgwcuzyi5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 10:33:25PM +0200, Jernej Skrabec wrote:
> If scaling matrix control is present, VPU should not use default matrix.
> Fix that.
>=20
> Fixes: b3a23db0e2f8 ("media: cedrus: Use H264_SCALING_MATRIX only when re=
quired")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--5mrqutjgwcuzyi5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5EtLQAKCRDj7w1vZxhR
xccJAQCC3HCMwcTjw8ZfEDoRQ5Uqjqs8jc4UM2rG8IqFxxZ4FwEAtKqu+HD414Eh
2lB5Qp9uLH6IGrGdDlU4Z6Z14gjTUwE=
=vcWn
-----END PGP SIGNATURE-----

--5mrqutjgwcuzyi5g--
