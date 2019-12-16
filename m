Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A34C120749
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfLPNhG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:37:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:46068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727788AbfLPNhG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:37:06 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00E49206A5;
        Mon, 16 Dec 2019 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576503425;
        bh=OlLjTfGQi5/U4jUE0lWUYWNrQUVkF9ABRFYEb3H6wRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UN3eg7bkh56gQzbPJKX92DS2oPbfzk/s8NFCYvwapn+olTsxbwocauo+FhEgEbHcQ
         oVENs8AlxstW3j1z2VhLfYFGQ6Xhmp7LZh1iQ3H4OC9FogVfZVkmRrIBpGFIyKVQQt
         e6d4Og6pZ0miFTtZaa0ZOojvY10otamRfSr8r9r8=
Date:   Mon, 16 Dec 2019 14:37:03 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 04/14] media: sun4i-csi: Fix [HV]sync polarity handling
Message-ID: <20191216133703.4udteob37py5s3ms@gilmour.lan>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-5-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fe4ttno4f4fmseg"
Content-Disposition: inline
In-Reply-To: <20191215165924.28314-5-wens@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2fe4ttno4f4fmseg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 12:59:14AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The Allwinner camera sensor interface has a different definition of
> [HV]sync. While the timing diagram uses the names HSYNC and VSYNC,
> the note following the diagram and register names use HREF and VREF.
> Combined they imply the hardware uses either [HV]REF or inverted
> [HV]SYNC. There are also registers to set horizontal skip lengths
> in pixels and vertical skip lengths in lines, also known as back
> porches.
>
> Fix the polarity handling by using the opposite polarity flag for
> the checks. Also rename `[hv]sync_pol` to `[hv]ref_pol` to better
> match the hardware register description.
>
> Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--2fe4ttno4f4fmseg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfeIfwAKCRDj7w1vZxhR
xRA/AP4vF6S6Kyoc+sq1NvPSmvANUDxkredIbI6JCHlMsiFG3QD9H7FUVTe0FnrF
Al8s9SSOmN2Cb9+DM0+mq5Jb6GxZyQQ=
=u2Iv
-----END PGP SIGNATURE-----

--2fe4ttno4f4fmseg--
