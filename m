Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6489745A89
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 12:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfFNKii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 06:38:38 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:34159 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbfFNKii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 06:38:38 -0400
X-Originating-IP: 37.177.88.254
Received: from uno.localdomain (unknown [37.177.88.254])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3EA8240007;
        Fri, 14 Jun 2019 10:38:26 +0000 (UTC)
Date:   Fri, 14 Jun 2019 12:39:40 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 5/7] [media] marvell-ccic/mmp: add devicetree support
Message-ID: <20190614103940.4dg43fo7dmbwnpfs@uno.localdomain>
References: <20190528090731.10341-1-lkundrak@v3.sk>
 <20190528090731.10341-6-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="afhe6fv3nxwqv4st"
Content-Disposition: inline
In-Reply-To: <20190528090731.10341-6-lkundrak@v3.sk>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--afhe6fv3nxwqv4st
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 28, 2019 at 11:07:29AM +0200, Lubomir Rintel wrote:
> The platform data is actually not used anywhere (along with the CSI
> support) and should be safe to remove.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>
> ---
> Changes since v1:
> - s/This are/These are/ in a comment
>
>  .../media/platform/marvell-ccic/mmp-driver.c  | 36 ++++++++++++++-----
>  1 file changed, 27 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
> index 8f1d2a972bc9..54c2dd8c29d8 100644
> --- a/drivers/media/platform/marvell-ccic/mmp-driver.c
> +++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
> @@ -19,6 +19,8 @@
>  #include <media/v4l2-device.h>
>  #include <linux/platform_data/media/mmp-camera.h>
>  #include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/gpio.h>
>  #include <linux/io.h>
> @@ -196,6 +198,9 @@ static void mmpcam_calc_dphy(struct mcam_camera *mcam)
>  	struct device *dev = &cam->pdev->dev;
>  	unsigned long tx_clk_esc;
>
> +	if (!pdata)
> +		return;
> +

This seems a bit of an hack to me. The caller knows the mcam->bus_type
and should not try to calc_dphy() if the bus type is not CSI2_DPHY.
What do you think?

>  	/*
>  	 * If CSI2_DPHY3 is calculated dynamically,
>  	 * pdata->lane_clk should be already set
> @@ -314,10 +319,6 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	struct mmp_camera_platform_data *pdata;
>  	int ret;
>
> -	pdata = pdev->dev.platform_data;
> -	if (!pdata)
> -		return -ENODEV;
> -
>  	cam = devm_kzalloc(&pdev->dev, sizeof(*cam), GFP_KERNEL);
>  	if (cam == NULL)
>  		return -ENOMEM;
> @@ -330,17 +331,29 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	mcam->calc_dphy = mmpcam_calc_dphy;
>  	mcam->dev = &pdev->dev;
>  	mcam->use_smbus = 0;
> -	mcam->mclk_src = pdata->mclk_src;
> -	mcam->mclk_div = pdata->mclk_div;
> -	mcam->bus_type = pdata->bus_type;
> -	mcam->dphy = pdata->dphy;
> +	pdata = pdev->dev.platform_data;
> +	if (pdata) {
> +		mcam->mclk_src = pdata->mclk_src;
> +		mcam->mclk_div = pdata->mclk_div;
> +		mcam->bus_type = pdata->bus_type;
> +		mcam->dphy = pdata->dphy;
> +		mcam->lane = pdata->lane;
> +	} else {
> +		/*
> +		 * These are values that used to be hardcoded in mcam-core and
> +		 * work well on a OLPC XO 1.75 with a parallel bus sensor.
> +		 * If it turns out other setups make sense, the values should
> +		 * be obtained from the device tree.
> +		 */
> +		mcam->mclk_src = 3;
> +		mcam->mclk_div = 2;

I see these only used in mcam_enable_mipi(). Am I wrong?

Thanks
   j

> +	}
>  	if (mcam->bus_type == V4L2_MBUS_CSI2_DPHY) {
>  		cam->mipi_clk = devm_clk_get(mcam->dev, "mipi");
>  		if ((IS_ERR(cam->mipi_clk) && mcam->dphy[2] == 0))
>  			return PTR_ERR(cam->mipi_clk);
>  	}
>  	mcam->mipi_enabled = false;
> -	mcam->lane = pdata->lane;
>  	mcam->chip_id = MCAM_ARMADA610;
>  	mcam->buffer_mode = B_DMA_sg;
>  	strscpy(mcam->bus_info, "platform:mmp-camera", sizeof(mcam->bus_info));
> @@ -475,6 +488,10 @@ static int mmpcam_resume(struct platform_device *pdev)
>
>  #endif
>
> +static const struct of_device_id mmpcam_of_match[] = {
> +	{ .compatible = "marvell,mmp2-ccic", },
> +	{},
> +};
>
>  static struct platform_driver mmpcam_driver = {
>  	.probe		= mmpcam_probe,
> @@ -485,6 +502,7 @@ static struct platform_driver mmpcam_driver = {
>  #endif
>  	.driver = {
>  		.name	= "mmp-camera",
> +		.of_match_table = of_match_ptr(mmpcam_of_match),
>  	}
>  };
>
> --
> 2.21.0
>

--afhe6fv3nxwqv4st
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0DeWsACgkQcjQGjxah
VjyN0w//eJaACnLIgd74jgfWMgGJrJO2ESYgEtFE/sPAVC2bg9CM93nN3/ucTwcd
EM0efN3gDbUiL3pBvVD9Nqlpqd9CZOjZJxKT2bPSJvsTNG+zXgaf1Iu1imj4kPEw
zfBr37DzBb5ldvcMv/VgOef4K0OtQIvXTZ2IxndL5jjj9n0qtTnWtMkIxwprRtjR
2sX+quTJcKJqGQHx6thTM4TPIvgFCaSHpq/ivsKRTF9PnC9S7ij82GDKG8F/HJoi
xCaLdbEw1SE+CYz65L2ze6TttX+YeWHfZT1ciLTmbE3f0idr897PaRL0Bo9mhc/x
SOCv0VyxuOhNwO1lMfKiXwWuEnjmIyo6tv4tcFn8Az48YbTjYacEsiRwcPLrSV2/
AX0N/zISxiPeOvESiNFZzRfhj4nx30DjMTVR0jRFWi2HtzbXBlcTBkH547yI7WlR
Wir1fstvC3aY7AXeFlZ6efJNPsRgHRojaSbQoFGfebMgw00aust2fOAkJS4opEda
e0OvH4IY0wgX6tJKauv2M/RNqhzmjPybtgcfwHYjktNjaaP5Rt8MxfeBRCHDMGxF
FjxEEnzQMX4KIJSk86V24qbcEUehSkbkcy2yySKvRTsqules6CNeEVaLtRZtnr1L
5es8YRDqM+q0IW7Obbf40CC9DNqkgGrWrjV7EviNStJ/2T7cQQc=
=Dnfz
-----END PGP SIGNATURE-----

--afhe6fv3nxwqv4st--
