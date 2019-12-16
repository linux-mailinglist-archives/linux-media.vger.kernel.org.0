Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3275120742
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbfLPNgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:36:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:45606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727601AbfLPNgH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:36:07 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41866206CB;
        Mon, 16 Dec 2019 13:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576503366;
        bh=hNHO7qhuEn1+H5H1TDdAFoLepebeVApFqZHiSXCaSeg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A6y4BII/Y9MV3DxdIIQ7EWpX9KGs5x36m7xIL3euGRGccXYzlnaCJl7X8nRYSzjq/
         yG+bIbehrGRUTHr/vYq65XJfC40UM3n0XCN4zaPNVmrbfnAGJXcqLbYzNoH+1InrFV
         7OHJK3jpcjsuXMcyiOjUK63zjGFCj+1GaGKiKjyw=
Date:   Mon, 16 Dec 2019 14:36:03 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 03/14] media: sun4i-csi: Fix data sampling polarity
 handling
Message-ID: <20191216133603.gbr2iaikch5lfv6v@gilmour.lan>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-4-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pxaf47l7hgrm57u2"
Content-Disposition: inline
In-Reply-To: <20191215165924.28314-4-wens@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--pxaf47l7hgrm57u2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 12:59:13AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The CLK_POL field specifies whether data is sampled on the falling or
> rising edge of PCLK, not whether the data lines are active high or low.
> Evidence of this can be found in the timing diagram labeled "horizontal
> size setting and pixel clock timing".
>
> Fix the setting by checking the correct flag, V4L2_MBUS_PCLK_SAMPLE_RISING.
> While at it, reorder the three polarity flag checks so HSYNC and VSYNC
> are grouped together.
>
> Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--pxaf47l7hgrm57u2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfeIQwAKCRDj7w1vZxhR
xVxhAP9flbDGwjgJDkotx80gPBlJVBaAWNlKf5+rVukqwTZs9AEA/EU/dnK5KzU0
QEqJQQjjDUSZ+fxuByQBiPtKJqftfQ0=
=LpuS
-----END PGP SIGNATURE-----

--pxaf47l7hgrm57u2--
