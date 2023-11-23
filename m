Return-Path: <linux-media+bounces-909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C049F7F61D7
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 15:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49C86281FA3
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659AC2E828;
	Thu, 23 Nov 2023 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wZlqJmQ5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27876D40
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 06:46:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AE55A06;
	Thu, 23 Nov 2023 15:45:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700750741;
	bh=a4mLPEP8W1sLYy88OW0yvIbzJW7ITBKuKZT2Yf0ENS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wZlqJmQ5UOji8i2Cfp//A1kiidqReNe7qkDadGHRvQriHFKXu232kq8QF6zJIDghi
	 9wrNdevr18T+Zk2l1G7tRR4eY9MC5+/5Vg6a5aX5IfpW5SnompMy4CdmOwHgvnbf8x
	 opYnJebjGWnSpVyqeyYAUn500AUzJqFktOJCi6MY=
Date: Thu, 23 Nov 2023 16:46:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.8] V4L2 subdev state cleanups and refactoring
Message-ID: <20231123144620.GB3381@pendragon.ideasonboard.com>
References: <ZVdoqEE24Mi4k-Ra@valkosipuli.retiisi.eu>
 <20231123132919.5fa59a0f@coco.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231123132919.5fa59a0f@coco.lan>

Hi Mauro,

On Thu, Nov 23, 2023 at 01:29:19PM +0100, Mauro Carvalho Chehab wrote:
> Em Fri, 17 Nov 2023 13:20:40 +0000 Sakari Ailus escreveu:
> 
> > Hi Mauro, Hans,
> > 
> > I've split the large PR into two smaller ones, this one contains the
> > sub-device state cleanups and refactoring that affect a large number of
> > sub-device drivers as well as the V4L2 sub-device framework.
> > 
> > Please pull.
> 
> Hmm... patch 6 on this series is broken. Could you please rebase on the
> top of upstream?
> 
> $ git diff drivers/media/i2c/ov6650.c
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index 38d21b40f5d8..9852790e7698 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -531,6 +531,16 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
>         ov6650_bind_align_crop_rectangle(&sel->r);
>  
>         if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
> +<<<<<<<
> +=======
> +               struct v4l2_rect *crop =
> +                       v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> +               struct v4l2_mbus_framefmt *mf =
> +                       v4l2_subdev_get_pad_format(sd, sd_state, 0);
> +               /* detect current pad config scaling factor */
> +               bool half_scale = !is_unscaled_ok(mf->width, mf->height, crop);
> +
> +>>>>>>>
>                 struct v4l2_rect *crop =
>                         v4l2_subdev_get_pad_crop(sd, sd_state, 0);
>                 struct v4l2_mbus_framefmt *mf =
> @@ -592,6 +602,13 @@ static int ov6650_get_fmt(struct v4l2_subdev *sd,
>         if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>                 struct v4l2_mbus_framefmt *try_fmt =
>                         v4l2_subdev_get_pad_format(sd, sd_state, 0);
> +<<<<<<<
> +=======
> +
> +               mf->width = try_fmt->width;
> +               mf->height = try_fmt->height;
> +               mf->code = try_fmt->code;
> +>>>>>>>
>  
>                 mf->width = try_fmt->width;
>                 mf->height = try_fmt->height;

I'm not sure where this comes from, I do't see those in Sakari's pull
request. It merges cleanly in the stage tree's master branch for me, and
I don't see any conflict marker in the code.

> > The following changes since commit 1865913dd590ca6d5e3207b15099a1210dd62f29:
> > 
> >   media: meson-ir-tx: Drop usage of platform_driver_probe() (2023-11-16 13:56:48 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/sailus/media_tree.git tags/for-6.8-2.1-signed
> > 
> > for you to fetch changes up to 2fc528c2f73ec378ba7af7007856e245364bec6a:
> > 
> >   media: v4l: subdev: Return NULL from pad access functions on error (2023-11-17 15:17:53 +0200)
> > 
> > ----------------------------------------------------------------
> > V4L2 patches for 6.8
> > 
> > ----------------------------------------------------------------
> > Laurent Pinchart (15):
> >       media: atmel-isi: Use accessors for pad config 'try_*' fields
> >       media: microchip-isc: Use accessors for pad config 'try_*' fields
> >       media: atmel-isc: Use accessors for pad config 'try_*' fields
> >       media: atomisp: Use accessors for pad config 'try_*' fields
> >       media: tegra-video: Use accessors for pad config 'try_*' fields
> >       media: i2c: Use accessors for pad config 'try_*' fields
> >       media: v4l2-subdev: Rename pad config 'try_*' fields
> >       media: v4l2-subdev: Drop outdated comment for v4l2_subdev_pad_config
> >       media: ipu3-cio2: Drop comment blocks for subdev op handlers
> >       media: xilinx: csi2rxss: Drop comment blocks for subdev op handlers
> >       media: v4l2-subdev: Fix references to pad config
> >       media: qcom: camss: Fix references to pad config
> >       media: ti: omap3isp: Fix references to pad config
> >       media: ti: omap4iss: Fix references to pad config
> >       media: i2c: Fix references to pad config
> > 
> > Sakari Ailus (9):
> >       media: v4l: subdev: Store the sub-device in the sub-device state
> >       media: v4l: subdev: Also return pads array information on stream functions
> >       media: v4l: subdev: Rename sub-device state information access functions
> >       media: v4l: subdev: v4l2_subdev_state_get_format always returns format now
> >       media: v4l: subdev: Make stream argument optional in state access functions
> >       media: v4l: subdev: Always compile sub-device state access functions
> >       media: v4l: subdev: Switch to stream-aware state functions
> >       media: v4l: subdev: Remove stream-unaware sub-device state access
> >       media: v4l: subdev: Return NULL from pad access functions on error
> > 
> >  Documentation/driver-api/media/v4l2-subdev.rst     |   4 +-
> >  drivers/media/i2c/adv7180.c                        |   4 +-
> >  drivers/media/i2c/adv7183.c                        |   2 +-
> >  drivers/media/i2c/adv748x/adv748x-afe.c            |   6 +-
> >  drivers/media/i2c/adv748x/adv748x-csi2.c           |   2 +-
> >  drivers/media/i2c/adv748x/adv748x-hdmi.c           |   6 +-
> >  drivers/media/i2c/adv7511-v4l2.c                   |   4 +-
> >  drivers/media/i2c/adv7604.c                        |   4 +-
> >  drivers/media/i2c/adv7842.c                        |   4 +-
> >  drivers/media/i2c/ar0521.c                         |   5 +-
> >  drivers/media/i2c/ccs/ccs-core.c                   |  22 +-
> >  drivers/media/i2c/ds90ub913.c                      |   3 +-
> >  drivers/media/i2c/ds90ub953.c                      |   3 +-
> >  drivers/media/i2c/ds90ub960.c                      |  12 +-
> >  drivers/media/i2c/et8ek8/et8ek8_driver.c           |   3 +-
> >  drivers/media/i2c/hi556.c                          |  13 +-
> >  drivers/media/i2c/hi846.c                          |  11 +-
> >  drivers/media/i2c/hi847.c                          |   9 +-
> >  drivers/media/i2c/imx208.c                         |   9 +-
> >  drivers/media/i2c/imx214.c                         |   4 +-
> >  drivers/media/i2c/imx219.c                         |  12 +-
> >  drivers/media/i2c/imx258.c                         |   9 +-
> >  drivers/media/i2c/imx274.c                         |  12 +-
> >  drivers/media/i2c/imx290.c                         |   8 +-
> >  drivers/media/i2c/imx296.c                         |  18 +-
> >  drivers/media/i2c/imx319.c                         |   7 +-
> >  drivers/media/i2c/imx334.c                         |  12 +-
> >  drivers/media/i2c/imx335.c                         |  12 +-
> >  drivers/media/i2c/imx355.c                         |   7 +-
> >  drivers/media/i2c/imx412.c                         |  12 +-
> >  drivers/media/i2c/imx415.c                         |   6 +-
> >  drivers/media/i2c/isl7998x.c                       |   6 +-
> >  drivers/media/i2c/max9286.c                        |   4 +-
> >  drivers/media/i2c/mt9m001.c                        |   6 +-
> >  drivers/media/i2c/mt9m111.c                        |   6 +-
> >  drivers/media/i2c/mt9m114.c                        |  58 +++---
> >  drivers/media/i2c/mt9p031.c                        |   6 +-
> >  drivers/media/i2c/mt9t112.c                        |   2 +-
> >  drivers/media/i2c/mt9v011.c                        |   2 +-
> >  drivers/media/i2c/mt9v032.c                        |  10 +-
> >  drivers/media/i2c/mt9v111.c                        |   4 +-
> >  drivers/media/i2c/og01a1b.c                        |  10 +-
> >  drivers/media/i2c/ov01a10.c                        |   2 +-
> >  drivers/media/i2c/ov02a10.c                        |   6 +-
> >  drivers/media/i2c/ov08d10.c                        |   9 +-
> >  drivers/media/i2c/ov08x40.c                        |   7 +-
> >  drivers/media/i2c/ov13858.c                        |  10 +-
> >  drivers/media/i2c/ov13b10.c                        |  10 +-
> >  drivers/media/i2c/ov2640.c                         |   6 +-
> >  drivers/media/i2c/ov2659.c                         |   6 +-
> >  drivers/media/i2c/ov2680.c                         |  10 +-
> >  drivers/media/i2c/ov2685.c                         |   4 +-
> >  drivers/media/i2c/ov2740.c                         |   4 +-
> >  drivers/media/i2c/ov4689.c                         |   2 +-
> >  drivers/media/i2c/ov5640.c                         |   9 +-
> >  drivers/media/i2c/ov5645.c                         |   4 +-
> >  drivers/media/i2c/ov5647.c                         |  12 +-
> >  drivers/media/i2c/ov5648.c                         |   6 +-
> >  drivers/media/i2c/ov5670.c                         |  13 +-
> >  drivers/media/i2c/ov5675.c                         |   9 +-
> >  drivers/media/i2c/ov5693.c                         |   4 +-
> >  drivers/media/i2c/ov5695.c                         |   8 +-
> >  drivers/media/i2c/ov6650.c                         |  34 ++--
> >  drivers/media/i2c/ov7251.c                         |   4 +-
> >  drivers/media/i2c/ov7670.c                         |   7 +-
> >  drivers/media/i2c/ov772x.c                         |   2 +-
> >  drivers/media/i2c/ov7740.c                         |   7 +-
> >  drivers/media/i2c/ov8856.c                         |   9 +-
> >  drivers/media/i2c/ov8858.c                         |   6 +-
> >  drivers/media/i2c/ov8865.c                         |   8 +-
> >  drivers/media/i2c/ov9282.c                         |  14 +-
> >  drivers/media/i2c/ov9640.c                         |   2 +-
> >  drivers/media/i2c/ov9650.c                         |   7 +-
> >  drivers/media/i2c/ov9734.c                         |   9 +-
> >  drivers/media/i2c/rj54n1cb0c.c                     |   2 +-
> >  drivers/media/i2c/s5c73m3/s5c73m3-core.c           |  37 ++--
> >  drivers/media/i2c/s5k5baf.c                        |  35 ++--
> >  drivers/media/i2c/s5k6a3.c                         |   8 +-
> >  drivers/media/i2c/saa6752hs.c                      |   2 +-
> >  drivers/media/i2c/st-mipid02.c                     |  11 +-
> >  drivers/media/i2c/st-vgxy61.c                      |   5 +-
> >  drivers/media/i2c/tc358746.c                       |  12 +-
> >  drivers/media/i2c/tda1997x.c                       |   6 +-
> >  drivers/media/i2c/tvp5150.c                        |   2 +-
> >  drivers/media/i2c/tvp7002.c                        |   6 +-
> >  drivers/media/i2c/tw9910.c                         |   2 +-
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  24 +--
> >  drivers/media/pci/intel/ivsc/mei_csi.c             |   4 +-
> >  drivers/media/platform/atmel/atmel-isi.c           |  12 +-
> >  drivers/media/platform/cadence/cdns-csi2rx.c       |   4 +-
> >  drivers/media/platform/cadence/cdns-csi2tx.c       |   3 +-
> >  .../media/platform/microchip/microchip-csi2dc.c    |  15 +-
> >  .../media/platform/microchip/microchip-isc-base.c  |  10 +-
> >  .../platform/microchip/microchip-isc-scaler.c      |  16 +-
> >  drivers/media/platform/nxp/imx-mipi-csis.c         |  10 +-
> >  drivers/media/platform/nxp/imx7-media-csi.c        |  16 +-
> >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  10 +-
> >  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  18 +-
> >  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |   2 +-
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |  13 +-
> >  drivers/media/platform/qcom/camss/camss-csid.c     |  15 +-
> >  drivers/media/platform/qcom/camss/camss-csiphy.c   |  15 +-
> >  drivers/media/platform/qcom/camss/camss-ispif.c    |  15 +-
> >  drivers/media/platform/qcom/camss/camss-vfe.c      |  34 ++--
> >  drivers/media/platform/renesas/rcar-isp.c          |   4 +-
> >  .../media/platform/renesas/rcar-vin/rcar-csi2.c    |   4 +-
> >  .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |   6 +-
> >  .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |   6 +-
> >  drivers/media/platform/renesas/vsp1/vsp1_brx.c     |   2 +-
> >  drivers/media/platform/renesas/vsp1/vsp1_entity.c  |   8 +-
> >  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |   3 +-
> >  .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |  16 +-
> >  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 103 +++++-----
> >  .../platform/rockchip/rkisp1/rkisp1-resizer.c      |  53 ++---
> >  .../platform/samsung/exynos4-is/fimc-capture.c     |  12 +-
> >  .../media/platform/samsung/exynos4-is/fimc-isp.c   |  24 +--
> >  .../media/platform/samsung/exynos4-is/fimc-lite.c  |  16 +-
> >  .../media/platform/samsung/exynos4-is/mipi-csis.c  |   3 +-
> >  .../platform/samsung/s3c-camif/camif-capture.c     |   8 +-
> >  .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |   8 +-
> >  .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c    |   8 +-
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |   8 +-
> >  .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |   8 +-
> >  drivers/media/platform/ti/cal/cal-camerarx.c       |  18 +-
> >  drivers/media/platform/ti/cal/cal-video.c          |   2 +-
> >  drivers/media/platform/ti/omap3isp/ispccdc.c       |  19 +-
> >  drivers/media/platform/ti/omap3isp/ispccp2.c       |  13 +-
> >  drivers/media/platform/ti/omap3isp/ispcsi2.c       |   9 +-
> >  drivers/media/platform/ti/omap3isp/isppreview.c    |  18 +-
> >  drivers/media/platform/ti/omap3isp/ispresizer.c    |  21 +-
> >  drivers/media/platform/video-mux.c                 |  18 +-
> >  drivers/media/platform/xilinx/xilinx-csi2rxss.c    |  64 +-----
> >  drivers/media/platform/xilinx/xilinx-tpg.c         |   9 +-
> >  drivers/media/platform/xilinx/xilinx-vip.c         |   4 +-
> >  drivers/media/test-drivers/vimc/vimc-debayer.c     |  10 +-
> >  drivers/media/test-drivers/vimc/vimc-scaler.c      |   9 +-
> >  drivers/media/test-drivers/vimc/vimc-sensor.c      |   6 +-
> >  drivers/media/v4l2-core/v4l2-subdev.c              | 181 ++++++++++-------
> >  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |   2 +-
> >  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |   2 +-
> >  .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |   2 +-
> >  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |   2 +-
> >  drivers/staging/media/atomisp/pci/atomisp_csi2.c   |   3 +-
> >  drivers/staging/media/atomisp/pci/atomisp_subdev.c |   6 +-
> >  drivers/staging/media/atomisp/pci/atomisp_tpg.c    |   2 +-
> >  .../media/deprecated/atmel/atmel-isc-base.c        |  10 +-
> >  drivers/staging/media/imx/imx-ic-prp.c             |   4 +-
> >  drivers/staging/media/imx/imx-ic-prpencvf.c        |   4 +-
> >  drivers/staging/media/imx/imx-media-csi.c          |   8 +-
> >  drivers/staging/media/imx/imx-media-utils.c        |   2 +-
> >  drivers/staging/media/imx/imx-media-vdic.c         |   2 +-
> >  drivers/staging/media/imx/imx6-mipi-csi2.c         |   2 +-
> >  drivers/staging/media/ipu3/ipu3-v4l2.c             |  14 +-
> >  drivers/staging/media/omap4iss/iss_csi2.c          |   9 +-
> >  drivers/staging/media/omap4iss/iss_ipipe.c         |  11 +-
> >  drivers/staging/media/omap4iss/iss_ipipeif.c       |  11 +-
> >  drivers/staging/media/omap4iss/iss_resizer.c       |  11 +-
> >  drivers/staging/media/starfive/camss/stf-isp.c     |  25 ++-
> >  .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c |   8 +-
> >  drivers/staging/media/tegra-video/vi.c             |  14 +-
> >  include/media/v4l2-subdev.h                        | 225 ++++++++-------------
> >  161 files changed, 941 insertions(+), 1112 deletions(-)

-- 
Regards,

Laurent Pinchart

