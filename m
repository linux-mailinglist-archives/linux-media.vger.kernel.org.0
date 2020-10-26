Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39B0299310
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 17:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786699AbgJZQ44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 12:56:56 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:44053 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1786610AbgJZQ4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 12:56:55 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id B6E705805D4;
        Mon, 26 Oct 2020 12:56:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 26 Oct 2020 12:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=faYAJTfSctlHM7ABJz6moYFCpWA
        /waoqzYu5Nvlv+4U=; b=JdZVuvaVqf34Umv5FYsqDKtQdoElrwkrZNA+wQNLm7B
        3dQhE0NCRSIY16BIzfYiD7pKDJvP+mv/I9/MQpro7W27b6oR/o0pvO8Cx7RMs5bk
        uNXpA8hJUqj6ygbbHZVGD5yv/BkbxFDFWeKducgwiNo+yG3/i1mi0wPFiyx5XjgH
        Zxsxj684oVzrysWHvgcGFpuOK6KebJOl2yWPbOAvmrz1nUWsjb6N7eUse6l1TfNs
        q6l/dXvMGho4MhNo4M+J8bCHSLUR3YEg1C//XVpazg4Eux1aDz0alKXlbWRfMucT
        k9iexVVKshlAva5G2YgTYRynumYp6jWK11UbgemltsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=faYAJT
        fSctlHM7ABJz6moYFCpWA/waoqzYu5Nvlv+4U=; b=N9aGMUbWXFygf3Vv8R4BQs
        XyqcKVMMOMcDerpQs3g4tns8353Hx7HUWLiPXddddrFmt+hjRoRmKpWwWZDCBwx8
        gkzBziA0zGNYLnw2YTVm8wcakzE/YuuQkhyox7MgKIUhPYLk0DR6a2sZtAvjvOwi
        lpmG4M1NnETtbRxjG9g5IRrKARK3l56BN/ZnLiNmGLUyNLiuwG5FbvhSP0+M3A8u
        b279+MxiVfLTu49mMeyFbKGftCNX4cL+YgOjdAZhZxYs7kc2qn7MBXab7CoBlpvH
        P5K4mKTXt1KIi9LnhiU+/Iod9SbyjUCNZ6H3TW5qRuBY1+b+9akSPP1Ox4yv6Zmg
        ==
X-ME-Sender: <xms:1v-WX15H6yufn1RkLEn7ov3-9nkpD0FQyRQLJZv_1wCVZX6kjTUl7Q>
    <xme:1v-WXy7z6auCdkjJJbHQdSIeZi-NMR0E6jKl2li4aaMmYQHL3u_ol5xjmhU8S6kR7
    CZv9IxkO6iEcc2tOVc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeffteetveeijeetuefhffegkeetgffhieelheehtdduudethffhjedtvddtudel
    vdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrd
    eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1v-WX8c24GxEXI311O4UO8Eoi17n8ByHP10HefptpYL_w21nscYx0w>
    <xmx:1v-WX-KIBSMFILfDY86nDlD4CwYKFe9eli9AWGeh7keS5wrR2nXisQ>
    <xmx:1v-WX5IY8kpNmabaJORbYAb1U4oxskEOgJhtDn49o83brkeR1OI0nw>
    <xmx:1v-WX-DwAxMhQAQfn6hCoa63GUxBobN0AvAnAG3rlZGCRZ4KoRVr8g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 36ED7328005A;
        Mon, 26 Oct 2020 12:56:54 -0400 (EDT)
Date:   Mon, 26 Oct 2020 17:56:53 +0100
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
Subject: Re: [PATCH 11/14] dt-bindings: media: i2c: Add A83T MIPI CSI-2
 bindings documentation
Message-ID: <20201026165653.7tzo2hlagee633ra@gilmour.lan>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-12-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7ovabmptobm3zx7w"
Content-Disposition: inline
In-Reply-To: <20201023174546.504028-12-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--7ovabmptobm3zx7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 07:45:43PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the A83T MIPI CSI-2
> controller.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

What is the difference with the a31/v3s one?

> ---
>  .../media/allwinner,sun8i-a83t-mipi-csi2.yaml | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun=
8i-a83t-mipi-csi2.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun8i-a83t=
-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun8i-a=
83t-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..2384ae4e7be0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-c=
si2.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allwinner,sun8i-a83t-mipi-csi2.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A83T MIPI CSI-2 Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun8i-a83t-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +      - description: MIPI-specific Clock
> +      - description: Misc CSI Clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: mipi
> +      - const: misc

If it's only due to the clock, it's soemething you can deal with in the
first schema, there's no need to duplicate them.

Maxime

--7ovabmptobm3zx7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5b/1QAKCRDj7w1vZxhR
xakfAP4kStUeYLhitiX6TMzIOuSCGkToCSiTRV+OOxZG6u/ebwD+O9sQfYacFXnD
437JGBI8Re7cmk9kw508jaZyC2EA6gI=
=ZOtr
-----END PGP SIGNATURE-----

--7ovabmptobm3zx7w--
