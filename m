Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F728158A10
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2020 07:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbgBKGtc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Feb 2020 01:49:32 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:54009 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727481AbgBKGtb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Feb 2020 01:49:31 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 32CC221FC6;
        Tue, 11 Feb 2020 01:49:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 11 Feb 2020 01:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=XdztXMV9iyXzMFlJWwifunfdijp
        ZRx0c+G9mn+c5wW4=; b=gFq6btPzW+RpRULrPtwkrOzprABO+88TuN7FjK6PjiH
        cuZDuxURE2jMWvg3+zXYfbf/za4X06QjtSbnWYgGeWN0RszLy7jXbz3wDI8g2y+Y
        A39qbWuCOiwp00cVxNqYXBXQCDqeCiyERsvuXRGF2MWEtD3C9aQkAOD0+hceOuY4
        j7oVjR2xUPp2u4OTrL5RCb3IyCbd9IaGuQQUPI9JdV0TDJifDBNcHE5Y3D+/0zUo
        GsxSi1jQjopXopwAtfgWx9RpSiWC9gt1gOjzNDaJm1cL+UhjiHBNnFLdrlWFN5oB
        OpqfpaFS+GGZl3u+45p2ZEbVvCmQZ/NQ4GHbtB+lu/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XdztXM
        V9iyXzMFlJWwifunfdijpZRx0c+G9mn+c5wW4=; b=X1enKO5gTifLFa1Tyq39P9
        IZomnM1+PMGLA6dOvBmOrZmJrAySBoNu4wYwDa9w9vq8Tz1Oxv5VR0C2c+A6uPR3
        SnMfFFWBKnGO9tBRcMAENzappH5aE0Dt5x0x9rJvGQo+tT0D+GZ4ZWzOUexCw/qv
        qX2ArAqCqF6GVWMDEq0fWogXSjmZ3Lvwry0hqVCK/eEV4V48lMFy/2Ms8ni6CPV7
        6SC8sob0bYo9p74F3e46OgBGt8SDrcjP82gxRe/iQWxNeBwOMyRsCnkLu880wJ0w
        IGsEPfxTyYrfOxK2SUv3cCKtn8xahZvKZvDuCPq4JCTbhayPKUMdkVE97mf8tIeQ
        ==
X-ME-Sender: <xms:eE5CXsffZtlZVleiv-xYIOb7dSUU1tXVbmXaqhLacrcVX6rLcc3bkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedvgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eE5CXizdT_P2cmtLz9-0qpl2aw-5W7Jrx13LktK0vfB6p5hQE5pWZA>
    <xmx:eE5CXi8394U4vLUXdnborBVnucisXG-X3X23NwonmszUeDGO2WXt6w>
    <xmx:eE5CXkkhGSrQzszh99htJax3bgSvKJc5p0ydGn0nDzdTs1hHC0woug>
    <xmx:ek5CXna2lWWhM6KBrYlE2fM7k798qQytAwxLRhg2a5cS6V1jJm1ipA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 491B3328005D;
        Tue, 11 Feb 2020 01:49:28 -0500 (EST)
Date:   Tue, 11 Feb 2020 07:49:26 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 0/5] arm64: dts: allwinner: a64: Enable deinterlace
 core
Message-ID: <20200211064926.muxnaphoq4nbrs72@gilmour.lan>
References: <20200210170656.82265-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwr2mhgisf5go3ox"
Content-Disposition: inline
In-Reply-To: <20200210170656.82265-1-jernej.skrabec@siol.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rwr2mhgisf5go3ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2020 at 06:06:51PM +0100, Jernej Skrabec wrote:
> Allwinner A64 contains deinterlace core, compatible to the one found in
> H3. It can be used in combination with VPU to playback interlaced videos.
>
> Please take a look.

Applied, thanks!
Maxime

--rwr2mhgisf5go3ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkJOdgAKCRDj7w1vZxhR
xU35AQD3LjdGbe0ijT1ImTTyhYz9dseJPfQ+YsQLd+m3QBvTEwD8DJEmtNRM/8AC
3IZoFJmm5wKb4si4CoYWpoVwsaHnnwk=
=dTRv
-----END PGP SIGNATURE-----

--rwr2mhgisf5go3ox--
