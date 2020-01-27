Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF7314A6AF
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 15:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbgA0O7g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 09:59:36 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33387 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726443AbgA0O7g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 09:59:36 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 423A92208C;
        Mon, 27 Jan 2020 09:59:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 27 Jan 2020 09:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=kYYUUnAwZZI0feOedjjFh/1OaT1
        i27hqj14Wc+HfQjQ=; b=OpzF5pvUdsVCFA/kFgiqVy6T3l1nBnrZ/uILXG21Mkg
        FB6rZKwuhXRNQ+aWYXzG2M7M3Y/Z8H77vEx6t2Y1piTDGmK9ECaX4BcYSsu1nNtM
        2q5sdPBiPfcxt36QH4rwoTAT27+W1guhzeulofgxSNoaoSraBOmO89PXjeQwSBm9
        RxiAHoNVZ36Bb/PsVVdMfB8G+D2k20jdXnV6Py0MRupMWBnDCqHCuSXPcufy6jFL
        MVULaK+G0+5xpEhsmF0R63keOiJTx+j/zLlt9M1Rtub+EIKMRqS1qHDtKJPKZ/0+
        GxrvOwlODv+Ocb6VDXt1a1NV7NhozQQc3GHd+uXdNbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kYYUUn
        AwZZI0feOedjjFh/1OaT1i27hqj14Wc+HfQjQ=; b=td99w1MQjVqGxuSkEEZb8l
        dDX+K73+mR0eWaDWGqidX45jZNz1Y7ne/kmG9+KfSYwXroHZrRuqUICsOLpS/eCU
        6MhCqxsiF90TLJkWGLVndm9nMHllyHtX0GBwlMmE5ogOHtKBl1QHTKEpLmH8gXGN
        qjOo3IN1U3XwXn1+3jp4gg7aSl39M8uBk8AQDdv1AJYxUd6/qSMqQyoxsqN+fPZW
        BM+jyZkExFK8L33m6HoC0pkeCbwJ9Ffa8FNnQrn0CAcWMYkizh+j7bjQKTqDJCvo
        2vImDdqLmsNCINgBEBjbPPVlNw9gTvi547Zqp0IOGwtN7fCpFQ/jTbdjTCAdC2mw
        ==
X-ME-Sender: <xms:1fouXjpeBdt_tFZxI91BOJHS7m16IFPjjxjd5Ak1o-1F_ObqhkeeUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfedvgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1fouXsJNbdco-veunsL5RGMK2TLrzaBmAS-qX2wb7sCJdNNXm4KNuA>
    <xmx:1fouXm7d9yFizwEq5a-SZKnFCf787Qw7ZGAIINtSRc5avB4igbNwow>
    <xmx:1fouXmAGFzk3Wr3SiUnKKhAW7Q8lb_67zuAvuFNcrLEn7ZiHG3ROzw>
    <xmx:1_ouXsT4orjMUqm8CuXKrZsn3-H1QpZj_tdINWOKvvemakc2m64TUg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 26DCD3069FF8;
        Mon, 27 Jan 2020 09:59:33 -0500 (EST)
Date:   Mon, 27 Jan 2020 15:59:31 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/5] arm64: dts: allwinner: a64: Add MBUS controller node
Message-ID: <20200127145931.rjewha4awnlorfvb@gilmour.lan>
References: <20200125110353.591658-1-jernej.skrabec@siol.net>
 <20200125110353.591658-4-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hchmskw2va5gdqje"
Content-Disposition: inline
In-Reply-To: <20200125110353.591658-4-jernej.skrabec@siol.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--hchmskw2va5gdqje
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sat, Jan 25, 2020 at 12:03:51PM +0100, Jernej Skrabec wrote:
> A64 contains MBUS, which is the bus used by DMA devices to access
> system memory.
>
> MBUS controller is responsible for arbitration between channels based
> on set priority and can do some other things as well, like report
> bandwidth used. It also maps RAM region to different address than CPU.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 862b47dc9dc9..d225ea1f3b87 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -1061,6 +1061,14 @@ pwm: pwm@1c21400 {
>  			status = "disabled";
>  		};
>
> +		mbus: dram-controller@1c62000 {
> +			compatible = "allwinner,sun50i-a64-mbus";
> +			reg = <0x01c62000 0x1000>;
> +			clocks = <&ccu CLK_MBUS>;

We're merging the clock header patch and the DT through two different
trees, so you can't use it right away. You should use the raw ID here.

(also, as a general remark, it's easier on us to not send the patches
during the rc6 <-> rc1 phase), so if you can resend them as soon as
rc1 is out, that would be great :)

Maxime

--hchmskw2va5gdqje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXi760wAKCRDj7w1vZxhR
xV3PAQChOtKOxyE6bSJr+/fHayOoz8h6A1dqalhBnV4Yedxv2QD/a9QqEgknQXMe
KRf3qGZyHOAWbKWvK2FkvcTP92UVFgE=
=7bxe
-----END PGP SIGNATURE-----

--hchmskw2va5gdqje--
