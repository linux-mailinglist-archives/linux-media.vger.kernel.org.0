Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3AF26ED95C
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232106AbjDYAfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjDYAfS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:35:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5BE59CA
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:35:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD9E84FE;
        Tue, 25 Apr 2023 02:35:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682382904;
        bh=EKP7tUekQEerVFeOFWWcx2nzLNqz+1AgQY1MQQOwEFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JoInP6GK75654ib719sxJu3Dw99t2jsbRugnkjPiKO527OBhhwZgwxFwBE3cDEjbJ
         0/yJzlXotuQ+zMSKBA8DT/qZ1GA098Iegi5i3NOzGoZUO8RHN5/4Yr1Cl6xGFoS4ao
         F83Pl51Ebhi8Z6hN1FqZDg1Q6Nac8VDjNcwnl77M=
Date:   Tue, 25 Apr 2023 03:35:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 17/18] media: v4l: async: Set v4l2_device in async
 notifier init
Message-ID: <20230425003526.GD4921@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-18-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-18-sakari.ailus@linux.intel.com>
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

On Thu, Mar 30, 2023 at 02:58:52PM +0300, Sakari Ailus wrote:
> Set the v4l2_device already in async notifier init, so struct device
> related to it will be available before the notifier is registered.
> 
> This patch has been mostly generated using the following command:
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

You should learn coccinelle at some point :-)

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
>  drivers/media/v4l2-core/v4l2-async.c          | 43 +++++++------------
>  drivers/media/v4l2-core/v4l2-fwnode.c         |  4 +-
>  .../deprecated/atmel/atmel-sama5d2-isc.c      |  5 +--
>  drivers/staging/media/imx/imx-media-csi.c     |  4 +-
>  .../staging/media/imx/imx-media-dev-common.c  |  4 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |  4 +-
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c  |  4 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  4 +-
>  drivers/staging/media/tegra-video/vi.c        |  4 +-
>  include/media/v4l2-async.h                    | 35 +++++++++------
>  46 files changed, 129 insertions(+), 138 deletions(-)

[snip]

> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 750bf4ddb267..cf2082e17fc4 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -159,6 +159,24 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
>  /**
>   * v4l2_async_nf_init - Initialize a notifier.
>   *
> + * @v4l2_dev: pointer to &struct v4l2_device
> + * @notifier: pointer to &struct v4l2_async_notifier
> + *
> + * This function initializes the notifier @asc_list. It must be called
> + * before adding a subdevice to a notifier, using one of:
> + * v4l2_async_nf_add_fwnode_remote(),
> + * v4l2_async_nf_add_fwnode(),
> + * v4l2_async_nf_add_i2c(),
> + * __v4l2_async_nf_add_connection() or
> + * v4l2_async_nf_parse_fwnode_endpoints().
> + */
> +void v4l2_async_nf_init(struct v4l2_device *v4l2_dev,
> +			struct v4l2_async_notifier *notifier);

The function operates on a notifier, could we make it the first argument
? Same for v4l2_async_subdev_nf_init().

> +
> +/**
> + * v4l2_async_subdev_nf_init - Initialize a sub-device notifier.
> + *
> + * @v4l2_dev: pointer to &struct v4l2_device
>   * @notifier: pointer to &struct v4l2_async_notifier
>   *
>   * This function initializes the notifier @asc_list. It must be called
> @@ -169,7 +187,8 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
>   * __v4l2_async_nf_add_connection() or
>   * v4l2_async_nf_parse_fwnode_endpoints().
>   */
> -void v4l2_async_nf_init(struct v4l2_async_notifier *notifier);
> +void v4l2_async_subdev_nf_init(struct v4l2_subdev *sd,
> +			       struct v4l2_async_notifier *notifier);
>  
>  /**
>   * __v4l2_async_nf_add_connection() - Add an async subdev to the notifier's
> @@ -264,21 +283,9 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
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
