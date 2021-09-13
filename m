Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD7340864E
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 10:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237877AbhIMIT2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 04:19:28 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:49859 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234575AbhIMIT1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 04:19:27 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 75DDC580B92;
        Mon, 13 Sep 2021 04:18:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 13 Sep 2021 04:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=Q/fC65yGDoBYl/ELDK8wk321UEy
        fRbfkHgYZ5KDCjxY=; b=e0eGQYPcf6km0clE+c4JZyfbBuHvc+/sI1gzIK2u/O+
        oyZTNIa3xl+5C/GvUyEh/oKL8LjwsZoKb3oAAp9NZrFpwg55aDD0MxVYMSU4+EPB
        fiUBphzo66ihLjuucm3kLUENH+2DC8Hg6R287Q10/2OvgQa4KYkCBdfdQT+O6wCl
        8rFtPo5onnUfuPgmfLXlYbtFz/kZyxfHK2zs/Gu2DrFwRdb5ZRHnm/plEpDwno0c
        Fkk608VBqgulakZELGkMiaugPBfMQT7lnT0yanBtEGesDkrbxq4UcHCmFZEuv79a
        9j30jDlg/FoMmQdDPSk+WN2sWXmexwQFnQZU347f1fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Q/fC65
        yGDoBYl/ELDK8wk321UEyfRbfkHgYZ5KDCjxY=; b=bhkwBWZhT9SOr4FP+7+/Vg
        ikaOhf2LCqXTfz9gfQiAHhQOZXNgH3JUYMf/Pi4iixbEDDrr2hQaa3MTAWyUxt6e
        AJdke3UAPKYbiHalULWw5LILqHzlNHsvAWW7zN4INRb8GY0boDcyydAnhAw2gkNx
        QTHbFw78lrHXPWKL9xQSX+J2aFPfJW/4TdhDujdo0b9UARvpiEhmB6Bpaa7mkTM0
        KWlqPONTWGMBhDNDSFtCCbx3Kjm0iK6yPBCq/cDQXp513KjV7KAMi/TmetNQrWvT
        V+KBrKlZpS2CGuyF+uExuXhuKHbFfQYAp3kpq3glQt8rKjZ0wD1ecbS1rFWbqJdA
        ==
X-ME-Sender: <xms:QQk_YZApqI9u_gMm4YDL7mszIB5KWw_Z4h0zfxjaB7WiMy-xWwDieA>
    <xme:QQk_YXgup7juhc-JRaIbSUh2h9h_wzb2hHzToWX8M2q81lqfqBf9FH1MEatpw2FGc
    WuB8DUasBH7h5BqQ6Q>
X-ME-Received: <xmr:QQk_YUnx7rDXyXiV2Fz5SiXioOzanNKHqUwGHGo1_KkeBKYFATROuCvGQGmYK-DbfuwUx5rqGJdaZh0Gei3fjD9Bg7nO2rVIpaN4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepffetteevieejteeuhfffgeektefghfeileehhedtuddutefhhfejtddvtddu
    ledvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
    thgvtghh
X-ME-Proxy: <xmx:QQk_YTy-swT6w_J21NltbLyuzhxusHfhdfA2bef4dBeq5i5i3Bc_3A>
    <xmx:QQk_YeSrBSF8VsmAdhJvMUcFGeFzxJmzeeeFdxxGhDGeDsXKyvc8Ew>
    <xmx:QQk_YWak79bYYtVayOBteIWq7L_TPxmD6VE9Zxx7dpvxDzDN4Tp73w>
    <xmx:Qwk_YfLk3cKWbpX1j1vfj3mwE681eu_9kOMCs64CnG1imQ8CKP1JIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 04:18:09 -0400 (EDT)
Date:   Mon, 13 Sep 2021 10:18:08 +0200
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
Subject: Re: [PATCH 17/22] dt-bindings: media: Add Allwinner A31 ISP bindings
 documentation
Message-ID: <20210913081808.esgqvz4eeatp4hkp@gilmour>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-18-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="menbmu3mm5gvaxqx"
Content-Disposition: inline
In-Reply-To: <20210910184147.336618-18-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--menbmu3mm5gvaxqx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 08:41:42PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the Allwinner A31 Image
> Signal Processor (ISP).
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun6i-a31-csi.yaml        |   2 +-
>  .../media/allwinner,sun6i-a31-isp.yaml        | 111 ++++++++++++++++++
>  2 files changed, 112 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun=
6i-a31-isp.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.=
yaml
> index f4a686b77a38..c60f6b5403fa 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> @@ -1,4 +1,4 @@
> -# SPDX-License-Identifier: GPL-2.0
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-csi.yaml#
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
isp.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.=
yaml
> new file mode 100644
> index 000000000000..a0f82f150e90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-isp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A31 Image Signal Processor Driver (ISP) Device Tree Bin=
dings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun6i-a31-isp
> +      - allwinner,sun8i-v3s-isp
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
> +      - description: DRAM Clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: ram
> +
> +  resets:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: CSI0 input port
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +        additionalProperties: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: CSI1 input port
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +        additionalProperties: false

port@0 and port@1 required?

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets

ports required?

Maxime

--menbmu3mm5gvaxqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYT8JQAAKCRDj7w1vZxhR
xZNAAP46Yko6Ls0D9aw1lxu7i05pPd3ZqX3GT6b9KfjUV53/eAEA3V+K3VWujOkc
i9uv/M1/MIUThJ7WBSs2tuSEBCcS9AM=
=2NXq
-----END PGP SIGNATURE-----

--menbmu3mm5gvaxqx--
