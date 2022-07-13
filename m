Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CADE8573D21
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 21:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236277AbiGMTcw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 15:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiGMTcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 15:32:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E352A733
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 12:32:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BB12305;
        Wed, 13 Jul 2022 21:32:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657740768;
        bh=29XCygPLGQbNpPtvNUk3g7ZjooYPpViNNZc6ia/RWO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hdOiXpOp18llXc66e3sE8hKJp8e68yaxj3QriThKL7IkCma3PMl1rMv68izpKssrx
         KPeYxs6DkuUMjZFjxDhBkfyXTqtQ4XX8iKnUfX7aFaFzh5Z/cGvnLa2+2C3fYL1VgE
         I+SlFCGBfL0ukGrZ+v/Or+oiA3xvDiZ7/sOZhb+U=
Date:   Wed, 13 Jul 2022 22:32:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/1] media: sunxi: Depend on GENERIC_PHY_MIPI_DPHY
Message-ID: <Ys8dwhnoH3EjArwM@pendragon.ideasonboard.com>
References: <20220713192540.222794-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220713192540.222794-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Jul 13, 2022 at 10:25:40PM +0300, Sakari Ailus wrote:
> The sun6i-mipi-csi2 and sun6i-a83t-mipi-csi2 drivers depend on the generic
> MIPI D-PHY support. Select it. This fixes a linking problem when either of
> these drivers is enabled and GENERIC_PHY_MIPI_DPHY is disabled.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig      | 1 +
>  drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> index b1712f5873fd9..eb982466abd30 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> @@ -8,6 +8,7 @@ config VIDEO_SUN6I_MIPI_CSI2
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
>  	select PHY_SUN6I_MIPI_DPHY
> +	select GENERIC_PHY_MIPI_DPHY
>  	select REGMAP_MMIO
>  	help
>  	   Support for the Allwinner A31 MIPI CSI-2 controller, also found on
> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
> index 5854f8388c92a..789d58ee12ea9 100644
> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
> @@ -8,5 +8,6 @@ config VIDEO_SUN8I_A83T_MIPI_CSI2
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
>  	select REGMAP_MMIO
> +	select GENERIC_PHY_MIPI_DPHY
>  	help
>  	   Support for the Allwinner A83T MIPI CSI-2 controller and D-PHY.

-- 
Regards,

Laurent Pinchart
