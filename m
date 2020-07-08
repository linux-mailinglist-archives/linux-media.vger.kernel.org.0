Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3AF9218F34
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 19:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgGHRvA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 13:51:00 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33429 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725937AbgGHRvA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jul 2020 13:51:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 19E2CFE4;
        Wed,  8 Jul 2020 13:50:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=sW9qNXF/Wbt9ggnvbeJ0z8JAeAr
        7jzttPRNhTjMBYZk=; b=aH/TkJtfbVtx+tQjjWge5obdlvK0p9hJL3hj1+gQ3mr
        GGkvzH2Dsqw9DG1mQaN41LQMc7oWD+IwAsigzWLpRGNdvVsIzO5FyPfuhX3KE3MA
        ++zQI5CnVB5uSz5T9Wh26Td959pwJTHJId2vD0Y8X5Rx8Q+QFjkvwTUOnctCqRhO
        mRXYRlzkXFjwKg9VTD166MH9TRpnJQ4zHlR/jE2nCNY1g22oi/N/bpTrRo3uibZe
        xmmCmhEC2b2gmbGB+BWnE8Hzx5Mv67a0Vtlr67zIeirBsHsqmOFxCMU7jCFDyzhg
        +EPldf3NBQB4y4j2ystrMqkMIWa9Hw2n4YeYf85ILYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=sW9qNX
        F/Wbt9ggnvbeJ0z8JAeAr7jzttPRNhTjMBYZk=; b=K/dRfK3TCK1yVjBKbvOh2u
        yhUFxzRf4niS6LK2DJYEMJCneWPpUU6SOd93fQy5qWwLoJk6NBl+XYtzrHfqljuX
        wWMT7dwiHV6i1kl5W2+cY/BOALoUElzNx5RkpdIG7iGzsz6b0o8EI+AuA4wuF3Qv
        aGmhd6Uhuoq0nMGR24bd1GwBZJCSZNml4Aj6Ik6oUCAv7rgnRmY6i+kJ96Pu+K4v
        lEvJ4d7dLrNe/NwHAVPbeeXpGeMkLMFVQs2sTsnENTo5tW9c1J9ynQTak5A2qEqM
        Vkkbzpds9jSRJ3cH5kikp7b9//NvuPV6Xl5k5Oo3XgdxYAKDRT3PRG7eTasqmjYg
        ==
X-ME-Sender: <xms:ggcGX9V0PRm4DHZWnW0hlLzss7U8cLxrXNijbMzUFMz1nmMMFENmdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ggcGX9k4dKi853A739-0zF1_gj9mP1plZAxqmhqi4_sLf4MLCKdylw>
    <xmx:ggcGX5aC-7Gx67plLgdO9Kt6ovDPzr8vlTqVHeak1hiiI3XdOD-ywg>
    <xmx:ggcGXwXKlHrCfCufqAclq7lRgLQVi67CY9kBW95W3rVR1dNbRrYuwQ>
    <xmx:ggcGXzzFlSZiVUYZjUUT4ZxooFr92HzVBaqIzah3ovSsN79E5EVmNw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 348063280065;
        Wed,  8 Jul 2020 13:50:58 -0400 (EDT)
Date:   Wed, 8 Jul 2020 19:50:56 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] sun4i-csi: call _vb2_fop_release instead of
 v4l2_fh_release
Message-ID: <20200708175056.5l6lqwm62bg5pvll@gilmour.lan>
References: <8002e999-feb5-8715-9e1a-ed67165ade7e@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2oaar24fdq5upq63"
Content-Disposition: inline
In-Reply-To: <8002e999-feb5-8715-9e1a-ed67165ade7e@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2oaar24fdq5upq63
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Jul 07, 2020 at 03:36:47PM +0200, Hans Verkuil wrote:
> This driver didn't call _vb2_fop_release in the sun4i_csi_release
> function. Without that call the vb2 queue is not properly canceled and
> buffers may not be freed.
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--2oaar24fdq5upq63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXwYHgAAKCRDj7w1vZxhR
xZzSAPoDLQe5omh+eZel+d6LL7jB6VFxVwbyT1gKjYLaLXiizAD/cZeohWCUnCy7
GYFeRPNz74qrVOh+yBFnOyzTKirINww=
=NfAk
-----END PGP SIGNATURE-----

--2oaar24fdq5upq63--
