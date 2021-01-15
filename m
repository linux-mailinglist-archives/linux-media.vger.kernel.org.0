Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4469B2F7611
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 10:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730748AbhAOJ6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 04:58:19 -0500
Received: from mga04.intel.com ([192.55.52.120]:51075 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731207AbhAOJ6M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 04:58:12 -0500
IronPort-SDR: ovrD9Pgq4wEPjBXQu8ABfF7pxnBMsXcAndR9Ir2ib7XvuKBeJ51Z6PQIwauByhXF4Q2zp9IGOD
 ZsyHGeu+NT8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="175947763"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="175947763"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 01:56:26 -0800
IronPort-SDR: 4KDf9o6O2xId+qLPl4cBxvTiFGRpCY0JIdXAOMS5EIV5G5xUItnColLKEZ/xfCa2M1gjB/oK7p
 ZsLxkPdbVmxg==
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="349443530"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 01:56:24 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8FAE5206A9; Fri, 15 Jan 2021 11:56:21 +0200 (EET)
Date:   Fri, 15 Jan 2021 11:56:21 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-async: Improve
 v4l2_async_notifier_add_*_subdev() API
Message-ID: <20210115095621.GQ11878@paasikivi.fi.intel.com>
References: <20210114030719.28172-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114030719.28172-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the patch. It's a really nice improvement.

On Thu, Jan 14, 2021 at 05:07:19AM +0200, Laurent Pinchart wrote:
> The functions that add an async subdev to an async subdev notifier take
> as an argument the size of the container structure they need to
> allocate. This is error prone, as passing an invalid size will not be
> caught by the compiler. Wrap those functions in macros that take a
> container type instead of a size, and cast the returned pointer to the
> desired type. The compiler will catch mistakes if the incorrect type is
> passed to the macro, as the assignment types won't match.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> 
> This patch is based on top of Ezequiel's "[PATCH 00/13] V4L2 Async
> notifier API cleanup" series. It makes errors such as the one fixed by
> "[PATCH] media: ti-vpe: cal: fix write to unallocated memory" impossible
> to occur in the first place.
> 
>  drivers/media/i2c/max9286.c                   |  2 +-
>  drivers/media/i2c/st-mipid02.c                |  2 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c      | 10 ++---
>  drivers/media/platform/am437x/am437x-vpfe.c   |  2 +-
>  drivers/media/platform/atmel/atmel-isi.c      |  2 +-
>  .../media/platform/atmel/atmel-sama5d2-isc.c  |  2 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c  |  3 +-
>  drivers/media/platform/davinci/vpif_capture.c |  2 +-
>  drivers/media/platform/exynos4-is/media-dev.c |  3 +-
>  .../media/platform/marvell-ccic/cafe-driver.c |  2 +-
>  .../media/platform/marvell-ccic/mmp-driver.c  |  4 +-
>  drivers/media/platform/omap3isp/isp.c         | 16 +++-----
>  drivers/media/platform/pxa_camera.c           |  4 +-
>  drivers/media/platform/qcom/camss/camss.c     | 11 ++----
>  drivers/media/platform/rcar-vin/rcar-core.c   |  5 ++-
>  drivers/media/platform/rcar-vin/rcar-csi2.c   |  2 +-
>  drivers/media/platform/rcar_drif.c            |  2 +-
>  drivers/media/platform/renesas-ceu.c          | 20 ++++------
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 10 ++---
>  drivers/media/platform/stm32/stm32-dcmi.c     |  3 +-
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  4 +-
>  drivers/media/platform/ti-vpe/cal.c           | 12 +++---
>  drivers/media/platform/video-mux.c            |  2 +-
>  drivers/media/platform/xilinx/xilinx-vipp.c   | 10 ++---
>  drivers/media/v4l2-core/v4l2-async.c          | 38 +++++++++----------
>  drivers/media/v4l2-core/v4l2-fwnode.c         |  4 +-
>  drivers/staging/media/imx/imx-media-csi.c     |  2 +-
>  drivers/staging/media/imx/imx-media-of.c      |  2 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |  2 +-
>  drivers/staging/media/imx/imx7-media-csi.c    |  2 +-
>  drivers/staging/media/imx/imx7-mipi-csis.c    |  2 +-
>  drivers/staging/media/tegra-video/vi.c        | 10 ++---
>  include/media/v4l2-async.h                    | 36 ++++++++++++------
>  33 files changed, 116 insertions(+), 117 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index c82c1493e099..c31858548d34 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -580,7 +580,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
>  
>  		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
>  							    source->fwnode,
> -							    sizeof(*asd));
> +							    struct v4l2_async_subdev);

Would it be possible to use *asd here instead?

You'd need typeof(), too.

Same for the rest.

-- 
Kind regards,

Sakari Ailus
