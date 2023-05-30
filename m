Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76FC5715576
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 08:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjE3GWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 02:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjE3GWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 02:22:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0B0BF
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 23:22:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91797E4;
        Tue, 30 May 2023 08:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685427709;
        bh=ulT86XEUkp/O//MxVsbttQy+w+NdfBITBkMvGCZ9WBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IF91hikcFa12/YkIcB42TIRd+bzM/U39Ar7IQsHtIAOoXo8IH1scXNdurYQBP3lav
         MdhWk/djTomkNe6Sal8SZgKbGsmayqchP0UGFrNg6rt8cseT51AJhWqxEXXHuy1rtJ
         aie/2KeA81/FKRlbHVbG41bxxM9eTruSDto6BV58=
Date:   Tue, 30 May 2023 09:22:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 31/32] media: v4l: async: Set v4l2_device in
 async notifier init
Message-ID: <20230530062209.GA6865@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-32-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-32-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, May 25, 2023 at 12:16:14PM +0300, Sakari Ailus wrote:
> Set the v4l2_device already in async notifier init, so struct device
> related to it will be available before the notifier is registered.
> 
> This is done in order to make struct device available earlier, during
> construction of the async connections, for sensible debug prints.

I'm worried that the tighter dependency between the notifier and the
v4l2_device will cause issues later. If it's just to get a struct device
pointer, wouldn't it be better to pass the struct device to
v4l2_async_nf_init() ?

