Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE5B12075B
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbfLPNij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:38:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:46848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727557AbfLPNij (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:38:39 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68705206A5;
        Mon, 16 Dec 2019 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576503518;
        bh=shI0lUnBWDuONPZWYfqSGhPOhXNDA+SfJVRhGbQY6Xw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UttEaSKeMmq7uNC2LPGQ067DE+umu9bQ9JgGGDcjUIl3d40CeYzZFihVV7vaeKa+U
         XfCAudFleagC55ea2i5XWF84QZer3HDLZc9f1oep55imPczhTnxcbZ1AMYC6o42Acm
         Ibp/Qt935MDXGb9HDPOFujM1lj2mZrBvdTydBQQI=
Date:   Mon, 16 Dec 2019 14:38:36 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 06/14] media: sun4i-csi: Add support for A10 CSI1 camera
 sensor interface
Message-ID: <20191216133836.n4sej7jqhzwxljnl@gilmour.lan>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-7-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qxmpdqzztr46q3kx"
Content-Disposition: inline
In-Reply-To: <20191215165924.28314-7-wens@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--qxmpdqzztr46q3kx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 12:59:16AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The A10/A20 Allwinner SoCs have two camera sensor interface blocks,
> named CSI0 and CSI1. The two have the same register layouts with
> slightly different features:
>
>   - CSI0 has an image signal processor (ISP); CSI1 doesn't
>
>   - CSI0 can support up to four separate channels under CCIR656;
>     CSI1 can only support one
>
>   - CSI0 can support up to 16-bit wide bus with YUV422;
>     CSI1 can support up to 24-bit wide bus with YUV444
>
> For now the driver doesn't support wide busses, nor CCIR656. So the
> only relevant difference is whether a clock needs to be taken and
> enabled for the ISP.
>
> Add structs to record the differences, tie them to the compatible
> strings, and deal with the ISP clock. Support for the new CSI1
> hardware block is added as well.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--qxmpdqzztr46q3kx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfeI3AAKCRDj7w1vZxhR
xVSBAP9m2gsGlN6svjB7zDFDDm9ZKaScsYn4Qk0eM3z4TyWE/QD/eKqz3SoIImtb
BN2EcgJHtWC+oJn4pHEYxoCeDYV5IA8=
=w2qB
-----END PGP SIGNATURE-----

--qxmpdqzztr46q3kx--
