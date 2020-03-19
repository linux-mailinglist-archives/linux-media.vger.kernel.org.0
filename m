Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68A0B18B3A9
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 13:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgCSMo7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 08:44:59 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33199 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726589AbgCSMo6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 08:44:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 172F258066E;
        Thu, 19 Mar 2020 08:44:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 19 Mar 2020 08:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=fPef86flXx0XBtfvoeNEs+6nqE5
        kjHbY/H2scm6omuc=; b=P54ryr6cYmDL3HtEmHxTsHrnPfMlr4pYagLUkS7ib6U
        IOsPIXi8dXU4dBWVk8gkZr2UKAt1i+V1i0veGvLvTAWfaPNSqzxjTYDC4Kk9OxKw
        FJTjiecptq6P3vlPWZxPF8W6AiAMprS5FeVKu7yUg/uCwo+g+WDFDeKVPULVHN4/
        zcYD4Yxo7qj93XuM75MVktOz4aIbcrpWGzI7yiupyv+H8c3L7xbnNRJR/gIpvgEt
        dQWyzJX8TZZJlfOA3GEQcEOlsUp/8qYUOZ1KLKa5cDr3KUOhvJ1nazwc+ERjlEmm
        5B3PEl2iAPM66FtXNnrVm3jIAZVFNez3aDYMo+qucdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fPef86
        flXx0XBtfvoeNEs+6nqE5kjHbY/H2scm6omuc=; b=BJksx+PBF56TFgnOUEJ/kw
        QYXX0L26+g+4Cw1qAQ79baQSlMIrv7ZTfJLTnWZVVV6wQFmy82Dc8FaOaidq1CKo
        +2JoVnkIBoaTOLU87oR//m2HOUsHzqw7y5jAW8O4xV6hkqY5UDsQctLlwR4AMVHg
        GYKD47FuwoDwgzbx0yILhumliPKt3JN/iLDrxL+bp7JvYGkyjKrVQ08UWKgFDPni
        eAHy1x7Zi9xAYq8g34OQ+uuWTXfRU5ovY931qS6bQQ9y8m/195yyn1xo1uhn1Rb4
        f/Wx4H3Df1KWSY8HXG1TUokdODU9QKDr4g16hLhSv9Zyk2/t/gbpSGRUno9L2Odg
        ==
X-ME-Sender: <xms:RmlzXoTyYLruReR4fEM0EZvVGx3em7prj6ItaYEYTSZV26yRnpGTFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefledggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RmlzXtY1tPKrM6iWyQqASsTBEGtmgOPWGqhrEs3xnNQqk5vuqNZGyw>
    <xmx:RmlzXjcrygJZCEd_r1wE2kBm2DARMoXFqq3ORMp_UnaSKchfDCJm2Q>
    <xmx:RmlzXmKOKO9aidJcE9GYNfnbTaV_5jXHPN6vJMdMmBwUC3t183rxYQ>
    <xmx:SWlzXp97jLbUzb-fmPLA-z2NnPcEfHSko1oXqiOB69IY6YKZfezmkg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8AF24328005D;
        Thu, 19 Mar 2020 08:44:54 -0400 (EDT)
Date:   Thu, 19 Mar 2020 13:44:52 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to
 assigned-clock-rates
Message-ID: <20200319124452.3yfcvq754vi4q2rv@gilmour.lan>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5j65trj5d3psj2o7"
Content-Disposition: inline
In-Reply-To: <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--5j65trj5d3psj2o7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Mar 13, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
> Use assigned-clock-rates to specify the clock rate. Also mark
> clock-frequency property as deprecated.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> index 72ad992..e62fe82 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> @@ -8,7 +8,7 @@ Required Properties:
>  - compatible: Value should be "ovti,ov5645".
>  - clocks: Reference to the xclk clock.
>  - clock-names: Should be "xclk".
> -- clock-frequency: Frequency of the xclk clock.
> +- clock-frequency (deprecated): Frequency of the xclk clock.
>  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
>    to the hardware pin PWDNB which is physically active low.
>  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> @@ -37,7 +37,8 @@ Example:
>
>  			clocks = <&clks 200>;
>  			clock-names = "xclk";
> -			clock-frequency = <24000000>;
> +			assigned-clocks = <&clks 200>;
> +			assigned-clock-rates = <24000000>;
>
>  			vdddo-supply = <&camera_dovdd_1v8>;
>  			vdda-supply = <&camera_avdd_2v8>;

clock-frequency is quite different from assigned-clock-rates though,
semantically speaking. clock-frequency is only about what the clock
frequency is, while assigned-clock-rates will change the rate as well,
and you have no idea how long it will last.

If you want to retrieve that through the clock framework, then just
making clock-frequency optional is enough and falling back to
clk_get_rate on the clocks property already provided is enough.

Maxime

--5j65trj5d3psj2o7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnNpRAAKCRDj7w1vZxhR
xesHAP9VTAePw+WAADpRdawWbVIeQrmRXEWIUIh4/u+DB1CnCQEAtrdAD6cdnFZV
PoQsLM8/8h0mlE9auOHjPVUcOLYy1gs=
=qLmi
-----END PGP SIGNATURE-----

--5j65trj5d3psj2o7--