> This patch has been mostly generated using the following two commands:
> 
> git grep -l v4l2_async_nf_init -- drivers/media/ drivers/staging/media/ |
> 	while read i; do perl -e '
> 	@a=<>; unlink("'$i'"); open(F, "> '$i'");
> 	for $f ({i=>"v4l2_async_nf_init", r=>"v4l2_async_nf_register"},
> 		{i=>"v4l2_async_subdev_nf_init",
> 		 r=>"v4l2_async_subdev_nf_register"} ) {
> 	my $b; @a = map { $b = "$1, $2" if
> 	s/$f->{r}\(([^,]*),\s*([^\)]*)\)/v4l2_async_nf_register\($2\)/;
> 	$_; } @a; @a = map { if (defined $b) {
> 	s/v4l2_async_nf_init\([^\)]*\)/$f->{i}\($b\)/;
> 	s/$f->{r}\(\K[^,]*,\s*//; }; $_; } @a; }; print F @a; close F;'
> 	< $i; done
> 
> git grep -lP 'v4l2_async_(subdev_|)nf_init' | xargs perl -i -pe \
> 	's/v4l2_async_(subdev_|)nf_init\(\K([^,]*),\s*([^,]*)\)/$3, $2\)/'

It may be nice to play with perl code, but I'd like more focus on the
human-readable part of the commit message, please. The above isn't
useful to anyone but you, while an English text that explains how the
v4l2_async_nf_init() function has now been split into
v4l2_async_nf_init() and v4l2_async_subdev_nf_init() is missing.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/max9286.c                   |  4 +-
>  drivers/media/i2c/st-mipid02.c                |  4 +-
>  drivers/media/i2c/tc358746.c                  |  4 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  4 +-
>  drivers/media/platform/atmel/atmel-isi.c      |  4 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c  |  4 +-
>  drivers/media/platform/intel/pxa_camera.c     |  4 +-
>  drivers/media/platform/marvell/cafe-driver.c  |  2 +-
>  drivers/media/platform/marvell/mcam-core.c    |  2 +-
>  drivers/media/platform/marvell/mmp-driver.c   |  2 +-
>  .../platform/microchip/microchip-csi2dc.c     |  5 +--
>  .../microchip/microchip-sama5d2-isc.c         |  5 +--
>  .../microchip/microchip-sama7g5-isc.c         |  5 +--
>  drivers/media/platform/nxp/imx-mipi-csis.c    |  4 +-
>  drivers/media/platform/nxp/imx7-media-csi.c   |  4 +-
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  4 +-
>  drivers/media/platform/qcom/camss/camss.c     |  5 +--
>  drivers/media/platform/renesas/rcar-isp.c     |  4 +-
>  .../platform/renesas/rcar-vin/rcar-core.c     |  8 ++--
>  .../platform/renesas/rcar-vin/rcar-csi2.c     |  4 +-
>  drivers/media/platform/renesas/rcar_drif.c    |  4 +-
>  drivers/media/platform/renesas/renesas-ceu.c  |  4 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  4 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  4 +-
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  4 +-
>  .../platform/samsung/exynos4-is/media-dev.c   |  5 +--
>  drivers/media/platform/st/stm32/stm32-dcmi.c  |  4 +-
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  4 +-
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |  6 +--
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  4 +-
>  .../sun8i_a83t_mipi_csi2.c                    |  4 +-
>  .../media/platform/ti/am437x/am437x-vpfe.c    |  4 +-
>  drivers/media/platform/ti/cal/cal.c           |  4 +-
>  .../media/platform/ti/davinci/vpif_capture.c  | 11 ++---
>  drivers/media/platform/ti/omap3isp/isp.c      |  4 +-
>  drivers/media/platform/video-mux.c            |  4 +-
>  drivers/media/platform/xilinx/xilinx-vipp.c   |  4 +-
>  drivers/media/v4l2-core/v4l2-async.c          | 44 +++++++------------
>  drivers/media/v4l2-core/v4l2-fwnode.c         |  4 +-
>  .../deprecated/atmel/atmel-sama5d2-isc.c      |  5 +--
>  .../deprecated/atmel/atmel-sama7g5-isc.c      |  5 +--
>  drivers/staging/media/imx/imx-media-csi.c     |  4 +-
>  .../staging/media/imx/imx-media-dev-common.c  |  4 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |  4 +-
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c  |  4 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  4 +-
>  drivers/staging/media/tegra-video/vi.c        |  4 +-
>  include/media/v4l2-async.h                    | 33 ++++++++------
>  48 files changed, 132 insertions(+), 143 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 44def5e3ba5d1..5f13d75f591ad 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -746,7 +746,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
>  	if (!priv->nsources)
>  		return 0;
>  
> -	v4l2_async_nf_init(&priv->notifier);
> +	v4l2_async_subdev_nf_init(&priv->notifier, &priv->sd);
>  
>  	for_each_source(priv, source) {
>  		unsigned int i = to_index(priv, source);
> @@ -766,7 +766,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
>  
>  	priv->notifier.ops = &max9286_notify_ops;
>  
> -	ret = v4l2_async_subdev_nf_register(&priv->sd, &priv->notifier);
> +	ret = v4l2_async_nf_register(&priv->notifier);
>  	if (ret) {
>  		dev_err(dev, "Failed to register subdev_notifier");
>  		v4l2_async_nf_cleanup(&priv->notifier);
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index daea4cb29ec83..d3810e137ba52 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -902,7 +902,7 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
>  	bridge->rx = ep;
>  
>  	/* register async notifier so we get noticed when sensor is connected */
> -	v4l2_async_nf_init(&bridge->notifier);
> +	v4l2_async_subdev_nf_init(&bridge->notifier, &bridge->sd);
>  	asd = v4l2_async_nf_add_fwnode_remote(&bridge->notifier,
>  					      of_fwnode_handle(ep_node),
>  					      struct v4l2_async_connection);
> @@ -915,7 +915,7 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
>  	}
>  	bridge->notifier.ops = &mipid02_notifier_ops;
>  
> -	ret = v4l2_async_subdev_nf_register(&bridge->sd, &bridge->notifier);
> +	ret = v4l2_async_nf_register(&bridge->notifier);
>  	if (ret)
>  		v4l2_async_nf_cleanup(&bridge->notifier);
>  
> diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
> index a455848d60c15..6e4c484ae1bdc 100644
> --- a/drivers/media/i2c/tc358746.c
> +++ b/drivers/media/i2c/tc358746.c
> @@ -1460,7 +1460,7 @@ static int tc358746_async_register(struct tc358746 *tc358746)
>  		return err;
>  	}
>  
> -	v4l2_async_nf_init(&tc358746->notifier);
> +	v4l2_async_subdev_nf_init(&tc358746->notifier, &tc358746->sd);
>  	asd = v4l2_async_nf_add_fwnode_remote(&tc358746->notifier, ep,
>  					      struct v4l2_async_connection);
>  	fwnode_handle_put(ep);
> @@ -1472,7 +1472,7 @@ static int tc358746_async_register(struct tc358746 *tc358746)
>  
>  	tc358746->notifier.ops = &tc358746_notify_ops;
>  
> -	err = v4l2_async_subdev_nf_register(&tc358746->sd, &tc358746->notifier);
> +	err = v4l2_async_nf_register(&tc358746->notifier);
>  	if (err)
>  		goto err_cleanup;
>  
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 0f43b5e10f187..8de03d007d0b7 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1502,7 +1502,7 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
>  	 * suspend.
>  	 */
>  	cio2->notifier.ops = &cio2_async_ops;
> -	ret = v4l2_async_nf_register(&cio2->v4l2_dev, &cio2->notifier);
> +	ret = v4l2_async_nf_register(&cio2->notifier);
>  	if (ret)
>  		dev_err(dev, "failed to register async notifier : %d\n", ret);
>  
> @@ -1797,7 +1797,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  	if (r)
>  		goto fail_v4l2_device_unregister;
>  
> -	v4l2_async_nf_init(&cio2->notifier);
> +	v4l2_async_nf_init(&cio2->notifier, &cio2->v4l2_dev);
>  
>  	/* Register notifier for subdevices we care */
>  	r = cio2_parse_firmware(cio2);
> diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
> index 7dbad99d4e45e..121eaa6994084 100644
> --- a/drivers/media/platform/atmel/atmel-isi.c
> +++ b/drivers/media/platform/atmel/atmel-isi.c
> @@ -1159,7 +1159,7 @@ static int isi_graph_init(struct atmel_isi *isi)
>  	if (!ep)
>  		return -EINVAL;
>  
> -	v4l2_async_nf_init(&isi->notifier);
> +	v4l2_async_nf_init(&isi->notifier, &isi->v4l2_dev);
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&isi->notifier,
>  					      of_fwnode_handle(ep),
> @@ -1171,7 +1171,7 @@ static int isi_graph_init(struct atmel_isi *isi)
>  
>  	isi->notifier.ops = &isi_graph_notify_ops;
>  
> -	ret = v4l2_async_nf_register(&isi->v4l2_dev, &isi->notifier);
> +	ret = v4l2_async_nf_register(&isi->notifier);
>  	if (ret < 0) {
>  		dev_err(isi->dev, "Notifier registration failed\n");
>  		v4l2_async_nf_cleanup(&isi->notifier);
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index b0731c07eace0..d7d6b63306521 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -399,7 +399,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>  		return -EINVAL;
>  	}
>  
> -	v4l2_async_nf_init(&csi2rx->notifier);
> +	v4l2_async_subdev_nf_init(&csi2rx->notifier, &csi2rx->subdev);
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&csi2rx->notifier, fwh,
>  					      struct v4l2_async_connection);
> @@ -409,7 +409,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>  
>  	csi2rx->notifier.ops = &csi2rx_notifier_ops;
>  
> -	ret = v4l2_async_subdev_nf_register(&csi2rx->subdev, &csi2rx->notifier);
> +	ret = v4l2_async_nf_register(&csi2rx->notifier);
>  	if (ret)
>  		v4l2_async_nf_cleanup(&csi2rx->notifier);
>  
> diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
> index 5df93fd4ff04b..44edd4bdc2c11 100644
> --- a/drivers/media/platform/intel/pxa_camera.c
> +++ b/drivers/media/platform/intel/pxa_camera.c
> @@ -2311,7 +2311,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	v4l2_async_nf_init(&pcdev->notifier);
> +	v4l2_async_nf_init(&pcdev->notifier, &pcdev->v4l2_dev);
>  	pcdev->res = res;
>  	pcdev->pdata = pdev->dev.platform_data;
>  	if (pcdev->pdata) {
> @@ -2403,7 +2403,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  		goto exit_deactivate;
>  
>  	pcdev->notifier.ops = &pxa_camera_sensor_ops;
> -	err = v4l2_async_nf_register(&pcdev->v4l2_dev, &pcdev->notifier);
> +	err = v4l2_async_nf_register(&pcdev->notifier);
>  	if (err)
>  		goto exit_deactivate;
>  
> diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
> index fbfbb9f67ddfc..ef810249def61 100644
> --- a/drivers/media/platform/marvell/cafe-driver.c
> +++ b/drivers/media/platform/marvell/cafe-driver.c
> @@ -540,7 +540,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		goto out_smbus_shutdown;
>  
> -	v4l2_async_nf_init(&mcam->notifier);
> +	v4l2_async_nf_init(&mcam->notifier, &mcam->v4l2_dev);
>  
>  	asd = v4l2_async_nf_add_i2c(&mcam->notifier,
>  				    i2c_adapter_id(cam->i2c_adapter),
> diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
> index bcfcecdb03ea2..dbcd4f15bda30 100644
> --- a/drivers/media/platform/marvell/mcam-core.c
> +++ b/drivers/media/platform/marvell/mcam-core.c
> @@ -1873,7 +1873,7 @@ int mccic_register(struct mcam_camera *cam)
>  	cam->mbus_code = mcam_def_mbus_code;
>  
>  	cam->notifier.ops = &mccic_notify_ops;
> -	ret = v4l2_async_nf_register(&cam->v4l2_dev, &cam->notifier);
> +	ret = v4l2_async_nf_register(&cam->notifier);
>  	if (ret < 0) {
>  		cam_warn(cam, "failed to register a sensor notifier");
>  		goto out;
> diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
> index dbc1368b91210..76e0ac9cd34f3 100644
> --- a/drivers/media/platform/marvell/mmp-driver.c
> +++ b/drivers/media/platform/marvell/mmp-driver.c
> @@ -239,7 +239,7 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	if (!ep)
>  		return -ENODEV;
>  
> -	v4l2_async_nf_init(&mcam->notifier);
> +	v4l2_async_nf_init(&mcam->notifier, &mcam->v4l2_dev);
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&mcam->notifier, ep,
>  					      struct v4l2_async_connection);
> diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
> index d631c3880c536..988c1cc1d8b6b 100644
> --- a/drivers/media/platform/microchip/microchip-csi2dc.c
> +++ b/drivers/media/platform/microchip/microchip-csi2dc.c
> @@ -523,7 +523,7 @@ static int csi2dc_prepare_notifier(struct csi2dc_device *csi2dc,
>  	struct v4l2_async_connection *asd;
>  	int ret = 0;
>  
> -	v4l2_async_nf_init(&csi2dc->notifier);
> +	v4l2_async_subdev_nf_init(&csi2dc->notifier, &csi2dc->csi2dc_sd);
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&csi2dc->notifier,
>  					      input_fwnode,
> @@ -542,8 +542,7 @@ static int csi2dc_prepare_notifier(struct csi2dc_device *csi2dc,
>  
>  	csi2dc->notifier.ops = &csi2dc_async_ops;
>  
> -	ret = v4l2_async_subdev_nf_register(&csi2dc->csi2dc_sd,
> -					    &csi2dc->notifier);
> +	ret = v4l2_async_nf_register(&csi2dc->notifier);
>  	if (ret) {
>  		dev_err(csi2dc->dev, "fail to register async notifier: %d\n",
>  			ret);
> diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> index 10e6cebf629e6..d78d289bd4250 100644
> --- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> @@ -529,7 +529,7 @@ static int microchip_isc_probe(struct platform_device *pdev)
>  		struct fwnode_handle *fwnode =
>  			of_fwnode_handle(subdev_entity->epn);
>  
> -		v4l2_async_nf_init(&subdev_entity->notifier);
> +		v4l2_async_nf_init(&subdev_entity->notifier, &isc->v4l2_dev);
>  
>  		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
>  						      fwnode,
> @@ -545,8 +545,7 @@ static int microchip_isc_probe(struct platform_device *pdev)
>  
>  		subdev_entity->notifier.ops = &microchip_isc_async_ops;
>  
> -		ret = v4l2_async_nf_register(&isc->v4l2_dev,
> -					     &subdev_entity->notifier);
> +		ret = v4l2_async_nf_register(&subdev_entity->notifier);
>  		if (ret) {
>  			dev_err(dev, "fail to register async notifier\n");
>  			goto cleanup_subdev;
> diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> index 324810dbdc3af..6d556bb42c12a 100644
> --- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> @@ -519,7 +519,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
>  		struct fwnode_handle *fwnode =
>  			of_fwnode_handle(subdev_entity->epn);
>  
> -		v4l2_async_nf_init(&subdev_entity->notifier);
> +		v4l2_async_nf_init(&subdev_entity->notifier, &isc->v4l2_dev);
>  
>  		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
>  						      fwnode,
> @@ -535,8 +535,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
>  
>  		subdev_entity->notifier.ops = &microchip_isc_async_ops;
>  
> -		ret = v4l2_async_nf_register(&isc->v4l2_dev,
> -					     &subdev_entity->notifier);
> +		ret = v4l2_async_nf_register(&subdev_entity->notifier);
>  		if (ret) {
>  			dev_err(dev, "fail to register async notifier\n");
>  			goto cleanup_subdev;
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 390834ce482bd..c0439bd86b21b 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1252,7 +1252,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  	unsigned int i;
>  	int ret;
>  
> -	v4l2_async_nf_init(&csis->notifier);
> +	v4l2_async_subdev_nf_init(&csis->notifier, &csis->sd);
>  
>  	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
>  					     FWNODE_GRAPH_ENDPOINT_NEXT);
> @@ -1288,7 +1288,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  
>  	csis->notifier.ops = &mipi_csis_notify_ops;
>  
> -	ret = v4l2_async_subdev_nf_register(&csis->sd, &csis->notifier);
> +	ret = v4l2_async_nf_register(&csis->notifier);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 75b7ad65a1141..a9933a97dbef9 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -2107,7 +2107,7 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
>  	struct fwnode_handle *ep;
>  	int ret;
>  
> -	v4l2_async_nf_init(&csi->notifier);
> +	v4l2_async_nf_init(&csi->notifier, &csi->v4l2_dev);
>  
>  	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
>  					     FWNODE_GRAPH_ENDPOINT_NEXT);
> @@ -2130,7 +2130,7 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
>  
>  	csi->notifier.ops = &imx7_csi_notify_ops;
>  
> -	ret = v4l2_async_nf_register(&csi->v4l2_dev, &csi->notifier);
> +	ret = v4l2_async_nf_register(&csi->notifier);
>  	if (ret)
>  		goto error;
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index a09f416a64c4f..8d332ac328888 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -175,7 +175,7 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  	}
>  
>  	/* Initialize, fill and register the async notifier. */
> -	v4l2_async_nf_init(&isi->notifier);
> +	v4l2_async_nf_init(&isi->notifier, v4l2_dev);
>  	isi->notifier.ops = &mxc_isi_async_notifier_ops;
>  
>  	for (i = 0; i < isi->pdata->num_ports; ++i) {
> @@ -200,7 +200,7 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  		masd->port = i;
>  	}
>  
> -	ret = v4l2_async_nf_register(v4l2_dev, &isi->notifier);
> +	ret = v4l2_async_nf_register(&isi->notifier);
>  	if (ret < 0) {
>  		dev_err(isi->dev,
>  			"Failed to register async notifier: %d\n", ret);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index b89e2bb5b505e..f11dc59135a5a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1640,7 +1640,7 @@ static int camss_probe(struct platform_device *pdev)
>  		goto err_cleanup;
>  	}
>  
> -	v4l2_async_nf_init(&camss->notifier);
> +	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
>  
>  	num_subdevs = camss_of_parse_ports(camss);
>  	if (num_subdevs < 0) {
> @@ -1655,8 +1655,7 @@ static int camss_probe(struct platform_device *pdev)
>  	if (num_subdevs) {
>  		camss->notifier.ops = &camss_subdev_notifier_ops;
>  
> -		ret = v4l2_async_nf_register(&camss->v4l2_dev,
> -					     &camss->notifier);
> +		ret = v4l2_async_nf_register(&camss->notifier);
>  		if (ret) {
>  			dev_err(dev,
>  				"Failed to register async subdev nodes: %d\n",
> diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
> index 5d6d9ffb5201d..452d3b8da7e1c 100644
> --- a/drivers/media/platform/renesas/rcar-isp.c
> +++ b/drivers/media/platform/renesas/rcar-isp.c
> @@ -392,7 +392,7 @@ static int risp_parse_dt(struct rcar_isp *isp)
>  
>  	dev_dbg(isp->dev, "Found '%pOF'\n", to_of_node(fwnode));
>  
> -	v4l2_async_nf_init(&isp->notifier);
> +	v4l2_async_subdev_nf_init(&isp->notifier, &isp->subdev);
>  	isp->notifier.ops = &risp_notify_ops;
>  
>  	asd = v4l2_async_nf_add_fwnode(&isp->notifier, fwnode,
> @@ -401,7 +401,7 @@ static int risp_parse_dt(struct rcar_isp *isp)
>  	if (IS_ERR(asd))
>  		return PTR_ERR(asd);
>  
> -	ret = v4l2_async_subdev_nf_register(&isp->subdev, &isp->notifier);
> +	ret = v4l2_async_nf_register(&isp->notifier);
>  	if (ret)
>  		v4l2_async_nf_cleanup(&isp->notifier);
>  
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 498778eb9892b..65be0f4c88457 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -376,7 +376,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
>  
>  	mutex_unlock(&vin->group->lock);
>  
> -	v4l2_async_nf_init(&vin->group->notifier);
> +	v4l2_async_nf_init(&vin->group->notifier, &vin->v4l2_dev);
>  
>  	/*
>  	 * Some subdevices may overlap but the parser function can handle it and
> @@ -400,7 +400,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
>  		return 0;
>  
>  	vin->group->notifier.ops = &rvin_group_notify_ops;
> -	ret = v4l2_async_nf_register(&vin->v4l2_dev, &vin->group->notifier);
> +	ret = v4l2_async_nf_register(&vin->group->notifier);
>  	if (ret < 0) {
>  		vin_err(vin, "Notifier registration failed\n");
>  		v4l2_async_nf_cleanup(&vin->group->notifier);
> @@ -713,7 +713,7 @@ static int rvin_parallel_init(struct rvin_dev *vin)
>  {
>  	int ret;
>  
> -	v4l2_async_nf_init(&vin->notifier);
> +	v4l2_async_nf_init(&vin->notifier, &vin->v4l2_dev);
>  
>  	ret = rvin_parallel_parse_of(vin);
>  	if (ret)
> @@ -726,7 +726,7 @@ static int rvin_parallel_init(struct rvin_dev *vin)
>  		to_of_node(vin->parallel.asc->match.fwnode));
>  
>  	vin->notifier.ops = &rvin_parallel_notify_ops;
> -	ret = v4l2_async_nf_register(&vin->v4l2_dev, &vin->notifier);
> +	ret = v4l2_async_nf_register(&vin->notifier);
>  	if (ret < 0) {
>  		vin_err(vin, "Notifier registration failed\n");
>  		v4l2_async_nf_cleanup(&vin->notifier);
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> index de7b479df3a9d..21f8f4be0dfe5 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> @@ -1076,7 +1076,7 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
>  
>  	dev_dbg(priv->dev, "Found '%pOF'\n", to_of_node(fwnode));
>  
> -	v4l2_async_nf_init(&priv->notifier);
> +	v4l2_async_subdev_nf_init(&priv->notifier, &priv->subdev);
>  	priv->notifier.ops = &rcar_csi2_notify_ops;
>  
>  	asc = v4l2_async_nf_add_fwnode(&priv->notifier, fwnode,
> @@ -1085,7 +1085,7 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
>  	if (IS_ERR(asc))
>  		return PTR_ERR(asc);
>  
> -	ret = v4l2_async_subdev_nf_register(&priv->subdev, &priv->notifier);
> +	ret = v4l2_async_nf_register(&priv->notifier);
>  	if (ret)
>  		v4l2_async_nf_cleanup(&priv->notifier);
>  
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
> index 90fda730030d7..c7a925f421228 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -1207,7 +1207,7 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
>  	struct fwnode_handle *fwnode, *ep;
>  	struct v4l2_async_connection *asd;
>  
> -	v4l2_async_nf_init(notifier);
> +	v4l2_async_nf_init(&sdr->notifier, &sdr->v4l2_dev);
>  
>  	ep = fwnode_graph_get_next_endpoint(of_fwnode_handle(sdr->dev->of_node),
>  					    NULL);
> @@ -1341,7 +1341,7 @@ static int rcar_drif_sdr_probe(struct rcar_drif_sdr *sdr)
>  	sdr->notifier.ops = &rcar_drif_notify_ops;
>  
>  	/* Register notifier */
> -	ret = v4l2_async_nf_register(&sdr->v4l2_dev, &sdr->notifier);
> +	ret = v4l2_async_nf_register(&sdr->notifier);
>  	if (ret < 0) {
>  		dev_err(sdr->dev, "failed: notifier register ret %d\n", ret);
>  		goto cleanup;
> diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
> index be6140c93fc0c..c2215205fb3c3 100644
> --- a/drivers/media/platform/renesas/renesas-ceu.c
> +++ b/drivers/media/platform/renesas/renesas-ceu.c
> @@ -1667,7 +1667,7 @@ static int ceu_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto error_pm_disable;
>  
> -	v4l2_async_nf_init(&ceudev->notifier);
> +	v4l2_async_nf_init(&ceudev->notifier, &ceudev->v4l2_dev);
>  
>  	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
>  		ceu_data = of_device_get_match_data(dev);
> @@ -1689,7 +1689,7 @@ static int ceu_probe(struct platform_device *pdev)
>  
>  	ceudev->notifier.v4l2_dev	= &ceudev->v4l2_dev;
>  	ceudev->notifier.ops		= &ceu_notify_ops;
> -	ret = v4l2_async_nf_register(&ceudev->v4l2_dev, &ceudev->notifier);
> +	ret = v4l2_async_nf_register(&ceudev->notifier);
>  	if (ret)
>  		goto error_cleanup;
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index e026ed5337513..fdef43fd1895b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -183,7 +183,7 @@ static int rzg2l_cru_mc_parse_of_graph(struct rzg2l_cru_dev *cru)
>  {
>  	int ret;
>  
> -	v4l2_async_nf_init(&cru->notifier);
> +	v4l2_async_nf_init(&cru->notifier, &cru->v4l2_dev);
>  
>  	ret = rzg2l_cru_mc_parse_of(cru);
>  	if (ret)
> @@ -194,7 +194,7 @@ static int rzg2l_cru_mc_parse_of_graph(struct rzg2l_cru_dev *cru)
>  	if (list_empty(&cru->notifier.waiting_list))
>  		return 0;
>  
> -	ret = v4l2_async_nf_register(&cru->v4l2_dev, &cru->notifier);
> +	ret = v4l2_async_nf_register(&cru->notifier);
>  	if (ret < 0) {
>  		dev_err(cru->dev, "Notifier registration failed\n");
>  		v4l2_async_nf_cleanup(&cru->notifier);
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index f6bf4cdff28c2..7f6a37f835415 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -674,7 +674,7 @@ static int rzg2l_csi2_parse_dt(struct rzg2l_csi2 *csi2)
>  	fwnode = fwnode_graph_get_remote_endpoint(ep);
>  	fwnode_handle_put(ep);
>  
> -	v4l2_async_nf_init(&csi2->notifier);
> +	v4l2_async_subdev_nf_init(&csi2->notifier, &csi2->subdev);
>  	csi2->notifier.ops = &rzg2l_csi2_notify_ops;
>  
>  	asd = v4l2_async_nf_add_fwnode(&csi2->notifier, fwnode,
> @@ -683,7 +683,7 @@ static int rzg2l_csi2_parse_dt(struct rzg2l_csi2 *csi2)
>  	if (IS_ERR(asd))
>  		return PTR_ERR(asd);
>  
> -	ret = v4l2_async_subdev_nf_register(&csi2->subdev, &csi2->notifier);
> +	ret = v4l2_async_nf_register(&csi2->notifier);
>  	if (ret)
>  		v4l2_async_nf_cleanup(&csi2->notifier);
>  
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index eb88494c2a427..543fd377ab2a4 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -187,7 +187,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  	unsigned int index = 0;
>  	int ret = 0;
>  
> -	v4l2_async_nf_init(ntf);
> +	v4l2_async_nf_init(ntf, &rkisp1->v4l2_dev);
>  
>  	ntf->ops = &rkisp1_subdev_notifier_ops;
>  
> @@ -287,7 +287,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  	if (!index)
>  		dev_dbg(rkisp1->dev, "no remote subdevice found\n");
>  
> -	ret = v4l2_async_nf_register(&rkisp1->v4l2_dev, ntf);
> +	ret = v4l2_async_nf_register(ntf);
>  	if (ret) {
>  		v4l2_async_nf_cleanup(ntf);
>  		return ret;
> diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> index 59070616cb1bd..623e52440ccd2 100644
> --- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> @@ -1479,7 +1479,7 @@ static int fimc_md_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, fmd);
>  
> -	v4l2_async_nf_init(&fmd->subdev_notifier);
> +	v4l2_async_nf_init(&fmd->subdev_notifier, &fmd->v4l2_dev);
>  
>  	ret = fimc_md_register_platform_entities(fmd, dev->of_node);
>  	if (ret)
> @@ -1507,8 +1507,7 @@ static int fimc_md_probe(struct platform_device *pdev)
>  		fmd->subdev_notifier.ops = &subdev_notifier_ops;
>  		fmd->num_sensors = 0;
>  
> -		ret = v4l2_async_nf_register(&fmd->v4l2_dev,
> -					     &fmd->subdev_notifier);
> +		ret = v4l2_async_nf_register(&fmd->subdev_notifier);
>  		if (ret)
>  			goto err_clk_p;
>  	}
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 6d1197d4464e2..0e8f21602a066 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -1897,7 +1897,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
>  		return -EINVAL;
>  	}
>  
> -	v4l2_async_nf_init(&dcmi->notifier);
> +	v4l2_async_nf_init(&dcmi->notifier, &dcmi->v4l2_dev);
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&dcmi->notifier,
>  					      of_fwnode_handle(ep),
> @@ -1912,7 +1912,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
>  
>  	dcmi->notifier.ops = &dcmi_graph_notify_ops;
>  
> -	ret = v4l2_async_nf_register(&dcmi->v4l2_dev, &dcmi->notifier);
> +	ret = v4l2_async_nf_register(&dcmi->notifier);
>  	if (ret < 0) {
>  		dev_err(dcmi->dev, "Failed to register notifier\n");
>  		v4l2_async_nf_cleanup(&dcmi->notifier);
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index 38ca534842100..bb903e5ea35ea 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -122,7 +122,7 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
>  	struct fwnode_handle *ep;
>  	int ret;
>  
> -	v4l2_async_nf_init(&csi->notifier);
> +	v4l2_async_nf_init(&csi->notifier, &csi->v4l);
>  
>  	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
>  					     FWNODE_GRAPH_ENDPOINT_NEXT);
> @@ -240,7 +240,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unregister_media;
>  
> -	ret = v4l2_async_nf_register(&csi->v4l, &csi->notifier);
> +	ret = v4l2_async_nf_register(&csi->notifier);
>  	if (ret) {
>  		dev_err(csi->dev, "Couldn't register our notifier.\n");
>  		goto err_unregister_media;
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> index ebb725fc11ba5..0dcf605f2764b 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -819,7 +819,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
>  
>  	/* V4L2 Async */
>  
> -	v4l2_async_nf_init(notifier);
> +	v4l2_async_subdev_nf_init(notifier, subdev);
>  	notifier->ops = &sun6i_csi_bridge_notifier_ops;
>  
>  	sun6i_csi_bridge_source_setup(csi_dev, &bridge->source_parallel,
> @@ -829,9 +829,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
>  				      SUN6I_CSI_PORT_MIPI_CSI2, NULL);
>  
>  	if (csi_dev->isp_available)
> -		ret = v4l2_async_subdev_nf_register(subdev, notifier);
> +		ret = v4l2_async_nf_register(notifier);
>  	else
> -		ret = v4l2_async_nf_register(v4l2_dev, notifier);
> +		ret = v4l2_async_nf_register(notifier);
>  	if (ret) {
>  		dev_err(dev, "failed to register v4l2 async notifier: %d\n",
>  			ret);
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> index a78900dd0b7a6..adf966d2f5ca2 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> @@ -531,7 +531,7 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
>  
>  	/* V4L2 Async */
>  
> -	v4l2_async_nf_init(notifier);
> +	v4l2_async_subdev_nf_init(notifier, subdev);
>  	notifier->ops = &sun6i_mipi_csi2_notifier_ops;
>  
>  	ret = sun6i_mipi_csi2_bridge_source_setup(csi2_dev);
> @@ -540,7 +540,7 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
>  
>  	/* Only register the notifier when a sensor is connected. */
>  	if (ret != -ENODEV) {
> -		ret = v4l2_async_subdev_nf_register(subdev, notifier);
> +		ret = v4l2_async_nf_register(notifier);
>  		if (ret < 0)
>  			goto error_v4l2_notifier_cleanup;
>  
> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
> index 909aaef200989..50641d7af320d 100644
> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
> @@ -569,7 +569,7 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
>  
>  	/* V4L2 Async */
>  
> -	v4l2_async_nf_init(notifier);
> +	v4l2_async_subdev_nf_init(notifier, subdev);
>  	notifier->ops = &sun8i_a83t_mipi_csi2_notifier_ops;
>  
>  	ret = sun8i_a83t_mipi_csi2_bridge_source_setup(csi2_dev);
> @@ -578,7 +578,7 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
>  
>  	/* Only register the notifier when a sensor is connected. */
>  	if (ret != -ENODEV) {
> -		ret = v4l2_async_subdev_nf_register(subdev, notifier);
> +		ret = v4l2_async_nf_register(notifier);
>  		if (ret < 0)
>  			goto error_v4l2_notifier_cleanup;
>  
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 1457a188fea12..9ecd6b02467c8 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2300,7 +2300,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  
>  	dev_dbg(dev, "vpfe_get_pdata\n");
>  
> -	v4l2_async_nf_init(&vpfe->notifier);
> +	v4l2_async_nf_init(&vpfe->notifier, &vpfe->v4l2_dev);
>  
>  	if (!IS_ENABLED(CONFIG_OF) || !dev->of_node)
>  		return dev->platform_data;
> @@ -2466,7 +2466,7 @@ static int vpfe_probe(struct platform_device *pdev)
>  	}
>  
>  	vpfe->notifier.ops = &vpfe_async_ops;
> -	ret = v4l2_async_nf_register(&vpfe->v4l2_dev, &vpfe->notifier);
> +	ret = v4l2_async_nf_register(&vpfe->notifier);
>  	if (ret) {
>  		vpfe_err(vpfe, "Error registering async notifier\n");
>  		ret = -EINVAL;
> diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
> index bf7a985168c7b..25780e1f103e7 100644
> --- a/drivers/media/platform/ti/cal/cal.c
> +++ b/drivers/media/platform/ti/cal/cal.c
> @@ -895,7 +895,7 @@ static int cal_async_notifier_register(struct cal_dev *cal)
>  	unsigned int i;
>  	int ret;
>  
> -	v4l2_async_nf_init(&cal->notifier);
> +	v4l2_async_nf_init(&cal->notifier, &cal->v4l2_dev);
>  	cal->notifier.ops = &cal_async_notifier_ops;
>  
>  	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
> @@ -919,7 +919,7 @@ static int cal_async_notifier_register(struct cal_dev *cal)
>  		casd->phy = phy;
>  	}
>  
> -	ret = v4l2_async_nf_register(&cal->v4l2_dev, &cal->notifier);
> +	ret = v4l2_async_nf_register(&cal->notifier);
>  	if (ret) {
>  		cal_err(cal, "Error registering async notifier\n");
>  		goto error;
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
> index 9b97e26be0892..3f0b161ab50cf 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -1483,7 +1483,8 @@ static const struct v4l2_async_notifier_operations vpif_async_ops = {
>  };
>  
>  static struct vpif_capture_config *
> -vpif_capture_get_pdata(struct platform_device *pdev)
> +vpif_capture_get_pdata(struct platform_device *pdev,
> +		       struct v4l2_device *v4l2_dev)
>  {
>  	struct device_node *endpoint = NULL;
>  	struct device_node *rem = NULL;
> @@ -1492,7 +1493,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>  	struct vpif_capture_chan_config *chan;
>  	unsigned int i;
>  
> -	v4l2_async_nf_init(&vpif_obj.notifier);
> +	v4l2_async_nf_init(&vpif_obj.notifier, v4l2_dev);
>  
>  	/*
>  	 * DT boot: OF node from parent device contains
> @@ -1649,7 +1650,8 @@ static __init int vpif_probe(struct platform_device *pdev)
>  		goto vpif_unregister;
>  	}
>  
> -	pdev->dev.platform_data = vpif_capture_get_pdata(pdev);
> +	pdev->dev.platform_data =
> +		vpif_capture_get_pdata(pdev, &vpif_obj.v4l2_dev);
>  	if (!pdev->dev.platform_data) {
>  		dev_warn(&pdev->dev, "Missing platform data.  Giving up.\n");
>  		goto probe_subdev_out;
> @@ -1683,8 +1685,7 @@ static __init int vpif_probe(struct platform_device *pdev)
>  			goto probe_subdev_out;
>  	} else {
>  		vpif_obj.notifier.ops = &vpif_async_ops;
> -		err = v4l2_async_nf_register(&vpif_obj.v4l2_dev,
> -					     &vpif_obj.notifier);
> +		err = v4l2_async_nf_register(&vpif_obj.notifier);
>  		if (err) {
>  			vpif_err("Error registering async notifier\n");
>  			err = -EINVAL;
> diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> index 5b3266b214874..44ddc1422cc75 100644
> --- a/drivers/media/platform/ti/omap3isp/isp.c
> +++ b/drivers/media/platform/ti/omap3isp/isp.c
> @@ -2425,13 +2425,13 @@ static int isp_probe(struct platform_device *pdev)
>  
>  	isp->notifier.ops = &isp_subdev_notifier_ops;
>  
> -	v4l2_async_nf_init(&isp->notifier);
> +	v4l2_async_nf_init(&isp->notifier, &isp->v4l2_dev);
>  
>  	ret = isp_parse_of_endpoints(isp);
>  	if (ret < 0)
>  		goto error_register_entities;
>  
> -	ret = v4l2_async_nf_register(&isp->v4l2_dev, &isp->notifier);
> +	ret = v4l2_async_nf_register(&isp->notifier);
>  	if (ret)
>  		goto error_register_entities;
>  
> diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
> index e1dd798764312..315c65effe878 100644
> --- a/drivers/media/platform/video-mux.c
> +++ b/drivers/media/platform/video-mux.c
> @@ -360,7 +360,7 @@ static int video_mux_async_register(struct video_mux *vmux,
>  	unsigned int i;
>  	int ret;
>  
> -	v4l2_async_nf_init(&vmux->notifier);
> +	v4l2_async_subdev_nf_init(&vmux->notifier, &vmux->subdev);
>  
>  	for (i = 0; i < num_input_pads; i++) {
>  		struct v4l2_async_connection *asd;
> @@ -395,7 +395,7 @@ static int video_mux_async_register(struct video_mux *vmux,
>  
>  	vmux->notifier.ops = &video_mux_notify_ops;
>  
> -	ret = v4l2_async_subdev_nf_register(&vmux->subdev, &vmux->notifier);
> +	ret = v4l2_async_nf_register(&vmux->notifier);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index 6bb426a25fe90..4285770fde184 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -494,7 +494,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
>  		goto done;
>  	}
>  
> -	v4l2_async_nf_init(&xdev->notifier);
> +	v4l2_async_nf_init(&xdev->notifier, &xdev->v4l2_dev);
>  
>  	/* Parse the graph to extract a list of subdevice DT nodes. */
>  	ret = xvip_graph_parse(xdev);
> @@ -512,7 +512,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
>  	/* Register the subdevices notifier. */
>  	xdev->notifier.ops = &xvip_graph_notify_ops;
>  
> -	ret = v4l2_async_nf_register(&xdev->v4l2_dev, &xdev->notifier);
> +	ret = v4l2_async_nf_register(&xdev->notifier);
>  	if (ret < 0) {
>  		dev_err(xdev->dev, "notifier registration failed\n");
>  		goto done;
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 12b465a16ec1c..bb172cc18998a 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -558,13 +558,24 @@ static int v4l2_async_nf_match_valid(struct v4l2_async_notifier *notifier,
>  	return 0;
>  }
>  
> -void v4l2_async_nf_init(struct v4l2_async_notifier *notifier)
> +void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
> +			struct v4l2_device *v4l2_dev)
>  {
>  	INIT_LIST_HEAD(&notifier->waiting_list);
>  	INIT_LIST_HEAD(&notifier->done_list);
> +	notifier->v4l2_dev = v4l2_dev;
>  }
>  EXPORT_SYMBOL(v4l2_async_nf_init);
>  
> +void v4l2_async_subdev_nf_init(struct v4l2_async_notifier *notifier,
> +			       struct v4l2_subdev *sd)
> +{
> +	INIT_LIST_HEAD(&notifier->waiting_list);
> +	INIT_LIST_HEAD(&notifier->done_list);
> +	notifier->sd = sd;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_async_subdev_nf_init);
> +
>  static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  {
>  	struct v4l2_async_connection *asc;
> @@ -605,16 +616,13 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	return ret;
>  }
>  
> -int v4l2_async_nf_register(struct v4l2_device *v4l2_dev,
> -			   struct v4l2_async_notifier *notifier)
> +int v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  {
>  	int ret;
>  
> -	if (WARN_ON(!v4l2_dev || notifier->sd))
> +	if (WARN_ON(!notifier->v4l2_dev == !notifier->sd))
>  		return -EINVAL;
>  
> -	notifier->v4l2_dev = v4l2_dev;
> -
>  	ret = __v4l2_async_nf_register(notifier);
>  	if (ret)
>  		notifier->v4l2_dev = NULL;
> @@ -623,24 +631,6 @@ int v4l2_async_nf_register(struct v4l2_device *v4l2_dev,
>  }
>  EXPORT_SYMBOL(v4l2_async_nf_register);
>  
> -int v4l2_async_subdev_nf_register(struct v4l2_subdev *sd,
> -				  struct v4l2_async_notifier *notifier)
> -{
> -	int ret;
> -
> -	if (WARN_ON(!sd || notifier->v4l2_dev))
> -		return -EINVAL;
> -
> -	notifier->sd = sd;
> -
> -	ret = __v4l2_async_nf_register(notifier);
> -	if (ret)
> -		notifier->sd = NULL;
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(v4l2_async_subdev_nf_register);
> -
>  static void
>  __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
>  {
> @@ -649,9 +639,6 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
>  
>  	v4l2_async_nf_unbind_all_subdevs(notifier);
>  
> -	notifier->sd = NULL;
> -	notifier->v4l2_dev = NULL;
> -
>  	list_del(&notifier->notifier_entry);
>  }
>  
> @@ -683,6 +670,9 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
>  
>  		kfree(asc);
>  	}
> +
> +	notifier->sd = NULL;
> +	notifier->v4l2_dev = NULL;
>  }
>  
>  void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 7c3e1648a0f49..dc5df557c3b33 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -1205,7 +1205,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>  	if (!notifier)
>  		return -ENOMEM;
>  
> -	v4l2_async_nf_init(notifier);
> +	v4l2_async_subdev_nf_init(notifier, sd);
>  
>  	ret = v4l2_subdev_get_privacy_led(sd);
>  	if (ret < 0)
> @@ -1215,7 +1215,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>  	if (ret < 0)
>  		goto out_cleanup;
>  
> -	ret = v4l2_async_subdev_nf_register(sd, notifier);
> +	ret = v4l2_async_nf_register(notifier);
>  	if (ret < 0)
>  		goto out_cleanup;
>  
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> index 58c8c7813e0f9..31b2b48085c59 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> @@ -507,7 +507,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
>  		struct fwnode_handle *fwnode =
>  			of_fwnode_handle(subdev_entity->epn);
>  
> -		v4l2_async_nf_init(&subdev_entity->notifier);
> +		v4l2_async_nf_init(&subdev_entity->notifier, &isc->v4l2_dev);
>  
>  		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
>  						      fwnode,
> @@ -523,8 +523,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
>  
>  		subdev_entity->notifier.ops = &atmel_isc_async_ops;
>  
> -		ret = v4l2_async_nf_register(&isc->v4l2_dev,
> -					     &subdev_entity->notifier);
> +		ret = v4l2_async_nf_register(&subdev_entity->notifier);
>  		if (ret) {
>  			dev_err(dev, "fail to register async notifier\n");
>  			goto cleanup_subdev;
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> index f10ddee0949e1..020034f631f57 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> @@ -497,7 +497,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
>  		struct fwnode_handle *fwnode =
>  			of_fwnode_handle(subdev_entity->epn);
>  
> -		v4l2_async_nf_init(&subdev_entity->notifier);
> +		v4l2_async_nf_init(&subdev_entity->notifier, &isc->v4l2_dev);
>  
>  		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
>  						      fwnode,
> @@ -513,8 +513,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
>  
>  		subdev_entity->notifier.ops = &atmel_isc_async_ops;
>  
> -		ret = v4l2_async_nf_register(&isc->v4l2_dev,
> -					     &subdev_entity->notifier);
> +		ret = v4l2_async_nf_register(&subdev_entity->notifier);
>  		if (ret) {
>  			dev_err(dev, "fail to register async notifier\n");
>  			goto cleanup_subdev;
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 09b8b396022e0..dda1ebc34692a 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1918,7 +1918,7 @@ static int imx_csi_async_register(struct csi_priv *priv)
>  	unsigned int port;
>  	int ret;
>  
> -	v4l2_async_nf_init(&priv->notifier);
> +	v4l2_async_subdev_nf_init(&priv->notifier, &priv->sd);
>  
>  	/* get this CSI's port id */
>  	ret = fwnode_property_read_u32(dev_fwnode(priv->dev), "reg", &port);
> @@ -1944,7 +1944,7 @@ static int imx_csi_async_register(struct csi_priv *priv)
>  
>  	priv->notifier.ops = &csi_notify_ops;
>  
> -	ret = v4l2_async_subdev_nf_register(&priv->sd, &priv->notifier);
> +	ret = v4l2_async_nf_register(&priv->notifier);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
> index 67c1b16db6558..46bf717255b3e 100644
> --- a/drivers/staging/media/imx/imx-media-dev-common.c
> +++ b/drivers/staging/media/imx/imx-media-dev-common.c
> @@ -367,7 +367,7 @@ struct imx_media_dev *imx_media_dev_init(struct device *dev,
>  
>  	INIT_LIST_HEAD(&imxmd->vdev_list);
>  
> -	v4l2_async_nf_init(&imxmd->notifier);
> +	v4l2_async_nf_init(&imxmd->notifier, &imxmd->v4l2_dev);
>  
>  	return imxmd;
>  
> @@ -391,7 +391,7 @@ int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
>  
>  	/* prepare the async subdev notifier and register it */
>  	imxmd->notifier.ops = ops ? ops : &imx_media_notifier_ops;
> -	ret = v4l2_async_nf_register(&imxmd->v4l2_dev, &imxmd->notifier);
> +	ret = v4l2_async_nf_register(&imxmd->notifier);
>  	if (ret) {
>  		v4l2_err(&imxmd->v4l2_dev,
>  			 "v4l2_async_nf_register failed with %d\n", ret);
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index 2e86f82ad70cd..50f1df09c0a73 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -635,7 +635,7 @@ static int csi2_async_register(struct csi2_dev *csi2)
>  	struct fwnode_handle *ep;
>  	int ret;
>  
> -	v4l2_async_nf_init(&csi2->notifier);
> +	v4l2_async_subdev_nf_init(&csi2->notifier, &csi2->sd);
>  
>  	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi2->dev), 0, 0,
>  					     FWNODE_GRAPH_ENDPOINT_NEXT);
> @@ -660,7 +660,7 @@ static int csi2_async_register(struct csi2_dev *csi2)
>  
>  	csi2->notifier.ops = &csi2_notify_ops;
>  
> -	ret = v4l2_async_subdev_nf_register(&csi2->sd, &csi2->notifier);
> +	ret = v4l2_async_nf_register(&csi2->notifier);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> index 2f723ad34c2c5..6813c44b71039 100644
> --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> @@ -592,7 +592,7 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  	unsigned int i;
>  	int ret;
>  
> -	v4l2_async_nf_init(&state->notifier);
> +	v4l2_async_subdev_nf_init(&state->notifier, &state->sd);
>  
>  	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
>  					     FWNODE_GRAPH_ENDPOINT_NEXT);
> @@ -629,7 +629,7 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  
>  	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
>  
> -	ret = v4l2_async_subdev_nf_register(&state->sd, &state->notifier);
> +	ret = v4l2_async_nf_register(&state->notifier);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> index dd7dfecb9ef33..ccbb530aa2e23 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> @@ -536,7 +536,7 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp_dev)
>  
>  	/* V4L2 Async */
>  
> -	v4l2_async_nf_init(notifier);
> +	v4l2_async_nf_init(notifier, v4l2_dev);
>  	notifier->ops = &sun6i_isp_proc_notifier_ops;
>  
>  	sun6i_isp_proc_source_setup(isp_dev, &proc->source_csi0,
> @@ -544,7 +544,7 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp_dev)
>  	sun6i_isp_proc_source_setup(isp_dev, &proc->source_csi1,
>  				    SUN6I_ISP_PORT_CSI1);
>  
> -	ret = v4l2_async_nf_register(v4l2_dev, notifier);
> +	ret = v4l2_async_nf_register(notifier);
>  	if (ret) {
>  		v4l2_err(v4l2_dev,
>  			 "failed to register v4l2 async notifier: %d\n", ret);
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 146b4fd3c8b52..f31d8babf499c 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1280,7 +1280,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
>  	}
>  
>  	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> -		v4l2_async_nf_init(&chan->notifier);
> +		v4l2_async_nf_init(&chan->notifier, &vid->v4l2_dev);
>  
>  	return 0;
>  
> @@ -1880,7 +1880,7 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
>  			continue;
>  
>  		chan->notifier.ops = &tegra_vi_async_ops;
> -		ret = v4l2_async_nf_register(&vid->v4l2_dev, &chan->notifier);
> +		ret = v4l2_async_nf_register(&chan->notifier);
>  		if (ret < 0) {
>  			dev_err(vi->dev,
>  				"failed to register channel %d notifier: %d\n",
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index d0bef6626e043..65e364d4033a4 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -146,13 +146,30 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
>   * v4l2_async_nf_init - Initialize a notifier.
>   *
>   * @notifier: pointer to &struct v4l2_async_notifier
> + * @v4l2_dev: pointer to &struct v4l2_device
> + *
> + * This function initializes the notifier @asc_entry. It must be called
> + * before adding a subdevice to a notifier, using one of:
> + * v4l2_async_nf_add_fwnode_remote(),
> + * v4l2_async_nf_add_fwnode() or
> + * v4l2_async_nf_add_i2c().
> + */
> +void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
> +			struct v4l2_device *v4l2_dev);
> +
> +/**
> + * v4l2_async_subdev_nf_init - Initialize a sub-device notifier.
> + *
> + * @notifier: pointer to &struct v4l2_async_notifier
> + * @sd: pointer to &struct v4l2_subdev
>   *
>   * This function initializes the notifier @asc_entry. It must be called
>   * before adding a subdevice to a notifier, using one of:
>   * v4l2_async_nf_add_fwnode_remote(), v4l2_async_nf_add_fwnode() or
>   * v4l2_async_nf_add_i2c().
>   */
> -void v4l2_async_nf_init(struct v4l2_async_notifier *notifier);
> +void v4l2_async_subdev_nf_init(struct v4l2_async_notifier *notifier,
> +			       struct v4l2_subdev *sd);
>  
>  struct v4l2_async_connection *
>  __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
> @@ -257,21 +274,9 @@ v4l2_async_connection_unique(struct v4l2_subdev *sd);
>  /**
>   * v4l2_async_nf_register - registers a subdevice asynchronous notifier
>   *
> - * @v4l2_dev: pointer to &struct v4l2_device
> - * @notifier: pointer to &struct v4l2_async_notifier
> - */
> -int v4l2_async_nf_register(struct v4l2_device *v4l2_dev,
> -			   struct v4l2_async_notifier *notifier);
> -
> -/**
> - * v4l2_async_subdev_nf_register - registers a subdevice asynchronous
> - *					 notifier for a sub-device
> - *
> - * @sd: pointer to &struct v4l2_subdev
>   * @notifier: pointer to &struct v4l2_async_notifier
>   */
> -int v4l2_async_subdev_nf_register(struct v4l2_subdev *sd,
> -				  struct v4l2_async_notifier *notifier);
> +int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
>  
>  /**
>   * v4l2_async_nf_unregister - unregisters a subdevice

-- 
Regards,

Laurent Pinchart
