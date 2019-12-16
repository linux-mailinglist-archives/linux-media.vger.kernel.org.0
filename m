Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7A2120750
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbfLPNiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:38:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:46614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727557AbfLPNiR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:38:17 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBB5A206A5;
        Mon, 16 Dec 2019 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576503496;
        bh=Iu98Oy5TZm+H1asM/smrTrfPFvEBzeFkzFr8AMmXZXk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qLoRzPiAgHrMoOeQlq47u2JMMsF+kaN6ulynlbG1cRyJ7s2WQ+gZ9zfgmw3qdh7sv
         myCIG83Rfn3FSh1WmEl5AH2BfMtLbkWPKDglHU66akHYiVDCTmO2Ep7X01WYXQ8I12
         04mRGGadq8HC3/+ky2NASgJcq/3lws8PZ0xtYJTs=
Date:   Mon, 16 Dec 2019 14:38:14 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 05/14] media: sun4i-csi: Deal with DRAM offset
Message-ID: <20191216133814.hozcgdrnqe6tim36@gilmour.lan>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-6-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f4vwh4csed7tzwjp"
Content-Disposition: inline
In-Reply-To: <20191215165924.28314-6-wens@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--f4vwh4csed7tzwjp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 12:59:15AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> On Allwinner SoCs, some high memory bandwidth devices do DMA directly
> over the memory bus (called MBUS), instead of the system bus. These
> devices include the CSI camera sensor interface, video (codec) engine,
> display subsystem, etc.. The memory bus has a different addressing
> scheme without the DRAM starting offset.
>
> Deal with this using the "interconnects" property from the device tree,
> or if that is not available, set dev->dma_pfn_offset to PHYS_PFN_OFFSET.
>
> Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

> ---
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index f36dc6258900..b8b07c1de2a8 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -155,6 +156,27 @@ static int sun4i_csi_probe(struct platform_device *pdev)
>  	subdev = &csi->subdev;
>  	vdev = &csi->vdev;
>
> +	/*
> +	 * On Allwinner SoCs, some high memory bandwidth devices do DMA
> +	 * directly over the memory bus (called MBUS), instead of the
> +	 * system bus. The memory bus has a different addressing scheme
> +	 * without the DRAM starting offset.
> +	 *
> +	 * In some cases this can be described by an interconnect in
> +	 * the device tree. In other cases where the hardware is not
> +	 * fully understood and the interconnect is left out of the
> +	 * device tree, fall back to a default offset.
> +	 */

Though we should probably mention the DT-backward-compatibility case
here too.

Maxime

--f4vwh4csed7tzwjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfeIxgAKCRDj7w1vZxhR
xSYlAP4uGoz1Ce+9iej57ZZmMWf4/Tv6JmIocroCOLYz9/kGmgEAlLfgpLkvr3sQ
xO02B/RijIIY2oIzaS23VHo7I+iAtgs=
=/CRW
-----END PGP SIGNATURE-----

--f4vwh4csed7tzwjp--
