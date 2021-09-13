Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17CB4085F3
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 10:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237801AbhIMIBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 04:01:31 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:48185 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237775AbhIMIB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 04:01:28 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id D68ED580BA6;
        Mon, 13 Sep 2021 04:00:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 13 Sep 2021 04:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=5KctZymCVDfBbbqZeIg1vSzdvRQ
        cUgB6DsYANohsJVA=; b=mXWyWuAp48xiZDzrTAc2Ci/voVfMr7DycEpE6nHqN+7
        SyskAgtRGUO8uVeQ0uS3oSEsbzfgkDVEdNmrYxm87McNyl/qKn779f8fJka3sVDe
        QMuW8OG8L7qqPy+WJvB1bKMAIrvnuJkh1XYFzVw3A8cTEVl9lknGUBBTmPLaCPX/
        SG/c6CVKUaiN0OU8CnCkRoo4KnH7lkbm4vYPz6wkt6YxcKgrn0PgHrFlUgMCg8li
        wKyWbNW1rlSLW9REhH3ij/wkEOHQvu64FF3dfu2wHbRzUMZwLEs6zTezfguM2uOM
        XfuN9yVMBlqCEzJDz1sz1SsfH/XsHHc1kh5ApiiEr/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5KctZy
        mCVDfBbbqZeIg1vSzdvRQcUgB6DsYANohsJVA=; b=ZV2H732J1iScZT6gd2qLJd
        K7MUyXL8qOcss7510l55l7uPTwO4+AFPtKt2sRV0fFAEV741ylaKp1D1yC7lJ5Pb
        xx6cj+oYyerS3svLfFF5UDMq6QphpFoGpOMUe8ew66Ut8mAabf/Vy/uwOCGcN2Ew
        kdLP2qvawkDp/sT3zhNwsshm/l9QJzfKmq1bTBvUPYratAq/k/wncjT77MgU8oFb
        4+tg/0aJCUv77jFkWeYEk/zoCcJ+gAzm4hqEbPHBwTN7GUoruYdXoT0tAJKiGp0v
        5L8zIf2LpmgCh2O+G9nD75AfDcC9fyClmb2HFdsh7Z6ySCxL1Hl+BtRz9ZGgTJWg
        ==
X-ME-Sender: <xms:CgU_YdHVc2uZZS6ApachfUIYHUEWPXTNLf-c8E2xyThpaT823nR_qw>
    <xme:CgU_YSXsDXWShgxT9v4CuT6IZ8M9alySpM6BUOkOcDL1kuD-JExiQ08AEIpwqO5Gr
    2gIBtJCwmI3znqzwZQ>
X-ME-Received: <xmr:CgU_YfIhkxjOoO9wQ_0GBFuw9h_BCkIYtgaqkjkJ8656SxbMPpzElHOj0L8Q9qouBVM2oUi8BJ3fuahSg7OWmb7AkvvjbrRirbr9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegiedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CgU_YTFMIBNInP6m7pR-wQMuI11dsD0UVSr2MuRh5CAiHSqwHQc5Xw>
    <xmx:CgU_YTU7pCBouPuWRkvt6X6GPYwCpCIOi_Cu5Zj0LLag8fSC4gKdFA>
    <xmx:CgU_YeNv4X7zgFTu5QOOh9soN3DJkY5HwLxERuGaXyiKBaskv5U0aA>
    <xmx:DAU_YaOr_cXyZCSyz5X8pgt0Gs5uIcvPvKW7vWF7tbUUI1eYITVeaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 04:00:10 -0400 (EDT)
Date:   Mon, 13 Sep 2021 10:00:08 +0200
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
Subject: Re: [PATCH 03/22] dt-bindings: sun6i-a31-mipi-dphy: Add optional
 direction property
Message-ID: <20210913080008.2rxa22ifisuu3dwn@gilmour>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-4-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="plwlvxpmeueswtsh"
Content-Disposition: inline
In-Reply-To: <20210910184147.336618-4-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--plwlvxpmeueswtsh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 08:41:28PM +0200, Paul Kocialkowski wrote:
> The Allwinner A31 MIPI D-PHY block supports both tx and rx directions,
> although each instance of the block is meant to be used in one
> direction only. There will typically be one instance for MIPI DSI and
> one for MIPI CSI-2 (it seems unlikely to ever see a shared instance).
>=20
> Describe the direction with a new allwinner,direction property.
> For backwards compatibility, the property is optional and tx mode
> should be assumed by default.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mi=
pi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mi=
pi-dphy.yaml
> index d0b541a461f3..303bbaf3b915 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy=
=2Eyaml
> @@ -37,6 +37,18 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  allwinner,direction:
> +    $ref: '/schemas/types.yaml#/definitions/string'
> +    description: |
> +      Direction of the D-PHY:
> +      - "rx" for receiving (e.g. when used with MIPI CSI-2);
> +      - "tx" for transmitting (e.g. when used with MIPI DSI).
> +
> +      When the property is missing, "tx" direction is assumed.

You can provide this using default

> +    oneOf:
> +      - const: tx
> +      - const: rx
> +

enum?

Maxime

--plwlvxpmeueswtsh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYT8FCAAKCRDj7w1vZxhR
xTNDAQCPDHJy9LqbeRURRvet4O2w4sY/pZRkFMEFBTWRcJx96wEAwyE5qCAE+Raj
2amKab2gQdIlMNDalPPxP/cPci2YlwY=
=fgQq
-----END PGP SIGNATURE-----

--plwlvxpmeueswtsh--
