Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62262991A8
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 17:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1784685AbgJZQCL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 12:02:11 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:60741 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1773531AbgJZQAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 12:00:40 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 989245805BF;
        Mon, 26 Oct 2020 12:00:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 26 Oct 2020 12:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=+zFpdLqS4f1Sp9pHsGd3MydHd4a
        Aljq6m/3hyPbewys=; b=fLpeYZwODJMYmuT+eOU7Ouv+0ogVQVm4EyGRsaZEgY7
        HGyIojY0V9nc5minP3TxYjV6loNb4088bN1/3RI4QGxjCf6Z+HfW4aNzu3Gix1ee
        O4mRSgBmG1lPSk2xWiumcn/qHKlhPcMNYm7x0zgvEUx6LKkhEWbDjtvyi9qfVuCi
        Ju8GIgl1W7/LsisO0FN0lNdvbmL1g6IeRQ067US4HXvI0+2b4jyTLIyWLpUU7VnO
        jd+wo/3E18zYA3PynUfTtKJkGcMUOumRd4G4HK0hOvB6G9r6I7tLKmT9Fr28aE5N
        dZ9LWEk+P9R6wzWd3NHM9DTDIE8CCJ9qNq961Lbpz8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+zFpdL
        qS4f1Sp9pHsGd3MydHd4aAljq6m/3hyPbewys=; b=PUo53Rrb9+0G8Os9gAjLIk
        I1aGa1arl49S7hXp+K0MvyDy/e7Z4SvSdyiaRWNdrLfdN6ONDjmg89y4TU+oGbYP
        +ll5JB4o0k5owadvpQsiA1zYzgp9wpocXQCPzwxceAv+31iBc8XmvMVMjcOvl3ZV
        qHOSctdy64HDTZxyaMem9H3Yh0kVdp1qqguFY9QDxX0dJLc50H6xng49uh8BGIpY
        9CWvw1onyJZPKtPx3WR8RQOaqQ73O1mZ+eLOawGyBKHWn7PXU50wWAREctp0/bnY
        rFMAmVV4mvVcI/CsEyUUoGrNz6mnHD5dpOvqeQS44JNaSwbVU+EC9m6OjWNleMhw
        ==
X-ME-Sender: <xms:pfKWXzqsps-zuFYJpfZ26BNfJyPcfk5Rm9UZGpXwzYG92o1d4nLwpA>
    <xme:pfKWX9qMIYIg0cLpGo9teeEdyOHuu4fiXw3L-wsj6WXQujhdUoFzb7vgThGMTQqJr
    _IYixqorErF41rz-M4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgdegjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
    veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pfKWXwMtLWm4Zp0Fj5qXPEOHuDljI8eMQDNTHOkMLgXsSOYYFCJ4cQ>
    <xmx:pfKWX25IVLwmA5VuqBVqlu-HSF-2pJDB1r5xbcZVFtESIpKbkMXu_w>
    <xmx:pfKWXy5voU7X4QzEk_kXvu6E1_oqmpjS75Re_Kv01EKAVx1ex4RmOw>
    <xmx:p_KWXwuCRpG21Yi6G8Hi815xciyYa9YkQPx4Q8BuJ-EMvMMJQTdjug>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 121B0328006B;
        Mon, 26 Oct 2020 12:00:37 -0400 (EDT)
Date:   Mon, 26 Oct 2020 17:00:35 +0100
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
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com,
        =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH 05/14] media: sun6i-csi: Only configure the interface
 data width for parallel
Message-ID: <20201026160035.sr6kifrpkev773o6@gilmour.lan>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-6-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="skxp2qthj3edyfa2"
Content-Disposition: inline
In-Reply-To: <20201023174546.504028-6-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--skxp2qthj3edyfa2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 07:45:37PM +0200, Paul Kocialkowski wrote:
> Bits related to the interface data width do not have any effect when
> the CSI controller is taking input from the MIPI CSI-2 controller.

I guess it would be clearer to mention that the data width is only
applicable for parallel here.

> In prevision of adding support for this case, set these bits
> conditionally so there is no ambiguity.
>=20
> Co-developed-by: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>
> Signed-off-by: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 42 +++++++++++--------
>  1 file changed, 25 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers=
/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index 5d2389a5cd17..a876a05ea3c7 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -378,8 +378,13 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev=
 *sdev)
>  	unsigned char bus_width;
>  	u32 flags;
>  	u32 cfg;
> +	bool input_parallel =3D false;
>  	bool input_interlaced =3D false;
> =20
> +	if (endpoint->bus_type =3D=3D V4L2_MBUS_PARALLEL ||
> +	    endpoint->bus_type =3D=3D V4L2_MBUS_BT656)
> +		input_parallel =3D true;
> +
>  	if (csi->config.field =3D=3D V4L2_FIELD_INTERLACED
>  	    || csi->config.field =3D=3D V4L2_FIELD_INTERLACED_TB
>  	    || csi->config.field =3D=3D V4L2_FIELD_INTERLACED_BT)
> @@ -395,6 +400,26 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev=
 *sdev)
>  		 CSI_IF_CFG_HREF_POL_MASK | CSI_IF_CFG_FIELD_MASK |
>  		 CSI_IF_CFG_SRC_TYPE_MASK);
> =20
> +	if (input_parallel) {
> +		switch (bus_width) {
> +		case 8:
> +			cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_8BIT;
> +			break;
> +		case 10:
> +			cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_10BIT;
> +			break;
> +		case 12:
> +			cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_12BIT;
> +			break;
> +		case 16: /* No need to configure DATA_WIDTH for 16bit */
> +			break;
> +		default:
> +			dev_warn(sdev->dev, "Unsupported bus width: %u\n",
> +				 bus_width);
> +			break;
> +		}
> +	}
> +
>  	if (input_interlaced)
>  		cfg |=3D CSI_IF_CFG_SRC_TYPE_INTERLACED;
>  	else
> @@ -440,23 +465,6 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev=
 *sdev)
>  		break;
>  	}
> =20
> -	switch (bus_width) {
> -	case 8:
> -		cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_8BIT;
> -		break;
> -	case 10:
> -		cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_10BIT;
> -		break;
> -	case 12:
> -		cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_12BIT;
> -		break;
> -	case 16: /* No need to configure DATA_WIDTH for 16bit */
> -		break;
> -	default:
> -		dev_warn(sdev->dev, "Unsupported bus width: %u\n", bus_width);
> -		break;
> -	}
> -

Is there any reason to move it around?

Maxime

--skxp2qthj3edyfa2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5byowAKCRDj7w1vZxhR
xTCUAP9jlPYhUtoRUzFdPIpQeEYFvbgdfMykS8BmmV1CJg10fQEAm2eH1TwsE349
vqAWwldnM2QEICqTpinpdy1eH7YiDAU=
=TXc0
-----END PGP SIGNATURE-----

--skxp2qthj3edyfa2--
